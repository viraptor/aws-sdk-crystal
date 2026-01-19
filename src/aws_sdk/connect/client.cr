module AwsSdk
  module Connect
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

      # Activates an evaluation form in the specified Amazon Connect instance. After the evaluation form is
      # activated, it is available to start new evaluations based on the form.
      def activate_evaluation_form(
        evaluation_form_id : String,
        evaluation_form_version : Int32,
        instance_id : String
      ) : Protocol::Request
        input = Types::ActivateEvaluationFormRequest.new(evaluation_form_id: evaluation_form_id, evaluation_form_version: evaluation_form_version, instance_id: instance_id)
        activate_evaluation_form(input)
      end
      def activate_evaluation_form(input : Types::ActivateEvaluationFormRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACTIVATE_EVALUATION_FORM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates the specified dataset for a Amazon Connect instance with the target account. You can
      # associate only one dataset in a single call.
      def associate_analytics_data_set(
        data_set_id : String,
        instance_id : String,
        target_account_id : String? = nil
      ) : Protocol::Request
        input = Types::AssociateAnalyticsDataSetRequest.new(data_set_id: data_set_id, instance_id: instance_id, target_account_id: target_account_id)
        associate_analytics_data_set(input)
      end
      def associate_analytics_data_set(input : Types::AssociateAnalyticsDataSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_ANALYTICS_DATA_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Associates an approved
      # origin to an Amazon Connect instance.
      def associate_approved_origin(
        instance_id : String,
        origin : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::AssociateApprovedOriginRequest.new(instance_id: instance_id, origin: origin, client_token: client_token)
        associate_approved_origin(input)
      end
      def associate_approved_origin(input : Types::AssociateApprovedOriginRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_APPROVED_ORIGIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Allows the specified
      # Amazon Connect instance to access the specified Amazon Lex or Amazon Lex V2 bot.
      def associate_bot(
        instance_id : String,
        client_token : String? = nil,
        lex_bot : Types::LexBot? = nil,
        lex_v2_bot : Types::LexV2Bot? = nil
      ) : Protocol::Request
        input = Types::AssociateBotRequest.new(instance_id: instance_id, client_token: client_token, lex_bot: lex_bot, lex_v2_bot: lex_v2_bot)
        associate_bot(input)
      end
      def associate_bot(input : Types::AssociateBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a queued contact with an agent. Use cases Following are common uses cases for this API:
      # Programmatically assign queued contacts to available users. Leverage the IAM context key
      # connect:PreferredUserArn to restrict contact association to specific preferred user. Important
      # things to know Use this API with chat, email, and task contacts. It does not support voice contacts.
      # Use it to associate contacts with users regardless of their current state, including custom states.
      # Ensure your application logic accounts for user availability before making associations. It honors
      # the IAM context key connect:PreferredUserArn to prevent unauthorized contact associations. It
      # respects the IAM context key connect:PreferredUserArn to enforce authorization controls and prevent
      # unauthorized contact associations. Verify that your IAM policies are properly configured to support
      # your intended use cases. The service quota Queues per routing profile per instance applies to
      # manually assigned queues, too. For more information about this quota, see Amazon Connect quotas in
      # the Amazon Connect Administrator Guide . Endpoints : See Amazon Connect endpoints and quotas .
      def associate_contact_with_user(
        contact_id : String,
        instance_id : String,
        user_id : String
      ) : Protocol::Request
        input = Types::AssociateContactWithUserRequest.new(contact_id: contact_id, instance_id: instance_id, user_id: user_id)
        associate_contact_with_user(input)
      end
      def associate_contact_with_user(input : Types::AssociateContactWithUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_CONTACT_WITH_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates an existing vocabulary as the default. Contact Lens for Amazon Connect uses the
      # vocabulary in post-call and real-time analysis sessions for the given language.
      def associate_default_vocabulary(
        instance_id : String,
        language_code : String,
        vocabulary_id : String? = nil
      ) : Protocol::Request
        input = Types::AssociateDefaultVocabularyRequest.new(instance_id: instance_id, language_code: language_code, vocabulary_id: vocabulary_id)
        associate_default_vocabulary(input)
      end
      def associate_default_vocabulary(input : Types::AssociateDefaultVocabularyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_DEFAULT_VOCABULARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates an email address alias with an existing email address in an Amazon Connect instance. This
      # creates a forwarding relationship where emails sent to the alias email address are automatically
      # forwarded to the primary email address. Use cases Following are common uses cases for this API:
      # Unified customer support : Create multiple entry points (for example, support@example.com,
      # help@example.com, customercare@example.com) that all forward to a single agent queue for streamlined
      # management. Department consolidation : Forward emails from legacy department addresses (for example,
      # sales@example.com, info@example.com) to a centralized customer service email during organizational
      # restructuring. Brand management : Enable you to use familiar brand-specific email addresses that
      # forward to the appropriate Amazon Connect instance email address. Important things to know Each
      # email address can have a maximum of one alias. You cannot create multiple aliases for the same email
      # address. If the alias email address already receives direct emails, it continues to receive direct
      # emails plus forwarded emails. You cannot chain email aliases together (that is, create an alias of
      # an alias). AssociateEmailAddressAlias does not return the following information: A confirmation of
      # the alias relationship details (you must call DescribeEmailAddress to verify). The timestamp of when
      # the association occurred. The status of the forwarding configuration. Endpoints : See Amazon Connect
      # endpoints and quotas . Related operations DisassociateEmailAddressAlias : Removes the alias
      # association between two email addresses in an Amazon Connect instance. DescribeEmailAddress : View
      # current alias configurations for an email address. SearchEmailAddresses : Find email addresses and
      # their alias relationships across an instance. CreateEmailAddress : Create new email addresses that
      # can participate in alias relationships. DeleteEmailAddress : Remove email addresses (automatically
      # removes any alias relationships). UpdateEmailAddressMetadata : Modify email address properties (does
      # not affect alias relationships).
      def associate_email_address_alias(
        alias_configuration : Types::AliasConfiguration,
        email_address_id : String,
        instance_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::AssociateEmailAddressAliasRequest.new(alias_configuration: alias_configuration, email_address_id: email_address_id, instance_id: instance_id, client_token: client_token)
        associate_email_address_alias(input)
      end
      def associate_email_address_alias(input : Types::AssociateEmailAddressAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_EMAIL_ADDRESS_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a connect resource to a flow.
      def associate_flow(
        flow_id : String,
        instance_id : String,
        resource_id : String,
        resource_type : String
      ) : Protocol::Request
        input = Types::AssociateFlowRequest.new(flow_id: flow_id, instance_id: instance_id, resource_id: resource_id, resource_type: resource_type)
        associate_flow(input)
      end
      def associate_flow(input : Types::AssociateFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a set of hours of operations with another hours of operation. Refer to Administrator
      # Guide here for more information on inheriting overrides from parent hours of operation(s).
      def associate_hours_of_operations(
        hours_of_operation_id : String,
        instance_id : String,
        parent_hours_of_operation_configs : Array(Types::ParentHoursOfOperationConfig)
      ) : Protocol::Request
        input = Types::AssociateHoursOfOperationsRequest.new(hours_of_operation_id: hours_of_operation_id, instance_id: instance_id, parent_hours_of_operation_configs: parent_hours_of_operation_configs)
        associate_hours_of_operations(input)
      end
      def associate_hours_of_operations(input : Types::AssociateHoursOfOperationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_HOURS_OF_OPERATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Associates a storage
      # resource type for the first time. You can only associate one type of storage configuration in a
      # single call. This means, for example, that you can't define an instance with multiple S3 buckets for
      # storing chat transcripts. This API does not create a resource that doesn't exist. It only associates
      # it to the instance. Ensure that the resource being specified in the storage configuration, like an
      # S3 bucket, exists when being used for association.
      def associate_instance_storage_config(
        instance_id : String,
        resource_type : String,
        storage_config : Types::InstanceStorageConfig,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::AssociateInstanceStorageConfigRequest.new(instance_id: instance_id, resource_type: resource_type, storage_config: storage_config, client_token: client_token)
        associate_instance_storage_config(input)
      end
      def associate_instance_storage_config(input : Types::AssociateInstanceStorageConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_INSTANCE_STORAGE_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Allows the specified
      # Amazon Connect instance to access the specified Lambda function.
      def associate_lambda_function(
        function_arn : String,
        instance_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::AssociateLambdaFunctionRequest.new(function_arn: function_arn, instance_id: instance_id, client_token: client_token)
        associate_lambda_function(input)
      end
      def associate_lambda_function(input : Types::AssociateLambdaFunctionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_LAMBDA_FUNCTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Allows the specified
      # Amazon Connect instance to access the specified Amazon Lex V1 bot. This API only supports the
      # association of Amazon Lex V1 bots.
      def associate_lex_bot(
        instance_id : String,
        lex_bot : Types::LexBot,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::AssociateLexBotRequest.new(instance_id: instance_id, lex_bot: lex_bot, client_token: client_token)
        associate_lex_bot(input)
      end
      def associate_lex_bot(input : Types::AssociateLexBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_LEX_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a flow with a phone number claimed to your Amazon Connect instance. If the number is
      # claimed to a traffic distribution group, and you are calling this API using an instance in the
      # Amazon Web Services Region where the traffic distribution group was created, you can use either a
      # full phone number ARN or UUID value for the PhoneNumberId URI request parameter. However, if the
      # number is claimed to a traffic distribution group and you are calling this API using an instance in
      # the alternate Amazon Web Services Region associated with the traffic distribution group, you must
      # provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a
      # ResourceNotFoundException .
      def associate_phone_number_contact_flow(
        contact_flow_id : String,
        instance_id : String,
        phone_number_id : String
      ) : Protocol::Request
        input = Types::AssociatePhoneNumberContactFlowRequest.new(contact_flow_id: contact_flow_id, instance_id: instance_id, phone_number_id: phone_number_id)
        associate_phone_number_contact_flow(input)
      end
      def associate_phone_number_contact_flow(input : Types::AssociatePhoneNumberContactFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_PHONE_NUMBER_CONTACT_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a set of quick connects with a queue.
      def associate_queue_quick_connects(
        instance_id : String,
        queue_id : String,
        quick_connect_ids : Array(String)
      ) : Protocol::Request
        input = Types::AssociateQueueQuickConnectsRequest.new(instance_id: instance_id, queue_id: queue_id, quick_connect_ids: quick_connect_ids)
        associate_queue_quick_connects(input)
      end
      def associate_queue_quick_connects(input : Types::AssociateQueueQuickConnectsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_QUEUE_QUICK_CONNECTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a set of queues with a routing profile.
      def associate_routing_profile_queues(
        instance_id : String,
        routing_profile_id : String,
        manual_assignment_queue_configs : Array(Types::RoutingProfileManualAssignmentQueueConfig)? = nil,
        queue_configs : Array(Types::RoutingProfileQueueConfig)? = nil
      ) : Protocol::Request
        input = Types::AssociateRoutingProfileQueuesRequest.new(instance_id: instance_id, routing_profile_id: routing_profile_id, manual_assignment_queue_configs: manual_assignment_queue_configs, queue_configs: queue_configs)
        associate_routing_profile_queues(input)
      end
      def associate_routing_profile_queues(input : Types::AssociateRoutingProfileQueuesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_ROUTING_PROFILE_QUEUES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Associates a security
      # key to the instance.
      def associate_security_key(
        instance_id : String,
        key : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::AssociateSecurityKeyRequest.new(instance_id: instance_id, key: key, client_token: client_token)
        associate_security_key(input)
      end
      def associate_security_key(input : Types::AssociateSecurityKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_SECURITY_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associate security profiles with an Entity in an Amazon Connect instance.
      def associate_security_profiles(
        entity_arn : String,
        entity_type : String,
        instance_id : String,
        security_profiles : Array(Types::SecurityProfileItem)
      ) : Protocol::Request
        input = Types::AssociateSecurityProfilesRequest.new(entity_arn: entity_arn, entity_type: entity_type, instance_id: instance_id, security_profiles: security_profiles)
        associate_security_profiles(input)
      end
      def associate_security_profiles(input : Types::AssociateSecurityProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_SECURITY_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates an agent with a traffic distribution group. This API can be called only in the Region
      # where the traffic distribution group is created.
      def associate_traffic_distribution_group_user(
        instance_id : String,
        traffic_distribution_group_id : String,
        user_id : String
      ) : Protocol::Request
        input = Types::AssociateTrafficDistributionGroupUserRequest.new(instance_id: instance_id, traffic_distribution_group_id: traffic_distribution_group_id, user_id: user_id)
        associate_traffic_distribution_group_user(input)
      end
      def associate_traffic_distribution_group_user(input : Types::AssociateTrafficDistributionGroupUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_TRAFFIC_DISTRIBUTION_GROUP_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a set of proficiencies with a user.
      def associate_user_proficiencies(
        instance_id : String,
        user_id : String,
        user_proficiencies : Array(Types::UserProficiency)
      ) : Protocol::Request
        input = Types::AssociateUserProficienciesRequest.new(instance_id: instance_id, user_id: user_id, user_proficiencies: user_proficiencies)
        associate_user_proficiencies(input)
      end
      def associate_user_proficiencies(input : Types::AssociateUserProficienciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_USER_PROFICIENCIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a workspace with one or more users or routing profiles, allowing them to access the
      # workspace's configured views and pages.
      def associate_workspace(
        instance_id : String,
        resource_arns : Array(String),
        workspace_id : String
      ) : Protocol::Request
        input = Types::AssociateWorkspaceRequest.new(instance_id: instance_id, resource_arns: resource_arns, workspace_id: workspace_id)
        associate_workspace(input)
      end
      def associate_workspace(input : Types::AssociateWorkspaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_WORKSPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a list of analytics datasets for a given Amazon Connect instance to a target account. You
      # can associate multiple datasets in a single call.
      def batch_associate_analytics_data_set(
        data_set_ids : Array(String),
        instance_id : String,
        target_account_id : String? = nil
      ) : Protocol::Request
        input = Types::BatchAssociateAnalyticsDataSetRequest.new(data_set_ids: data_set_ids, instance_id: instance_id, target_account_id: target_account_id)
        batch_associate_analytics_data_set(input)
      end
      def batch_associate_analytics_data_set(input : Types::BatchAssociateAnalyticsDataSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_ASSOCIATE_ANALYTICS_DATA_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates values for attributes in a data table. The value may be a default or it may be associated
      # with a primary value. The value must pass all customer defined validation as well as the default
      # validation for the value type. The operation must conform to Batch Operation API Standards. Although
      # the standard specifies that successful and failed entities are listed separately in the response,
      # authorization fails if any primary values or attributes are unauthorized. The combination of primary
      # values and the attribute name serve as the identifier for the individual item request.
      def batch_create_data_table_value(
        data_table_id : String,
        instance_id : String,
        values : Array(Types::DataTableValue)
      ) : Protocol::Request
        input = Types::BatchCreateDataTableValueRequest.new(data_table_id: data_table_id, instance_id: instance_id, values: values)
        batch_create_data_table_value(input)
      end
      def batch_create_data_table_value(input : Types::BatchCreateDataTableValueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_CREATE_DATA_TABLE_VALUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes multiple values from a data table. API users may delete values at any time. When deletion is
      # requested from the admin website, a warning is shown alerting the user of the most recent time the
      # attribute and its values were accessed. System managed values are not deletable by customers.
      def batch_delete_data_table_value(
        data_table_id : String,
        instance_id : String,
        values : Array(Types::DataTableDeleteValueIdentifier)
      ) : Protocol::Request
        input = Types::BatchDeleteDataTableValueRequest.new(data_table_id: data_table_id, instance_id: instance_id, values: values)
        batch_delete_data_table_value(input)
      end
      def batch_delete_data_table_value(input : Types::BatchDeleteDataTableValueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_DATA_TABLE_VALUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves multiple values from a data table without evaluating expressions. Returns the raw stored
      # values along with metadata such as lock versions and modification timestamps. "Describe" is a
      # deprecated term but is allowed to maintain consistency with existing operations.
      def batch_describe_data_table_value(
        data_table_id : String,
        instance_id : String,
        values : Array(Types::DataTableValueIdentifier)
      ) : Protocol::Request
        input = Types::BatchDescribeDataTableValueRequest.new(data_table_id: data_table_id, instance_id: instance_id, values: values)
        batch_describe_data_table_value(input)
      end
      def batch_describe_data_table_value(input : Types::BatchDescribeDataTableValueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DESCRIBE_DATA_TABLE_VALUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a list of analytics datasets associated with a given Amazon Connect instance. You can
      # disassociate multiple datasets in a single call.
      def batch_disassociate_analytics_data_set(
        data_set_ids : Array(String),
        instance_id : String,
        target_account_id : String? = nil
      ) : Protocol::Request
        input = Types::BatchDisassociateAnalyticsDataSetRequest.new(data_set_ids: data_set_ids, instance_id: instance_id, target_account_id: target_account_id)
        batch_disassociate_analytics_data_set(input)
      end
      def batch_disassociate_analytics_data_set(input : Types::BatchDisassociateAnalyticsDataSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DISASSOCIATE_ANALYTICS_DATA_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows you to retrieve metadata about multiple attached files on an associated resource. Each
      # attached file provided in the input list must be associated with the input AssociatedResourceArn.
      def batch_get_attached_file_metadata(
        associated_resource_arn : String,
        file_ids : Array(String),
        instance_id : String
      ) : Protocol::Request
        input = Types::BatchGetAttachedFileMetadataRequest.new(associated_resource_arn: associated_resource_arn, file_ids: file_ids, instance_id: instance_id)
        batch_get_attached_file_metadata(input)
      end
      def batch_get_attached_file_metadata(input : Types::BatchGetAttachedFileMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_ATTACHED_FILE_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve the flow associations for the given resources.
      def batch_get_flow_association(
        instance_id : String,
        resource_ids : Array(String),
        resource_type : String? = nil
      ) : Protocol::Request
        input = Types::BatchGetFlowAssociationRequest.new(instance_id: instance_id, resource_ids: resource_ids, resource_type: resource_type)
        batch_get_flow_association(input)
      end
      def batch_get_flow_association(input : Types::BatchGetFlowAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_FLOW_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Only the Amazon Connect outbound campaigns service principal is allowed to assume a role in your
      # account and call this API. Allows you to create a batch of contacts in Amazon Connect. The outbound
      # campaigns capability ingests dial requests via the PutDialRequestBatch API. It then uses
      # BatchPutContact to create contacts corresponding to those dial requests. If agents are available,
      # the dial requests are dialed out, which results in a voice call. The resulting voice call uses the
      # same contactId that was created by BatchPutContact.
      def batch_put_contact(
        contact_data_request_list : Array(Types::ContactDataRequest),
        instance_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::BatchPutContactRequest.new(contact_data_request_list: contact_data_request_list, instance_id: instance_id, client_token: client_token)
        batch_put_contact(input)
      end
      def batch_put_contact(input : Types::BatchPutContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_PUT_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates multiple data table values using all properties from BatchCreateDataTableValue. System
      # managed values are not modifiable by customers. The operation requires proper lock versions to
      # prevent concurrent modification conflicts.
      def batch_update_data_table_value(
        data_table_id : String,
        instance_id : String,
        values : Array(Types::DataTableValue)
      ) : Protocol::Request
        input = Types::BatchUpdateDataTableValueRequest.new(data_table_id: data_table_id, instance_id: instance_id, values: values)
        batch_update_data_table_value(input)
      end
      def batch_update_data_table_value(input : Types::BatchUpdateDataTableValueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_DATA_TABLE_VALUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Claims an available phone number to your Amazon Connect instance or traffic distribution group. You
      # can call this API only in the same Amazon Web Services Region where the Amazon Connect instance or
      # traffic distribution group was created. For more information about how to use this operation, see
      # Claim a phone number in your country and Claim phone numbers to traffic distribution groups in the
      # Amazon Connect Administrator Guide . You can call the SearchAvailablePhoneNumbers API for available
      # phone numbers that you can claim. Call the DescribePhoneNumber API to verify the status of a
      # previous ClaimPhoneNumber operation. If you plan to claim and release numbers frequently, contact us
      # for a service quota exception. Otherwise, it is possible you will be blocked from claiming and
      # releasing any more numbers until up to 180 days past the oldest number released has expired. By
      # default you can claim and release up to 200% of your maximum number of active phone numbers. If you
      # claim and release phone numbers using the UI or API during a rolling 180 day cycle that exceeds 200%
      # of your phone number service level quota, you will be blocked from claiming any more numbers until
      # 180 days past the oldest number released has expired. For example, if you already have 99 claimed
      # numbers and a service level quota of 99 phone numbers, and in any 180 day period you release 99,
      # claim 99, and then release 99, you will have exceeded the 200% limit. At that point you are blocked
      # from claiming any more numbers until you open an Amazon Web Services support ticket.
      def claim_phone_number(
        phone_number : String,
        client_token : String? = nil,
        instance_id : String? = nil,
        phone_number_description : String? = nil,
        tags : Hash(String, String)? = nil,
        target_arn : String? = nil
      ) : Protocol::Request
        input = Types::ClaimPhoneNumberRequest.new(phone_number: phone_number, client_token: client_token, instance_id: instance_id, phone_number_description: phone_number_description, tags: tags, target_arn: target_arn)
        claim_phone_number(input)
      end
      def claim_phone_number(input : Types::ClaimPhoneNumberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CLAIM_PHONE_NUMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows you to confirm that the attached file has been uploaded using the pre-signed URL provided in
      # the StartAttachedFileUpload API.
      def complete_attached_file_upload(
        associated_resource_arn : String,
        file_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::CompleteAttachedFileUploadRequest.new(associated_resource_arn: associated_resource_arn, file_id: file_id, instance_id: instance_id)
        complete_attached_file_upload(input)
      end
      def complete_attached_file_upload(input : Types::CompleteAttachedFileUploadRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::COMPLETE_ATTACHED_FILE_UPLOAD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an agent status for the specified Amazon Connect instance.
      def create_agent_status(
        instance_id : String,
        name : String,
        state : String,
        description : String? = nil,
        display_order : Int32? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAgentStatusRequest.new(instance_id: instance_id, name: name, state: state, description: description, display_order: display_order, tags: tags)
        create_agent_status(input)
      end
      def create_agent_status(input : Types::CreateAgentStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AGENT_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Only the VOICE, EMAIL, and TASK channels are supported. For VOICE: The supported initiation method
      # is TRANSFER . The contacts created with this initiation method have a subtype connect:ExternalAudio
      # . For EMAIL: The supported initiation methods are OUTBOUND , AGENT_REPLY , and FLOW . For TASK: The
      # supported initiation method is API . Contacts created with this API have a sub-type of
      # connect:ExternalTask . Creates a new VOICE, EMAIL, or TASK contact. After a contact is created, you
      # can move it to the desired state by using the InitiateAs parameter. While you can use API to create
      # task contacts that are in the COMPLETED state, you must contact Amazon Web Services Support before
      # using it for bulk import use cases. Bulk import causes your requests to be throttled or fail if your
      # CreateContact limits aren't high enough.
      def create_contact(
        channel : String,
        initiation_method : String,
        instance_id : String,
        attributes : Hash(String, String)? = nil,
        client_token : String? = nil,
        description : String? = nil,
        expiry_duration_in_minutes : Int32? = nil,
        initiate_as : String? = nil,
        name : String? = nil,
        previous_contact_id : String? = nil,
        references : Hash(String, Types::Reference)? = nil,
        related_contact_id : String? = nil,
        segment_attributes : Hash(String, Types::SegmentAttributeValue)? = nil,
        user_info : Types::UserInfo? = nil
      ) : Protocol::Request
        input = Types::CreateContactRequest.new(channel: channel, initiation_method: initiation_method, instance_id: instance_id, attributes: attributes, client_token: client_token, description: description, expiry_duration_in_minutes: expiry_duration_in_minutes, initiate_as: initiate_as, name: name, previous_contact_id: previous_contact_id, references: references, related_contact_id: related_contact_id, segment_attributes: segment_attributes, user_info: user_info)
        create_contact(input)
      end
      def create_contact(input : Types::CreateContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a flow for the specified Amazon Connect instance. You can also create and update flows using
      # the Amazon Connect Flow language .
      def create_contact_flow(
        content : String,
        instance_id : String,
        name : String,
        type : String,
        description : String? = nil,
        status : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateContactFlowRequest.new(content: content, instance_id: instance_id, name: name, type: type, description: description, status: status, tags: tags)
        create_contact_flow(input)
      end
      def create_contact_flow(input : Types::CreateContactFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONTACT_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a flow module for the specified Amazon Connect instance.
      def create_contact_flow_module(
        content : String,
        instance_id : String,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        external_invocation_configuration : Types::ExternalInvocationConfiguration? = nil,
        settings : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateContactFlowModuleRequest.new(content: content, instance_id: instance_id, name: name, client_token: client_token, description: description, external_invocation_configuration: external_invocation_configuration, settings: settings, tags: tags)
        create_contact_flow_module(input)
      end
      def create_contact_flow_module(input : Types::CreateContactFlowModuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONTACT_FLOW_MODULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a named alias that points to a specific version of a contact flow module.
      def create_contact_flow_module_alias(
        alias_name : String,
        contact_flow_module_id : String,
        contact_flow_module_version : Int64,
        instance_id : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateContactFlowModuleAliasRequest.new(alias_name: alias_name, contact_flow_module_id: contact_flow_module_id, contact_flow_module_version: contact_flow_module_version, instance_id: instance_id, description: description)
        create_contact_flow_module_alias(input)
      end
      def create_contact_flow_module_alias(input : Types::CreateContactFlowModuleAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONTACT_FLOW_MODULE_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an immutable snapshot of a contact flow module, preserving its content and settings at a
      # specific point in time for version control and rollback capabilities.
      def create_contact_flow_module_version(
        contact_flow_module_id : String,
        instance_id : String,
        description : String? = nil,
        flow_module_content_sha256 : String? = nil
      ) : Protocol::Request
        input = Types::CreateContactFlowModuleVersionRequest.new(contact_flow_module_id: contact_flow_module_id, instance_id: instance_id, description: description, flow_module_content_sha256: flow_module_content_sha256)
        create_contact_flow_module_version(input)
      end
      def create_contact_flow_module_version(input : Types::CreateContactFlowModuleVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONTACT_FLOW_MODULE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Publishes a new version of the flow provided. Versions are immutable and monotonically increasing.
      # If the FlowContentSha256 provided is different from the FlowContentSha256 of the $LATEST published
      # flow content, then an error is returned. This API only supports creating versions for flows of type
      # Campaign .
      def create_contact_flow_version(
        contact_flow_id : String,
        instance_id : String,
        contact_flow_version : Int64? = nil,
        description : String? = nil,
        flow_content_sha256 : String? = nil,
        last_modified_region : String? = nil,
        last_modified_time : Time? = nil
      ) : Protocol::Request
        input = Types::CreateContactFlowVersionRequest.new(contact_flow_id: contact_flow_id, instance_id: instance_id, contact_flow_version: contact_flow_version, description: description, flow_content_sha256: flow_content_sha256, last_modified_region: last_modified_region, last_modified_time: last_modified_time)
        create_contact_flow_version(input)
      end
      def create_contact_flow_version(input : Types::CreateContactFlowVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONTACT_FLOW_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new data table with the specified properties. Supports the creation of all table
      # properties except for attributes and values. A table with no attributes and values is a valid state
      # for a table. The number of tables per instance is limited to 100 per instance. Customers can request
      # an increase by using Amazon Web Services Service Quotas.
      def create_data_table(
        instance_id : String,
        name : String,
        status : String,
        time_zone : String,
        value_lock_level : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDataTableRequest.new(instance_id: instance_id, name: name, status: status, time_zone: time_zone, value_lock_level: value_lock_level, description: description, tags: tags)
        create_data_table(input)
      end
      def create_data_table(input : Types::CreateDataTableRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_TABLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds an attribute to an existing data table. Creating a new primary attribute uses the empty value
      # for the specified value type for all existing records. This should not affect uniqueness of
      # published data tables since the existing primary values will already be unique. Creating attributes
      # does not create any values. System managed tables may not allow customers to create new attributes.
      def create_data_table_attribute(
        data_table_id : String,
        instance_id : String,
        name : String,
        value_type : String,
        description : String? = nil,
        primary : Bool? = nil,
        validation : Types::Validation? = nil
      ) : Protocol::Request
        input = Types::CreateDataTableAttributeRequest.new(data_table_id: data_table_id, instance_id: instance_id, name: name, value_type: value_type, description: description, primary: primary, validation: validation)
        create_data_table_attribute(input)
      end
      def create_data_table_attribute(input : Types::CreateDataTableAttributeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_TABLE_ATTRIBUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create new email address in the specified Amazon Connect instance. For more information about email
      # addresses, see Create email addresses in the Amazon Connect Administrator Guide.
      def create_email_address(
        email_address : String,
        instance_id : String,
        client_token : String? = nil,
        description : String? = nil,
        display_name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateEmailAddressRequest.new(email_address: email_address, instance_id: instance_id, client_token: client_token, description: description, display_name: display_name, tags: tags)
        create_email_address(input)
      end
      def create_email_address(input : Types::CreateEmailAddressRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EMAIL_ADDRESS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an evaluation form in the specified Amazon Connect instance. The form can be used to define
      # questions related to agent performance, and create sections to organize such questions. Question and
      # section identifiers cannot be duplicated within the same evaluation form.
      def create_evaluation_form(
        instance_id : String,
        items : Array(Types::EvaluationFormItem),
        title : String,
        as_draft : Bool? = nil,
        auto_evaluation_configuration : Types::EvaluationFormAutoEvaluationConfiguration? = nil,
        client_token : String? = nil,
        description : String? = nil,
        language_configuration : Types::EvaluationFormLanguageConfiguration? = nil,
        review_configuration : Types::EvaluationReviewConfiguration? = nil,
        scoring_strategy : Types::EvaluationFormScoringStrategy? = nil,
        tags : Hash(String, String)? = nil,
        target_configuration : Types::EvaluationFormTargetConfiguration? = nil
      ) : Protocol::Request
        input = Types::CreateEvaluationFormRequest.new(instance_id: instance_id, items: items, title: title, as_draft: as_draft, auto_evaluation_configuration: auto_evaluation_configuration, client_token: client_token, description: description, language_configuration: language_configuration, review_configuration: review_configuration, scoring_strategy: scoring_strategy, tags: tags, target_configuration: target_configuration)
        create_evaluation_form(input)
      end
      def create_evaluation_form(input : Types::CreateEvaluationFormRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EVALUATION_FORM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates hours of operation.
      def create_hours_of_operation(
        config : Array(Types::HoursOfOperationConfig),
        instance_id : String,
        name : String,
        time_zone : String,
        description : String? = nil,
        parent_hours_of_operation_configs : Array(Types::ParentHoursOfOperationConfig)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateHoursOfOperationRequest.new(config: config, instance_id: instance_id, name: name, time_zone: time_zone, description: description, parent_hours_of_operation_configs: parent_hours_of_operation_configs, tags: tags)
        create_hours_of_operation(input)
      end
      def create_hours_of_operation(input : Types::CreateHoursOfOperationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_HOURS_OF_OPERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an hours of operation override in an Amazon Connect hours of operation resource.
      def create_hours_of_operation_override(
        config : Array(Types::HoursOfOperationOverrideConfig),
        effective_from : String,
        effective_till : String,
        hours_of_operation_id : String,
        instance_id : String,
        name : String,
        description : String? = nil,
        override_type : String? = nil,
        recurrence_config : Types::RecurrenceConfig? = nil
      ) : Protocol::Request
        input = Types::CreateHoursOfOperationOverrideRequest.new(config: config, effective_from: effective_from, effective_till: effective_till, hours_of_operation_id: hours_of_operation_id, instance_id: instance_id, name: name, description: description, override_type: override_type, recurrence_config: recurrence_config)
        create_hours_of_operation_override(input)
      end
      def create_hours_of_operation_override(input : Types::CreateHoursOfOperationOverrideRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_HOURS_OF_OPERATION_OVERRIDE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Initiates an Amazon
      # Connect instance with all the supported channels enabled. It does not attach any storage, such as
      # Amazon Simple Storage Service (Amazon S3) or Amazon Kinesis. It also does not allow for any
      # configurations on features, such as Contact Lens for Amazon Connect. For more information, see
      # Create an Amazon Connect instance in the Amazon Connect Administrator Guide . Amazon Connect
      # enforces a limit on the total number of instances that you can create or delete in 30 days. If you
      # exceed this limit, you will get an error message indicating there has been an excessive number of
      # attempts at creating or deleting instances. You must wait 30 days before you can restart creating
      # and deleting instances in your account.
      def create_instance(
        identity_management_type : String,
        inbound_calls_enabled : Bool,
        outbound_calls_enabled : Bool,
        client_token : String? = nil,
        directory_id : String? = nil,
        instance_alias : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateInstanceRequest.new(identity_management_type: identity_management_type, inbound_calls_enabled: inbound_calls_enabled, outbound_calls_enabled: outbound_calls_enabled, client_token: client_token, directory_id: directory_id, instance_alias: instance_alias, tags: tags)
        create_instance(input)
      end
      def create_instance(input : Types::CreateInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Web Services resource association with an Amazon Connect instance.
      def create_integration_association(
        instance_id : String,
        integration_arn : String,
        integration_type : String,
        source_application_name : String? = nil,
        source_application_url : String? = nil,
        source_type : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateIntegrationAssociationRequest.new(instance_id: instance_id, integration_arn: integration_arn, integration_type: integration_type, source_application_name: source_application_name, source_application_url: source_application_url, source_type: source_type, tags: tags)
        create_integration_association(input)
      end
      def create_integration_association(input : Types::CreateIntegrationAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INTEGRATION_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a new participant into an on-going chat contact or webRTC call. For more information, see
      # Customize chat flow experiences by integrating custom participants or Enable multi-user web, in-app,
      # and video calling .
      def create_participant(
        contact_id : String,
        instance_id : String,
        participant_details : Types::ParticipantDetailsToAdd,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateParticipantRequest.new(contact_id: contact_id, instance_id: instance_id, participant_details: participant_details, client_token: client_token)
        create_participant(input)
      end
      def create_participant(input : Types::CreateParticipantRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PARTICIPANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables rehydration of chats for the lifespan of a contact. For more information about chat
      # rehydration, see Enable persistent chat in the Amazon Connect Administrator Guide .
      def create_persistent_contact_association(
        initial_contact_id : String,
        instance_id : String,
        rehydration_type : String,
        source_contact_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreatePersistentContactAssociationRequest.new(initial_contact_id: initial_contact_id, instance_id: instance_id, rehydration_type: rehydration_type, source_contact_id: source_contact_id, client_token: client_token)
        create_persistent_contact_association(input)
      end
      def create_persistent_contact_association(input : Types::CreatePersistentContactAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PERSISTENT_CONTACT_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new predefined attribute for the specified Amazon Connect instance. A predefined attribute
      # is made up of a name and a value. For the predefined attributes per instance quota, see Amazon
      # Connect quotas . Use cases Following are common uses cases for this API: Create an attribute for
      # routing proficiency (for example, agent certification) that has predefined values (for example, a
      # list of possible certifications). For more information, see Create predefined attributes for routing
      # contacts to agents . Create an attribute for business unit name that has a list of predefined
      # business unit names used in your organization. This is a use case where information for a contact
      # varies between transfers or conferences. For more information, see Use contact segment attributes .
      # Endpoints : See Amazon Connect endpoints and quotas .
      def create_predefined_attribute(
        instance_id : String,
        name : String,
        attribute_configuration : Types::InputPredefinedAttributeConfiguration? = nil,
        purposes : Array(String)? = nil,
        values : Types::PredefinedAttributeValues? = nil
      ) : Protocol::Request
        input = Types::CreatePredefinedAttributeRequest.new(instance_id: instance_id, name: name, attribute_configuration: attribute_configuration, purposes: purposes, values: values)
        create_predefined_attribute(input)
      end
      def create_predefined_attribute(input : Types::CreatePredefinedAttributeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PREDEFINED_ATTRIBUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a prompt. For more information about prompts, such as supported file types and maximum
      # length, see Create prompts in the Amazon Connect Administrator Guide .
      def create_prompt(
        instance_id : String,
        name : String,
        s3_uri : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreatePromptRequest.new(instance_id: instance_id, name: name, s3_uri: s3_uri, description: description, tags: tags)
        create_prompt(input)
      end
      def create_prompt(input : Types::CreatePromptRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROMPT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates registration for a device token and a chat contact to receive real-time push notifications.
      # For more information about push notifications, see Set up push notifications in Amazon Connect for
      # mobile chat in the Amazon Connect Administrator Guide .
      def create_push_notification_registration(
        contact_configuration : Types::ContactConfiguration,
        device_token : String,
        device_type : String,
        instance_id : String,
        pinpoint_app_arn : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreatePushNotificationRegistrationRequest.new(contact_configuration: contact_configuration, device_token: device_token, device_type: device_type, instance_id: instance_id, pinpoint_app_arn: pinpoint_app_arn, client_token: client_token)
        create_push_notification_registration(input)
      end
      def create_push_notification_registration(input : Types::CreatePushNotificationRegistrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PUSH_NOTIFICATION_REGISTRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new queue for the specified Amazon Connect instance. If the phone number is claimed to a
      # traffic distribution group that was created in the same Region as the Amazon Connect instance where
      # you are calling this API, then you can use a full phone number ARN or a UUID for
      # OutboundCallerIdNumberId . However, if the phone number is claimed to a traffic distribution group
      # that is in one Region, and you are calling this API from an instance in another Amazon Web Services
      # Region that is associated with the traffic distribution group, you must provide a full phone number
      # ARN. If a UUID is provided in this scenario, you will receive a ResourceNotFoundException . Only use
      # the phone number ARN format that doesn't contain instance in the path, for example,
      # arn:aws:connect:us-east-1:1234567890:phone-number/uuid . This is the same ARN format that is
      # returned when you call the ListPhoneNumbersV2 API. If you plan to use IAM policies to allow/deny
      # access to this API for phone number resources claimed to a traffic distribution group, see Allow or
      # Deny queue API actions for phone numbers in a replica Region .
      def create_queue(
        hours_of_operation_id : String,
        instance_id : String,
        name : String,
        description : String? = nil,
        max_contacts : Int32? = nil,
        outbound_caller_config : Types::OutboundCallerConfig? = nil,
        outbound_email_config : Types::OutboundEmailConfig? = nil,
        quick_connect_ids : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateQueueRequest.new(hours_of_operation_id: hours_of_operation_id, instance_id: instance_id, name: name, description: description, max_contacts: max_contacts, outbound_caller_config: outbound_caller_config, outbound_email_config: outbound_email_config, quick_connect_ids: quick_connect_ids, tags: tags)
        create_queue(input)
      end
      def create_queue(input : Types::CreateQueueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_QUEUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a quick connect for the specified Amazon Connect instance.
      def create_quick_connect(
        instance_id : String,
        name : String,
        quick_connect_config : Types::QuickConnectConfig,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateQuickConnectRequest.new(instance_id: instance_id, name: name, quick_connect_config: quick_connect_config, description: description, tags: tags)
        create_quick_connect(input)
      end
      def create_quick_connect(input : Types::CreateQuickConnectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_QUICK_CONNECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new routing profile.
      def create_routing_profile(
        default_outbound_queue_id : String,
        description : String,
        instance_id : String,
        media_concurrencies : Array(Types::MediaConcurrency),
        name : String,
        agent_availability_timer : String? = nil,
        manual_assignment_queue_configs : Array(Types::RoutingProfileManualAssignmentQueueConfig)? = nil,
        queue_configs : Array(Types::RoutingProfileQueueConfig)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateRoutingProfileRequest.new(default_outbound_queue_id: default_outbound_queue_id, description: description, instance_id: instance_id, media_concurrencies: media_concurrencies, name: name, agent_availability_timer: agent_availability_timer, manual_assignment_queue_configs: manual_assignment_queue_configs, queue_configs: queue_configs, tags: tags)
        create_routing_profile(input)
      end
      def create_routing_profile(input : Types::CreateRoutingProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ROUTING_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a rule for the specified Amazon Connect instance. Use the Rules Function language to code
      # conditions for the rule.
      def create_rule(
        actions : Array(Types::RuleAction),
        function : String,
        instance_id : String,
        name : String,
        publish_status : String,
        trigger_event_source : Types::RuleTriggerEventSource,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateRuleRequest.new(actions: actions, function: function, instance_id: instance_id, name: name, publish_status: publish_status, trigger_event_source: trigger_event_source, client_token: client_token)
        create_rule(input)
      end
      def create_rule(input : Types::CreateRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a security profile. For information about security profiles, see Security Profiles in the
      # Amazon Connect Administrator Guide . For a mapping of the API name and user interface name of the
      # security profile permissions, see List of security profile permissions .
      def create_security_profile(
        instance_id : String,
        security_profile_name : String,
        allowed_access_control_hierarchy_group_id : String? = nil,
        allowed_access_control_tags : Hash(String, String)? = nil,
        allowed_flow_modules : Array(Types::FlowModule)? = nil,
        applications : Array(Types::Application)? = nil,
        description : String? = nil,
        granular_access_control_configuration : Types::GranularAccessControlConfiguration? = nil,
        hierarchy_restricted_resources : Array(String)? = nil,
        permissions : Array(String)? = nil,
        tag_restricted_resources : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSecurityProfileRequest.new(instance_id: instance_id, security_profile_name: security_profile_name, allowed_access_control_hierarchy_group_id: allowed_access_control_hierarchy_group_id, allowed_access_control_tags: allowed_access_control_tags, allowed_flow_modules: allowed_flow_modules, applications: applications, description: description, granular_access_control_configuration: granular_access_control_configuration, hierarchy_restricted_resources: hierarchy_restricted_resources, permissions: permissions, tag_restricted_resources: tag_restricted_resources, tags: tags)
        create_security_profile(input)
      end
      def create_security_profile(input : Types::CreateSecurityProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SECURITY_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new task template in the specified Amazon Connect instance.
      def create_task_template(
        fields : Array(Types::TaskTemplateField),
        instance_id : String,
        name : String,
        client_token : String? = nil,
        constraints : Types::TaskTemplateConstraints? = nil,
        contact_flow_id : String? = nil,
        defaults : Types::TaskTemplateDefaults? = nil,
        description : String? = nil,
        self_assign_flow_id : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::CreateTaskTemplateRequest.new(fields: fields, instance_id: instance_id, name: name, client_token: client_token, constraints: constraints, contact_flow_id: contact_flow_id, defaults: defaults, description: description, self_assign_flow_id: self_assign_flow_id, status: status)
        create_task_template(input)
      end
      def create_task_template(input : Types::CreateTaskTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TASK_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a traffic distribution group given an Amazon Connect instance that has been replicated. The
      # SignInConfig distribution is available only on a default TrafficDistributionGroup (see the IsDefault
      # parameter in the TrafficDistributionGroup data type). If you call UpdateTrafficDistribution with a
      # modified SignInConfig and a non-default TrafficDistributionGroup , an InvalidRequestException is
      # returned. For more information about creating traffic distribution groups, see Set up traffic
      # distribution groups in the Amazon Connect Administrator Guide .
      def create_traffic_distribution_group(
        instance_id : String,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateTrafficDistributionGroupRequest.new(instance_id: instance_id, name: name, client_token: client_token, description: description, tags: tags)
        create_traffic_distribution_group(input)
      end
      def create_traffic_distribution_group(input : Types::CreateTrafficDistributionGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TRAFFIC_DISTRIBUTION_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a use case for an integration association.
      def create_use_case(
        instance_id : String,
        integration_association_id : String,
        use_case_type : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateUseCaseRequest.new(instance_id: instance_id, integration_association_id: integration_association_id, use_case_type: use_case_type, tags: tags)
        create_use_case(input)
      end
      def create_use_case(input : Types::CreateUseCaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_USE_CASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a user account for the specified Amazon Connect instance. Certain UserIdentityInfo
      # parameters are required in some situations. For example, Email , FirstName and LastName are required
      # if you are using Amazon Connect or SAML for identity management. For information about how to create
      # users using the Amazon Connect admin website, see Add Users in the Amazon Connect Administrator
      # Guide .
      def create_user(
        instance_id : String,
        phone_config : Types::UserPhoneConfig,
        routing_profile_id : String,
        security_profile_ids : Array(String),
        username : String,
        directory_user_id : String? = nil,
        hierarchy_group_id : String? = nil,
        identity_info : Types::UserIdentityInfo? = nil,
        password : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateUserRequest.new(instance_id: instance_id, phone_config: phone_config, routing_profile_id: routing_profile_id, security_profile_ids: security_profile_ids, username: username, directory_user_id: directory_user_id, hierarchy_group_id: hierarchy_group_id, identity_info: identity_info, password: password, tags: tags)
        create_user(input)
      end
      def create_user(input : Types::CreateUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new user hierarchy group.
      def create_user_hierarchy_group(
        instance_id : String,
        name : String,
        parent_group_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateUserHierarchyGroupRequest.new(instance_id: instance_id, name: name, parent_group_id: parent_group_id, tags: tags)
        create_user_hierarchy_group(input)
      end
      def create_user_hierarchy_group(input : Types::CreateUserHierarchyGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_USER_HIERARCHY_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new view with the possible status of SAVED or PUBLISHED . The views will have a unique
      # name for each connect instance. It performs basic content validation if the status is SAVED or full
      # content validation if the status is set to PUBLISHED . An error is returned if validation fails. It
      # associates either the $SAVED qualifier or both of the $SAVED and $LATEST qualifiers with the
      # provided view content based on the status. The view is idempotent if ClientToken is provided.
      def create_view(
        content : Types::ViewInputContent,
        instance_id : String,
        name : String,
        status : String,
        client_token : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateViewRequest.new(content: content, instance_id: instance_id, name: name, status: status, client_token: client_token, description: description, tags: tags)
        create_view(input)
      end
      def create_view(input : Types::CreateViewRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Publishes a new version of the view identifier. Versions are immutable and monotonically increasing.
      # It returns the highest version if there is no change in content compared to that version. An error
      # is displayed if the supplied ViewContentSha256 is different from the ViewContentSha256 of the
      # $LATEST alias.
      def create_view_version(
        instance_id : String,
        view_id : String,
        version_description : String? = nil,
        view_content_sha256 : String? = nil
      ) : Protocol::Request
        input = Types::CreateViewVersionRequest.new(instance_id: instance_id, view_id: view_id, version_description: version_description, view_content_sha256: view_content_sha256)
        create_view_version(input)
      end
      def create_view_version(input : Types::CreateViewVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VIEW_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a custom vocabulary associated with your Amazon Connect instance. You can set a custom
      # vocabulary to be your default vocabulary for a given language. Contact Lens for Amazon Connect uses
      # the default vocabulary in post-call and real-time contact analysis sessions for that language.
      def create_vocabulary(
        content : String,
        instance_id : String,
        language_code : String,
        vocabulary_name : String,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateVocabularyRequest.new(content: content, instance_id: instance_id, language_code: language_code, vocabulary_name: vocabulary_name, client_token: client_token, tags: tags)
        create_vocabulary(input)
      end
      def create_vocabulary(input : Types::CreateVocabularyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VOCABULARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a workspace that defines the user experience by mapping views to pages. Workspaces can be
      # assigned to users or routing profiles.
      def create_workspace(
        instance_id : String,
        name : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil,
        theme : Types::WorkspaceTheme? = nil,
        title : String? = nil
      ) : Protocol::Request
        input = Types::CreateWorkspaceRequest.new(instance_id: instance_id, name: name, description: description, tags: tags, theme: theme, title: title)
        create_workspace(input)
      end
      def create_workspace(input : Types::CreateWorkspaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKSPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a view with a page in a workspace, defining what users see when they navigate to that
      # page.
      def create_workspace_page(
        instance_id : String,
        page : String,
        resource_arn : String,
        workspace_id : String,
        input_data : String? = nil,
        slug : String? = nil
      ) : Protocol::Request
        input = Types::CreateWorkspacePageRequest.new(instance_id: instance_id, page: page, resource_arn: resource_arn, workspace_id: workspace_id, input_data: input_data, slug: slug)
        create_workspace_page(input)
      end
      def create_workspace_page(input : Types::CreateWorkspacePageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKSPACE_PAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deactivates an evaluation form in the specified Amazon Connect instance. After a form is
      # deactivated, it is no longer available for users to start new evaluations based on the form.
      def deactivate_evaluation_form(
        evaluation_form_id : String,
        evaluation_form_version : Int32,
        instance_id : String
      ) : Protocol::Request
        input = Types::DeactivateEvaluationFormRequest.new(evaluation_form_id: evaluation_form_id, evaluation_form_version: evaluation_form_version, instance_id: instance_id)
        deactivate_evaluation_form(input)
      end
      def deactivate_evaluation_form(input : Types::DeactivateEvaluationFormRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DEACTIVATE_EVALUATION_FORM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an attached file along with the underlying S3 Object. The attached file is permanently
      # deleted if S3 bucket versioning is not enabled.
      def delete_attached_file(
        associated_resource_arn : String,
        file_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DeleteAttachedFileRequest.new(associated_resource_arn: associated_resource_arn, file_id: file_id, instance_id: instance_id)
        delete_attached_file(input)
      end
      def delete_attached_file(input : Types::DeleteAttachedFileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ATTACHED_FILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a contact evaluation in the specified Amazon Connect instance.
      def delete_contact_evaluation(
        evaluation_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DeleteContactEvaluationRequest.new(evaluation_id: evaluation_id, instance_id: instance_id)
        delete_contact_evaluation(input)
      end
      def delete_contact_evaluation(input : Types::DeleteContactEvaluationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONTACT_EVALUATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a flow for the specified Amazon Connect instance.
      def delete_contact_flow(
        contact_flow_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DeleteContactFlowRequest.new(contact_flow_id: contact_flow_id, instance_id: instance_id)
        delete_contact_flow(input)
      end
      def delete_contact_flow(input : Types::DeleteContactFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONTACT_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified flow module.
      def delete_contact_flow_module(
        contact_flow_module_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DeleteContactFlowModuleRequest.new(contact_flow_module_id: contact_flow_module_id, instance_id: instance_id)
        delete_contact_flow_module(input)
      end
      def delete_contact_flow_module(input : Types::DeleteContactFlowModuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONTACT_FLOW_MODULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes an alias reference, breaking the named connection to the underlying module version without
      # affecting the version itself.
      def delete_contact_flow_module_alias(
        alias_id : String,
        contact_flow_module_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DeleteContactFlowModuleAliasRequest.new(alias_id: alias_id, contact_flow_module_id: contact_flow_module_id, instance_id: instance_id)
        delete_contact_flow_module_alias(input)
      end
      def delete_contact_flow_module_alias(input : Types::DeleteContactFlowModuleAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONTACT_FLOW_MODULE_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a specific version of a contact flow module.
      def delete_contact_flow_module_version(
        contact_flow_module_id : String,
        contact_flow_module_version : Int64,
        instance_id : String
      ) : Protocol::Request
        input = Types::DeleteContactFlowModuleVersionRequest.new(contact_flow_module_id: contact_flow_module_id, contact_flow_module_version: contact_flow_module_version, instance_id: instance_id)
        delete_contact_flow_module_version(input)
      end
      def delete_contact_flow_module_version(input : Types::DeleteContactFlowModuleVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONTACT_FLOW_MODULE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the particular version specified in flow version identifier.
      def delete_contact_flow_version(
        contact_flow_id : String,
        contact_flow_version : Int64,
        instance_id : String
      ) : Protocol::Request
        input = Types::DeleteContactFlowVersionRequest.new(contact_flow_id: contact_flow_id, contact_flow_version: contact_flow_version, instance_id: instance_id)
        delete_contact_flow_version(input)
      end
      def delete_contact_flow_version(input : Types::DeleteContactFlowVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONTACT_FLOW_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a data table and all associated attributes, versions, audits, and values. Does not update
      # any references to the data table, even from other data tables. This includes dynamic values and
      # conditional validations. System managed data tables are not deletable by customers. API users may
      # delete the table at any time. When deletion is requested from the admin website, a warning is shown
      # alerting the user of the most recent time the table and its values were accessed.
      def delete_data_table(
        data_table_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DeleteDataTableRequest.new(data_table_id: data_table_id, instance_id: instance_id)
        delete_data_table(input)
      end
      def delete_data_table(input : Types::DeleteDataTableRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_TABLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an attribute and all its values from a data table.
      def delete_data_table_attribute(
        attribute_name : String,
        data_table_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DeleteDataTableAttributeRequest.new(attribute_name: attribute_name, data_table_id: data_table_id, instance_id: instance_id)
        delete_data_table_attribute(input)
      end
      def delete_data_table_attribute(input : Types::DeleteDataTableAttributeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_TABLE_ATTRIBUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes email address from the specified Amazon Connect instance.
      def delete_email_address(
        email_address_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DeleteEmailAddressRequest.new(email_address_id: email_address_id, instance_id: instance_id)
        delete_email_address(input)
      end
      def delete_email_address(input : Types::DeleteEmailAddressRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EMAIL_ADDRESS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an evaluation form in the specified Amazon Connect instance. If the version property is
      # provided, only the specified version of the evaluation form is deleted. If no version is provided,
      # then the full form (all versions) is deleted.
      def delete_evaluation_form(
        evaluation_form_id : String,
        instance_id : String,
        evaluation_form_version : Int32? = nil
      ) : Protocol::Request
        input = Types::DeleteEvaluationFormRequest.new(evaluation_form_id: evaluation_form_id, instance_id: instance_id, evaluation_form_version: evaluation_form_version)
        delete_evaluation_form(input)
      end
      def delete_evaluation_form(input : Types::DeleteEvaluationFormRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EVALUATION_FORM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an hours of operation.
      def delete_hours_of_operation(
        hours_of_operation_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DeleteHoursOfOperationRequest.new(hours_of_operation_id: hours_of_operation_id, instance_id: instance_id)
        delete_hours_of_operation(input)
      end
      def delete_hours_of_operation(input : Types::DeleteHoursOfOperationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_HOURS_OF_OPERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an hours of operation override in an Amazon Connect hours of operation resource.
      def delete_hours_of_operation_override(
        hours_of_operation_id : String,
        hours_of_operation_override_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DeleteHoursOfOperationOverrideRequest.new(hours_of_operation_id: hours_of_operation_id, hours_of_operation_override_id: hours_of_operation_override_id, instance_id: instance_id)
        delete_hours_of_operation_override(input)
      end
      def delete_hours_of_operation_override(input : Types::DeleteHoursOfOperationOverrideRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_HOURS_OF_OPERATION_OVERRIDE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Deletes the Amazon
      # Connect instance. For more information, see Delete your Amazon Connect instance in the Amazon
      # Connect Administrator Guide . Amazon Connect enforces a limit on the total number of instances that
      # you can create or delete in 30 days. If you exceed this limit, you will get an error message
      # indicating there has been an excessive number of attempts at creating or deleting instances. You
      # must wait 30 days before you can restart creating and deleting instances in your account.
      def delete_instance(
        instance_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteInstanceRequest.new(instance_id: instance_id, client_token: client_token)
        delete_instance(input)
      end
      def delete_instance(input : Types::DeleteInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Web Services resource association from an Amazon Connect instance. The association
      # must not have any use cases associated with it.
      def delete_integration_association(
        instance_id : String,
        integration_association_id : String
      ) : Protocol::Request
        input = Types::DeleteIntegrationAssociationRequest.new(instance_id: instance_id, integration_association_id: integration_association_id)
        delete_integration_association(input)
      end
      def delete_integration_association(input : Types::DeleteIntegrationAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INTEGRATION_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a predefined attribute from the specified Amazon Connect instance.
      def delete_predefined_attribute(
        instance_id : String,
        name : String
      ) : Protocol::Request
        input = Types::DeletePredefinedAttributeRequest.new(instance_id: instance_id, name: name)
        delete_predefined_attribute(input)
      end
      def delete_predefined_attribute(input : Types::DeletePredefinedAttributeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PREDEFINED_ATTRIBUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a prompt.
      def delete_prompt(
        instance_id : String,
        prompt_id : String
      ) : Protocol::Request
        input = Types::DeletePromptRequest.new(instance_id: instance_id, prompt_id: prompt_id)
        delete_prompt(input)
      end
      def delete_prompt(input : Types::DeletePromptRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROMPT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes registration for a device token and a chat contact.
      def delete_push_notification_registration(
        contact_id : String,
        instance_id : String,
        registration_id : String
      ) : Protocol::Request
        input = Types::DeletePushNotificationRegistrationRequest.new(contact_id: contact_id, instance_id: instance_id, registration_id: registration_id)
        delete_push_notification_registration(input)
      end
      def delete_push_notification_registration(input : Types::DeletePushNotificationRegistrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PUSH_NOTIFICATION_REGISTRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a queue.
      def delete_queue(
        instance_id : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::DeleteQueueRequest.new(instance_id: instance_id, queue_id: queue_id)
        delete_queue(input)
      end
      def delete_queue(input : Types::DeleteQueueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_QUEUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a quick connect. After calling DeleteUser , it's important to call DeleteQuickConnect to
      # delete any records related to the deleted users. This will help you: Avoid dangling resources that
      # impact your service quotas. Remove deleted users so they don't appear to agents as transfer options.
      # Avoid the disruption of other Amazon Connect processes, such as instance replication and syncing if
      # you're using Amazon Connect Global Resiliency .
      def delete_quick_connect(
        instance_id : String,
        quick_connect_id : String
      ) : Protocol::Request
        input = Types::DeleteQuickConnectRequest.new(instance_id: instance_id, quick_connect_id: quick_connect_id)
        delete_quick_connect(input)
      end
      def delete_quick_connect(input : Types::DeleteQuickConnectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_QUICK_CONNECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a routing profile.
      def delete_routing_profile(
        instance_id : String,
        routing_profile_id : String
      ) : Protocol::Request
        input = Types::DeleteRoutingProfileRequest.new(instance_id: instance_id, routing_profile_id: routing_profile_id)
        delete_routing_profile(input)
      end
      def delete_routing_profile(input : Types::DeleteRoutingProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ROUTING_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a rule for the specified Amazon Connect instance.
      def delete_rule(
        instance_id : String,
        rule_id : String
      ) : Protocol::Request
        input = Types::DeleteRuleRequest.new(instance_id: instance_id, rule_id: rule_id)
        delete_rule(input)
      end
      def delete_rule(input : Types::DeleteRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a security profile.
      def delete_security_profile(
        instance_id : String,
        security_profile_id : String
      ) : Protocol::Request
        input = Types::DeleteSecurityProfileRequest.new(instance_id: instance_id, security_profile_id: security_profile_id)
        delete_security_profile(input)
      end
      def delete_security_profile(input : Types::DeleteSecurityProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SECURITY_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the task template.
      def delete_task_template(
        instance_id : String,
        task_template_id : String
      ) : Protocol::Request
        input = Types::DeleteTaskTemplateRequest.new(instance_id: instance_id, task_template_id: task_template_id)
        delete_task_template(input)
      end
      def delete_task_template(input : Types::DeleteTaskTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TASK_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a traffic distribution group. This API can be called only in the Region where the traffic
      # distribution group is created. For more information about deleting traffic distribution groups, see
      # Delete traffic distribution groups in the Amazon Connect Administrator Guide .
      def delete_traffic_distribution_group(
        traffic_distribution_group_id : String
      ) : Protocol::Request
        input = Types::DeleteTrafficDistributionGroupRequest.new(traffic_distribution_group_id: traffic_distribution_group_id)
        delete_traffic_distribution_group(input)
      end
      def delete_traffic_distribution_group(input : Types::DeleteTrafficDistributionGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TRAFFIC_DISTRIBUTION_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a use case from an integration association.
      def delete_use_case(
        instance_id : String,
        integration_association_id : String,
        use_case_id : String
      ) : Protocol::Request
        input = Types::DeleteUseCaseRequest.new(instance_id: instance_id, integration_association_id: integration_association_id, use_case_id: use_case_id)
        delete_use_case(input)
      end
      def delete_use_case(input : Types::DeleteUseCaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_USE_CASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a user account from the specified Amazon Connect instance. For information about what
      # happens to a user's data when their account is deleted, see Delete Users from Your Amazon Connect
      # Instance in the Amazon Connect Administrator Guide . After calling DeleteUser, call
      # DeleteQuickConnect to delete any records related to the deleted users. This will help you: Avoid
      # dangling resources that impact your service quotas. Remove deleted users so they don't appear to
      # agents as transfer options. Avoid the disruption of other Amazon Connect processes, such as instance
      # replication and syncing if you're using Amazon Connect Global Resiliency .
      def delete_user(
        instance_id : String,
        user_id : String
      ) : Protocol::Request
        input = Types::DeleteUserRequest.new(instance_id: instance_id, user_id: user_id)
        delete_user(input)
      end
      def delete_user(input : Types::DeleteUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing user hierarchy group. It must not be associated with any agents or have any
      # active child groups.
      def delete_user_hierarchy_group(
        hierarchy_group_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DeleteUserHierarchyGroupRequest.new(hierarchy_group_id: hierarchy_group_id, instance_id: instance_id)
        delete_user_hierarchy_group(input)
      end
      def delete_user_hierarchy_group(input : Types::DeleteUserHierarchyGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_USER_HIERARCHY_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the view entirely. It deletes the view and all associated qualifiers (versions and aliases).
      def delete_view(
        instance_id : String,
        view_id : String
      ) : Protocol::Request
        input = Types::DeleteViewRequest.new(instance_id: instance_id, view_id: view_id)
        delete_view(input)
      end
      def delete_view(input : Types::DeleteViewRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the particular version specified in ViewVersion identifier.
      def delete_view_version(
        instance_id : String,
        view_id : String,
        view_version : Int32
      ) : Protocol::Request
        input = Types::DeleteViewVersionRequest.new(instance_id: instance_id, view_id: view_id, view_version: view_version)
        delete_view_version(input)
      end
      def delete_view_version(input : Types::DeleteViewVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VIEW_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the vocabulary that has the given identifier.
      def delete_vocabulary(
        instance_id : String,
        vocabulary_id : String
      ) : Protocol::Request
        input = Types::DeleteVocabularyRequest.new(instance_id: instance_id, vocabulary_id: vocabulary_id)
        delete_vocabulary(input)
      end
      def delete_vocabulary(input : Types::DeleteVocabularyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VOCABULARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a workspace and removes all associated view and resource assignments.
      def delete_workspace(
        instance_id : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::DeleteWorkspaceRequest.new(instance_id: instance_id, workspace_id: workspace_id)
        delete_workspace(input)
      end
      def delete_workspace(input : Types::DeleteWorkspaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKSPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a media asset (such as a logo) from a workspace.
      def delete_workspace_media(
        instance_id : String,
        media_type : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::DeleteWorkspaceMediaRequest.new(instance_id: instance_id, media_type: media_type, workspace_id: workspace_id)
        delete_workspace_media(input)
      end
      def delete_workspace_media(input : Types::DeleteWorkspaceMediaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKSPACE_MEDIA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the association between a view and a page in a workspace. The page will display the default
      # view after deletion.
      def delete_workspace_page(
        instance_id : String,
        page : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::DeleteWorkspacePageRequest.new(instance_id: instance_id, page: page, workspace_id: workspace_id)
        delete_workspace_page(input)
      end
      def delete_workspace_page(input : Types::DeleteWorkspacePageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKSPACE_PAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an agent status.
      def describe_agent_status(
        agent_status_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DescribeAgentStatusRequest.new(agent_status_id: agent_status_id, instance_id: instance_id)
        describe_agent_status(input)
      end
      def describe_agent_status(input : Types::DescribeAgentStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_AGENT_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. To request access to
      # this API, contact Amazon Web Services Support. Describes the target authentication profile.
      def describe_authentication_profile(
        authentication_profile_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DescribeAuthenticationProfileRequest.new(authentication_profile_id: authentication_profile_id, instance_id: instance_id)
        describe_authentication_profile(input)
      end
      def describe_authentication_profile(input : Types::DescribeAuthenticationProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_AUTHENTICATION_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Describes the specified
      # contact. Use cases Following are common uses cases for this API: Retrieve contact information such
      # as the caller's phone number and the specific number the caller dialed to integrate into custom
      # monitoring or custom agent experience solutions. Detect when a customer chat session disconnects due
      # to a network issue on the agent's end. Use the DisconnectReason field in the ContactTraceRecord to
      # detect this event and then re-queue the chat for followup. Identify after contact work (ACW)
      # duration and call recordings information when a COMPLETED event is received by using the contact
      # event stream . Important things to know SystemEndpoint is not populated for contacts with initiation
      # method of MONITOR, QUEUE_TRANSFER, or CALLBACK Contact information remains available in Amazon
      # Connect for 24 months from the InitiationTimestamp , and then it is deleted. Only contact
      # information that is available in Amazon Connect is returned by this API. Endpoints : See Amazon
      # Connect endpoints and quotas .
      def describe_contact(
        contact_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DescribeContactRequest.new(contact_id: contact_id, instance_id: instance_id)
        describe_contact(input)
      end
      def describe_contact(input : Types::DescribeContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a contact evaluation in the specified Amazon Connect instance.
      def describe_contact_evaluation(
        evaluation_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DescribeContactEvaluationRequest.new(evaluation_id: evaluation_id, instance_id: instance_id)
        describe_contact_evaluation(input)
      end
      def describe_contact_evaluation(input : Types::DescribeContactEvaluationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CONTACT_EVALUATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the specified flow. You can also create and update flows using the Amazon Connect Flow
      # language . Use the $SAVED alias in the request to describe the SAVED content of a Flow. For example,
      # arn:aws:.../contact-flow/{id}:$SAVED . After a flow is published, $SAVED needs to be supplied to
      # view saved content that has not been published. Use arn:aws:.../contact-flow/{id}:{version} to
      # retrieve the content of a specific flow version. In the response, Status indicates the flow status
      # as either SAVED or PUBLISHED . The PUBLISHED status will initiate validation on the content. SAVED
      # does not initiate validation of the content. SAVED | PUBLISHED
      def describe_contact_flow(
        contact_flow_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DescribeContactFlowRequest.new(contact_flow_id: contact_flow_id, instance_id: instance_id)
        describe_contact_flow(input)
      end
      def describe_contact_flow(input : Types::DescribeContactFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CONTACT_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the specified flow module. Use the $SAVED alias in the request to describe the SAVED
      # content of a Flow. For example, arn:aws:.../contact-flow/{id}:$SAVED . After a flow is published,
      # $SAVED needs to be supplied to view saved content that has not been published.
      def describe_contact_flow_module(
        contact_flow_module_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DescribeContactFlowModuleRequest.new(contact_flow_module_id: contact_flow_module_id, instance_id: instance_id)
        describe_contact_flow_module(input)
      end
      def describe_contact_flow_module(input : Types::DescribeContactFlowModuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CONTACT_FLOW_MODULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves detailed information about a specific alias, including which version it currently points
      # to and its metadata.
      def describe_contact_flow_module_alias(
        alias_id : String,
        contact_flow_module_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DescribeContactFlowModuleAliasRequest.new(alias_id: alias_id, contact_flow_module_id: contact_flow_module_id, instance_id: instance_id)
        describe_contact_flow_module_alias(input)
      end
      def describe_contact_flow_module_alias(input : Types::DescribeContactFlowModuleAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CONTACT_FLOW_MODULE_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns all properties for a data table except for attributes and values. All properties from
      # CreateDataTable are returned as well as properties for region replication, versioning, and system
      # tables. "Describe" is a deprecated term but is allowed to maintain consistency with existing
      # operations.
      def describe_data_table(
        data_table_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DescribeDataTableRequest.new(data_table_id: data_table_id, instance_id: instance_id)
        describe_data_table(input)
      end
      def describe_data_table(input : Types::DescribeDataTableRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DATA_TABLE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns detailed information for a specific data table attribute including its configuration,
      # validation rules, and metadata. "Describe" is a deprecated term but is allowed to maintain
      # consistency with existing operations.
      def describe_data_table_attribute(
        attribute_name : String,
        data_table_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DescribeDataTableAttributeRequest.new(attribute_name: attribute_name, data_table_id: data_table_id, instance_id: instance_id)
        describe_data_table_attribute(input)
      end
      def describe_data_table_attribute(input : Types::DescribeDataTableAttributeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DATA_TABLE_ATTRIBUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describe email address form the specified Amazon Connect instance.
      def describe_email_address(
        email_address_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DescribeEmailAddressRequest.new(email_address_id: email_address_id, instance_id: instance_id)
        describe_email_address(input)
      end
      def describe_email_address(input : Types::DescribeEmailAddressRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_EMAIL_ADDRESS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an evaluation form in the specified Amazon Connect instance. If the version property is
      # not provided, the latest version of the evaluation form is described.
      def describe_evaluation_form(
        evaluation_form_id : String,
        instance_id : String,
        evaluation_form_version : Int32? = nil
      ) : Protocol::Request
        input = Types::DescribeEvaluationFormRequest.new(evaluation_form_id: evaluation_form_id, instance_id: instance_id, evaluation_form_version: evaluation_form_version)
        describe_evaluation_form(input)
      end
      def describe_evaluation_form(input : Types::DescribeEvaluationFormRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_EVALUATION_FORM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the hours of operation.
      def describe_hours_of_operation(
        hours_of_operation_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DescribeHoursOfOperationRequest.new(hours_of_operation_id: hours_of_operation_id, instance_id: instance_id)
        describe_hours_of_operation(input)
      end
      def describe_hours_of_operation(input : Types::DescribeHoursOfOperationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_HOURS_OF_OPERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the hours of operation override.
      def describe_hours_of_operation_override(
        hours_of_operation_id : String,
        hours_of_operation_override_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DescribeHoursOfOperationOverrideRequest.new(hours_of_operation_id: hours_of_operation_id, hours_of_operation_override_id: hours_of_operation_override_id, instance_id: instance_id)
        describe_hours_of_operation_override(input)
      end
      def describe_hours_of_operation_override(input : Types::DescribeHoursOfOperationOverrideRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_HOURS_OF_OPERATION_OVERRIDE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Returns the current
      # state of the specified instance identifier. It tracks the instance while it is being created and
      # returns an error status, if applicable. If an instance is not created successfully, the instance
      # status reason field returns details relevant to the reason. The instance in a failed state is
      # returned only for 24 hours after the CreateInstance API was invoked.
      def describe_instance(
        instance_id : String
      ) : Protocol::Request
        input = Types::DescribeInstanceRequest.new(instance_id: instance_id)
        describe_instance(input)
      end
      def describe_instance(input : Types::DescribeInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Describes the specified
      # instance attribute.
      def describe_instance_attribute(
        attribute_type : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DescribeInstanceAttributeRequest.new(attribute_type: attribute_type, instance_id: instance_id)
        describe_instance_attribute(input)
      end
      def describe_instance_attribute(input : Types::DescribeInstanceAttributeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_INSTANCE_ATTRIBUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Retrieves the current
      # storage configurations for the specified resource type, association ID, and instance ID.
      def describe_instance_storage_config(
        association_id : String,
        instance_id : String,
        resource_type : String
      ) : Protocol::Request
        input = Types::DescribeInstanceStorageConfigRequest.new(association_id: association_id, instance_id: instance_id, resource_type: resource_type)
        describe_instance_storage_config(input)
      end
      def describe_instance_storage_config(input : Types::DescribeInstanceStorageConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_INSTANCE_STORAGE_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details and status of a phone number that’s claimed to your Amazon Connect instance or traffic
      # distribution group. If the number is claimed to a traffic distribution group, and you are calling in
      # the Amazon Web Services Region where the traffic distribution group was created, you can use either
      # a phone number ARN or UUID value for the PhoneNumberId URI request parameter. However, if the number
      # is claimed to a traffic distribution group and you are calling this API in the alternate Amazon Web
      # Services Region associated with the traffic distribution group, you must provide a full phone number
      # ARN. If a UUID is provided in this scenario, you receive a ResourceNotFoundException .
      def describe_phone_number(
        phone_number_id : String
      ) : Protocol::Request
        input = Types::DescribePhoneNumberRequest.new(phone_number_id: phone_number_id)
        describe_phone_number(input)
      end
      def describe_phone_number(input : Types::DescribePhoneNumberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PHONE_NUMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a predefined attribute for the specified Amazon Connect instance. A predefined attribute
      # is made up of a name and a value. You can use predefined attributes for: Routing proficiency (for
      # example, agent certification) that has predefined values (for example, a list of possible
      # certifications). For more information, see Create predefined attributes for routing contacts to
      # agents . Contact information that varies between transfers or conferences, such as the name of the
      # business unit handling the contact. For more information, see Use contact segment attributes . For
      # the predefined attributes per instance quota, see Amazon Connect quotas . Endpoints : See Amazon
      # Connect endpoints and quotas .
      def describe_predefined_attribute(
        instance_id : String,
        name : String
      ) : Protocol::Request
        input = Types::DescribePredefinedAttributeRequest.new(instance_id: instance_id, name: name)
        describe_predefined_attribute(input)
      end
      def describe_predefined_attribute(input : Types::DescribePredefinedAttributeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PREDEFINED_ATTRIBUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the prompt.
      def describe_prompt(
        instance_id : String,
        prompt_id : String
      ) : Protocol::Request
        input = Types::DescribePromptRequest.new(instance_id: instance_id, prompt_id: prompt_id)
        describe_prompt(input)
      end
      def describe_prompt(input : Types::DescribePromptRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PROMPT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the specified queue.
      def describe_queue(
        instance_id : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::DescribeQueueRequest.new(instance_id: instance_id, queue_id: queue_id)
        describe_queue(input)
      end
      def describe_queue(input : Types::DescribeQueueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_QUEUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the quick connect.
      def describe_quick_connect(
        instance_id : String,
        quick_connect_id : String
      ) : Protocol::Request
        input = Types::DescribeQuickConnectRequest.new(instance_id: instance_id, quick_connect_id: quick_connect_id)
        describe_quick_connect(input)
      end
      def describe_quick_connect(input : Types::DescribeQuickConnectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_QUICK_CONNECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the specified routing profile. DescribeRoutingProfile does not populate AssociatedQueueIds
      # in its response. The example Response Syntax shown on this page is incorrect; we are working to
      # update it. SearchRoutingProfiles does include AssociatedQueueIds.
      def describe_routing_profile(
        instance_id : String,
        routing_profile_id : String
      ) : Protocol::Request
        input = Types::DescribeRoutingProfileRequest.new(instance_id: instance_id, routing_profile_id: routing_profile_id)
        describe_routing_profile(input)
      end
      def describe_routing_profile(input : Types::DescribeRoutingProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ROUTING_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a rule for the specified Amazon Connect instance.
      def describe_rule(
        instance_id : String,
        rule_id : String
      ) : Protocol::Request
        input = Types::DescribeRuleRequest.new(instance_id: instance_id, rule_id: rule_id)
        describe_rule(input)
      end
      def describe_rule(input : Types::DescribeRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets basic information about the security profile. For information about security profiles, see
      # Security Profiles in the Amazon Connect Administrator Guide . For a mapping of the API name and user
      # interface name of the security profile permissions, see List of security profile permissions .
      def describe_security_profile(
        instance_id : String,
        security_profile_id : String
      ) : Protocol::Request
        input = Types::DescribeSecurityProfileRequest.new(instance_id: instance_id, security_profile_id: security_profile_id)
        describe_security_profile(input)
      end
      def describe_security_profile(input : Types::DescribeSecurityProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SECURITY_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details and status of a traffic distribution group.
      def describe_traffic_distribution_group(
        traffic_distribution_group_id : String
      ) : Protocol::Request
        input = Types::DescribeTrafficDistributionGroupRequest.new(traffic_distribution_group_id: traffic_distribution_group_id)
        describe_traffic_distribution_group(input)
      end
      def describe_traffic_distribution_group(input : Types::DescribeTrafficDistributionGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_TRAFFIC_DISTRIBUTION_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the specified user. You can find the instance ID in the Amazon Connect console (it’s the
      # final part of the ARN). The console does not display the user IDs. Instead, list the users and note
      # the IDs provided in the output.
      def describe_user(
        instance_id : String,
        user_id : String
      ) : Protocol::Request
        input = Types::DescribeUserRequest.new(instance_id: instance_id, user_id: user_id)
        describe_user(input)
      end
      def describe_user(input : Types::DescribeUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the specified hierarchy group.
      def describe_user_hierarchy_group(
        hierarchy_group_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::DescribeUserHierarchyGroupRequest.new(hierarchy_group_id: hierarchy_group_id, instance_id: instance_id)
        describe_user_hierarchy_group(input)
      end
      def describe_user_hierarchy_group(input : Types::DescribeUserHierarchyGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_USER_HIERARCHY_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the hierarchy structure of the specified Amazon Connect instance.
      def describe_user_hierarchy_structure(
        instance_id : String
      ) : Protocol::Request
        input = Types::DescribeUserHierarchyStructureRequest.new(instance_id: instance_id)
        describe_user_hierarchy_structure(input)
      end
      def describe_user_hierarchy_structure(input : Types::DescribeUserHierarchyStructureRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_USER_HIERARCHY_STRUCTURE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the view for the specified Amazon Connect instance and view identifier. The view
      # identifier can be supplied as a ViewId or ARN. $SAVED needs to be supplied if a view is unpublished.
      # The view identifier can contain an optional qualifier, for example, &lt;view-id&gt;:$SAVED , which
      # is either an actual version number or an Amazon Connect managed qualifier $SAVED | $LATEST . If it
      # is not supplied, then $LATEST is assumed for customer managed views and an error is returned if
      # there is no published content available. Version 1 is assumed for Amazon Web Services managed views.
      def describe_view(
        instance_id : String,
        view_id : String
      ) : Protocol::Request
        input = Types::DescribeViewRequest.new(instance_id: instance_id, view_id: view_id)
        describe_view(input)
      end
      def describe_view(input : Types::DescribeViewRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the specified vocabulary.
      def describe_vocabulary(
        instance_id : String,
        vocabulary_id : String
      ) : Protocol::Request
        input = Types::DescribeVocabularyRequest.new(instance_id: instance_id, vocabulary_id: vocabulary_id)
        describe_vocabulary(input)
      end
      def describe_vocabulary(input : Types::DescribeVocabularyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_VOCABULARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details about a workspace, including its configuration and metadata.
      def describe_workspace(
        instance_id : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::DescribeWorkspaceRequest.new(instance_id: instance_id, workspace_id: workspace_id)
        describe_workspace(input)
      end
      def describe_workspace(input : Types::DescribeWorkspaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_WORKSPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the dataset ID associated with a given Amazon Connect instance.
      def disassociate_analytics_data_set(
        data_set_id : String,
        instance_id : String,
        target_account_id : String? = nil
      ) : Protocol::Request
        input = Types::DisassociateAnalyticsDataSetRequest.new(data_set_id: data_set_id, instance_id: instance_id, target_account_id: target_account_id)
        disassociate_analytics_data_set(input)
      end
      def disassociate_analytics_data_set(input : Types::DisassociateAnalyticsDataSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_ANALYTICS_DATA_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Revokes access to
      # integrated applications from Amazon Connect.
      def disassociate_approved_origin(
        instance_id : String,
        origin : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DisassociateApprovedOriginRequest.new(instance_id: instance_id, origin: origin, client_token: client_token)
        disassociate_approved_origin(input)
      end
      def disassociate_approved_origin(input : Types::DisassociateApprovedOriginRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_APPROVED_ORIGIN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Revokes authorization
      # from the specified instance to access the specified Amazon Lex or Amazon Lex V2 bot.
      def disassociate_bot(
        instance_id : String,
        client_token : String? = nil,
        lex_bot : Types::LexBot? = nil,
        lex_v2_bot : Types::LexV2Bot? = nil
      ) : Protocol::Request
        input = Types::DisassociateBotRequest.new(instance_id: instance_id, client_token: client_token, lex_bot: lex_bot, lex_v2_bot: lex_v2_bot)
        disassociate_bot(input)
      end
      def disassociate_bot(input : Types::DisassociateBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the alias association between two email addresses in an Amazon Connect instance. After
      # disassociation, emails sent to the former alias email address are no longer forwarded to the primary
      # email address. Both email addresses continue to exist independently and can receive emails directly.
      # Use cases Following are common uses cases for this API: Department separation : Remove alias
      # relationships when splitting a consolidated support queue back into separate department-specific
      # queues. Email address retirement : Cleanly remove forwarding relationships before decommissioning
      # old email addresses. Organizational restructuring : Reconfigure email routing when business
      # processes change and aliases are no longer needed. Important things to know Concurrent operations:
      # This API uses distributed locking, so concurrent operations on the same email addresses may be
      # temporarily blocked. Emails sent to the former alias address are still delivered directly to that
      # address if it exists. You do not need to delete the email addresses after disassociation. Both
      # addresses remain active independently. After a successful disassociation, you can immediately create
      # a new alias relationship with the same addresses. 200 status means alias was successfully
      # disassociated. DisassociateEmailAddressAlias does not return the following information: Details in
      # the response about the email that was disassociated. The response returns an empty body. The
      # timestamp of when the disassociation occurred. Endpoints : See Amazon Connect endpoints and quotas .
      # Related operations AssociateEmailAddressAlias : Associates an email address alias with an existing
      # email address in an Amazon Connect instance. DescribeEmailAddress : View current alias
      # configurations for an email address. SearchEmailAddresses : Find email addresses and their alias
      # relationships across an instance. CreateEmailAddress : Create new email addresses that can
      # participate in alias relationships. DeleteEmailAddress : Remove email addresses (automatically
      # removes any alias relationships). UpdateEmailAddressMetadata : Modify email address properties (does
      # not affect alias relationships).
      def disassociate_email_address_alias(
        alias_configuration : Types::AliasConfiguration,
        email_address_id : String,
        instance_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DisassociateEmailAddressAliasRequest.new(alias_configuration: alias_configuration, email_address_id: email_address_id, instance_id: instance_id, client_token: client_token)
        disassociate_email_address_alias(input)
      end
      def disassociate_email_address_alias(input : Types::DisassociateEmailAddressAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_EMAIL_ADDRESS_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a connect resource from a flow.
      def disassociate_flow(
        instance_id : String,
        resource_id : String,
        resource_type : String
      ) : Protocol::Request
        input = Types::DisassociateFlowRequest.new(instance_id: instance_id, resource_id: resource_id, resource_type: resource_type)
        disassociate_flow(input)
      end
      def disassociate_flow(input : Types::DisassociateFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a set of hours of operations with another hours of operation. Refer to Administrator
      # Guide here for more information on inheriting overrides from parent hours of operation(s).
      def disassociate_hours_of_operations(
        hours_of_operation_id : String,
        instance_id : String,
        parent_hours_of_operation_ids : Array(String)
      ) : Protocol::Request
        input = Types::DisassociateHoursOfOperationsRequest.new(hours_of_operation_id: hours_of_operation_id, instance_id: instance_id, parent_hours_of_operation_ids: parent_hours_of_operation_ids)
        disassociate_hours_of_operations(input)
      end
      def disassociate_hours_of_operations(input : Types::DisassociateHoursOfOperationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_HOURS_OF_OPERATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Removes the storage type
      # configurations for the specified resource type and association ID.
      def disassociate_instance_storage_config(
        association_id : String,
        instance_id : String,
        resource_type : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DisassociateInstanceStorageConfigRequest.new(association_id: association_id, instance_id: instance_id, resource_type: resource_type, client_token: client_token)
        disassociate_instance_storage_config(input)
      end
      def disassociate_instance_storage_config(input : Types::DisassociateInstanceStorageConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_INSTANCE_STORAGE_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Remove the Lambda
      # function from the dropdown options available in the relevant flow blocks.
      def disassociate_lambda_function(
        function_arn : String,
        instance_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DisassociateLambdaFunctionRequest.new(function_arn: function_arn, instance_id: instance_id, client_token: client_token)
        disassociate_lambda_function(input)
      end
      def disassociate_lambda_function(input : Types::DisassociateLambdaFunctionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_LAMBDA_FUNCTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Revokes authorization
      # from the specified instance to access the specified Amazon Lex bot.
      def disassociate_lex_bot(
        bot_name : String,
        instance_id : String,
        lex_region : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DisassociateLexBotRequest.new(bot_name: bot_name, instance_id: instance_id, lex_region: lex_region, client_token: client_token)
        disassociate_lex_bot(input)
      end
      def disassociate_lex_bot(input : Types::DisassociateLexBotRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_LEX_BOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the flow association from a phone number claimed to your Amazon Connect instance. If the
      # number is claimed to a traffic distribution group, and you are calling this API using an instance in
      # the Amazon Web Services Region where the traffic distribution group was created, you can use either
      # a full phone number ARN or UUID value for the PhoneNumberId URI request parameter. However, if the
      # number is claimed to a traffic distribution group and you are calling this API using an instance in
      # the alternate Amazon Web Services Region associated with the traffic distribution group, you must
      # provide a full phone number ARN. If a UUID is provided in this scenario, you will receive a
      # ResourceNotFoundException .
      def disassociate_phone_number_contact_flow(
        instance_id : String,
        phone_number_id : String
      ) : Protocol::Request
        input = Types::DisassociatePhoneNumberContactFlowRequest.new(instance_id: instance_id, phone_number_id: phone_number_id)
        disassociate_phone_number_contact_flow(input)
      end
      def disassociate_phone_number_contact_flow(input : Types::DisassociatePhoneNumberContactFlowRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_PHONE_NUMBER_CONTACT_FLOW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a set of quick connects from a queue.
      def disassociate_queue_quick_connects(
        instance_id : String,
        queue_id : String,
        quick_connect_ids : Array(String)
      ) : Protocol::Request
        input = Types::DisassociateQueueQuickConnectsRequest.new(instance_id: instance_id, queue_id: queue_id, quick_connect_ids: quick_connect_ids)
        disassociate_queue_quick_connects(input)
      end
      def disassociate_queue_quick_connects(input : Types::DisassociateQueueQuickConnectsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_QUEUE_QUICK_CONNECTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a set of queues from a routing profile. Up to 10 queue references can be disassociated
      # in a single API call. More than 10 queue references results in a single call results in an
      # InvalidParameterException.
      def disassociate_routing_profile_queues(
        instance_id : String,
        routing_profile_id : String,
        manual_assignment_queue_references : Array(Types::RoutingProfileQueueReference)? = nil,
        queue_references : Array(Types::RoutingProfileQueueReference)? = nil
      ) : Protocol::Request
        input = Types::DisassociateRoutingProfileQueuesRequest.new(instance_id: instance_id, routing_profile_id: routing_profile_id, manual_assignment_queue_references: manual_assignment_queue_references, queue_references: queue_references)
        disassociate_routing_profile_queues(input)
      end
      def disassociate_routing_profile_queues(input : Types::DisassociateRoutingProfileQueuesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_ROUTING_PROFILE_QUEUES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Deletes the specified
      # security key.
      def disassociate_security_key(
        association_id : String,
        instance_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DisassociateSecurityKeyRequest.new(association_id: association_id, instance_id: instance_id, client_token: client_token)
        disassociate_security_key(input)
      end
      def disassociate_security_key(input : Types::DisassociateSecurityKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_SECURITY_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a security profile attached to a Q in Connect AI Agent Entity in an Amazon Connect
      # instance.
      def disassociate_security_profiles(
        entity_arn : String,
        entity_type : String,
        instance_id : String,
        security_profiles : Array(Types::SecurityProfileItem)
      ) : Protocol::Request
        input = Types::DisassociateSecurityProfilesRequest.new(entity_arn: entity_arn, entity_type: entity_type, instance_id: instance_id, security_profiles: security_profiles)
        disassociate_security_profiles(input)
      end
      def disassociate_security_profiles(input : Types::DisassociateSecurityProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_SECURITY_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates an agent from a traffic distribution group. This API can be called only in the Region
      # where the traffic distribution group is created.
      def disassociate_traffic_distribution_group_user(
        instance_id : String,
        traffic_distribution_group_id : String,
        user_id : String
      ) : Protocol::Request
        input = Types::DisassociateTrafficDistributionGroupUserRequest.new(instance_id: instance_id, traffic_distribution_group_id: traffic_distribution_group_id, user_id: user_id)
        disassociate_traffic_distribution_group_user(input)
      end
      def disassociate_traffic_distribution_group_user(input : Types::DisassociateTrafficDistributionGroupUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_TRAFFIC_DISTRIBUTION_GROUP_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a set of proficiencies from a user.
      def disassociate_user_proficiencies(
        instance_id : String,
        user_id : String,
        user_proficiencies : Array(Types::UserProficiencyDisassociate)
      ) : Protocol::Request
        input = Types::DisassociateUserProficienciesRequest.new(instance_id: instance_id, user_id: user_id, user_proficiencies: user_proficiencies)
        disassociate_user_proficiencies(input)
      end
      def disassociate_user_proficiencies(input : Types::DisassociateUserProficienciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_USER_PROFICIENCIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the association between a workspace and one or more users or routing profiles.
      def disassociate_workspace(
        instance_id : String,
        resource_arns : Array(String),
        workspace_id : String
      ) : Protocol::Request
        input = Types::DisassociateWorkspaceRequest.new(instance_id: instance_id, resource_arns: resource_arns, workspace_id: workspace_id)
        disassociate_workspace(input)
      end
      def disassociate_workspace(input : Types::DisassociateWorkspaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_WORKSPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Dismisses contacts from an agent’s CCP and returns the agent to an available state, which allows the
      # agent to receive a new routed contact. Contacts can only be dismissed if they are in a MISSED ,
      # ERROR , ENDED , or REJECTED state in the Agent Event Stream .
      def dismiss_user_contact(
        contact_id : String,
        instance_id : String,
        user_id : String
      ) : Protocol::Request
        input = Types::DismissUserContactRequest.new(contact_id: contact_id, instance_id: instance_id, user_id: user_id)
        dismiss_user_contact(input)
      end
      def dismiss_user_contact(input : Types::DismissUserContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISMISS_USER_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Evaluates values at the time of the request and returns them. It considers the request's timezone or
      # the table's timezone, in that order, when accessing time based tables. When a value is accessed, the
      # accessor's identity and the time of access are saved alongside the value to help identify values
      # that are actively in use. The term "Batch" is not included in the operation name since it does not
      # meet all the criteria for a batch operation as specified in Batch Operations: Amazon Web Services
      # API Standards.
      def evaluate_data_table_values(
        data_table_id : String,
        instance_id : String,
        values : Array(Types::DataTableValueEvaluationSet),
        max_results : Int32? = nil,
        next_token : String? = nil,
        time_zone : String? = nil
      ) : Protocol::Request
        input = Types::EvaluateDataTableValuesRequest.new(data_table_id: data_table_id, instance_id: instance_id, values: values, max_results: max_results, next_token: next_token, time_zone: time_zone)
        evaluate_data_table_values(input)
      end
      def evaluate_data_table_values(input : Types::EvaluateDataTableValuesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EVALUATE_DATA_TABLE_VALUES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides a pre-signed URL for download of an approved attached file. This API also returns metadata
      # about the attached file. It will only return a downloadURL if the status of the attached file is
      # APPROVED .
      def get_attached_file(
        associated_resource_arn : String,
        file_id : String,
        instance_id : String,
        url_expiry_in_seconds : Int32? = nil
      ) : Protocol::Request
        input = Types::GetAttachedFileRequest.new(associated_resource_arn: associated_resource_arn, file_id: file_id, instance_id: instance_id, url_expiry_in_seconds: url_expiry_in_seconds)
        get_attached_file(input)
      end
      def get_attached_file(input : Types::GetAttachedFileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ATTACHED_FILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the contact attributes for the specified contact.
      def get_contact_attributes(
        initial_contact_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::GetContactAttributesRequest.new(initial_contact_id: initial_contact_id, instance_id: instance_id)
        get_contact_attributes(input)
      end
      def get_contact_attributes(input : Types::GetContactAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONTACT_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the position of the contact in the queue. Use cases Following are common uses cases for
      # position in queue: Understand the expected wait experience of a contact. Inform customers of their
      # position in queue and potentially offer a callback. Make data-driven routing decisions between
      # primary and alternative queues. Enhance queue visibility and leverage agent proficiencies to
      # streamline contact routing. Important things to know The only way to retrieve the position of the
      # contact in queue is by using this API. You can't retrieve the position by using flows and
      # attributes. For more information, see the Position in queue metric in the Amazon Connect
      # Administrator Guide . Endpoints : See Amazon Connect endpoints and quotas .
      def get_contact_metrics(
        contact_id : String,
        instance_id : String,
        metrics : Array(Types::ContactMetricInfo)
      ) : Protocol::Request
        input = Types::GetContactMetricsRequest.new(contact_id: contact_id, instance_id: instance_id, metrics: metrics)
        get_contact_metrics(input)
      end
      def get_contact_metrics(input : Types::GetContactMetricsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONTACT_METRICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the real-time metric data from the specified Amazon Connect instance. For a description of each
      # metric, see Metrics definitions in the Amazon Connect Administrator Guide . When you make a
      # successful API request, you can expect the following metric values in the response: Metric value is
      # null : The calculation cannot be performed due to divide by zero or insufficient data Metric value
      # is a number (including 0) of defined type : The number provided is the calculation result
      # MetricResult list is empty : The request cannot find any data in the system The following guidelines
      # can help you work with the API: Each dimension in the metric response must contain a value Each item
      # in MetricResult must include all requested metrics If the response is slow due to large result sets,
      # try these approaches: Add filters to reduce the amount of data returned
      def get_current_metric_data(
        current_metrics : Array(Types::CurrentMetric),
        filters : Types::Filters,
        instance_id : String,
        groupings : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_criteria : Array(Types::CurrentMetricSortCriteria)? = nil
      ) : Protocol::Request
        input = Types::GetCurrentMetricDataRequest.new(current_metrics: current_metrics, filters: filters, instance_id: instance_id, groupings: groupings, max_results: max_results, next_token: next_token, sort_criteria: sort_criteria)
        get_current_metric_data(input)
      end
      def get_current_metric_data(input : Types::GetCurrentMetricDataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CURRENT_METRIC_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the real-time active user data from the specified Amazon Connect instance.
      def get_current_user_data(
        filters : Types::UserDataFilters,
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetCurrentUserDataRequest.new(filters: filters, instance_id: instance_id, max_results: max_results, next_token: next_token)
        get_current_user_data(input)
      end
      def get_current_user_data(input : Types::GetCurrentUserDataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CURRENT_USER_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the hours of operations with the effective override applied.
      def get_effective_hours_of_operations(
        from_date : String,
        hours_of_operation_id : String,
        instance_id : String,
        to_date : String
      ) : Protocol::Request
        input = Types::GetEffectiveHoursOfOperationsRequest.new(from_date: from_date, hours_of_operation_id: hours_of_operation_id, instance_id: instance_id, to_date: to_date)
        get_effective_hours_of_operations(input)
      end
      def get_effective_hours_of_operations(input : Types::GetEffectiveHoursOfOperationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EFFECTIVE_HOURS_OF_OPERATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Supports SAML sign-in for Amazon Connect. Retrieves a token for federation. The token is for the
      # Amazon Connect user which corresponds to the IAM credentials that were used to invoke this action.
      # For more information about how SAML sign-in works in Amazon Connect, see Configure SAML with IAM for
      # Amazon Connect in the Amazon Connect Administrator Guide . This API doesn't support root users. If
      # you try to invoke GetFederationToken with root credentials, an error message similar to the
      # following one appears: Provided identity: Principal: .... User: .... cannot be used for federation
      # with Amazon Connect
      def get_federation_token(
        instance_id : String
      ) : Protocol::Request
        input = Types::GetFederationTokenRequest.new(instance_id: instance_id)
        get_federation_token(input)
      end
      def get_federation_token(input : Types::GetFederationTokenRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FEDERATION_TOKEN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the flow associated for a given resource.
      def get_flow_association(
        instance_id : String,
        resource_id : String,
        resource_type : String
      ) : Protocol::Request
        input = Types::GetFlowAssociationRequest.new(instance_id: instance_id, resource_id: resource_id, resource_type: resource_type)
        get_flow_association(input)
      end
      def get_flow_association(input : Types::GetFlowAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FLOW_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets historical metric data from the specified Amazon Connect instance. For a description of each
      # historical metric, see Metrics definitions in the Amazon Connect Administrator Guide . We recommend
      # using the GetMetricDataV2 API. It provides more flexibility, features, and the ability to query
      # longer time ranges than GetMetricData . Use it to retrieve historical agent and contact metrics for
      # the last 3 months, at varying intervals. You can also use it to build custom dashboards to measure
      # historical queue and agent performance. For example, you can track the number of incoming contacts
      # for the last 7 days, with data split by day, to see how contact volume changed per day of the week.
      def get_metric_data(
        end_time : Time,
        filters : Types::Filters,
        historical_metrics : Array(Types::HistoricalMetric),
        instance_id : String,
        start_time : Time,
        groupings : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetMetricDataRequest.new(end_time: end_time, filters: filters, historical_metrics: historical_metrics, instance_id: instance_id, start_time: start_time, groupings: groupings, max_results: max_results, next_token: next_token)
        get_metric_data(input)
      end
      def get_metric_data(input : Types::GetMetricDataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_METRIC_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets metric data from the specified Amazon Connect instance. GetMetricDataV2 offers more features
      # than GetMetricData , the previous version of this API. It has new metrics, offers filtering at a
      # metric level, and offers the ability to filter and group data by channels, queues, routing profiles,
      # agents, and agent hierarchy levels. It can retrieve historical data for the last 3 months, at
      # varying intervals. It does not support agent queues. For a description of the historical metrics
      # that are supported by GetMetricDataV2 and GetMetricData , see Metrics definitions in the Amazon
      # Connect Administrator Guide . When you make a successful API request, you can expect the following
      # metric values in the response: Metric value is null : The calculation cannot be performed due to
      # divide by zero or insufficient data Metric value is a number (including 0) of defined type : The
      # number provided is the calculation result MetricResult list is empty : The request cannot find any
      # data in the system The following guidelines can help you work with the API: Each dimension in the
      # metric response must contain a value Each item in MetricResult must include all requested metrics If
      # the response is slow due to large result sets, try these approaches: Narrow the time range of your
      # request Add filters to reduce the amount of data returned
      def get_metric_data_v2(
        end_time : Time,
        filters : Array(Types::FilterV2),
        metrics : Array(Types::MetricV2),
        resource_arn : String,
        start_time : Time,
        groupings : Array(String)? = nil,
        interval : Types::IntervalDetails? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetMetricDataV2Request.new(end_time: end_time, filters: filters, metrics: metrics, resource_arn: resource_arn, start_time: start_time, groupings: groupings, interval: interval, max_results: max_results, next_token: next_token)
        get_metric_data_v2(input)
      end
      def get_metric_data_v2(input : Types::GetMetricDataV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_METRIC_DATA_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the prompt file.
      def get_prompt_file(
        instance_id : String,
        prompt_id : String
      ) : Protocol::Request
        input = Types::GetPromptFileRequest.new(instance_id: instance_id, prompt_id: prompt_id)
        get_prompt_file(input)
      end
      def get_prompt_file(input : Types::GetPromptFileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROMPT_FILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets details about a specific task template in the specified Amazon Connect instance.
      def get_task_template(
        instance_id : String,
        task_template_id : String,
        snapshot_version : String? = nil
      ) : Protocol::Request
        input = Types::GetTaskTemplateRequest.new(instance_id: instance_id, task_template_id: task_template_id, snapshot_version: snapshot_version)
        get_task_template(input)
      end
      def get_task_template(input : Types::GetTaskTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TASK_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the current traffic distribution for a given traffic distribution group.
      def get_traffic_distribution(
        id : String
      ) : Protocol::Request
        input = Types::GetTrafficDistributionRequest.new(id: id)
        get_traffic_distribution(input)
      end
      def get_traffic_distribution(input : Types::GetTrafficDistributionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TRAFFIC_DISTRIBUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Imports a claimed phone number from an external service, such as Amazon Web Services End User
      # Messaging, into an Amazon Connect instance. You can call this API only in the same Amazon Web
      # Services Region where the Amazon Connect instance was created. Call the DescribePhoneNumber API to
      # verify the status of a previous ImportPhoneNumber operation. If you plan to claim or import numbers
      # and then release numbers frequently, contact us for a service quota exception. Otherwise, it is
      # possible you will be blocked from claiming and releasing any more numbers until up to 180 days past
      # the oldest number released has expired. By default you can claim or import and then release up to
      # 200% of your maximum number of active phone numbers. If you claim or import and then release phone
      # numbers using the UI or API during a rolling 180 day cycle that exceeds 200% of your phone number
      # service level quota, you will be blocked from claiming or importing any more numbers until 180 days
      # past the oldest number released has expired. For example, if you already have 99 claimed or imported
      # numbers and a service level quota of 99 phone numbers, and in any 180 day period you release 99,
      # claim 99, and then release 99, you will have exceeded the 200% limit. At that point you are blocked
      # from claiming any more numbers until you open an Amazon Web Services Support ticket.
      def import_phone_number(
        instance_id : String,
        source_phone_number_arn : String,
        client_token : String? = nil,
        phone_number_description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::ImportPhoneNumberRequest.new(instance_id: instance_id, source_phone_number_arn: source_phone_number_arn, client_token: client_token, phone_number_description: phone_number_description, tags: tags)
        import_phone_number(input)
      end
      def import_phone_number(input : Types::ImportPhoneNumberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::IMPORT_PHONE_NUMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Imports a media asset (such as a logo) for use in a workspace.
      def import_workspace_media(
        instance_id : String,
        media_source : String,
        media_type : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::ImportWorkspaceMediaRequest.new(instance_id: instance_id, media_source: media_source, media_type: media_type, workspace_id: workspace_id)
        import_workspace_media(input)
      end
      def import_workspace_media(input : Types::ImportWorkspaceMediaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::IMPORT_WORKSPACE_MEDIA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists agent statuses.
      def list_agent_statuses(
        instance_id : String,
        agent_status_types : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAgentStatusRequest.new(instance_id: instance_id, agent_status_types: agent_status_types, max_results: max_results, next_token: next_token)
        list_agent_statuses(input)
      end
      def list_agent_statuses(input : Types::ListAgentStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AGENT_STATUSES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the association status of requested dataset ID for a given Amazon Connect instance.
      def list_analytics_data_associations(
        instance_id : String,
        data_set_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAnalyticsDataAssociationsRequest.new(instance_id: instance_id, data_set_id: data_set_id, max_results: max_results, next_token: next_token)
        list_analytics_data_associations(input)
      end
      def list_analytics_data_associations(input : Types::ListAnalyticsDataAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ANALYTICS_DATA_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the data lake datasets available to associate with for a given Amazon Connect instance.
      def list_analytics_data_lake_data_sets(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAnalyticsDataLakeDataSetsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_analytics_data_lake_data_sets(input)
      end
      def list_analytics_data_lake_data_sets(input : Types::ListAnalyticsDataLakeDataSetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ANALYTICS_DATA_LAKE_DATA_SETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Returns a paginated list
      # of all approved origins associated with the instance.
      def list_approved_origins(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApprovedOriginsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_approved_origins(input)
      end
      def list_approved_origins(input : Types::ListApprovedOriginsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPROVED_ORIGINS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides information about contact tree, a list of associated contacts with a unique identifier.
      def list_associated_contacts(
        contact_id : String,
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssociatedContactsRequest.new(contact_id: contact_id, instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_associated_contacts(input)
      end
      def list_associated_contacts(input : Types::ListAssociatedContactsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSOCIATED_CONTACTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. To request access to
      # this API, contact Amazon Web Services Support. Provides summary information about the authentication
      # profiles in a specified Amazon Connect instance.
      def list_authentication_profiles(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAuthenticationProfilesRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_authentication_profiles(input)
      end
      def list_authentication_profiles(input : Types::ListAuthenticationProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AUTHENTICATION_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. For the specified
      # version of Amazon Lex, returns a paginated list of all the Amazon Lex bots currently associated with
      # the instance. Use this API to return both Amazon Lex V1 and V2 bots.
      def list_bots(
        instance_id : String,
        lex_version : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListBotsRequest.new(instance_id: instance_id, lex_version: lex_version, max_results: max_results, next_token: next_token)
        list_bots(input)
      end
      def list_bots(input : Types::ListBotsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_BOTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides information about the child hours of operations for the specified parent hours of
      # operation. For more information about child hours of operations, see Link overrides from different
      # hours of operation in the Administrator Guide .
      def list_child_hours_of_operations(
        hours_of_operation_id : String,
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChildHoursOfOperationsRequest.new(hours_of_operation_id: hours_of_operation_id, instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_child_hours_of_operations(input)
      end
      def list_child_hours_of_operations(input : Types::ListChildHoursOfOperationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHILD_HOURS_OF_OPERATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists contact evaluations in the specified Amazon Connect instance.
      def list_contact_evaluations(
        contact_id : String,
        instance_id : String,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListContactEvaluationsRequest.new(contact_id: contact_id, instance_id: instance_id, next_token: next_token)
        list_contact_evaluations(input)
      end
      def list_contact_evaluations(input : Types::ListContactEvaluationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTACT_EVALUATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all aliases associated with a contact flow module, showing their current version mappings and
      # metadata.
      def list_contact_flow_module_aliases(
        contact_flow_module_id : String,
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListContactFlowModuleAliasesRequest.new(contact_flow_module_id: contact_flow_module_id, instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_contact_flow_module_aliases(input)
      end
      def list_contact_flow_module_aliases(input : Types::ListContactFlowModuleAliasesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTACT_FLOW_MODULE_ALIASES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a paginated list of all versions for a specific contact flow module.
      def list_contact_flow_module_versions(
        contact_flow_module_id : String,
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListContactFlowModuleVersionsRequest.new(contact_flow_module_id: contact_flow_module_id, instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_contact_flow_module_versions(input)
      end
      def list_contact_flow_module_versions(input : Types::ListContactFlowModuleVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTACT_FLOW_MODULE_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides information about the flow modules for the specified Amazon Connect instance.
      def list_contact_flow_modules(
        instance_id : String,
        contact_flow_module_state : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListContactFlowModulesRequest.new(instance_id: instance_id, contact_flow_module_state: contact_flow_module_state, max_results: max_results, next_token: next_token)
        list_contact_flow_modules(input)
      end
      def list_contact_flow_modules(input : Types::ListContactFlowModulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTACT_FLOW_MODULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns all the available versions for the specified Amazon Connect instance and flow identifier.
      def list_contact_flow_versions(
        contact_flow_id : String,
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListContactFlowVersionsRequest.new(contact_flow_id: contact_flow_id, instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_contact_flow_versions(input)
      end
      def list_contact_flow_versions(input : Types::ListContactFlowVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTACT_FLOW_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides information about the flows for the specified Amazon Connect instance. You can also create
      # and update flows using the Amazon Connect Flow language . For more information about flows, see
      # Flows in the Amazon Connect Administrator Guide .
      def list_contact_flows(
        instance_id : String,
        contact_flow_types : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListContactFlowsRequest.new(instance_id: instance_id, contact_flow_types: contact_flow_types, max_results: max_results, next_token: next_token)
        list_contact_flows(input)
      end
      def list_contact_flows(input : Types::ListContactFlowsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTACT_FLOWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. For the specified
      # referenceTypes , returns a list of references associated with the contact. References are links to
      # documents that are related to a contact, such as emails, attachments, or URLs.
      def list_contact_references(
        contact_id : String,
        instance_id : String,
        reference_types : Array(String),
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListContactReferencesRequest.new(contact_id: contact_id, instance_id: instance_id, reference_types: reference_types, next_token: next_token)
        list_contact_references(input)
      end
      def list_contact_references(input : Types::ListContactReferencesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTACT_REFERENCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns all attributes for a specified data table. A maximum of 100 attributes per data table is
      # allowed. Customers can request an increase by using Amazon Web Services Service Quotas. The response
      # can be filtered by specific attribute IDs for CloudFormation integration.
      def list_data_table_attributes(
        data_table_id : String,
        instance_id : String,
        attribute_ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataTableAttributesRequest.new(data_table_id: data_table_id, instance_id: instance_id, attribute_ids: attribute_ids, max_results: max_results, next_token: next_token)
        list_data_table_attributes(input)
      end
      def list_data_table_attributes(input : Types::ListDataTableAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_TABLE_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all primary value combinations for a given data table. Returns the unique combinations of
      # primary attribute values that identify records in the table. Up to 100 records are returned per
      # request.
      def list_data_table_primary_values(
        data_table_id : String,
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        primary_attribute_values : Array(Types::PrimaryAttributeValueFilter)? = nil,
        record_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListDataTablePrimaryValuesRequest.new(data_table_id: data_table_id, instance_id: instance_id, max_results: max_results, next_token: next_token, primary_attribute_values: primary_attribute_values, record_ids: record_ids)
        list_data_table_primary_values(input)
      end
      def list_data_table_primary_values(input : Types::ListDataTablePrimaryValuesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_TABLE_PRIMARY_VALUES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists values stored in a data table with optional filtering by record IDs or primary attribute
      # values. Returns the raw stored values along with metadata such as lock versions and modification
      # timestamps.
      def list_data_table_values(
        data_table_id : String,
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        primary_attribute_values : Array(Types::PrimaryAttributeValueFilter)? = nil,
        record_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListDataTableValuesRequest.new(data_table_id: data_table_id, instance_id: instance_id, max_results: max_results, next_token: next_token, primary_attribute_values: primary_attribute_values, record_ids: record_ids)
        list_data_table_values(input)
      end
      def list_data_table_values(input : Types::ListDataTableValuesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_TABLE_VALUES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all data tables for the specified Amazon Connect instance. Returns summary information for
      # each table including basic metadata and modification details.
      def list_data_tables(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataTablesRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_data_tables(input)
      end
      def list_data_tables(input : Types::ListDataTablesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_TABLES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the default vocabularies for the specified Amazon Connect instance.
      def list_default_vocabularies(
        instance_id : String,
        language_code : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDefaultVocabulariesRequest.new(instance_id: instance_id, language_code: language_code, max_results: max_results, next_token: next_token)
        list_default_vocabularies(input)
      end
      def list_default_vocabularies(input : Types::ListDefaultVocabulariesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEFAULT_VOCABULARIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all security profiles attached to a Q in Connect AIAgent Entity in an Amazon Connect instance.
      def list_entity_security_profiles(
        entity_arn : String,
        entity_type : String,
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEntitySecurityProfilesRequest.new(entity_arn: entity_arn, entity_type: entity_type, instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_entity_security_profiles(input)
      end
      def list_entity_security_profiles(input : Types::ListEntitySecurityProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENTITY_SECURITY_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists versions of an evaluation form in the specified Amazon Connect instance.
      def list_evaluation_form_versions(
        evaluation_form_id : String,
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEvaluationFormVersionsRequest.new(evaluation_form_id: evaluation_form_id, instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_evaluation_form_versions(input)
      end
      def list_evaluation_form_versions(input : Types::ListEvaluationFormVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EVALUATION_FORM_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists evaluation forms in the specified Amazon Connect instance.
      def list_evaluation_forms(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEvaluationFormsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_evaluation_forms(input)
      end
      def list_evaluation_forms(input : Types::ListEvaluationFormsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EVALUATION_FORMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the flow association based on the filters.
      def list_flow_associations(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_type : String? = nil
      ) : Protocol::Request
        input = Types::ListFlowAssociationsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, resource_type: resource_type)
        list_flow_associations(input)
      end
      def list_flow_associations(input : Types::ListFlowAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FLOW_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the hours of operation overrides.
      def list_hours_of_operation_overrides(
        hours_of_operation_id : String,
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListHoursOfOperationOverridesRequest.new(hours_of_operation_id: hours_of_operation_id, instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_hours_of_operation_overrides(input)
      end
      def list_hours_of_operation_overrides(input : Types::ListHoursOfOperationOverridesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_HOURS_OF_OPERATION_OVERRIDES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides information about the hours of operation for the specified Amazon Connect instance. For
      # more information about hours of operation, see Set the Hours of Operation for a Queue in the Amazon
      # Connect Administrator Guide .
      def list_hours_of_operations(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListHoursOfOperationsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_hours_of_operations(input)
      end
      def list_hours_of_operations(input : Types::ListHoursOfOperationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_HOURS_OF_OPERATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Returns a paginated list
      # of all attribute types for the given instance.
      def list_instance_attributes(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInstanceAttributesRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_instance_attributes(input)
      end
      def list_instance_attributes(input : Types::ListInstanceAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INSTANCE_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Returns a paginated list
      # of storage configs for the identified instance and resource type.
      def list_instance_storage_configs(
        instance_id : String,
        resource_type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInstanceStorageConfigsRequest.new(instance_id: instance_id, resource_type: resource_type, max_results: max_results, next_token: next_token)
        list_instance_storage_configs(input)
      end
      def list_instance_storage_configs(input : Types::ListInstanceStorageConfigsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INSTANCE_STORAGE_CONFIGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Return a list of
      # instances which are in active state, creation-in-progress state, and failed state. Instances that
      # aren't successfully created (they are in a failed state) are returned only for 24 hours after the
      # CreateInstance API was invoked.
      def list_instances(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInstancesRequest.new(max_results: max_results, next_token: next_token)
        list_instances(input)
      end
      def list_instances(input : Types::ListInstancesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INSTANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides summary information about the Amazon Web Services resource associations for the specified
      # Amazon Connect instance.
      def list_integration_associations(
        instance_id : String,
        integration_arn : String? = nil,
        integration_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListIntegrationAssociationsRequest.new(instance_id: instance_id, integration_arn: integration_arn, integration_type: integration_type, max_results: max_results, next_token: next_token)
        list_integration_associations(input)
      end
      def list_integration_associations(input : Types::ListIntegrationAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INTEGRATION_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Returns a paginated list
      # of all Lambda functions that display in the dropdown options in the relevant flow blocks.
      def list_lambda_functions(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLambdaFunctionsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_lambda_functions(input)
      end
      def list_lambda_functions(input : Types::ListLambdaFunctionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LAMBDA_FUNCTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Returns a paginated list
      # of all the Amazon Lex V1 bots currently associated with the instance. To return both Amazon Lex V1
      # and V2 bots, use the ListBots API.
      def list_lex_bots(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLexBotsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_lex_bots(input)
      end
      def list_lex_bots(input : Types::ListLexBotsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LEX_BOTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides information about the phone numbers for the specified Amazon Connect instance. For more
      # information about phone numbers, see Set Up Phone Numbers for Your Contact Center in the Amazon
      # Connect Administrator Guide . We recommend using ListPhoneNumbersV2 to return phone number types.
      # ListPhoneNumbers doesn't support number types UIFN , SHARED , THIRD_PARTY_TF , and THIRD_PARTY_DID .
      # While it returns numbers of those types, it incorrectly lists them as TOLL_FREE or DID . The phone
      # number Arn value that is returned from each of the items in the PhoneNumberSummaryList cannot be
      # used to tag phone number resources. It will fail with a ResourceNotFoundException . Instead, use the
      # ListPhoneNumbersV2 API. It returns the new phone number ARN that can be used to tag phone number
      # resources.
      def list_phone_numbers(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        phone_number_country_codes : Array(String)? = nil,
        phone_number_types : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListPhoneNumbersRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, phone_number_country_codes: phone_number_country_codes, phone_number_types: phone_number_types)
        list_phone_numbers(input)
      end
      def list_phone_numbers(input : Types::ListPhoneNumbersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PHONE_NUMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists phone numbers claimed to your Amazon Connect instance or traffic distribution group. If the
      # provided TargetArn is a traffic distribution group, you can call this API in both Amazon Web
      # Services Regions associated with traffic distribution group. For more information about phone
      # numbers, see Set Up Phone Numbers for Your Contact Center in the Amazon Connect Administrator Guide
      # . When given an instance ARN, ListPhoneNumbersV2 returns only the phone numbers claimed to the
      # instance. When given a traffic distribution group ARN ListPhoneNumbersV2 returns only the phone
      # numbers claimed to the traffic distribution group.
      def list_phone_numbers_v2(
        instance_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        phone_number_country_codes : Array(String)? = nil,
        phone_number_prefix : String? = nil,
        phone_number_types : Array(String)? = nil,
        target_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListPhoneNumbersV2Request.new(instance_id: instance_id, max_results: max_results, next_token: next_token, phone_number_country_codes: phone_number_country_codes, phone_number_prefix: phone_number_prefix, phone_number_types: phone_number_types, target_arn: target_arn)
        list_phone_numbers_v2(input)
      end
      def list_phone_numbers_v2(input : Types::ListPhoneNumbersV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PHONE_NUMBERS_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists predefined attributes for the specified Amazon Connect instance. A predefined attribute is
      # made up of a name and a value. You can use predefined attributes for: Routing proficiency (for
      # example, agent certification) that has predefined values (for example, a list of possible
      # certifications). For more information, see Create predefined attributes for routing contacts to
      # agents . Contact information that varies between transfers or conferences, such as the name of the
      # business unit handling the contact. For more information, see Use contact segment attributes . For
      # the predefined attributes per instance quota, see Amazon Connect quotas . Endpoints : See Amazon
      # Connect endpoints and quotas .
      def list_predefined_attributes(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPredefinedAttributesRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_predefined_attributes(input)
      end
      def list_predefined_attributes(input : Types::ListPredefinedAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PREDEFINED_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides information about the prompts for the specified Amazon Connect instance.
      def list_prompts(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPromptsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_prompts(input)
      end
      def list_prompts(input : Types::ListPromptsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROMPTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the quick connects associated with a queue.
      def list_queue_quick_connects(
        instance_id : String,
        queue_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListQueueQuickConnectsRequest.new(instance_id: instance_id, queue_id: queue_id, max_results: max_results, next_token: next_token)
        list_queue_quick_connects(input)
      end
      def list_queue_quick_connects(input : Types::ListQueueQuickConnectsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_QUEUE_QUICK_CONNECTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides information about the queues for the specified Amazon Connect instance. If you do not
      # specify a QueueTypes parameter, both standard and agent queues are returned. This might cause an
      # unexpected truncation of results if you have more than 1000 agents and you limit the number of
      # results of the API call in code. For more information about queues, see Queues: Standard and Agent
      # in the Amazon Connect Administrator Guide .
      def list_queues(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        queue_types : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListQueuesRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, queue_types: queue_types)
        list_queues(input)
      end
      def list_queues(input : Types::ListQueuesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_QUEUES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides information about the quick connects for the specified Amazon Connect instance.
      def list_quick_connects(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        quick_connect_types : Array(String)? = nil
      ) : Protocol::Request
        input = Types::ListQuickConnectsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, quick_connect_types: quick_connect_types)
        list_quick_connects(input)
      end
      def list_quick_connects(input : Types::ListQuickConnectsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_QUICK_CONNECTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides a list of analysis segments for a real-time chat analysis session. This API supports CHAT
      # channels only. This API does not support VOICE. If you attempt to use it for VOICE, an
      # InvalidRequestException occurs.
      def list_realtime_contact_analysis_segments_v2(
        contact_id : String,
        instance_id : String,
        output_type : String,
        segment_types : Array(String),
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRealtimeContactAnalysisSegmentsV2Request.new(contact_id: contact_id, instance_id: instance_id, output_type: output_type, segment_types: segment_types, max_results: max_results, next_token: next_token)
        list_realtime_contact_analysis_segments_v2(input)
      end
      def list_realtime_contact_analysis_segments_v2(input : Types::ListRealtimeContactAnalysisSegmentsV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REALTIME_CONTACT_ANALYSIS_SEGMENTS_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the manual assignment queues associated with a routing profile. Use cases Following are common
      # uses cases for this API: This API returns list of queues where contacts can be manually assigned or
      # picked by an agent who has access to the Worklist app. The user can additionally filter on queues,
      # if they have access to those queues (otherwise a invalid request exception will be thrown). For
      # information about how manual contact assignment works in the agent workspace, see the Access the
      # Worklist app in the Amazon Connect agent workspace in the Amazon Connect Administrator Guide .
      # Important things to know This API only returns the manual assignment queues associated with a
      # routing profile. Use the ListRoutingProfileQueues API to list the auto assignment queues for the
      # routing profile. Endpoints : See Amazon Connect endpoints and quotas .
      def list_routing_profile_manual_assignment_queues(
        instance_id : String,
        routing_profile_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRoutingProfileManualAssignmentQueuesRequest.new(instance_id: instance_id, routing_profile_id: routing_profile_id, max_results: max_results, next_token: next_token)
        list_routing_profile_manual_assignment_queues(input)
      end
      def list_routing_profile_manual_assignment_queues(input : Types::ListRoutingProfileManualAssignmentQueuesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ROUTING_PROFILE_MANUAL_ASSIGNMENT_QUEUES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the queues associated with a routing profile.
      def list_routing_profile_queues(
        instance_id : String,
        routing_profile_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRoutingProfileQueuesRequest.new(instance_id: instance_id, routing_profile_id: routing_profile_id, max_results: max_results, next_token: next_token)
        list_routing_profile_queues(input)
      end
      def list_routing_profile_queues(input : Types::ListRoutingProfileQueuesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ROUTING_PROFILE_QUEUES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides summary information about the routing profiles for the specified Amazon Connect instance.
      # For more information about routing profiles, see Routing Profiles and Create a Routing Profile in
      # the Amazon Connect Administrator Guide .
      def list_routing_profiles(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRoutingProfilesRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_routing_profiles(input)
      end
      def list_routing_profiles(input : Types::ListRoutingProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ROUTING_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all rules for the specified Amazon Connect instance.
      def list_rules(
        instance_id : String,
        event_source_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        publish_status : String? = nil
      ) : Protocol::Request
        input = Types::ListRulesRequest.new(instance_id: instance_id, event_source_name: event_source_name, max_results: max_results, next_token: next_token, publish_status: publish_status)
        list_rules(input)
      end
      def list_rules(input : Types::ListRulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Returns a paginated list
      # of all security keys associated with the instance.
      def list_security_keys(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSecurityKeysRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_security_keys(input)
      end
      def list_security_keys(input : Types::ListSecurityKeysRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SECURITY_KEYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of third-party applications or MCP Servers in a specific security profile.
      def list_security_profile_applications(
        instance_id : String,
        security_profile_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSecurityProfileApplicationsRequest.new(instance_id: instance_id, security_profile_id: security_profile_id, max_results: max_results, next_token: next_token)
        list_security_profile_applications(input)
      end
      def list_security_profile_applications(input : Types::ListSecurityProfileApplicationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SECURITY_PROFILE_APPLICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A list of Flow Modules an AI Agent can invoke as a tool
      def list_security_profile_flow_modules(
        instance_id : String,
        security_profile_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSecurityProfileFlowModulesRequest.new(instance_id: instance_id, security_profile_id: security_profile_id, max_results: max_results, next_token: next_token)
        list_security_profile_flow_modules(input)
      end
      def list_security_profile_flow_modules(input : Types::ListSecurityProfileFlowModulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SECURITY_PROFILE_FLOW_MODULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the permissions granted to a security profile. For information about security profiles, see
      # Security Profiles in the Amazon Connect Administrator Guide . For a mapping of the API name and user
      # interface name of the security profile permissions, see List of security profile permissions .
      def list_security_profile_permissions(
        instance_id : String,
        security_profile_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSecurityProfilePermissionsRequest.new(instance_id: instance_id, security_profile_id: security_profile_id, max_results: max_results, next_token: next_token)
        list_security_profile_permissions(input)
      end
      def list_security_profile_permissions(input : Types::ListSecurityProfilePermissionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SECURITY_PROFILE_PERMISSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides summary information about the security profiles for the specified Amazon Connect instance.
      # For more information about security profiles, see Security Profiles in the Amazon Connect
      # Administrator Guide . For a mapping of the API name and user interface name of the security profile
      # permissions, see List of security profile permissions .
      def list_security_profiles(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSecurityProfilesRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_security_profiles(input)
      end
      def list_security_profiles(input : Types::ListSecurityProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SECURITY_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags for the specified resource. For sample policies that use tags, see Amazon Connect
      # Identity-Based Policy Examples in the Amazon Connect Administrator Guide .
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

      # Lists task templates for the specified Amazon Connect instance.
      def list_task_templates(
        instance_id : String,
        max_results : Int32? = nil,
        name : String? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListTaskTemplatesRequest.new(instance_id: instance_id, max_results: max_results, name: name, next_token: next_token, status: status)
        list_task_templates(input)
      end
      def list_task_templates(input : Types::ListTaskTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TASK_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists traffic distribution group users.
      def list_traffic_distribution_group_users(
        traffic_distribution_group_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTrafficDistributionGroupUsersRequest.new(traffic_distribution_group_id: traffic_distribution_group_id, max_results: max_results, next_token: next_token)
        list_traffic_distribution_group_users(input)
      end
      def list_traffic_distribution_group_users(input : Types::ListTrafficDistributionGroupUsersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TRAFFIC_DISTRIBUTION_GROUP_USERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists traffic distribution groups.
      def list_traffic_distribution_groups(
        instance_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTrafficDistributionGroupsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_traffic_distribution_groups(input)
      end
      def list_traffic_distribution_groups(input : Types::ListTrafficDistributionGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TRAFFIC_DISTRIBUTION_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the use cases for the integration association.
      def list_use_cases(
        instance_id : String,
        integration_association_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListUseCasesRequest.new(instance_id: instance_id, integration_association_id: integration_association_id, max_results: max_results, next_token: next_token)
        list_use_cases(input)
      end
      def list_use_cases(input : Types::ListUseCasesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_USE_CASES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides summary information about the hierarchy groups for the specified Amazon Connect instance.
      # For more information about agent hierarchies, see Set Up Agent Hierarchies in the Amazon Connect
      # Administrator Guide .
      def list_user_hierarchy_groups(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListUserHierarchyGroupsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_user_hierarchy_groups(input)
      end
      def list_user_hierarchy_groups(input : Types::ListUserHierarchyGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_USER_HIERARCHY_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists proficiencies associated with a user.
      def list_user_proficiencies(
        instance_id : String,
        user_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListUserProficienciesRequest.new(instance_id: instance_id, user_id: user_id, max_results: max_results, next_token: next_token)
        list_user_proficiencies(input)
      end
      def list_user_proficiencies(input : Types::ListUserProficienciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_USER_PROFICIENCIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides summary information about the users for the specified Amazon Connect instance.
      def list_users(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListUsersRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_users(input)
      end
      def list_users(input : Types::ListUsersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_USERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns all the available versions for the specified Amazon Connect instance and view identifier.
      # Results will be sorted from highest to lowest.
      def list_view_versions(
        instance_id : String,
        view_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListViewVersionsRequest.new(instance_id: instance_id, view_id: view_id, max_results: max_results, next_token: next_token)
        list_view_versions(input)
      end
      def list_view_versions(input : Types::ListViewVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VIEW_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns views in the given instance. Results are sorted primarily by type, and secondarily by name.
      def list_views(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::ListViewsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, type: type)
        list_views(input)
      end
      def list_views(input : Types::ListViewsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VIEWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists media assets (such as logos) associated with a workspace.
      def list_workspace_media(
        instance_id : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::ListWorkspaceMediaRequest.new(instance_id: instance_id, workspace_id: workspace_id)
        list_workspace_media(input)
      end
      def list_workspace_media(input : Types::ListWorkspaceMediaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKSPACE_MEDIA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the page configurations in a workspace, including the views assigned to each page.
      def list_workspace_pages(
        instance_id : String,
        workspace_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkspacePagesRequest.new(instance_id: instance_id, workspace_id: workspace_id, max_results: max_results, next_token: next_token)
        list_workspace_pages(input)
      end
      def list_workspace_pages(input : Types::ListWorkspacePagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKSPACE_PAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the workspaces in an Amazon Connect instance.
      def list_workspaces(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkspacesRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token)
        list_workspaces(input)
      end
      def list_workspaces(input : Types::ListWorkspacesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKSPACES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates silent monitoring of a contact. The Contact Control Panel (CCP) of the user specified by
      # userId will be set to silent monitoring mode on the contact.
      def monitor_contact(
        contact_id : String,
        instance_id : String,
        user_id : String,
        allowed_monitor_capabilities : Array(String)? = nil,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::MonitorContactRequest.new(contact_id: contact_id, instance_id: instance_id, user_id: user_id, allowed_monitor_capabilities: allowed_monitor_capabilities, client_token: client_token)
        monitor_contact(input)
      end
      def monitor_contact(input : Types::MonitorContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::MONITOR_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows pausing an ongoing task contact.
      def pause_contact(
        contact_id : String,
        instance_id : String,
        contact_flow_id : String? = nil
      ) : Protocol::Request
        input = Types::PauseContactRequest.new(contact_id: contact_id, instance_id: instance_id, contact_flow_id: contact_flow_id)
        pause_contact(input)
      end
      def pause_contact(input : Types::PauseContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PAUSE_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes the current status of a user or agent in Amazon Connect. If the agent is currently handling
      # a contact, this sets the agent's next status. For more information, see Agent status and Set your
      # next status in the Amazon Connect Administrator Guide .
      def put_user_status(
        agent_status_id : String,
        instance_id : String,
        user_id : String
      ) : Protocol::Request
        input = Types::PutUserStatusRequest.new(agent_status_id: agent_status_id, instance_id: instance_id, user_id: user_id)
        put_user_status(input)
      end
      def put_user_status(input : Types::PutUserStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_USER_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Releases a phone number previously claimed to an Amazon Connect instance or traffic distribution
      # group. You can call this API only in the Amazon Web Services Region where the number was claimed. To
      # release phone numbers from a traffic distribution group, use the ReleasePhoneNumber API, not the
      # Amazon Connect admin website. After releasing a phone number, the phone number enters into a
      # cooldown period for up to 180 days. It cannot be searched for or claimed again until the period has
      # ended. If you accidentally release a phone number, contact Amazon Web Services Support. If you plan
      # to claim and release numbers frequently, contact us for a service quota exception. Otherwise, it is
      # possible you will be blocked from claiming and releasing any more numbers until up to 180 days past
      # the oldest number released has expired. By default you can claim and release up to 200% of your
      # maximum number of active phone numbers. If you claim and release phone numbers using the UI or API
      # during a rolling 180 day cycle that exceeds 200% of your phone number service level quota, you will
      # be blocked from claiming any more numbers until 180 days past the oldest number released has
      # expired. For example, if you already have 99 claimed numbers and a service level quota of 99 phone
      # numbers, and in any 180 day period you release 99, claim 99, and then release 99, you will have
      # exceeded the 200% limit. At that point you are blocked from claiming any more numbers until you open
      # an Amazon Web Services support ticket.
      def release_phone_number(
        phone_number_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::ReleasePhoneNumberRequest.new(phone_number_id: phone_number_id, client_token: client_token)
        release_phone_number(input)
      end
      def release_phone_number(input : Types::ReleasePhoneNumberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RELEASE_PHONE_NUMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Replicates an Amazon Connect instance in the specified Amazon Web Services Region and copies
      # configuration information for Amazon Connect resources across Amazon Web Services Regions. For more
      # information about replicating an Amazon Connect instance, see Create a replica of your existing
      # Amazon Connect instance in the Amazon Connect Administrator Guide .
      def replicate_instance(
        instance_id : String,
        replica_alias : String,
        replica_region : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::ReplicateInstanceRequest.new(instance_id: instance_id, replica_alias: replica_alias, replica_region: replica_region, client_token: client_token)
        replicate_instance(input)
      end
      def replicate_instance(input : Types::ReplicateInstanceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REPLICATE_INSTANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows resuming a task contact in a paused state.
      def resume_contact(
        contact_id : String,
        instance_id : String,
        contact_flow_id : String? = nil
      ) : Protocol::Request
        input = Types::ResumeContactRequest.new(contact_id: contact_id, instance_id: instance_id, contact_flow_id: contact_flow_id)
        resume_contact(input)
      end
      def resume_contact(input : Types::ResumeContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESUME_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # When a contact is being recorded, and the recording has been suspended using
      # SuspendContactRecording, this API resumes recording whatever recording is selected in the flow
      # configuration: call, screen, or both. If only call recording or only screen recording is enabled,
      # then it would resume. Voice and screen recordings are supported.
      def resume_contact_recording(
        contact_id : String,
        initial_contact_id : String,
        instance_id : String,
        contact_recording_type : String? = nil
      ) : Protocol::Request
        input = Types::ResumeContactRecordingRequest.new(contact_id: contact_id, initial_contact_id: initial_contact_id, instance_id: instance_id, contact_recording_type: contact_recording_type)
        resume_contact_recording(input)
      end
      def resume_contact_recording(input : Types::ResumeContactRecordingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESUME_CONTACT_RECORDING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches AgentStatuses in an Amazon Connect instance, with optional filtering.
      def search_agent_statuses(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::AgentStatusSearchCriteria? = nil,
        search_filter : Types::AgentStatusSearchFilter? = nil
      ) : Protocol::Request
        input = Types::SearchAgentStatusesRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria, search_filter: search_filter)
        search_agent_statuses(input)
      end
      def search_agent_statuses(input : Types::SearchAgentStatusesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_AGENT_STATUSES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for available phone numbers that you can claim to your Amazon Connect instance or traffic
      # distribution group. If the provided TargetArn is a traffic distribution group, you can call this API
      # in both Amazon Web Services Regions associated with the traffic distribution group.
      def search_available_phone_numbers(
        phone_number_country_code : String,
        phone_number_type : String,
        instance_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        phone_number_prefix : String? = nil,
        target_arn : String? = nil
      ) : Protocol::Request
        input = Types::SearchAvailablePhoneNumbersRequest.new(phone_number_country_code: phone_number_country_code, phone_number_type: phone_number_type, instance_id: instance_id, max_results: max_results, next_token: next_token, phone_number_prefix: phone_number_prefix, target_arn: target_arn)
        search_available_phone_numbers(input)
      end
      def search_available_phone_numbers(input : Types::SearchAvailablePhoneNumbersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_AVAILABLE_PHONE_NUMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches contact evaluations in an Amazon Connect instance, with optional filtering. Use cases
      # Following are common uses cases for this API: Find contact evaluations by using specific search
      # criteria. Find contact evaluations that are tagged with a specific set of tags. Important things to
      # know A Search operation, unlike a List operation, takes time to index changes to resource (create,
      # update or delete). If you don't see updated information for recently changed contact evaluations,
      # try calling the API again in a few seconds. Contact Evaluations may not be fully backfilled with
      # historical data in all regions yet, however all recently created Contact Evaluations should be
      # available for search. Endpoints : See Amazon Connect endpoints and quotas .
      def search_contact_evaluations(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::EvaluationSearchCriteria? = nil,
        search_filter : Types::EvaluationSearchFilter? = nil
      ) : Protocol::Request
        input = Types::SearchContactEvaluationsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria, search_filter: search_filter)
        search_contact_evaluations(input)
      end
      def search_contact_evaluations(input : Types::SearchContactEvaluationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_CONTACT_EVALUATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches the flow modules in an Amazon Connect instance, with optional filtering.
      def search_contact_flow_modules(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::ContactFlowModuleSearchCriteria? = nil,
        search_filter : Types::ContactFlowModuleSearchFilter? = nil
      ) : Protocol::Request
        input = Types::SearchContactFlowModulesRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria, search_filter: search_filter)
        search_contact_flow_modules(input)
      end
      def search_contact_flow_modules(input : Types::SearchContactFlowModulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_CONTACT_FLOW_MODULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches the flows in an Amazon Connect instance, with optional filtering.
      def search_contact_flows(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::ContactFlowSearchCriteria? = nil,
        search_filter : Types::ContactFlowSearchFilter? = nil
      ) : Protocol::Request
        input = Types::SearchContactFlowsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria, search_filter: search_filter)
        search_contact_flows(input)
      end
      def search_contact_flows(input : Types::SearchContactFlowsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_CONTACT_FLOWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches contacts in an Amazon Connect instance.
      def search_contacts(
        instance_id : String,
        time_range : Types::SearchContactsTimeRange,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::SearchCriteria? = nil,
        sort : Types::Sort? = nil
      ) : Protocol::Request
        input = Types::SearchContactsRequest.new(instance_id: instance_id, time_range: time_range, max_results: max_results, next_token: next_token, search_criteria: search_criteria, sort: sort)
        search_contacts(input)
      end
      def search_contacts(input : Types::SearchContactsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_CONTACTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for data tables based on the table's ID, name, and description. In the future, this
      # operation can support searching on attribute names and possibly primary values. Follows other search
      # operations closely and supports both search criteria and filters.
      def search_data_tables(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::DataTableSearchCriteria? = nil,
        search_filter : Types::DataTableSearchFilter? = nil
      ) : Protocol::Request
        input = Types::SearchDataTablesRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria, search_filter: search_filter)
        search_data_tables(input)
      end
      def search_data_tables(input : Types::SearchDataTablesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_DATA_TABLES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches email address in an instance, with optional filtering.
      def search_email_addresses(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::EmailAddressSearchCriteria? = nil,
        search_filter : Types::EmailAddressSearchFilter? = nil
      ) : Protocol::Request
        input = Types::SearchEmailAddressesRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria, search_filter: search_filter)
        search_email_addresses(input)
      end
      def search_email_addresses(input : Types::SearchEmailAddressesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_EMAIL_ADDRESSES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches evaluation forms in an Amazon Connect instance, with optional filtering. Use cases
      # Following are common uses cases for this API: List all evaluation forms in an instance. Find all
      # evaluation forms that meet specific criteria, such as Title, Description, Status, and more. Find all
      # evaluation forms that are tagged with a specific set of tags. Important things to know A Search
      # operation, unlike a List operation, takes time to index changes to resource (create, update or
      # delete). If you don't see updated information for recently changed contact evaluations, try calling
      # the API again in a few seconds. Endpoints : See Amazon Connect endpoints and quotas .
      def search_evaluation_forms(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::EvaluationFormSearchCriteria? = nil,
        search_filter : Types::EvaluationFormSearchFilter? = nil
      ) : Protocol::Request
        input = Types::SearchEvaluationFormsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria, search_filter: search_filter)
        search_evaluation_forms(input)
      end
      def search_evaluation_forms(input : Types::SearchEvaluationFormsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_EVALUATION_FORMS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches the hours of operation overrides.
      def search_hours_of_operation_overrides(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::HoursOfOperationOverrideSearchCriteria? = nil,
        search_filter : Types::HoursOfOperationSearchFilter? = nil
      ) : Protocol::Request
        input = Types::SearchHoursOfOperationOverridesRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria, search_filter: search_filter)
        search_hours_of_operation_overrides(input)
      end
      def search_hours_of_operation_overrides(input : Types::SearchHoursOfOperationOverridesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_HOURS_OF_OPERATION_OVERRIDES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches the hours of operation in an Amazon Connect instance, with optional filtering.
      def search_hours_of_operations(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::HoursOfOperationSearchCriteria? = nil,
        search_filter : Types::HoursOfOperationSearchFilter? = nil
      ) : Protocol::Request
        input = Types::SearchHoursOfOperationsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria, search_filter: search_filter)
        search_hours_of_operations(input)
      end
      def search_hours_of_operations(input : Types::SearchHoursOfOperationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_HOURS_OF_OPERATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches predefined attributes that meet certain criteria. A predefined attribute is made up of a
      # name and a value. You can use predefined attributes for: Routing proficiency (for example, agent
      # certification) that has predefined values (for example, a list of possible certifications). For more
      # information, see Create predefined attributes for routing contacts to agents . Contact information
      # that varies between transfers or conferences, such as the name of the business unit handling the
      # contact. For more information, see Use contact segment attributes . For the predefined attributes
      # per instance quota, see Amazon Connect quotas . Endpoints : See Amazon Connect endpoints and quotas
      # .
      def search_predefined_attributes(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::PredefinedAttributeSearchCriteria? = nil
      ) : Protocol::Request
        input = Types::SearchPredefinedAttributesRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria)
        search_predefined_attributes(input)
      end
      def search_predefined_attributes(input : Types::SearchPredefinedAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_PREDEFINED_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches prompts in an Amazon Connect instance, with optional filtering.
      def search_prompts(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::PromptSearchCriteria? = nil,
        search_filter : Types::PromptSearchFilter? = nil
      ) : Protocol::Request
        input = Types::SearchPromptsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria, search_filter: search_filter)
        search_prompts(input)
      end
      def search_prompts(input : Types::SearchPromptsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_PROMPTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches queues in an Amazon Connect instance, with optional filtering.
      def search_queues(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::QueueSearchCriteria? = nil,
        search_filter : Types::QueueSearchFilter? = nil
      ) : Protocol::Request
        input = Types::SearchQueuesRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria, search_filter: search_filter)
        search_queues(input)
      end
      def search_queues(input : Types::SearchQueuesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_QUEUES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches quick connects in an Amazon Connect instance, with optional filtering.
      def search_quick_connects(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::QuickConnectSearchCriteria? = nil,
        search_filter : Types::QuickConnectSearchFilter? = nil
      ) : Protocol::Request
        input = Types::SearchQuickConnectsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria, search_filter: search_filter)
        search_quick_connects(input)
      end
      def search_quick_connects(input : Types::SearchQuickConnectsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_QUICK_CONNECTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches tags used in an Amazon Connect instance using optional search criteria.
      def search_resource_tags(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_types : Array(String)? = nil,
        search_criteria : Types::ResourceTagsSearchCriteria? = nil
      ) : Protocol::Request
        input = Types::SearchResourceTagsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, resource_types: resource_types, search_criteria: search_criteria)
        search_resource_tags(input)
      end
      def search_resource_tags(input : Types::SearchResourceTagsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_RESOURCE_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches routing profiles in an Amazon Connect instance, with optional filtering.
      # SearchRoutingProfiles does not populate LastModifiedRegion, LastModifiedTime,
      # MediaConcurrencies.CrossChannelBehavior, and AgentAvailabilityTimer in its response, but
      # DescribeRoutingProfile does.
      def search_routing_profiles(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::RoutingProfileSearchCriteria? = nil,
        search_filter : Types::RoutingProfileSearchFilter? = nil
      ) : Protocol::Request
        input = Types::SearchRoutingProfilesRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria, search_filter: search_filter)
        search_routing_profiles(input)
      end
      def search_routing_profiles(input : Types::SearchRoutingProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_ROUTING_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches security profiles in an Amazon Connect instance, with optional filtering. For information
      # about security profiles, see Security Profiles in the Amazon Connect Administrator Guide . For a
      # mapping of the API name and user interface name of the security profile permissions, see List of
      # security profile permissions .
      def search_security_profiles(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::SecurityProfileSearchCriteria? = nil,
        search_filter : Types::SecurityProfilesSearchFilter? = nil
      ) : Protocol::Request
        input = Types::SearchSecurityProfilesRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria, search_filter: search_filter)
        search_security_profiles(input)
      end
      def search_security_profiles(input : Types::SearchSecurityProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_SECURITY_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches UserHierarchyGroups in an Amazon Connect instance, with optional filtering. The
      # UserHierarchyGroup with "LevelId": "0" is the foundation for building levels on top of an instance.
      # It is not user-definable, nor is it visible in the UI.
      def search_user_hierarchy_groups(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::UserHierarchyGroupSearchCriteria? = nil,
        search_filter : Types::UserHierarchyGroupSearchFilter? = nil
      ) : Protocol::Request
        input = Types::SearchUserHierarchyGroupsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria, search_filter: search_filter)
        search_user_hierarchy_groups(input)
      end
      def search_user_hierarchy_groups(input : Types::SearchUserHierarchyGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_USER_HIERARCHY_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches users in an Amazon Connect instance, with optional filtering. AfterContactWorkTimeLimit is
      # returned in milliseconds.
      def search_users(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::UserSearchCriteria? = nil,
        search_filter : Types::UserSearchFilter? = nil
      ) : Protocol::Request
        input = Types::SearchUsersRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria, search_filter: search_filter)
        search_users(input)
      end
      def search_users(input : Types::SearchUsersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_USERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches views based on name, description, or tags.
      def search_views(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::ViewSearchCriteria? = nil,
        search_filter : Types::ViewSearchFilter? = nil
      ) : Protocol::Request
        input = Types::SearchViewsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria, search_filter: search_filter)
        search_views(input)
      end
      def search_views(input : Types::SearchViewsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_VIEWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for vocabularies within a specific Amazon Connect instance using State , NameStartsWith ,
      # and LanguageCode .
      def search_vocabularies(
        instance_id : String,
        language_code : String? = nil,
        max_results : Int32? = nil,
        name_starts_with : String? = nil,
        next_token : String? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::SearchVocabulariesRequest.new(instance_id: instance_id, language_code: language_code, max_results: max_results, name_starts_with: name_starts_with, next_token: next_token, state: state)
        search_vocabularies(input)
      end
      def search_vocabularies(input : Types::SearchVocabulariesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_VOCABULARIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches for workspace associations with users or routing profiles based on various criteria.
      def search_workspace_associations(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::WorkspaceAssociationSearchCriteria? = nil,
        search_filter : Types::WorkspaceAssociationSearchFilter? = nil
      ) : Protocol::Request
        input = Types::SearchWorkspaceAssociationsRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria, search_filter: search_filter)
        search_workspace_associations(input)
      end
      def search_workspace_associations(input : Types::SearchWorkspaceAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_WORKSPACE_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Searches workspaces based on name, description, visibility, or tags.
      def search_workspaces(
        instance_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        search_criteria : Types::WorkspaceSearchCriteria? = nil,
        search_filter : Types::WorkspaceSearchFilter? = nil
      ) : Protocol::Request
        input = Types::SearchWorkspacesRequest.new(instance_id: instance_id, max_results: max_results, next_token: next_token, search_criteria: search_criteria, search_filter: search_filter)
        search_workspaces(input)
      end
      def search_workspaces(input : Types::SearchWorkspacesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_WORKSPACES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Processes chat integration events from Amazon Web Services or external integrations to Amazon
      # Connect. A chat integration event includes: SourceId, DestinationId, and Subtype: a set of
      # identifiers, uniquely representing a chat ChatEvent: details of the chat action to perform such as
      # sending a message, event, or disconnecting from a chat When a chat integration event is sent with
      # chat identifiers that do not map to an active chat contact, a new chat contact is also created
      # before handling chat action. Access to this API is currently restricted to Amazon Web Services End
      # User Messaging for supporting SMS integration.
      def send_chat_integration_event(
        destination_id : String,
        event : Types::ChatEvent,
        source_id : String,
        new_session_details : Types::NewSessionDetails? = nil,
        subtype : String? = nil
      ) : Protocol::Request
        input = Types::SendChatIntegrationEventRequest.new(destination_id: destination_id, event: event, source_id: source_id, new_session_details: new_session_details, subtype: subtype)
        send_chat_integration_event(input)
      end
      def send_chat_integration_event(input : Types::SendChatIntegrationEventRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_CHAT_INTEGRATION_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Send outbound email for outbound campaigns. For more information about outbound campaigns, see Set
      # up Amazon Connect outbound campaigns . Only the Amazon Connect outbound campaigns service principal
      # is allowed to assume a role in your account and call this API.
      def send_outbound_email(
        destination_email_address : Types::EmailAddressInfo,
        email_message : Types::OutboundEmailContent,
        from_email_address : Types::EmailAddressInfo,
        instance_id : String,
        traffic_type : String,
        additional_recipients : Types::OutboundAdditionalRecipients? = nil,
        client_token : String? = nil,
        source_campaign : Types::SourceCampaign? = nil
      ) : Protocol::Request
        input = Types::SendOutboundEmailRequest.new(destination_email_address: destination_email_address, email_message: email_message, from_email_address: from_email_address, instance_id: instance_id, traffic_type: traffic_type, additional_recipients: additional_recipients, client_token: client_token, source_campaign: source_campaign)
        send_outbound_email(input)
      end
      def send_outbound_email(input : Types::SendOutboundEmailRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_OUTBOUND_EMAIL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides a pre-signed Amazon S3 URL in response for uploading your content. You may only use this
      # API to upload attachments to an Amazon Connect Case or Amazon Connect Email .
      def start_attached_file_upload(
        associated_resource_arn : String,
        file_name : String,
        file_size_in_bytes : Int64,
        file_use_case_type : String,
        instance_id : String,
        client_token : String? = nil,
        created_by : Types::CreatedByInfo? = nil,
        tags : Hash(String, String)? = nil,
        url_expiry_in_seconds : Int32? = nil
      ) : Protocol::Request
        input = Types::StartAttachedFileUploadRequest.new(associated_resource_arn: associated_resource_arn, file_name: file_name, file_size_in_bytes: file_size_in_bytes, file_use_case_type: file_use_case_type, instance_id: instance_id, client_token: client_token, created_by: created_by, tags: tags, url_expiry_in_seconds: url_expiry_in_seconds)
        start_attached_file_upload(input)
      end
      def start_attached_file_upload(input : Types::StartAttachedFileUploadRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ATTACHED_FILE_UPLOAD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates a flow to start a new chat for the customer. Response of this API provides a token
      # required to obtain credentials from the CreateParticipantConnection API in the Amazon Connect
      # Participant Service. When a new chat contact is successfully created, clients must subscribe to the
      # participant’s connection for the created chat within 5 minutes. This is achieved by invoking
      # CreateParticipantConnection with WEBSOCKET and CONNECTION_CREDENTIALS. A 429 error occurs in the
      # following situations: API rate limit is exceeded. API TPS throttling returns a TooManyRequests
      # exception. The quota for concurrent active chats is exceeded. Active chat throttling returns a
      # LimitExceededException . If you use the ChatDurationInMinutes parameter and receive a 400 error,
      # your account may not support the ability to configure custom chat durations. For more information,
      # contact Amazon Web Services Support. For more information about chat, see the following topics in
      # the Amazon Connect Administrator Guide : Concepts: Web and mobile messaging capabilities in Amazon
      # Connect Amazon Connect Chat security best practices
      def start_chat_contact(
        contact_flow_id : String,
        instance_id : String,
        participant_details : Types::ParticipantDetails,
        attributes : Hash(String, String)? = nil,
        chat_duration_in_minutes : Int32? = nil,
        client_token : String? = nil,
        customer_id : String? = nil,
        disconnect_on_customer_exit : Array(String)? = nil,
        initial_message : Types::ChatMessage? = nil,
        participant_configuration : Types::ParticipantConfiguration? = nil,
        persistent_chat : Types::PersistentChat? = nil,
        related_contact_id : String? = nil,
        segment_attributes : Hash(String, Types::SegmentAttributeValue)? = nil,
        supported_messaging_content_types : Array(String)? = nil
      ) : Protocol::Request
        input = Types::StartChatContactRequest.new(contact_flow_id: contact_flow_id, instance_id: instance_id, participant_details: participant_details, attributes: attributes, chat_duration_in_minutes: chat_duration_in_minutes, client_token: client_token, customer_id: customer_id, disconnect_on_customer_exit: disconnect_on_customer_exit, initial_message: initial_message, participant_configuration: participant_configuration, persistent_chat: persistent_chat, related_contact_id: related_contact_id, segment_attributes: segment_attributes, supported_messaging_content_types: supported_messaging_content_types)
        start_chat_contact(input)
      end
      def start_chat_contact(input : Types::StartChatContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CHAT_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts an empty evaluation in the specified Amazon Connect instance, using the given evaluation form
      # for the particular contact. The evaluation form version used for the contact evaluation corresponds
      # to the currently activated version. If no version is activated for the evaluation form, the contact
      # evaluation cannot be started. Evaluations created through the public API do not contain answer
      # values suggested from automation.
      def start_contact_evaluation(
        contact_id : String,
        evaluation_form_id : String,
        instance_id : String,
        auto_evaluation_configuration : Types::AutoEvaluationConfiguration? = nil,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartContactEvaluationRequest.new(contact_id: contact_id, evaluation_form_id: evaluation_form_id, instance_id: instance_id, auto_evaluation_configuration: auto_evaluation_configuration, client_token: client_token, tags: tags)
        start_contact_evaluation(input)
      end
      def start_contact_evaluation(input : Types::StartContactEvaluationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CONTACT_EVALUATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables in-flight message processing for an ongoing chat session. Message processing will stay
      # active for the rest of the chat, even if an individual contact segment ends.
      def start_contact_media_processing(
        contact_id : String? = nil,
        failure_mode : String? = nil,
        instance_id : String? = nil,
        processor_arn : String? = nil
      ) : Protocol::Request
        input = Types::StartContactMediaProcessingRequest.new(contact_id: contact_id, failure_mode: failure_mode, instance_id: instance_id, processor_arn: processor_arn)
        start_contact_media_processing(input)
      end
      def start_contact_media_processing(input : Types::StartContactMediaProcessingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CONTACT_MEDIA_PROCESSING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts recording the contact: If the API is called before the agent joins the call, recording starts
      # when the agent joins the call. If the API is called after the agent joins the call, recording starts
      # at the time of the API call. StartContactRecording is a one-time action. For example, if you use
      # StopContactRecording to stop recording an ongoing call, you can't use StartContactRecording to
      # restart it. For scenarios where the recording has started and you want to suspend and resume it,
      # such as when collecting sensitive information (for example, a credit card number), use
      # SuspendContactRecording and ResumeContactRecording. You can use this API to override the recording
      # behavior configured in the Set recording behavior block. Only voice recordings are supported at this
      # time.
      def start_contact_recording(
        contact_id : String,
        initial_contact_id : String,
        instance_id : String,
        voice_recording_configuration : Types::VoiceRecordingConfiguration
      ) : Protocol::Request
        input = Types::StartContactRecordingRequest.new(contact_id: contact_id, initial_contact_id: initial_contact_id, instance_id: instance_id, voice_recording_configuration: voice_recording_configuration)
        start_contact_recording(input)
      end
      def start_contact_recording(input : Types::StartContactRecordingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CONTACT_RECORDING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates real-time message streaming for a new chat contact. For more information about message
      # streaming, see Enable real-time chat message streaming in the Amazon Connect Administrator Guide .
      # For more information about chat, see the following topics in the Amazon Connect Administrator Guide
      # : Concepts: Web and mobile messaging capabilities in Amazon Connect Amazon Connect Chat security
      # best practices
      def start_contact_streaming(
        chat_streaming_configuration : Types::ChatStreamingConfiguration,
        client_token : String,
        contact_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::StartContactStreamingRequest.new(chat_streaming_configuration: chat_streaming_configuration, client_token: client_token, contact_id: contact_id, instance_id: instance_id)
        start_contact_streaming(input)
      end
      def start_contact_streaming(input : Types::StartContactStreamingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CONTACT_STREAMING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an inbound email contact and initiates a flow to start the email contact for the customer.
      # Response of this API provides the ContactId of the email contact created.
      def start_email_contact(
        destination_email_address : String,
        email_message : Types::InboundEmailContent,
        from_email_address : Types::EmailAddressInfo,
        instance_id : String,
        additional_recipients : Types::InboundAdditionalRecipients? = nil,
        attachments : Array(Types::EmailAttachment)? = nil,
        attributes : Hash(String, String)? = nil,
        client_token : String? = nil,
        contact_flow_id : String? = nil,
        description : String? = nil,
        name : String? = nil,
        references : Hash(String, Types::Reference)? = nil,
        related_contact_id : String? = nil,
        segment_attributes : Hash(String, Types::SegmentAttributeValue)? = nil
      ) : Protocol::Request
        input = Types::StartEmailContactRequest.new(destination_email_address: destination_email_address, email_message: email_message, from_email_address: from_email_address, instance_id: instance_id, additional_recipients: additional_recipients, attachments: attachments, attributes: attributes, client_token: client_token, contact_flow_id: contact_flow_id, description: description, name: name, references: references, related_contact_id: related_contact_id, segment_attributes: segment_attributes)
        start_email_contact(input)
      end
      def start_email_contact(input : Types::StartEmailContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_EMAIL_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates a new outbound SMS or WhatsApp contact to a customer. Response of this API provides the
      # ContactId of the outbound SMS or WhatsApp contact created. SourceEndpoint only supports Endpoints
      # with CONNECT_PHONENUMBER_ARN as Type and DestinationEndpoint only supports Endpoints with
      # TELEPHONE_NUMBER as Type. ContactFlowId initiates the flow to manage the new contact created. This
      # API can be used to initiate outbound SMS or WhatsApp contacts for an agent, or it can also deflect
      # an ongoing contact to an outbound SMS or WhatsApp contact by using the StartOutboundChatContact Flow
      # Action. For more information about using SMS or WhatsApp in Amazon Connect, see the following topics
      # in the Amazon Connect Administrator Guide : Set up SMS messaging Request an SMS-enabled phone number
      # through Amazon Web Services End User Messaging SMS Set up WhatsApp Business messaging
      def start_outbound_chat_contact(
        contact_flow_id : String,
        destination_endpoint : Types::Endpoint,
        instance_id : String,
        segment_attributes : Hash(String, Types::SegmentAttributeValue),
        source_endpoint : Types::Endpoint,
        attributes : Hash(String, String)? = nil,
        chat_duration_in_minutes : Int32? = nil,
        client_token : String? = nil,
        initial_system_message : Types::ChatMessage? = nil,
        initial_templated_system_message : Types::TemplatedMessageConfig? = nil,
        participant_details : Types::ParticipantDetails? = nil,
        related_contact_id : String? = nil,
        supported_messaging_content_types : Array(String)? = nil
      ) : Protocol::Request
        input = Types::StartOutboundChatContactRequest.new(contact_flow_id: contact_flow_id, destination_endpoint: destination_endpoint, instance_id: instance_id, segment_attributes: segment_attributes, source_endpoint: source_endpoint, attributes: attributes, chat_duration_in_minutes: chat_duration_in_minutes, client_token: client_token, initial_system_message: initial_system_message, initial_templated_system_message: initial_templated_system_message, participant_details: participant_details, related_contact_id: related_contact_id, supported_messaging_content_types: supported_messaging_content_types)
        start_outbound_chat_contact(input)
      end
      def start_outbound_chat_contact(input : Types::StartOutboundChatContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_OUTBOUND_CHAT_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates a flow to send an agent reply or outbound email contact (created from the CreateContact
      # API) to a customer.
      def start_outbound_email_contact(
        contact_id : String,
        destination_email_address : Types::EmailAddressInfo,
        email_message : Types::OutboundEmailContent,
        instance_id : String,
        additional_recipients : Types::OutboundAdditionalRecipients? = nil,
        client_token : String? = nil,
        from_email_address : Types::EmailAddressInfo? = nil
      ) : Protocol::Request
        input = Types::StartOutboundEmailContactRequest.new(contact_id: contact_id, destination_email_address: destination_email_address, email_message: email_message, instance_id: instance_id, additional_recipients: additional_recipients, client_token: client_token, from_email_address: from_email_address)
        start_outbound_email_contact(input)
      end
      def start_outbound_email_contact(input : Types::StartOutboundEmailContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_OUTBOUND_EMAIL_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Places an outbound call to a contact, and then initiates the flow. It performs the actions in the
      # flow that's specified (in ContactFlowId ). Agents do not initiate the outbound API, which means that
      # they do not dial the contact. If the flow places an outbound call to a contact, and then puts the
      # contact in queue, the call is then routed to the agent, like any other inbound case. Dialing timeout
      # for this operation can be configured with the “RingTimeoutInSeconds” parameter. If not specified,
      # the default dialing timeout will be 60 seconds which means if the call is not connected within 60
      # seconds, it fails. UK numbers with a 447 prefix are not allowed by default. Before you can dial
      # these UK mobile numbers, you must submit a service quota increase request. For more information, see
      # Amazon Connect Service Quotas in the Amazon Connect Administrator Guide . Campaign calls are not
      # allowed by default. Before you can make a call with TrafficType = CAMPAIGN , you must submit a
      # service quota increase request to the quota Amazon Connect campaigns . For Preview dialing mode,
      # only the Amazon Connect outbound campaigns service principal is allowed to assume a role in your
      # account and call this API with OutboundStrategy.
      def start_outbound_voice_contact(
        contact_flow_id : String,
        destination_phone_number : String,
        instance_id : String,
        answer_machine_detection_config : Types::AnswerMachineDetectionConfig? = nil,
        attributes : Hash(String, String)? = nil,
        campaign_id : String? = nil,
        client_token : String? = nil,
        description : String? = nil,
        name : String? = nil,
        outbound_strategy : Types::OutboundStrategy? = nil,
        queue_id : String? = nil,
        references : Hash(String, Types::Reference)? = nil,
        related_contact_id : String? = nil,
        ring_timeout_in_seconds : Int32? = nil,
        source_phone_number : String? = nil,
        traffic_type : String? = nil
      ) : Protocol::Request
        input = Types::StartOutboundVoiceContactRequest.new(contact_flow_id: contact_flow_id, destination_phone_number: destination_phone_number, instance_id: instance_id, answer_machine_detection_config: answer_machine_detection_config, attributes: attributes, campaign_id: campaign_id, client_token: client_token, description: description, name: name, outbound_strategy: outbound_strategy, queue_id: queue_id, references: references, related_contact_id: related_contact_id, ring_timeout_in_seconds: ring_timeout_in_seconds, source_phone_number: source_phone_number, traffic_type: traffic_type)
        start_outbound_voice_contact(input)
      end
      def start_outbound_voice_contact(input : Types::StartOutboundVoiceContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_OUTBOUND_VOICE_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts screen sharing for a contact. For more information about screen sharing, see Set up in-app,
      # web, video calling, and screen sharing capabilities in the Amazon Connect Administrator Guide .
      def start_screen_sharing(
        contact_id : String,
        instance_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::StartScreenSharingRequest.new(contact_id: contact_id, instance_id: instance_id, client_token: client_token)
        start_screen_sharing(input)
      end
      def start_screen_sharing(input : Types::StartScreenSharingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_SCREEN_SHARING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates a flow to start a new task contact. For more information about task contacts, see
      # Concepts: Tasks in Amazon Connect in the Amazon Connect Administrator Guide . When using
      # PreviousContactId and RelatedContactId input parameters, note the following: PreviousContactId Any
      # updates to user-defined task contact attributes on any contact linked through the same
      # PreviousContactId will affect every contact in the chain. There can be a maximum of 12 linked task
      # contacts in a chain. That is, 12 task contacts can be created that share the same PreviousContactId
      # . RelatedContactId Copies contact attributes from the related task contact to the new contact. Any
      # update on attributes in a new task contact does not update attributes on previous contact. There’s
      # no limit on the number of task contacts that can be created that use the same RelatedContactId . In
      # addition, when calling StartTaskContact include only one of these parameters: ContactFlowID ,
      # QuickConnectID , or TaskTemplateID . Only one parameter is required as long as the task template has
      # a flow configured to run it. If more than one parameter is specified, or only the TaskTemplateID is
      # specified but it does not have a flow configured, the request returns an error because Amazon
      # Connect cannot identify the unique flow to run when the task is created. A
      # ServiceQuotaExceededException occurs when the number of open tasks exceeds the active tasks quota or
      # there are already 12 tasks referencing the same PreviousContactId . For more information about
      # service quotas for task contacts, see Amazon Connect service quotas in the Amazon Connect
      # Administrator Guide .
      def start_task_contact(
        instance_id : String,
        name : String,
        attributes : Hash(String, String)? = nil,
        client_token : String? = nil,
        contact_flow_id : String? = nil,
        description : String? = nil,
        previous_contact_id : String? = nil,
        quick_connect_id : String? = nil,
        references : Hash(String, Types::Reference)? = nil,
        related_contact_id : String? = nil,
        scheduled_time : Time? = nil,
        segment_attributes : Hash(String, Types::SegmentAttributeValue)? = nil,
        task_template_id : String? = nil
      ) : Protocol::Request
        input = Types::StartTaskContactRequest.new(instance_id: instance_id, name: name, attributes: attributes, client_token: client_token, contact_flow_id: contact_flow_id, description: description, previous_contact_id: previous_contact_id, quick_connect_id: quick_connect_id, references: references, related_contact_id: related_contact_id, scheduled_time: scheduled_time, segment_attributes: segment_attributes, task_template_id: task_template_id)
        start_task_contact(input)
      end
      def start_task_contact(input : Types::StartTaskContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_TASK_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Places an inbound in-app, web, or video call to a contact, and then initiates the flow. It performs
      # the actions in the flow that are specified (in ContactFlowId) and present in the Amazon Connect
      # instance (specified as InstanceId).
      def start_web_rtc_contact(
        contact_flow_id : String,
        instance_id : String,
        participant_details : Types::ParticipantDetails,
        allowed_capabilities : Types::AllowedCapabilities? = nil,
        attributes : Hash(String, String)? = nil,
        client_token : String? = nil,
        description : String? = nil,
        references : Hash(String, Types::Reference)? = nil,
        related_contact_id : String? = nil
      ) : Protocol::Request
        input = Types::StartWebRTCContactRequest.new(contact_flow_id: contact_flow_id, instance_id: instance_id, participant_details: participant_details, allowed_capabilities: allowed_capabilities, attributes: attributes, client_token: client_token, description: description, references: references, related_contact_id: related_contact_id)
        start_web_rtc_contact(input)
      end
      def start_web_rtc_contact(input : Types::StartWebRTCContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_WEB_RTC_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Ends the specified contact. Use this API to stop queued callbacks. It does not work for voice
      # contacts that use the following initiation methods: DISCONNECT TRANSFER QUEUE_TRANSFER
      # EXTERNAL_OUTBOUND MONITOR Chat and task contacts can be terminated in any state, regardless of
      # initiation method.
      def stop_contact(
        contact_id : String,
        instance_id : String,
        disconnect_reason : Types::DisconnectReason? = nil
      ) : Protocol::Request
        input = Types::StopContactRequest.new(contact_id: contact_id, instance_id: instance_id, disconnect_reason: disconnect_reason)
        stop_contact(input)
      end
      def stop_contact(input : Types::StopContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops in-flight message processing for an ongoing chat session.
      def stop_contact_media_processing(
        contact_id : String? = nil,
        instance_id : String? = nil
      ) : Protocol::Request
        input = Types::StopContactMediaProcessingRequest.new(contact_id: contact_id, instance_id: instance_id)
        stop_contact_media_processing(input)
      end
      def stop_contact_media_processing(input : Types::StopContactMediaProcessingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_CONTACT_MEDIA_PROCESSING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops recording a call when a contact is being recorded. StopContactRecording is a one-time action.
      # If you use StopContactRecording to stop recording an ongoing call, you can't use
      # StartContactRecording to restart it. For scenarios where the recording has started and you want to
      # suspend it for sensitive information (for example, to collect a credit card number), and then
      # restart it, use SuspendContactRecording and ResumeContactRecording. Only voice recordings are
      # supported at this time.
      def stop_contact_recording(
        contact_id : String,
        initial_contact_id : String,
        instance_id : String,
        contact_recording_type : String? = nil
      ) : Protocol::Request
        input = Types::StopContactRecordingRequest.new(contact_id: contact_id, initial_contact_id: initial_contact_id, instance_id: instance_id, contact_recording_type: contact_recording_type)
        stop_contact_recording(input)
      end
      def stop_contact_recording(input : Types::StopContactRecordingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_CONTACT_RECORDING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Ends message streaming on a specified contact. To restart message streaming on that contact, call
      # the StartContactStreaming API.
      def stop_contact_streaming(
        contact_id : String,
        instance_id : String,
        streaming_id : String
      ) : Protocol::Request
        input = Types::StopContactStreamingRequest.new(contact_id: contact_id, instance_id: instance_id, streaming_id: streaming_id)
        stop_contact_streaming(input)
      end
      def stop_contact_streaming(input : Types::StopContactStreamingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_CONTACT_STREAMING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Submits a contact evaluation in the specified Amazon Connect instance. Answers included in the
      # request are merged with existing answers for the given evaluation. If no answers or notes are
      # passed, the evaluation is submitted with the existing answers and notes. You can delete an answer or
      # note by passing an empty object ( {} ) to the question identifier. If a contact evaluation is
      # already in submitted state, this operation will trigger a resubmission.
      def submit_contact_evaluation(
        evaluation_id : String,
        instance_id : String,
        answers : Hash(String, Types::EvaluationAnswerInput)? = nil,
        notes : Hash(String, Types::EvaluationNote)? = nil,
        submitted_by : Types::EvaluatorUserUnion? = nil
      ) : Protocol::Request
        input = Types::SubmitContactEvaluationRequest.new(evaluation_id: evaluation_id, instance_id: instance_id, answers: answers, notes: notes, submitted_by: submitted_by)
        submit_contact_evaluation(input)
      end
      def submit_contact_evaluation(input : Types::SubmitContactEvaluationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SUBMIT_CONTACT_EVALUATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # When a contact is being recorded, this API suspends recording whatever is selected in the flow
      # configuration: call (IVR or agent), screen, or both. If only call recording or only screen recording
      # is enabled, then it would be suspended. For example, you might suspend the screen recording while
      # collecting sensitive information, such as a credit card number. Then use ResumeContactRecording to
      # restart recording the screen. The period of time that the recording is suspended is filled with
      # silence in the final recording. Voice (IVR, agent) and screen recordings are supported.
      def suspend_contact_recording(
        contact_id : String,
        initial_contact_id : String,
        instance_id : String,
        contact_recording_type : String? = nil
      ) : Protocol::Request
        input = Types::SuspendContactRecordingRequest.new(contact_id: contact_id, initial_contact_id: initial_contact_id, instance_id: instance_id, contact_recording_type: contact_recording_type)
        suspend_contact_recording(input)
      end
      def suspend_contact_recording(input : Types::SuspendContactRecordingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SUSPEND_CONTACT_RECORDING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds the specified tags to the contact resource. For more information about this API is used, see
      # Set up granular billing for a detailed view of your Amazon Connect usage .
      def tag_contact(
        contact_id : String,
        instance_id : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagContactRequest.new(contact_id: contact_id, instance_id: instance_id, tags: tags)
        tag_contact(input)
      end
      def tag_contact(input : Types::TagContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds the specified tags to the specified resource. Some of the supported resource types are agents,
      # routing profiles, queues, quick connects, flows, agent statuses, hours of operation, phone numbers,
      # security profiles, and task templates. For a complete list, see Tagging resources in Amazon Connect
      # . For sample policies that use tags, see Amazon Connect Identity-Based Policy Examples in the Amazon
      # Connect Administrator Guide .
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

      # Transfers TASK or EMAIL contacts from one agent or queue to another agent or queue at any point
      # after a contact is created. You can transfer a contact to another queue by providing the flow which
      # orchestrates the contact to the destination queue. This gives you more control over contact handling
      # and helps you adhere to the service level agreement (SLA) guaranteed to your customers. Note the
      # following requirements: Transfer is only supported for TASK and EMAIL contacts. Do not use both
      # QueueId and UserId in the same call. The following flow types are supported: Inbound flow, Transfer
      # to agent flow, and Transfer to queue flow. The TransferContact API can be called only on active
      # contacts. A contact cannot be transferred more than 11 times.
      def transfer_contact(
        contact_flow_id : String,
        contact_id : String,
        instance_id : String,
        client_token : String? = nil,
        queue_id : String? = nil,
        user_id : String? = nil
      ) : Protocol::Request
        input = Types::TransferContactRequest.new(contact_flow_id: contact_flow_id, contact_id: contact_id, instance_id: instance_id, client_token: client_token, queue_id: queue_id, user_id: user_id)
        transfer_contact(input)
      end
      def transfer_contact(input : Types::TransferContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TRANSFER_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified tags from the contact resource. For more information about this API is used,
      # see Set up granular billing for a detailed view of your Amazon Connect usage .
      def untag_contact(
        contact_id : String,
        instance_id : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagContactRequest.new(contact_id: contact_id, instance_id: instance_id, tag_keys: tag_keys)
        untag_contact(input)
      end
      def untag_contact(input : Types::UntagContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified tags from the specified resource.
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

      # Updates agent status.
      def update_agent_status(
        agent_status_id : String,
        instance_id : String,
        description : String? = nil,
        display_order : Int32? = nil,
        name : String? = nil,
        reset_order_number : Bool? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAgentStatusRequest.new(agent_status_id: agent_status_id, instance_id: instance_id, description: description, display_order: display_order, name: name, reset_order_number: reset_order_number, state: state)
        update_agent_status(input)
      end
      def update_agent_status(input : Types::UpdateAgentStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AGENT_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. To request access to
      # this API, contact Amazon Web Services Support. Updates the selected authentication profile.
      def update_authentication_profile(
        authentication_profile_id : String,
        instance_id : String,
        allowed_ips : Array(String)? = nil,
        blocked_ips : Array(String)? = nil,
        description : String? = nil,
        name : String? = nil,
        periodic_session_duration : Int32? = nil,
        session_inactivity_duration : Int32? = nil,
        session_inactivity_handling_enabled : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateAuthenticationProfileRequest.new(authentication_profile_id: authentication_profile_id, instance_id: instance_id, allowed_ips: allowed_ips, blocked_ips: blocked_ips, description: description, name: name, periodic_session_duration: periodic_session_duration, session_inactivity_duration: session_inactivity_duration, session_inactivity_handling_enabled: session_inactivity_handling_enabled)
        update_authentication_profile(input)
      end
      def update_authentication_profile(input : Types::UpdateAuthenticationProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AUTHENTICATION_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Adds or updates
      # user-defined contact information associated with the specified contact. At least one field to be
      # updated must be present in the request. You can add or update user-defined contact information for
      # both ongoing and completed contacts.
      def update_contact(
        contact_id : String,
        instance_id : String,
        customer_endpoint : Types::Endpoint? = nil,
        description : String? = nil,
        name : String? = nil,
        queue_info : Types::QueueInfoInput? = nil,
        references : Hash(String, Types::Reference)? = nil,
        segment_attributes : Hash(String, Types::SegmentAttributeValue)? = nil,
        system_endpoint : Types::Endpoint? = nil,
        user_info : Types::UserInfo? = nil
      ) : Protocol::Request
        input = Types::UpdateContactRequest.new(contact_id: contact_id, instance_id: instance_id, customer_endpoint: customer_endpoint, description: description, name: name, queue_info: queue_info, references: references, segment_attributes: segment_attributes, system_endpoint: system_endpoint, user_info: user_info)
        update_contact(input)
      end
      def update_contact(input : Types::UpdateContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates or updates user-defined contact attributes associated with the specified contact. You can
      # create or update user-defined attributes for both ongoing and completed contacts. For example, while
      # the call is active, you can update the customer's name or the reason the customer called. You can
      # add notes about steps that the agent took during the call that display to the next agent that takes
      # the call. You can also update attributes for a contact using data from your CRM application and save
      # the data with the contact in Amazon Connect. You could also flag calls for additional analysis, such
      # as legal review or to identify abusive callers. Contact attributes are available in Amazon Connect
      # for 24 months, and are then deleted. For information about contact record retention and the maximum
      # size of the contact record attributes section, see Feature specifications in the Amazon Connect
      # Administrator Guide .
      def update_contact_attributes(
        attributes : Hash(String, String),
        initial_contact_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::UpdateContactAttributesRequest.new(attributes: attributes, initial_contact_id: initial_contact_id, instance_id: instance_id)
        update_contact_attributes(input)
      end
      def update_contact_attributes(input : Types::UpdateContactAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONTACT_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates details about a contact evaluation in the specified Amazon Connect instance. A contact
      # evaluation must be in draft state. Answers included in the request are merged with existing answers
      # for the given evaluation. An answer or note can be deleted by passing an empty object ( {} ) to the
      # question identifier.
      def update_contact_evaluation(
        evaluation_id : String,
        instance_id : String,
        answers : Hash(String, Types::EvaluationAnswerInput)? = nil,
        notes : Hash(String, Types::EvaluationNote)? = nil,
        updated_by : Types::EvaluatorUserUnion? = nil
      ) : Protocol::Request
        input = Types::UpdateContactEvaluationRequest.new(evaluation_id: evaluation_id, instance_id: instance_id, answers: answers, notes: notes, updated_by: updated_by)
        update_contact_evaluation(input)
      end
      def update_contact_evaluation(input : Types::UpdateContactEvaluationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONTACT_EVALUATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified flow. You can also create and update flows using the Amazon Connect Flow
      # language . Use the $SAVED alias in the request to describe the SAVED content of a Flow. For example,
      # arn:aws:.../contact-flow/{id}:$SAVED . After a flow is published, $SAVED needs to be supplied to
      # view saved content that has not been published.
      def update_contact_flow_content(
        contact_flow_id : String,
        content : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::UpdateContactFlowContentRequest.new(contact_flow_id: contact_flow_id, content: content, instance_id: instance_id)
        update_contact_flow_content(input)
      end
      def update_contact_flow_content(input : Types::UpdateContactFlowContentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONTACT_FLOW_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates metadata about specified flow.
      def update_contact_flow_metadata(
        contact_flow_id : String,
        instance_id : String,
        contact_flow_state : String? = nil,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateContactFlowMetadataRequest.new(contact_flow_id: contact_flow_id, instance_id: instance_id, contact_flow_state: contact_flow_state, description: description, name: name)
        update_contact_flow_metadata(input)
      end
      def update_contact_flow_metadata(input : Types::UpdateContactFlowMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONTACT_FLOW_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a specific Aliases metadata, including the version it’s tied to, it’s name, and description.
      def update_contact_flow_module_alias(
        alias_id : String,
        contact_flow_module_id : String,
        instance_id : String,
        contact_flow_module_version : Int64? = nil,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateContactFlowModuleAliasRequest.new(alias_id: alias_id, contact_flow_module_id: contact_flow_module_id, instance_id: instance_id, contact_flow_module_version: contact_flow_module_version, description: description, name: name)
        update_contact_flow_module_alias(input)
      end
      def update_contact_flow_module_alias(input : Types::UpdateContactFlowModuleAliasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONTACT_FLOW_MODULE_ALIAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates specified flow module for the specified Amazon Connect instance. Use the $SAVED alias in the
      # request to describe the SAVED content of a Flow. For example, arn:aws:.../contact-flow/{id}:$SAVED .
      # After a flow is published, $SAVED needs to be supplied to view saved content that has not been
      # published.
      def update_contact_flow_module_content(
        contact_flow_module_id : String,
        instance_id : String,
        content : String? = nil,
        settings : String? = nil
      ) : Protocol::Request
        input = Types::UpdateContactFlowModuleContentRequest.new(contact_flow_module_id: contact_flow_module_id, instance_id: instance_id, content: content, settings: settings)
        update_contact_flow_module_content(input)
      end
      def update_contact_flow_module_content(input : Types::UpdateContactFlowModuleContentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONTACT_FLOW_MODULE_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates metadata about specified flow module.
      def update_contact_flow_module_metadata(
        contact_flow_module_id : String,
        instance_id : String,
        description : String? = nil,
        name : String? = nil,
        state : String? = nil
      ) : Protocol::Request
        input = Types::UpdateContactFlowModuleMetadataRequest.new(contact_flow_module_id: contact_flow_module_id, instance_id: instance_id, description: description, name: name, state: state)
        update_contact_flow_module_metadata(input)
      end
      def update_contact_flow_module_metadata(input : Types::UpdateContactFlowModuleMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONTACT_FLOW_MODULE_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The name of the flow. You can also create and update flows using the Amazon Connect Flow language .
      def update_contact_flow_name(
        contact_flow_id : String,
        instance_id : String,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateContactFlowNameRequest.new(contact_flow_id: contact_flow_id, instance_id: instance_id, description: description, name: name)
        update_contact_flow_name(input)
      end
      def update_contact_flow_name(input : Types::UpdateContactFlowNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONTACT_FLOW_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates routing priority and age on the contact ( QueuePriority and QueueTimeAdjustmentInSeconds ).
      # These properties can be used to change a customer's position in the queue. For example, you can move
      # a contact to the back of the queue by setting a lower routing priority relative to other contacts in
      # queue; or you can move a contact to the front of the queue by increasing the routing age which will
      # make the contact look artificially older and therefore higher up in the first-in-first-out routing
      # order. Note that adjusting the routing age of a contact affects only its position in queue, and not
      # its actual queue wait time as reported through metrics. These properties can also be updated by
      # using the Set routing priority / age flow block . Either QueuePriority or
      # QueueTimeAdjustmentInSeconds should be provided within the request body, but not both.
      def update_contact_routing_data(
        contact_id : String,
        instance_id : String,
        queue_priority : Int64? = nil,
        queue_time_adjustment_seconds : Int32? = nil,
        routing_criteria : Types::RoutingCriteriaInput? = nil
      ) : Protocol::Request
        input = Types::UpdateContactRoutingDataRequest.new(contact_id: contact_id, instance_id: instance_id, queue_priority: queue_priority, queue_time_adjustment_seconds: queue_time_adjustment_seconds, routing_criteria: routing_criteria)
        update_contact_routing_data(input)
      end
      def update_contact_routing_data(input : Types::UpdateContactRoutingDataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONTACT_ROUTING_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the scheduled time of a task contact that is already scheduled.
      def update_contact_schedule(
        contact_id : String,
        instance_id : String,
        scheduled_time : Time
      ) : Protocol::Request
        input = Types::UpdateContactScheduleRequest.new(contact_id: contact_id, instance_id: instance_id, scheduled_time: scheduled_time)
        update_contact_schedule(input)
      end
      def update_contact_schedule(input : Types::UpdateContactScheduleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONTACT_SCHEDULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates all properties for an attribute using all properties from CreateDataTableAttribute. There
      # are no other granular update endpoints. It does not act as a patch operation - all properties must
      # be provided. System managed attributes are not mutable by customers. Changing an attribute's
      # validation does not invalidate existing values since validation only runs when values are created or
      # updated.
      def update_data_table_attribute(
        attribute_name : String,
        data_table_id : String,
        instance_id : String,
        name : String,
        value_type : String,
        description : String? = nil,
        primary : Bool? = nil,
        validation : Types::Validation? = nil
      ) : Protocol::Request
        input = Types::UpdateDataTableAttributeRequest.new(attribute_name: attribute_name, data_table_id: data_table_id, instance_id: instance_id, name: name, value_type: value_type, description: description, primary: primary, validation: validation)
        update_data_table_attribute(input)
      end
      def update_data_table_attribute(input : Types::UpdateDataTableAttributeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_TABLE_ATTRIBUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the metadata properties of a data table. Accepts all fields similar to CreateDataTable,
      # except for fields and tags. There are no other granular update endpoints. It does not act as a patch
      # operation - all properties must be provided or defaults will be used. Fields follow the same
      # requirements as CreateDataTable.
      def update_data_table_metadata(
        data_table_id : String,
        instance_id : String,
        name : String,
        time_zone : String,
        value_lock_level : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDataTableMetadataRequest.new(data_table_id: data_table_id, instance_id: instance_id, name: name, time_zone: time_zone, value_lock_level: value_lock_level, description: description)
        update_data_table_metadata(input)
      end
      def update_data_table_metadata(input : Types::UpdateDataTableMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_TABLE_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the primary values for a record. This operation affects all existing values that are
      # currently associated to the record and its primary values. Users that have restrictions on
      # attributes and/or primary values are not authorized to use this endpoint. The combination of new
      # primary values must be unique within the table.
      def update_data_table_primary_values(
        data_table_id : String,
        instance_id : String,
        lock_version : Types::DataTableLockVersion,
        new_primary_values : Array(Types::PrimaryValue),
        primary_values : Array(Types::PrimaryValue)
      ) : Protocol::Request
        input = Types::UpdateDataTablePrimaryValuesRequest.new(data_table_id: data_table_id, instance_id: instance_id, lock_version: lock_version, new_primary_values: new_primary_values, primary_values: primary_values)
        update_data_table_primary_values(input)
      end
      def update_data_table_primary_values(input : Types::UpdateDataTablePrimaryValuesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_TABLE_PRIMARY_VALUES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an email address metadata. For more information about email addresses, see Create email
      # addresses in the Amazon Connect Administrator Guide.
      def update_email_address_metadata(
        email_address_id : String,
        instance_id : String,
        client_token : String? = nil,
        description : String? = nil,
        display_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateEmailAddressMetadataRequest.new(email_address_id: email_address_id, instance_id: instance_id, client_token: client_token, description: description, display_name: display_name)
        update_email_address_metadata(input)
      end
      def update_email_address_metadata(input : Types::UpdateEmailAddressMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EMAIL_ADDRESS_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates details about a specific evaluation form version in the specified Amazon Connect instance.
      # Question and section identifiers cannot be duplicated within the same evaluation form. This
      # operation does not support partial updates. Instead it does a full update of evaluation form
      # content.
      def update_evaluation_form(
        evaluation_form_id : String,
        evaluation_form_version : Int32,
        instance_id : String,
        items : Array(Types::EvaluationFormItem),
        title : String,
        as_draft : Bool? = nil,
        auto_evaluation_configuration : Types::EvaluationFormAutoEvaluationConfiguration? = nil,
        client_token : String? = nil,
        create_new_version : Bool? = nil,
        description : String? = nil,
        language_configuration : Types::EvaluationFormLanguageConfiguration? = nil,
        review_configuration : Types::EvaluationReviewConfiguration? = nil,
        scoring_strategy : Types::EvaluationFormScoringStrategy? = nil,
        target_configuration : Types::EvaluationFormTargetConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateEvaluationFormRequest.new(evaluation_form_id: evaluation_form_id, evaluation_form_version: evaluation_form_version, instance_id: instance_id, items: items, title: title, as_draft: as_draft, auto_evaluation_configuration: auto_evaluation_configuration, client_token: client_token, create_new_version: create_new_version, description: description, language_configuration: language_configuration, review_configuration: review_configuration, scoring_strategy: scoring_strategy, target_configuration: target_configuration)
        update_evaluation_form(input)
      end
      def update_evaluation_form(input : Types::UpdateEvaluationFormRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EVALUATION_FORM, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the hours of operation.
      def update_hours_of_operation(
        hours_of_operation_id : String,
        instance_id : String,
        config : Array(Types::HoursOfOperationConfig)? = nil,
        description : String? = nil,
        name : String? = nil,
        time_zone : String? = nil
      ) : Protocol::Request
        input = Types::UpdateHoursOfOperationRequest.new(hours_of_operation_id: hours_of_operation_id, instance_id: instance_id, config: config, description: description, name: name, time_zone: time_zone)
        update_hours_of_operation(input)
      end
      def update_hours_of_operation(input : Types::UpdateHoursOfOperationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_HOURS_OF_OPERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the hours of operation override.
      def update_hours_of_operation_override(
        hours_of_operation_id : String,
        hours_of_operation_override_id : String,
        instance_id : String,
        config : Array(Types::HoursOfOperationOverrideConfig)? = nil,
        description : String? = nil,
        effective_from : String? = nil,
        effective_till : String? = nil,
        name : String? = nil,
        override_type : String? = nil,
        recurrence_config : Types::RecurrenceConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateHoursOfOperationOverrideRequest.new(hours_of_operation_id: hours_of_operation_id, hours_of_operation_override_id: hours_of_operation_override_id, instance_id: instance_id, config: config, description: description, effective_from: effective_from, effective_till: effective_till, name: name, override_type: override_type, recurrence_config: recurrence_config)
        update_hours_of_operation_override(input)
      end
      def update_hours_of_operation_override(input : Types::UpdateHoursOfOperationOverrideRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_HOURS_OF_OPERATION_OVERRIDE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Updates the value for
      # the specified attribute type.
      def update_instance_attribute(
        attribute_type : String,
        instance_id : String,
        value : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateInstanceAttributeRequest.new(attribute_type: attribute_type, instance_id: instance_id, value: value, client_token: client_token)
        update_instance_attribute(input)
      end
      def update_instance_attribute(input : Types::UpdateInstanceAttributeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INSTANCE_ATTRIBUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API is in preview release for Amazon Connect and is subject to change. Updates an existing
      # configuration for a resource type. This API is idempotent.
      def update_instance_storage_config(
        association_id : String,
        instance_id : String,
        resource_type : String,
        storage_config : Types::InstanceStorageConfig,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateInstanceStorageConfigRequest.new(association_id: association_id, instance_id: instance_id, resource_type: resource_type, storage_config: storage_config, client_token: client_token)
        update_instance_storage_config(input)
      end
      def update_instance_storage_config(input : Types::UpdateInstanceStorageConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INSTANCE_STORAGE_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Instructs Amazon Connect to resume the authentication process. The subsequent actions depend on the
      # request body contents: If a code is provided : Connect retrieves the identity information from
      # Amazon Cognito and imports it into Connect Customer Profiles. If an error is provided : The error
      # branch of the Authenticate Customer block is executed. The API returns a success response to
      # acknowledge the request. However, the interaction and exchange of identity information occur
      # asynchronously after the response is returned.
      def update_participant_authentication(
        instance_id : String,
        state : String,
        code : String? = nil,
        error : String? = nil,
        error_description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateParticipantAuthenticationRequest.new(instance_id: instance_id, state: state, code: code, error: error, error_description: error_description)
        update_participant_authentication(input)
      end
      def update_participant_authentication(input : Types::UpdateParticipantAuthenticationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PARTICIPANT_AUTHENTICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates timeouts for when human chat participants are to be considered idle, and when agents are
      # automatically disconnected from a chat due to idleness. You can set four timers: Customer idle
      # timeout Customer auto-disconnect timeout Agent idle timeout Agent auto-disconnect timeout For more
      # information about how chat timeouts work, see Set up chat timeouts for human participants .
      def update_participant_role_config(
        channel_configuration : Types::UpdateParticipantRoleConfigChannelInfo,
        contact_id : String,
        instance_id : String
      ) : Protocol::Request
        input = Types::UpdateParticipantRoleConfigRequest.new(channel_configuration: channel_configuration, contact_id: contact_id, instance_id: instance_id)
        update_participant_role_config(input)
      end
      def update_participant_role_config(input : Types::UpdateParticipantRoleConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PARTICIPANT_ROLE_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates your claimed phone number from its current Amazon Connect instance or traffic distribution
      # group to another Amazon Connect instance or traffic distribution group in the same Amazon Web
      # Services Region. After using this API, you must verify that the phone number is attached to the
      # correct flow in the target instance or traffic distribution group. You need to do this because the
      # API switches only the phone number to a new instance or traffic distribution group. It doesn't
      # migrate the flow configuration of the phone number, too. You can call DescribePhoneNumber API to
      # verify the status of a previous UpdatePhoneNumber operation.
      def update_phone_number(
        phone_number_id : String,
        client_token : String? = nil,
        instance_id : String? = nil,
        target_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePhoneNumberRequest.new(phone_number_id: phone_number_id, client_token: client_token, instance_id: instance_id, target_arn: target_arn)
        update_phone_number(input)
      end
      def update_phone_number(input : Types::UpdatePhoneNumberRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PHONE_NUMBER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a phone number’s metadata. To verify the status of a previous UpdatePhoneNumberMetadata
      # operation, call the DescribePhoneNumber API.
      def update_phone_number_metadata(
        phone_number_id : String,
        client_token : String? = nil,
        phone_number_description : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePhoneNumberMetadataRequest.new(phone_number_id: phone_number_id, client_token: client_token, phone_number_description: phone_number_description)
        update_phone_number_metadata(input)
      end
      def update_phone_number_metadata(input : Types::UpdatePhoneNumberMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PHONE_NUMBER_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a predefined attribute for the specified Amazon Connect instance. A predefined attribute is
      # made up of a name and a value. For the predefined attributes per instance quota, see Amazon Connect
      # quotas . Use cases Following are common uses cases for this API: Update routing proficiency (for
      # example, agent certification) that has predefined values (for example, a list of possible
      # certifications). For more information, see Create predefined attributes for routing contacts to
      # agents . Update an attribute for business unit name that has a list of predefined business unit
      # names used in your organization. This is a use case where information for a contact varies between
      # transfers or conferences. For more information, see Use contact segment attributes . Endpoints : See
      # Amazon Connect endpoints and quotas .
      def update_predefined_attribute(
        instance_id : String,
        name : String,
        attribute_configuration : Types::InputPredefinedAttributeConfiguration? = nil,
        purposes : Array(String)? = nil,
        values : Types::PredefinedAttributeValues? = nil
      ) : Protocol::Request
        input = Types::UpdatePredefinedAttributeRequest.new(instance_id: instance_id, name: name, attribute_configuration: attribute_configuration, purposes: purposes, values: values)
        update_predefined_attribute(input)
      end
      def update_predefined_attribute(input : Types::UpdatePredefinedAttributeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PREDEFINED_ATTRIBUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a prompt.
      def update_prompt(
        instance_id : String,
        prompt_id : String,
        description : String? = nil,
        name : String? = nil,
        s3_uri : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePromptRequest.new(instance_id: instance_id, prompt_id: prompt_id, description: description, name: name, s3_uri: s3_uri)
        update_prompt(input)
      end
      def update_prompt(input : Types::UpdatePromptRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROMPT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the hours of operation for the specified queue.
      def update_queue_hours_of_operation(
        hours_of_operation_id : String,
        instance_id : String,
        queue_id : String
      ) : Protocol::Request
        input = Types::UpdateQueueHoursOfOperationRequest.new(hours_of_operation_id: hours_of_operation_id, instance_id: instance_id, queue_id: queue_id)
        update_queue_hours_of_operation(input)
      end
      def update_queue_hours_of_operation(input : Types::UpdateQueueHoursOfOperationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_QUEUE_HOURS_OF_OPERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the maximum number of contacts allowed in a queue before it is considered full.
      def update_queue_max_contacts(
        instance_id : String,
        queue_id : String,
        max_contacts : Int32? = nil
      ) : Protocol::Request
        input = Types::UpdateQueueMaxContactsRequest.new(instance_id: instance_id, queue_id: queue_id, max_contacts: max_contacts)
        update_queue_max_contacts(input)
      end
      def update_queue_max_contacts(input : Types::UpdateQueueMaxContactsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_QUEUE_MAX_CONTACTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the name and description of a queue. At least Name or Description must be provided.
      def update_queue_name(
        instance_id : String,
        queue_id : String,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateQueueNameRequest.new(instance_id: instance_id, queue_id: queue_id, description: description, name: name)
        update_queue_name(input)
      end
      def update_queue_name(input : Types::UpdateQueueNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_QUEUE_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the outbound caller ID name, number, and outbound whisper flow for a specified queue. If the
      # phone number is claimed to a traffic distribution group that was created in the same Region as the
      # Amazon Connect instance where you are calling this API, then you can use a full phone number ARN or
      # a UUID for OutboundCallerIdNumberId . However, if the phone number is claimed to a traffic
      # distribution group that is in one Region, and you are calling this API from an instance in another
      # Amazon Web Services Region that is associated with the traffic distribution group, you must provide
      # a full phone number ARN. If a UUID is provided in this scenario, you will receive a
      # ResourceNotFoundException . Only use the phone number ARN format that doesn't contain instance in
      # the path, for example, arn:aws:connect:us-east-1:1234567890:phone-number/uuid . This is the same ARN
      # format that is returned when you call the ListPhoneNumbersV2 API. If you plan to use IAM policies to
      # allow/deny access to this API for phone number resources claimed to a traffic distribution group,
      # see Allow or Deny queue API actions for phone numbers in a replica Region .
      def update_queue_outbound_caller_config(
        instance_id : String,
        outbound_caller_config : Types::OutboundCallerConfig,
        queue_id : String
      ) : Protocol::Request
        input = Types::UpdateQueueOutboundCallerConfigRequest.new(instance_id: instance_id, outbound_caller_config: outbound_caller_config, queue_id: queue_id)
        update_queue_outbound_caller_config(input)
      end
      def update_queue_outbound_caller_config(input : Types::UpdateQueueOutboundCallerConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_QUEUE_OUTBOUND_CALLER_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the outbound email address Id for a specified queue.
      def update_queue_outbound_email_config(
        instance_id : String,
        outbound_email_config : Types::OutboundEmailConfig,
        queue_id : String
      ) : Protocol::Request
        input = Types::UpdateQueueOutboundEmailConfigRequest.new(instance_id: instance_id, outbound_email_config: outbound_email_config, queue_id: queue_id)
        update_queue_outbound_email_config(input)
      end
      def update_queue_outbound_email_config(input : Types::UpdateQueueOutboundEmailConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_QUEUE_OUTBOUND_EMAIL_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the status of the queue.
      def update_queue_status(
        instance_id : String,
        queue_id : String,
        status : String
      ) : Protocol::Request
        input = Types::UpdateQueueStatusRequest.new(instance_id: instance_id, queue_id: queue_id, status: status)
        update_queue_status(input)
      end
      def update_queue_status(input : Types::UpdateQueueStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_QUEUE_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration settings for the specified quick connect.
      def update_quick_connect_config(
        instance_id : String,
        quick_connect_config : Types::QuickConnectConfig,
        quick_connect_id : String
      ) : Protocol::Request
        input = Types::UpdateQuickConnectConfigRequest.new(instance_id: instance_id, quick_connect_config: quick_connect_config, quick_connect_id: quick_connect_id)
        update_quick_connect_config(input)
      end
      def update_quick_connect_config(input : Types::UpdateQuickConnectConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_QUICK_CONNECT_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the name and description of a quick connect. The request accepts the following data in JSON
      # format. At least Name or Description must be provided.
      def update_quick_connect_name(
        instance_id : String,
        quick_connect_id : String,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateQuickConnectNameRequest.new(instance_id: instance_id, quick_connect_id: quick_connect_id, description: description, name: name)
        update_quick_connect_name(input)
      end
      def update_quick_connect_name(input : Types::UpdateQuickConnectNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_QUICK_CONNECT_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Whether agents with this routing profile will have their routing order calculated based on time
      # since their last inbound contact or longest idle time .
      def update_routing_profile_agent_availability_timer(
        agent_availability_timer : String,
        instance_id : String,
        routing_profile_id : String
      ) : Protocol::Request
        input = Types::UpdateRoutingProfileAgentAvailabilityTimerRequest.new(agent_availability_timer: agent_availability_timer, instance_id: instance_id, routing_profile_id: routing_profile_id)
        update_routing_profile_agent_availability_timer(input)
      end
      def update_routing_profile_agent_availability_timer(input : Types::UpdateRoutingProfileAgentAvailabilityTimerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROUTING_PROFILE_AGENT_AVAILABILITY_TIMER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the channels that agents can handle in the Contact Control Panel (CCP) for a routing
      # profile.
      def update_routing_profile_concurrency(
        instance_id : String,
        media_concurrencies : Array(Types::MediaConcurrency),
        routing_profile_id : String
      ) : Protocol::Request
        input = Types::UpdateRoutingProfileConcurrencyRequest.new(instance_id: instance_id, media_concurrencies: media_concurrencies, routing_profile_id: routing_profile_id)
        update_routing_profile_concurrency(input)
      end
      def update_routing_profile_concurrency(input : Types::UpdateRoutingProfileConcurrencyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROUTING_PROFILE_CONCURRENCY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the default outbound queue of a routing profile.
      def update_routing_profile_default_outbound_queue(
        default_outbound_queue_id : String,
        instance_id : String,
        routing_profile_id : String
      ) : Protocol::Request
        input = Types::UpdateRoutingProfileDefaultOutboundQueueRequest.new(default_outbound_queue_id: default_outbound_queue_id, instance_id: instance_id, routing_profile_id: routing_profile_id)
        update_routing_profile_default_outbound_queue(input)
      end
      def update_routing_profile_default_outbound_queue(input : Types::UpdateRoutingProfileDefaultOutboundQueueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROUTING_PROFILE_DEFAULT_OUTBOUND_QUEUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the name and description of a routing profile. The request accepts the following data in
      # JSON format. At least Name or Description must be provided.
      def update_routing_profile_name(
        instance_id : String,
        routing_profile_id : String,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRoutingProfileNameRequest.new(instance_id: instance_id, routing_profile_id: routing_profile_id, description: description, name: name)
        update_routing_profile_name(input)
      end
      def update_routing_profile_name(input : Types::UpdateRoutingProfileNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROUTING_PROFILE_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the properties associated with a set of queues for a routing profile.
      def update_routing_profile_queues(
        instance_id : String,
        queue_configs : Array(Types::RoutingProfileQueueConfig),
        routing_profile_id : String
      ) : Protocol::Request
        input = Types::UpdateRoutingProfileQueuesRequest.new(instance_id: instance_id, queue_configs: queue_configs, routing_profile_id: routing_profile_id)
        update_routing_profile_queues(input)
      end
      def update_routing_profile_queues(input : Types::UpdateRoutingProfileQueuesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROUTING_PROFILE_QUEUES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a rule for the specified Amazon Connect instance. Use the Rules Function language to code
      # conditions for the rule.
      def update_rule(
        actions : Array(Types::RuleAction),
        function : String,
        instance_id : String,
        name : String,
        publish_status : String,
        rule_id : String
      ) : Protocol::Request
        input = Types::UpdateRuleRequest.new(actions: actions, function: function, instance_id: instance_id, name: name, publish_status: publish_status, rule_id: rule_id)
        update_rule(input)
      end
      def update_rule(input : Types::UpdateRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a security profile. For information about security profiles, see Security Profiles in the
      # Amazon Connect Administrator Guide . For a mapping of the API name and user interface name of the
      # security profile permissions, see List of security profile permissions .
      def update_security_profile(
        instance_id : String,
        security_profile_id : String,
        allowed_access_control_hierarchy_group_id : String? = nil,
        allowed_access_control_tags : Hash(String, String)? = nil,
        allowed_flow_modules : Array(Types::FlowModule)? = nil,
        applications : Array(Types::Application)? = nil,
        description : String? = nil,
        granular_access_control_configuration : Types::GranularAccessControlConfiguration? = nil,
        hierarchy_restricted_resources : Array(String)? = nil,
        permissions : Array(String)? = nil,
        tag_restricted_resources : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateSecurityProfileRequest.new(instance_id: instance_id, security_profile_id: security_profile_id, allowed_access_control_hierarchy_group_id: allowed_access_control_hierarchy_group_id, allowed_access_control_tags: allowed_access_control_tags, allowed_flow_modules: allowed_flow_modules, applications: applications, description: description, granular_access_control_configuration: granular_access_control_configuration, hierarchy_restricted_resources: hierarchy_restricted_resources, permissions: permissions, tag_restricted_resources: tag_restricted_resources)
        update_security_profile(input)
      end
      def update_security_profile(input : Types::UpdateSecurityProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SECURITY_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates details about a specific task template in the specified Amazon Connect instance. This
      # operation does not support partial updates. Instead it does a full update of template content.
      def update_task_template(
        instance_id : String,
        task_template_id : String,
        constraints : Types::TaskTemplateConstraints? = nil,
        contact_flow_id : String? = nil,
        defaults : Types::TaskTemplateDefaults? = nil,
        description : String? = nil,
        fields : Array(Types::TaskTemplateField)? = nil,
        name : String? = nil,
        self_assign_flow_id : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateTaskTemplateRequest.new(instance_id: instance_id, task_template_id: task_template_id, constraints: constraints, contact_flow_id: contact_flow_id, defaults: defaults, description: description, fields: fields, name: name, self_assign_flow_id: self_assign_flow_id, status: status)
        update_task_template(input)
      end
      def update_task_template(input : Types::UpdateTaskTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TASK_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the traffic distribution for a given traffic distribution group. When you shift telephony
      # traffic, also shift agents and/or agent sign-ins to ensure they can handle the calls in the other
      # Region. If you don't shift the agents, voice calls will go to the shifted Region but there won't be
      # any agents available to receive the calls. The SignInConfig distribution is available only on a
      # default TrafficDistributionGroup (see the IsDefault parameter in the TrafficDistributionGroup data
      # type). If you call UpdateTrafficDistribution with a modified SignInConfig and a non-default
      # TrafficDistributionGroup , an InvalidRequestException is returned. For more information about
      # updating a traffic distribution group, see Update telephony traffic distribution across Amazon Web
      # Services Regions in the Amazon Connect Administrator Guide .
      def update_traffic_distribution(
        id : String,
        agent_config : Types::AgentConfig? = nil,
        sign_in_config : Types::SignInConfig? = nil,
        telephony_config : Types::TelephonyConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateTrafficDistributionRequest.new(id: id, agent_config: agent_config, sign_in_config: sign_in_config, telephony_config: telephony_config)
        update_traffic_distribution(input)
      end
      def update_traffic_distribution(input : Types::UpdateTrafficDistributionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TRAFFIC_DISTRIBUTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns the specified hierarchy group to the specified user.
      def update_user_hierarchy(
        instance_id : String,
        user_id : String,
        hierarchy_group_id : String? = nil
      ) : Protocol::Request
        input = Types::UpdateUserHierarchyRequest.new(instance_id: instance_id, user_id: user_id, hierarchy_group_id: hierarchy_group_id)
        update_user_hierarchy(input)
      end
      def update_user_hierarchy(input : Types::UpdateUserHierarchyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER_HIERARCHY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the name of the user hierarchy group.
      def update_user_hierarchy_group_name(
        hierarchy_group_id : String,
        instance_id : String,
        name : String
      ) : Protocol::Request
        input = Types::UpdateUserHierarchyGroupNameRequest.new(hierarchy_group_id: hierarchy_group_id, instance_id: instance_id, name: name)
        update_user_hierarchy_group_name(input)
      end
      def update_user_hierarchy_group_name(input : Types::UpdateUserHierarchyGroupNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER_HIERARCHY_GROUP_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the user hierarchy structure: add, remove, and rename user hierarchy levels.
      def update_user_hierarchy_structure(
        hierarchy_structure : Types::HierarchyStructureUpdate,
        instance_id : String
      ) : Protocol::Request
        input = Types::UpdateUserHierarchyStructureRequest.new(hierarchy_structure: hierarchy_structure, instance_id: instance_id)
        update_user_hierarchy_structure(input)
      end
      def update_user_hierarchy_structure(input : Types::UpdateUserHierarchyStructureRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER_HIERARCHY_STRUCTURE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the identity information for the specified user. We strongly recommend limiting who has the
      # ability to invoke UpdateUserIdentityInfo . Someone with that ability can change the login
      # credentials of other users by changing their email address. This poses a security risk to your
      # organization. They can change the email address of a user to the attacker's email address, and then
      # reset the password through email. For more information, see Best Practices for Security Profiles in
      # the Amazon Connect Administrator Guide .
      def update_user_identity_info(
        identity_info : Types::UserIdentityInfo,
        instance_id : String,
        user_id : String
      ) : Protocol::Request
        input = Types::UpdateUserIdentityInfoRequest.new(identity_info: identity_info, instance_id: instance_id, user_id: user_id)
        update_user_identity_info(input)
      end
      def update_user_identity_info(input : Types::UpdateUserIdentityInfoRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER_IDENTITY_INFO, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the phone configuration settings for the specified user.
      def update_user_phone_config(
        instance_id : String,
        phone_config : Types::UserPhoneConfig,
        user_id : String
      ) : Protocol::Request
        input = Types::UpdateUserPhoneConfigRequest.new(instance_id: instance_id, phone_config: phone_config, user_id: user_id)
        update_user_phone_config(input)
      end
      def update_user_phone_config(input : Types::UpdateUserPhoneConfigRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER_PHONE_CONFIG, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the properties associated with the proficiencies of a user.
      def update_user_proficiencies(
        instance_id : String,
        user_id : String,
        user_proficiencies : Array(Types::UserProficiency)
      ) : Protocol::Request
        input = Types::UpdateUserProficienciesRequest.new(instance_id: instance_id, user_id: user_id, user_proficiencies: user_proficiencies)
        update_user_proficiencies(input)
      end
      def update_user_proficiencies(input : Types::UpdateUserProficienciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER_PROFICIENCIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns the specified routing profile to the specified user.
      def update_user_routing_profile(
        instance_id : String,
        routing_profile_id : String,
        user_id : String
      ) : Protocol::Request
        input = Types::UpdateUserRoutingProfileRequest.new(instance_id: instance_id, routing_profile_id: routing_profile_id, user_id: user_id)
        update_user_routing_profile(input)
      end
      def update_user_routing_profile(input : Types::UpdateUserRoutingProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER_ROUTING_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Assigns the specified security profiles to the specified user.
      def update_user_security_profiles(
        instance_id : String,
        security_profile_ids : Array(String),
        user_id : String
      ) : Protocol::Request
        input = Types::UpdateUserSecurityProfilesRequest.new(instance_id: instance_id, security_profile_ids: security_profile_ids, user_id: user_id)
        update_user_security_profiles(input)
      end
      def update_user_security_profiles(input : Types::UpdateUserSecurityProfilesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USER_SECURITY_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the view content of the given view identifier in the specified Amazon Connect instance. It
      # performs content validation if Status is set to SAVED and performs full content validation if Status
      # is PUBLISHED . Note that the $SAVED alias' content will always be updated, but the $LATEST alias'
      # content will only be updated if Status is PUBLISHED .
      def update_view_content(
        content : Types::ViewInputContent,
        instance_id : String,
        status : String,
        view_id : String
      ) : Protocol::Request
        input = Types::UpdateViewContentRequest.new(content: content, instance_id: instance_id, status: status, view_id: view_id)
        update_view_content(input)
      end
      def update_view_content(input : Types::UpdateViewContentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VIEW_CONTENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the view metadata. Note that either Name or Description must be provided.
      def update_view_metadata(
        instance_id : String,
        view_id : String,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateViewMetadataRequest.new(instance_id: instance_id, view_id: view_id, description: description, name: name)
        update_view_metadata(input)
      end
      def update_view_metadata(input : Types::UpdateViewMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VIEW_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the metadata of a workspace, such as its name and description.
      def update_workspace_metadata(
        instance_id : String,
        workspace_id : String,
        description : String? = nil,
        name : String? = nil,
        title : String? = nil
      ) : Protocol::Request
        input = Types::UpdateWorkspaceMetadataRequest.new(instance_id: instance_id, workspace_id: workspace_id, description: description, name: name, title: title)
        update_workspace_metadata(input)
      end
      def update_workspace_metadata(input : Types::UpdateWorkspaceMetadataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKSPACE_METADATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of a page in a workspace, including the associated view and input data.
      def update_workspace_page(
        instance_id : String,
        page : String,
        workspace_id : String,
        input_data : String? = nil,
        new_page : String? = nil,
        resource_arn : String? = nil,
        slug : String? = nil
      ) : Protocol::Request
        input = Types::UpdateWorkspacePageRequest.new(instance_id: instance_id, page: page, workspace_id: workspace_id, input_data: input_data, new_page: new_page, resource_arn: resource_arn, slug: slug)
        update_workspace_page(input)
      end
      def update_workspace_page(input : Types::UpdateWorkspacePageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKSPACE_PAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the theme configuration for a workspace, including colors and styling.
      def update_workspace_theme(
        instance_id : String,
        workspace_id : String,
        theme : Types::WorkspaceTheme? = nil
      ) : Protocol::Request
        input = Types::UpdateWorkspaceThemeRequest.new(instance_id: instance_id, workspace_id: workspace_id, theme: theme)
        update_workspace_theme(input)
      end
      def update_workspace_theme(input : Types::UpdateWorkspaceThemeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKSPACE_THEME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the visibility setting of a workspace, controlling whether it is available to all users,
      # assigned users only, or none.
      def update_workspace_visibility(
        instance_id : String,
        visibility : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::UpdateWorkspaceVisibilityRequest.new(instance_id: instance_id, visibility: visibility, workspace_id: workspace_id)
        update_workspace_visibility(input)
      end
      def update_workspace_visibility(input : Types::UpdateWorkspaceVisibilityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKSPACE_VISIBILITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
