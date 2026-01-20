module AwsSdk
  module CloudHSM
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

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Adds or overwrites one or more tags for the specified AWS CloudHSM
      # resource. Each tag consists of a key and a value. Tag keys must be unique to each resource.

      def add_tags_to_resource(
        resource_arn : String,
        tag_list : Array(Types::Tag)
      ) : Types::AddTagsToResourceResponse

        input = Types::AddTagsToResourceRequest.new(resource_arn: resource_arn, tag_list: tag_list)
        add_tags_to_resource(input)
      end

      def add_tags_to_resource(input : Types::AddTagsToResourceRequest) : Types::AddTagsToResourceResponse
        request = Protocol::JsonRpc.build_request(Model::ADD_TAGS_TO_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AddTagsToResourceResponse, "AddTagsToResource")
      end

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Creates a high-availability partition group. A high-availability
      # partition group is a group of partitions that spans multiple physical HSMs.

      def create_hapg(
        label : String
      ) : Types::CreateHapgResponse

        input = Types::CreateHapgRequest.new(label: label)
        create_hapg(input)
      end

      def create_hapg(input : Types::CreateHapgRequest) : Types::CreateHapgResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_HAPG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateHapgResponse, "CreateHapg")
      end

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Creates an uninitialized HSM instance. There is an upfront fee charged
      # for each HSM instance that you create with the CreateHsm operation. If you accidentally provision an
      # HSM and want to request a refund, delete the instance using the DeleteHsm operation, go to the AWS
      # Support Center , create a new case, and select Account and Billing Support . It can take up to 20
      # minutes to create and provision an HSM. You can monitor the status of the HSM with the DescribeHsm
      # operation. The HSM is ready to be initialized when the status changes to RUNNING .

      def create_hsm(
        iam_role_arn : String,
        ssh_key : String,
        subnet_id : String,
        subscription_type : String,
        client_token : String? = nil,
        eni_ip : String? = nil,
        external_id : String? = nil,
        syslog_ip : String? = nil
      ) : Types::CreateHsmResponse

        input = Types::CreateHsmRequest.new(iam_role_arn: iam_role_arn, ssh_key: ssh_key, subnet_id: subnet_id, subscription_type: subscription_type, client_token: client_token, eni_ip: eni_ip, external_id: external_id, syslog_ip: syslog_ip)
        create_hsm(input)
      end

      def create_hsm(input : Types::CreateHsmRequest) : Types::CreateHsmResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_HSM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateHsmResponse, "CreateHsm")
      end

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Creates an HSM client.

      def create_luna_client(
        certificate : String,
        label : String? = nil
      ) : Types::CreateLunaClientResponse

        input = Types::CreateLunaClientRequest.new(certificate: certificate, label: label)
        create_luna_client(input)
      end

      def create_luna_client(input : Types::CreateLunaClientRequest) : Types::CreateLunaClientResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LUNA_CLIENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLunaClientResponse, "CreateLunaClient")
      end

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Deletes a high-availability partition group.

      def delete_hapg(
        hapg_arn : String
      ) : Types::DeleteHapgResponse

        input = Types::DeleteHapgRequest.new(hapg_arn: hapg_arn)
        delete_hapg(input)
      end

      def delete_hapg(input : Types::DeleteHapgRequest) : Types::DeleteHapgResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_HAPG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteHapgResponse, "DeleteHapg")
      end

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Deletes an HSM. After completion, this operation cannot be undone and
      # your key material cannot be recovered.

      def delete_hsm(
        hsm_arn : String
      ) : Types::DeleteHsmResponse

        input = Types::DeleteHsmRequest.new(hsm_arn: hsm_arn)
        delete_hsm(input)
      end

      def delete_hsm(input : Types::DeleteHsmRequest) : Types::DeleteHsmResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_HSM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteHsmResponse, "DeleteHsm")
      end

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Deletes a client.

      def delete_luna_client(
        client_arn : String
      ) : Types::DeleteLunaClientResponse

        input = Types::DeleteLunaClientRequest.new(client_arn: client_arn)
        delete_luna_client(input)
      end

      def delete_luna_client(input : Types::DeleteLunaClientRequest) : Types::DeleteLunaClientResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_LUNA_CLIENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteLunaClientResponse, "DeleteLunaClient")
      end

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Retrieves information about a high-availability partition group.

      def describe_hapg(
        hapg_arn : String
      ) : Types::DescribeHapgResponse

        input = Types::DescribeHapgRequest.new(hapg_arn: hapg_arn)
        describe_hapg(input)
      end

      def describe_hapg(input : Types::DescribeHapgRequest) : Types::DescribeHapgResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_HAPG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeHapgResponse, "DescribeHapg")
      end

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Retrieves information about an HSM. You can identify the HSM by its ARN
      # or its serial number.

      def describe_hsm(
        hsm_arn : String? = nil,
        hsm_serial_number : String? = nil
      ) : Types::DescribeHsmResponse

        input = Types::DescribeHsmRequest.new(hsm_arn: hsm_arn, hsm_serial_number: hsm_serial_number)
        describe_hsm(input)
      end

      def describe_hsm(input : Types::DescribeHsmRequest) : Types::DescribeHsmResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_HSM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeHsmResponse, "DescribeHsm")
      end

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Retrieves information about an HSM client.

      def describe_luna_client(
        certificate_fingerprint : String? = nil,
        client_arn : String? = nil
      ) : Types::DescribeLunaClientResponse

        input = Types::DescribeLunaClientRequest.new(certificate_fingerprint: certificate_fingerprint, client_arn: client_arn)
        describe_luna_client(input)
      end

      def describe_luna_client(input : Types::DescribeLunaClientRequest) : Types::DescribeLunaClientResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_LUNA_CLIENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeLunaClientResponse, "DescribeLunaClient")
      end

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Gets the configuration files necessary to connect to all high
      # availability partition groups the client is associated with.

      def get_config(
        client_arn : String,
        client_version : String,
        hapg_list : Array(String)
      ) : Types::GetConfigResponse

        input = Types::GetConfigRequest.new(client_arn: client_arn, client_version: client_version, hapg_list: hapg_list)
        get_config(input)
      end

      def get_config(input : Types::GetConfigRequest) : Types::GetConfigResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetConfigResponse, "GetConfig")
      end

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Lists the Availability Zones that have available AWS CloudHSM capacity.

      def list_available_zones : Types::ListAvailableZonesResponse
        input = Types::ListAvailableZonesRequest.new
        list_available_zones(input)
      end

      def list_available_zones(input : Types::ListAvailableZonesRequest) : Types::ListAvailableZonesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_AVAILABLE_ZONES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAvailableZonesResponse, "ListAvailableZones")
      end

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Lists the high-availability partition groups for the account. This
      # operation supports pagination with the use of the NextToken member. If more results are available,
      # the NextToken member of the response contains a token that you pass in the next call to ListHapgs to
      # retrieve the next set of items.

      def list_hapgs(
        next_token : String? = nil
      ) : Types::ListHapgsResponse

        input = Types::ListHapgsRequest.new(next_token: next_token)
        list_hapgs(input)
      end

      def list_hapgs(input : Types::ListHapgsRequest) : Types::ListHapgsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_HAPGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListHapgsResponse, "ListHapgs")
      end

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Retrieves the identifiers of all of the HSMs provisioned for the
      # current customer. This operation supports pagination with the use of the NextToken member. If more
      # results are available, the NextToken member of the response contains a token that you pass in the
      # next call to ListHsms to retrieve the next set of items.

      def list_hsms(
        next_token : String? = nil
      ) : Types::ListHsmsResponse

        input = Types::ListHsmsRequest.new(next_token: next_token)
        list_hsms(input)
      end

      def list_hsms(input : Types::ListHsmsRequest) : Types::ListHsmsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_HSMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListHsmsResponse, "ListHsms")
      end

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Lists all of the clients. This operation supports pagination with the
      # use of the NextToken member. If more results are available, the NextToken member of the response
      # contains a token that you pass in the next call to ListLunaClients to retrieve the next set of
      # items.

      def list_luna_clients(
        next_token : String? = nil
      ) : Types::ListLunaClientsResponse

        input = Types::ListLunaClientsRequest.new(next_token: next_token)
        list_luna_clients(input)
      end

      def list_luna_clients(input : Types::ListLunaClientsRequest) : Types::ListLunaClientsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LUNA_CLIENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLunaClientsResponse, "ListLunaClients")
      end

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Returns a list of all tags for the specified AWS CloudHSM resource.

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

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Modifies an existing high-availability partition group.

      def modify_hapg(
        hapg_arn : String,
        label : String? = nil,
        partition_serial_list : Array(String)? = nil
      ) : Types::ModifyHapgResponse

        input = Types::ModifyHapgRequest.new(hapg_arn: hapg_arn, label: label, partition_serial_list: partition_serial_list)
        modify_hapg(input)
      end

      def modify_hapg(input : Types::ModifyHapgRequest) : Types::ModifyHapgResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_HAPG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyHapgResponse, "ModifyHapg")
      end

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Modifies an HSM. This operation can result in the HSM being offline for
      # up to 15 minutes while the AWS CloudHSM service is reconfigured. If you are modifying a production
      # HSM, you should ensure that your AWS CloudHSM service is configured for high availability, and
      # consider executing this operation during a maintenance window.

      def modify_hsm(
        hsm_arn : String,
        eni_ip : String? = nil,
        external_id : String? = nil,
        iam_role_arn : String? = nil,
        subnet_id : String? = nil,
        syslog_ip : String? = nil
      ) : Types::ModifyHsmResponse

        input = Types::ModifyHsmRequest.new(hsm_arn: hsm_arn, eni_ip: eni_ip, external_id: external_id, iam_role_arn: iam_role_arn, subnet_id: subnet_id, syslog_ip: syslog_ip)
        modify_hsm(input)
      end

      def modify_hsm(input : Types::ModifyHsmRequest) : Types::ModifyHsmResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_HSM, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyHsmResponse, "ModifyHsm")
      end

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Modifies the certificate used by the client. This action can
      # potentially start a workflow to install the new certificate on the client's HSMs.

      def modify_luna_client(
        certificate : String,
        client_arn : String
      ) : Types::ModifyLunaClientResponse

        input = Types::ModifyLunaClientRequest.new(certificate: certificate, client_arn: client_arn)
        modify_luna_client(input)
      end

      def modify_luna_client(input : Types::ModifyLunaClientRequest) : Types::ModifyLunaClientResponse
        request = Protocol::JsonRpc.build_request(Model::MODIFY_LUNA_CLIENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ModifyLunaClientResponse, "ModifyLunaClient")
      end

      # This is documentation for AWS CloudHSM Classic . For more information, see AWS CloudHSM Classic FAQs
      # , the AWS CloudHSM Classic User Guide , and the AWS CloudHSM Classic API Reference . For information
      # about the current version of AWS CloudHSM , see AWS CloudHSM , the AWS CloudHSM User Guide , and the
      # AWS CloudHSM API Reference . Removes one or more tags from the specified AWS CloudHSM resource. To
      # remove a tag, specify only the tag key to remove (not the value). To overwrite the value for an
      # existing tag, use AddTagsToResource .

      def remove_tags_from_resource(
        resource_arn : String,
        tag_key_list : Array(String)
      ) : Types::RemoveTagsFromResourceResponse

        input = Types::RemoveTagsFromResourceRequest.new(resource_arn: resource_arn, tag_key_list: tag_key_list)
        remove_tags_from_resource(input)
      end

      def remove_tags_from_resource(input : Types::RemoveTagsFromResourceRequest) : Types::RemoveTagsFromResourceResponse
        request = Protocol::JsonRpc.build_request(Model::REMOVE_TAGS_FROM_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RemoveTagsFromResourceResponse, "RemoveTagsFromResource")
      end
    end
  end
end
