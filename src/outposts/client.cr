module Aws
  module Outposts
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

      # Cancels the capacity task.

      def cancel_capacity_task(
        capacity_task_id : String,
        outpost_identifier : String
      ) : Protocol::Request
        input = Types::CancelCapacityTaskInput.new(capacity_task_id: capacity_task_id, outpost_identifier: outpost_identifier)
        cancel_capacity_task(input)
      end

      def cancel_capacity_task(input : Types::CancelCapacityTaskInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_CAPACITY_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels the specified order for an Outpost.

      def cancel_order(
        order_id : String
      ) : Protocol::Request
        input = Types::CancelOrderInput.new(order_id: order_id)
        cancel_order(input)
      end

      def cancel_order(input : Types::CancelOrderInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_ORDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an order for an Outpost.

      def create_order(
        outpost_identifier : String,
        payment_option : String,
        line_items : Array(Types::LineItemRequest)? = nil,
        payment_term : String? = nil
      ) : Protocol::Request
        input = Types::CreateOrderInput.new(outpost_identifier: outpost_identifier, payment_option: payment_option, line_items: line_items, payment_term: payment_term)
        create_order(input)
      end

      def create_order(input : Types::CreateOrderInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ORDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Outpost. You can specify either an Availability one or an AZ ID.

      def create_outpost(
        name : String,
        site_id : String,
        availability_zone : String? = nil,
        availability_zone_id : String? = nil,
        description : String? = nil,
        supported_hardware_type : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateOutpostInput.new(name: name, site_id: site_id, availability_zone: availability_zone, availability_zone_id: availability_zone_id, description: description, supported_hardware_type: supported_hardware_type, tags: tags)
        create_outpost(input)
      end

      def create_outpost(input : Types::CreateOutpostInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_OUTPOST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a site for an Outpost.

      def create_site(
        name : String,
        description : String? = nil,
        notes : String? = nil,
        operating_address : Types::Address? = nil,
        rack_physical_properties : Types::RackPhysicalProperties? = nil,
        shipping_address : Types::Address? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSiteInput.new(name: name, description: description, notes: notes, operating_address: operating_address, rack_physical_properties: rack_physical_properties, shipping_address: shipping_address, tags: tags)
        create_site(input)
      end

      def create_site(input : Types::CreateSiteInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SITE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified Outpost.

      def delete_outpost(
        outpost_id : String
      ) : Protocol::Request
        input = Types::DeleteOutpostInput.new(outpost_id: outpost_id)
        delete_outpost(input)
      end

      def delete_outpost(input : Types::DeleteOutpostInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_OUTPOST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified site.

      def delete_site(
        site_id : String
      ) : Protocol::Request
        input = Types::DeleteSiteInput.new(site_id: site_id)
        delete_site(input)
      end

      def delete_site(input : Types::DeleteSiteInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SITE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details of the specified capacity task.

      def get_capacity_task(
        capacity_task_id : String,
        outpost_identifier : String
      ) : Protocol::Request
        input = Types::GetCapacityTaskInput.new(capacity_task_id: capacity_task_id, outpost_identifier: outpost_identifier)
        get_capacity_task(input)
      end

      def get_capacity_task(input : Types::GetCapacityTaskInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CAPACITY_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified catalog item.

      def get_catalog_item(
        catalog_item_id : String
      ) : Protocol::Request
        input = Types::GetCatalogItemInput.new(catalog_item_id: catalog_item_id)
        get_catalog_item(input)
      end

      def get_catalog_item(input : Types::GetCatalogItemInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CATALOG_ITEM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Amazon Web Services uses this action to install Outpost servers. Gets information about the
      # specified connection. Use CloudTrail to monitor this action or Amazon Web Services managed policy
      # for Amazon Web Services Outposts to secure it. For more information, see Amazon Web Services managed
      # policies for Amazon Web Services Outposts and Logging Amazon Web Services Outposts API calls with
      # Amazon Web Services CloudTrail in the Amazon Web Services Outposts User Guide .

      def get_connection(
        connection_id : String
      ) : Protocol::Request
        input = Types::GetConnectionRequest.new(connection_id: connection_id)
        get_connection(input)
      end

      def get_connection(input : Types::GetConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified order.

      def get_order(
        order_id : String
      ) : Protocol::Request
        input = Types::GetOrderInput.new(order_id: order_id)
        get_order(input)
      end

      def get_order(input : Types::GetOrderInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ORDER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified Outpost.

      def get_outpost(
        outpost_id : String
      ) : Protocol::Request
        input = Types::GetOutpostInput.new(outpost_id: outpost_id)
        get_outpost(input)
      end

      def get_outpost(input : Types::GetOutpostInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_OUTPOST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets current and historical billing information about the specified Outpost.

      def get_outpost_billing_information(
        outpost_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetOutpostBillingInformationInput.new(outpost_identifier: outpost_identifier, max_results: max_results, next_token: next_token)
        get_outpost_billing_information(input)
      end

      def get_outpost_billing_information(input : Types::GetOutpostBillingInformationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_OUTPOST_BILLING_INFORMATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the instance types for the specified Outpost.

      def get_outpost_instance_types(
        outpost_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetOutpostInstanceTypesInput.new(outpost_id: outpost_id, max_results: max_results, next_token: next_token)
        get_outpost_instance_types(input)
      end

      def get_outpost_instance_types(input : Types::GetOutpostInstanceTypesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_OUTPOST_INSTANCE_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the instance types that an Outpost can support in InstanceTypeCapacity . This will generally
      # include instance types that are not currently configured and therefore cannot be launched with the
      # current Outpost capacity configuration.

      def get_outpost_supported_instance_types(
        outpost_identifier : String,
        asset_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        order_id : String? = nil
      ) : Protocol::Request
        input = Types::GetOutpostSupportedInstanceTypesInput.new(outpost_identifier: outpost_identifier, asset_id: asset_id, max_results: max_results, next_token: next_token, order_id: order_id)
        get_outpost_supported_instance_types(input)
      end

      def get_outpost_supported_instance_types(input : Types::GetOutpostSupportedInstanceTypesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_OUTPOST_SUPPORTED_INSTANCE_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the specified Outpost site.

      def get_site(
        site_id : String
      ) : Protocol::Request
        input = Types::GetSiteInput.new(site_id: site_id)
        get_site(input)
      end

      def get_site(input : Types::GetSiteInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SITE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the site address of the specified site.

      def get_site_address(
        address_type : String,
        site_id : String
      ) : Protocol::Request
        input = Types::GetSiteAddressInput.new(address_type: address_type, site_id: site_id)
        get_site_address(input)
      end

      def get_site_address(input : Types::GetSiteAddressInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SITE_ADDRESS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A list of Amazon EC2 instances, belonging to all accounts, running on the specified Outpost. Does
      # not include Amazon EBS or Amazon S3 instances.

      def list_asset_instances(
        outpost_identifier : String,
        account_id_filter : Array(String)? = nil,
        asset_id_filter : Array(String)? = nil,
        aws_service_filter : Array(String)? = nil,
        instance_type_filter : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssetInstancesInput.new(outpost_identifier: outpost_identifier, account_id_filter: account_id_filter, asset_id_filter: asset_id_filter, aws_service_filter: aws_service_filter, instance_type_filter: instance_type_filter, max_results: max_results, next_token: next_token)
        list_asset_instances(input)
      end

      def list_asset_instances(input : Types::ListAssetInstancesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSET_INSTANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the hardware assets for the specified Outpost. Use filters to return specific results. If you
      # specify multiple filters, the results include only the resources that match all of the specified
      # filters. For a filter where you can specify multiple values, the results include items that match
      # any of the values that you specify for the filter.

      def list_assets(
        outpost_identifier : String,
        host_id_filter : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status_filter : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListAssetsInput.new(outpost_identifier: outpost_identifier, host_id_filter: host_id_filter, max_results: max_results, next_token: next_token, status_filter: status_filter)
        list_assets(input)
      end

      def list_assets(input : Types::ListAssetsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A list of Amazon EC2 instances running on the Outpost and belonging to the account that initiated
      # the capacity task. Use this list to specify the instances you cannot stop to free up capacity to run
      # the capacity task.

      def list_blocking_instances_for_capacity_task(
        capacity_task_id : String,
        outpost_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBlockingInstancesForCapacityTaskInput.new(capacity_task_id: capacity_task_id, outpost_identifier: outpost_identifier, max_results: max_results, next_token: next_token)
        list_blocking_instances_for_capacity_task(input)
      end

      def list_blocking_instances_for_capacity_task(input : Types::ListBlockingInstancesForCapacityTaskInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BLOCKING_INSTANCES_FOR_CAPACITY_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the capacity tasks for your Amazon Web Services account. Use filters to return specific
      # results. If you specify multiple filters, the results include only the resources that match all of
      # the specified filters. For a filter where you can specify multiple values, the results include items
      # that match any of the values that you specify for the filter.

      def list_capacity_tasks(
        capacity_task_status_filter : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        outpost_identifier_filter : String? = nil
      ) : Protocol::Request
        input = Types::ListCapacityTasksInput.new(capacity_task_status_filter: capacity_task_status_filter, max_results: max_results, next_token: next_token, outpost_identifier_filter: outpost_identifier_filter)
        list_capacity_tasks(input)
      end

      def list_capacity_tasks(input : Types::ListCapacityTasksInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CAPACITY_TASKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the items in the catalog. Use filters to return specific results. If you specify multiple
      # filters, the results include only the resources that match all of the specified filters. For a
      # filter where you can specify multiple values, the results include items that match any of the values
      # that you specify for the filter.

      def list_catalog_items(
        ec2_family_filter : Array(String)? = nil,
        item_class_filter : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        supported_storage_filter : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListCatalogItemsInput.new(ec2_family_filter: ec2_family_filter, item_class_filter: item_class_filter, max_results: max_results, next_token: next_token, supported_storage_filter: supported_storage_filter)
        list_catalog_items(input)
      end

      def list_catalog_items(input : Types::ListCatalogItemsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CATALOG_ITEMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Outpost orders for your Amazon Web Services account.

      def list_orders(
        max_results : Int32? = nil,
        next_token : String? = nil,
        outpost_identifier_filter : String? = nil
      ) : Protocol::Request
        input = Types::ListOrdersInput.new(max_results: max_results, next_token: next_token, outpost_identifier_filter: outpost_identifier_filter)
        list_orders(input)
      end

      def list_orders(input : Types::ListOrdersInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ORDERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Outposts for your Amazon Web Services account. Use filters to return specific results. If
      # you specify multiple filters, the results include only the resources that match all of the specified
      # filters. For a filter where you can specify multiple values, the results include items that match
      # any of the values that you specify for the filter.

      def list_outposts(
        availability_zone_filter : Array(String)? = nil,
        availability_zone_id_filter : Array(String)? = nil,
        life_cycle_status_filter : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListOutpostsInput.new(availability_zone_filter: availability_zone_filter, availability_zone_id_filter: availability_zone_id_filter, life_cycle_status_filter: life_cycle_status_filter, max_results: max_results, next_token: next_token)
        list_outposts(input)
      end

      def list_outposts(input : Types::ListOutpostsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_OUTPOSTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Outpost sites for your Amazon Web Services account. Use filters to return specific
      # results. Use filters to return specific results. If you specify multiple filters, the results
      # include only the resources that match all of the specified filters. For a filter where you can
      # specify multiple values, the results include items that match any of the values that you specify for
      # the filter.

      def list_sites(
        max_results : Int32? = nil,
        next_token : String? = nil,
        operating_address_city_filter : Array(String)? = nil,
        operating_address_country_code_filter : Array(String)? = nil,
        operating_address_state_or_region_filter : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListSitesInput.new(max_results: max_results, next_token: next_token, operating_address_city_filter: operating_address_city_filter, operating_address_country_code_filter: operating_address_country_code_filter, operating_address_state_or_region_filter: operating_address_state_or_region_filter)
        list_sites(input)
      end

      def list_sites(input : Types::ListSitesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SITES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags for the specified resource.

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

      # Starts the specified capacity task. You can have one active capacity task for each order and each
      # Outpost.

      def start_capacity_task(
        instance_pools : Array(Types::InstanceTypeCapacity),
        outpost_identifier : String,
        asset_id : String? = nil,
        dry_run : Bool? = nil,
        instances_to_exclude : Types::InstancesToExclude? = nil,
        order_id : String? = nil,
        task_action_on_blocking_instances : String? = nil
      ) : Protocol::Request
        input = Types::StartCapacityTaskInput.new(instance_pools: instance_pools, outpost_identifier: outpost_identifier, asset_id: asset_id, dry_run: dry_run, instances_to_exclude: instances_to_exclude, order_id: order_id, task_action_on_blocking_instances: task_action_on_blocking_instances)
        start_capacity_task(input)
      end

      def start_capacity_task(input : Types::StartCapacityTaskInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CAPACITY_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Amazon Web Services uses this action to install Outpost servers. Starts the connection required for
      # Outpost server installation. Use CloudTrail to monitor this action or Amazon Web Services managed
      # policy for Amazon Web Services Outposts to secure it. For more information, see Amazon Web Services
      # managed policies for Amazon Web Services Outposts and Logging Amazon Web Services Outposts API calls
      # with Amazon Web Services CloudTrail in the Amazon Web Services Outposts User Guide .

      def start_connection(
        asset_id : String,
        client_public_key : String,
        network_interface_device_index : Int32,
        device_serial_number : String? = nil
      ) : Protocol::Request
        input = Types::StartConnectionRequest.new(asset_id: asset_id, client_public_key: client_public_key, network_interface_device_index: network_interface_device_index, device_serial_number: device_serial_number)
        start_connection(input)
      end

      def start_connection(input : Types::StartConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts the decommission process to return the Outposts racks or servers.

      def start_outpost_decommission(
        outpost_identifier : String,
        validate_only : Bool? = nil
      ) : Protocol::Request
        input = Types::StartOutpostDecommissionInput.new(outpost_identifier: outpost_identifier, validate_only: validate_only)
        start_outpost_decommission(input)
      end

      def start_outpost_decommission(input : Types::StartOutpostDecommissionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_OUTPOST_DECOMMISSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds tags to the specified resource.

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

      # Removes tags from the specified resource.

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

      # Updates an Outpost.

      def update_outpost(
        outpost_id : String,
        description : String? = nil,
        name : String? = nil,
        supported_hardware_type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateOutpostInput.new(outpost_id: outpost_id, description: description, name: name, supported_hardware_type: supported_hardware_type)
        update_outpost(input)
      end

      def update_outpost(input : Types::UpdateOutpostInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_OUTPOST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified site.

      def update_site(
        site_id : String,
        description : String? = nil,
        name : String? = nil,
        notes : String? = nil
      ) : Protocol::Request
        input = Types::UpdateSiteInput.new(site_id: site_id, description: description, name: name, notes: notes)
        update_site(input)
      end

      def update_site(input : Types::UpdateSiteInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SITE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the address of the specified site. You can't update a site address if there is an order in
      # progress. You must wait for the order to complete or cancel the order. You can update the operating
      # address before you place an order at the site, or after all Outposts that belong to the site have
      # been deactivated.

      def update_site_address(
        address : Types::Address,
        address_type : String,
        site_id : String
      ) : Protocol::Request
        input = Types::UpdateSiteAddressInput.new(address: address, address_type: address_type, site_id: site_id)
        update_site_address(input)
      end

      def update_site_address(input : Types::UpdateSiteAddressInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SITE_ADDRESS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the physical and logistical details for a rack at a site. For more information about hardware
      # requirements for racks, see Network readiness checklist in the Amazon Web Services Outposts User
      # Guide. To update a rack at a site with an order of IN_PROGRESS , you must wait for the order to
      # complete or cancel the order.

      def update_site_rack_physical_properties(
        site_id : String,
        fiber_optic_cable_type : String? = nil,
        maximum_supported_weight_lbs : String? = nil,
        optical_standard : String? = nil,
        power_connector : String? = nil,
        power_draw_kva : String? = nil,
        power_feed_drop : String? = nil,
        power_phase : String? = nil,
        uplink_count : String? = nil,
        uplink_gbps : String? = nil
      ) : Protocol::Request
        input = Types::UpdateSiteRackPhysicalPropertiesInput.new(site_id: site_id, fiber_optic_cable_type: fiber_optic_cable_type, maximum_supported_weight_lbs: maximum_supported_weight_lbs, optical_standard: optical_standard, power_connector: power_connector, power_draw_kva: power_draw_kva, power_feed_drop: power_feed_drop, power_phase: power_phase, uplink_count: uplink_count, uplink_gbps: uplink_gbps)
        update_site_rack_physical_properties(input)
      end

      def update_site_rack_physical_properties(input : Types::UpdateSiteRackPhysicalPropertiesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SITE_RACK_PHYSICAL_PROPERTIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
