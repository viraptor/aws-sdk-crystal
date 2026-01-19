module AwsSdk
  module SSM
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

      # Adds or overwrites one or more tags for the specified resource. Tags are metadata that you can
      # assign to your automations, documents, managed nodes, maintenance windows, Parameter Store
      # parameters, and patch baselines. Tags enable you to categorize your resources in different ways, for
      # example, by purpose, owner, or environment. Each tag consists of a key and an optional value, both
      # of which you define. For example, you could define a set of tags for your account's managed nodes
      # that helps you track each node's owner and stack level. For example: Key=Owner,Value=DbAdmin
      # Key=Owner,Value=SysAdmin Key=Owner,Value=Dev Key=Stack,Value=Production
      # Key=Stack,Value=Pre-Production Key=Stack,Value=Test Most resources can have a maximum of 50 tags.
      # Automations can have a maximum of 5 tags. We recommend that you devise a set of tag keys that meets
      # your needs for each resource type. Using a consistent set of tag keys makes it easier for you to
      # manage your resources. You can search and filter the resources based on the tags you add. Tags don't
      # have any semantic meaning to and are interpreted strictly as a string of characters. For more
      # information about using tags with Amazon Elastic Compute Cloud (Amazon EC2) instances, see Tag your
      # Amazon EC2 resources in the Amazon EC2 User Guide .
      def add_tags_to_resource(
        resource_id : String,
        resource_type : String,
        tags : Array(Types::Tag)
      ) : Types::AddTagsToResourceResult
        input = Types::AddTagsToResourceRequest.new(resource_id: resource_id, resource_type: resource_type, tags: tags)
        add_tags_to_resource(input)
      end
      def add_tags_to_resource(input : Types::AddTagsToResourceRequest) : Types::AddTagsToResourceResult
        request = Protocol::JsonRpc.build_request(Model::ADD_TAGS_TO_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddTagsToResourceResult, "AddTagsToResource")
      end

      # Associates a related item to a Systems Manager OpsCenter OpsItem. For example, you can associate an
      # Incident Manager incident or analysis with an OpsItem. Incident Manager and OpsCenter are tools in
      # Amazon Web Services Systems Manager.
      def associate_ops_item_related_item(
        association_type : String,
        ops_item_id : String,
        resource_type : String,
        resource_uri : String
      ) : Types::AssociateOpsItemRelatedItemResponse
        input = Types::AssociateOpsItemRelatedItemRequest.new(association_type: association_type, ops_item_id: ops_item_id, resource_type: resource_type, resource_uri: resource_uri)
        associate_ops_item_related_item(input)
      end
      def associate_ops_item_related_item(input : Types::AssociateOpsItemRelatedItemRequest) : Types::AssociateOpsItemRelatedItemResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_OPS_ITEM_RELATED_ITEM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateOpsItemRelatedItemResponse, "AssociateOpsItemRelatedItem")
      end

      # Attempts to cancel the command specified by the Command ID. There is no guarantee that the command
      # will be terminated and the underlying process stopped.
      def cancel_command(
        command_id : String,
        instance_ids : Array(String)? = nil
      ) : Types::CancelCommandResult
        input = Types::CancelCommandRequest.new(command_id: command_id, instance_ids: instance_ids)
        cancel_command(input)
      end
      def cancel_command(input : Types::CancelCommandRequest) : Types::CancelCommandResult
        request = Protocol::JsonRpc.build_request(Model::CANCEL_COMMAND, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelCommandResult, "CancelCommand")
      end

      # Stops a maintenance window execution that is already in progress and cancels any tasks in the window
      # that haven't already starting running. Tasks already in progress will continue to completion.
      def cancel_maintenance_window_execution(
        window_execution_id : String
      ) : Types::CancelMaintenanceWindowExecutionResult
        input = Types::CancelMaintenanceWindowExecutionRequest.new(window_execution_id: window_execution_id)
        cancel_maintenance_window_execution(input)
      end
      def cancel_maintenance_window_execution(input : Types::CancelMaintenanceWindowExecutionRequest) : Types::CancelMaintenanceWindowExecutionResult
        request = Protocol::JsonRpc.build_request(Model::CANCEL_MAINTENANCE_WINDOW_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CancelMaintenanceWindowExecutionResult, "CancelMaintenanceWindowExecution")
      end

      # Generates an activation code and activation ID you can use to register your on-premises servers,
      # edge devices, or virtual machine (VM) with Amazon Web Services Systems Manager. Registering these
      # machines with Systems Manager makes it possible to manage them using Systems Manager tools. You use
      # the activation code and ID when installing SSM Agent on machines in your hybrid environment. For
      # more information about requirements for managing on-premises machines using Systems Manager, see
      # Using Amazon Web Services Systems Manager in hybrid and multicloud environments in the Amazon Web
      # Services Systems Manager User Guide . Amazon Elastic Compute Cloud (Amazon EC2) instances, edge
      # devices, and on-premises servers and VMs that are configured for Systems Manager are all called
      # managed nodes .
      def create_activation(
        iam_role : String,
        default_instance_name : String? = nil,
        description : String? = nil,
        expiration_date : Time? = nil,
        registration_limit : Int32? = nil,
        registration_metadata : Array(Types::RegistrationMetadataItem)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateActivationResult
        input = Types::CreateActivationRequest.new(iam_role: iam_role, default_instance_name: default_instance_name, description: description, expiration_date: expiration_date, registration_limit: registration_limit, registration_metadata: registration_metadata, tags: tags)
        create_activation(input)
      end
      def create_activation(input : Types::CreateActivationRequest) : Types::CreateActivationResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_ACTIVATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateActivationResult, "CreateActivation")
      end

      # A State Manager association defines the state that you want to maintain on your managed nodes. For
      # example, an association can specify that anti-virus software must be installed and running on your
      # managed nodes, or that certain ports must be closed. For static targets, the association specifies a
      # schedule for when the configuration is reapplied. For dynamic targets, such as an Amazon Web
      # Services resource group or an Amazon Web Services autoscaling group, State Manager, a tool in Amazon
      # Web Services Systems Manager applies the configuration when new managed nodes are added to the
      # group. The association also specifies actions to take when applying the configuration. For example,
      # an association for anti-virus software might run once a day. If the software isn't installed, then
      # State Manager installs it. If the software is installed, but the service isn't running, then the
      # association might instruct State Manager to start the service.
      def create_association(
        name : String,
        alarm_configuration : Types::AlarmConfiguration? = nil,
        apply_only_at_cron_interval : Bool? = nil,
        association_name : String? = nil,
        automation_target_parameter_name : String? = nil,
        calendar_names : Array(String)? = nil,
        compliance_severity : String? = nil,
        document_version : String? = nil,
        duration : Int32? = nil,
        instance_id : String? = nil,
        max_concurrency : String? = nil,
        max_errors : String? = nil,
        output_location : Types::InstanceAssociationOutputLocation? = nil,
        parameters : Hash(String, Array(String))? = nil,
        schedule_expression : String? = nil,
        schedule_offset : Int32? = nil,
        sync_compliance : String? = nil,
        tags : Array(Types::Tag)? = nil,
        target_locations : Array(Types::TargetLocation)? = nil,
        target_maps : Array(Hash(String, Array(String)))? = nil,
        targets : Array(Types::Target)? = nil
      ) : Types::CreateAssociationResult
        input = Types::CreateAssociationRequest.new(name: name, alarm_configuration: alarm_configuration, apply_only_at_cron_interval: apply_only_at_cron_interval, association_name: association_name, automation_target_parameter_name: automation_target_parameter_name, calendar_names: calendar_names, compliance_severity: compliance_severity, document_version: document_version, duration: duration, instance_id: instance_id, max_concurrency: max_concurrency, max_errors: max_errors, output_location: output_location, parameters: parameters, schedule_expression: schedule_expression, schedule_offset: schedule_offset, sync_compliance: sync_compliance, tags: tags, target_locations: target_locations, target_maps: target_maps, targets: targets)
        create_association(input)
      end
      def create_association(input : Types::CreateAssociationRequest) : Types::CreateAssociationResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAssociationResult, "CreateAssociation")
      end

      # Associates the specified Amazon Web Services Systems Manager document (SSM document) with the
      # specified managed nodes or targets. When you associate a document with one or more managed nodes
      # using IDs or tags, Amazon Web Services Systems Manager Agent (SSM Agent) running on the managed node
      # processes the document and configures the node as specified. If you associate a document with a
      # managed node that already has an associated document, the system returns the
      # AssociationAlreadyExists exception.
      def create_association_batch(
        entries : Array(Types::CreateAssociationBatchRequestEntry)
      ) : Types::CreateAssociationBatchResult
        input = Types::CreateAssociationBatchRequest.new(entries: entries)
        create_association_batch(input)
      end
      def create_association_batch(input : Types::CreateAssociationBatchRequest) : Types::CreateAssociationBatchResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_ASSOCIATION_BATCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAssociationBatchResult, "CreateAssociationBatch")
      end

      # Creates a Amazon Web Services Systems Manager (SSM document). An SSM document defines the actions
      # that Systems Manager performs on your managed nodes. For more information about SSM documents,
      # including information about supported schemas, features, and syntax, see Amazon Web Services Systems
      # Manager Documents in the Amazon Web Services Systems Manager User Guide .
      def create_document(
        content : String,
        name : String,
        attachments : Array(Types::AttachmentsSource)? = nil,
        display_name : String? = nil,
        document_format : String? = nil,
        document_type : String? = nil,
        requires : Array(Types::DocumentRequires)? = nil,
        tags : Array(Types::Tag)? = nil,
        target_type : String? = nil,
        version_name : String? = nil
      ) : Types::CreateDocumentResult
        input = Types::CreateDocumentRequest.new(content: content, name: name, attachments: attachments, display_name: display_name, document_format: document_format, document_type: document_type, requires: requires, tags: tags, target_type: target_type, version_name: version_name)
        create_document(input)
      end
      def create_document(input : Types::CreateDocumentRequest) : Types::CreateDocumentResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_DOCUMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDocumentResult, "CreateDocument")
      end

      # Creates a new maintenance window. The value you specify for Duration determines the specific end
      # time for the maintenance window based on the time it begins. No maintenance window tasks are
      # permitted to start after the resulting endtime minus the number of hours you specify for Cutoff .
      # For example, if the maintenance window starts at 3 PM, the duration is three hours, and the value
      # you specify for Cutoff is one hour, no maintenance window tasks can start after 5 PM.
      def create_maintenance_window(
        allow_unassociated_targets : Bool,
        cutoff : Int32,
        duration : Int32,
        name : String,
        schedule : String,
        client_token : String? = nil,
        description : String? = nil,
        end_date : String? = nil,
        schedule_offset : Int32? = nil,
        schedule_timezone : String? = nil,
        start_date : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateMaintenanceWindowResult
        input = Types::CreateMaintenanceWindowRequest.new(allow_unassociated_targets: allow_unassociated_targets, cutoff: cutoff, duration: duration, name: name, schedule: schedule, client_token: client_token, description: description, end_date: end_date, schedule_offset: schedule_offset, schedule_timezone: schedule_timezone, start_date: start_date, tags: tags)
        create_maintenance_window(input)
      end
      def create_maintenance_window(input : Types::CreateMaintenanceWindowRequest) : Types::CreateMaintenanceWindowResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_MAINTENANCE_WINDOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateMaintenanceWindowResult, "CreateMaintenanceWindow")
      end

      # Creates a new OpsItem. You must have permission in Identity and Access Management (IAM) to create a
      # new OpsItem. For more information, see Set up OpsCenter in the Amazon Web Services Systems Manager
      # User Guide . Operations engineers and IT professionals use Amazon Web Services Systems Manager
      # OpsCenter to view, investigate, and remediate operational issues impacting the performance and
      # health of their Amazon Web Services resources. For more information, see Amazon Web Services Systems
      # Manager OpsCenter in the Amazon Web Services Systems Manager User Guide .
      def create_ops_item(
        description : String,
        source : String,
        title : String,
        account_id : String? = nil,
        actual_end_time : Time? = nil,
        actual_start_time : Time? = nil,
        category : String? = nil,
        notifications : Array(Types::OpsItemNotification)? = nil,
        operational_data : Hash(String, Types::OpsItemDataValue)? = nil,
        ops_item_type : String? = nil,
        planned_end_time : Time? = nil,
        planned_start_time : Time? = nil,
        priority : Int32? = nil,
        related_ops_items : Array(Types::RelatedOpsItem)? = nil,
        severity : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateOpsItemResponse
        input = Types::CreateOpsItemRequest.new(description: description, source: source, title: title, account_id: account_id, actual_end_time: actual_end_time, actual_start_time: actual_start_time, category: category, notifications: notifications, operational_data: operational_data, ops_item_type: ops_item_type, planned_end_time: planned_end_time, planned_start_time: planned_start_time, priority: priority, related_ops_items: related_ops_items, severity: severity, tags: tags)
        create_ops_item(input)
      end
      def create_ops_item(input : Types::CreateOpsItemRequest) : Types::CreateOpsItemResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_OPS_ITEM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateOpsItemResponse, "CreateOpsItem")
      end

      # If you create a new application in Application Manager, Amazon Web Services Systems Manager calls
      # this API operation to specify information about the new application, including the application type.
      def create_ops_metadata(
        resource_id : String,
        metadata : Hash(String, Types::MetadataValue)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateOpsMetadataResult
        input = Types::CreateOpsMetadataRequest.new(resource_id: resource_id, metadata: metadata, tags: tags)
        create_ops_metadata(input)
      end
      def create_ops_metadata(input : Types::CreateOpsMetadataRequest) : Types::CreateOpsMetadataResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_OPS_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateOpsMetadataResult, "CreateOpsMetadata")
      end

      # Creates a patch baseline. For information about valid key-value pairs in PatchFilters for each
      # supported operating system type, see PatchFilter .
      def create_patch_baseline(
        name : String,
        approval_rules : Types::PatchRuleGroup? = nil,
        approved_patches : Array(String)? = nil,
        approved_patches_compliance_level : String? = nil,
        approved_patches_enable_non_security : Bool? = nil,
        available_security_updates_compliance_status : String? = nil,
        client_token : String? = nil,
        description : String? = nil,
        global_filters : Types::PatchFilterGroup? = nil,
        operating_system : String? = nil,
        rejected_patches : Array(String)? = nil,
        rejected_patches_action : String? = nil,
        sources : Array(Types::PatchSource)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreatePatchBaselineResult
        input = Types::CreatePatchBaselineRequest.new(name: name, approval_rules: approval_rules, approved_patches: approved_patches, approved_patches_compliance_level: approved_patches_compliance_level, approved_patches_enable_non_security: approved_patches_enable_non_security, available_security_updates_compliance_status: available_security_updates_compliance_status, client_token: client_token, description: description, global_filters: global_filters, operating_system: operating_system, rejected_patches: rejected_patches, rejected_patches_action: rejected_patches_action, sources: sources, tags: tags)
        create_patch_baseline(input)
      end
      def create_patch_baseline(input : Types::CreatePatchBaselineRequest) : Types::CreatePatchBaselineResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_PATCH_BASELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePatchBaselineResult, "CreatePatchBaseline")
      end

      # A resource data sync helps you view data from multiple sources in a single location. Amazon Web
      # Services Systems Manager offers two types of resource data sync: SyncToDestination and
      # SyncFromSource . You can configure Systems Manager Inventory to use the SyncToDestination type to
      # synchronize Inventory data from multiple Amazon Web Services Regions to a single Amazon Simple
      # Storage Service (Amazon S3) bucket. For more information, see Creating a resource data sync for
      # Inventory in the Amazon Web Services Systems Manager User Guide . You can configure Systems Manager
      # Explorer to use the SyncFromSource type to synchronize operational work items (OpsItems) and
      # operational data (OpsData) from multiple Amazon Web Services Regions to a single Amazon S3 bucket.
      # This type can synchronize OpsItems and OpsData from multiple Amazon Web Services accounts and Amazon
      # Web Services Regions or EntireOrganization by using Organizations. For more information, see Setting
      # up Systems Manager Explorer to display data from multiple accounts and Regions in the Amazon Web
      # Services Systems Manager User Guide . A resource data sync is an asynchronous operation that returns
      # immediately. After a successful initial sync is completed, the system continuously syncs data. To
      # check the status of a sync, use the ListResourceDataSync . By default, data isn't encrypted in
      # Amazon S3. We strongly recommend that you enable encryption in Amazon S3 to ensure secure data
      # storage. We also recommend that you secure access to the Amazon S3 bucket by creating a restrictive
      # bucket policy.
      def create_resource_data_sync(
        sync_name : String,
        s3_destination : Types::ResourceDataSyncS3Destination? = nil,
        sync_source : Types::ResourceDataSyncSource? = nil,
        sync_type : String? = nil
      ) : Types::CreateResourceDataSyncResult
        input = Types::CreateResourceDataSyncRequest.new(sync_name: sync_name, s3_destination: s3_destination, sync_source: sync_source, sync_type: sync_type)
        create_resource_data_sync(input)
      end
      def create_resource_data_sync(input : Types::CreateResourceDataSyncRequest) : Types::CreateResourceDataSyncResult
        request = Protocol::JsonRpc.build_request(Model::CREATE_RESOURCE_DATA_SYNC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateResourceDataSyncResult, "CreateResourceDataSync")
      end

      # Deletes an activation. You aren't required to delete an activation. If you delete an activation, you
      # can no longer use it to register additional managed nodes. Deleting an activation doesn't
      # de-register managed nodes. You must manually de-register managed nodes.
      def delete_activation(
        activation_id : String
      ) : Types::DeleteActivationResult
        input = Types::DeleteActivationRequest.new(activation_id: activation_id)
        delete_activation(input)
      end
      def delete_activation(input : Types::DeleteActivationRequest) : Types::DeleteActivationResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_ACTIVATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteActivationResult, "DeleteActivation")
      end

      # Disassociates the specified Amazon Web Services Systems Manager document (SSM document) from the
      # specified managed node. If you created the association by using the Targets parameter, then you must
      # delete the association by using the association ID. When you disassociate a document from a managed
      # node, it doesn't change the configuration of the node. To change the configuration state of a
      # managed node after you disassociate a document, you must create a new document with the desired
      # configuration and associate it with the node.
      def delete_association(
        association_id : String? = nil,
        instance_id : String? = nil,
        name : String? = nil
      ) : Types::DeleteAssociationResult
        input = Types::DeleteAssociationRequest.new(association_id: association_id, instance_id: instance_id, name: name)
        delete_association(input)
      end
      def delete_association(input : Types::DeleteAssociationRequest) : Types::DeleteAssociationResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAssociationResult, "DeleteAssociation")
      end

      # Deletes the Amazon Web Services Systems Manager document (SSM document) and all managed node
      # associations to the document. Before you delete the document, we recommend that you use
      # DeleteAssociation to disassociate all managed nodes that are associated with the document.
      def delete_document(
        name : String,
        document_version : String? = nil,
        force : Bool? = nil,
        version_name : String? = nil
      ) : Types::DeleteDocumentResult
        input = Types::DeleteDocumentRequest.new(name: name, document_version: document_version, force: force, version_name: version_name)
        delete_document(input)
      end
      def delete_document(input : Types::DeleteDocumentRequest) : Types::DeleteDocumentResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_DOCUMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDocumentResult, "DeleteDocument")
      end

      # Delete a custom inventory type or the data associated with a custom Inventory type. Deleting a
      # custom inventory type is also referred to as deleting a custom inventory schema.
      def delete_inventory(
        type_name : String,
        client_token : String? = nil,
        dry_run : Bool? = nil,
        schema_delete_option : String? = nil
      ) : Types::DeleteInventoryResult
        input = Types::DeleteInventoryRequest.new(type_name: type_name, client_token: client_token, dry_run: dry_run, schema_delete_option: schema_delete_option)
        delete_inventory(input)
      end
      def delete_inventory(input : Types::DeleteInventoryRequest) : Types::DeleteInventoryResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_INVENTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteInventoryResult, "DeleteInventory")
      end

      # Deletes a maintenance window.
      def delete_maintenance_window(
        window_id : String
      ) : Types::DeleteMaintenanceWindowResult
        input = Types::DeleteMaintenanceWindowRequest.new(window_id: window_id)
        delete_maintenance_window(input)
      end
      def delete_maintenance_window(input : Types::DeleteMaintenanceWindowRequest) : Types::DeleteMaintenanceWindowResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_MAINTENANCE_WINDOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteMaintenanceWindowResult, "DeleteMaintenanceWindow")
      end

      # Delete an OpsItem. You must have permission in Identity and Access Management (IAM) to delete an
      # OpsItem. Note the following important information about this operation. Deleting an OpsItem is
      # irreversible. You can't restore a deleted OpsItem. This operation uses an eventual consistency model
      # , which means the system can take a few minutes to complete this operation. If you delete an OpsItem
      # and immediately call, for example, GetOpsItem , the deleted OpsItem might still appear in the
      # response. This operation is idempotent. The system doesn't throw an exception if you repeatedly call
      # this operation for the same OpsItem. If the first call is successful, all additional calls return
      # the same successful response as the first call. This operation doesn't support cross-account calls.
      # A delegated administrator or management account can't delete OpsItems in other accounts, even if
      # OpsCenter has been set up for cross-account administration. For more information about cross-account
      # administration, see Setting up OpsCenter to centrally manage OpsItems across accounts in the Systems
      # Manager User Guide .
      def delete_ops_item(
        ops_item_id : String
      ) : Types::DeleteOpsItemResponse
        input = Types::DeleteOpsItemRequest.new(ops_item_id: ops_item_id)
        delete_ops_item(input)
      end
      def delete_ops_item(input : Types::DeleteOpsItemRequest) : Types::DeleteOpsItemResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_OPS_ITEM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteOpsItemResponse, "DeleteOpsItem")
      end

      # Delete OpsMetadata related to an application.
      def delete_ops_metadata(
        ops_metadata_arn : String
      ) : Types::DeleteOpsMetadataResult
        input = Types::DeleteOpsMetadataRequest.new(ops_metadata_arn: ops_metadata_arn)
        delete_ops_metadata(input)
      end
      def delete_ops_metadata(input : Types::DeleteOpsMetadataRequest) : Types::DeleteOpsMetadataResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_OPS_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteOpsMetadataResult, "DeleteOpsMetadata")
      end

      # Delete a parameter from the system. After deleting a parameter, wait for at least 30 seconds to
      # create a parameter with the same name.
      def delete_parameter(
        name : String
      ) : Types::DeleteParameterResult
        input = Types::DeleteParameterRequest.new(name: name)
        delete_parameter(input)
      end
      def delete_parameter(input : Types::DeleteParameterRequest) : Types::DeleteParameterResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_PARAMETER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteParameterResult, "DeleteParameter")
      end

      # Delete a list of parameters. After deleting a parameter, wait for at least 30 seconds to create a
      # parameter with the same name.
      def delete_parameters(
        names : Array(String)
      ) : Types::DeleteParametersResult
        input = Types::DeleteParametersRequest.new(names: names)
        delete_parameters(input)
      end
      def delete_parameters(input : Types::DeleteParametersRequest) : Types::DeleteParametersResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteParametersResult, "DeleteParameters")
      end

      # Deletes a patch baseline.
      def delete_patch_baseline(
        baseline_id : String
      ) : Types::DeletePatchBaselineResult
        input = Types::DeletePatchBaselineRequest.new(baseline_id: baseline_id)
        delete_patch_baseline(input)
      end
      def delete_patch_baseline(input : Types::DeletePatchBaselineRequest) : Types::DeletePatchBaselineResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_PATCH_BASELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePatchBaselineResult, "DeletePatchBaseline")
      end

      # Deletes a resource data sync configuration. After the configuration is deleted, changes to data on
      # managed nodes are no longer synced to or from the target. Deleting a sync configuration doesn't
      # delete data.
      def delete_resource_data_sync(
        sync_name : String,
        sync_type : String? = nil
      ) : Types::DeleteResourceDataSyncResult
        input = Types::DeleteResourceDataSyncRequest.new(sync_name: sync_name, sync_type: sync_type)
        delete_resource_data_sync(input)
      end
      def delete_resource_data_sync(input : Types::DeleteResourceDataSyncRequest) : Types::DeleteResourceDataSyncResult
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE_DATA_SYNC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteResourceDataSyncResult, "DeleteResourceDataSync")
      end

      # Deletes a Systems Manager resource policy. A resource policy helps you to define the IAM entity (for
      # example, an Amazon Web Services account) that can manage your Systems Manager resources. The
      # following resources support Systems Manager resource policies. OpsItemGroup - The resource policy
      # for OpsItemGroup enables Amazon Web Services accounts to view and interact with OpsCenter
      # operational work items (OpsItems). Parameter - The resource policy is used to share a parameter with
      # other accounts using Resource Access Manager (RAM). For more information about cross-account sharing
      # of parameters, see Working with shared parameters in the Amazon Web Services Systems Manager User
      # Guide .
      def delete_resource_policy(
        policy_hash : String,
        policy_id : String,
        resource_arn : String
      ) : Types::DeleteResourcePolicyResponse
        input = Types::DeleteResourcePolicyRequest.new(policy_hash: policy_hash, policy_id: policy_id, resource_arn: resource_arn)
        delete_resource_policy(input)
      end
      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Types::DeleteResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteResourcePolicyResponse, "DeleteResourcePolicy")
      end

      # Removes the server or virtual machine from the list of registered servers. If you want to reregister
      # an on-premises server, edge device, or VM, you must use a different Activation Code and Activation
      # ID than used to register the machine previously. The Activation Code and Activation ID must not have
      # already been used on the maximum number of activations specified when they were created. For more
      # information, see Deregistering managed nodes in a hybrid and multicloud environment in the Amazon
      # Web Services Systems Manager User Guide .
      def deregister_managed_instance(
        instance_id : String
      ) : Types::DeregisterManagedInstanceResult
        input = Types::DeregisterManagedInstanceRequest.new(instance_id: instance_id)
        deregister_managed_instance(input)
      end
      def deregister_managed_instance(input : Types::DeregisterManagedInstanceRequest) : Types::DeregisterManagedInstanceResult
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_MANAGED_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeregisterManagedInstanceResult, "DeregisterManagedInstance")
      end

      # Removes a patch group from a patch baseline.
      def deregister_patch_baseline_for_patch_group(
        baseline_id : String,
        patch_group : String
      ) : Types::DeregisterPatchBaselineForPatchGroupResult
        input = Types::DeregisterPatchBaselineForPatchGroupRequest.new(baseline_id: baseline_id, patch_group: patch_group)
        deregister_patch_baseline_for_patch_group(input)
      end
      def deregister_patch_baseline_for_patch_group(input : Types::DeregisterPatchBaselineForPatchGroupRequest) : Types::DeregisterPatchBaselineForPatchGroupResult
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_PATCH_BASELINE_FOR_PATCH_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeregisterPatchBaselineForPatchGroupResult, "DeregisterPatchBaselineForPatchGroup")
      end

      # Removes a target from a maintenance window.
      def deregister_target_from_maintenance_window(
        window_id : String,
        window_target_id : String,
        safe : Bool? = nil
      ) : Types::DeregisterTargetFromMaintenanceWindowResult
        input = Types::DeregisterTargetFromMaintenanceWindowRequest.new(window_id: window_id, window_target_id: window_target_id, safe: safe)
        deregister_target_from_maintenance_window(input)
      end
      def deregister_target_from_maintenance_window(input : Types::DeregisterTargetFromMaintenanceWindowRequest) : Types::DeregisterTargetFromMaintenanceWindowResult
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_TARGET_FROM_MAINTENANCE_WINDOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeregisterTargetFromMaintenanceWindowResult, "DeregisterTargetFromMaintenanceWindow")
      end

      # Removes a task from a maintenance window.
      def deregister_task_from_maintenance_window(
        window_id : String,
        window_task_id : String
      ) : Types::DeregisterTaskFromMaintenanceWindowResult
        input = Types::DeregisterTaskFromMaintenanceWindowRequest.new(window_id: window_id, window_task_id: window_task_id)
        deregister_task_from_maintenance_window(input)
      end
      def deregister_task_from_maintenance_window(input : Types::DeregisterTaskFromMaintenanceWindowRequest) : Types::DeregisterTaskFromMaintenanceWindowResult
        request = Protocol::JsonRpc.build_request(Model::DEREGISTER_TASK_FROM_MAINTENANCE_WINDOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeregisterTaskFromMaintenanceWindowResult, "DeregisterTaskFromMaintenanceWindow")
      end

      # Describes details about the activation, such as the date and time the activation was created, its
      # expiration date, the Identity and Access Management (IAM) role assigned to the managed nodes in the
      # activation, and the number of nodes registered by using this activation.
      def describe_activations(
        filters : Array(Types::DescribeActivationsFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeActivationsResult
        input = Types::DescribeActivationsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        describe_activations(input)
      end
      def describe_activations(input : Types::DescribeActivationsRequest) : Types::DescribeActivationsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ACTIVATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeActivationsResult, "DescribeActivations")
      end

      # Describes the association for the specified target or managed node. If you created the association
      # by using the Targets parameter, then you must retrieve the association by using the association ID.
      def describe_association(
        association_id : String? = nil,
        association_version : String? = nil,
        instance_id : String? = nil,
        name : String? = nil
      ) : Types::DescribeAssociationResult
        input = Types::DescribeAssociationRequest.new(association_id: association_id, association_version: association_version, instance_id: instance_id, name: name)
        describe_association(input)
      end
      def describe_association(input : Types::DescribeAssociationRequest) : Types::DescribeAssociationResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAssociationResult, "DescribeAssociation")
      end

      # Views information about a specific execution of a specific association.
      def describe_association_execution_targets(
        association_id : String,
        execution_id : String,
        filters : Array(Types::AssociationExecutionTargetsFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeAssociationExecutionTargetsResult
        input = Types::DescribeAssociationExecutionTargetsRequest.new(association_id: association_id, execution_id: execution_id, filters: filters, max_results: max_results, next_token: next_token)
        describe_association_execution_targets(input)
      end
      def describe_association_execution_targets(input : Types::DescribeAssociationExecutionTargetsRequest) : Types::DescribeAssociationExecutionTargetsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ASSOCIATION_EXECUTION_TARGETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAssociationExecutionTargetsResult, "DescribeAssociationExecutionTargets")
      end

      # Views all executions for a specific association ID.
      def describe_association_executions(
        association_id : String,
        filters : Array(Types::AssociationExecutionFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeAssociationExecutionsResult
        input = Types::DescribeAssociationExecutionsRequest.new(association_id: association_id, filters: filters, max_results: max_results, next_token: next_token)
        describe_association_executions(input)
      end
      def describe_association_executions(input : Types::DescribeAssociationExecutionsRequest) : Types::DescribeAssociationExecutionsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ASSOCIATION_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAssociationExecutionsResult, "DescribeAssociationExecutions")
      end

      # Provides details about all active and terminated Automation executions.
      def describe_automation_executions(
        filters : Array(Types::AutomationExecutionFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeAutomationExecutionsResult
        input = Types::DescribeAutomationExecutionsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        describe_automation_executions(input)
      end
      def describe_automation_executions(input : Types::DescribeAutomationExecutionsRequest) : Types::DescribeAutomationExecutionsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AUTOMATION_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAutomationExecutionsResult, "DescribeAutomationExecutions")
      end

      # Information about all active and terminated step executions in an Automation workflow.
      def describe_automation_step_executions(
        automation_execution_id : String,
        filters : Array(Types::StepExecutionFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        reverse_order : Bool? = nil
      ) : Types::DescribeAutomationStepExecutionsResult
        input = Types::DescribeAutomationStepExecutionsRequest.new(automation_execution_id: automation_execution_id, filters: filters, max_results: max_results, next_token: next_token, reverse_order: reverse_order)
        describe_automation_step_executions(input)
      end
      def describe_automation_step_executions(input : Types::DescribeAutomationStepExecutionsRequest) : Types::DescribeAutomationStepExecutionsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AUTOMATION_STEP_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAutomationStepExecutionsResult, "DescribeAutomationStepExecutions")
      end

      # Lists all patches eligible to be included in a patch baseline. Currently, DescribeAvailablePatches
      # supports only the Amazon Linux 1, Amazon Linux 2, and Windows Server operating systems.
      def describe_available_patches(
        filters : Array(Types::PatchOrchestratorFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeAvailablePatchesResult
        input = Types::DescribeAvailablePatchesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        describe_available_patches(input)
      end
      def describe_available_patches(input : Types::DescribeAvailablePatchesRequest) : Types::DescribeAvailablePatchesResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AVAILABLE_PATCHES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAvailablePatchesResult, "DescribeAvailablePatches")
      end

      # Describes the specified Amazon Web Services Systems Manager document (SSM document).
      def describe_document(
        name : String,
        document_version : String? = nil,
        version_name : String? = nil
      ) : Types::DescribeDocumentResult
        input = Types::DescribeDocumentRequest.new(name: name, document_version: document_version, version_name: version_name)
        describe_document(input)
      end
      def describe_document(input : Types::DescribeDocumentRequest) : Types::DescribeDocumentResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DOCUMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDocumentResult, "DescribeDocument")
      end

      # Describes the permissions for a Amazon Web Services Systems Manager document (SSM document). If you
      # created the document, you are the owner. If a document is shared, it can either be shared privately
      # (by specifying a user's Amazon Web Services account ID) or publicly ( All ).
      def describe_document_permission(
        name : String,
        permission_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeDocumentPermissionResponse
        input = Types::DescribeDocumentPermissionRequest.new(name: name, permission_type: permission_type, max_results: max_results, next_token: next_token)
        describe_document_permission(input)
      end
      def describe_document_permission(input : Types::DescribeDocumentPermissionRequest) : Types::DescribeDocumentPermissionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DOCUMENT_PERMISSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDocumentPermissionResponse, "DescribeDocumentPermission")
      end

      # All associations for the managed nodes.
      def describe_effective_instance_associations(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeEffectiveInstanceAssociationsResult
        input = Types::DescribeEffectiveInstanceAssociationsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        describe_effective_instance_associations(input)
      end
      def describe_effective_instance_associations(input : Types::DescribeEffectiveInstanceAssociationsRequest) : Types::DescribeEffectiveInstanceAssociationsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EFFECTIVE_INSTANCE_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEffectiveInstanceAssociationsResult, "DescribeEffectiveInstanceAssociations")
      end

      # Retrieves the current effective patches (the patch and the approval state) for the specified patch
      # baseline. Applies to patch baselines for Windows only.
      def describe_effective_patches_for_patch_baseline(
        baseline_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeEffectivePatchesForPatchBaselineResult
        input = Types::DescribeEffectivePatchesForPatchBaselineRequest.new(baseline_id: baseline_id, max_results: max_results, next_token: next_token)
        describe_effective_patches_for_patch_baseline(input)
      end
      def describe_effective_patches_for_patch_baseline(input : Types::DescribeEffectivePatchesForPatchBaselineRequest) : Types::DescribeEffectivePatchesForPatchBaselineResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EFFECTIVE_PATCHES_FOR_PATCH_BASELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEffectivePatchesForPatchBaselineResult, "DescribeEffectivePatchesForPatchBaseline")
      end

      # The status of the associations for the managed nodes.
      def describe_instance_associations_status(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeInstanceAssociationsStatusResult
        input = Types::DescribeInstanceAssociationsStatusRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        describe_instance_associations_status(input)
      end
      def describe_instance_associations_status(input : Types::DescribeInstanceAssociationsStatusRequest) : Types::DescribeInstanceAssociationsStatusResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INSTANCE_ASSOCIATIONS_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeInstanceAssociationsStatusResult, "DescribeInstanceAssociationsStatus")
      end

      # Provides information about one or more of your managed nodes, including the operating system
      # platform, SSM Agent version, association status, and IP address. This operation does not return
      # information for nodes that are either Stopped or Terminated. If you specify one or more node IDs,
      # the operation returns information for those managed nodes. If you don't specify node IDs, it returns
      # information for all your managed nodes. If you specify a node ID that isn't valid or a node that you
      # don't own, you receive an error. The IamRole field returned for this API operation is the role
      # assigned to an Amazon EC2 instance configured with a Systems Manager Quick Setup host management
      # configuration or the role assigned to an on-premises managed node.
      def describe_instance_information(
        filters : Array(Types::InstanceInformationStringFilter)? = nil,
        instance_information_filter_list : Array(Types::InstanceInformationFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeInstanceInformationResult
        input = Types::DescribeInstanceInformationRequest.new(filters: filters, instance_information_filter_list: instance_information_filter_list, max_results: max_results, next_token: next_token)
        describe_instance_information(input)
      end
      def describe_instance_information(input : Types::DescribeInstanceInformationRequest) : Types::DescribeInstanceInformationResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INSTANCE_INFORMATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeInstanceInformationResult, "DescribeInstanceInformation")
      end

      # Retrieves the high-level patch state of one or more managed nodes.
      def describe_instance_patch_states(
        instance_ids : Array(String),
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeInstancePatchStatesResult
        input = Types::DescribeInstancePatchStatesRequest.new(instance_ids: instance_ids, max_results: max_results, next_token: next_token)
        describe_instance_patch_states(input)
      end
      def describe_instance_patch_states(input : Types::DescribeInstancePatchStatesRequest) : Types::DescribeInstancePatchStatesResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INSTANCE_PATCH_STATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeInstancePatchStatesResult, "DescribeInstancePatchStates")
      end

      # Retrieves the high-level patch state for the managed nodes in the specified patch group.
      def describe_instance_patch_states_for_patch_group(
        patch_group : String,
        filters : Array(Types::InstancePatchStateFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeInstancePatchStatesForPatchGroupResult
        input = Types::DescribeInstancePatchStatesForPatchGroupRequest.new(patch_group: patch_group, filters: filters, max_results: max_results, next_token: next_token)
        describe_instance_patch_states_for_patch_group(input)
      end
      def describe_instance_patch_states_for_patch_group(input : Types::DescribeInstancePatchStatesForPatchGroupRequest) : Types::DescribeInstancePatchStatesForPatchGroupResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INSTANCE_PATCH_STATES_FOR_PATCH_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeInstancePatchStatesForPatchGroupResult, "DescribeInstancePatchStatesForPatchGroup")
      end

      # Retrieves information about the patches on the specified managed node and their state relative to
      # the patch baseline being used for the node.
      def describe_instance_patches(
        instance_id : String,
        filters : Array(Types::PatchOrchestratorFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeInstancePatchesResult
        input = Types::DescribeInstancePatchesRequest.new(instance_id: instance_id, filters: filters, max_results: max_results, next_token: next_token)
        describe_instance_patches(input)
      end
      def describe_instance_patches(input : Types::DescribeInstancePatchesRequest) : Types::DescribeInstancePatchesResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INSTANCE_PATCHES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeInstancePatchesResult, "DescribeInstancePatches")
      end

      # An API operation used by the Systems Manager console to display information about Systems Manager
      # managed nodes.
      def describe_instance_properties(
        filters_with_operator : Array(Types::InstancePropertyStringFilter)? = nil,
        instance_property_filter_list : Array(Types::InstancePropertyFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeInstancePropertiesResult
        input = Types::DescribeInstancePropertiesRequest.new(filters_with_operator: filters_with_operator, instance_property_filter_list: instance_property_filter_list, max_results: max_results, next_token: next_token)
        describe_instance_properties(input)
      end
      def describe_instance_properties(input : Types::DescribeInstancePropertiesRequest) : Types::DescribeInstancePropertiesResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INSTANCE_PROPERTIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeInstancePropertiesResult, "DescribeInstanceProperties")
      end

      # Describes a specific delete inventory operation.
      def describe_inventory_deletions(
        deletion_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeInventoryDeletionsResult
        input = Types::DescribeInventoryDeletionsRequest.new(deletion_id: deletion_id, max_results: max_results, next_token: next_token)
        describe_inventory_deletions(input)
      end
      def describe_inventory_deletions(input : Types::DescribeInventoryDeletionsRequest) : Types::DescribeInventoryDeletionsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_INVENTORY_DELETIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeInventoryDeletionsResult, "DescribeInventoryDeletions")
      end

      # Retrieves the individual task executions (one per target) for a particular task run as part of a
      # maintenance window execution.
      def describe_maintenance_window_execution_task_invocations(
        task_id : String,
        window_execution_id : String,
        filters : Array(Types::MaintenanceWindowFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeMaintenanceWindowExecutionTaskInvocationsResult
        input = Types::DescribeMaintenanceWindowExecutionTaskInvocationsRequest.new(task_id: task_id, window_execution_id: window_execution_id, filters: filters, max_results: max_results, next_token: next_token)
        describe_maintenance_window_execution_task_invocations(input)
      end
      def describe_maintenance_window_execution_task_invocations(input : Types::DescribeMaintenanceWindowExecutionTaskInvocationsRequest) : Types::DescribeMaintenanceWindowExecutionTaskInvocationsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MAINTENANCE_WINDOW_EXECUTION_TASK_INVOCATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMaintenanceWindowExecutionTaskInvocationsResult, "DescribeMaintenanceWindowExecutionTaskInvocations")
      end

      # For a given maintenance window execution, lists the tasks that were run.
      def describe_maintenance_window_execution_tasks(
        window_execution_id : String,
        filters : Array(Types::MaintenanceWindowFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeMaintenanceWindowExecutionTasksResult
        input = Types::DescribeMaintenanceWindowExecutionTasksRequest.new(window_execution_id: window_execution_id, filters: filters, max_results: max_results, next_token: next_token)
        describe_maintenance_window_execution_tasks(input)
      end
      def describe_maintenance_window_execution_tasks(input : Types::DescribeMaintenanceWindowExecutionTasksRequest) : Types::DescribeMaintenanceWindowExecutionTasksResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MAINTENANCE_WINDOW_EXECUTION_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMaintenanceWindowExecutionTasksResult, "DescribeMaintenanceWindowExecutionTasks")
      end

      # Lists the executions of a maintenance window. This includes information about when the maintenance
      # window was scheduled to be active, and information about tasks registered and run with the
      # maintenance window.
      def describe_maintenance_window_executions(
        window_id : String,
        filters : Array(Types::MaintenanceWindowFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeMaintenanceWindowExecutionsResult
        input = Types::DescribeMaintenanceWindowExecutionsRequest.new(window_id: window_id, filters: filters, max_results: max_results, next_token: next_token)
        describe_maintenance_window_executions(input)
      end
      def describe_maintenance_window_executions(input : Types::DescribeMaintenanceWindowExecutionsRequest) : Types::DescribeMaintenanceWindowExecutionsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MAINTENANCE_WINDOW_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMaintenanceWindowExecutionsResult, "DescribeMaintenanceWindowExecutions")
      end

      # Retrieves information about upcoming executions of a maintenance window.
      def describe_maintenance_window_schedule(
        filters : Array(Types::PatchOrchestratorFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_type : String? = nil,
        targets : Array(Types::Target)? = nil,
        window_id : String? = nil
      ) : Types::DescribeMaintenanceWindowScheduleResult
        input = Types::DescribeMaintenanceWindowScheduleRequest.new(filters: filters, max_results: max_results, next_token: next_token, resource_type: resource_type, targets: targets, window_id: window_id)
        describe_maintenance_window_schedule(input)
      end
      def describe_maintenance_window_schedule(input : Types::DescribeMaintenanceWindowScheduleRequest) : Types::DescribeMaintenanceWindowScheduleResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MAINTENANCE_WINDOW_SCHEDULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMaintenanceWindowScheduleResult, "DescribeMaintenanceWindowSchedule")
      end

      # Lists the targets registered with the maintenance window.
      def describe_maintenance_window_targets(
        window_id : String,
        filters : Array(Types::MaintenanceWindowFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeMaintenanceWindowTargetsResult
        input = Types::DescribeMaintenanceWindowTargetsRequest.new(window_id: window_id, filters: filters, max_results: max_results, next_token: next_token)
        describe_maintenance_window_targets(input)
      end
      def describe_maintenance_window_targets(input : Types::DescribeMaintenanceWindowTargetsRequest) : Types::DescribeMaintenanceWindowTargetsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MAINTENANCE_WINDOW_TARGETS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMaintenanceWindowTargetsResult, "DescribeMaintenanceWindowTargets")
      end

      # Lists the tasks in a maintenance window. For maintenance window tasks without a specified target,
      # you can't supply values for --max-errors and --max-concurrency . Instead, the system inserts a
      # placeholder value of 1 , which may be reported in the response to this command. These values don't
      # affect the running of your task and can be ignored.
      def describe_maintenance_window_tasks(
        window_id : String,
        filters : Array(Types::MaintenanceWindowFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeMaintenanceWindowTasksResult
        input = Types::DescribeMaintenanceWindowTasksRequest.new(window_id: window_id, filters: filters, max_results: max_results, next_token: next_token)
        describe_maintenance_window_tasks(input)
      end
      def describe_maintenance_window_tasks(input : Types::DescribeMaintenanceWindowTasksRequest) : Types::DescribeMaintenanceWindowTasksResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MAINTENANCE_WINDOW_TASKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMaintenanceWindowTasksResult, "DescribeMaintenanceWindowTasks")
      end

      # Retrieves the maintenance windows in an Amazon Web Services account.
      def describe_maintenance_windows(
        filters : Array(Types::MaintenanceWindowFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeMaintenanceWindowsResult
        input = Types::DescribeMaintenanceWindowsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        describe_maintenance_windows(input)
      end
      def describe_maintenance_windows(input : Types::DescribeMaintenanceWindowsRequest) : Types::DescribeMaintenanceWindowsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MAINTENANCE_WINDOWS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMaintenanceWindowsResult, "DescribeMaintenanceWindows")
      end

      # Retrieves information about the maintenance window targets or tasks that a managed node is
      # associated with.
      def describe_maintenance_windows_for_target(
        resource_type : String,
        targets : Array(Types::Target),
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeMaintenanceWindowsForTargetResult
        input = Types::DescribeMaintenanceWindowsForTargetRequest.new(resource_type: resource_type, targets: targets, max_results: max_results, next_token: next_token)
        describe_maintenance_windows_for_target(input)
      end
      def describe_maintenance_windows_for_target(input : Types::DescribeMaintenanceWindowsForTargetRequest) : Types::DescribeMaintenanceWindowsForTargetResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MAINTENANCE_WINDOWS_FOR_TARGET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMaintenanceWindowsForTargetResult, "DescribeMaintenanceWindowsForTarget")
      end

      # Query a set of OpsItems. You must have permission in Identity and Access Management (IAM) to query a
      # list of OpsItems. For more information, see Set up OpsCenter in the Amazon Web Services Systems
      # Manager User Guide . Operations engineers and IT professionals use Amazon Web Services Systems
      # Manager OpsCenter to view, investigate, and remediate operational issues impacting the performance
      # and health of their Amazon Web Services resources. For more information, see Amazon Web Services
      # Systems Manager OpsCenter in the Amazon Web Services Systems Manager User Guide .
      def describe_ops_items(
        max_results : Int32? = nil,
        next_token : String? = nil,
        ops_item_filters : Array(Types::OpsItemFilter)? = nil
      ) : Types::DescribeOpsItemsResponse
        input = Types::DescribeOpsItemsRequest.new(max_results: max_results, next_token: next_token, ops_item_filters: ops_item_filters)
        describe_ops_items(input)
      end
      def describe_ops_items(input : Types::DescribeOpsItemsRequest) : Types::DescribeOpsItemsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_OPS_ITEMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeOpsItemsResponse, "DescribeOpsItems")
      end

      # Lists the parameters in your Amazon Web Services account or the parameters shared with you when you
      # enable the Shared option. Request results are returned on a best-effort basis. If you specify
      # MaxResults in the request, the response includes information up to the limit specified. The number
      # of items returned, however, can be between zero and the value of MaxResults . If the service reaches
      # an internal limit while processing the results, it stops the operation and returns the matching
      # values up to that point and a NextToken . You can specify the NextToken in a subsequent call to get
      # the next set of results. Parameter names can't contain spaces. The service removes any spaces
      # specified for the beginning or end of a parameter name. If the specified name for a parameter
      # contains spaces between characters, the request fails with a ValidationException error. If you
      # change the KMS key alias for the KMS key used to encrypt a parameter, then you must also update the
      # key alias the parameter uses to reference KMS. Otherwise, DescribeParameters retrieves whatever the
      # original key alias was referencing.
      def describe_parameters(
        filters : Array(Types::ParametersFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        parameter_filters : Array(Types::ParameterStringFilter)? = nil,
        shared : Bool? = nil
      ) : Types::DescribeParametersResult
        input = Types::DescribeParametersRequest.new(filters: filters, max_results: max_results, next_token: next_token, parameter_filters: parameter_filters, shared: shared)
        describe_parameters(input)
      end
      def describe_parameters(input : Types::DescribeParametersRequest) : Types::DescribeParametersResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeParametersResult, "DescribeParameters")
      end

      # Lists the patch baselines in your Amazon Web Services account.
      def describe_patch_baselines(
        filters : Array(Types::PatchOrchestratorFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribePatchBaselinesResult
        input = Types::DescribePatchBaselinesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        describe_patch_baselines(input)
      end
      def describe_patch_baselines(input : Types::DescribePatchBaselinesRequest) : Types::DescribePatchBaselinesResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PATCH_BASELINES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePatchBaselinesResult, "DescribePatchBaselines")
      end

      # Returns high-level aggregated patch compliance state information for a patch group.
      def describe_patch_group_state(
        patch_group : String
      ) : Types::DescribePatchGroupStateResult
        input = Types::DescribePatchGroupStateRequest.new(patch_group: patch_group)
        describe_patch_group_state(input)
      end
      def describe_patch_group_state(input : Types::DescribePatchGroupStateRequest) : Types::DescribePatchGroupStateResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PATCH_GROUP_STATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePatchGroupStateResult, "DescribePatchGroupState")
      end

      # Lists all patch groups that have been registered with patch baselines.
      def describe_patch_groups(
        filters : Array(Types::PatchOrchestratorFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribePatchGroupsResult
        input = Types::DescribePatchGroupsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        describe_patch_groups(input)
      end
      def describe_patch_groups(input : Types::DescribePatchGroupsRequest) : Types::DescribePatchGroupsResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PATCH_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePatchGroupsResult, "DescribePatchGroups")
      end

      # Lists the properties of available patches organized by product, product family, classification,
      # severity, and other properties of available patches. You can use the reported properties in the
      # filters you specify in requests for operations such as CreatePatchBaseline , UpdatePatchBaseline ,
      # DescribeAvailablePatches , and DescribePatchBaselines . The following section lists the properties
      # that can be used in filters for each major operating system type: AMAZON_LINUX Valid properties:
      # PRODUCT | CLASSIFICATION | SEVERITY AMAZON_LINUX_2 Valid properties: PRODUCT | CLASSIFICATION |
      # SEVERITY AMAZON_LINUX_2023 Valid properties: PRODUCT | CLASSIFICATION | SEVERITY CENTOS Valid
      # properties: PRODUCT | CLASSIFICATION | SEVERITY DEBIAN Valid properties: PRODUCT | PRIORITY MACOS
      # Valid properties: PRODUCT | CLASSIFICATION ORACLE_LINUX Valid properties: PRODUCT | CLASSIFICATION |
      # SEVERITY REDHAT_ENTERPRISE_LINUX Valid properties: PRODUCT | CLASSIFICATION | SEVERITY SUSE Valid
      # properties: PRODUCT | CLASSIFICATION | SEVERITY UBUNTU Valid properties: PRODUCT | PRIORITY WINDOWS
      # Valid properties: PRODUCT | PRODUCT_FAMILY | CLASSIFICATION | MSRC_SEVERITY
      def describe_patch_properties(
        operating_system : String,
        property : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        patch_set : String? = nil
      ) : Types::DescribePatchPropertiesResult
        input = Types::DescribePatchPropertiesRequest.new(operating_system: operating_system, property: property, max_results: max_results, next_token: next_token, patch_set: patch_set)
        describe_patch_properties(input)
      end
      def describe_patch_properties(input : Types::DescribePatchPropertiesRequest) : Types::DescribePatchPropertiesResult
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PATCH_PROPERTIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePatchPropertiesResult, "DescribePatchProperties")
      end

      # Retrieves a list of all active sessions (both connected and disconnected) or terminated sessions
      # from the past 30 days.
      def describe_sessions(
        state : String,
        filters : Array(Types::SessionFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeSessionsResponse
        input = Types::DescribeSessionsRequest.new(state: state, filters: filters, max_results: max_results, next_token: next_token)
        describe_sessions(input)
      end
      def describe_sessions(input : Types::DescribeSessionsRequest) : Types::DescribeSessionsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SESSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSessionsResponse, "DescribeSessions")
      end

      # Deletes the association between an OpsItem and a related item. For example, this API operation can
      # delete an Incident Manager incident from an OpsItem. Incident Manager is a tool in Amazon Web
      # Services Systems Manager.
      def disassociate_ops_item_related_item(
        association_id : String,
        ops_item_id : String
      ) : Types::DisassociateOpsItemRelatedItemResponse
        input = Types::DisassociateOpsItemRelatedItemRequest.new(association_id: association_id, ops_item_id: ops_item_id)
        disassociate_ops_item_related_item(input)
      end
      def disassociate_ops_item_related_item(input : Types::DisassociateOpsItemRelatedItemRequest) : Types::DisassociateOpsItemRelatedItemResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_OPS_ITEM_RELATED_ITEM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateOpsItemRelatedItemResponse, "DisassociateOpsItemRelatedItem")
      end

      # Returns a credentials set to be used with just-in-time node access.
      def get_access_token(
        access_request_id : String
      ) : Types::GetAccessTokenResponse
        input = Types::GetAccessTokenRequest.new(access_request_id: access_request_id)
        get_access_token(input)
      end
      def get_access_token(input : Types::GetAccessTokenRequest) : Types::GetAccessTokenResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ACCESS_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAccessTokenResponse, "GetAccessToken")
      end

      # Get detailed information about a particular Automation execution.
      def get_automation_execution(
        automation_execution_id : String
      ) : Types::GetAutomationExecutionResult
        input = Types::GetAutomationExecutionRequest.new(automation_execution_id: automation_execution_id)
        get_automation_execution(input)
      end
      def get_automation_execution(input : Types::GetAutomationExecutionRequest) : Types::GetAutomationExecutionResult
        request = Protocol::JsonRpc.build_request(Model::GET_AUTOMATION_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAutomationExecutionResult, "GetAutomationExecution")
      end

      # Gets the state of a Amazon Web Services Systems Manager change calendar at the current time or a
      # specified time. If you specify a time, GetCalendarState returns the state of the calendar at that
      # specific time, and returns the next time that the change calendar state will transition. If you
      # don't specify a time, GetCalendarState uses the current time. Change Calendar entries have two
      # possible states: OPEN or CLOSED . If you specify more than one calendar in a request, the command
      # returns the status of OPEN only if all calendars in the request are open. If one or more calendars
      # in the request are closed, the status returned is CLOSED . For more information about Change
      # Calendar, a tool in Amazon Web Services Systems Manager, see Amazon Web Services Systems Manager
      # Change Calendar in the Amazon Web Services Systems Manager User Guide .
      def get_calendar_state(
        calendar_names : Array(String),
        at_time : String? = nil
      ) : Types::GetCalendarStateResponse
        input = Types::GetCalendarStateRequest.new(calendar_names: calendar_names, at_time: at_time)
        get_calendar_state(input)
      end
      def get_calendar_state(input : Types::GetCalendarStateRequest) : Types::GetCalendarStateResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CALENDAR_STATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCalendarStateResponse, "GetCalendarState")
      end

      # Returns detailed information about command execution for an invocation or plugin. The Run Command
      # API follows an eventual consistency model, due to the distributed nature of the system supporting
      # the API. This means that the result of an API command you run that affects your resources might not
      # be immediately visible to all subsequent commands you run. You should keep this in mind when you
      # carry out an API command that immediately follows a previous API command. GetCommandInvocation only
      # gives the execution status of a plugin in a document. To get the command execution status on a
      # specific managed node, use ListCommandInvocations . To get the command execution status across
      # managed nodes, use ListCommands .
      def get_command_invocation(
        command_id : String,
        instance_id : String,
        plugin_name : String? = nil
      ) : Types::GetCommandInvocationResult
        input = Types::GetCommandInvocationRequest.new(command_id: command_id, instance_id: instance_id, plugin_name: plugin_name)
        get_command_invocation(input)
      end
      def get_command_invocation(input : Types::GetCommandInvocationRequest) : Types::GetCommandInvocationResult
        request = Protocol::JsonRpc.build_request(Model::GET_COMMAND_INVOCATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCommandInvocationResult, "GetCommandInvocation")
      end

      # Retrieves the Session Manager connection status for a managed node to determine whether it is
      # running and ready to receive Session Manager connections.
      def get_connection_status(
        target : String
      ) : Types::GetConnectionStatusResponse
        input = Types::GetConnectionStatusRequest.new(target: target)
        get_connection_status(input)
      end
      def get_connection_status(input : Types::GetConnectionStatusRequest) : Types::GetConnectionStatusResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CONNECTION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetConnectionStatusResponse, "GetConnectionStatus")
      end

      # Retrieves the default patch baseline. Amazon Web Services Systems Manager supports creating multiple
      # default patch baselines. For example, you can create a default patch baseline for each operating
      # system. If you don't specify an operating system value, the default patch baseline for Windows is
      # returned.
      def get_default_patch_baseline(
        operating_system : String? = nil
      ) : Types::GetDefaultPatchBaselineResult
        input = Types::GetDefaultPatchBaselineRequest.new(operating_system: operating_system)
        get_default_patch_baseline(input)
      end
      def get_default_patch_baseline(input : Types::GetDefaultPatchBaselineRequest) : Types::GetDefaultPatchBaselineResult
        request = Protocol::JsonRpc.build_request(Model::GET_DEFAULT_PATCH_BASELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDefaultPatchBaselineResult, "GetDefaultPatchBaseline")
      end

      # Retrieves the current snapshot for the patch baseline the managed node uses. This API is primarily
      # used by the AWS-RunPatchBaseline Systems Manager document (SSM document). If you run the command
      # locally, such as with the Command Line Interface (CLI), the system attempts to use your local Amazon
      # Web Services credentials and the operation fails. To avoid this, you can run the command in the
      # Amazon Web Services Systems Manager console. Use Run Command, a tool in Amazon Web Services Systems
      # Manager, with an SSM document that enables you to target a managed node with a script or command.
      # For example, run the command using the AWS-RunShellScript document or the AWS-RunPowerShellScript
      # document.
      def get_deployable_patch_snapshot_for_instance(
        instance_id : String,
        snapshot_id : String,
        baseline_override : Types::BaselineOverride? = nil,
        use_s3_dual_stack_endpoint : Bool? = nil
      ) : Types::GetDeployablePatchSnapshotForInstanceResult
        input = Types::GetDeployablePatchSnapshotForInstanceRequest.new(instance_id: instance_id, snapshot_id: snapshot_id, baseline_override: baseline_override, use_s3_dual_stack_endpoint: use_s3_dual_stack_endpoint)
        get_deployable_patch_snapshot_for_instance(input)
      end
      def get_deployable_patch_snapshot_for_instance(input : Types::GetDeployablePatchSnapshotForInstanceRequest) : Types::GetDeployablePatchSnapshotForInstanceResult
        request = Protocol::JsonRpc.build_request(Model::GET_DEPLOYABLE_PATCH_SNAPSHOT_FOR_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDeployablePatchSnapshotForInstanceResult, "GetDeployablePatchSnapshotForInstance")
      end

      # Gets the contents of the specified Amazon Web Services Systems Manager document (SSM document).
      def get_document(
        name : String,
        document_format : String? = nil,
        document_version : String? = nil,
        version_name : String? = nil
      ) : Types::GetDocumentResult
        input = Types::GetDocumentRequest.new(name: name, document_format: document_format, document_version: document_version, version_name: version_name)
        get_document(input)
      end
      def get_document(input : Types::GetDocumentRequest) : Types::GetDocumentResult
        request = Protocol::JsonRpc.build_request(Model::GET_DOCUMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDocumentResult, "GetDocument")
      end

      # Initiates the process of retrieving an existing preview that shows the effects that running a
      # specified Automation runbook would have on the targeted resources.
      def get_execution_preview(
        execution_preview_id : String
      ) : Types::GetExecutionPreviewResponse
        input = Types::GetExecutionPreviewRequest.new(execution_preview_id: execution_preview_id)
        get_execution_preview(input)
      end
      def get_execution_preview(input : Types::GetExecutionPreviewRequest) : Types::GetExecutionPreviewResponse
        request = Protocol::JsonRpc.build_request(Model::GET_EXECUTION_PREVIEW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetExecutionPreviewResponse, "GetExecutionPreview")
      end

      # Query inventory information. This includes managed node status, such as Stopped or Terminated .
      def get_inventory(
        aggregators : Array(Types::InventoryAggregator)? = nil,
        filters : Array(Types::InventoryFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        result_attributes : Array(Types::ResultAttribute)? = nil
      ) : Types::GetInventoryResult
        input = Types::GetInventoryRequest.new(aggregators: aggregators, filters: filters, max_results: max_results, next_token: next_token, result_attributes: result_attributes)
        get_inventory(input)
      end
      def get_inventory(input : Types::GetInventoryRequest) : Types::GetInventoryResult
        request = Protocol::JsonRpc.build_request(Model::GET_INVENTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetInventoryResult, "GetInventory")
      end

      # Return a list of inventory type names for the account, or return a list of attribute names for a
      # specific Inventory item type.
      def get_inventory_schema(
        aggregator : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sub_type : Bool? = nil,
        type_name : String? = nil
      ) : Types::GetInventorySchemaResult
        input = Types::GetInventorySchemaRequest.new(aggregator: aggregator, max_results: max_results, next_token: next_token, sub_type: sub_type, type_name: type_name)
        get_inventory_schema(input)
      end
      def get_inventory_schema(input : Types::GetInventorySchemaRequest) : Types::GetInventorySchemaResult
        request = Protocol::JsonRpc.build_request(Model::GET_INVENTORY_SCHEMA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetInventorySchemaResult, "GetInventorySchema")
      end

      # Retrieves a maintenance window.
      def get_maintenance_window(
        window_id : String
      ) : Types::GetMaintenanceWindowResult
        input = Types::GetMaintenanceWindowRequest.new(window_id: window_id)
        get_maintenance_window(input)
      end
      def get_maintenance_window(input : Types::GetMaintenanceWindowRequest) : Types::GetMaintenanceWindowResult
        request = Protocol::JsonRpc.build_request(Model::GET_MAINTENANCE_WINDOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMaintenanceWindowResult, "GetMaintenanceWindow")
      end

      # Retrieves details about a specific a maintenance window execution.
      def get_maintenance_window_execution(
        window_execution_id : String
      ) : Types::GetMaintenanceWindowExecutionResult
        input = Types::GetMaintenanceWindowExecutionRequest.new(window_execution_id: window_execution_id)
        get_maintenance_window_execution(input)
      end
      def get_maintenance_window_execution(input : Types::GetMaintenanceWindowExecutionRequest) : Types::GetMaintenanceWindowExecutionResult
        request = Protocol::JsonRpc.build_request(Model::GET_MAINTENANCE_WINDOW_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMaintenanceWindowExecutionResult, "GetMaintenanceWindowExecution")
      end

      # Retrieves the details about a specific task run as part of a maintenance window execution.
      def get_maintenance_window_execution_task(
        task_id : String,
        window_execution_id : String
      ) : Types::GetMaintenanceWindowExecutionTaskResult
        input = Types::GetMaintenanceWindowExecutionTaskRequest.new(task_id: task_id, window_execution_id: window_execution_id)
        get_maintenance_window_execution_task(input)
      end
      def get_maintenance_window_execution_task(input : Types::GetMaintenanceWindowExecutionTaskRequest) : Types::GetMaintenanceWindowExecutionTaskResult
        request = Protocol::JsonRpc.build_request(Model::GET_MAINTENANCE_WINDOW_EXECUTION_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMaintenanceWindowExecutionTaskResult, "GetMaintenanceWindowExecutionTask")
      end

      # Retrieves information about a specific task running on a specific target.
      def get_maintenance_window_execution_task_invocation(
        invocation_id : String,
        task_id : String,
        window_execution_id : String
      ) : Types::GetMaintenanceWindowExecutionTaskInvocationResult
        input = Types::GetMaintenanceWindowExecutionTaskInvocationRequest.new(invocation_id: invocation_id, task_id: task_id, window_execution_id: window_execution_id)
        get_maintenance_window_execution_task_invocation(input)
      end
      def get_maintenance_window_execution_task_invocation(input : Types::GetMaintenanceWindowExecutionTaskInvocationRequest) : Types::GetMaintenanceWindowExecutionTaskInvocationResult
        request = Protocol::JsonRpc.build_request(Model::GET_MAINTENANCE_WINDOW_EXECUTION_TASK_INVOCATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMaintenanceWindowExecutionTaskInvocationResult, "GetMaintenanceWindowExecutionTaskInvocation")
      end

      # Retrieves the details of a maintenance window task. For maintenance window tasks without a specified
      # target, you can't supply values for --max-errors and --max-concurrency . Instead, the system inserts
      # a placeholder value of 1 , which may be reported in the response to this command. These values don't
      # affect the running of your task and can be ignored. To retrieve a list of tasks in a maintenance
      # window, instead use the DescribeMaintenanceWindowTasks command.
      def get_maintenance_window_task(
        window_id : String,
        window_task_id : String
      ) : Types::GetMaintenanceWindowTaskResult
        input = Types::GetMaintenanceWindowTaskRequest.new(window_id: window_id, window_task_id: window_task_id)
        get_maintenance_window_task(input)
      end
      def get_maintenance_window_task(input : Types::GetMaintenanceWindowTaskRequest) : Types::GetMaintenanceWindowTaskResult
        request = Protocol::JsonRpc.build_request(Model::GET_MAINTENANCE_WINDOW_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMaintenanceWindowTaskResult, "GetMaintenanceWindowTask")
      end

      # Get information about an OpsItem by using the ID. You must have permission in Identity and Access
      # Management (IAM) to view information about an OpsItem. For more information, see Set up OpsCenter in
      # the Amazon Web Services Systems Manager User Guide . Operations engineers and IT professionals use
      # Amazon Web Services Systems Manager OpsCenter to view, investigate, and remediate operational issues
      # impacting the performance and health of their Amazon Web Services resources. For more information,
      # see Amazon Web Services Systems Manager OpsCenter in the Amazon Web Services Systems Manager User
      # Guide .
      def get_ops_item(
        ops_item_id : String,
        ops_item_arn : String? = nil
      ) : Types::GetOpsItemResponse
        input = Types::GetOpsItemRequest.new(ops_item_id: ops_item_id, ops_item_arn: ops_item_arn)
        get_ops_item(input)
      end
      def get_ops_item(input : Types::GetOpsItemRequest) : Types::GetOpsItemResponse
        request = Protocol::JsonRpc.build_request(Model::GET_OPS_ITEM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOpsItemResponse, "GetOpsItem")
      end

      # View operational metadata related to an application in Application Manager.
      def get_ops_metadata(
        ops_metadata_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetOpsMetadataResult
        input = Types::GetOpsMetadataRequest.new(ops_metadata_arn: ops_metadata_arn, max_results: max_results, next_token: next_token)
        get_ops_metadata(input)
      end
      def get_ops_metadata(input : Types::GetOpsMetadataRequest) : Types::GetOpsMetadataResult
        request = Protocol::JsonRpc.build_request(Model::GET_OPS_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOpsMetadataResult, "GetOpsMetadata")
      end

      # View a summary of operations metadata (OpsData) based on specified filters and aggregators. OpsData
      # can include information about Amazon Web Services Systems Manager OpsCenter operational workitems
      # (OpsItems) as well as information about any Amazon Web Services resource or service configured to
      # report OpsData to Amazon Web Services Systems Manager Explorer.
      def get_ops_summary(
        aggregators : Array(Types::OpsAggregator)? = nil,
        filters : Array(Types::OpsFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        result_attributes : Array(Types::OpsResultAttribute)? = nil,
        sync_name : String? = nil
      ) : Types::GetOpsSummaryResult
        input = Types::GetOpsSummaryRequest.new(aggregators: aggregators, filters: filters, max_results: max_results, next_token: next_token, result_attributes: result_attributes, sync_name: sync_name)
        get_ops_summary(input)
      end
      def get_ops_summary(input : Types::GetOpsSummaryRequest) : Types::GetOpsSummaryResult
        request = Protocol::JsonRpc.build_request(Model::GET_OPS_SUMMARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOpsSummaryResult, "GetOpsSummary")
      end

      # Get information about a single parameter by specifying the parameter name. Parameter names can't
      # contain spaces. The service removes any spaces specified for the beginning or end of a parameter
      # name. If the specified name for a parameter contains spaces between characters, the request fails
      # with a ValidationException error. To get information about more than one parameter at a time, use
      # the GetParameters operation.
      def get_parameter(
        name : String,
        with_decryption : Bool? = nil
      ) : Types::GetParameterResult
        input = Types::GetParameterRequest.new(name: name, with_decryption: with_decryption)
        get_parameter(input)
      end
      def get_parameter(input : Types::GetParameterRequest) : Types::GetParameterResult
        request = Protocol::JsonRpc.build_request(Model::GET_PARAMETER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetParameterResult, "GetParameter")
      end

      # Retrieves the history of all changes to a parameter. Parameter names can't contain spaces. The
      # service removes any spaces specified for the beginning or end of a parameter name. If the specified
      # name for a parameter contains spaces between characters, the request fails with a
      # ValidationException error. If you change the KMS key alias for the KMS key used to encrypt a
      # parameter, then you must also update the key alias the parameter uses to reference KMS. Otherwise,
      # GetParameterHistory retrieves whatever the original key alias was referencing.
      def get_parameter_history(
        name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        with_decryption : Bool? = nil
      ) : Types::GetParameterHistoryResult
        input = Types::GetParameterHistoryRequest.new(name: name, max_results: max_results, next_token: next_token, with_decryption: with_decryption)
        get_parameter_history(input)
      end
      def get_parameter_history(input : Types::GetParameterHistoryRequest) : Types::GetParameterHistoryResult
        request = Protocol::JsonRpc.build_request(Model::GET_PARAMETER_HISTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetParameterHistoryResult, "GetParameterHistory")
      end

      # Get information about one or more parameters by specifying multiple parameter names. To get
      # information about a single parameter, you can use the GetParameter operation instead. Parameter
      # names can't contain spaces. The service removes any spaces specified for the beginning or end of a
      # parameter name. If the specified name for a parameter contains spaces between characters, the
      # request fails with a ValidationException error.
      def get_parameters(
        names : Array(String),
        with_decryption : Bool? = nil
      ) : Types::GetParametersResult
        input = Types::GetParametersRequest.new(names: names, with_decryption: with_decryption)
        get_parameters(input)
      end
      def get_parameters(input : Types::GetParametersRequest) : Types::GetParametersResult
        request = Protocol::JsonRpc.build_request(Model::GET_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetParametersResult, "GetParameters")
      end

      # Retrieve information about one or more parameters under a specified level in a hierarchy. Request
      # results are returned on a best-effort basis. If you specify MaxResults in the request, the response
      # includes information up to the limit specified. The number of items returned, however, can be
      # between zero and the value of MaxResults . If the service reaches an internal limit while processing
      # the results, it stops the operation and returns the matching values up to that point and a NextToken
      # . You can specify the NextToken in a subsequent call to get the next set of results. Parameter names
      # can't contain spaces. The service removes any spaces specified for the beginning or end of a
      # parameter name. If the specified name for a parameter contains spaces between characters, the
      # request fails with a ValidationException error.
      def get_parameters_by_path(
        path : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        parameter_filters : Array(Types::ParameterStringFilter)? = nil,
        recursive : Bool? = nil,
        with_decryption : Bool? = nil
      ) : Types::GetParametersByPathResult
        input = Types::GetParametersByPathRequest.new(path: path, max_results: max_results, next_token: next_token, parameter_filters: parameter_filters, recursive: recursive, with_decryption: with_decryption)
        get_parameters_by_path(input)
      end
      def get_parameters_by_path(input : Types::GetParametersByPathRequest) : Types::GetParametersByPathResult
        request = Protocol::JsonRpc.build_request(Model::GET_PARAMETERS_BY_PATH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetParametersByPathResult, "GetParametersByPath")
      end

      # Retrieves information about a patch baseline.
      def get_patch_baseline(
        baseline_id : String
      ) : Types::GetPatchBaselineResult
        input = Types::GetPatchBaselineRequest.new(baseline_id: baseline_id)
        get_patch_baseline(input)
      end
      def get_patch_baseline(input : Types::GetPatchBaselineRequest) : Types::GetPatchBaselineResult
        request = Protocol::JsonRpc.build_request(Model::GET_PATCH_BASELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPatchBaselineResult, "GetPatchBaseline")
      end

      # Retrieves the patch baseline that should be used for the specified patch group.
      def get_patch_baseline_for_patch_group(
        patch_group : String,
        operating_system : String? = nil
      ) : Types::GetPatchBaselineForPatchGroupResult
        input = Types::GetPatchBaselineForPatchGroupRequest.new(patch_group: patch_group, operating_system: operating_system)
        get_patch_baseline_for_patch_group(input)
      end
      def get_patch_baseline_for_patch_group(input : Types::GetPatchBaselineForPatchGroupRequest) : Types::GetPatchBaselineForPatchGroupResult
        request = Protocol::JsonRpc.build_request(Model::GET_PATCH_BASELINE_FOR_PATCH_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPatchBaselineForPatchGroupResult, "GetPatchBaselineForPatchGroup")
      end

      # Returns an array of the Policy object.
      def get_resource_policies(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetResourcePoliciesResponse
        input = Types::GetResourcePoliciesRequest.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        get_resource_policies(input)
      end
      def get_resource_policies(input : Types::GetResourcePoliciesRequest) : Types::GetResourcePoliciesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourcePoliciesResponse, "GetResourcePolicies")
      end

      # ServiceSetting is an account-level setting for an Amazon Web Services service. This setting defines
      # how a user interacts with or uses a service or a feature of a service. For example, if an Amazon Web
      # Services service charges money to the account based on feature or service usage, then the Amazon Web
      # Services service team might create a default setting of false . This means the user can't use this
      # feature unless they change the setting to true and intentionally opt in for a paid feature. Services
      # map a SettingId object to a setting value. Amazon Web Services services teams define the default
      # value for a SettingId . You can't create a new SettingId , but you can overwrite the default value
      # if you have the ssm:UpdateServiceSetting permission for the setting. Use the UpdateServiceSetting
      # API operation to change the default setting. Or use the ResetServiceSetting to change the value back
      # to the original value defined by the Amazon Web Services service team. Query the current service
      # setting for the Amazon Web Services account.
      def get_service_setting(
        setting_id : String
      ) : Types::GetServiceSettingResult
        input = Types::GetServiceSettingRequest.new(setting_id: setting_id)
        get_service_setting(input)
      end
      def get_service_setting(input : Types::GetServiceSettingRequest) : Types::GetServiceSettingResult
        request = Protocol::JsonRpc.build_request(Model::GET_SERVICE_SETTING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetServiceSettingResult, "GetServiceSetting")
      end

      # A parameter label is a user-defined alias to help you manage different versions of a parameter. When
      # you modify a parameter, Amazon Web Services Systems Manager automatically saves a new version and
      # increments the version number by one. A label can help you remember the purpose of a parameter when
      # there are multiple versions. Parameter labels have the following requirements and restrictions. A
      # version of a parameter can have a maximum of 10 labels. You can't attach the same label to different
      # versions of the same parameter. For example, if version 1 has the label Production, then you can't
      # attach Production to version 2. You can move a label from one version of a parameter to another. You
      # can't create a label when you create a new parameter. You must attach a label to a specific version
      # of a parameter. If you no longer want to use a parameter label, then you can either delete it or
      # move it to a different version of a parameter. A label can have a maximum of 100 characters. Labels
      # can contain letters (case sensitive), numbers, periods (.), hyphens (-), or underscores (_). Labels
      # can't begin with a number, " aws " or " ssm " (not case sensitive). If a label fails to meet these
      # requirements, then the label isn't associated with a parameter and the system displays it in the
      # list of InvalidLabels. Parameter names can't contain spaces. The service removes any spaces
      # specified for the beginning or end of a parameter name. If the specified name for a parameter
      # contains spaces between characters, the request fails with a ValidationException error.
      def label_parameter_version(
        labels : Array(String),
        name : String,
        parameter_version : Int64? = nil
      ) : Types::LabelParameterVersionResult
        input = Types::LabelParameterVersionRequest.new(labels: labels, name: name, parameter_version: parameter_version)
        label_parameter_version(input)
      end
      def label_parameter_version(input : Types::LabelParameterVersionRequest) : Types::LabelParameterVersionResult
        request = Protocol::JsonRpc.build_request(Model::LABEL_PARAMETER_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::LabelParameterVersionResult, "LabelParameterVersion")
      end

      # Retrieves all versions of an association for a specific association ID.
      def list_association_versions(
        association_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAssociationVersionsResult
        input = Types::ListAssociationVersionsRequest.new(association_id: association_id, max_results: max_results, next_token: next_token)
        list_association_versions(input)
      end
      def list_association_versions(input : Types::ListAssociationVersionsRequest) : Types::ListAssociationVersionsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_ASSOCIATION_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAssociationVersionsResult, "ListAssociationVersions")
      end

      # Returns all State Manager associations in the current Amazon Web Services account and Amazon Web
      # Services Region. You can limit the results to a specific State Manager association document or
      # managed node by specifying a filter. State Manager is a tool in Amazon Web Services Systems Manager.
      def list_associations(
        association_filter_list : Array(Types::AssociationFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAssociationsResult
        input = Types::ListAssociationsRequest.new(association_filter_list: association_filter_list, max_results: max_results, next_token: next_token)
        list_associations(input)
      end
      def list_associations(input : Types::ListAssociationsRequest) : Types::ListAssociationsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_ASSOCIATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAssociationsResult, "ListAssociations")
      end

      # An invocation is copy of a command sent to a specific managed node. A command can apply to one or
      # more managed nodes. A command invocation applies to one managed node. For example, if a user runs
      # SendCommand against three managed nodes, then a command invocation is created for each requested
      # managed node ID. ListCommandInvocations provide status about command execution.
      def list_command_invocations(
        command_id : String? = nil,
        details : Bool? = nil,
        filters : Array(Types::CommandFilter)? = nil,
        instance_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCommandInvocationsResult
        input = Types::ListCommandInvocationsRequest.new(command_id: command_id, details: details, filters: filters, instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_command_invocations(input)
      end
      def list_command_invocations(input : Types::ListCommandInvocationsRequest) : Types::ListCommandInvocationsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_COMMAND_INVOCATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCommandInvocationsResult, "ListCommandInvocations")
      end

      # Lists the commands requested by users of the Amazon Web Services account.
      def list_commands(
        command_id : String? = nil,
        filters : Array(Types::CommandFilter)? = nil,
        instance_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCommandsResult
        input = Types::ListCommandsRequest.new(command_id: command_id, filters: filters, instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_commands(input)
      end
      def list_commands(input : Types::ListCommandsRequest) : Types::ListCommandsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_COMMANDS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCommandsResult, "ListCommands")
      end

      # For a specified resource ID, this API operation returns a list of compliance statuses for different
      # resource types. Currently, you can only specify one resource ID per call. List results depend on the
      # criteria specified in the filter.
      def list_compliance_items(
        filters : Array(Types::ComplianceStringFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_ids : Array(String)? = nil,
        resource_types : Array(String)? = nil
      ) : Types::ListComplianceItemsResult
        input = Types::ListComplianceItemsRequest.new(filters: filters, max_results: max_results, next_token: next_token, resource_ids: resource_ids, resource_types: resource_types)
        list_compliance_items(input)
      end
      def list_compliance_items(input : Types::ListComplianceItemsRequest) : Types::ListComplianceItemsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_COMPLIANCE_ITEMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListComplianceItemsResult, "ListComplianceItems")
      end

      # Returns a summary count of compliant and non-compliant resources for a compliance type. For example,
      # this call can return State Manager associations, patches, or custom compliance types according to
      # the filter criteria that you specify.
      def list_compliance_summaries(
        filters : Array(Types::ComplianceStringFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListComplianceSummariesResult
        input = Types::ListComplianceSummariesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_compliance_summaries(input)
      end
      def list_compliance_summaries(input : Types::ListComplianceSummariesRequest) : Types::ListComplianceSummariesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_COMPLIANCE_SUMMARIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListComplianceSummariesResult, "ListComplianceSummaries")
      end

      # Amazon Web Services Systems Manager Change Manager will no longer be open to new customers starting
      # November 7, 2025. If you would like to use Change Manager, sign up prior to that date. Existing
      # customers can continue to use the service as normal. For more information, see Amazon Web Services
      # Systems Manager Change Manager availability change . Information about approval reviews for a
      # version of a change template in Change Manager.
      def list_document_metadata_history(
        metadata : String,
        name : String,
        document_version : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDocumentMetadataHistoryResponse
        input = Types::ListDocumentMetadataHistoryRequest.new(metadata: metadata, name: name, document_version: document_version, max_results: max_results, next_token: next_token)
        list_document_metadata_history(input)
      end
      def list_document_metadata_history(input : Types::ListDocumentMetadataHistoryRequest) : Types::ListDocumentMetadataHistoryResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DOCUMENT_METADATA_HISTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDocumentMetadataHistoryResponse, "ListDocumentMetadataHistory")
      end

      # List all versions for a document.
      def list_document_versions(
        name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDocumentVersionsResult
        input = Types::ListDocumentVersionsRequest.new(name: name, max_results: max_results, next_token: next_token)
        list_document_versions(input)
      end
      def list_document_versions(input : Types::ListDocumentVersionsRequest) : Types::ListDocumentVersionsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_DOCUMENT_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDocumentVersionsResult, "ListDocumentVersions")
      end

      # Returns all Systems Manager (SSM) documents in the current Amazon Web Services account and Amazon
      # Web Services Region. You can limit the results of this request by using a filter.
      def list_documents(
        document_filter_list : Array(Types::DocumentFilter)? = nil,
        filters : Array(Types::DocumentKeyValuesFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDocumentsResult
        input = Types::ListDocumentsRequest.new(document_filter_list: document_filter_list, filters: filters, max_results: max_results, next_token: next_token)
        list_documents(input)
      end
      def list_documents(input : Types::ListDocumentsRequest) : Types::ListDocumentsResult
        request = Protocol::JsonRpc.build_request(Model::LIST_DOCUMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDocumentsResult, "ListDocuments")
      end

      # A list of inventory items returned by the request.
      def list_inventory_entries(
        instance_id : String,
        type_name : String,
        filters : Array(Types::InventoryFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListInventoryEntriesResult
        input = Types::ListInventoryEntriesRequest.new(instance_id: instance_id, type_name: type_name, filters: filters, max_results: max_results, next_token: next_token)
        list_inventory_entries(input)
      end
      def list_inventory_entries(input : Types::ListInventoryEntriesRequest) : Types::ListInventoryEntriesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_INVENTORY_ENTRIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListInventoryEntriesResult, "ListInventoryEntries")
      end

      # Takes in filters and returns a list of managed nodes matching the filter criteria.
      def list_nodes(
        filters : Array(Types::NodeFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sync_name : String? = nil
      ) : Types::ListNodesResult
        input = Types::ListNodesRequest.new(filters: filters, max_results: max_results, next_token: next_token, sync_name: sync_name)
        list_nodes(input)
      end
      def list_nodes(input : Types::ListNodesRequest) : Types::ListNodesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_NODES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListNodesResult, "ListNodes")
      end

      # Generates a summary of managed instance/node metadata based on the filters and aggregators you
      # specify. Results are grouped by the input aggregator you specify.
      def list_nodes_summary(
        aggregators : Array(Types::NodeAggregator),
        filters : Array(Types::NodeFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sync_name : String? = nil
      ) : Types::ListNodesSummaryResult
        input = Types::ListNodesSummaryRequest.new(aggregators: aggregators, filters: filters, max_results: max_results, next_token: next_token, sync_name: sync_name)
        list_nodes_summary(input)
      end
      def list_nodes_summary(input : Types::ListNodesSummaryRequest) : Types::ListNodesSummaryResult
        request = Protocol::JsonRpc.build_request(Model::LIST_NODES_SUMMARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListNodesSummaryResult, "ListNodesSummary")
      end

      # Returns a list of all OpsItem events in the current Amazon Web Services Region and Amazon Web
      # Services account. You can limit the results to events associated with specific OpsItems by
      # specifying a filter.
      def list_ops_item_events(
        filters : Array(Types::OpsItemEventFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListOpsItemEventsResponse
        input = Types::ListOpsItemEventsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_ops_item_events(input)
      end
      def list_ops_item_events(input : Types::ListOpsItemEventsRequest) : Types::ListOpsItemEventsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_OPS_ITEM_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOpsItemEventsResponse, "ListOpsItemEvents")
      end

      # Lists all related-item resources associated with a Systems Manager OpsCenter OpsItem. OpsCenter is a
      # tool in Amazon Web Services Systems Manager.
      def list_ops_item_related_items(
        filters : Array(Types::OpsItemRelatedItemsFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        ops_item_id : String? = nil
      ) : Types::ListOpsItemRelatedItemsResponse
        input = Types::ListOpsItemRelatedItemsRequest.new(filters: filters, max_results: max_results, next_token: next_token, ops_item_id: ops_item_id)
        list_ops_item_related_items(input)
      end
      def list_ops_item_related_items(input : Types::ListOpsItemRelatedItemsRequest) : Types::ListOpsItemRelatedItemsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_OPS_ITEM_RELATED_ITEMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOpsItemRelatedItemsResponse, "ListOpsItemRelatedItems")
      end

      # Amazon Web Services Systems Manager calls this API operation when displaying all Application Manager
      # OpsMetadata objects or blobs.
      def list_ops_metadata(
        filters : Array(Types::OpsMetadataFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListOpsMetadataResult
        input = Types::ListOpsMetadataRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_ops_metadata(input)
      end
      def list_ops_metadata(input : Types::ListOpsMetadataRequest) : Types::ListOpsMetadataResult
        request = Protocol::JsonRpc.build_request(Model::LIST_OPS_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListOpsMetadataResult, "ListOpsMetadata")
      end

      # Returns a resource-level summary count. The summary includes information about compliant and
      # non-compliant statuses and detailed compliance-item severity counts, according to the filter
      # criteria you specify.
      def list_resource_compliance_summaries(
        filters : Array(Types::ComplianceStringFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListResourceComplianceSummariesResult
        input = Types::ListResourceComplianceSummariesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_resource_compliance_summaries(input)
      end
      def list_resource_compliance_summaries(input : Types::ListResourceComplianceSummariesRequest) : Types::ListResourceComplianceSummariesResult
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOURCE_COMPLIANCE_SUMMARIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResourceComplianceSummariesResult, "ListResourceComplianceSummaries")
      end

      # Lists your resource data sync configurations. Includes information about the last time a sync
      # attempted to start, the last sync status, and the last time a sync successfully completed. The
      # number of sync configurations might be too large to return using a single call to
      # ListResourceDataSync . You can limit the number of sync configurations returned by using the
      # MaxResults parameter. To determine whether there are more sync configurations to list, check the
      # value of NextToken in the output. If there are more sync configurations to list, you can request
      # them by specifying the NextToken returned in the call to the parameter of a subsequent call.
      def list_resource_data_sync(
        max_results : Int32? = nil,
        next_token : String? = nil,
        sync_type : String? = nil
      ) : Types::ListResourceDataSyncResult
        input = Types::ListResourceDataSyncRequest.new(max_results: max_results, next_token: next_token, sync_type: sync_type)
        list_resource_data_sync(input)
      end
      def list_resource_data_sync(input : Types::ListResourceDataSyncRequest) : Types::ListResourceDataSyncResult
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOURCE_DATA_SYNC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResourceDataSyncResult, "ListResourceDataSync")
      end

      # Returns a list of the tags assigned to the specified resource. For information about the ID format
      # for each supported resource type, see AddTagsToResource .
      def list_tags_for_resource(
        resource_id : String,
        resource_type : String
      ) : Types::ListTagsForResourceResult
        input = Types::ListTagsForResourceRequest.new(resource_id: resource_id, resource_type: resource_type)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResult
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResult, "ListTagsForResource")
      end

      # Shares a Amazon Web Services Systems Manager document (SSM document)publicly or privately. If you
      # share a document privately, you must specify the Amazon Web Services user IDs for those people who
      # can use the document. If you share a document publicly, you must specify All as the account ID.
      def modify_document_permission(
        name : String,
        permission_type : String,
        account_ids_to_add : Array(String)? = nil,
        account_ids_to_remove : Array(String)? = nil,
        shared_document_version : String? = nil
      ) : Types::ModifyDocumentPermissionResponse
        input = Types::ModifyDocumentPermissionRequest.new(name: name, permission_type: permission_type, account_ids_to_add: account_ids_to_add, account_ids_to_remove: account_ids_to_remove, shared_document_version: shared_document_version)
        modify_document_permission(input)
      end
      def modify_document_permission(input : Types::ModifyDocumentPermissionRequest) : Types::ModifyDocumentPermissionResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_DOCUMENT_PERMISSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyDocumentPermissionResponse, "ModifyDocumentPermission")
      end

      # Registers a compliance type and other compliance details on a designated resource. This operation
      # lets you register custom compliance details with a resource. This call overwrites existing
      # compliance information on the resource, so you must provide a full list of compliance items each
      # time that you send the request. ComplianceType can be one of the following: ExecutionId: The
      # execution ID when the patch, association, or custom compliance item was applied. ExecutionType:
      # Specify patch, association, or Custom: string . ExecutionTime. The time the patch, association, or
      # custom compliance item was applied to the managed node. For State Manager associations, this
      # represents the time when compliance status was captured by the Systems Manager service during its
      # internal compliance aggregation workflow, not necessarily when the association was executed on the
      # managed node. State Manager updates compliance information for all associations on an instance
      # whenever any association executes, which may result in multiple associations showing the same
      # execution time. Id: The patch, association, or custom compliance ID. Title: A title. Status: The
      # status of the compliance item. For example, approved for patches, or Failed for associations.
      # Severity: A patch severity. For example, Critical . DocumentName: An SSM document name. For example,
      # AWS-RunPatchBaseline . DocumentVersion: An SSM document version number. For example, 4.
      # Classification: A patch classification. For example, security updates . PatchBaselineId: A patch
      # baseline ID. PatchSeverity: A patch severity. For example, Critical . PatchState: A patch state. For
      # example, InstancesWithFailedPatches . PatchGroup: The name of a patch group. InstalledTime: The time
      # the association, patch, or custom compliance item was applied to the resource. Specify the time by
      # using the following format: yyyy-MM-dd'T'HH:mm:ss'Z'
      def put_compliance_items(
        compliance_type : String,
        execution_summary : Types::ComplianceExecutionSummary,
        items : Array(Types::ComplianceItemEntry),
        resource_id : String,
        resource_type : String,
        item_content_hash : String? = nil,
        upload_type : String? = nil
      ) : Types::PutComplianceItemsResult
        input = Types::PutComplianceItemsRequest.new(compliance_type: compliance_type, execution_summary: execution_summary, items: items, resource_id: resource_id, resource_type: resource_type, item_content_hash: item_content_hash, upload_type: upload_type)
        put_compliance_items(input)
      end
      def put_compliance_items(input : Types::PutComplianceItemsRequest) : Types::PutComplianceItemsResult
        request = Protocol::JsonRpc.build_request(Model::PUT_COMPLIANCE_ITEMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutComplianceItemsResult, "PutComplianceItems")
      end

      # Bulk update custom inventory items on one or more managed nodes. The request adds an inventory item,
      # if it doesn't already exist, or updates an inventory item, if it does exist.
      def put_inventory(
        instance_id : String,
        items : Array(Types::InventoryItem)
      ) : Types::PutInventoryResult
        input = Types::PutInventoryRequest.new(instance_id: instance_id, items: items)
        put_inventory(input)
      end
      def put_inventory(input : Types::PutInventoryRequest) : Types::PutInventoryResult
        request = Protocol::JsonRpc.build_request(Model::PUT_INVENTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutInventoryResult, "PutInventory")
      end

      # Create or update a parameter in Parameter Store.
      def put_parameter(
        name : String,
        value : String,
        allowed_pattern : String? = nil,
        data_type : String? = nil,
        description : String? = nil,
        key_id : String? = nil,
        overwrite : Bool? = nil,
        policies : String? = nil,
        tags : Array(Types::Tag)? = nil,
        tier : String? = nil,
        type : String? = nil
      ) : Types::PutParameterResult
        input = Types::PutParameterRequest.new(name: name, value: value, allowed_pattern: allowed_pattern, data_type: data_type, description: description, key_id: key_id, overwrite: overwrite, policies: policies, tags: tags, tier: tier, type: type)
        put_parameter(input)
      end
      def put_parameter(input : Types::PutParameterRequest) : Types::PutParameterResult
        request = Protocol::JsonRpc.build_request(Model::PUT_PARAMETER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutParameterResult, "PutParameter")
      end

      # Creates or updates a Systems Manager resource policy. A resource policy helps you to define the IAM
      # entity (for example, an Amazon Web Services account) that can manage your Systems Manager resources.
      # The following resources support Systems Manager resource policies. OpsItemGroup - The resource
      # policy for OpsItemGroup enables Amazon Web Services accounts to view and interact with OpsCenter
      # operational work items (OpsItems). Parameter - The resource policy is used to share a parameter with
      # other accounts using Resource Access Manager (RAM). To share a parameter, it must be in the advanced
      # parameter tier. For information about parameter tiers, see Managing parameter tiers . For
      # information about changing an existing standard parameter to an advanced parameter, see Changing a
      # standard parameter to an advanced parameter . To share a SecureString parameter, it must be
      # encrypted with a customer managed key, and you must share the key separately through Key Management
      # Service. Amazon Web Services managed keys cannot be shared. Parameters encrypted with the default
      # Amazon Web Services managed key can be updated to use a customer managed key instead. For KMS key
      # definitions, see KMS concepts in the Key Management Service Developer Guide . While you can share a
      # parameter using the Systems Manager PutResourcePolicy operation, we recommend using Resource Access
      # Manager (RAM) instead. This is because using PutResourcePolicy requires the extra step of promoting
      # the parameter to a standard RAM Resource Share using the RAM PromoteResourceShareCreatedFromPolicy
      # API operation. Otherwise, the parameter won't be returned by the Systems Manager DescribeParameters
      # API operation using the --shared option. For more information, see Sharing a parameter in the Amazon
      # Web Services Systems Manager User Guide
      def put_resource_policy(
        policy : String,
        resource_arn : String,
        policy_hash : String? = nil,
        policy_id : String? = nil
      ) : Types::PutResourcePolicyResponse
        input = Types::PutResourcePolicyRequest.new(policy: policy, resource_arn: resource_arn, policy_hash: policy_hash, policy_id: policy_id)
        put_resource_policy(input)
      end
      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Types::PutResourcePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutResourcePolicyResponse, "PutResourcePolicy")
      end

      # Defines the default patch baseline for the relevant operating system. To reset the Amazon Web
      # Services-predefined patch baseline as the default, specify the full patch baseline Amazon Resource
      # Name (ARN) as the baseline ID value. For example, for CentOS, specify
      # arn:aws:ssm:us-east-2:733109147000:patchbaseline/pb-0574b43a65ea646ed instead of
      # pb-0574b43a65ea646ed .
      def register_default_patch_baseline(
        baseline_id : String
      ) : Types::RegisterDefaultPatchBaselineResult
        input = Types::RegisterDefaultPatchBaselineRequest.new(baseline_id: baseline_id)
        register_default_patch_baseline(input)
      end
      def register_default_patch_baseline(input : Types::RegisterDefaultPatchBaselineRequest) : Types::RegisterDefaultPatchBaselineResult
        request = Protocol::JsonRpc.build_request(Model::REGISTER_DEFAULT_PATCH_BASELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterDefaultPatchBaselineResult, "RegisterDefaultPatchBaseline")
      end

      # Registers a patch baseline for a patch group.
      def register_patch_baseline_for_patch_group(
        baseline_id : String,
        patch_group : String
      ) : Types::RegisterPatchBaselineForPatchGroupResult
        input = Types::RegisterPatchBaselineForPatchGroupRequest.new(baseline_id: baseline_id, patch_group: patch_group)
        register_patch_baseline_for_patch_group(input)
      end
      def register_patch_baseline_for_patch_group(input : Types::RegisterPatchBaselineForPatchGroupRequest) : Types::RegisterPatchBaselineForPatchGroupResult
        request = Protocol::JsonRpc.build_request(Model::REGISTER_PATCH_BASELINE_FOR_PATCH_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterPatchBaselineForPatchGroupResult, "RegisterPatchBaselineForPatchGroup")
      end

      # Registers a target with a maintenance window.
      def register_target_with_maintenance_window(
        resource_type : String,
        targets : Array(Types::Target),
        window_id : String,
        client_token : String? = nil,
        description : String? = nil,
        name : String? = nil,
        owner_information : String? = nil
      ) : Types::RegisterTargetWithMaintenanceWindowResult
        input = Types::RegisterTargetWithMaintenanceWindowRequest.new(resource_type: resource_type, targets: targets, window_id: window_id, client_token: client_token, description: description, name: name, owner_information: owner_information)
        register_target_with_maintenance_window(input)
      end
      def register_target_with_maintenance_window(input : Types::RegisterTargetWithMaintenanceWindowRequest) : Types::RegisterTargetWithMaintenanceWindowResult
        request = Protocol::JsonRpc.build_request(Model::REGISTER_TARGET_WITH_MAINTENANCE_WINDOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterTargetWithMaintenanceWindowResult, "RegisterTargetWithMaintenanceWindow")
      end

      # Adds a new task to a maintenance window.
      def register_task_with_maintenance_window(
        task_arn : String,
        task_type : String,
        window_id : String,
        alarm_configuration : Types::AlarmConfiguration? = nil,
        client_token : String? = nil,
        cutoff_behavior : String? = nil,
        description : String? = nil,
        logging_info : Types::LoggingInfo? = nil,
        max_concurrency : String? = nil,
        max_errors : String? = nil,
        name : String? = nil,
        priority : Int32? = nil,
        service_role_arn : String? = nil,
        targets : Array(Types::Target)? = nil,
        task_invocation_parameters : Types::MaintenanceWindowTaskInvocationParameters? = nil,
        task_parameters : Hash(String, Types::MaintenanceWindowTaskParameterValueExpression)? = nil
      ) : Types::RegisterTaskWithMaintenanceWindowResult
        input = Types::RegisterTaskWithMaintenanceWindowRequest.new(task_arn: task_arn, task_type: task_type, window_id: window_id, alarm_configuration: alarm_configuration, client_token: client_token, cutoff_behavior: cutoff_behavior, description: description, logging_info: logging_info, max_concurrency: max_concurrency, max_errors: max_errors, name: name, priority: priority, service_role_arn: service_role_arn, targets: targets, task_invocation_parameters: task_invocation_parameters, task_parameters: task_parameters)
        register_task_with_maintenance_window(input)
      end
      def register_task_with_maintenance_window(input : Types::RegisterTaskWithMaintenanceWindowRequest) : Types::RegisterTaskWithMaintenanceWindowResult
        request = Protocol::JsonRpc.build_request(Model::REGISTER_TASK_WITH_MAINTENANCE_WINDOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterTaskWithMaintenanceWindowResult, "RegisterTaskWithMaintenanceWindow")
      end

      # Removes tag keys from the specified resource.
      def remove_tags_from_resource(
        resource_id : String,
        resource_type : String,
        tag_keys : Array(String)
      ) : Types::RemoveTagsFromResourceResult
        input = Types::RemoveTagsFromResourceRequest.new(resource_id: resource_id, resource_type: resource_type, tag_keys: tag_keys)
        remove_tags_from_resource(input)
      end
      def remove_tags_from_resource(input : Types::RemoveTagsFromResourceRequest) : Types::RemoveTagsFromResourceResult
        request = Protocol::JsonRpc.build_request(Model::REMOVE_TAGS_FROM_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RemoveTagsFromResourceResult, "RemoveTagsFromResource")
      end

      # ServiceSetting is an account-level setting for an Amazon Web Services service. This setting defines
      # how a user interacts with or uses a service or a feature of a service. For example, if an Amazon Web
      # Services service charges money to the account based on feature or service usage, then the Amazon Web
      # Services service team might create a default setting of "false". This means the user can't use this
      # feature unless they change the setting to "true" and intentionally opt in for a paid feature.
      # Services map a SettingId object to a setting value. Amazon Web Services services teams define the
      # default value for a SettingId . You can't create a new SettingId , but you can overwrite the default
      # value if you have the ssm:UpdateServiceSetting permission for the setting. Use the GetServiceSetting
      # API operation to view the current value. Use the UpdateServiceSetting API operation to change the
      # default setting. Reset the service setting for the account to the default value as provisioned by
      # the Amazon Web Services service team.
      def reset_service_setting(
        setting_id : String
      ) : Types::ResetServiceSettingResult
        input = Types::ResetServiceSettingRequest.new(setting_id: setting_id)
        reset_service_setting(input)
      end
      def reset_service_setting(input : Types::ResetServiceSettingRequest) : Types::ResetServiceSettingResult
        request = Protocol::JsonRpc.build_request(Model::RESET_SERVICE_SETTING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ResetServiceSettingResult, "ResetServiceSetting")
      end

      # Reconnects a session to a managed node after it has been disconnected. Connections can be resumed
      # for disconnected sessions, but not terminated sessions. This command is primarily for use by client
      # machines to automatically reconnect during intermittent network issues. It isn't intended for any
      # other use.
      def resume_session(
        session_id : String
      ) : Types::ResumeSessionResponse
        input = Types::ResumeSessionRequest.new(session_id: session_id)
        resume_session(input)
      end
      def resume_session(input : Types::ResumeSessionRequest) : Types::ResumeSessionResponse
        request = Protocol::JsonRpc.build_request(Model::RESUME_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ResumeSessionResponse, "ResumeSession")
      end

      # Sends a signal to an Automation execution to change the current behavior or status of the execution.
      def send_automation_signal(
        automation_execution_id : String,
        signal_type : String,
        payload : Hash(String, Array(String))? = nil
      ) : Types::SendAutomationSignalResult
        input = Types::SendAutomationSignalRequest.new(automation_execution_id: automation_execution_id, signal_type: signal_type, payload: payload)
        send_automation_signal(input)
      end
      def send_automation_signal(input : Types::SendAutomationSignalRequest) : Types::SendAutomationSignalResult
        request = Protocol::JsonRpc.build_request(Model::SEND_AUTOMATION_SIGNAL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendAutomationSignalResult, "SendAutomationSignal")
      end

      # Runs commands on one or more managed nodes.
      def send_command(
        document_name : String,
        alarm_configuration : Types::AlarmConfiguration? = nil,
        cloud_watch_output_config : Types::CloudWatchOutputConfig? = nil,
        comment : String? = nil,
        document_hash : String? = nil,
        document_hash_type : String? = nil,
        document_version : String? = nil,
        instance_ids : Array(String)? = nil,
        max_concurrency : String? = nil,
        max_errors : String? = nil,
        notification_config : Types::NotificationConfig? = nil,
        output_s3_bucket_name : String? = nil,
        output_s3_key_prefix : String? = nil,
        output_s3_region : String? = nil,
        parameters : Hash(String, Array(String))? = nil,
        service_role_arn : String? = nil,
        targets : Array(Types::Target)? = nil,
        timeout_seconds : Int32? = nil
      ) : Types::SendCommandResult
        input = Types::SendCommandRequest.new(document_name: document_name, alarm_configuration: alarm_configuration, cloud_watch_output_config: cloud_watch_output_config, comment: comment, document_hash: document_hash, document_hash_type: document_hash_type, document_version: document_version, instance_ids: instance_ids, max_concurrency: max_concurrency, max_errors: max_errors, notification_config: notification_config, output_s3_bucket_name: output_s3_bucket_name, output_s3_key_prefix: output_s3_key_prefix, output_s3_region: output_s3_region, parameters: parameters, service_role_arn: service_role_arn, targets: targets, timeout_seconds: timeout_seconds)
        send_command(input)
      end
      def send_command(input : Types::SendCommandRequest) : Types::SendCommandResult
        request = Protocol::JsonRpc.build_request(Model::SEND_COMMAND, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendCommandResult, "SendCommand")
      end

      # Starts the workflow for just-in-time node access sessions.
      def start_access_request(
        reason : String,
        targets : Array(Types::Target),
        tags : Array(Types::Tag)? = nil
      ) : Types::StartAccessRequestResponse
        input = Types::StartAccessRequestRequest.new(reason: reason, targets: targets, tags: tags)
        start_access_request(input)
      end
      def start_access_request(input : Types::StartAccessRequestRequest) : Types::StartAccessRequestResponse
        request = Protocol::JsonRpc.build_request(Model::START_ACCESS_REQUEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartAccessRequestResponse, "StartAccessRequest")
      end

      # Runs an association immediately and only one time. This operation can be helpful when
      # troubleshooting associations.
      def start_associations_once(
        association_ids : Array(String)
      ) : Types::StartAssociationsOnceResult
        input = Types::StartAssociationsOnceRequest.new(association_ids: association_ids)
        start_associations_once(input)
      end
      def start_associations_once(input : Types::StartAssociationsOnceRequest) : Types::StartAssociationsOnceResult
        request = Protocol::JsonRpc.build_request(Model::START_ASSOCIATIONS_ONCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartAssociationsOnceResult, "StartAssociationsOnce")
      end

      # Initiates execution of an Automation runbook.
      def start_automation_execution(
        document_name : String,
        alarm_configuration : Types::AlarmConfiguration? = nil,
        client_token : String? = nil,
        document_version : String? = nil,
        max_concurrency : String? = nil,
        max_errors : String? = nil,
        mode : String? = nil,
        parameters : Hash(String, Array(String))? = nil,
        tags : Array(Types::Tag)? = nil,
        target_locations : Array(Types::TargetLocation)? = nil,
        target_locations_url : String? = nil,
        target_maps : Array(Hash(String, Array(String)))? = nil,
        target_parameter_name : String? = nil,
        targets : Array(Types::Target)? = nil
      ) : Types::StartAutomationExecutionResult
        input = Types::StartAutomationExecutionRequest.new(document_name: document_name, alarm_configuration: alarm_configuration, client_token: client_token, document_version: document_version, max_concurrency: max_concurrency, max_errors: max_errors, mode: mode, parameters: parameters, tags: tags, target_locations: target_locations, target_locations_url: target_locations_url, target_maps: target_maps, target_parameter_name: target_parameter_name, targets: targets)
        start_automation_execution(input)
      end
      def start_automation_execution(input : Types::StartAutomationExecutionRequest) : Types::StartAutomationExecutionResult
        request = Protocol::JsonRpc.build_request(Model::START_AUTOMATION_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartAutomationExecutionResult, "StartAutomationExecution")
      end

      # Amazon Web Services Systems Manager Change Manager will no longer be open to new customers starting
      # November 7, 2025. If you would like to use Change Manager, sign up prior to that date. Existing
      # customers can continue to use the service as normal. For more information, see Amazon Web Services
      # Systems Manager Change Manager availability change . Creates a change request for Change Manager.
      # The Automation runbooks specified in the change request run only after all required approvals for
      # the change request have been received.
      def start_change_request_execution(
        document_name : String,
        runbooks : Array(Types::Runbook),
        auto_approve : Bool? = nil,
        change_details : String? = nil,
        change_request_name : String? = nil,
        client_token : String? = nil,
        document_version : String? = nil,
        parameters : Hash(String, Array(String))? = nil,
        scheduled_end_time : Time? = nil,
        scheduled_time : Time? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::StartChangeRequestExecutionResult
        input = Types::StartChangeRequestExecutionRequest.new(document_name: document_name, runbooks: runbooks, auto_approve: auto_approve, change_details: change_details, change_request_name: change_request_name, client_token: client_token, document_version: document_version, parameters: parameters, scheduled_end_time: scheduled_end_time, scheduled_time: scheduled_time, tags: tags)
        start_change_request_execution(input)
      end
      def start_change_request_execution(input : Types::StartChangeRequestExecutionRequest) : Types::StartChangeRequestExecutionResult
        request = Protocol::JsonRpc.build_request(Model::START_CHANGE_REQUEST_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartChangeRequestExecutionResult, "StartChangeRequestExecution")
      end

      # Initiates the process of creating a preview showing the effects that running a specified Automation
      # runbook would have on the targeted resources.
      def start_execution_preview(
        document_name : String,
        document_version : String? = nil,
        execution_inputs : Types::ExecutionInputs? = nil
      ) : Types::StartExecutionPreviewResponse
        input = Types::StartExecutionPreviewRequest.new(document_name: document_name, document_version: document_version, execution_inputs: execution_inputs)
        start_execution_preview(input)
      end
      def start_execution_preview(input : Types::StartExecutionPreviewRequest) : Types::StartExecutionPreviewResponse
        request = Protocol::JsonRpc.build_request(Model::START_EXECUTION_PREVIEW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartExecutionPreviewResponse, "StartExecutionPreview")
      end

      # Initiates a connection to a target (for example, a managed node) for a Session Manager session.
      # Returns a URL and token that can be used to open a WebSocket connection for sending input and
      # receiving outputs. Amazon Web Services CLI usage: start-session is an interactive command that
      # requires the Session Manager plugin to be installed on the client machine making the call. For
      # information, see Install the Session Manager plugin for the Amazon Web Services CLI in the Amazon
      # Web Services Systems Manager User Guide . Amazon Web Services Tools for PowerShell usage:
      # Start-SSMSession isn't currently supported by Amazon Web Services Tools for PowerShell on Windows
      # local machines.
      def start_session(
        target : String,
        document_name : String? = nil,
        parameters : Hash(String, Array(String))? = nil,
        reason : String? = nil
      ) : Types::StartSessionResponse
        input = Types::StartSessionRequest.new(target: target, document_name: document_name, parameters: parameters, reason: reason)
        start_session(input)
      end
      def start_session(input : Types::StartSessionRequest) : Types::StartSessionResponse
        request = Protocol::JsonRpc.build_request(Model::START_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartSessionResponse, "StartSession")
      end

      # Stop an Automation that is currently running.
      def stop_automation_execution(
        automation_execution_id : String,
        type : String? = nil
      ) : Types::StopAutomationExecutionResult
        input = Types::StopAutomationExecutionRequest.new(automation_execution_id: automation_execution_id, type: type)
        stop_automation_execution(input)
      end
      def stop_automation_execution(input : Types::StopAutomationExecutionRequest) : Types::StopAutomationExecutionResult
        request = Protocol::JsonRpc.build_request(Model::STOP_AUTOMATION_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopAutomationExecutionResult, "StopAutomationExecution")
      end

      # Permanently ends a session and closes the data connection between the Session Manager client and SSM
      # Agent on the managed node. A terminated session can't be resumed.
      def terminate_session(
        session_id : String
      ) : Types::TerminateSessionResponse
        input = Types::TerminateSessionRequest.new(session_id: session_id)
        terminate_session(input)
      end
      def terminate_session(input : Types::TerminateSessionRequest) : Types::TerminateSessionResponse
        request = Protocol::JsonRpc.build_request(Model::TERMINATE_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TerminateSessionResponse, "TerminateSession")
      end

      # Remove a label or labels from a parameter. Parameter names can't contain spaces. The service removes
      # any spaces specified for the beginning or end of a parameter name. If the specified name for a
      # parameter contains spaces between characters, the request fails with a ValidationException error.
      def unlabel_parameter_version(
        labels : Array(String),
        name : String,
        parameter_version : Int64
      ) : Types::UnlabelParameterVersionResult
        input = Types::UnlabelParameterVersionRequest.new(labels: labels, name: name, parameter_version: parameter_version)
        unlabel_parameter_version(input)
      end
      def unlabel_parameter_version(input : Types::UnlabelParameterVersionRequest) : Types::UnlabelParameterVersionResult
        request = Protocol::JsonRpc.build_request(Model::UNLABEL_PARAMETER_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UnlabelParameterVersionResult, "UnlabelParameterVersion")
      end

      # Updates an association. You can update the association name and version, the document version,
      # schedule, parameters, and Amazon Simple Storage Service (Amazon S3) output. When you call
      # UpdateAssociation , the system removes all optional parameters from the request and overwrites the
      # association with null values for those parameters. This is by design. You must specify all optional
      # parameters in the call, even if you are not changing the parameters. This includes the Name
      # parameter. Before calling this API action, we recommend that you call the DescribeAssociation API
      # operation and make a note of all optional parameters required for your UpdateAssociation call. In
      # order to call this API operation, a user, group, or role must be granted permission to call the
      # DescribeAssociation API operation. If you don't have permission to call DescribeAssociation , then
      # you receive the following error: An error occurred (AccessDeniedException) when calling the
      # UpdateAssociation operation: User: &lt;user_arn&gt; isn't authorized to perform:
      # ssm:DescribeAssociation on resource: &lt;resource_arn&gt; When you update an association, the
      # association immediately runs against the specified targets. You can add the ApplyOnlyAtCronInterval
      # parameter to run the association during the next schedule run.
      def update_association(
        association_id : String,
        alarm_configuration : Types::AlarmConfiguration? = nil,
        apply_only_at_cron_interval : Bool? = nil,
        association_name : String? = nil,
        association_version : String? = nil,
        automation_target_parameter_name : String? = nil,
        calendar_names : Array(String)? = nil,
        compliance_severity : String? = nil,
        document_version : String? = nil,
        duration : Int32? = nil,
        max_concurrency : String? = nil,
        max_errors : String? = nil,
        name : String? = nil,
        output_location : Types::InstanceAssociationOutputLocation? = nil,
        parameters : Hash(String, Array(String))? = nil,
        schedule_expression : String? = nil,
        schedule_offset : Int32? = nil,
        sync_compliance : String? = nil,
        target_locations : Array(Types::TargetLocation)? = nil,
        target_maps : Array(Hash(String, Array(String)))? = nil,
        targets : Array(Types::Target)? = nil
      ) : Types::UpdateAssociationResult
        input = Types::UpdateAssociationRequest.new(association_id: association_id, alarm_configuration: alarm_configuration, apply_only_at_cron_interval: apply_only_at_cron_interval, association_name: association_name, association_version: association_version, automation_target_parameter_name: automation_target_parameter_name, calendar_names: calendar_names, compliance_severity: compliance_severity, document_version: document_version, duration: duration, max_concurrency: max_concurrency, max_errors: max_errors, name: name, output_location: output_location, parameters: parameters, schedule_expression: schedule_expression, schedule_offset: schedule_offset, sync_compliance: sync_compliance, target_locations: target_locations, target_maps: target_maps, targets: targets)
        update_association(input)
      end
      def update_association(input : Types::UpdateAssociationRequest) : Types::UpdateAssociationResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ASSOCIATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAssociationResult, "UpdateAssociation")
      end

      # Updates the status of the Amazon Web Services Systems Manager document (SSM document) associated
      # with the specified managed node. UpdateAssociationStatus is primarily used by the Amazon Web
      # Services Systems Manager Agent (SSM Agent) to report status updates about your associations and is
      # only used for associations created with the InstanceId legacy parameter.
      def update_association_status(
        association_status : Types::AssociationStatus,
        instance_id : String,
        name : String
      ) : Types::UpdateAssociationStatusResult
        input = Types::UpdateAssociationStatusRequest.new(association_status: association_status, instance_id: instance_id, name: name)
        update_association_status(input)
      end
      def update_association_status(input : Types::UpdateAssociationStatusRequest) : Types::UpdateAssociationStatusResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ASSOCIATION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAssociationStatusResult, "UpdateAssociationStatus")
      end

      # Updates one or more values for an SSM document.
      def update_document(
        content : String,
        name : String,
        attachments : Array(Types::AttachmentsSource)? = nil,
        display_name : String? = nil,
        document_format : String? = nil,
        document_version : String? = nil,
        target_type : String? = nil,
        version_name : String? = nil
      ) : Types::UpdateDocumentResult
        input = Types::UpdateDocumentRequest.new(content: content, name: name, attachments: attachments, display_name: display_name, document_format: document_format, document_version: document_version, target_type: target_type, version_name: version_name)
        update_document(input)
      end
      def update_document(input : Types::UpdateDocumentRequest) : Types::UpdateDocumentResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DOCUMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDocumentResult, "UpdateDocument")
      end

      # Set the default version of a document. If you change a document version for a State Manager
      # association, Systems Manager immediately runs the association unless you previously specifed the
      # apply-only-at-cron-interval parameter.
      def update_document_default_version(
        document_version : String,
        name : String
      ) : Types::UpdateDocumentDefaultVersionResult
        input = Types::UpdateDocumentDefaultVersionRequest.new(document_version: document_version, name: name)
        update_document_default_version(input)
      end
      def update_document_default_version(input : Types::UpdateDocumentDefaultVersionRequest) : Types::UpdateDocumentDefaultVersionResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DOCUMENT_DEFAULT_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDocumentDefaultVersionResult, "UpdateDocumentDefaultVersion")
      end

      # Amazon Web Services Systems Manager Change Manager will no longer be open to new customers starting
      # November 7, 2025. If you would like to use Change Manager, sign up prior to that date. Existing
      # customers can continue to use the service as normal. For more information, see Amazon Web Services
      # Systems Manager Change Manager availability change . Updates information related to approval reviews
      # for a specific version of a change template in Change Manager.
      def update_document_metadata(
        document_reviews : Types::DocumentReviews,
        name : String,
        document_version : String? = nil
      ) : Types::UpdateDocumentMetadataResponse
        input = Types::UpdateDocumentMetadataRequest.new(document_reviews: document_reviews, name: name, document_version: document_version)
        update_document_metadata(input)
      end
      def update_document_metadata(input : Types::UpdateDocumentMetadataRequest) : Types::UpdateDocumentMetadataResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DOCUMENT_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDocumentMetadataResponse, "UpdateDocumentMetadata")
      end

      # Updates an existing maintenance window. Only specified parameters are modified. The value you
      # specify for Duration determines the specific end time for the maintenance window based on the time
      # it begins. No maintenance window tasks are permitted to start after the resulting endtime minus the
      # number of hours you specify for Cutoff . For example, if the maintenance window starts at 3 PM, the
      # duration is three hours, and the value you specify for Cutoff is one hour, no maintenance window
      # tasks can start after 5 PM.
      def update_maintenance_window(
        window_id : String,
        allow_unassociated_targets : Bool? = nil,
        cutoff : Int32? = nil,
        description : String? = nil,
        duration : Int32? = nil,
        enabled : Bool? = nil,
        end_date : String? = nil,
        name : String? = nil,
        replace : Bool? = nil,
        schedule : String? = nil,
        schedule_offset : Int32? = nil,
        schedule_timezone : String? = nil,
        start_date : String? = nil
      ) : Types::UpdateMaintenanceWindowResult
        input = Types::UpdateMaintenanceWindowRequest.new(window_id: window_id, allow_unassociated_targets: allow_unassociated_targets, cutoff: cutoff, description: description, duration: duration, enabled: enabled, end_date: end_date, name: name, replace: replace, schedule: schedule, schedule_offset: schedule_offset, schedule_timezone: schedule_timezone, start_date: start_date)
        update_maintenance_window(input)
      end
      def update_maintenance_window(input : Types::UpdateMaintenanceWindowRequest) : Types::UpdateMaintenanceWindowResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MAINTENANCE_WINDOW, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateMaintenanceWindowResult, "UpdateMaintenanceWindow")
      end

      # Modifies the target of an existing maintenance window. You can change the following: Name
      # Description Owner IDs for an ID target Tags for a Tag target From any supported tag type to another.
      # The three supported tag types are ID target, Tag target, and resource group. For more information,
      # see Target . If a parameter is null, then the corresponding field isn't modified.
      def update_maintenance_window_target(
        window_id : String,
        window_target_id : String,
        description : String? = nil,
        name : String? = nil,
        owner_information : String? = nil,
        replace : Bool? = nil,
        targets : Array(Types::Target)? = nil
      ) : Types::UpdateMaintenanceWindowTargetResult
        input = Types::UpdateMaintenanceWindowTargetRequest.new(window_id: window_id, window_target_id: window_target_id, description: description, name: name, owner_information: owner_information, replace: replace, targets: targets)
        update_maintenance_window_target(input)
      end
      def update_maintenance_window_target(input : Types::UpdateMaintenanceWindowTargetRequest) : Types::UpdateMaintenanceWindowTargetResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MAINTENANCE_WINDOW_TARGET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateMaintenanceWindowTargetResult, "UpdateMaintenanceWindowTarget")
      end

      # Modifies a task assigned to a maintenance window. You can't change the task type, but you can change
      # the following values: TaskARN . For example, you can change a RUN_COMMAND task from
      # AWS-RunPowerShellScript to AWS-RunShellScript . ServiceRoleArn TaskInvocationParameters Priority
      # MaxConcurrency MaxErrors One or more targets must be specified for maintenance window Run
      # Command-type tasks. Depending on the task, targets are optional for other maintenance window task
      # types (Automation, Lambda, and Step Functions). For more information about running tasks that don't
      # specify targets, see Registering maintenance window tasks without targets in the Amazon Web Services
      # Systems Manager User Guide . If the value for a parameter in UpdateMaintenanceWindowTask is null,
      # then the corresponding field isn't modified. If you set Replace to true, then all fields required by
      # the RegisterTaskWithMaintenanceWindow operation are required for this request. Optional fields that
      # aren't specified are set to null. When you update a maintenance window task that has options
      # specified in TaskInvocationParameters , you must provide again all the TaskInvocationParameters
      # values that you want to retain. The values you don't specify again are removed. For example, suppose
      # that when you registered a Run Command task, you specified TaskInvocationParameters values for
      # Comment , NotificationConfig , and OutputS3BucketName . If you update the maintenance window task
      # and specify only a different OutputS3BucketName value, the values for Comment and NotificationConfig
      # are removed.
      def update_maintenance_window_task(
        window_id : String,
        window_task_id : String,
        alarm_configuration : Types::AlarmConfiguration? = nil,
        cutoff_behavior : String? = nil,
        description : String? = nil,
        logging_info : Types::LoggingInfo? = nil,
        max_concurrency : String? = nil,
        max_errors : String? = nil,
        name : String? = nil,
        priority : Int32? = nil,
        replace : Bool? = nil,
        service_role_arn : String? = nil,
        targets : Array(Types::Target)? = nil,
        task_arn : String? = nil,
        task_invocation_parameters : Types::MaintenanceWindowTaskInvocationParameters? = nil,
        task_parameters : Hash(String, Types::MaintenanceWindowTaskParameterValueExpression)? = nil
      ) : Types::UpdateMaintenanceWindowTaskResult
        input = Types::UpdateMaintenanceWindowTaskRequest.new(window_id: window_id, window_task_id: window_task_id, alarm_configuration: alarm_configuration, cutoff_behavior: cutoff_behavior, description: description, logging_info: logging_info, max_concurrency: max_concurrency, max_errors: max_errors, name: name, priority: priority, replace: replace, service_role_arn: service_role_arn, targets: targets, task_arn: task_arn, task_invocation_parameters: task_invocation_parameters, task_parameters: task_parameters)
        update_maintenance_window_task(input)
      end
      def update_maintenance_window_task(input : Types::UpdateMaintenanceWindowTaskRequest) : Types::UpdateMaintenanceWindowTaskResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MAINTENANCE_WINDOW_TASK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateMaintenanceWindowTaskResult, "UpdateMaintenanceWindowTask")
      end

      # Changes the Identity and Access Management (IAM) role that is assigned to the on-premises server,
      # edge device, or virtual machines (VM). IAM roles are first assigned to these hybrid nodes during the
      # activation process. For more information, see CreateActivation .
      def update_managed_instance_role(
        iam_role : String,
        instance_id : String
      ) : Types::UpdateManagedInstanceRoleResult
        input = Types::UpdateManagedInstanceRoleRequest.new(iam_role: iam_role, instance_id: instance_id)
        update_managed_instance_role(input)
      end
      def update_managed_instance_role(input : Types::UpdateManagedInstanceRoleRequest) : Types::UpdateManagedInstanceRoleResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MANAGED_INSTANCE_ROLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateManagedInstanceRoleResult, "UpdateManagedInstanceRole")
      end

      # Edit or change an OpsItem. You must have permission in Identity and Access Management (IAM) to
      # update an OpsItem. For more information, see Set up OpsCenter in the Amazon Web Services Systems
      # Manager User Guide . Operations engineers and IT professionals use Amazon Web Services Systems
      # Manager OpsCenter to view, investigate, and remediate operational issues impacting the performance
      # and health of their Amazon Web Services resources. For more information, see Amazon Web Services
      # Systems Manager OpsCenter in the Amazon Web Services Systems Manager User Guide .
      def update_ops_item(
        ops_item_id : String,
        actual_end_time : Time? = nil,
        actual_start_time : Time? = nil,
        category : String? = nil,
        description : String? = nil,
        notifications : Array(Types::OpsItemNotification)? = nil,
        operational_data : Hash(String, Types::OpsItemDataValue)? = nil,
        operational_data_to_delete : Array(String)? = nil,
        ops_item_arn : String? = nil,
        planned_end_time : Time? = nil,
        planned_start_time : Time? = nil,
        priority : Int32? = nil,
        related_ops_items : Array(Types::RelatedOpsItem)? = nil,
        severity : String? = nil,
        status : String? = nil,
        title : String? = nil
      ) : Types::UpdateOpsItemResponse
        input = Types::UpdateOpsItemRequest.new(ops_item_id: ops_item_id, actual_end_time: actual_end_time, actual_start_time: actual_start_time, category: category, description: description, notifications: notifications, operational_data: operational_data, operational_data_to_delete: operational_data_to_delete, ops_item_arn: ops_item_arn, planned_end_time: planned_end_time, planned_start_time: planned_start_time, priority: priority, related_ops_items: related_ops_items, severity: severity, status: status, title: title)
        update_ops_item(input)
      end
      def update_ops_item(input : Types::UpdateOpsItemRequest) : Types::UpdateOpsItemResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_OPS_ITEM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateOpsItemResponse, "UpdateOpsItem")
      end

      # Amazon Web Services Systems Manager calls this API operation when you edit OpsMetadata in
      # Application Manager.
      def update_ops_metadata(
        ops_metadata_arn : String,
        keys_to_delete : Array(String)? = nil,
        metadata_to_update : Hash(String, Types::MetadataValue)? = nil
      ) : Types::UpdateOpsMetadataResult
        input = Types::UpdateOpsMetadataRequest.new(ops_metadata_arn: ops_metadata_arn, keys_to_delete: keys_to_delete, metadata_to_update: metadata_to_update)
        update_ops_metadata(input)
      end
      def update_ops_metadata(input : Types::UpdateOpsMetadataRequest) : Types::UpdateOpsMetadataResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_OPS_METADATA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateOpsMetadataResult, "UpdateOpsMetadata")
      end

      # Modifies an existing patch baseline. Fields not specified in the request are left unchanged. For
      # information about valid key-value pairs in PatchFilters for each supported operating system type,
      # see PatchFilter .
      def update_patch_baseline(
        baseline_id : String,
        approval_rules : Types::PatchRuleGroup? = nil,
        approved_patches : Array(String)? = nil,
        approved_patches_compliance_level : String? = nil,
        approved_patches_enable_non_security : Bool? = nil,
        available_security_updates_compliance_status : String? = nil,
        description : String? = nil,
        global_filters : Types::PatchFilterGroup? = nil,
        name : String? = nil,
        rejected_patches : Array(String)? = nil,
        rejected_patches_action : String? = nil,
        replace : Bool? = nil,
        sources : Array(Types::PatchSource)? = nil
      ) : Types::UpdatePatchBaselineResult
        input = Types::UpdatePatchBaselineRequest.new(baseline_id: baseline_id, approval_rules: approval_rules, approved_patches: approved_patches, approved_patches_compliance_level: approved_patches_compliance_level, approved_patches_enable_non_security: approved_patches_enable_non_security, available_security_updates_compliance_status: available_security_updates_compliance_status, description: description, global_filters: global_filters, name: name, rejected_patches: rejected_patches, rejected_patches_action: rejected_patches_action, replace: replace, sources: sources)
        update_patch_baseline(input)
      end
      def update_patch_baseline(input : Types::UpdatePatchBaselineRequest) : Types::UpdatePatchBaselineResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PATCH_BASELINE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePatchBaselineResult, "UpdatePatchBaseline")
      end

      # Update a resource data sync. After you create a resource data sync for a Region, you can't change
      # the account options for that sync. For example, if you create a sync in the us-east-2 (Ohio) Region
      # and you choose the Include only the current account option, you can't edit that sync later and
      # choose the Include all accounts from my Organizations configuration option. Instead, you must delete
      # the first resource data sync, and create a new one. This API operation only supports a resource data
      # sync that was created with a SyncFromSource SyncType .
      def update_resource_data_sync(
        sync_name : String,
        sync_source : Types::ResourceDataSyncSource,
        sync_type : String
      ) : Types::UpdateResourceDataSyncResult
        input = Types::UpdateResourceDataSyncRequest.new(sync_name: sync_name, sync_source: sync_source, sync_type: sync_type)
        update_resource_data_sync(input)
      end
      def update_resource_data_sync(input : Types::UpdateResourceDataSyncRequest) : Types::UpdateResourceDataSyncResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_RESOURCE_DATA_SYNC, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateResourceDataSyncResult, "UpdateResourceDataSync")
      end

      # ServiceSetting is an account-level setting for an Amazon Web Services service. This setting defines
      # how a user interacts with or uses a service or a feature of a service. For example, if an Amazon Web
      # Services service charges money to the account based on feature or service usage, then the Amazon Web
      # Services service team might create a default setting of "false". This means the user can't use this
      # feature unless they change the setting to "true" and intentionally opt in for a paid feature.
      # Services map a SettingId object to a setting value. Amazon Web Services services teams define the
      # default value for a SettingId . You can't create a new SettingId , but you can overwrite the default
      # value if you have the ssm:UpdateServiceSetting permission for the setting. Use the GetServiceSetting
      # API operation to view the current value. Or, use the ResetServiceSetting to change the value back to
      # the original value defined by the Amazon Web Services service team. Update the service setting for
      # the account.
      def update_service_setting(
        setting_id : String,
        setting_value : String
      ) : Types::UpdateServiceSettingResult
        input = Types::UpdateServiceSettingRequest.new(setting_id: setting_id, setting_value: setting_value)
        update_service_setting(input)
      end
      def update_service_setting(input : Types::UpdateServiceSettingRequest) : Types::UpdateServiceSettingResult
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SERVICE_SETTING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateServiceSettingResult, "UpdateServiceSetting")
      end
    end
  end
end
