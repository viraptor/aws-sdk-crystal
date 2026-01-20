module Aws
  module SESv2
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

      # Retrieves batches of metric data collected based on your sending activity. You can execute this
      # operation no more than 16 times per second, and with at most 160 queries from the batches per second
      # (cumulative).

      def batch_get_metric_data(
        queries : Array(Types::BatchGetMetricDataQuery)
      ) : Protocol::Request
        input = Types::BatchGetMetricDataRequest.new(queries: queries)
        batch_get_metric_data(input)
      end

      def batch_get_metric_data(input : Types::BatchGetMetricDataRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_METRIC_DATA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels an export job.

      def cancel_export_job(
        job_id : String
      ) : Protocol::Request
        input = Types::CancelExportJobRequest.new(job_id: job_id)
        cancel_export_job(input)
      end

      def cancel_export_job(input : Types::CancelExportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_EXPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a configuration set. Configuration sets are groups of rules that you can apply to the emails
      # that you send. You apply a configuration set to an email by specifying the name of the configuration
      # set when you call the Amazon SES API v2. When you apply a configuration set to an email, all of the
      # rules in that configuration set are applied to the email.

      def create_configuration_set(
        configuration_set_name : String,
        archiving_options : Types::ArchivingOptions? = nil,
        delivery_options : Types::DeliveryOptions? = nil,
        reputation_options : Types::ReputationOptions? = nil,
        sending_options : Types::SendingOptions? = nil,
        suppression_options : Types::SuppressionOptions? = nil,
        tags : Array(Types::Tag)? = nil,
        tracking_options : Types::TrackingOptions? = nil,
        vdm_options : Types::VdmOptions? = nil
      ) : Protocol::Request
        input = Types::CreateConfigurationSetRequest.new(configuration_set_name: configuration_set_name, archiving_options: archiving_options, delivery_options: delivery_options, reputation_options: reputation_options, sending_options: sending_options, suppression_options: suppression_options, tags: tags, tracking_options: tracking_options, vdm_options: vdm_options)
        create_configuration_set(input)
      end

      def create_configuration_set(input : Types::CreateConfigurationSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIGURATION_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create an event destination. Events include message sends, deliveries, opens, clicks, bounces, and
      # complaints. Event destinations are places that you can send information about these events to. For
      # example, you can send event data to Amazon EventBridge and associate a rule to send the event to the
      # specified target. A single configuration set can include more than one event destination.

      def create_configuration_set_event_destination(
        configuration_set_name : String,
        event_destination : Types::EventDestinationDefinition,
        event_destination_name : String
      ) : Protocol::Request
        input = Types::CreateConfigurationSetEventDestinationRequest.new(configuration_set_name: configuration_set_name, event_destination: event_destination, event_destination_name: event_destination_name)
        create_configuration_set_event_destination(input)
      end

      def create_configuration_set_event_destination(input : Types::CreateConfigurationSetEventDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIGURATION_SET_EVENT_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a contact, which is an end-user who is receiving the email, and adds them to a contact list.

      def create_contact(
        contact_list_name : String,
        email_address : String,
        attributes_data : String? = nil,
        topic_preferences : Array(Types::TopicPreference)? = nil,
        unsubscribe_all : Bool? = nil
      ) : Protocol::Request
        input = Types::CreateContactRequest.new(contact_list_name: contact_list_name, email_address: email_address, attributes_data: attributes_data, topic_preferences: topic_preferences, unsubscribe_all: unsubscribe_all)
        create_contact(input)
      end

      def create_contact(input : Types::CreateContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a contact list.

      def create_contact_list(
        contact_list_name : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil,
        topics : Array(Types::Topic)? = nil
      ) : Protocol::Request
        input = Types::CreateContactListRequest.new(contact_list_name: contact_list_name, description: description, tags: tags, topics: topics)
        create_contact_list(input)
      end

      def create_contact_list(input : Types::CreateContactListRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONTACT_LIST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new custom verification email template. For more information about custom verification
      # email templates, see Using custom verification email templates in the Amazon SES Developer Guide .
      # You can execute this operation no more than once per second.

      def create_custom_verification_email_template(
        failure_redirection_url : String,
        from_email_address : String,
        success_redirection_url : String,
        template_content : String,
        template_name : String,
        template_subject : String,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateCustomVerificationEmailTemplateRequest.new(failure_redirection_url: failure_redirection_url, from_email_address: from_email_address, success_redirection_url: success_redirection_url, template_content: template_content, template_name: template_name, template_subject: template_subject, tags: tags)
        create_custom_verification_email_template(input)
      end

      def create_custom_verification_email_template(input : Types::CreateCustomVerificationEmailTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CUSTOM_VERIFICATION_EMAIL_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a new pool of dedicated IP addresses. A pool can include one or more dedicated IP addresses
      # that are associated with your Amazon Web Services account. You can associate a pool with a
      # configuration set. When you send an email that uses that configuration set, the message is sent from
      # one of the addresses in the associated pool.

      def create_dedicated_ip_pool(
        pool_name : String,
        scaling_mode : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateDedicatedIpPoolRequest.new(pool_name: pool_name, scaling_mode: scaling_mode, tags: tags)
        create_dedicated_ip_pool(input)
      end

      def create_dedicated_ip_pool(input : Types::CreateDedicatedIpPoolRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DEDICATED_IP_POOL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a new predictive inbox placement test. Predictive inbox placement tests can help you predict
      # how your messages will be handled by various email providers around the world. When you perform a
      # predictive inbox placement test, you provide a sample message that contains the content that you
      # plan to send to your customers. Amazon SES then sends that message to special email addresses spread
      # across several major email providers. After about 24 hours, the test is complete, and you can use
      # the GetDeliverabilityTestReport operation to view the results of the test.

      def create_deliverability_test_report(
        content : Types::EmailContent,
        from_email_address : String,
        report_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateDeliverabilityTestReportRequest.new(content: content, from_email_address: from_email_address, report_name: report_name, tags: tags)
        create_deliverability_test_report(input)
      end

      def create_deliverability_test_report(input : Types::CreateDeliverabilityTestReportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DELIVERABILITY_TEST_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts the process of verifying an email identity. An identity is an email address or domain that
      # you use when you send email. Before you can use an identity to send email, you first have to verify
      # it. By verifying an identity, you demonstrate that you're the owner of the identity, and that you've
      # given Amazon SES API v2 permission to send email from the identity. When you verify an email
      # address, Amazon SES sends an email to the address. Your email address is verified as soon as you
      # follow the link in the verification email. When you verify a domain without specifying the
      # DkimSigningAttributes object, this operation provides a set of DKIM tokens. You can convert these
      # tokens into CNAME records, which you then add to the DNS configuration for your domain. Your domain
      # is verified when Amazon SES detects these records in the DNS configuration for your domain. This
      # verification method is known as Easy DKIM . Alternatively, you can perform the verification process
      # by providing your own public-private key pair. This verification method is known as Bring Your Own
      # DKIM (BYODKIM). To use BYODKIM, your call to the CreateEmailIdentity operation has to include the
      # DkimSigningAttributes object. When you specify this object, you provide a selector (a component of
      # the DNS record name that identifies the public key to use for DKIM authentication) and a private
      # key. When you verify a domain, this operation provides a set of DKIM tokens, which you can convert
      # into CNAME tokens. You add these CNAME tokens to the DNS configuration for your domain. Your domain
      # is verified when Amazon SES detects these records in the DNS configuration for your domain. For some
      # DNS providers, it can take 72 hours or more to complete the domain verification process.
      # Additionally, you can associate an existing configuration set with the email identity that you're
      # verifying.

      def create_email_identity(
        email_identity : String,
        configuration_set_name : String? = nil,
        dkim_signing_attributes : Types::DkimSigningAttributes? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateEmailIdentityRequest.new(email_identity: email_identity, configuration_set_name: configuration_set_name, dkim_signing_attributes: dkim_signing_attributes, tags: tags)
        create_email_identity(input)
      end

      def create_email_identity(input : Types::CreateEmailIdentityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EMAIL_IDENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates the specified sending authorization policy for the given identity (an email address or a
      # domain). This API is for the identity owner only. If you have not verified the identity, this API
      # will return an error. Sending authorization is a feature that enables an identity owner to authorize
      # other senders to use its identities. For information about using sending authorization, see the
      # Amazon SES Developer Guide . You can execute this operation no more than once per second.

      def create_email_identity_policy(
        email_identity : String,
        policy : String,
        policy_name : String
      ) : Protocol::Request
        input = Types::CreateEmailIdentityPolicyRequest.new(email_identity: email_identity, policy: policy, policy_name: policy_name)
        create_email_identity_policy(input)
      end

      def create_email_identity_policy(input : Types::CreateEmailIdentityPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EMAIL_IDENTITY_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an email template. Email templates enable you to send personalized email to one or more
      # destinations in a single API operation. For more information, see the Amazon SES Developer Guide .
      # You can execute this operation no more than once per second.

      def create_email_template(
        template_content : Types::EmailTemplateContent,
        template_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateEmailTemplateRequest.new(template_content: template_content, template_name: template_name, tags: tags)
        create_email_template(input)
      end

      def create_email_template(input : Types::CreateEmailTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EMAIL_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an export job for a data source and destination. You can execute this operation no more than
      # once per second.

      def create_export_job(
        export_data_source : Types::ExportDataSource,
        export_destination : Types::ExportDestination
      ) : Protocol::Request
        input = Types::CreateExportJobRequest.new(export_data_source: export_data_source, export_destination: export_destination)
        create_export_job(input)
      end

      def create_export_job(input : Types::CreateExportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EXPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an import job for a data destination.

      def create_import_job(
        import_data_source : Types::ImportDataSource,
        import_destination : Types::ImportDestination
      ) : Protocol::Request
        input = Types::CreateImportJobRequest.new(import_data_source: import_data_source, import_destination: import_destination)
        create_import_job(input)
      end

      def create_import_job(input : Types::CreateImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a multi-region endpoint (global-endpoint). The primary region is going to be the AWS-Region
      # where the operation is executed. The secondary region has to be provided in request's parameters.
      # From the data flow standpoint there is no difference between primary and secondary regions - sending
      # traffic will be split equally between the two. The primary region is the region where the resource
      # has been created and where it can be managed.

      def create_multi_region_endpoint(
        details : Types::Details,
        endpoint_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateMultiRegionEndpointRequest.new(details: details, endpoint_name: endpoint_name, tags: tags)
        create_multi_region_endpoint(input)
      end

      def create_multi_region_endpoint(input : Types::CreateMultiRegionEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MULTI_REGION_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a tenant. Tenants are logical containers that group related SES resources together. Each
      # tenant can have its own set of resources like email identities, configuration sets, and templates,
      # along with reputation metrics and sending status. This helps isolate and manage email sending for
      # different customers or business units within your Amazon SES API v2 account.

      def create_tenant(
        tenant_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateTenantRequest.new(tenant_name: tenant_name, tags: tags)
        create_tenant(input)
      end

      def create_tenant(input : Types::CreateTenantRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TENANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associate a resource with a tenant. Resources can be email identities, configuration sets, or email
      # templates. When you associate a resource with a tenant, you can use that resource when sending
      # emails on behalf of that tenant. A single resource can be associated with multiple tenants, allowing
      # for resource sharing across different tenants while maintaining isolation in email sending
      # operations.

      def create_tenant_resource_association(
        resource_arn : String,
        tenant_name : String
      ) : Protocol::Request
        input = Types::CreateTenantResourceAssociationRequest.new(resource_arn: resource_arn, tenant_name: tenant_name)
        create_tenant_resource_association(input)
      end

      def create_tenant_resource_association(input : Types::CreateTenantResourceAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TENANT_RESOURCE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an existing configuration set. Configuration sets are groups of rules that you can apply to
      # the emails you send. You apply a configuration set to an email by including a reference to the
      # configuration set in the headers of the email. When you apply a configuration set to an email, all
      # of the rules in that configuration set are applied to the email.

      def delete_configuration_set(
        configuration_set_name : String
      ) : Protocol::Request
        input = Types::DeleteConfigurationSetRequest.new(configuration_set_name: configuration_set_name)
        delete_configuration_set(input)
      end

      def delete_configuration_set(input : Types::DeleteConfigurationSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURATION_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an event destination. Events include message sends, deliveries, opens, clicks, bounces, and
      # complaints. Event destinations are places that you can send information about these events to. For
      # example, you can send event data to Amazon EventBridge and associate a rule to send the event to the
      # specified target.

      def delete_configuration_set_event_destination(
        configuration_set_name : String,
        event_destination_name : String
      ) : Protocol::Request
        input = Types::DeleteConfigurationSetEventDestinationRequest.new(configuration_set_name: configuration_set_name, event_destination_name: event_destination_name)
        delete_configuration_set_event_destination(input)
      end

      def delete_configuration_set_event_destination(input : Types::DeleteConfigurationSetEventDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURATION_SET_EVENT_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a contact from a contact list.

      def delete_contact(
        contact_list_name : String,
        email_address : String
      ) : Protocol::Request
        input = Types::DeleteContactRequest.new(contact_list_name: contact_list_name, email_address: email_address)
        delete_contact(input)
      end

      def delete_contact(input : Types::DeleteContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a contact list and all of the contacts on that list.

      def delete_contact_list(
        contact_list_name : String
      ) : Protocol::Request
        input = Types::DeleteContactListRequest.new(contact_list_name: contact_list_name)
        delete_contact_list(input)
      end

      def delete_contact_list(input : Types::DeleteContactListRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONTACT_LIST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing custom verification email template. For more information about custom
      # verification email templates, see Using custom verification email templates in the Amazon SES
      # Developer Guide . You can execute this operation no more than once per second.

      def delete_custom_verification_email_template(
        template_name : String
      ) : Protocol::Request
        input = Types::DeleteCustomVerificationEmailTemplateRequest.new(template_name: template_name)
        delete_custom_verification_email_template(input)
      end

      def delete_custom_verification_email_template(input : Types::DeleteCustomVerificationEmailTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CUSTOM_VERIFICATION_EMAIL_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a dedicated IP pool.

      def delete_dedicated_ip_pool(
        pool_name : String
      ) : Protocol::Request
        input = Types::DeleteDedicatedIpPoolRequest.new(pool_name: pool_name)
        delete_dedicated_ip_pool(input)
      end

      def delete_dedicated_ip_pool(input : Types::DeleteDedicatedIpPoolRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DEDICATED_IP_POOL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an email identity. An identity can be either an email address or a domain name.

      def delete_email_identity(
        email_identity : String
      ) : Protocol::Request
        input = Types::DeleteEmailIdentityRequest.new(email_identity: email_identity)
        delete_email_identity(input)
      end

      def delete_email_identity(input : Types::DeleteEmailIdentityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EMAIL_IDENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified sending authorization policy for the given identity (an email address or a
      # domain). This API returns successfully even if a policy with the specified name does not exist. This
      # API is for the identity owner only. If you have not verified the identity, this API will return an
      # error. Sending authorization is a feature that enables an identity owner to authorize other senders
      # to use its identities. For information about using sending authorization, see the Amazon SES
      # Developer Guide . You can execute this operation no more than once per second.

      def delete_email_identity_policy(
        email_identity : String,
        policy_name : String
      ) : Protocol::Request
        input = Types::DeleteEmailIdentityPolicyRequest.new(email_identity: email_identity, policy_name: policy_name)
        delete_email_identity_policy(input)
      end

      def delete_email_identity_policy(input : Types::DeleteEmailIdentityPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EMAIL_IDENTITY_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an email template. You can execute this operation no more than once per second.

      def delete_email_template(
        template_name : String
      ) : Protocol::Request
        input = Types::DeleteEmailTemplateRequest.new(template_name: template_name)
        delete_email_template(input)
      end

      def delete_email_template(input : Types::DeleteEmailTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EMAIL_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a multi-region endpoint (global-endpoint). Only multi-region endpoints (global-endpoints)
      # whose primary region is the AWS-Region where operation is executed can be deleted.

      def delete_multi_region_endpoint(
        endpoint_name : String
      ) : Protocol::Request
        input = Types::DeleteMultiRegionEndpointRequest.new(endpoint_name: endpoint_name)
        delete_multi_region_endpoint(input)
      end

      def delete_multi_region_endpoint(input : Types::DeleteMultiRegionEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MULTI_REGION_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes an email address from the suppression list for your account.

      def delete_suppressed_destination(
        email_address : String
      ) : Protocol::Request
        input = Types::DeleteSuppressedDestinationRequest.new(email_address: email_address)
        delete_suppressed_destination(input)
      end

      def delete_suppressed_destination(input : Types::DeleteSuppressedDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SUPPRESSED_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an existing tenant. When you delete a tenant, its associations with resources are removed,
      # but the resources themselves are not deleted.

      def delete_tenant(
        tenant_name : String
      ) : Protocol::Request
        input = Types::DeleteTenantRequest.new(tenant_name: tenant_name)
        delete_tenant(input)
      end

      def delete_tenant(input : Types::DeleteTenantRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TENANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an association between a tenant and a resource. When you delete a tenant-resource
      # association, the resource itself is not deleted, only its association with the specific tenant is
      # removed. After removal, the resource will no longer be available for use with that tenant's email
      # sending operations.

      def delete_tenant_resource_association(
        resource_arn : String,
        tenant_name : String
      ) : Protocol::Request
        input = Types::DeleteTenantResourceAssociationRequest.new(resource_arn: resource_arn, tenant_name: tenant_name)
        delete_tenant_resource_association(input)
      end

      def delete_tenant_resource_association(input : Types::DeleteTenantResourceAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TENANT_RESOURCE_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Obtain information about the email-sending status and capabilities of your Amazon SES account in the
      # current Amazon Web Services Region.

      def get_account : Protocol::Request
        input = Types::GetAccountRequest.new
        get_account(input)
      end

      def get_account(input : Types::GetAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve a list of the blacklists that your dedicated IP addresses appear on.

      def get_blacklist_reports(
        blacklist_item_names : Array(String)
      ) : Protocol::Request
        input = Types::GetBlacklistReportsRequest.new(blacklist_item_names: blacklist_item_names)
        get_blacklist_reports(input)
      end

      def get_blacklist_reports(input : Types::GetBlacklistReportsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BLACKLIST_REPORTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get information about an existing configuration set, including the dedicated IP pool that it's
      # associated with, whether or not it's enabled for sending email, and more. Configuration sets are
      # groups of rules that you can apply to the emails you send. You apply a configuration set to an email
      # by including a reference to the configuration set in the headers of the email. When you apply a
      # configuration set to an email, all of the rules in that configuration set are applied to the email.

      def get_configuration_set(
        configuration_set_name : String
      ) : Protocol::Request
        input = Types::GetConfigurationSetRequest.new(configuration_set_name: configuration_set_name)
        get_configuration_set(input)
      end

      def get_configuration_set(input : Types::GetConfigurationSetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURATION_SET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve a list of event destinations that are associated with a configuration set. Events include
      # message sends, deliveries, opens, clicks, bounces, and complaints. Event destinations are places
      # that you can send information about these events to. For example, you can send event data to Amazon
      # EventBridge and associate a rule to send the event to the specified target.

      def get_configuration_set_event_destinations(
        configuration_set_name : String
      ) : Protocol::Request
        input = Types::GetConfigurationSetEventDestinationsRequest.new(configuration_set_name: configuration_set_name)
        get_configuration_set_event_destinations(input)
      end

      def get_configuration_set_event_destinations(input : Types::GetConfigurationSetEventDestinationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURATION_SET_EVENT_DESTINATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a contact from a contact list.

      def get_contact(
        contact_list_name : String,
        email_address : String
      ) : Protocol::Request
        input = Types::GetContactRequest.new(contact_list_name: contact_list_name, email_address: email_address)
        get_contact(input)
      end

      def get_contact(input : Types::GetContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns contact list metadata. It does not return any information about the contacts present in the
      # list.

      def get_contact_list(
        contact_list_name : String
      ) : Protocol::Request
        input = Types::GetContactListRequest.new(contact_list_name: contact_list_name)
        get_contact_list(input)
      end

      def get_contact_list(input : Types::GetContactListRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONTACT_LIST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the custom email verification template for the template name you specify. For more
      # information about custom verification email templates, see Using custom verification email templates
      # in the Amazon SES Developer Guide . You can execute this operation no more than once per second.

      def get_custom_verification_email_template(
        template_name : String
      ) : Protocol::Request
        input = Types::GetCustomVerificationEmailTemplateRequest.new(template_name: template_name)
        get_custom_verification_email_template(input)
      end

      def get_custom_verification_email_template(input : Types::GetCustomVerificationEmailTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CUSTOM_VERIFICATION_EMAIL_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get information about a dedicated IP address, including the name of the dedicated IP pool that it's
      # associated with, as well information about the automatic warm-up process for the address.

      def get_dedicated_ip(
        ip : String
      ) : Protocol::Request
        input = Types::GetDedicatedIpRequest.new(ip: ip)
        get_dedicated_ip(input)
      end

      def get_dedicated_ip(input : Types::GetDedicatedIpRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEDICATED_IP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve information about the dedicated pool.

      def get_dedicated_ip_pool(
        pool_name : String
      ) : Protocol::Request
        input = Types::GetDedicatedIpPoolRequest.new(pool_name: pool_name)
        get_dedicated_ip_pool(input)
      end

      def get_dedicated_ip_pool(input : Types::GetDedicatedIpPoolRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEDICATED_IP_POOL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the dedicated IP addresses that are associated with your Amazon Web Services account.

      def get_dedicated_ips(
        next_token : String? = nil,
        page_size : Int32? = nil,
        pool_name : String? = nil
      ) : Protocol::Request
        input = Types::GetDedicatedIpsRequest.new(next_token: next_token, page_size: page_size, pool_name: pool_name)
        get_dedicated_ips(input)
      end

      def get_dedicated_ips(input : Types::GetDedicatedIpsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEDICATED_IPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve information about the status of the Deliverability dashboard for your account. When the
      # Deliverability dashboard is enabled, you gain access to reputation, deliverability, and other
      # metrics for the domains that you use to send email. You also gain the ability to perform predictive
      # inbox placement tests. When you use the Deliverability dashboard, you pay a monthly subscription
      # charge, in addition to any other fees that you accrue by using Amazon SES and other Amazon Web
      # Services services. For more information about the features and cost of a Deliverability dashboard
      # subscription, see Amazon SES Pricing .

      def get_deliverability_dashboard_options : Protocol::Request
        input = Types::GetDeliverabilityDashboardOptionsRequest.new
        get_deliverability_dashboard_options(input)
      end

      def get_deliverability_dashboard_options(input : Types::GetDeliverabilityDashboardOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DELIVERABILITY_DASHBOARD_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve the results of a predictive inbox placement test.

      def get_deliverability_test_report(
        report_id : String
      ) : Protocol::Request
        input = Types::GetDeliverabilityTestReportRequest.new(report_id: report_id)
        get_deliverability_test_report(input)
      end

      def get_deliverability_test_report(input : Types::GetDeliverabilityTestReportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DELIVERABILITY_TEST_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve all the deliverability data for a specific campaign. This data is available for a campaign
      # only if the campaign sent email by using a domain that the Deliverability dashboard is enabled for.

      def get_domain_deliverability_campaign(
        campaign_id : String
      ) : Protocol::Request
        input = Types::GetDomainDeliverabilityCampaignRequest.new(campaign_id: campaign_id)
        get_domain_deliverability_campaign(input)
      end

      def get_domain_deliverability_campaign(input : Types::GetDomainDeliverabilityCampaignRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOMAIN_DELIVERABILITY_CAMPAIGN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve inbox placement and engagement rates for the domains that you use to send email.

      def get_domain_statistics_report(
        domain : String,
        end_date : Time,
        start_date : Time
      ) : Protocol::Request
        input = Types::GetDomainStatisticsReportRequest.new(domain: domain, end_date: end_date, start_date: start_date)
        get_domain_statistics_report(input)
      end

      def get_domain_statistics_report(input : Types::GetDomainStatisticsReportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOMAIN_STATISTICS_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides validation insights about a specific email address, including syntax validation, DNS record
      # checks, mailbox existence, and other deliverability factors.

      def get_email_address_insights(
        email_address : String
      ) : Protocol::Request
        input = Types::GetEmailAddressInsightsRequest.new(email_address: email_address)
        get_email_address_insights(input)
      end

      def get_email_address_insights(input : Types::GetEmailAddressInsightsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EMAIL_ADDRESS_INSIGHTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides information about a specific identity, including the identity's verification status,
      # sending authorization policies, its DKIM authentication status, and its custom Mail-From settings.

      def get_email_identity(
        email_identity : String
      ) : Protocol::Request
        input = Types::GetEmailIdentityRequest.new(email_identity: email_identity)
        get_email_identity(input)
      end

      def get_email_identity(input : Types::GetEmailIdentityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EMAIL_IDENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the requested sending authorization policies for the given identity (an email address or a
      # domain). The policies are returned as a map of policy names to policy contents. You can retrieve a
      # maximum of 20 policies at a time. This API is for the identity owner only. If you have not verified
      # the identity, this API will return an error. Sending authorization is a feature that enables an
      # identity owner to authorize other senders to use its identities. For information about using sending
      # authorization, see the Amazon SES Developer Guide . You can execute this operation no more than once
      # per second.

      def get_email_identity_policies(
        email_identity : String
      ) : Protocol::Request
        input = Types::GetEmailIdentityPoliciesRequest.new(email_identity: email_identity)
        get_email_identity_policies(input)
      end

      def get_email_identity_policies(input : Types::GetEmailIdentityPoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EMAIL_IDENTITY_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays the template object (which includes the subject line, HTML part and text part) for the
      # template you specify. You can execute this operation no more than once per second.

      def get_email_template(
        template_name : String
      ) : Protocol::Request
        input = Types::GetEmailTemplateRequest.new(template_name: template_name)
        get_email_template(input)
      end

      def get_email_template(input : Types::GetEmailTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EMAIL_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides information about an export job.

      def get_export_job(
        job_id : String
      ) : Protocol::Request
        input = Types::GetExportJobRequest.new(job_id: job_id)
        get_export_job(input)
      end

      def get_export_job(input : Types::GetExportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EXPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides information about an import job.

      def get_import_job(
        job_id : String
      ) : Protocol::Request
        input = Types::GetImportJobRequest.new(job_id: job_id)
        get_import_job(input)
      end

      def get_import_job(input : Types::GetImportJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IMPORT_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides information about a specific message, including the from address, the subject, the
      # recipient address, email tags, as well as events associated with the message. You can execute this
      # operation no more than once per second.

      def get_message_insights(
        message_id : String
      ) : Protocol::Request
        input = Types::GetMessageInsightsRequest.new(message_id: message_id)
        get_message_insights(input)
      end

      def get_message_insights(input : Types::GetMessageInsightsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MESSAGE_INSIGHTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Displays the multi-region endpoint (global-endpoint) configuration. Only multi-region endpoints
      # (global-endpoints) whose primary region is the AWS-Region where operation is executed can be
      # displayed.

      def get_multi_region_endpoint(
        endpoint_name : String
      ) : Protocol::Request
        input = Types::GetMultiRegionEndpointRequest.new(endpoint_name: endpoint_name)
        get_multi_region_endpoint(input)
      end

      def get_multi_region_endpoint(input : Types::GetMultiRegionEndpointRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MULTI_REGION_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve information about a specific reputation entity, including its reputation management policy,
      # customer-managed status, Amazon Web Services Amazon SES-managed status, and aggregate sending
      # status. Reputation entities represent resources in your Amazon SES account that have reputation
      # tracking and management capabilities. The reputation impact reflects the highest impact reputation
      # finding for the entity. Reputation findings can be retrieved using the ListRecommendations
      # operation.

      def get_reputation_entity(
        reputation_entity_reference : String,
        reputation_entity_type : String
      ) : Protocol::Request
        input = Types::GetReputationEntityRequest.new(reputation_entity_reference: reputation_entity_reference, reputation_entity_type: reputation_entity_type)
        get_reputation_entity(input)
      end

      def get_reputation_entity(input : Types::GetReputationEntityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REPUTATION_ENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a specific email address that's on the suppression list for your
      # account.

      def get_suppressed_destination(
        email_address : String
      ) : Protocol::Request
        input = Types::GetSuppressedDestinationRequest.new(email_address: email_address)
        get_suppressed_destination(input)
      end

      def get_suppressed_destination(input : Types::GetSuppressedDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SUPPRESSED_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get information about a specific tenant, including the tenant's name, ID, ARN, creation timestamp,
      # tags, and sending status.

      def get_tenant(
        tenant_name : String
      ) : Protocol::Request
        input = Types::GetTenantRequest.new(tenant_name: tenant_name)
        get_tenant(input)
      end

      def get_tenant(input : Types::GetTenantRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TENANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all of the configuration sets associated with your account in the current region. Configuration
      # sets are groups of rules that you can apply to the emails you send. You apply a configuration set to
      # an email by including a reference to the configuration set in the headers of the email. When you
      # apply a configuration set to an email, all of the rules in that configuration set are applied to the
      # email.

      def list_configuration_sets(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListConfigurationSetsRequest.new(next_token: next_token, page_size: page_size)
        list_configuration_sets(input)
      end

      def list_configuration_sets(input : Types::ListConfigurationSetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGURATION_SETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the contact lists available. If your output includes a "NextToken" field with a string
      # value, this indicates there may be additional contacts on the filtered list - regardless of the
      # number of contacts returned.

      def list_contact_lists(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListContactListsRequest.new(next_token: next_token, page_size: page_size)
        list_contact_lists(input)
      end

      def list_contact_lists(input : Types::ListContactListsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTACT_LISTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the contacts present in a specific contact list.

      def list_contacts(
        contact_list_name : String,
        filter : Types::ListContactsFilter? = nil,
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListContactsRequest.new(contact_list_name: contact_list_name, filter: filter, next_token: next_token, page_size: page_size)
        list_contacts(input)
      end

      def list_contacts(input : Types::ListContactsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONTACTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the existing custom verification email templates for your account in the current Amazon Web
      # Services Region. For more information about custom verification email templates, see Using custom
      # verification email templates in the Amazon SES Developer Guide . You can execute this operation no
      # more than once per second.

      def list_custom_verification_email_templates(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListCustomVerificationEmailTemplatesRequest.new(next_token: next_token, page_size: page_size)
        list_custom_verification_email_templates(input)
      end

      def list_custom_verification_email_templates(input : Types::ListCustomVerificationEmailTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CUSTOM_VERIFICATION_EMAIL_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all of the dedicated IP pools that exist in your Amazon Web Services account in the current
      # Region.

      def list_dedicated_ip_pools(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListDedicatedIpPoolsRequest.new(next_token: next_token, page_size: page_size)
        list_dedicated_ip_pools(input)
      end

      def list_dedicated_ip_pools(input : Types::ListDedicatedIpPoolsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DEDICATED_IP_POOLS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Show a list of the predictive inbox placement tests that you've performed, regardless of their
      # statuses. For predictive inbox placement tests that are complete, you can use the
      # GetDeliverabilityTestReport operation to view the results.

      def list_deliverability_test_reports(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListDeliverabilityTestReportsRequest.new(next_token: next_token, page_size: page_size)
        list_deliverability_test_reports(input)
      end

      def list_deliverability_test_reports(input : Types::ListDeliverabilityTestReportsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DELIVERABILITY_TEST_REPORTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve deliverability data for all the campaigns that used a specific domain to send email during
      # a specified time range. This data is available for a domain only if you enabled the Deliverability
      # dashboard for the domain.

      def list_domain_deliverability_campaigns(
        end_date : Time,
        start_date : Time,
        subscribed_domain : String,
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListDomainDeliverabilityCampaignsRequest.new(end_date: end_date, start_date: start_date, subscribed_domain: subscribed_domain, next_token: next_token, page_size: page_size)
        list_domain_deliverability_campaigns(input)
      end

      def list_domain_deliverability_campaigns(input : Types::ListDomainDeliverabilityCampaignsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DOMAIN_DELIVERABILITY_CAMPAIGNS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all of the email identities that are associated with your Amazon Web Services
      # account. An identity can be either an email address or a domain. This operation returns identities
      # that are verified as well as those that aren't. This operation returns identities that are
      # associated with Amazon SES and Amazon Pinpoint.

      def list_email_identities(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListEmailIdentitiesRequest.new(next_token: next_token, page_size: page_size)
        list_email_identities(input)
      end

      def list_email_identities(input : Types::ListEmailIdentitiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EMAIL_IDENTITIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the email templates present in your Amazon SES account in the current Amazon Web Services
      # Region. You can execute this operation no more than once per second.

      def list_email_templates(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListEmailTemplatesRequest.new(next_token: next_token, page_size: page_size)
        list_email_templates(input)
      end

      def list_email_templates(input : Types::ListEmailTemplatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EMAIL_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the export jobs.

      def list_export_jobs(
        export_source_type : String? = nil,
        job_status : String? = nil,
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListExportJobsRequest.new(export_source_type: export_source_type, job_status: job_status, next_token: next_token, page_size: page_size)
        list_export_jobs(input)
      end

      def list_export_jobs(input : Types::ListExportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EXPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the import jobs.

      def list_import_jobs(
        import_destination_type : String? = nil,
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListImportJobsRequest.new(import_destination_type: import_destination_type, next_token: next_token, page_size: page_size)
        list_import_jobs(input)
      end

      def list_import_jobs(input : Types::ListImportJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IMPORT_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the multi-region endpoints (global-endpoints). Only multi-region endpoints (global-endpoints)
      # whose primary region is the AWS-Region where operation is executed will be listed.

      def list_multi_region_endpoints(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListMultiRegionEndpointsRequest.new(next_token: next_token, page_size: page_size)
        list_multi_region_endpoints(input)
      end

      def list_multi_region_endpoints(input : Types::ListMultiRegionEndpointsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MULTI_REGION_ENDPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the recommendations present in your Amazon SES account in the current Amazon Web Services
      # Region. You can execute this operation no more than once per second.

      def list_recommendations(
        filter : Hash(String, String)? = nil,
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListRecommendationsRequest.new(filter: filter, next_token: next_token, page_size: page_size)
        list_recommendations(input)
      end

      def list_recommendations(input : Types::ListRecommendationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RECOMMENDATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List reputation entities in your Amazon SES account in the current Amazon Web Services Region. You
      # can filter the results by entity type, reputation impact, sending status, or entity reference
      # prefix. Reputation entities represent resources in your account that have reputation tracking and
      # management capabilities. Use this operation to get an overview of all entities and their current
      # reputation status.

      def list_reputation_entities(
        filter : Hash(String, String)? = nil,
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListReputationEntitiesRequest.new(filter: filter, next_token: next_token, page_size: page_size)
        list_reputation_entities(input)
      end

      def list_reputation_entities(input : Types::ListReputationEntitiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REPUTATION_ENTITIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all tenants associated with a specific resource. This operation returns a list of tenants that
      # are associated with the specified resource. This is useful for understanding which tenants are
      # currently using a particular resource such as an email identity, configuration set, or email
      # template.

      def list_resource_tenants(
        resource_arn : String,
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListResourceTenantsRequest.new(resource_arn: resource_arn, next_token: next_token, page_size: page_size)
        list_resource_tenants(input)
      end

      def list_resource_tenants(input : Types::ListResourceTenantsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOURCE_TENANTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of email addresses that are on the suppression list for your account.

      def list_suppressed_destinations(
        end_date : Time? = nil,
        next_token : String? = nil,
        page_size : Int32? = nil,
        reasons : Array(String)? = nil,
        start_date : Time? = nil
      ) : Protocol::Request
        input = Types::ListSuppressedDestinationsRequest.new(end_date: end_date, next_token: next_token, page_size: page_size, reasons: reasons, start_date: start_date)
        list_suppressed_destinations(input)
      end

      def list_suppressed_destinations(input : Types::ListSuppressedDestinationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUPPRESSED_DESTINATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve a list of the tags (keys and values) that are associated with a specified resource. A tag
      # is a label that you optionally define and associate with a resource. Each tag consists of a required
      # tag key and an optional associated tag value . A tag key is a general label that acts as a category
      # for more specific tag values. A tag value acts as a descriptor within a tag key.

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

      # List all resources associated with a specific tenant. This operation returns a list of resources
      # (email identities, configuration sets, or email templates) that are associated with the specified
      # tenant. You can optionally filter the results by resource type.

      def list_tenant_resources(
        tenant_name : String,
        filter : Hash(String, String)? = nil,
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListTenantResourcesRequest.new(tenant_name: tenant_name, filter: filter, next_token: next_token, page_size: page_size)
        list_tenant_resources(input)
      end

      def list_tenant_resources(input : Types::ListTenantResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TENANT_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all tenants associated with your account in the current Amazon Web Services Region. This
      # operation returns basic information about each tenant, such as tenant name, ID, ARN, and creation
      # timestamp.

      def list_tenants(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListTenantsRequest.new(next_token: next_token, page_size: page_size)
        list_tenants(input)
      end

      def list_tenants(input : Types::ListTenantsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TENANTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enable or disable the automatic warm-up feature for dedicated IP addresses.

      def put_account_dedicated_ip_warmup_attributes(
        auto_warmup_enabled : Bool? = nil
      ) : Protocol::Request
        input = Types::PutAccountDedicatedIpWarmupAttributesRequest.new(auto_warmup_enabled: auto_warmup_enabled)
        put_account_dedicated_ip_warmup_attributes(input)
      end

      def put_account_dedicated_ip_warmup_attributes(input : Types::PutAccountDedicatedIpWarmupAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ACCOUNT_DEDICATED_IP_WARMUP_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update your Amazon SES account details.

      def put_account_details(
        mail_type : String,
        website_url : String,
        additional_contact_email_addresses : Array(String)? = nil,
        contact_language : String? = nil,
        production_access_enabled : Bool? = nil,
        use_case_description : String? = nil
      ) : Protocol::Request
        input = Types::PutAccountDetailsRequest.new(mail_type: mail_type, website_url: website_url, additional_contact_email_addresses: additional_contact_email_addresses, contact_language: contact_language, production_access_enabled: production_access_enabled, use_case_description: use_case_description)
        put_account_details(input)
      end

      def put_account_details(input : Types::PutAccountDetailsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ACCOUNT_DETAILS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enable or disable the ability of your account to send email.

      def put_account_sending_attributes(
        sending_enabled : Bool? = nil
      ) : Protocol::Request
        input = Types::PutAccountSendingAttributesRequest.new(sending_enabled: sending_enabled)
        put_account_sending_attributes(input)
      end

      def put_account_sending_attributes(input : Types::PutAccountSendingAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ACCOUNT_SENDING_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Change the settings for the account-level suppression list.

      def put_account_suppression_attributes(
        suppressed_reasons : Array(String)? = nil,
        validation_attributes : Types::SuppressionValidationAttributes? = nil
      ) : Protocol::Request
        input = Types::PutAccountSuppressionAttributesRequest.new(suppressed_reasons: suppressed_reasons, validation_attributes: validation_attributes)
        put_account_suppression_attributes(input)
      end

      def put_account_suppression_attributes(input : Types::PutAccountSuppressionAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ACCOUNT_SUPPRESSION_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update your Amazon SES account VDM attributes. You can execute this operation no more than once per
      # second.

      def put_account_vdm_attributes(
        vdm_attributes : Types::VdmAttributes
      ) : Protocol::Request
        input = Types::PutAccountVdmAttributesRequest.new(vdm_attributes: vdm_attributes)
        put_account_vdm_attributes(input)
      end

      def put_account_vdm_attributes(input : Types::PutAccountVdmAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ACCOUNT_VDM_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associate the configuration set with a MailManager archive. When you send email using the SendEmail
      # or SendBulkEmail operations the message as it will be given to the receiving SMTP server will be
      # archived, along with the recipient information.

      def put_configuration_set_archiving_options(
        configuration_set_name : String,
        archive_arn : String? = nil
      ) : Protocol::Request
        input = Types::PutConfigurationSetArchivingOptionsRequest.new(configuration_set_name: configuration_set_name, archive_arn: archive_arn)
        put_configuration_set_archiving_options(input)
      end

      def put_configuration_set_archiving_options(input : Types::PutConfigurationSetArchivingOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CONFIGURATION_SET_ARCHIVING_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associate a configuration set with a dedicated IP pool. You can use dedicated IP pools to create
      # groups of dedicated IP addresses for sending specific types of email.

      def put_configuration_set_delivery_options(
        configuration_set_name : String,
        max_delivery_seconds : Int64? = nil,
        sending_pool_name : String? = nil,
        tls_policy : String? = nil
      ) : Protocol::Request
        input = Types::PutConfigurationSetDeliveryOptionsRequest.new(configuration_set_name: configuration_set_name, max_delivery_seconds: max_delivery_seconds, sending_pool_name: sending_pool_name, tls_policy: tls_policy)
        put_configuration_set_delivery_options(input)
      end

      def put_configuration_set_delivery_options(input : Types::PutConfigurationSetDeliveryOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CONFIGURATION_SET_DELIVERY_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enable or disable collection of reputation metrics for emails that you send using a particular
      # configuration set in a specific Amazon Web Services Region.

      def put_configuration_set_reputation_options(
        configuration_set_name : String,
        reputation_metrics_enabled : Bool? = nil
      ) : Protocol::Request
        input = Types::PutConfigurationSetReputationOptionsRequest.new(configuration_set_name: configuration_set_name, reputation_metrics_enabled: reputation_metrics_enabled)
        put_configuration_set_reputation_options(input)
      end

      def put_configuration_set_reputation_options(input : Types::PutConfigurationSetReputationOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CONFIGURATION_SET_REPUTATION_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enable or disable email sending for messages that use a particular configuration set in a specific
      # Amazon Web Services Region.

      def put_configuration_set_sending_options(
        configuration_set_name : String,
        sending_enabled : Bool? = nil
      ) : Protocol::Request
        input = Types::PutConfigurationSetSendingOptionsRequest.new(configuration_set_name: configuration_set_name, sending_enabled: sending_enabled)
        put_configuration_set_sending_options(input)
      end

      def put_configuration_set_sending_options(input : Types::PutConfigurationSetSendingOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CONFIGURATION_SET_SENDING_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Specify the account suppression list preferences for a configuration set.

      def put_configuration_set_suppression_options(
        configuration_set_name : String,
        suppressed_reasons : Array(String)? = nil,
        validation_options : Types::SuppressionValidationOptions? = nil
      ) : Protocol::Request
        input = Types::PutConfigurationSetSuppressionOptionsRequest.new(configuration_set_name: configuration_set_name, suppressed_reasons: suppressed_reasons, validation_options: validation_options)
        put_configuration_set_suppression_options(input)
      end

      def put_configuration_set_suppression_options(input : Types::PutConfigurationSetSuppressionOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CONFIGURATION_SET_SUPPRESSION_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Specify a custom domain to use for open and click tracking elements in email that you send.

      def put_configuration_set_tracking_options(
        configuration_set_name : String,
        custom_redirect_domain : String? = nil,
        https_policy : String? = nil
      ) : Protocol::Request
        input = Types::PutConfigurationSetTrackingOptionsRequest.new(configuration_set_name: configuration_set_name, custom_redirect_domain: custom_redirect_domain, https_policy: https_policy)
        put_configuration_set_tracking_options(input)
      end

      def put_configuration_set_tracking_options(input : Types::PutConfigurationSetTrackingOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CONFIGURATION_SET_TRACKING_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Specify VDM preferences for email that you send using the configuration set. You can execute this
      # operation no more than once per second.

      def put_configuration_set_vdm_options(
        configuration_set_name : String,
        vdm_options : Types::VdmOptions? = nil
      ) : Protocol::Request
        input = Types::PutConfigurationSetVdmOptionsRequest.new(configuration_set_name: configuration_set_name, vdm_options: vdm_options)
        put_configuration_set_vdm_options(input)
      end

      def put_configuration_set_vdm_options(input : Types::PutConfigurationSetVdmOptionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CONFIGURATION_SET_VDM_OPTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Move a dedicated IP address to an existing dedicated IP pool. The dedicated IP address that you
      # specify must already exist, and must be associated with your Amazon Web Services account. The
      # dedicated IP pool you specify must already exist. You can create a new pool by using the
      # CreateDedicatedIpPool operation.

      def put_dedicated_ip_in_pool(
        destination_pool_name : String,
        ip : String
      ) : Protocol::Request
        input = Types::PutDedicatedIpInPoolRequest.new(destination_pool_name: destination_pool_name, ip: ip)
        put_dedicated_ip_in_pool(input)
      end

      def put_dedicated_ip_in_pool(input : Types::PutDedicatedIpInPoolRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_DEDICATED_IP_IN_POOL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used to convert a dedicated IP pool to a different scaling mode. MANAGED pools cannot be converted
      # to STANDARD scaling mode.

      def put_dedicated_ip_pool_scaling_attributes(
        pool_name : String,
        scaling_mode : String
      ) : Protocol::Request
        input = Types::PutDedicatedIpPoolScalingAttributesRequest.new(pool_name: pool_name, scaling_mode: scaling_mode)
        put_dedicated_ip_pool_scaling_attributes(input)
      end

      def put_dedicated_ip_pool_scaling_attributes(input : Types::PutDedicatedIpPoolScalingAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_DEDICATED_IP_POOL_SCALING_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end


      def put_dedicated_ip_warmup_attributes(
        ip : String,
        warmup_percentage : Int32
      ) : Protocol::Request
        input = Types::PutDedicatedIpWarmupAttributesRequest.new(ip: ip, warmup_percentage: warmup_percentage)
        put_dedicated_ip_warmup_attributes(input)
      end

      def put_dedicated_ip_warmup_attributes(input : Types::PutDedicatedIpWarmupAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_DEDICATED_IP_WARMUP_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enable or disable the Deliverability dashboard. When you enable the Deliverability dashboard, you
      # gain access to reputation, deliverability, and other metrics for the domains that you use to send
      # email. You also gain the ability to perform predictive inbox placement tests. When you use the
      # Deliverability dashboard, you pay a monthly subscription charge, in addition to any other fees that
      # you accrue by using Amazon SES and other Amazon Web Services services. For more information about
      # the features and cost of a Deliverability dashboard subscription, see Amazon SES Pricing .

      def put_deliverability_dashboard_option(
        dashboard_enabled : Bool,
        subscribed_domains : Array(Types::DomainDeliverabilityTrackingOption)? = nil
      ) : Protocol::Request
        input = Types::PutDeliverabilityDashboardOptionRequest.new(dashboard_enabled: dashboard_enabled, subscribed_domains: subscribed_domains)
        put_deliverability_dashboard_option(input)
      end

      def put_deliverability_dashboard_option(input : Types::PutDeliverabilityDashboardOptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_DELIVERABILITY_DASHBOARD_OPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used to associate a configuration set with an email identity.

      def put_email_identity_configuration_set_attributes(
        email_identity : String,
        configuration_set_name : String? = nil
      ) : Protocol::Request
        input = Types::PutEmailIdentityConfigurationSetAttributesRequest.new(email_identity: email_identity, configuration_set_name: configuration_set_name)
        put_email_identity_configuration_set_attributes(input)
      end

      def put_email_identity_configuration_set_attributes(input : Types::PutEmailIdentityConfigurationSetAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_EMAIL_IDENTITY_CONFIGURATION_SET_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used to enable or disable DKIM authentication for an email identity.

      def put_email_identity_dkim_attributes(
        email_identity : String,
        signing_enabled : Bool? = nil
      ) : Protocol::Request
        input = Types::PutEmailIdentityDkimAttributesRequest.new(email_identity: email_identity, signing_enabled: signing_enabled)
        put_email_identity_dkim_attributes(input)
      end

      def put_email_identity_dkim_attributes(input : Types::PutEmailIdentityDkimAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_EMAIL_IDENTITY_DKIM_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used to configure or change the DKIM authentication settings for an email domain identity. You can
      # use this operation to do any of the following: Update the signing attributes for an identity that
      # uses Bring Your Own DKIM (BYODKIM). Update the key length that should be used for Easy DKIM. Change
      # from using no DKIM authentication to using Easy DKIM. Change from using no DKIM authentication to
      # using BYODKIM. Change from using Easy DKIM to using BYODKIM. Change from using BYODKIM to using Easy
      # DKIM.

      def put_email_identity_dkim_signing_attributes(
        email_identity : String,
        signing_attributes_origin : String,
        signing_attributes : Types::DkimSigningAttributes? = nil
      ) : Protocol::Request
        input = Types::PutEmailIdentityDkimSigningAttributesRequest.new(email_identity: email_identity, signing_attributes_origin: signing_attributes_origin, signing_attributes: signing_attributes)
        put_email_identity_dkim_signing_attributes(input)
      end

      def put_email_identity_dkim_signing_attributes(input : Types::PutEmailIdentityDkimSigningAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_EMAIL_IDENTITY_DKIM_SIGNING_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used to enable or disable feedback forwarding for an identity. This setting determines what happens
      # when an identity is used to send an email that results in a bounce or complaint event. If the value
      # is true , you receive email notifications when bounce or complaint events occur. These notifications
      # are sent to the address that you specified in the Return-Path header of the original email. You're
      # required to have a method of tracking bounces and complaints. If you haven't set up another
      # mechanism for receiving bounce or complaint notifications (for example, by setting up an event
      # destination), you receive an email notification when these events occur (even if this setting is
      # disabled).

      def put_email_identity_feedback_attributes(
        email_identity : String,
        email_forwarding_enabled : Bool? = nil
      ) : Protocol::Request
        input = Types::PutEmailIdentityFeedbackAttributesRequest.new(email_identity: email_identity, email_forwarding_enabled: email_forwarding_enabled)
        put_email_identity_feedback_attributes(input)
      end

      def put_email_identity_feedback_attributes(input : Types::PutEmailIdentityFeedbackAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_EMAIL_IDENTITY_FEEDBACK_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used to enable or disable the custom Mail-From domain configuration for an email identity.

      def put_email_identity_mail_from_attributes(
        email_identity : String,
        behavior_on_mx_failure : String? = nil,
        mail_from_domain : String? = nil
      ) : Protocol::Request
        input = Types::PutEmailIdentityMailFromAttributesRequest.new(email_identity: email_identity, behavior_on_mx_failure: behavior_on_mx_failure, mail_from_domain: mail_from_domain)
        put_email_identity_mail_from_attributes(input)
      end

      def put_email_identity_mail_from_attributes(input : Types::PutEmailIdentityMailFromAttributesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_EMAIL_IDENTITY_MAIL_FROM_ATTRIBUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds an email address to the suppression list for your account.

      def put_suppressed_destination(
        email_address : String,
        reason : String
      ) : Protocol::Request
        input = Types::PutSuppressedDestinationRequest.new(email_address: email_address, reason: reason)
        put_suppressed_destination(input)
      end

      def put_suppressed_destination(input : Types::PutSuppressedDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_SUPPRESSED_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Composes an email message to multiple destinations.

      def send_bulk_email(
        bulk_email_entries : Array(Types::BulkEmailEntry),
        default_content : Types::BulkEmailContent,
        configuration_set_name : String? = nil,
        default_email_tags : Array(Types::MessageTag)? = nil,
        endpoint_id : String? = nil,
        feedback_forwarding_email_address : String? = nil,
        feedback_forwarding_email_address_identity_arn : String? = nil,
        from_email_address : String? = nil,
        from_email_address_identity_arn : String? = nil,
        reply_to_addresses : Array(String)? = nil,
        tenant_name : String? = nil
      ) : Protocol::Request
        input = Types::SendBulkEmailRequest.new(bulk_email_entries: bulk_email_entries, default_content: default_content, configuration_set_name: configuration_set_name, default_email_tags: default_email_tags, endpoint_id: endpoint_id, feedback_forwarding_email_address: feedback_forwarding_email_address, feedback_forwarding_email_address_identity_arn: feedback_forwarding_email_address_identity_arn, from_email_address: from_email_address, from_email_address_identity_arn: from_email_address_identity_arn, reply_to_addresses: reply_to_addresses, tenant_name: tenant_name)
        send_bulk_email(input)
      end

      def send_bulk_email(input : Types::SendBulkEmailRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_BULK_EMAIL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds an email address to the list of identities for your Amazon SES account in the current Amazon
      # Web Services Region and attempts to verify it. As a result of executing this operation, a customized
      # verification email is sent to the specified address. To use this operation, you must first create a
      # custom verification email template. For more information about creating and using custom
      # verification email templates, see Using custom verification email templates in the Amazon SES
      # Developer Guide . You can execute this operation no more than once per second.

      def send_custom_verification_email(
        email_address : String,
        template_name : String,
        configuration_set_name : String? = nil
      ) : Protocol::Request
        input = Types::SendCustomVerificationEmailRequest.new(email_address: email_address, template_name: template_name, configuration_set_name: configuration_set_name)
        send_custom_verification_email(input)
      end

      def send_custom_verification_email(input : Types::SendCustomVerificationEmailRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_CUSTOM_VERIFICATION_EMAIL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends an email message. You can use the Amazon SES API v2 to send the following types of messages:
      # Simple – A standard email message. When you create this type of message, you specify the sender, the
      # recipient, and the message body, and Amazon SES assembles the message for you. Raw – A raw,
      # MIME-formatted email message. When you send this type of email, you have to specify all of the
      # message headers, as well as the message body. You can use this message type to send messages that
      # contain attachments. The message that you specify has to be a valid MIME message. Templated – A
      # message that contains personalization tags. When you send this type of email, Amazon SES API v2
      # automatically replaces the tags with values that you specify.

      def send_email(
        content : Types::EmailContent,
        configuration_set_name : String? = nil,
        destination : Types::Destination? = nil,
        email_tags : Array(Types::MessageTag)? = nil,
        endpoint_id : String? = nil,
        feedback_forwarding_email_address : String? = nil,
        feedback_forwarding_email_address_identity_arn : String? = nil,
        from_email_address : String? = nil,
        from_email_address_identity_arn : String? = nil,
        list_management_options : Types::ListManagementOptions? = nil,
        reply_to_addresses : Array(String)? = nil,
        tenant_name : String? = nil
      ) : Protocol::Request
        input = Types::SendEmailRequest.new(content: content, configuration_set_name: configuration_set_name, destination: destination, email_tags: email_tags, endpoint_id: endpoint_id, feedback_forwarding_email_address: feedback_forwarding_email_address, feedback_forwarding_email_address_identity_arn: feedback_forwarding_email_address_identity_arn, from_email_address: from_email_address, from_email_address_identity_arn: from_email_address_identity_arn, list_management_options: list_management_options, reply_to_addresses: reply_to_addresses, tenant_name: tenant_name)
        send_email(input)
      end

      def send_email(input : Types::SendEmailRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_EMAIL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Add one or more tags (keys and values) to a specified resource. A tag is a label that you optionally
      # define and associate with a resource. Tags can help you categorize and manage resources in different
      # ways, such as by purpose, owner, environment, or other criteria. A resource can have as many as 50
      # tags. Each tag consists of a required tag key and an associated tag value , both of which you
      # define. A tag key is a general label that acts as a category for more specific tag values. A tag
      # value acts as a descriptor within a tag key.

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

      # Creates a preview of the MIME content of an email when provided with a template and a set of
      # replacement data. You can execute this operation no more than once per second.

      def test_render_email_template(
        template_data : String,
        template_name : String
      ) : Protocol::Request
        input = Types::TestRenderEmailTemplateRequest.new(template_data: template_data, template_name: template_name)
        test_render_email_template(input)
      end

      def test_render_email_template(input : Types::TestRenderEmailTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TEST_RENDER_EMAIL_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Remove one or more tags (keys and values) from a specified resource.

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

      # Update the configuration of an event destination for a configuration set. Events include message
      # sends, deliveries, opens, clicks, bounces, and complaints. Event destinations are places that you
      # can send information about these events to. For example, you can send event data to Amazon
      # EventBridge and associate a rule to send the event to the specified target.

      def update_configuration_set_event_destination(
        configuration_set_name : String,
        event_destination : Types::EventDestinationDefinition,
        event_destination_name : String
      ) : Protocol::Request
        input = Types::UpdateConfigurationSetEventDestinationRequest.new(configuration_set_name: configuration_set_name, event_destination: event_destination, event_destination_name: event_destination_name)
        update_configuration_set_event_destination(input)
      end

      def update_configuration_set_event_destination(input : Types::UpdateConfigurationSetEventDestinationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONFIGURATION_SET_EVENT_DESTINATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a contact's preferences for a list. You must specify all existing topic preferences in the
      # TopicPreferences object, not just the ones that need updating; otherwise, all your existing
      # preferences will be removed.

      def update_contact(
        contact_list_name : String,
        email_address : String,
        attributes_data : String? = nil,
        topic_preferences : Array(Types::TopicPreference)? = nil,
        unsubscribe_all : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateContactRequest.new(contact_list_name: contact_list_name, email_address: email_address, attributes_data: attributes_data, topic_preferences: topic_preferences, unsubscribe_all: unsubscribe_all)
        update_contact(input)
      end

      def update_contact(input : Types::UpdateContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates contact list metadata. This operation does a complete replacement.

      def update_contact_list(
        contact_list_name : String,
        description : String? = nil,
        topics : Array(Types::Topic)? = nil
      ) : Protocol::Request
        input = Types::UpdateContactListRequest.new(contact_list_name: contact_list_name, description: description, topics: topics)
        update_contact_list(input)
      end

      def update_contact_list(input : Types::UpdateContactListRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONTACT_LIST, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing custom verification email template. For more information about custom
      # verification email templates, see Using custom verification email templates in the Amazon SES
      # Developer Guide . You can execute this operation no more than once per second.

      def update_custom_verification_email_template(
        failure_redirection_url : String,
        from_email_address : String,
        success_redirection_url : String,
        template_content : String,
        template_name : String,
        template_subject : String
      ) : Protocol::Request
        input = Types::UpdateCustomVerificationEmailTemplateRequest.new(failure_redirection_url: failure_redirection_url, from_email_address: from_email_address, success_redirection_url: success_redirection_url, template_content: template_content, template_name: template_name, template_subject: template_subject)
        update_custom_verification_email_template(input)
      end

      def update_custom_verification_email_template(input : Types::UpdateCustomVerificationEmailTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CUSTOM_VERIFICATION_EMAIL_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified sending authorization policy for the given identity (an email address or a
      # domain). This API returns successfully even if a policy with the specified name does not exist. This
      # API is for the identity owner only. If you have not verified the identity, this API will return an
      # error. Sending authorization is a feature that enables an identity owner to authorize other senders
      # to use its identities. For information about using sending authorization, see the Amazon SES
      # Developer Guide . You can execute this operation no more than once per second.

      def update_email_identity_policy(
        email_identity : String,
        policy : String,
        policy_name : String
      ) : Protocol::Request
        input = Types::UpdateEmailIdentityPolicyRequest.new(email_identity: email_identity, policy: policy, policy_name: policy_name)
        update_email_identity_policy(input)
      end

      def update_email_identity_policy(input : Types::UpdateEmailIdentityPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EMAIL_IDENTITY_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an email template. Email templates enable you to send personalized email to one or more
      # destinations in a single API operation. For more information, see the Amazon SES Developer Guide .
      # You can execute this operation no more than once per second.

      def update_email_template(
        template_content : Types::EmailTemplateContent,
        template_name : String
      ) : Protocol::Request
        input = Types::UpdateEmailTemplateRequest.new(template_content: template_content, template_name: template_name)
        update_email_template(input)
      end

      def update_email_template(input : Types::UpdateEmailTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EMAIL_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the customer-managed sending status for a reputation entity. This allows you to enable,
      # disable, or reinstate sending for the entity. The customer-managed status works in conjunction with
      # the Amazon Web Services Amazon SES-managed status to determine the overall sending capability. When
      # you update the customer-managed status, the Amazon Web Services Amazon SES-managed status remains
      # unchanged. If Amazon Web Services Amazon SES has disabled the entity, it will not be allowed to send
      # regardless of the customer-managed status setting. When you reinstate an entity through the
      # customer-managed status, it can continue sending only if the Amazon Web Services Amazon SES-managed
      # status also permits sending, even if there are active reputation findings, until the findings are
      # resolved or new violations occur.

      def update_reputation_entity_customer_managed_status(
        reputation_entity_reference : String,
        reputation_entity_type : String,
        sending_status : String
      ) : Protocol::Request
        input = Types::UpdateReputationEntityCustomerManagedStatusRequest.new(reputation_entity_reference: reputation_entity_reference, reputation_entity_type: reputation_entity_type, sending_status: sending_status)
        update_reputation_entity_customer_managed_status(input)
      end

      def update_reputation_entity_customer_managed_status(input : Types::UpdateReputationEntityCustomerManagedStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REPUTATION_ENTITY_CUSTOMER_MANAGED_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the reputation management policy for a reputation entity. The policy determines how the
      # entity responds to reputation findings, such as automatically pausing sending when certain
      # thresholds are exceeded. Reputation management policies are Amazon Web Services Amazon SES-managed
      # (predefined policies). You can select from none, standard, and strict policies.

      def update_reputation_entity_policy(
        reputation_entity_policy : String,
        reputation_entity_reference : String,
        reputation_entity_type : String
      ) : Protocol::Request
        input = Types::UpdateReputationEntityPolicyRequest.new(reputation_entity_policy: reputation_entity_policy, reputation_entity_reference: reputation_entity_reference, reputation_entity_type: reputation_entity_type)
        update_reputation_entity_policy(input)
      end

      def update_reputation_entity_policy(input : Types::UpdateReputationEntityPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REPUTATION_ENTITY_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
