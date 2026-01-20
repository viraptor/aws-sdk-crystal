module Aws
  module ConfigService
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Adds all resource types specified in the ResourceTypes list to the RecordingGroup of specified
      # configuration recorder and includes those resource types when recording. For this operation, the
      # specified configuration recorder must use a RecordingStrategy that is either
      # INCLUSION_BY_RESOURCE_TYPES or EXCLUSION_BY_RESOURCE_TYPES .

      def associate_resource_types(
        configuration_recorder_arn : String,
        resource_types : Array(String)
      ) : Types::AssociateResourceTypesResponse

        input = Types::AssociateResourceTypesRequest.new(configuration_recorder_arn: configuration_recorder_arn, resource_types: resource_types)
        associate_resource_types(input)
      end

      def associate_resource_types(input : Types::AssociateResourceTypesRequest) : Types::AssociateResourceTypesResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_RESOURCE_TYPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateResourceTypesResponse, "AssociateResourceTypes")
      end

      # Returns the current configuration items for resources that are present in your Config aggregator.
      # The operation also returns a list of resources that are not processed in the current request. If
      # there are no unprocessed resources, the operation returns an empty unprocessedResourceIdentifiers
      # list. The API does not return results for deleted resources. The API does not return tags and
      # relationships.

      def batch_get_aggregate_resource_config(
        configuration_aggregator_name : String,
        resource_identifiers : Array(Types::AggregateResourceIdentifier)
      ) : Types::BatchGetAggregateResourceConfigResponse

        input = Types::BatchGetAggregateResourceConfigRequest.new(configuration_aggregator_name: configuration_aggregator_name, resource_identifiers: resource_identifiers)
        batch_get_aggregate_resource_config(input)
      end

      def batch_get_aggregate_resource_config(input : Types::BatchGetAggregateResourceConfigRequest) : Types::BatchGetAggregateResourceConfigResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_AGGREGATE_RESOURCE_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetAggregateResourceConfigResponse, "BatchGetAggregateResourceConfig")
      end

      # Returns the BaseConfigurationItem for one or more requested resources. The operation also returns a
      # list of resources that are not processed in the current request. If there are no unprocessed
      # resources, the operation returns an empty unprocessedResourceKeys list. The API does not return
      # results for deleted resources. The API does not return any tags for the requested resources. This
      # information is filtered out of the supplementaryConfiguration section of the API response.

      def batch_get_resource_config(
        resource_keys : Array(Types::ResourceKey)
      ) : Types::BatchGetResourceConfigResponse

        input = Types::BatchGetResourceConfigRequest.new(resource_keys: resource_keys)
        batch_get_resource_config(input)
      end

      def batch_get_resource_config(input : Types::BatchGetResourceConfigRequest) : Types::BatchGetResourceConfigResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_RESOURCE_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetResourceConfigResponse, "BatchGetResourceConfig")
      end

      # Deletes the authorization granted to the specified configuration aggregator account in a specified
      # region.

      def delete_aggregation_authorization(
        authorized_account_id : String,
        authorized_aws_region : String
      ) : Nil

        input = Types::DeleteAggregationAuthorizationRequest.new(authorized_account_id: authorized_account_id, authorized_aws_region: authorized_aws_region)
        delete_aggregation_authorization(input)
      end

      def delete_aggregation_authorization(input : Types::DeleteAggregationAuthorizationRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_AGGREGATION_AUTHORIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified Config rule and all of its evaluation results. Config sets the state of a rule
      # to DELETING until the deletion is complete. You cannot update a rule while it is in this state. If
      # you make a PutConfigRule or DeleteConfigRule request for the rule, you will receive a
      # ResourceInUseException . You can check the state of a rule by using the DescribeConfigRules request.
      # Recommendation: Consider excluding the AWS::Config::ResourceCompliance resource type from recording
      # before deleting rules Deleting rules creates configuration items (CIs) for
      # AWS::Config::ResourceCompliance that can affect your costs for the configuration recorder. If you
      # are deleting rules which evaluate a large number of resource types, this can lead to a spike in the
      # number of CIs recorded. To avoid the associated costs, you can opt to disable recording for the
      # AWS::Config::ResourceCompliance resource type before deleting rules, and re-enable recording after
      # the rules have been deleted. However, since deleting rules is an asynchronous process, it might take
      # an hour or more to complete. During the time when recording is disabled for
      # AWS::Config::ResourceCompliance , rule evaluations will not be recorded in the associated resource’s
      # history.

      def delete_config_rule(
        config_rule_name : String
      ) : Nil

        input = Types::DeleteConfigRuleRequest.new(config_rule_name: config_rule_name)
        delete_config_rule(input)
      end

      def delete_config_rule(input : Types::DeleteConfigRuleRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONFIG_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified configuration aggregator and the aggregated data associated with the
      # aggregator.

      def delete_configuration_aggregator(
        configuration_aggregator_name : String
      ) : Nil

        input = Types::DeleteConfigurationAggregatorRequest.new(configuration_aggregator_name: configuration_aggregator_name)
        delete_configuration_aggregator(input)
      end

      def delete_configuration_aggregator(input : Types::DeleteConfigurationAggregatorRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONFIGURATION_AGGREGATOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the customer managed configuration recorder. This operation does not delete the
      # configuration information that was previously recorded. You will be able to access the previously
      # recorded information by using the GetResourceConfigHistory operation, but you will not be able to
      # access this information in the Config console until you have created a new customer managed
      # configuration recorder.

      def delete_configuration_recorder(
        configuration_recorder_name : String
      ) : Nil

        input = Types::DeleteConfigurationRecorderRequest.new(configuration_recorder_name: configuration_recorder_name)
        delete_configuration_recorder(input)
      end

      def delete_configuration_recorder(input : Types::DeleteConfigurationRecorderRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONFIGURATION_RECORDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified conformance pack and all the Config rules, remediation actions, and all
      # evaluation results within that conformance pack. Config sets the conformance pack to
      # DELETE_IN_PROGRESS until the deletion is complete. You cannot update a conformance pack while it is
      # in this state. Recommendation: Consider excluding the AWS::Config::ResourceCompliance resource type
      # from recording before deleting rules Deleting rules creates configuration items (CIs) for
      # AWS::Config::ResourceCompliance that can affect your costs for the configuration recorder. If you
      # are deleting rules which evaluate a large number of resource types, this can lead to a spike in the
      # number of CIs recorded. To avoid the associated costs, you can opt to disable recording for the
      # AWS::Config::ResourceCompliance resource type before deleting rules, and re-enable recording after
      # the rules have been deleted. However, since deleting rules is an asynchronous process, it might take
      # an hour or more to complete. During the time when recording is disabled for
      # AWS::Config::ResourceCompliance , rule evaluations will not be recorded in the associated resource’s
      # history.

      def delete_conformance_pack(
        conformance_pack_name : String
      ) : Nil

        input = Types::DeleteConformancePackRequest.new(conformance_pack_name: conformance_pack_name)
        delete_conformance_pack(input)
      end

      def delete_conformance_pack(input : Types::DeleteConformancePackRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_CONFORMANCE_PACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the delivery channel. Before you can delete the delivery channel, you must stop the customer
      # managed configuration recorder. You can use the StopConfigurationRecorder operation to stop the
      # customer managed configuration recorder.

      def delete_delivery_channel(
        delivery_channel_name : String
      ) : Nil

        input = Types::DeleteDeliveryChannelRequest.new(delivery_channel_name: delivery_channel_name)
        delete_delivery_channel(input)
      end

      def delete_delivery_channel(input : Types::DeleteDeliveryChannelRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_DELIVERY_CHANNEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the evaluation results for the specified Config rule. You can specify one Config rule per
      # request. After you delete the evaluation results, you can call the StartConfigRulesEvaluation API to
      # start evaluating your Amazon Web Services resources against the rule.

      def delete_evaluation_results(
        config_rule_name : String
      ) : Types::DeleteEvaluationResultsResponse

        input = Types::DeleteEvaluationResultsRequest.new(config_rule_name: config_rule_name)
        delete_evaluation_results(input)
      end

      def delete_evaluation_results(input : Types::DeleteEvaluationResultsRequest) : Types::DeleteEvaluationResultsResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_EVALUATION_RESULTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteEvaluationResultsResponse, "DeleteEvaluationResults")
      end

      # Deletes the specified organization Config rule and all of its evaluation results from all member
      # accounts in that organization. Only a management account and a delegated administrator account can
      # delete an organization Config rule. When calling this API with a delegated administrator, you must
      # ensure Organizations ListDelegatedAdministrator permissions are added. Config sets the state of a
      # rule to DELETE_IN_PROGRESS until the deletion is complete. You cannot update a rule while it is in
      # this state. Recommendation: Consider excluding the AWS::Config::ResourceCompliance resource type
      # from recording before deleting rules Deleting rules creates configuration items (CIs) for
      # AWS::Config::ResourceCompliance that can affect your costs for the configuration recorder. If you
      # are deleting rules which evaluate a large number of resource types, this can lead to a spike in the
      # number of CIs recorded. To avoid the associated costs, you can opt to disable recording for the
      # AWS::Config::ResourceCompliance resource type before deleting rules, and re-enable recording after
      # the rules have been deleted. However, since deleting rules is an asynchronous process, it might take
      # an hour or more to complete. During the time when recording is disabled for
      # AWS::Config::ResourceCompliance , rule evaluations will not be recorded in the associated resource’s
      # history.

      def delete_organization_config_rule(
        organization_config_rule_name : String
      ) : Nil

        input = Types::DeleteOrganizationConfigRuleRequest.new(organization_config_rule_name: organization_config_rule_name)
        delete_organization_config_rule(input)
      end

      def delete_organization_config_rule(input : Types::DeleteOrganizationConfigRuleRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_ORGANIZATION_CONFIG_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified organization conformance pack and all of the Config rules and remediation
      # actions from all member accounts in that organization. Only a management account or a delegated
      # administrator account can delete an organization conformance pack. When calling this API with a
      # delegated administrator, you must ensure Organizations ListDelegatedAdministrator permissions are
      # added. Config sets the state of a conformance pack to DELETE_IN_PROGRESS until the deletion is
      # complete. You cannot update a conformance pack while it is in this state. Recommendation: Consider
      # excluding the AWS::Config::ResourceCompliance resource type from recording before deleting rules
      # Deleting rules creates configuration items (CIs) for AWS::Config::ResourceCompliance that can affect
      # your costs for the configuration recorder. If you are deleting rules which evaluate a large number
      # of resource types, this can lead to a spike in the number of CIs recorded. To avoid the associated
      # costs, you can opt to disable recording for the AWS::Config::ResourceCompliance resource type before
      # deleting rules, and re-enable recording after the rules have been deleted. However, since deleting
      # rules is an asynchronous process, it might take an hour or more to complete. During the time when
      # recording is disabled for AWS::Config::ResourceCompliance , rule evaluations will not be recorded in
      # the associated resource’s history.

      def delete_organization_conformance_pack(
        organization_conformance_pack_name : String
      ) : Nil

        input = Types::DeleteOrganizationConformancePackRequest.new(organization_conformance_pack_name: organization_conformance_pack_name)
        delete_organization_conformance_pack(input)
      end

      def delete_organization_conformance_pack(input : Types::DeleteOrganizationConformancePackRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_ORGANIZATION_CONFORMANCE_PACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes pending authorization requests for a specified aggregator account in a specified region.

      def delete_pending_aggregation_request(
        requester_account_id : String,
        requester_aws_region : String
      ) : Nil

        input = Types::DeletePendingAggregationRequestRequest.new(requester_account_id: requester_account_id, requester_aws_region: requester_aws_region)
        delete_pending_aggregation_request(input)
      end

      def delete_pending_aggregation_request(input : Types::DeletePendingAggregationRequestRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_PENDING_AGGREGATION_REQUEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the remediation configuration.

      def delete_remediation_configuration(
        config_rule_name : String,
        resource_type : String? = nil
      ) : Types::DeleteRemediationConfigurationResponse

        input = Types::DeleteRemediationConfigurationRequest.new(config_rule_name: config_rule_name, resource_type: resource_type)
        delete_remediation_configuration(input)
      end

      def delete_remediation_configuration(input : Types::DeleteRemediationConfigurationRequest) : Types::DeleteRemediationConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_REMEDIATION_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRemediationConfigurationResponse, "DeleteRemediationConfiguration")
      end

      # Deletes one or more remediation exceptions mentioned in the resource keys. Config generates a
      # remediation exception when a problem occurs executing a remediation action to a specific resource.
      # Remediation exceptions blocks auto-remediation until the exception is cleared.

      def delete_remediation_exceptions(
        config_rule_name : String,
        resource_keys : Array(Types::RemediationExceptionResourceKey)
      ) : Types::DeleteRemediationExceptionsResponse

        input = Types::DeleteRemediationExceptionsRequest.new(config_rule_name: config_rule_name, resource_keys: resource_keys)
        delete_remediation_exceptions(input)
      end

      def delete_remediation_exceptions(input : Types::DeleteRemediationExceptionsRequest) : Types::DeleteRemediationExceptionsResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_REMEDIATION_EXCEPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRemediationExceptionsResponse, "DeleteRemediationExceptions")
      end

      # Records the configuration state for a custom resource that has been deleted. This API records a new
      # ConfigurationItem with a ResourceDeleted status. You can retrieve the ConfigurationItems recorded
      # for this resource in your Config History.

      def delete_resource_config(
        resource_id : String,
        resource_type : String
      ) : Nil

        input = Types::DeleteResourceConfigRequest.new(resource_id: resource_id, resource_type: resource_type)
        delete_resource_config(input)
      end

      def delete_resource_config(input : Types::DeleteResourceConfigRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_RESOURCE_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the retention configuration.

      def delete_retention_configuration(
        retention_configuration_name : String
      ) : Nil

        input = Types::DeleteRetentionConfigurationRequest.new(retention_configuration_name: retention_configuration_name)
        delete_retention_configuration(input)
      end

      def delete_retention_configuration(input : Types::DeleteRetentionConfigurationRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_RETENTION_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes an existing service-linked configuration recorder. This operation does not delete the
      # configuration information that was previously recorded. You will be able to access the previously
      # recorded information by using the GetResourceConfigHistory operation, but you will not be able to
      # access this information in the Config console until you have created a new service-linked
      # configuration recorder for the same service. The recording scope determines if you receive
      # configuration items The recording scope is set by the service that is linked to the configuration
      # recorder and determines whether you receive configuration items (CIs) in the delivery channel. If
      # the recording scope is internal, you will not receive CIs in the delivery channel.

      def delete_service_linked_configuration_recorder(
        service_principal : String
      ) : Types::DeleteServiceLinkedConfigurationRecorderResponse

        input = Types::DeleteServiceLinkedConfigurationRecorderRequest.new(service_principal: service_principal)
        delete_service_linked_configuration_recorder(input)
      end

      def delete_service_linked_configuration_recorder(input : Types::DeleteServiceLinkedConfigurationRecorderRequest) : Types::DeleteServiceLinkedConfigurationRecorderResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SERVICE_LINKED_CONFIGURATION_RECORDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteServiceLinkedConfigurationRecorderResponse, "DeleteServiceLinkedConfigurationRecorder")
      end

      # Deletes the stored query for a single Amazon Web Services account and a single Amazon Web Services
      # Region.

      def delete_stored_query(
        query_name : String
      ) : Types::DeleteStoredQueryResponse

        input = Types::DeleteStoredQueryRequest.new(query_name: query_name)
        delete_stored_query(input)
      end

      def delete_stored_query(input : Types::DeleteStoredQueryRequest) : Types::DeleteStoredQueryResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_STORED_QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteStoredQueryResponse, "DeleteStoredQuery")
      end

      # Schedules delivery of a configuration snapshot to the Amazon S3 bucket in the specified delivery
      # channel. After the delivery has started, Config sends the following notifications using an Amazon
      # SNS topic that you have specified. Notification of the start of the delivery. Notification of the
      # completion of the delivery, if the delivery was successfully completed. Notification of delivery
      # failure, if the delivery failed.

      def deliver_config_snapshot(
        delivery_channel_name : String
      ) : Types::DeliverConfigSnapshotResponse

        input = Types::DeliverConfigSnapshotRequest.new(delivery_channel_name: delivery_channel_name)
        deliver_config_snapshot(input)
      end

      def deliver_config_snapshot(input : Types::DeliverConfigSnapshotRequest) : Types::DeliverConfigSnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::DELIVER_CONFIG_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeliverConfigSnapshotResponse, "DeliverConfigSnapshot")
      end

      # Returns a list of compliant and noncompliant rules with the number of resources for compliant and
      # noncompliant rules. Does not display rules that do not have compliance results. The results can
      # return an empty result page, but if you have a nextToken , the results are displayed on the next
      # page.

      def describe_aggregate_compliance_by_config_rules(
        configuration_aggregator_name : String,
        filters : Types::ConfigRuleComplianceFilters? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeAggregateComplianceByConfigRulesResponse

        input = Types::DescribeAggregateComplianceByConfigRulesRequest.new(configuration_aggregator_name: configuration_aggregator_name, filters: filters, limit: limit, next_token: next_token)
        describe_aggregate_compliance_by_config_rules(input)
      end

      def describe_aggregate_compliance_by_config_rules(input : Types::DescribeAggregateComplianceByConfigRulesRequest) : Types::DescribeAggregateComplianceByConfigRulesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AGGREGATE_COMPLIANCE_BY_CONFIG_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAggregateComplianceByConfigRulesResponse, "DescribeAggregateComplianceByConfigRules")
      end

      # Returns a list of the existing and deleted conformance packs and their associated compliance status
      # with the count of compliant and noncompliant Config rules within each conformance pack. Also returns
      # the total rule count which includes compliant rules, noncompliant rules, and rules that cannot be
      # evaluated due to insufficient data. The results can return an empty result page, but if you have a
      # nextToken , the results are displayed on the next page.

      def describe_aggregate_compliance_by_conformance_packs(
        configuration_aggregator_name : String,
        filters : Types::AggregateConformancePackComplianceFilters? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeAggregateComplianceByConformancePacksResponse

        input = Types::DescribeAggregateComplianceByConformancePacksRequest.new(configuration_aggregator_name: configuration_aggregator_name, filters: filters, limit: limit, next_token: next_token)
        describe_aggregate_compliance_by_conformance_packs(input)
      end

      def describe_aggregate_compliance_by_conformance_packs(input : Types::DescribeAggregateComplianceByConformancePacksRequest) : Types::DescribeAggregateComplianceByConformancePacksResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AGGREGATE_COMPLIANCE_BY_CONFORMANCE_PACKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAggregateComplianceByConformancePacksResponse, "DescribeAggregateComplianceByConformancePacks")
      end

      # Returns a list of authorizations granted to various aggregator accounts and regions.

      def describe_aggregation_authorizations(
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeAggregationAuthorizationsResponse

        input = Types::DescribeAggregationAuthorizationsRequest.new(limit: limit, next_token: next_token)
        describe_aggregation_authorizations(input)
      end

      def describe_aggregation_authorizations(input : Types::DescribeAggregationAuthorizationsRequest) : Types::DescribeAggregationAuthorizationsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AGGREGATION_AUTHORIZATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAggregationAuthorizationsResponse, "DescribeAggregationAuthorizations")
      end

      # Indicates whether the specified Config rules are compliant. If a rule is noncompliant, this
      # operation returns the number of Amazon Web Services resources that do not comply with the rule. A
      # rule is compliant if all of the evaluated resources comply with it. It is noncompliant if any of
      # these resources do not comply. If Config has no current evaluation results for the rule, it returns
      # INSUFFICIENT_DATA . This result might indicate one of the following conditions: Config has never
      # invoked an evaluation for the rule. To check whether it has, use the
      # DescribeConfigRuleEvaluationStatus action to get the LastSuccessfulInvocationTime and
      # LastFailedInvocationTime . The rule's Lambda function is failing to send evaluation results to
      # Config. Verify that the role you assigned to your configuration recorder includes the
      # config:PutEvaluations permission. If the rule is a custom rule, verify that the Lambda execution
      # role includes the config:PutEvaluations permission. The rule's Lambda function has returned
      # NOT_APPLICABLE for all evaluation results. This can occur if the resources were deleted or removed
      # from the rule's scope.

      def describe_compliance_by_config_rule(
        compliance_types : Array(String)? = nil,
        config_rule_names : Array(String)? = nil,
        next_token : String? = nil
      ) : Types::DescribeComplianceByConfigRuleResponse

        input = Types::DescribeComplianceByConfigRuleRequest.new(compliance_types: compliance_types, config_rule_names: config_rule_names, next_token: next_token)
        describe_compliance_by_config_rule(input)
      end

      def describe_compliance_by_config_rule(input : Types::DescribeComplianceByConfigRuleRequest) : Types::DescribeComplianceByConfigRuleResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_COMPLIANCE_BY_CONFIG_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeComplianceByConfigRuleResponse, "DescribeComplianceByConfigRule")
      end

      # Indicates whether the specified Amazon Web Services resources are compliant. If a resource is
      # noncompliant, this operation returns the number of Config rules that the resource does not comply
      # with. A resource is compliant if it complies with all the Config rules that evaluate it. It is
      # noncompliant if it does not comply with one or more of these rules. If Config has no current
      # evaluation results for the resource, it returns INSUFFICIENT_DATA . This result might indicate one
      # of the following conditions about the rules that evaluate the resource: Config has never invoked an
      # evaluation for the rule. To check whether it has, use the DescribeConfigRuleEvaluationStatus action
      # to get the LastSuccessfulInvocationTime and LastFailedInvocationTime . The rule's Lambda function is
      # failing to send evaluation results to Config. Verify that the role that you assigned to your
      # configuration recorder includes the config:PutEvaluations permission. If the rule is a custom rule,
      # verify that the Lambda execution role includes the config:PutEvaluations permission. The rule's
      # Lambda function has returned NOT_APPLICABLE for all evaluation results. This can occur if the
      # resources were deleted or removed from the rule's scope.

      def describe_compliance_by_resource(
        compliance_types : Array(String)? = nil,
        limit : Int32? = nil,
        next_token : String? = nil,
        resource_id : String? = nil,
        resource_type : String? = nil
      ) : Types::DescribeComplianceByResourceResponse

        input = Types::DescribeComplianceByResourceRequest.new(compliance_types: compliance_types, limit: limit, next_token: next_token, resource_id: resource_id, resource_type: resource_type)
        describe_compliance_by_resource(input)
      end

      def describe_compliance_by_resource(input : Types::DescribeComplianceByResourceRequest) : Types::DescribeComplianceByResourceResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_COMPLIANCE_BY_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeComplianceByResourceResponse, "DescribeComplianceByResource")
      end

      # Returns status information for each of your Config managed rules. The status includes information
      # such as the last time Config invoked the rule, the last time Config failed to invoke the rule, and
      # the related error for the last failure.

      def describe_config_rule_evaluation_status(
        config_rule_names : Array(String)? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeConfigRuleEvaluationStatusResponse

        input = Types::DescribeConfigRuleEvaluationStatusRequest.new(config_rule_names: config_rule_names, limit: limit, next_token: next_token)
        describe_config_rule_evaluation_status(input)
      end

      def describe_config_rule_evaluation_status(input : Types::DescribeConfigRuleEvaluationStatusRequest) : Types::DescribeConfigRuleEvaluationStatusResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONFIG_RULE_EVALUATION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConfigRuleEvaluationStatusResponse, "DescribeConfigRuleEvaluationStatus")
      end

      # Returns details about your Config rules.

      def describe_config_rules(
        config_rule_names : Array(String)? = nil,
        filters : Types::DescribeConfigRulesFilters? = nil,
        next_token : String? = nil
      ) : Types::DescribeConfigRulesResponse

        input = Types::DescribeConfigRulesRequest.new(config_rule_names: config_rule_names, filters: filters, next_token: next_token)
        describe_config_rules(input)
      end

      def describe_config_rules(input : Types::DescribeConfigRulesRequest) : Types::DescribeConfigRulesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONFIG_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConfigRulesResponse, "DescribeConfigRules")
      end

      # Returns status information for sources within an aggregator. The status includes information about
      # the last time Config verified authorization between the source account and an aggregator account. In
      # case of a failure, the status contains the related error code or message.

      def describe_configuration_aggregator_sources_status(
        configuration_aggregator_name : String,
        limit : Int32? = nil,
        next_token : String? = nil,
        update_status : Array(String)? = nil
      ) : Types::DescribeConfigurationAggregatorSourcesStatusResponse

        input = Types::DescribeConfigurationAggregatorSourcesStatusRequest.new(configuration_aggregator_name: configuration_aggregator_name, limit: limit, next_token: next_token, update_status: update_status)
        describe_configuration_aggregator_sources_status(input)
      end

      def describe_configuration_aggregator_sources_status(input : Types::DescribeConfigurationAggregatorSourcesStatusRequest) : Types::DescribeConfigurationAggregatorSourcesStatusResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONFIGURATION_AGGREGATOR_SOURCES_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConfigurationAggregatorSourcesStatusResponse, "DescribeConfigurationAggregatorSourcesStatus")
      end

      # Returns the details of one or more configuration aggregators. If the configuration aggregator is not
      # specified, this operation returns the details for all the configuration aggregators associated with
      # the account.

      def describe_configuration_aggregators(
        configuration_aggregator_names : Array(String)? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeConfigurationAggregatorsResponse

        input = Types::DescribeConfigurationAggregatorsRequest.new(configuration_aggregator_names: configuration_aggregator_names, limit: limit, next_token: next_token)
        describe_configuration_aggregators(input)
      end

      def describe_configuration_aggregators(input : Types::DescribeConfigurationAggregatorsRequest) : Types::DescribeConfigurationAggregatorsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONFIGURATION_AGGREGATORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConfigurationAggregatorsResponse, "DescribeConfigurationAggregators")
      end

      # Returns the current status of the configuration recorder you specify as well as the status of the
      # last recording event for the configuration recorders. For a detailed status of recording events over
      # time, add your Config events to Amazon CloudWatch metrics and use CloudWatch metrics. If a
      # configuration recorder is not specified, this operation returns the status for the customer managed
      # configuration recorder configured for the account, if applicable. When making a request to this
      # operation, you can only specify one configuration recorder.

      def describe_configuration_recorder_status(
        arn : String? = nil,
        configuration_recorder_names : Array(String)? = nil,
        service_principal : String? = nil
      ) : Types::DescribeConfigurationRecorderStatusResponse

        input = Types::DescribeConfigurationRecorderStatusRequest.new(arn: arn, configuration_recorder_names: configuration_recorder_names, service_principal: service_principal)
        describe_configuration_recorder_status(input)
      end

      def describe_configuration_recorder_status(input : Types::DescribeConfigurationRecorderStatusRequest) : Types::DescribeConfigurationRecorderStatusResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONFIGURATION_RECORDER_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConfigurationRecorderStatusResponse, "DescribeConfigurationRecorderStatus")
      end

      # Returns details for the configuration recorder you specify. If a configuration recorder is not
      # specified, this operation returns details for the customer managed configuration recorder configured
      # for the account, if applicable. When making a request to this operation, you can only specify one
      # configuration recorder.

      def describe_configuration_recorders(
        arn : String? = nil,
        configuration_recorder_names : Array(String)? = nil,
        service_principal : String? = nil
      ) : Types::DescribeConfigurationRecordersResponse

        input = Types::DescribeConfigurationRecordersRequest.new(arn: arn, configuration_recorder_names: configuration_recorder_names, service_principal: service_principal)
        describe_configuration_recorders(input)
      end

      def describe_configuration_recorders(input : Types::DescribeConfigurationRecordersRequest) : Types::DescribeConfigurationRecordersResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONFIGURATION_RECORDERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConfigurationRecordersResponse, "DescribeConfigurationRecorders")
      end

      # Returns compliance details for each rule in that conformance pack. You must provide exact rule
      # names.

      def describe_conformance_pack_compliance(
        conformance_pack_name : String,
        filters : Types::ConformancePackComplianceFilters? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeConformancePackComplianceResponse

        input = Types::DescribeConformancePackComplianceRequest.new(conformance_pack_name: conformance_pack_name, filters: filters, limit: limit, next_token: next_token)
        describe_conformance_pack_compliance(input)
      end

      def describe_conformance_pack_compliance(input : Types::DescribeConformancePackComplianceRequest) : Types::DescribeConformancePackComplianceResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONFORMANCE_PACK_COMPLIANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConformancePackComplianceResponse, "DescribeConformancePackCompliance")
      end

      # Provides one or more conformance packs deployment status. If there are no conformance packs then you
      # will see an empty result.

      def describe_conformance_pack_status(
        conformance_pack_names : Array(String)? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeConformancePackStatusResponse

        input = Types::DescribeConformancePackStatusRequest.new(conformance_pack_names: conformance_pack_names, limit: limit, next_token: next_token)
        describe_conformance_pack_status(input)
      end

      def describe_conformance_pack_status(input : Types::DescribeConformancePackStatusRequest) : Types::DescribeConformancePackStatusResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONFORMANCE_PACK_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConformancePackStatusResponse, "DescribeConformancePackStatus")
      end

      # Returns a list of one or more conformance packs.

      def describe_conformance_packs(
        conformance_pack_names : Array(String)? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeConformancePacksResponse

        input = Types::DescribeConformancePacksRequest.new(conformance_pack_names: conformance_pack_names, limit: limit, next_token: next_token)
        describe_conformance_packs(input)
      end

      def describe_conformance_packs(input : Types::DescribeConformancePacksRequest) : Types::DescribeConformancePacksResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CONFORMANCE_PACKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeConformancePacksResponse, "DescribeConformancePacks")
      end

      # Returns the current status of the specified delivery channel. If a delivery channel is not
      # specified, this operation returns the current status of all delivery channels associated with the
      # account. Currently, you can specify only one delivery channel per region in your account.

      def describe_delivery_channel_status(
        delivery_channel_names : Array(String)? = nil
      ) : Types::DescribeDeliveryChannelStatusResponse

        input = Types::DescribeDeliveryChannelStatusRequest.new(delivery_channel_names: delivery_channel_names)
        describe_delivery_channel_status(input)
      end

      def describe_delivery_channel_status(input : Types::DescribeDeliveryChannelStatusRequest) : Types::DescribeDeliveryChannelStatusResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DELIVERY_CHANNEL_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDeliveryChannelStatusResponse, "DescribeDeliveryChannelStatus")
      end

      # Returns details about the specified delivery channel. If a delivery channel is not specified, this
      # operation returns the details of all delivery channels associated with the account. Currently, you
      # can specify only one delivery channel per region in your account.

      def describe_delivery_channels(
        delivery_channel_names : Array(String)? = nil
      ) : Types::DescribeDeliveryChannelsResponse

        input = Types::DescribeDeliveryChannelsRequest.new(delivery_channel_names: delivery_channel_names)
        describe_delivery_channels(input)
      end

      def describe_delivery_channels(input : Types::DescribeDeliveryChannelsRequest) : Types::DescribeDeliveryChannelsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DELIVERY_CHANNELS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDeliveryChannelsResponse, "DescribeDeliveryChannels")
      end

      # Provides organization Config rule deployment status for an organization. The status is not
      # considered successful until organization Config rule is successfully deployed in all the member
      # accounts with an exception of excluded accounts. When you specify the limit and the next token, you
      # receive a paginated response. Limit and next token are not applicable if you specify organization
      # Config rule names. It is only applicable, when you request all the organization Config rules.

      def describe_organization_config_rule_statuses(
        limit : Int32? = nil,
        next_token : String? = nil,
        organization_config_rule_names : Array(String)? = nil
      ) : Types::DescribeOrganizationConfigRuleStatusesResponse

        input = Types::DescribeOrganizationConfigRuleStatusesRequest.new(limit: limit, next_token: next_token, organization_config_rule_names: organization_config_rule_names)
        describe_organization_config_rule_statuses(input)
      end

      def describe_organization_config_rule_statuses(input : Types::DescribeOrganizationConfigRuleStatusesRequest) : Types::DescribeOrganizationConfigRuleStatusesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ORGANIZATION_CONFIG_RULE_STATUSES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeOrganizationConfigRuleStatusesResponse, "DescribeOrganizationConfigRuleStatuses")
      end

      # Returns a list of organization Config rules. When you specify the limit and the next token, you
      # receive a paginated response. Limit and next token are not applicable if you specify organization
      # Config rule names. It is only applicable, when you request all the organization Config rules. For
      # accounts within an organization If you deploy an organizational rule or conformance pack in an
      # organization administrator account, and then establish a delegated administrator and deploy an
      # organizational rule or conformance pack in the delegated administrator account, you won't be able to
      # see the organizational rule or conformance pack in the organization administrator account from the
      # delegated administrator account or see the organizational rule or conformance pack in the delegated
      # administrator account from organization administrator account. The DescribeOrganizationConfigRules
      # and DescribeOrganizationConformancePacks APIs can only see and interact with the
      # organization-related resource that were deployed from within the account calling those APIs.

      def describe_organization_config_rules(
        limit : Int32? = nil,
        next_token : String? = nil,
        organization_config_rule_names : Array(String)? = nil
      ) : Types::DescribeOrganizationConfigRulesResponse

        input = Types::DescribeOrganizationConfigRulesRequest.new(limit: limit, next_token: next_token, organization_config_rule_names: organization_config_rule_names)
        describe_organization_config_rules(input)
      end

      def describe_organization_config_rules(input : Types::DescribeOrganizationConfigRulesRequest) : Types::DescribeOrganizationConfigRulesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ORGANIZATION_CONFIG_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeOrganizationConfigRulesResponse, "DescribeOrganizationConfigRules")
      end

      # Provides organization conformance pack deployment status for an organization. The status is not
      # considered successful until organization conformance pack is successfully deployed in all the member
      # accounts with an exception of excluded accounts. When you specify the limit and the next token, you
      # receive a paginated response. Limit and next token are not applicable if you specify organization
      # conformance pack names. They are only applicable, when you request all the organization conformance
      # packs.

      def describe_organization_conformance_pack_statuses(
        limit : Int32? = nil,
        next_token : String? = nil,
        organization_conformance_pack_names : Array(String)? = nil
      ) : Types::DescribeOrganizationConformancePackStatusesResponse

        input = Types::DescribeOrganizationConformancePackStatusesRequest.new(limit: limit, next_token: next_token, organization_conformance_pack_names: organization_conformance_pack_names)
        describe_organization_conformance_pack_statuses(input)
      end

      def describe_organization_conformance_pack_statuses(input : Types::DescribeOrganizationConformancePackStatusesRequest) : Types::DescribeOrganizationConformancePackStatusesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ORGANIZATION_CONFORMANCE_PACK_STATUSES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeOrganizationConformancePackStatusesResponse, "DescribeOrganizationConformancePackStatuses")
      end

      # Returns a list of organization conformance packs. When you specify the limit and the next token, you
      # receive a paginated response. Limit and next token are not applicable if you specify organization
      # conformance packs names. They are only applicable, when you request all the organization conformance
      # packs. For accounts within an organization If you deploy an organizational rule or conformance pack
      # in an organization administrator account, and then establish a delegated administrator and deploy an
      # organizational rule or conformance pack in the delegated administrator account, you won't be able to
      # see the organizational rule or conformance pack in the organization administrator account from the
      # delegated administrator account or see the organizational rule or conformance pack in the delegated
      # administrator account from organization administrator account. The DescribeOrganizationConfigRules
      # and DescribeOrganizationConformancePacks APIs can only see and interact with the
      # organization-related resource that were deployed from within the account calling those APIs.

      def describe_organization_conformance_packs(
        limit : Int32? = nil,
        next_token : String? = nil,
        organization_conformance_pack_names : Array(String)? = nil
      ) : Types::DescribeOrganizationConformancePacksResponse

        input = Types::DescribeOrganizationConformancePacksRequest.new(limit: limit, next_token: next_token, organization_conformance_pack_names: organization_conformance_pack_names)
        describe_organization_conformance_packs(input)
      end

      def describe_organization_conformance_packs(input : Types::DescribeOrganizationConformancePacksRequest) : Types::DescribeOrganizationConformancePacksResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ORGANIZATION_CONFORMANCE_PACKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeOrganizationConformancePacksResponse, "DescribeOrganizationConformancePacks")
      end

      # Returns a list of all pending aggregation requests.

      def describe_pending_aggregation_requests(
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribePendingAggregationRequestsResponse

        input = Types::DescribePendingAggregationRequestsRequest.new(limit: limit, next_token: next_token)
        describe_pending_aggregation_requests(input)
      end

      def describe_pending_aggregation_requests(input : Types::DescribePendingAggregationRequestsRequest) : Types::DescribePendingAggregationRequestsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PENDING_AGGREGATION_REQUESTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePendingAggregationRequestsResponse, "DescribePendingAggregationRequests")
      end

      # Returns the details of one or more remediation configurations.

      def describe_remediation_configurations(
        config_rule_names : Array(String)
      ) : Types::DescribeRemediationConfigurationsResponse

        input = Types::DescribeRemediationConfigurationsRequest.new(config_rule_names: config_rule_names)
        describe_remediation_configurations(input)
      end

      def describe_remediation_configurations(input : Types::DescribeRemediationConfigurationsRequest) : Types::DescribeRemediationConfigurationsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REMEDIATION_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRemediationConfigurationsResponse, "DescribeRemediationConfigurations")
      end

      # Returns the details of one or more remediation exceptions. A detailed view of a remediation
      # exception for a set of resources that includes an explanation of an exception and the time when the
      # exception will be deleted. When you specify the limit and the next token, you receive a paginated
      # response. Config generates a remediation exception when a problem occurs executing a remediation
      # action to a specific resource. Remediation exceptions blocks auto-remediation until the exception is
      # cleared. When you specify the limit and the next token, you receive a paginated response. Limit and
      # next token are not applicable if you request resources in batch. It is only applicable, when you
      # request all resources.

      def describe_remediation_exceptions(
        config_rule_name : String,
        limit : Int32? = nil,
        next_token : String? = nil,
        resource_keys : Array(Types::RemediationExceptionResourceKey)? = nil
      ) : Types::DescribeRemediationExceptionsResponse

        input = Types::DescribeRemediationExceptionsRequest.new(config_rule_name: config_rule_name, limit: limit, next_token: next_token, resource_keys: resource_keys)
        describe_remediation_exceptions(input)
      end

      def describe_remediation_exceptions(input : Types::DescribeRemediationExceptionsRequest) : Types::DescribeRemediationExceptionsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REMEDIATION_EXCEPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRemediationExceptionsResponse, "DescribeRemediationExceptions")
      end

      # Provides a detailed view of a Remediation Execution for a set of resources including state,
      # timestamps for when steps for the remediation execution occur, and any error messages for steps that
      # have failed. When you specify the limit and the next token, you receive a paginated response.

      def describe_remediation_execution_status(
        config_rule_name : String,
        limit : Int32? = nil,
        next_token : String? = nil,
        resource_keys : Array(Types::ResourceKey)? = nil
      ) : Types::DescribeRemediationExecutionStatusResponse

        input = Types::DescribeRemediationExecutionStatusRequest.new(config_rule_name: config_rule_name, limit: limit, next_token: next_token, resource_keys: resource_keys)
        describe_remediation_execution_status(input)
      end

      def describe_remediation_execution_status(input : Types::DescribeRemediationExecutionStatusRequest) : Types::DescribeRemediationExecutionStatusResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_REMEDIATION_EXECUTION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRemediationExecutionStatusResponse, "DescribeRemediationExecutionStatus")
      end

      # Returns the details of one or more retention configurations. If the retention configuration name is
      # not specified, this operation returns the details for all the retention configurations for that
      # account. Currently, Config supports only one retention configuration per region in your account.

      def describe_retention_configurations(
        next_token : String? = nil,
        retention_configuration_names : Array(String)? = nil
      ) : Types::DescribeRetentionConfigurationsResponse

        input = Types::DescribeRetentionConfigurationsRequest.new(next_token: next_token, retention_configuration_names: retention_configuration_names)
        describe_retention_configurations(input)
      end

      def describe_retention_configurations(input : Types::DescribeRetentionConfigurationsRequest) : Types::DescribeRetentionConfigurationsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RETENTION_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeRetentionConfigurationsResponse, "DescribeRetentionConfigurations")
      end

      # Removes all resource types specified in the ResourceTypes list from the RecordingGroup of
      # configuration recorder and excludes these resource types when recording. For this operation, the
      # configuration recorder must use a RecordingStrategy that is either INCLUSION_BY_RESOURCE_TYPES or
      # EXCLUSION_BY_RESOURCE_TYPES .

      def disassociate_resource_types(
        configuration_recorder_arn : String,
        resource_types : Array(String)
      ) : Types::DisassociateResourceTypesResponse

        input = Types::DisassociateResourceTypesRequest.new(configuration_recorder_arn: configuration_recorder_arn, resource_types: resource_types)
        disassociate_resource_types(input)
      end

      def disassociate_resource_types(input : Types::DisassociateResourceTypesRequest) : Types::DisassociateResourceTypesResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_RESOURCE_TYPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateResourceTypesResponse, "DisassociateResourceTypes")
      end

      # Returns the evaluation results for the specified Config rule for a specific resource in a rule. The
      # results indicate which Amazon Web Services resources were evaluated by the rule, when each resource
      # was last evaluated, and whether each resource complies with the rule. The results can return an
      # empty result page. But if you have a nextToken , the results are displayed on the next page.

      def get_aggregate_compliance_details_by_config_rule(
        account_id : String,
        aws_region : String,
        config_rule_name : String,
        configuration_aggregator_name : String,
        compliance_type : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetAggregateComplianceDetailsByConfigRuleResponse

        input = Types::GetAggregateComplianceDetailsByConfigRuleRequest.new(account_id: account_id, aws_region: aws_region, config_rule_name: config_rule_name, configuration_aggregator_name: configuration_aggregator_name, compliance_type: compliance_type, limit: limit, next_token: next_token)
        get_aggregate_compliance_details_by_config_rule(input)
      end

      def get_aggregate_compliance_details_by_config_rule(input : Types::GetAggregateComplianceDetailsByConfigRuleRequest) : Types::GetAggregateComplianceDetailsByConfigRuleResponse
        request = Protocol::JsonRpc.build_request(Model::GET_AGGREGATE_COMPLIANCE_DETAILS_BY_CONFIG_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAggregateComplianceDetailsByConfigRuleResponse, "GetAggregateComplianceDetailsByConfigRule")
      end

      # Returns the number of compliant and noncompliant rules for one or more accounts and regions in an
      # aggregator. The results can return an empty result page, but if you have a nextToken, the results
      # are displayed on the next page.

      def get_aggregate_config_rule_compliance_summary(
        configuration_aggregator_name : String,
        filters : Types::ConfigRuleComplianceSummaryFilters? = nil,
        group_by_key : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetAggregateConfigRuleComplianceSummaryResponse

        input = Types::GetAggregateConfigRuleComplianceSummaryRequest.new(configuration_aggregator_name: configuration_aggregator_name, filters: filters, group_by_key: group_by_key, limit: limit, next_token: next_token)
        get_aggregate_config_rule_compliance_summary(input)
      end

      def get_aggregate_config_rule_compliance_summary(input : Types::GetAggregateConfigRuleComplianceSummaryRequest) : Types::GetAggregateConfigRuleComplianceSummaryResponse
        request = Protocol::JsonRpc.build_request(Model::GET_AGGREGATE_CONFIG_RULE_COMPLIANCE_SUMMARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAggregateConfigRuleComplianceSummaryResponse, "GetAggregateConfigRuleComplianceSummary")
      end

      # Returns the count of compliant and noncompliant conformance packs across all Amazon Web Services
      # accounts and Amazon Web Services Regions in an aggregator. You can filter based on Amazon Web
      # Services account ID or Amazon Web Services Region. The results can return an empty result page, but
      # if you have a nextToken, the results are displayed on the next page.

      def get_aggregate_conformance_pack_compliance_summary(
        configuration_aggregator_name : String,
        filters : Types::AggregateConformancePackComplianceSummaryFilters? = nil,
        group_by_key : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetAggregateConformancePackComplianceSummaryResponse

        input = Types::GetAggregateConformancePackComplianceSummaryRequest.new(configuration_aggregator_name: configuration_aggregator_name, filters: filters, group_by_key: group_by_key, limit: limit, next_token: next_token)
        get_aggregate_conformance_pack_compliance_summary(input)
      end

      def get_aggregate_conformance_pack_compliance_summary(input : Types::GetAggregateConformancePackComplianceSummaryRequest) : Types::GetAggregateConformancePackComplianceSummaryResponse
        request = Protocol::JsonRpc.build_request(Model::GET_AGGREGATE_CONFORMANCE_PACK_COMPLIANCE_SUMMARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAggregateConformancePackComplianceSummaryResponse, "GetAggregateConformancePackComplianceSummary")
      end

      # Returns the resource counts across accounts and regions that are present in your Config aggregator.
      # You can request the resource counts by providing filters and GroupByKey. For example, if the input
      # contains accountID 12345678910 and region us-east-1 in filters, the API returns the count of
      # resources in account ID 12345678910 and region us-east-1. If the input contains ACCOUNT_ID as a
      # GroupByKey, the API returns resource counts for all source accounts that are present in your
      # aggregator.

      def get_aggregate_discovered_resource_counts(
        configuration_aggregator_name : String,
        filters : Types::ResourceCountFilters? = nil,
        group_by_key : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetAggregateDiscoveredResourceCountsResponse

        input = Types::GetAggregateDiscoveredResourceCountsRequest.new(configuration_aggregator_name: configuration_aggregator_name, filters: filters, group_by_key: group_by_key, limit: limit, next_token: next_token)
        get_aggregate_discovered_resource_counts(input)
      end

      def get_aggregate_discovered_resource_counts(input : Types::GetAggregateDiscoveredResourceCountsRequest) : Types::GetAggregateDiscoveredResourceCountsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_AGGREGATE_DISCOVERED_RESOURCE_COUNTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAggregateDiscoveredResourceCountsResponse, "GetAggregateDiscoveredResourceCounts")
      end

      # Returns configuration item that is aggregated for your specific resource in a specific source
      # account and region. The API does not return results for deleted resources.

      def get_aggregate_resource_config(
        configuration_aggregator_name : String,
        resource_identifier : Types::AggregateResourceIdentifier
      ) : Types::GetAggregateResourceConfigResponse

        input = Types::GetAggregateResourceConfigRequest.new(configuration_aggregator_name: configuration_aggregator_name, resource_identifier: resource_identifier)
        get_aggregate_resource_config(input)
      end

      def get_aggregate_resource_config(input : Types::GetAggregateResourceConfigRequest) : Types::GetAggregateResourceConfigResponse
        request = Protocol::JsonRpc.build_request(Model::GET_AGGREGATE_RESOURCE_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAggregateResourceConfigResponse, "GetAggregateResourceConfig")
      end

      # Returns the evaluation results for the specified Config rule. The results indicate which Amazon Web
      # Services resources were evaluated by the rule, when each resource was last evaluated, and whether
      # each resource complies with the rule.

      def get_compliance_details_by_config_rule(
        config_rule_name : String,
        compliance_types : Array(String)? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetComplianceDetailsByConfigRuleResponse

        input = Types::GetComplianceDetailsByConfigRuleRequest.new(config_rule_name: config_rule_name, compliance_types: compliance_types, limit: limit, next_token: next_token)
        get_compliance_details_by_config_rule(input)
      end

      def get_compliance_details_by_config_rule(input : Types::GetComplianceDetailsByConfigRuleRequest) : Types::GetComplianceDetailsByConfigRuleResponse
        request = Protocol::JsonRpc.build_request(Model::GET_COMPLIANCE_DETAILS_BY_CONFIG_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetComplianceDetailsByConfigRuleResponse, "GetComplianceDetailsByConfigRule")
      end

      # Returns the evaluation results for the specified Amazon Web Services resource. The results indicate
      # which Config rules were used to evaluate the resource, when each rule was last invoked, and whether
      # the resource complies with each rule.

      def get_compliance_details_by_resource(
        compliance_types : Array(String)? = nil,
        next_token : String? = nil,
        resource_evaluation_id : String? = nil,
        resource_id : String? = nil,
        resource_type : String? = nil
      ) : Types::GetComplianceDetailsByResourceResponse

        input = Types::GetComplianceDetailsByResourceRequest.new(compliance_types: compliance_types, next_token: next_token, resource_evaluation_id: resource_evaluation_id, resource_id: resource_id, resource_type: resource_type)
        get_compliance_details_by_resource(input)
      end

      def get_compliance_details_by_resource(input : Types::GetComplianceDetailsByResourceRequest) : Types::GetComplianceDetailsByResourceResponse
        request = Protocol::JsonRpc.build_request(Model::GET_COMPLIANCE_DETAILS_BY_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetComplianceDetailsByResourceResponse, "GetComplianceDetailsByResource")
      end

      # Returns the number of Config rules that are compliant and noncompliant, up to a maximum of 25 for
      # each.


      def get_compliance_summary_by_config_rule : Types::GetComplianceSummaryByConfigRuleResponse
        request = Protocol::JsonRpc.build_request(Model::GET_COMPLIANCE_SUMMARY_BY_CONFIG_RULE, nil, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetComplianceSummaryByConfigRuleResponse, "GetComplianceSummaryByConfigRule")
      end

      # Returns the number of resources that are compliant and the number that are noncompliant. You can
      # specify one or more resource types to get these numbers for each resource type. The maximum number
      # returned is 100.

      def get_compliance_summary_by_resource_type(
        resource_types : Array(String)? = nil
      ) : Types::GetComplianceSummaryByResourceTypeResponse

        input = Types::GetComplianceSummaryByResourceTypeRequest.new(resource_types: resource_types)
        get_compliance_summary_by_resource_type(input)
      end

      def get_compliance_summary_by_resource_type(input : Types::GetComplianceSummaryByResourceTypeRequest) : Types::GetComplianceSummaryByResourceTypeResponse
        request = Protocol::JsonRpc.build_request(Model::GET_COMPLIANCE_SUMMARY_BY_RESOURCE_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetComplianceSummaryByResourceTypeResponse, "GetComplianceSummaryByResourceType")
      end

      # Returns compliance details of a conformance pack for all Amazon Web Services resources that are
      # monitered by conformance pack.

      def get_conformance_pack_compliance_details(
        conformance_pack_name : String,
        filters : Types::ConformancePackEvaluationFilters? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetConformancePackComplianceDetailsResponse

        input = Types::GetConformancePackComplianceDetailsRequest.new(conformance_pack_name: conformance_pack_name, filters: filters, limit: limit, next_token: next_token)
        get_conformance_pack_compliance_details(input)
      end

      def get_conformance_pack_compliance_details(input : Types::GetConformancePackComplianceDetailsRequest) : Types::GetConformancePackComplianceDetailsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CONFORMANCE_PACK_COMPLIANCE_DETAILS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetConformancePackComplianceDetailsResponse, "GetConformancePackComplianceDetails")
      end

      # Returns compliance details for the conformance pack based on the cumulative compliance results of
      # all the rules in that conformance pack.

      def get_conformance_pack_compliance_summary(
        conformance_pack_names : Array(String),
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetConformancePackComplianceSummaryResponse

        input = Types::GetConformancePackComplianceSummaryRequest.new(conformance_pack_names: conformance_pack_names, limit: limit, next_token: next_token)
        get_conformance_pack_compliance_summary(input)
      end

      def get_conformance_pack_compliance_summary(input : Types::GetConformancePackComplianceSummaryRequest) : Types::GetConformancePackComplianceSummaryResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CONFORMANCE_PACK_COMPLIANCE_SUMMARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetConformancePackComplianceSummaryResponse, "GetConformancePackComplianceSummary")
      end

      # Returns the policy definition containing the logic for your Config Custom Policy rule.

      def get_custom_rule_policy(
        config_rule_name : String? = nil
      ) : Types::GetCustomRulePolicyResponse

        input = Types::GetCustomRulePolicyRequest.new(config_rule_name: config_rule_name)
        get_custom_rule_policy(input)
      end

      def get_custom_rule_policy(input : Types::GetCustomRulePolicyRequest) : Types::GetCustomRulePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CUSTOM_RULE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCustomRulePolicyResponse, "GetCustomRulePolicy")
      end

      # Returns the resource types, the number of each resource type, and the total number of resources that
      # Config is recording in this region for your Amazon Web Services account. Example Config is recording
      # three resource types in the US East (Ohio) Region for your account: 25 EC2 instances, 20 IAM users,
      # and 15 S3 buckets. You make a call to the GetDiscoveredResourceCounts action and specify that you
      # want all resource types. Config returns the following: The resource types (EC2 instances, IAM users,
      # and S3 buckets). The number of each resource type (25, 20, and 15). The total number of all
      # resources (60). The response is paginated. By default, Config lists 100 ResourceCount objects on
      # each page. You can customize this number with the limit parameter. The response includes a nextToken
      # string. To get the next page of results, run the request again and specify the string for the
      # nextToken parameter. If you make a call to the GetDiscoveredResourceCounts action, you might not
      # immediately receive resource counts in the following situations: You are a new Config customer. You
      # just enabled resource recording. It might take a few minutes for Config to record and count your
      # resources. Wait a few minutes and then retry the GetDiscoveredResourceCounts action.

      def get_discovered_resource_counts(
        limit : Int32? = nil,
        next_token : String? = nil,
        resource_types : Array(String)? = nil
      ) : Types::GetDiscoveredResourceCountsResponse

        input = Types::GetDiscoveredResourceCountsRequest.new(limit: limit, next_token: next_token, resource_types: resource_types)
        get_discovered_resource_counts(input)
      end

      def get_discovered_resource_counts(input : Types::GetDiscoveredResourceCountsRequest) : Types::GetDiscoveredResourceCountsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DISCOVERED_RESOURCE_COUNTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDiscoveredResourceCountsResponse, "GetDiscoveredResourceCounts")
      end

      # Returns detailed status for each member account within an organization for a given organization
      # Config rule.

      def get_organization_config_rule_detailed_status(
        organization_config_rule_name : String,
        filters : Types::StatusDetailFilters? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetOrganizationConfigRuleDetailedStatusResponse

        input = Types::GetOrganizationConfigRuleDetailedStatusRequest.new(organization_config_rule_name: organization_config_rule_name, filters: filters, limit: limit, next_token: next_token)
        get_organization_config_rule_detailed_status(input)
      end

      def get_organization_config_rule_detailed_status(input : Types::GetOrganizationConfigRuleDetailedStatusRequest) : Types::GetOrganizationConfigRuleDetailedStatusResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ORGANIZATION_CONFIG_RULE_DETAILED_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOrganizationConfigRuleDetailedStatusResponse, "GetOrganizationConfigRuleDetailedStatus")
      end

      # Returns detailed status for each member account within an organization for a given organization
      # conformance pack.

      def get_organization_conformance_pack_detailed_status(
        organization_conformance_pack_name : String,
        filters : Types::OrganizationResourceDetailedStatusFilters? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetOrganizationConformancePackDetailedStatusResponse

        input = Types::GetOrganizationConformancePackDetailedStatusRequest.new(organization_conformance_pack_name: organization_conformance_pack_name, filters: filters, limit: limit, next_token: next_token)
        get_organization_conformance_pack_detailed_status(input)
      end

      def get_organization_conformance_pack_detailed_status(input : Types::GetOrganizationConformancePackDetailedStatusRequest) : Types::GetOrganizationConformancePackDetailedStatusResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ORGANIZATION_CONFORMANCE_PACK_DETAILED_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOrganizationConformancePackDetailedStatusResponse, "GetOrganizationConformancePackDetailedStatus")
      end

      # Returns the policy definition containing the logic for your organization Config Custom Policy rule.

      def get_organization_custom_rule_policy(
        organization_config_rule_name : String
      ) : Types::GetOrganizationCustomRulePolicyResponse

        input = Types::GetOrganizationCustomRulePolicyRequest.new(organization_config_rule_name: organization_config_rule_name)
        get_organization_custom_rule_policy(input)
      end

      def get_organization_custom_rule_policy(input : Types::GetOrganizationCustomRulePolicyRequest) : Types::GetOrganizationCustomRulePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ORGANIZATION_CUSTOM_RULE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOrganizationCustomRulePolicyResponse, "GetOrganizationCustomRulePolicy")
      end

      # For accurate reporting on the compliance status, you must record the AWS::Config::ResourceCompliance
      # resource type. For more information, see Recording Amazon Web Services Resources in the Config
      # Resources Developer Guide . Returns a list of configurations items (CIs) for the specified resource.
      # Contents The list contains details about each state of the resource during the specified time
      # interval. If you specified a retention period to retain your CIs between a minimum of 30 days and a
      # maximum of 7 years (2557 days), Config returns the CIs for the specified retention period.
      # Pagination The response is paginated. By default, Config returns a limit of 10 configuration items
      # per page. You can customize this number with the limit parameter. The response includes a nextToken
      # string. To get the next page of results, run the request again and specify the string for the
      # nextToken parameter. Each call to the API is limited to span a duration of seven days. It is likely
      # that the number of records returned is smaller than the specified limit . In such cases, you can
      # make another call, using the nextToken .

      def get_resource_config_history(
        resource_id : String,
        resource_type : String,
        chronological_order : String? = nil,
        earlier_time : Time? = nil,
        later_time : Time? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetResourceConfigHistoryResponse

        input = Types::GetResourceConfigHistoryRequest.new(resource_id: resource_id, resource_type: resource_type, chronological_order: chronological_order, earlier_time: earlier_time, later_time: later_time, limit: limit, next_token: next_token)
        get_resource_config_history(input)
      end

      def get_resource_config_history(input : Types::GetResourceConfigHistoryRequest) : Types::GetResourceConfigHistoryResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_CONFIG_HISTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourceConfigHistoryResponse, "GetResourceConfigHistory")
      end

      # Returns a summary of resource evaluation for the specified resource evaluation ID from the proactive
      # rules that were run. The results indicate which evaluation context was used to evaluate the rules,
      # which resource details were evaluated, the evaluation mode that was run, and whether the resource
      # details comply with the configuration of the proactive rules. To see additional information about
      # the evaluation result, such as which rule flagged a resource as NON_COMPLIANT, use the
      # GetComplianceDetailsByResource API. For more information, see the Examples section.

      def get_resource_evaluation_summary(
        resource_evaluation_id : String
      ) : Types::GetResourceEvaluationSummaryResponse

        input = Types::GetResourceEvaluationSummaryRequest.new(resource_evaluation_id: resource_evaluation_id)
        get_resource_evaluation_summary(input)
      end

      def get_resource_evaluation_summary(input : Types::GetResourceEvaluationSummaryRequest) : Types::GetResourceEvaluationSummaryResponse
        request = Protocol::JsonRpc.build_request(Model::GET_RESOURCE_EVALUATION_SUMMARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetResourceEvaluationSummaryResponse, "GetResourceEvaluationSummary")
      end

      # Returns the details of a specific stored query.

      def get_stored_query(
        query_name : String
      ) : Types::GetStoredQueryResponse

        input = Types::GetStoredQueryRequest.new(query_name: query_name)
        get_stored_query(input)
      end

      def get_stored_query(input : Types::GetStoredQueryRequest) : Types::GetStoredQueryResponse
        request = Protocol::JsonRpc.build_request(Model::GET_STORED_QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetStoredQueryResponse, "GetStoredQuery")
      end

      # Accepts a resource type and returns a list of resource identifiers that are aggregated for a
      # specific resource type across accounts and regions. A resource identifier includes the resource
      # type, ID, (if available) the custom resource name, source account, and source region. You can narrow
      # the results to include only resources that have specific resource IDs, or a resource name, or source
      # account ID, or source region. For example, if the input consists of accountID 12345678910 and the
      # region is us-east-1 for resource type AWS::EC2::Instance then the API returns all the EC2 instance
      # identifiers of accountID 12345678910 and region us-east-1.

      def list_aggregate_discovered_resources(
        configuration_aggregator_name : String,
        resource_type : String,
        filters : Types::ResourceFilters? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAggregateDiscoveredResourcesResponse

        input = Types::ListAggregateDiscoveredResourcesRequest.new(configuration_aggregator_name: configuration_aggregator_name, resource_type: resource_type, filters: filters, limit: limit, next_token: next_token)
        list_aggregate_discovered_resources(input)
      end

      def list_aggregate_discovered_resources(input : Types::ListAggregateDiscoveredResourcesRequest) : Types::ListAggregateDiscoveredResourcesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_AGGREGATE_DISCOVERED_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAggregateDiscoveredResourcesResponse, "ListAggregateDiscoveredResources")
      end

      # Returns a list of configuration recorders depending on the filters you specify.

      def list_configuration_recorders(
        filters : Array(Types::ConfigurationRecorderFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListConfigurationRecordersResponse

        input = Types::ListConfigurationRecordersRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_configuration_recorders(input)
      end

      def list_configuration_recorders(input : Types::ListConfigurationRecordersRequest) : Types::ListConfigurationRecordersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CONFIGURATION_RECORDERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListConfigurationRecordersResponse, "ListConfigurationRecorders")
      end

      # Returns a list of conformance pack compliance scores. A compliance score is the percentage of the
      # number of compliant rule-resource combinations in a conformance pack compared to the number of total
      # possible rule-resource combinations in the conformance pack. This metric provides you with a
      # high-level view of the compliance state of your conformance packs. You can use it to identify,
      # investigate, and understand the level of compliance in your conformance packs. Conformance packs
      # with no evaluation results will have a compliance score of INSUFFICIENT_DATA .

      def list_conformance_pack_compliance_scores(
        filters : Types::ConformancePackComplianceScoresFilters? = nil,
        limit : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil,
        sort_order : String? = nil
      ) : Types::ListConformancePackComplianceScoresResponse

        input = Types::ListConformancePackComplianceScoresRequest.new(filters: filters, limit: limit, next_token: next_token, sort_by: sort_by, sort_order: sort_order)
        list_conformance_pack_compliance_scores(input)
      end

      def list_conformance_pack_compliance_scores(input : Types::ListConformancePackComplianceScoresRequest) : Types::ListConformancePackComplianceScoresResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CONFORMANCE_PACK_COMPLIANCE_SCORES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListConformancePackComplianceScoresResponse, "ListConformancePackComplianceScores")
      end

      # Returns a list of resource resource identifiers for the specified resource types for the resources
      # of that type. A resource identifier includes the resource type, ID, and (if available) the custom
      # resource name. The results consist of resources that Config has discovered , including those that
      # Config is not currently recording. You can narrow the results to include only resources that have
      # specific resource IDs or a resource name. You can specify either resource IDs or a resource name,
      # but not both, in the same request. CloudFormation stack recording behavior in Config When a
      # CloudFormation stack fails to create (for example, it enters the ROLLBACK_FAILED state), Config does
      # not record a configuration item (CI) for that stack. Configuration items are only recorded for
      # stacks that reach the following states: CREATE_COMPLETE UPDATE_COMPLETE UPDATE_ROLLBACK_COMPLETE
      # UPDATE_ROLLBACK_FAILED DELETE_FAILED DELETE_COMPLETE Because no CI is created for a failed stack
      # creation, you won't see configuration history for that stack in Config, even after the stack is
      # deleted. This helps make sure that Config only tracks resources that were successfully provisioned.

      def list_discovered_resources(
        resource_type : String,
        include_deleted_resources : Bool? = nil,
        limit : Int32? = nil,
        next_token : String? = nil,
        resource_ids : Array(String)? = nil,
        resource_name : String? = nil
      ) : Types::ListDiscoveredResourcesResponse

        input = Types::ListDiscoveredResourcesRequest.new(resource_type: resource_type, include_deleted_resources: include_deleted_resources, limit: limit, next_token: next_token, resource_ids: resource_ids, resource_name: resource_name)
        list_discovered_resources(input)
      end

      def list_discovered_resources(input : Types::ListDiscoveredResourcesRequest) : Types::ListDiscoveredResourcesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DISCOVERED_RESOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDiscoveredResourcesResponse, "ListDiscoveredResources")
      end

      # Returns a list of proactive resource evaluations.

      def list_resource_evaluations(
        filters : Types::ResourceEvaluationFilters? = nil,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListResourceEvaluationsResponse

        input = Types::ListResourceEvaluationsRequest.new(filters: filters, limit: limit, next_token: next_token)
        list_resource_evaluations(input)
      end

      def list_resource_evaluations(input : Types::ListResourceEvaluationsRequest) : Types::ListResourceEvaluationsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_RESOURCE_EVALUATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListResourceEvaluationsResponse, "ListResourceEvaluations")
      end

      # Lists the stored queries for a single Amazon Web Services account and a single Amazon Web Services
      # Region. The default is 100.

      def list_stored_queries(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListStoredQueriesResponse

        input = Types::ListStoredQueriesRequest.new(max_results: max_results, next_token: next_token)
        list_stored_queries(input)
      end

      def list_stored_queries(input : Types::ListStoredQueriesRequest) : Types::ListStoredQueriesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_STORED_QUERIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListStoredQueriesResponse, "ListStoredQueries")
      end

      # List the tags for Config resource.

      def list_tags_for_resource(
        resource_arn : String,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn, limit: limit, next_token: next_token)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Authorizes the aggregator account and region to collect data from the source account and region.
      # Tags are added at creation and cannot be updated with this operation PutAggregationAuthorization is
      # an idempotent API. Subsequent requests won’t create a duplicate resource if one was already created.
      # If a following request has different tags values, Config will ignore these differences and treat it
      # as an idempotent request of the previous. In this case, tags will not be updated, even if they are
      # different. Use TagResource and UntagResource to update tags after creation.

      def put_aggregation_authorization(
        authorized_account_id : String,
        authorized_aws_region : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::PutAggregationAuthorizationResponse

        input = Types::PutAggregationAuthorizationRequest.new(authorized_account_id: authorized_account_id, authorized_aws_region: authorized_aws_region, tags: tags)
        put_aggregation_authorization(input)
      end

      def put_aggregation_authorization(input : Types::PutAggregationAuthorizationRequest) : Types::PutAggregationAuthorizationResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_AGGREGATION_AUTHORIZATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutAggregationAuthorizationResponse, "PutAggregationAuthorization")
      end

      # Adds or updates an Config rule to evaluate if your Amazon Web Services resources comply with your
      # desired configurations. For information on how many Config rules you can have per account, see
      # Service Limits in the Config Developer Guide . There are two types of rules: Config Managed Rules
      # and Config Custom Rules . You can use PutConfigRule to create both Config Managed Rules and Config
      # Custom Rules. Config Managed Rules are predefined, customizable rules created by Config. For a list
      # of managed rules, see List of Config Managed Rules . If you are adding an Config managed rule, you
      # must specify the rule's identifier for the SourceIdentifier key. Config Custom Rules are rules that
      # you create from scratch. There are two ways to create Config custom rules: with Lambda functions (
      # Lambda Developer Guide ) and with Guard ( Guard GitHub Repository ), a policy-as-code language.
      # Config custom rules created with Lambda are called Config Custom Lambda Rules and Config custom
      # rules created with Guard are called Config Custom Policy Rules . If you are adding a new Config
      # Custom Lambda rule, you first need to create an Lambda function that the rule invokes to evaluate
      # your resources. When you use PutConfigRule to add a Custom Lambda rule to Config, you must specify
      # the Amazon Resource Name (ARN) that Lambda assigns to the function. You specify the ARN in the
      # SourceIdentifier key. This key is part of the Source object, which is part of the ConfigRule object.
      # For any new Config rule that you add, specify the ConfigRuleName in the ConfigRule object. Do not
      # specify the ConfigRuleArn or the ConfigRuleId . These values are generated by Config for new rules.
      # If you are updating a rule that you added previously, you can specify the rule by ConfigRuleName ,
      # ConfigRuleId , or ConfigRuleArn in the ConfigRule data type that you use in this request. For more
      # information about developing and using Config rules, see Evaluating Resources with Config Rules in
      # the Config Developer Guide . Tags are added at creation and cannot be updated with this operation
      # PutConfigRule is an idempotent API. Subsequent requests won’t create a duplicate resource if one was
      # already created. If a following request has different tags values, Config will ignore these
      # differences and treat it as an idempotent request of the previous. In this case, tags will not be
      # updated, even if they are different. Use TagResource and UntagResource to update tags after
      # creation.

      def put_config_rule(
        config_rule : Types::ConfigRule,
        tags : Array(Types::Tag)? = nil
      ) : Nil

        input = Types::PutConfigRuleRequest.new(config_rule: config_rule, tags: tags)
        put_config_rule(input)
      end

      def put_config_rule(input : Types::PutConfigRuleRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUT_CONFIG_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Creates and updates the configuration aggregator with the selected source accounts and regions. The
      # source account can be individual account(s) or an organization. accountIds that are passed will be
      # replaced with existing accounts. If you want to add additional accounts into the aggregator, call
      # DescribeConfigurationAggregators to get the previous accounts and then append new ones. Config
      # should be enabled in source accounts and regions you want to aggregate. If your source type is an
      # organization, you must be signed in to the management account or a registered delegated
      # administrator and all the features must be enabled in your organization. If the caller is a
      # management account, Config calls EnableAwsServiceAccess API to enable integration between Config and
      # Organizations. If the caller is a registered delegated administrator, Config calls
      # ListDelegatedAdministrators API to verify whether the caller is a valid delegated administrator. To
      # register a delegated administrator, see Register a Delegated Administrator in the Config developer
      # guide . Tags are added at creation and cannot be updated with this operation
      # PutConfigurationAggregator is an idempotent API. Subsequent requests won’t create a duplicate
      # resource if one was already created. If a following request has different tags values, Config will
      # ignore these differences and treat it as an idempotent request of the previous. In this case, tags
      # will not be updated, even if they are different. Use TagResource and UntagResource to update tags
      # after creation.

      def put_configuration_aggregator(
        configuration_aggregator_name : String,
        account_aggregation_sources : Array(Types::AccountAggregationSource)? = nil,
        aggregator_filters : Types::AggregatorFilters? = nil,
        organization_aggregation_source : Types::OrganizationAggregationSource? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::PutConfigurationAggregatorResponse

        input = Types::PutConfigurationAggregatorRequest.new(configuration_aggregator_name: configuration_aggregator_name, account_aggregation_sources: account_aggregation_sources, aggregator_filters: aggregator_filters, organization_aggregation_source: organization_aggregation_source, tags: tags)
        put_configuration_aggregator(input)
      end

      def put_configuration_aggregator(input : Types::PutConfigurationAggregatorRequest) : Types::PutConfigurationAggregatorResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_CONFIGURATION_AGGREGATOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutConfigurationAggregatorResponse, "PutConfigurationAggregator")
      end

      # Creates or updates the customer managed configuration recorder. You can use this operation to create
      # a new customer managed configuration recorder or to update the roleARN and the recordingGroup for an
      # existing customer managed configuration recorder. To start the customer managed configuration
      # recorder and begin recording configuration changes for the resource types you specify, use the
      # StartConfigurationRecorder operation. For more information, see Working with the Configuration
      # Recorder in the Config Developer Guide . One customer managed configuration recorder per account per
      # Region You can create only one customer managed configuration recorder for each account for each
      # Amazon Web Services Region. Default is to record all supported resource types, excluding the global
      # IAM resource types If you have not specified values for the recordingGroup field, the default for
      # the customer managed configuration recorder is to record all supported resource types, excluding the
      # global IAM resource types: AWS::IAM::Group , AWS::IAM::Policy , AWS::IAM::Role , and AWS::IAM::User
      # . Tags are added at creation and cannot be updated PutConfigurationRecorder is an idempotent API.
      # Subsequent requests won’t create a duplicate resource if one was already created. If a following
      # request has different tags values, Config will ignore these differences and treat it as an
      # idempotent request of the previous. In this case, tags will not be updated, even if they are
      # different. Use TagResource and UntagResource to update tags after creation.

      def put_configuration_recorder(
        configuration_recorder : Types::ConfigurationRecorder,
        tags : Array(Types::Tag)? = nil
      ) : Nil

        input = Types::PutConfigurationRecorderRequest.new(configuration_recorder: configuration_recorder, tags: tags)
        put_configuration_recorder(input)
      end

      def put_configuration_recorder(input : Types::PutConfigurationRecorderRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUT_CONFIGURATION_RECORDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Creates or updates a conformance pack. A conformance pack is a collection of Config rules that can
      # be easily deployed in an account and a region and across an organization. For information on how
      # many conformance packs you can have per account, see Service Limits in the Config Developer Guide .
      # When you use PutConformancePack to deploy conformance packs in your account, the operation can
      # create Config rules and remediation actions without requiring config:PutConfigRule or
      # config:PutRemediationConfigurations permissions in your account IAM policies. This API uses the
      # AWSServiceRoleForConfigConforms service-linked role in your account to create conformance pack
      # resources. This service-linked role includes the permissions to create Config rules and remediation
      # configurations, even if your account IAM policies explicitly deny these actions. This API creates a
      # service-linked role AWSServiceRoleForConfigConforms in your account. The service-linked role is
      # created only when the role does not exist in your account. You must specify only one of the follow
      # parameters: TemplateS3Uri , TemplateBody or TemplateSSMDocumentDetails .

      def put_conformance_pack(
        conformance_pack_name : String,
        conformance_pack_input_parameters : Array(Types::ConformancePackInputParameter)? = nil,
        delivery_s3_bucket : String? = nil,
        delivery_s3_key_prefix : String? = nil,
        template_body : String? = nil,
        template_s3_uri : String? = nil,
        template_ssm_document_details : Types::TemplateSSMDocumentDetails? = nil
      ) : Types::PutConformancePackResponse

        input = Types::PutConformancePackRequest.new(conformance_pack_name: conformance_pack_name, conformance_pack_input_parameters: conformance_pack_input_parameters, delivery_s3_bucket: delivery_s3_bucket, delivery_s3_key_prefix: delivery_s3_key_prefix, template_body: template_body, template_s3_uri: template_s3_uri, template_ssm_document_details: template_ssm_document_details)
        put_conformance_pack(input)
      end

      def put_conformance_pack(input : Types::PutConformancePackRequest) : Types::PutConformancePackResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_CONFORMANCE_PACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutConformancePackResponse, "PutConformancePack")
      end

      # Creates or updates a delivery channel to deliver configuration information and other compliance
      # information. You can use this operation to create a new delivery channel or to update the Amazon S3
      # bucket and the Amazon SNS topic of an existing delivery channel. For more information, see Working
      # with the Delivery Channel in the Config Developer Guide. One delivery channel per account per Region
      # You can have only one delivery channel for each account for each Amazon Web Services Region.

      def put_delivery_channel(
        delivery_channel : Types::DeliveryChannel
      ) : Nil

        input = Types::PutDeliveryChannelRequest.new(delivery_channel: delivery_channel)
        put_delivery_channel(input)
      end

      def put_delivery_channel(input : Types::PutDeliveryChannelRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUT_DELIVERY_CHANNEL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Used by an Lambda function to deliver evaluation results to Config. This operation is required in
      # every Lambda function that is invoked by an Config rule.

      def put_evaluations(
        result_token : String,
        evaluations : Array(Types::Evaluation)? = nil,
        test_mode : Bool? = nil
      ) : Types::PutEvaluationsResponse

        input = Types::PutEvaluationsRequest.new(result_token: result_token, evaluations: evaluations, test_mode: test_mode)
        put_evaluations(input)
      end

      def put_evaluations(input : Types::PutEvaluationsRequest) : Types::PutEvaluationsResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_EVALUATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutEvaluationsResponse, "PutEvaluations")
      end

      # Add or updates the evaluations for process checks. This API checks if the rule is a process check
      # when the name of the Config rule is provided.

      def put_external_evaluation(
        config_rule_name : String,
        external_evaluation : Types::ExternalEvaluation
      ) : Types::PutExternalEvaluationResponse

        input = Types::PutExternalEvaluationRequest.new(config_rule_name: config_rule_name, external_evaluation: external_evaluation)
        put_external_evaluation(input)
      end

      def put_external_evaluation(input : Types::PutExternalEvaluationRequest) : Types::PutExternalEvaluationResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_EXTERNAL_EVALUATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutExternalEvaluationResponse, "PutExternalEvaluation")
      end

      # Adds or updates an Config rule for your entire organization to evaluate if your Amazon Web Services
      # resources comply with your desired configurations. For information on how many organization Config
      # rules you can have per account, see Service Limits in the Config Developer Guide . Only a management
      # account and a delegated administrator can create or update an organization Config rule. When calling
      # this API with a delegated administrator, you must ensure Organizations ListDelegatedAdministrator
      # permissions are added. An organization can have up to 3 delegated administrators. This API enables
      # organization service access through the EnableAWSServiceAccess action and creates a service-linked
      # role AWSServiceRoleForConfigMultiAccountSetup in the management or delegated administrator account
      # of your organization. The service-linked role is created only when the role does not exist in the
      # caller account. Config verifies the existence of role with GetRole action. To use this API with
      # delegated administrator, register a delegated administrator by calling Amazon Web Services
      # Organization register-delegated-administrator for config-multiaccountsetup.amazonaws.com . There are
      # two types of rules: Config Managed Rules and Config Custom Rules . You can use
      # PutOrganizationConfigRule to create both Config Managed Rules and Config Custom Rules. Config
      # Managed Rules are predefined, customizable rules created by Config. For a list of managed rules, see
      # List of Config Managed Rules . If you are adding an Config managed rule, you must specify the rule's
      # identifier for the RuleIdentifier key. Config Custom Rules are rules that you create from scratch.
      # There are two ways to create Config custom rules: with Lambda functions ( Lambda Developer Guide )
      # and with Guard ( Guard GitHub Repository ), a policy-as-code language. Config custom rules created
      # with Lambda are called Config Custom Lambda Rules and Config custom rules created with Guard are
      # called Config Custom Policy Rules . If you are adding a new Config Custom Lambda rule, you first
      # need to create an Lambda function in the management account or a delegated administrator that the
      # rule invokes to evaluate your resources. You also need to create an IAM role in the managed account
      # that can be assumed by the Lambda function. When you use PutOrganizationConfigRule to add a Custom
      # Lambda rule to Config, you must specify the Amazon Resource Name (ARN) that Lambda assigns to the
      # function. Prerequisite: Ensure you call EnableAllFeatures API to enable all features in an
      # organization. Make sure to specify one of either OrganizationCustomPolicyRuleMetadata for Custom
      # Policy rules, OrganizationCustomRuleMetadata for Custom Lambda rules, or
      # OrganizationManagedRuleMetadata for managed rules.

      def put_organization_config_rule(
        organization_config_rule_name : String,
        excluded_accounts : Array(String)? = nil,
        organization_custom_policy_rule_metadata : Types::OrganizationCustomPolicyRuleMetadata? = nil,
        organization_custom_rule_metadata : Types::OrganizationCustomRuleMetadata? = nil,
        organization_managed_rule_metadata : Types::OrganizationManagedRuleMetadata? = nil
      ) : Types::PutOrganizationConfigRuleResponse

        input = Types::PutOrganizationConfigRuleRequest.new(organization_config_rule_name: organization_config_rule_name, excluded_accounts: excluded_accounts, organization_custom_policy_rule_metadata: organization_custom_policy_rule_metadata, organization_custom_rule_metadata: organization_custom_rule_metadata, organization_managed_rule_metadata: organization_managed_rule_metadata)
        put_organization_config_rule(input)
      end

      def put_organization_config_rule(input : Types::PutOrganizationConfigRuleRequest) : Types::PutOrganizationConfigRuleResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_ORGANIZATION_CONFIG_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutOrganizationConfigRuleResponse, "PutOrganizationConfigRule")
      end

      # Deploys conformance packs across member accounts in an Amazon Web Services Organization. For
      # information on how many organization conformance packs and how many Config rules you can have per
      # account, see Service Limits in the Config Developer Guide . Only a management account and a
      # delegated administrator can call this API. When calling this API with a delegated administrator, you
      # must ensure Organizations ListDelegatedAdministrator permissions are added. An organization can have
      # up to 3 delegated administrators. When you use PutOrganizationConformancePack to deploy conformance
      # packs across member accounts, the operation can create Config rules and remediation actions without
      # requiring config:PutConfigRule or config:PutRemediationConfigurations permissions in member account
      # IAM policies. This API uses the AWSServiceRoleForConfigConforms service-linked role in each member
      # account to create conformance pack resources. This service-linked role includes the permissions to
      # create Config rules and remediation configurations, even if member account IAM policies explicitly
      # deny these actions. This API enables organization service access for
      # config-multiaccountsetup.amazonaws.com through the EnableAWSServiceAccess action and creates a
      # service-linked role AWSServiceRoleForConfigMultiAccountSetup in the management or delegated
      # administrator account of your organization. The service-linked role is created only when the role
      # does not exist in the caller account. To use this API with delegated administrator, register a
      # delegated administrator by calling Amazon Web Services Organization register-delegate-admin for
      # config-multiaccountsetup.amazonaws.com . Prerequisite: Ensure you call EnableAllFeatures API to
      # enable all features in an organization. You must specify either the TemplateS3Uri or the
      # TemplateBody parameter, but not both. If you provide both Config uses the TemplateS3Uri parameter
      # and ignores the TemplateBody parameter. Config sets the state of a conformance pack to
      # CREATE_IN_PROGRESS and UPDATE_IN_PROGRESS until the conformance pack is created or updated. You
      # cannot update a conformance pack while it is in this state.

      def put_organization_conformance_pack(
        organization_conformance_pack_name : String,
        conformance_pack_input_parameters : Array(Types::ConformancePackInputParameter)? = nil,
        delivery_s3_bucket : String? = nil,
        delivery_s3_key_prefix : String? = nil,
        excluded_accounts : Array(String)? = nil,
        template_body : String? = nil,
        template_s3_uri : String? = nil
      ) : Types::PutOrganizationConformancePackResponse

        input = Types::PutOrganizationConformancePackRequest.new(organization_conformance_pack_name: organization_conformance_pack_name, conformance_pack_input_parameters: conformance_pack_input_parameters, delivery_s3_bucket: delivery_s3_bucket, delivery_s3_key_prefix: delivery_s3_key_prefix, excluded_accounts: excluded_accounts, template_body: template_body, template_s3_uri: template_s3_uri)
        put_organization_conformance_pack(input)
      end

      def put_organization_conformance_pack(input : Types::PutOrganizationConformancePackRequest) : Types::PutOrganizationConformancePackResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_ORGANIZATION_CONFORMANCE_PACK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutOrganizationConformancePackResponse, "PutOrganizationConformancePack")
      end

      # Adds or updates the remediation configuration with a specific Config rule with the selected target
      # or action. The API creates the RemediationConfiguration object for the Config rule. The Config rule
      # must already exist for you to add a remediation configuration. The target (SSM document) must exist
      # and have permissions to use the target. Be aware of backward incompatible changes If you make
      # backward incompatible changes to the SSM document, you must call this again to ensure the
      # remediations can run. This API does not support adding remediation configurations for service-linked
      # Config Rules such as Organization Config rules, the rules deployed by conformance packs, and rules
      # deployed by Amazon Web Services Security Hub. Required fields For manual remediation configuration,
      # you need to provide a value for automationAssumeRole or use a value in the assumeRole field to
      # remediate your resources. The SSM automation document can use either as long as it maps to a valid
      # parameter. However, for automatic remediation configuration, the only valid assumeRole field value
      # is AutomationAssumeRole and you need to provide a value for AutomationAssumeRole to remediate your
      # resources. Auto remediation can be initiated even for compliant resources If you enable auto
      # remediation for a specific Config rule using the PutRemediationConfigurations API or the Config
      # console, it initiates the remediation process for all non-compliant resources for that specific
      # rule. The auto remediation process relies on the compliance data snapshot which is captured on a
      # periodic basis. Any non-compliant resource that is updated between the snapshot schedule will
      # continue to be remediated based on the last known compliance data snapshot. This means that in some
      # cases auto remediation can be initiated even for compliant resources, since the bootstrap processor
      # uses a database that can have stale evaluation results based on the last known compliance data
      # snapshot.

      def put_remediation_configurations(
        remediation_configurations : Array(Types::RemediationConfiguration)
      ) : Types::PutRemediationConfigurationsResponse

        input = Types::PutRemediationConfigurationsRequest.new(remediation_configurations: remediation_configurations)
        put_remediation_configurations(input)
      end

      def put_remediation_configurations(input : Types::PutRemediationConfigurationsRequest) : Types::PutRemediationConfigurationsResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_REMEDIATION_CONFIGURATIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutRemediationConfigurationsResponse, "PutRemediationConfigurations")
      end

      # A remediation exception is when a specified resource is no longer considered for auto-remediation.
      # This API adds a new exception or updates an existing exception for a specified resource with a
      # specified Config rule. Exceptions block auto remediation Config generates a remediation exception
      # when a problem occurs running a remediation action for a specified resource. Remediation exceptions
      # blocks auto-remediation until the exception is cleared. Manual remediation is recommended when
      # placing an exception When placing an exception on an Amazon Web Services resource, it is recommended
      # that remediation is set as manual remediation until the given Config rule for the specified resource
      # evaluates the resource as NON_COMPLIANT . Once the resource has been evaluated as NON_COMPLIANT ,
      # you can add remediation exceptions and change the remediation type back from Manual to Auto if you
      # want to use auto-remediation. Otherwise, using auto-remediation before a NON_COMPLIANT evaluation
      # result can delete resources before the exception is applied. Exceptions can only be performed on
      # non-compliant resources Placing an exception can only be performed on resources that are
      # NON_COMPLIANT . If you use this API for COMPLIANT resources or resources that are NOT_APPLICABLE , a
      # remediation exception will not be generated. For more information on the conditions that initiate
      # the possible Config evaluation results, see Concepts | Config Rules in the Config Developer Guide .
      # Exceptions cannot be placed on service-linked remediation actions You cannot place an exception on
      # service-linked remediation actions, such as remediation actions put by an organizational conformance
      # pack. Auto remediation can be initiated even for compliant resources If you enable auto remediation
      # for a specific Config rule using the PutRemediationConfigurations API or the Config console, it
      # initiates the remediation process for all non-compliant resources for that specific rule. The auto
      # remediation process relies on the compliance data snapshot which is captured on a periodic basis.
      # Any non-compliant resource that is updated between the snapshot schedule will continue to be
      # remediated based on the last known compliance data snapshot. This means that in some cases auto
      # remediation can be initiated even for compliant resources, since the bootstrap processor uses a
      # database that can have stale evaluation results based on the last known compliance data snapshot.

      def put_remediation_exceptions(
        config_rule_name : String,
        resource_keys : Array(Types::RemediationExceptionResourceKey),
        expiration_time : Time? = nil,
        message : String? = nil
      ) : Types::PutRemediationExceptionsResponse

        input = Types::PutRemediationExceptionsRequest.new(config_rule_name: config_rule_name, resource_keys: resource_keys, expiration_time: expiration_time, message: message)
        put_remediation_exceptions(input)
      end

      def put_remediation_exceptions(input : Types::PutRemediationExceptionsRequest) : Types::PutRemediationExceptionsResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_REMEDIATION_EXCEPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutRemediationExceptionsResponse, "PutRemediationExceptions")
      end

      # Records the configuration state for the resource provided in the request. The configuration state of
      # a resource is represented in Config as Configuration Items. Once this API records the configuration
      # item, you can retrieve the list of configuration items for the custom resource type using existing
      # Config APIs. The custom resource type must be registered with CloudFormation. This API accepts the
      # configuration item registered with CloudFormation. When you call this API, Config only stores
      # configuration state of the resource provided in the request. This API does not change or remediate
      # the configuration of the resource. Write-only schema properites are not recorded as part of the
      # published configuration item.

      def put_resource_config(
        configuration : String,
        resource_id : String,
        resource_type : String,
        schema_version_id : String,
        resource_name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Nil

        input = Types::PutResourceConfigRequest.new(configuration: configuration, resource_id: resource_id, resource_type: resource_type, schema_version_id: schema_version_id, resource_name: resource_name, tags: tags)
        put_resource_config(input)
      end

      def put_resource_config(input : Types::PutResourceConfigRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUT_RESOURCE_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Creates and updates the retention configuration with details about retention period (number of days)
      # that Config stores your historical information. The API creates the RetentionConfiguration object
      # and names the object as default . When you have a RetentionConfiguration object named default ,
      # calling the API modifies the default object. Currently, Config supports only one retention
      # configuration per region in your account.

      def put_retention_configuration(
        retention_period_in_days : Int32
      ) : Types::PutRetentionConfigurationResponse

        input = Types::PutRetentionConfigurationRequest.new(retention_period_in_days: retention_period_in_days)
        put_retention_configuration(input)
      end

      def put_retention_configuration(input : Types::PutRetentionConfigurationRequest) : Types::PutRetentionConfigurationResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_RETENTION_CONFIGURATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutRetentionConfigurationResponse, "PutRetentionConfiguration")
      end

      # Creates a service-linked configuration recorder that is linked to a specific Amazon Web Services
      # service based on the ServicePrincipal you specify. The configuration recorder's name ,
      # recordingGroup , recordingMode , and recordingScope is set by the service that is linked to the
      # configuration recorder. For more information and a list of supported services/service principals,
      # see Working with the Configuration Recorder in the Config Developer Guide . This API creates a
      # service-linked role AWSServiceRoleForConfig in your account. The service-linked role is created only
      # when the role does not exist in your account. The recording scope determines if you receive
      # configuration items The recording scope is set by the service that is linked to the configuration
      # recorder and determines whether you receive configuration items (CIs) in the delivery channel. If
      # the recording scope is internal, you will not receive CIs in the delivery channel. Tags are added at
      # creation and cannot be updated with this operation Use TagResource and UntagResource to update tags
      # after creation.

      def put_service_linked_configuration_recorder(
        service_principal : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::PutServiceLinkedConfigurationRecorderResponse

        input = Types::PutServiceLinkedConfigurationRecorderRequest.new(service_principal: service_principal, tags: tags)
        put_service_linked_configuration_recorder(input)
      end

      def put_service_linked_configuration_recorder(input : Types::PutServiceLinkedConfigurationRecorderRequest) : Types::PutServiceLinkedConfigurationRecorderResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_SERVICE_LINKED_CONFIGURATION_RECORDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutServiceLinkedConfigurationRecorderResponse, "PutServiceLinkedConfigurationRecorder")
      end

      # Saves a new query or updates an existing saved query. The QueryName must be unique for a single
      # Amazon Web Services account and a single Amazon Web Services Region. You can create upto 300 queries
      # in a single Amazon Web Services account and a single Amazon Web Services Region. Tags are added at
      # creation and cannot be updated PutStoredQuery is an idempotent API. Subsequent requests won’t create
      # a duplicate resource if one was already created. If a following request has different tags values,
      # Config will ignore these differences and treat it as an idempotent request of the previous. In this
      # case, tags will not be updated, even if they are different.

      def put_stored_query(
        stored_query : Types::StoredQuery,
        tags : Array(Types::Tag)? = nil
      ) : Types::PutStoredQueryResponse

        input = Types::PutStoredQueryRequest.new(stored_query: stored_query, tags: tags)
        put_stored_query(input)
      end

      def put_stored_query(input : Types::PutStoredQueryRequest) : Types::PutStoredQueryResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_STORED_QUERY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutStoredQueryResponse, "PutStoredQuery")
      end

      # Accepts a structured query language (SQL) SELECT command and an aggregator to query configuration
      # state of Amazon Web Services resources across multiple accounts and regions, performs the
      # corresponding search, and returns resource configurations matching the properties. For more
      # information about query components, see the Query Components section in the Config Developer Guide .
      # If you run an aggregation query (i.e., using GROUP BY or using aggregate functions such as COUNT ;
      # e.g., SELECT resourceId, COUNT(*) WHERE resourceType = 'AWS::IAM::Role' GROUP BY resourceId ) and do
      # not specify the MaxResults or the Limit query parameters, the default page size is set to 500. If
      # you run a non-aggregation query (i.e., not using GROUP BY or aggregate function; e.g., SELECT *
      # WHERE resourceType = 'AWS::IAM::Role' ) and do not specify the MaxResults or the Limit query
      # parameters, the default page size is set to 25.

      def select_aggregate_resource_config(
        configuration_aggregator_name : String,
        expression : String,
        limit : Int32? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::SelectAggregateResourceConfigResponse

        input = Types::SelectAggregateResourceConfigRequest.new(configuration_aggregator_name: configuration_aggregator_name, expression: expression, limit: limit, max_results: max_results, next_token: next_token)
        select_aggregate_resource_config(input)
      end

      def select_aggregate_resource_config(input : Types::SelectAggregateResourceConfigRequest) : Types::SelectAggregateResourceConfigResponse
        request = Protocol::JsonRpc.build_request(Model::SELECT_AGGREGATE_RESOURCE_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SelectAggregateResourceConfigResponse, "SelectAggregateResourceConfig")
      end

      # Accepts a structured query language (SQL) SELECT command, performs the corresponding search, and
      # returns resource configurations matching the properties. For more information about query
      # components, see the Query Components section in the Config Developer Guide .

      def select_resource_config(
        expression : String,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Types::SelectResourceConfigResponse

        input = Types::SelectResourceConfigRequest.new(expression: expression, limit: limit, next_token: next_token)
        select_resource_config(input)
      end

      def select_resource_config(input : Types::SelectResourceConfigRequest) : Types::SelectResourceConfigResponse
        request = Protocol::JsonRpc.build_request(Model::SELECT_RESOURCE_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SelectResourceConfigResponse, "SelectResourceConfig")
      end

      # Runs an on-demand evaluation for the specified Config rules against the last known configuration
      # state of the resources. Use StartConfigRulesEvaluation when you want to test that a rule you updated
      # is working as expected. StartConfigRulesEvaluation does not re-record the latest configuration state
      # for your resources. It re-runs an evaluation against the last known state of your resources. You can
      # specify up to 25 Config rules per request. An existing StartConfigRulesEvaluation call for the
      # specified rules must complete before you can call the API again. If you chose to have Config stream
      # to an Amazon SNS topic, you will receive a ConfigRuleEvaluationStarted notification when the
      # evaluation starts. You don't need to call the StartConfigRulesEvaluation API to run an evaluation
      # for a new rule. When you create a rule, Config evaluates your resources against the rule
      # automatically. The StartConfigRulesEvaluation API is useful if you want to run on-demand
      # evaluations, such as the following example: You have a custom rule that evaluates your IAM resources
      # every 24 hours. You update your Lambda function to add additional conditions to your rule. Instead
      # of waiting for the next periodic evaluation, you call the StartConfigRulesEvaluation API. Config
      # invokes your Lambda function and evaluates your IAM resources. Your custom rule will still run
      # periodic evaluations every 24 hours.

      def start_config_rules_evaluation(
        config_rule_names : Array(String)? = nil
      ) : Types::StartConfigRulesEvaluationResponse

        input = Types::StartConfigRulesEvaluationRequest.new(config_rule_names: config_rule_names)
        start_config_rules_evaluation(input)
      end

      def start_config_rules_evaluation(input : Types::StartConfigRulesEvaluationRequest) : Types::StartConfigRulesEvaluationResponse
        request = Protocol::JsonRpc.build_request(Model::START_CONFIG_RULES_EVALUATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartConfigRulesEvaluationResponse, "StartConfigRulesEvaluation")
      end

      # Starts the customer managed configuration recorder. The customer managed configuration recorder will
      # begin recording configuration changes for the resource types you specify. You must have created a
      # delivery channel to successfully start the customer managed configuration recorder. You can use the
      # PutDeliveryChannel operation to create a delivery channel.

      def start_configuration_recorder(
        configuration_recorder_name : String
      ) : Nil

        input = Types::StartConfigurationRecorderRequest.new(configuration_recorder_name: configuration_recorder_name)
        start_configuration_recorder(input)
      end

      def start_configuration_recorder(input : Types::StartConfigurationRecorderRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::START_CONFIGURATION_RECORDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Runs an on-demand remediation for the specified Config rules against the last known remediation
      # configuration. It runs an execution against the current state of your resources. Remediation
      # execution is asynchronous. You can specify up to 100 resource keys per request. An existing
      # StartRemediationExecution call for the specified resource keys must complete before you can call the
      # API again.

      def start_remediation_execution(
        config_rule_name : String,
        resource_keys : Array(Types::ResourceKey)
      ) : Types::StartRemediationExecutionResponse

        input = Types::StartRemediationExecutionRequest.new(config_rule_name: config_rule_name, resource_keys: resource_keys)
        start_remediation_execution(input)
      end

      def start_remediation_execution(input : Types::StartRemediationExecutionRequest) : Types::StartRemediationExecutionResponse
        request = Protocol::JsonRpc.build_request(Model::START_REMEDIATION_EXECUTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartRemediationExecutionResponse, "StartRemediationExecution")
      end

      # Runs an on-demand evaluation for the specified resource to determine whether the resource details
      # will comply with configured Config rules. You can also use it for evaluation purposes. Config
      # recommends using an evaluation context. It runs an execution against the resource details with all
      # of the Config rules in your account that match with the specified proactive mode and resource type.
      # Ensure you have the cloudformation:DescribeType role setup to validate the resource type schema. You
      # can find the Resource type schema in " Amazon Web Services public extensions " within the
      # CloudFormation registry or with the following CLI commmand: aws cloudformation describe-type
      # --type-name "AWS::S3::Bucket" --type RESOURCE . For more information, see Managing extensions
      # through the CloudFormation registry and Amazon Web Services resource and property types reference in
      # the CloudFormation User Guide.

      def start_resource_evaluation(
        evaluation_mode : String,
        resource_details : Types::ResourceDetails,
        client_token : String? = nil,
        evaluation_context : Types::EvaluationContext? = nil,
        evaluation_timeout : Int32? = nil
      ) : Types::StartResourceEvaluationResponse

        input = Types::StartResourceEvaluationRequest.new(evaluation_mode: evaluation_mode, resource_details: resource_details, client_token: client_token, evaluation_context: evaluation_context, evaluation_timeout: evaluation_timeout)
        start_resource_evaluation(input)
      end

      def start_resource_evaluation(input : Types::StartResourceEvaluationRequest) : Types::StartResourceEvaluationResponse
        request = Protocol::JsonRpc.build_request(Model::START_RESOURCE_EVALUATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartResourceEvaluationResponse, "StartResourceEvaluation")
      end

      # Stops the customer managed configuration recorder. The customer managed configuration recorder will
      # stop recording configuration changes for the resource types you have specified.

      def stop_configuration_recorder(
        configuration_recorder_name : String
      ) : Nil

        input = Types::StopConfigurationRecorderRequest.new(configuration_recorder_name: configuration_recorder_name)
        stop_configuration_recorder(input)
      end

      def stop_configuration_recorder(input : Types::StopConfigurationRecorderRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::STOP_CONFIGURATION_RECORDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Associates the specified tags to a resource with the specified ResourceArn . If existing tags on a
      # resource are not specified in the request parameters, they are not changed. If existing tags are
      # specified, however, then their values will be updated. When a resource is deleted, the tags
      # associated with that resource are deleted as well.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Nil

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes specified tags from a resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Nil

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end
    end
  end
end
