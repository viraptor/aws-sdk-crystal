module Aws
  module SupplyChain
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

      # CreateBillOfMaterialsImportJob creates an import job for the Product Bill Of Materials (BOM) entity.
      # For information on the product_bom entity, see the AWS Supply Chain User Guide. The CSV file must be
      # located in an Amazon S3 location accessible to AWS Supply Chain. It is recommended to use the same
      # Amazon S3 bucket created during your AWS Supply Chain instance creation.

      def create_bill_of_materials_import_job(
        instance_id : String,
        s3uri : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateBillOfMaterialsImportJobRequest.new(instance_id: instance_id, s3uri: s3uri, client_token: client_token)
        create_bill_of_materials_import_job(input)
      end

      def create_bill_of_materials_import_job(input : Types::CreateBillOfMaterialsImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BILL_OF_MATERIALS_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to programmatically create a data pipeline to ingest data from source systems such as
      # Amazon S3 buckets, to a predefined Amazon Web Services Supply Chain dataset (product, inbound_order)
      # or a temporary dataset along with the data transformation query provided with the API.

      def create_data_integration_flow(
        instance_id : String,
        name : String,
        sources : Array(Types::DataIntegrationFlowSource),
        target : Types::DataIntegrationFlowTarget,
        transformation : Types::DataIntegrationFlowTransformation,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDataIntegrationFlowRequest.new(instance_id: instance_id, name: name, sources: sources, target: target, transformation: transformation, tags: tags)
        create_data_integration_flow(input)
      end

      def create_data_integration_flow(input : Types::CreateDataIntegrationFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_INTEGRATION_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to programmatically create an Amazon Web Services Supply Chain data lake dataset.
      # Developers can create the datasets using their pre-defined or custom schema for a given instance ID,
      # namespace, and dataset name.

      def create_data_lake_dataset(
        instance_id : String,
        name : String,
        namespace : String,
        description : String? = nil,
        partition_spec : Types::DataLakeDatasetPartitionSpec? = nil,
        schema : Types::DataLakeDatasetSchema? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDataLakeDatasetRequest.new(instance_id: instance_id, name: name, namespace: namespace, description: description, partition_spec: partition_spec, schema: schema, tags: tags)
        create_data_lake_dataset(input)
      end

      def create_data_lake_dataset(input : Types::CreateDataLakeDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_LAKE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to programmatically create an Amazon Web Services Supply Chain data lake namespace.
      # Developers can create the namespaces for a given instance ID.

      def create_data_lake_namespace(
        instance_id : String,
        name : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDataLakeNamespaceRequest.new(instance_id: instance_id, name: name, description: description, tags: tags)
        create_data_lake_namespace(input)
      end

      def create_data_lake_namespace(input : Types::CreateDataLakeNamespaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_LAKE_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to programmatically create an Amazon Web Services Supply Chain instance by applying KMS
      # keys and relevant information associated with the API without using the Amazon Web Services console.
      # This is an asynchronous operation. Upon receiving a CreateInstance request, Amazon Web Services
      # Supply Chain immediately returns the instance resource, instance ID, and the initializing state
      # while simultaneously creating all required Amazon Web Services resources for an instance creation.
      # You can use GetInstance to check the status of the instance. If the instance results in an unhealthy
      # state, you need to check the error message, delete the current instance, and recreate a new one
      # based on the mitigation from the error message.

      def create_instance(
        client_token : String? = nil,
        instance_description : String? = nil,
        instance_name : String? = nil,
        kms_key_arn : String? = nil,
        tags : Hash(String, String)? = nil,
        web_app_dns_domain : String? = nil
      ) : Protocol::Request
        input = Types::CreateInstanceRequest.new(client_token: client_token, instance_description: instance_description, instance_name: instance_name, kms_key_arn: kms_key_arn, tags: tags, web_app_dns_domain: web_app_dns_domain)
        create_instance(input)
      end

      def create_instance(input : Types::CreateInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enable you to programmatically delete an existing data pipeline for the provided Amazon Web Services
      # Supply Chain instance and DataIntegrationFlow name.

      def delete_data_integration_flow(
        instance_id : String,
        name : String
      ) : Protocol::Request
        input = Types::DeleteDataIntegrationFlowRequest.new(instance_id: instance_id, name: name)
        delete_data_integration_flow(input)
      end

      def delete_data_integration_flow(input : Types::DeleteDataIntegrationFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_INTEGRATION_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to programmatically delete an Amazon Web Services Supply Chain data lake dataset.
      # Developers can delete the existing datasets for a given instance ID, namespace, and instance name.

      def delete_data_lake_dataset(
        instance_id : String,
        name : String,
        namespace : String
      ) : Protocol::Request
        input = Types::DeleteDataLakeDatasetRequest.new(instance_id: instance_id, name: name, namespace: namespace)
        delete_data_lake_dataset(input)
      end

      def delete_data_lake_dataset(input : Types::DeleteDataLakeDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_LAKE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to programmatically delete an Amazon Web Services Supply Chain data lake namespace and
      # its underling datasets. Developers can delete the existing namespaces for a given instance ID and
      # namespace name.

      def delete_data_lake_namespace(
        instance_id : String,
        name : String
      ) : Protocol::Request
        input = Types::DeleteDataLakeNamespaceRequest.new(instance_id: instance_id, name: name)
        delete_data_lake_namespace(input)
      end

      def delete_data_lake_namespace(input : Types::DeleteDataLakeNamespaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_LAKE_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to programmatically delete an Amazon Web Services Supply Chain instance by deleting the
      # KMS keys and relevant information associated with the API without using the Amazon Web Services
      # console. This is an asynchronous operation. Upon receiving a DeleteInstance request, Amazon Web
      # Services Supply Chain immediately returns a response with the instance resource, delete state while
      # cleaning up all Amazon Web Services resources created during the instance creation process. You can
      # use the GetInstance action to check the instance status.

      def delete_instance(
        instance_id : String
      ) : Protocol::Request
        input = Types::DeleteInstanceRequest.new(instance_id: instance_id)
        delete_instance(input)
      end

      def delete_instance(input : Types::DeleteInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get status and details of a BillOfMaterialsImportJob.

      def get_bill_of_materials_import_job(
        instance_id : String,
        job_id : String
      ) : Protocol::Request
        input = Types::GetBillOfMaterialsImportJobRequest.new(instance_id: instance_id, job_id: job_id)
        get_bill_of_materials_import_job(input)
      end

      def get_bill_of_materials_import_job(input : Types::GetBillOfMaterialsImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BILL_OF_MATERIALS_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to programmatically view an Amazon Web Services Supply Chain Data Integration Event.
      # Developers can view the eventType, eventGroupId, eventTimestamp, datasetTarget,
      # datasetLoadExecution.

      def get_data_integration_event(
        event_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::GetDataIntegrationEventRequest.new(event_id: event_id, instance_id: instance_id)
        get_data_integration_event(input)
      end

      def get_data_integration_event(input : Types::GetDataIntegrationEventRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_INTEGRATION_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to programmatically view a specific data pipeline for the provided Amazon Web Services
      # Supply Chain instance and DataIntegrationFlow name.

      def get_data_integration_flow(
        instance_id : String,
        name : String
      ) : Protocol::Request
        input = Types::GetDataIntegrationFlowRequest.new(instance_id: instance_id, name: name)
        get_data_integration_flow(input)
      end

      def get_data_integration_flow(input : Types::GetDataIntegrationFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_INTEGRATION_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the flow execution.

      def get_data_integration_flow_execution(
        execution_id : String,
        flow_name : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::GetDataIntegrationFlowExecutionRequest.new(execution_id: execution_id, flow_name: flow_name, instance_id: instance_id)
        get_data_integration_flow_execution(input)
      end

      def get_data_integration_flow_execution(input : Types::GetDataIntegrationFlowExecutionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_INTEGRATION_FLOW_EXECUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to programmatically view an Amazon Web Services Supply Chain data lake dataset.
      # Developers can view the data lake dataset information such as namespace, schema, and so on for a
      # given instance ID, namespace, and dataset name.

      def get_data_lake_dataset(
        instance_id : String,
        name : String,
        namespace : String
      ) : Protocol::Request
        input = Types::GetDataLakeDatasetRequest.new(instance_id: instance_id, name: name, namespace: namespace)
        get_data_lake_dataset(input)
      end

      def get_data_lake_dataset(input : Types::GetDataLakeDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_LAKE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to programmatically view an Amazon Web Services Supply Chain data lake namespace.
      # Developers can view the data lake namespace information such as description for a given instance ID
      # and namespace name.

      def get_data_lake_namespace(
        instance_id : String,
        name : String
      ) : Protocol::Request
        input = Types::GetDataLakeNamespaceRequest.new(instance_id: instance_id, name: name)
        get_data_lake_namespace(input)
      end

      def get_data_lake_namespace(input : Types::GetDataLakeNamespaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_LAKE_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to programmatically retrieve the information related to an Amazon Web Services Supply
      # Chain instance ID.

      def get_instance(
        instance_id : String
      ) : Protocol::Request
        input = Types::GetInstanceRequest.new(instance_id: instance_id)
        get_instance(input)
      end

      def get_instance(input : Types::GetInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to programmatically list all data integration events for the provided Amazon Web
      # Services Supply Chain instance.

      def list_data_integration_events(
        instance_id : String,
        event_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataIntegrationEventsRequest.new(instance_id: instance_id, event_type: event_type, max_results: max_results, next_token: next_token)
        list_data_integration_events(input)
      end

      def list_data_integration_events(input : Types::ListDataIntegrationEventsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_INTEGRATION_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List flow executions.

      def list_data_integration_flow_executions(
        flow_name : String,
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataIntegrationFlowExecutionsRequest.new(flow_name: flow_name, instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_data_integration_flow_executions(input)
      end

      def list_data_integration_flow_executions(input : Types::ListDataIntegrationFlowExecutionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_INTEGRATION_FLOW_EXECUTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to programmatically list all data pipelines for the provided Amazon Web Services Supply
      # Chain instance.

      def list_data_integration_flows(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataIntegrationFlowsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_data_integration_flows(input)
      end

      def list_data_integration_flows(input : Types::ListDataIntegrationFlowsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_INTEGRATION_FLOWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to programmatically view the list of Amazon Web Services Supply Chain data lake
      # datasets. Developers can view the datasets and the corresponding information such as namespace,
      # schema, and so on for a given instance ID and namespace.

      def list_data_lake_datasets(
        instance_id : String,
        namespace : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataLakeDatasetsRequest.new(instance_id: instance_id, namespace: namespace, max_results: max_results, next_token: next_token)
        list_data_lake_datasets(input)
      end

      def list_data_lake_datasets(input : Types::ListDataLakeDatasetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_LAKE_DATASETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to programmatically view the list of Amazon Web Services Supply Chain data lake
      # namespaces. Developers can view the namespaces and the corresponding information such as description
      # for a given instance ID. Note that this API only return custom namespaces, instance pre-defined
      # namespaces are not included.

      def list_data_lake_namespaces(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataLakeNamespacesRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_data_lake_namespaces(input)
      end

      def list_data_lake_namespaces(input : Types::ListDataLakeNamespacesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_LAKE_NAMESPACES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all Amazon Web Services Supply Chain instances for a specific account. Enables you to
      # programmatically list all Amazon Web Services Supply Chain instances based on their account ID,
      # instance name, and state of the instance (active or delete).

      def list_instances(
        instance_name_filter : Array(String)? = nil,
        instance_state_filter : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInstancesRequest.new(instance_name_filter: instance_name_filter, instance_state_filter: instance_state_filter, max_results: max_results, next_token: next_token)
        list_instances(input)
      end

      def list_instances(input : Types::ListInstancesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INSTANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all the tags for an Amazon Web ServicesSupply Chain resource. You can list all the tags added
      # to a resource. By listing the tags, developers can view the tag level information on a resource and
      # perform actions such as, deleting a resource associated with a particular tag.

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

      # Send the data payload for the event with real-time data for analysis or monitoring. The real-time
      # data events are stored in an Amazon Web Services service before being processed and stored in data
      # lake.

      def send_data_integration_event(
        data : String,
        event_group_id : String,
        event_type : String,
        instance_id : String,
        client_token : String? = nil,
        dataset_target : Types::DataIntegrationEventDatasetTargetConfiguration? = nil,
        event_timestamp : Time? = nil
      ) : Protocol::Request
        input = Types::SendDataIntegrationEventRequest.new(data: data, event_group_id: event_group_id, event_type: event_type, instance_id: instance_id, client_token: client_token, dataset_target: dataset_target, event_timestamp: event_timestamp)
        send_data_integration_event(input)
      end

      def send_data_integration_event(input : Types::SendDataIntegrationEventRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_DATA_INTEGRATION_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # You can create tags during or after creating a resource such as instance, data flow, or dataset in
      # AWS Supply chain. During the data ingestion process, you can add tags such as dev, test, or prod to
      # data flows created during the data ingestion process in the AWS Supply Chain datasets. You can use
      # these tags to identify a group of resources or a single resource used by the developer.

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

      # You can delete tags for an Amazon Web Services Supply chain resource such as instance, data flow, or
      # dataset in AWS Supply Chain. During the data ingestion process, you can delete tags such as dev,
      # test, or prod to data flows created during the data ingestion process in the AWS Supply Chain
      # datasets.

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

      # Enables you to programmatically update an existing data pipeline to ingest data from the source
      # systems such as, Amazon S3 buckets, to a predefined Amazon Web Services Supply Chain dataset
      # (product, inbound_order) or a temporary dataset along with the data transformation query provided
      # with the API.

      def update_data_integration_flow(
        instance_id : String,
        name : String,
        sources : Array(Types::DataIntegrationFlowSource)? = nil,
        target : Types::DataIntegrationFlowTarget? = nil,
        transformation : Types::DataIntegrationFlowTransformation? = nil
      ) : Protocol::Request
        input = Types::UpdateDataIntegrationFlowRequest.new(instance_id: instance_id, name: name, sources: sources, target: target, transformation: transformation)
        update_data_integration_flow(input)
      end

      def update_data_integration_flow(input : Types::UpdateDataIntegrationFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_INTEGRATION_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to programmatically update an Amazon Web Services Supply Chain data lake dataset.
      # Developers can update the description of a data lake dataset for a given instance ID, namespace, and
      # dataset name.

      def update_data_lake_dataset(
        instance_id : String,
        name : String,
        namespace : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDataLakeDatasetRequest.new(instance_id: instance_id, name: name, namespace: namespace, description: description)
        update_data_lake_dataset(input)
      end

      def update_data_lake_dataset(input : Types::UpdateDataLakeDatasetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_LAKE_DATASET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to programmatically update an Amazon Web Services Supply Chain data lake namespace.
      # Developers can update the description of a data lake namespace for a given instance ID and namespace
      # name.

      def update_data_lake_namespace(
        instance_id : String,
        name : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDataLakeNamespaceRequest.new(instance_id: instance_id, name: name, description: description)
        update_data_lake_namespace(input)
      end

      def update_data_lake_namespace(input : Types::UpdateDataLakeNamespaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_LAKE_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables you to programmatically update an Amazon Web Services Supply Chain instance description by
      # providing all the relevant information such as account ID, instance ID and so on without using the
      # AWS console.

      def update_instance(
        instance_id : String,
        instance_description : String? = nil,
        instance_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateInstanceRequest.new(instance_id: instance_id, instance_description: instance_description, instance_name: instance_name)
        update_instance(input)
      end

      def update_instance(input : Types::UpdateInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
