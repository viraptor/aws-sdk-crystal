module AwsSdk
  module SecurityHub
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

      # We recommend using Organizations instead of Security Hub invitations to manage your member accounts.
      # For information, see Managing Security Hub administrator and member accounts with Organizations in
      # the Security Hub User Guide . Accepts the invitation to be a member account and be monitored by the
      # Security Hub administrator account that the invitation was sent from. This operation is only used by
      # member accounts that are not added through Organizations. When the member account accepts the
      # invitation, permission is granted to the administrator account to view findings generated in the
      # member account.

      def accept_administrator_invitation(
        administrator_id : String,
        invitation_id : String
      ) : Protocol::Request
        input = Types::AcceptAdministratorInvitationRequest.new(administrator_id: administrator_id, invitation_id: invitation_id)
        accept_administrator_invitation(input)
      end

      def accept_administrator_invitation(input : Types::AcceptAdministratorInvitationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACCEPT_ADMINISTRATOR_INVITATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This method is deprecated. Instead, use AcceptAdministratorInvitation . The Security Hub console
      # continues to use AcceptInvitation . It will eventually change to use AcceptAdministratorInvitation .
      # Any IAM policies that specifically control access to this function must continue to use
      # AcceptInvitation . You should also add AcceptAdministratorInvitation to your policies to ensure that
      # the correct permissions are in place after the console begins to use AcceptAdministratorInvitation .
      # Accepts the invitation to be a member account and be monitored by the Security Hub administrator
      # account that the invitation was sent from. This operation is only used by member accounts that are
      # not added through Organizations. When the member account accepts the invitation, permission is
      # granted to the administrator account to view findings generated in the member account.

      def accept_invitation(
        invitation_id : String,
        master_id : String
      ) : Protocol::Request
        input = Types::AcceptInvitationRequest.new(invitation_id: invitation_id, master_id: master_id)
        accept_invitation(input)
      end

      def accept_invitation(input : Types::AcceptInvitationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACCEPT_INVITATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes one or more automation rules.

      def batch_delete_automation_rules(
        automation_rules_arns : Array(String)
      ) : Protocol::Request
        input = Types::BatchDeleteAutomationRulesRequest.new(automation_rules_arns: automation_rules_arns)
        batch_delete_automation_rules(input)
      end

      def batch_delete_automation_rules(input : Types::BatchDeleteAutomationRulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DELETE_AUTOMATION_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables the standards specified by the provided StandardsSubscriptionArns . For more information,
      # see Security Standards section of the Security Hub User Guide .

      def batch_disable_standards(
        standards_subscription_arns : Array(String)
      ) : Protocol::Request
        input = Types::BatchDisableStandardsRequest.new(standards_subscription_arns: standards_subscription_arns)
        batch_disable_standards(input)
      end

      def batch_disable_standards(input : Types::BatchDisableStandardsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_DISABLE_STANDARDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables the standards specified by the provided StandardsArn . To obtain the ARN for a standard, use
      # the DescribeStandards operation. For more information, see the Security Standards section of the
      # Security Hub User Guide .

      def batch_enable_standards(
        standards_subscription_requests : Array(Types::StandardsSubscriptionRequest)
      ) : Protocol::Request
        input = Types::BatchEnableStandardsRequest.new(standards_subscription_requests: standards_subscription_requests)
        batch_enable_standards(input)
      end

      def batch_enable_standards(input : Types::BatchEnableStandardsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_ENABLE_STANDARDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of details for automation rules based on rule Amazon Resource Names (ARNs).

      def batch_get_automation_rules(
        automation_rules_arns : Array(String)
      ) : Protocol::Request
        input = Types::BatchGetAutomationRulesRequest.new(automation_rules_arns: automation_rules_arns)
        batch_get_automation_rules(input)
      end

      def batch_get_automation_rules(input : Types::BatchGetAutomationRulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_AUTOMATION_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns associations between an Security Hub configuration and a batch of target accounts,
      # organizational units, or the root. Only the Security Hub delegated administrator can invoke this
      # operation from the home Region. A configuration can refer to a configuration policy or to a
      # self-managed configuration.

      def batch_get_configuration_policy_associations(
        configuration_policy_association_identifiers : Array(Types::ConfigurationPolicyAssociation)
      ) : Protocol::Request
        input = Types::BatchGetConfigurationPolicyAssociationsRequest.new(configuration_policy_association_identifiers: configuration_policy_association_identifiers)
        batch_get_configuration_policy_associations(input)
      end

      def batch_get_configuration_policy_associations(input : Types::BatchGetConfigurationPolicyAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_CONFIGURATION_POLICY_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides details about a batch of security controls for the current Amazon Web Services account and
      # Amazon Web Services Region.

      def batch_get_security_controls(
        security_control_ids : Array(String)
      ) : Protocol::Request
        input = Types::BatchGetSecurityControlsRequest.new(security_control_ids: security_control_ids)
        batch_get_security_controls(input)
      end

      def batch_get_security_controls(input : Types::BatchGetSecurityControlsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_SECURITY_CONTROLS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # For a batch of security controls and standards, identifies whether each control is currently enabled
      # or disabled in a standard. Calls to this operation return a RESOURCE_NOT_FOUND_EXCEPTION error when
      # the standard subscription for the association has a NOT_READY_FOR_UPDATES value for
      # StandardsControlsUpdatable .

      def batch_get_standards_control_associations(
        standards_control_association_ids : Array(Types::StandardsControlAssociationId)
      ) : Protocol::Request
        input = Types::BatchGetStandardsControlAssociationsRequest.new(standards_control_association_ids: standards_control_association_ids)
        batch_get_standards_control_associations(input)
      end

      def batch_get_standards_control_associations(input : Types::BatchGetStandardsControlAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_STANDARDS_CONTROL_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Imports security findings generated by a finding provider into Security Hub. This action is
      # requested by the finding provider to import its findings into Security Hub. BatchImportFindings must
      # be called by one of the following: The Amazon Web Services account that is associated with a finding
      # if you are using the default product ARN or are a partner sending findings from within a customer's
      # Amazon Web Services account. In these cases, the identifier of the account that you are calling
      # BatchImportFindings from needs to be the same as the AwsAccountId attribute for the finding. An
      # Amazon Web Services account that Security Hub has allow-listed for an official partner integration.
      # In this case, you can call BatchImportFindings from the allow-listed account and send findings from
      # different customer accounts in the same batch. The maximum allowed size for a finding is 240 Kb. An
      # error is returned for any finding larger than 240 Kb. After a finding is created,
      # BatchImportFindings cannot be used to update the following finding fields and objects, which
      # Security Hub customers use to manage their investigation workflow. Note UserDefinedFields
      # VerificationState Workflow Finding providers also should not use BatchImportFindings to update the
      # following attributes. Confidence Criticality RelatedFindings Severity Types Instead, finding
      # providers use FindingProviderFields to provide values for these attributes.

      def batch_import_findings(
        findings : Array(Types::AwsSecurityFinding)
      ) : Protocol::Request
        input = Types::BatchImportFindingsRequest.new(findings: findings)
        batch_import_findings(input)
      end

      def batch_import_findings(input : Types::BatchImportFindingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_IMPORT_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates one or more automation rules based on rule Amazon Resource Names (ARNs) and input
      # parameters.

      def batch_update_automation_rules(
        update_automation_rules_request_items : Array(Types::UpdateAutomationRulesRequestItem)
      ) : Protocol::Request
        input = Types::BatchUpdateAutomationRulesRequest.new(update_automation_rules_request_items: update_automation_rules_request_items)
        batch_update_automation_rules(input)
      end

      def batch_update_automation_rules(input : Types::BatchUpdateAutomationRulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_AUTOMATION_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used by Security Hub customers to update information about their investigation into one or more
      # findings. Requested by administrator accounts or member accounts. Administrator accounts can update
      # findings for their account and their member accounts. A member account can update findings only for
      # their own account. Administrator and member accounts can use this operation to update the following
      # fields and objects for one or more findings: Confidence Criticality Note RelatedFindings Severity
      # Types UserDefinedFields VerificationState Workflow If you use this operation to update a finding,
      # your updates don’t affect the value for the UpdatedAt field of the finding. Also note that it can
      # take several minutes for Security Hub to process your request and update each finding specified in
      # the request. You can configure IAM policies to restrict access to fields and field values. For
      # example, you might not want member accounts to be able to suppress findings or change the finding
      # severity. For more information see Configuring access to BatchUpdateFindings in the Security Hub
      # User Guide .

      def batch_update_findings(
        finding_identifiers : Array(Types::AwsSecurityFindingIdentifier),
        confidence : Int32? = nil,
        criticality : Int32? = nil,
        note : Types::NoteUpdate? = nil,
        related_findings : Array(Types::RelatedFinding)? = nil,
        severity : Types::SeverityUpdate? = nil,
        types : Array(String)? = nil,
        user_defined_fields : Hash(String, String)? = nil,
        verification_state : String? = nil,
        workflow : Types::WorkflowUpdate? = nil
      ) : Protocol::Request
        input = Types::BatchUpdateFindingsRequest.new(finding_identifiers: finding_identifiers, confidence: confidence, criticality: criticality, note: note, related_findings: related_findings, severity: severity, types: types, user_defined_fields: user_defined_fields, verification_state: verification_state, workflow: workflow)
        batch_update_findings(input)
      end

      def batch_update_findings(input : Types::BatchUpdateFindingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used by customers to update information about their investigation into a finding. Requested by
      # delegated administrator accounts or member accounts. Delegated administrator accounts can update
      # findings for their account and their member accounts. Member accounts can update findings for their
      # account. BatchUpdateFindings and BatchUpdateFindingV2 both use securityhub:BatchUpdateFindings in
      # the Action element of an IAM policy statement. You must have permission to perform the
      # securityhub:BatchUpdateFindings action. Updates from BatchUpdateFindingsV2 don't affect the value of
      # f inding_info.modified_time , finding_info.modified_time_dt , time , time_dt for a finding .

      def batch_update_findings_v2(
        comment : String? = nil,
        finding_identifiers : Array(Types::OcsfFindingIdentifier)? = nil,
        metadata_uids : Array(String)? = nil,
        severity_id : Int32? = nil,
        status_id : Int32? = nil
      ) : Protocol::Request
        input = Types::BatchUpdateFindingsV2Request.new(comment: comment, finding_identifiers: finding_identifiers, metadata_uids: metadata_uids, severity_id: severity_id, status_id: status_id)
        batch_update_findings_v2(input)
      end

      def batch_update_findings_v2(input : Types::BatchUpdateFindingsV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_FINDINGS_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # For a batch of security controls and standards, this operation updates the enablement status of a
      # control in a standard.

      def batch_update_standards_control_associations(
        standards_control_association_updates : Array(Types::StandardsControlAssociationUpdate)
      ) : Protocol::Request
        input = Types::BatchUpdateStandardsControlAssociationsRequest.new(standards_control_association_updates: standards_control_association_updates)
        batch_update_standards_control_associations(input)
      end

      def batch_update_standards_control_associations(input : Types::BatchUpdateStandardsControlAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_STANDARDS_CONTROL_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a custom action target in Security Hub. You can use custom actions on findings and insights
      # in Security Hub to trigger target actions in Amazon CloudWatch Events.

      def create_action_target(
        description : String,
        id : String,
        name : String
      ) : Protocol::Request
        input = Types::CreateActionTargetRequest.new(description: description, id: id, name: name)
        create_action_target(input)
      end

      def create_action_target(input : Types::CreateActionTargetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ACTION_TARGET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables aggregation across Amazon Web Services Regions.

      def create_aggregator_v2(
        region_linking_mode : String,
        client_token : String? = nil,
        linked_regions : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAggregatorV2Request.new(region_linking_mode: region_linking_mode, client_token: client_token, linked_regions: linked_regions, tags: tags)
        create_aggregator_v2(input)
      end

      def create_aggregator_v2(input : Types::CreateAggregatorV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AGGREGATOR_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an automation rule based on input parameters.

      def create_automation_rule(
        actions : Array(Types::AutomationRulesAction),
        criteria : Types::AutomationRulesFindingFilters,
        description : String,
        rule_name : String,
        rule_order : Int32,
        is_terminal : Bool? = nil,
        rule_status : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAutomationRuleRequest.new(actions: actions, criteria: criteria, description: description, rule_name: rule_name, rule_order: rule_order, is_terminal: is_terminal, rule_status: rule_status, tags: tags)
        create_automation_rule(input)
      end

      def create_automation_rule(input : Types::CreateAutomationRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AUTOMATION_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a V2 automation rule.

      def create_automation_rule_v2(
        actions : Array(Types::AutomationRulesActionV2),
        criteria : Types::Criteria,
        description : String,
        rule_name : String,
        rule_order : Float64,
        client_token : String? = nil,
        rule_status : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAutomationRuleV2Request.new(actions: actions, criteria: criteria, description: description, rule_name: rule_name, rule_order: rule_order, client_token: client_token, rule_status: rule_status, tags: tags)
        create_automation_rule_v2(input)
      end

      def create_automation_rule_v2(input : Types::CreateAutomationRuleV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AUTOMATION_RULE_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a configuration policy with the defined configuration. Only the Security Hub delegated
      # administrator can invoke this operation from the home Region.

      def create_configuration_policy(
        configuration_policy : Types::Policy,
        name : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateConfigurationPolicyRequest.new(configuration_policy: configuration_policy, name: name, description: description, tags: tags)
        create_configuration_policy(input)
      end

      def create_configuration_policy(input : Types::CreateConfigurationPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIGURATION_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Grants permission to create a connectorV2 based on input parameters.

      def create_connector_v2(
        name : String,
        provider : Types::ProviderConfiguration,
        client_token : String? = nil,
        description : String? = nil,
        kms_key_arn : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateConnectorV2Request.new(name: name, provider: provider, client_token: client_token, description: description, kms_key_arn: kms_key_arn, tags: tags)
        create_connector_v2(input)
      end

      def create_connector_v2(input : Types::CreateConnectorV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONNECTOR_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The aggregation Region is now called the home Region . Used to enable cross-Region aggregation. This
      # operation can be invoked from the home Region only. For information about how cross-Region
      # aggregation works, see Understanding cross-Region aggregation in Security Hub in the Security Hub
      # User Guide .

      def create_finding_aggregator(
        region_linking_mode : String,
        regions : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CreateFindingAggregatorRequest.new(region_linking_mode: region_linking_mode, regions: regions)
        create_finding_aggregator(input)
      end

      def create_finding_aggregator(input : Types::CreateFindingAggregatorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FINDING_AGGREGATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a custom insight in Security Hub. An insight is a consolidation of findings that relate to a
      # security issue that requires attention or remediation. To group the related findings in the insight,
      # use the GroupByAttribute .

      def create_insight(
        filters : Types::AwsSecurityFindingFilters,
        group_by_attribute : String,
        name : String
      ) : Protocol::Request
        input = Types::CreateInsightRequest.new(filters: filters, group_by_attribute: group_by_attribute, name: name)
        create_insight(input)
      end

      def create_insight(input : Types::CreateInsightRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INSIGHT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a member association in Security Hub between the specified accounts and the account used to
      # make the request, which is the administrator account. If you are integrated with Organizations, then
      # the administrator account is designated by the organization management account. CreateMembers is
      # always used to add accounts that are not organization members. For accounts that are managed using
      # Organizations, CreateMembers is only used in the following cases: Security Hub is not configured to
      # automatically add new organization accounts. The account was disassociated or deleted in Security
      # Hub. This action can only be used by an account that has Security Hub enabled. To enable Security
      # Hub, you can use the EnableSecurityHub operation. For accounts that are not organization members,
      # you create the account association and then send an invitation to the member account. To send the
      # invitation, you use the InviteMembers operation. If the account owner accepts the invitation, the
      # account becomes a member account in Security Hub. Accounts that are managed using Organizations
      # don't receive an invitation. They automatically become a member account in Security Hub. If the
      # organization account does not have Security Hub enabled, then Security Hub and the default standards
      # are automatically enabled. Note that Security Hub cannot be enabled automatically for the
      # organization management account. The organization management account must enable Security Hub before
      # the administrator account enables it as a member account. For organization accounts that already
      # have Security Hub enabled, Security Hub does not make any other changes to those accounts. It does
      # not change their enabled standards or controls. A permissions policy is added that permits the
      # administrator account to view the findings generated in the member account. To remove the
      # association between the administrator and member accounts, use the DisassociateFromMasterAccount or
      # DisassociateMembers operation.

      def create_members(
        account_details : Array(Types::AccountDetails)
      ) : Protocol::Request
        input = Types::CreateMembersRequest.new(account_details: account_details)
        create_members(input)
      end

      def create_members(input : Types::CreateMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Grants permission to create a ticket in the chosen ITSM based on finding information for the
      # provided finding metadata UID.

      def create_ticket_v2(
        connector_id : String,
        finding_metadata_uid : String,
        client_token : String? = nil,
        mode : String? = nil
      ) : Protocol::Request
        input = Types::CreateTicketV2Request.new(connector_id: connector_id, finding_metadata_uid: finding_metadata_uid, client_token: client_token, mode: mode)
        create_ticket_v2(input)
      end

      def create_ticket_v2(input : Types::CreateTicketV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TICKET_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # We recommend using Organizations instead of Security Hub invitations to manage your member accounts.
      # For information, see Managing Security Hub administrator and member accounts with Organizations in
      # the Security Hub User Guide . Declines invitations to become a Security Hub member account. A
      # prospective member account uses this operation to decline an invitation to become a member. Only
      # member accounts that aren't part of an Amazon Web Services organization should use this operation.
      # Organization accounts don't receive invitations.

      def decline_invitations(
        account_ids : Array(String)
      ) : Protocol::Request
        input = Types::DeclineInvitationsRequest.new(account_ids: account_ids)
        decline_invitations(input)
      end

      def decline_invitations(input : Types::DeclineInvitationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DECLINE_INVITATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a custom action target from Security Hub. Deleting a custom action target does not affect
      # any findings or insights that were already sent to Amazon CloudWatch Events using the custom action.

      def delete_action_target(
        action_target_arn : String
      ) : Protocol::Request
        input = Types::DeleteActionTargetRequest.new(action_target_arn: action_target_arn)
        delete_action_target(input)
      end

      def delete_action_target(input : Types::DeleteActionTargetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ACTION_TARGET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the Aggregator V2.

      def delete_aggregator_v2(
        aggregator_v2_arn : String
      ) : Protocol::Request
        input = Types::DeleteAggregatorV2Request.new(aggregator_v2_arn: aggregator_v2_arn)
        delete_aggregator_v2(input)
      end

      def delete_aggregator_v2(input : Types::DeleteAggregatorV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AGGREGATOR_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a V2 automation rule.

      def delete_automation_rule_v2(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteAutomationRuleV2Request.new(identifier: identifier)
        delete_automation_rule_v2(input)
      end

      def delete_automation_rule_v2(input : Types::DeleteAutomationRuleV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AUTOMATION_RULE_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a configuration policy. Only the Security Hub delegated administrator can invoke this
      # operation from the home Region. For the deletion to succeed, you must first disassociate a
      # configuration policy from target accounts, organizational units, or the root by invoking the
      # StartConfigurationPolicyDisassociation operation.

      def delete_configuration_policy(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteConfigurationPolicyRequest.new(identifier: identifier)
        delete_configuration_policy(input)
      end

      def delete_configuration_policy(input : Types::DeleteConfigurationPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURATION_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Grants permission to delete a connectorV2.

      def delete_connector_v2(
        connector_id : String
      ) : Protocol::Request
        input = Types::DeleteConnectorV2Request.new(connector_id: connector_id)
        delete_connector_v2(input)
      end

      def delete_connector_v2(input : Types::DeleteConnectorV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONNECTOR_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The aggregation Region is now called the home Region . Deletes a finding aggregator. When you delete
      # the finding aggregator, you stop cross-Region aggregation. Finding replication stops occurring from
      # the linked Regions to the home Region. When you stop cross-Region aggregation, findings that were
      # already replicated and sent to the home Region are still visible from the home Region. However, new
      # findings and finding updates are no longer replicated and sent to the home Region.

      def delete_finding_aggregator(
        finding_aggregator_arn : String
      ) : Protocol::Request
        input = Types::DeleteFindingAggregatorRequest.new(finding_aggregator_arn: finding_aggregator_arn)
        delete_finding_aggregator(input)
      end

      def delete_finding_aggregator(input : Types::DeleteFindingAggregatorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FINDING_AGGREGATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the insight specified by the InsightArn .

      def delete_insight(
        insight_arn : String
      ) : Protocol::Request
        input = Types::DeleteInsightRequest.new(insight_arn: insight_arn)
        delete_insight(input)
      end

      def delete_insight(input : Types::DeleteInsightRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INSIGHT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # We recommend using Organizations instead of Security Hub invitations to manage your member accounts.
      # For information, see Managing Security Hub administrator and member accounts with Organizations in
      # the Security Hub User Guide . Deletes invitations to become a Security Hub member account. A
      # Security Hub administrator account can use this operation to delete invitations sent to one or more
      # prospective member accounts. This operation is only used to delete invitations that are sent to
      # prospective member accounts that aren't part of an Amazon Web Services organization. Organization
      # accounts don't receive invitations.

      def delete_invitations(
        account_ids : Array(String)
      ) : Protocol::Request
        input = Types::DeleteInvitationsRequest.new(account_ids: account_ids)
        delete_invitations(input)
      end

      def delete_invitations(input : Types::DeleteInvitationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INVITATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified member accounts from Security Hub. You can invoke this API only to delete
      # accounts that became members through invitation. You can't invoke this API to delete accounts that
      # belong to an Organizations organization.

      def delete_members(
        account_ids : Array(String)
      ) : Protocol::Request
        input = Types::DeleteMembersRequest.new(account_ids: account_ids)
        delete_members(input)
      end

      def delete_members(input : Types::DeleteMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the custom action targets in Security Hub in your account.

      def describe_action_targets(
        action_target_arns : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeActionTargetsRequest.new(action_target_arns: action_target_arns, max_results: max_results, next_token: next_token)
        describe_action_targets(input)
      end

      def describe_action_targets(input : Types::DescribeActionTargetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ACTION_TARGETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details about the Hub resource in your account, including the HubArn and the time when you
      # enabled Security Hub.

      def describe_hub(
        hub_arn : String? = nil
      ) : Protocol::Request
        input = Types::DescribeHubRequest.new(hub_arn: hub_arn)
        describe_hub(input)
      end

      def describe_hub(input : Types::DescribeHubRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_HUB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the way your organization is configured in Security Hub. Only the Security
      # Hub administrator account can invoke this operation.

      def describe_organization_configuration : Protocol::Request
        input = Types::DescribeOrganizationConfigurationRequest.new
        describe_organization_configuration(input)
      end

      def describe_organization_configuration(input : Types::DescribeOrganizationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ORGANIZATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about product integrations in Security Hub. You can optionally provide an
      # integration ARN. If you provide an integration ARN, then the results only include that integration.
      # If you don't provide an integration ARN, then the results include all of the available product
      # integrations.

      def describe_products(
        max_results : Int32? = nil,
        next_token : String? = nil,
        product_arn : String? = nil
      ) : Protocol::Request
        input = Types::DescribeProductsRequest.new(max_results: max_results, next_token: next_token, product_arn: product_arn)
        describe_products(input)
      end

      def describe_products(input : Types::DescribeProductsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PRODUCTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the product integration.

      def describe_products_v2(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeProductsV2Request.new(max_results: max_results, next_token: next_token)
        describe_products_v2(input)
      end

      def describe_products_v2(input : Types::DescribeProductsV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_PRODUCTS_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details about the service resource in your account.

      def describe_security_hub_v2 : Protocol::Request
        input = Types::DescribeSecurityHubV2Request.new
        describe_security_hub_v2(input)
      end

      def describe_security_hub_v2(input : Types::DescribeSecurityHubV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SECURITY_HUB_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the available standards in Security Hub. For each standard, the results include
      # the standard ARN, the name, and a description.

      def describe_standards(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeStandardsRequest.new(max_results: max_results, next_token: next_token)
        describe_standards(input)
      end

      def describe_standards(input : Types::DescribeStandardsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_STANDARDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of security standards controls. For each control, the results include information
      # about whether it is currently enabled, the severity, and a link to remediation information. This
      # operation returns an empty list for standard subscriptions where StandardsControlsUpdatable has
      # value NOT_READY_FOR_UPDATES .

      def describe_standards_controls(
        standards_subscription_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::DescribeStandardsControlsRequest.new(standards_subscription_arn: standards_subscription_arn, max_results: max_results, next_token: next_token)
        describe_standards_controls(input)
      end

      def describe_standards_controls(input : Types::DescribeStandardsControlsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_STANDARDS_CONTROLS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables the integration of the specified product with Security Hub. After the integration is
      # disabled, findings from that product are no longer sent to Security Hub.

      def disable_import_findings_for_product(
        product_subscription_arn : String
      ) : Protocol::Request
        input = Types::DisableImportFindingsForProductRequest.new(product_subscription_arn: product_subscription_arn)
        disable_import_findings_for_product(input)
      end

      def disable_import_findings_for_product(input : Types::DisableImportFindingsForProductRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_IMPORT_FINDINGS_FOR_PRODUCT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables a Security Hub administrator account. Can only be called by the organization management
      # account.

      def disable_organization_admin_account(
        admin_account_id : String,
        feature : String? = nil
      ) : Protocol::Request
        input = Types::DisableOrganizationAdminAccountRequest.new(admin_account_id: admin_account_id, feature: feature)
        disable_organization_admin_account(input)
      end

      def disable_organization_admin_account(input : Types::DisableOrganizationAdminAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_ORGANIZATION_ADMIN_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables Security Hub in your account only in the current Amazon Web Services Region. To disable
      # Security Hub in all Regions, you must submit one request per Region where you have enabled Security
      # Hub. You can't disable Security Hub in an account that is currently the Security Hub administrator.
      # When you disable Security Hub, your existing findings and insights and any Security Hub
      # configuration settings are deleted after 90 days and cannot be recovered. Any standards that were
      # enabled are disabled, and your administrator and member account associations are removed. If you
      # want to save your existing findings, you must export them before you disable Security Hub.

      def disable_security_hub : Protocol::Request
        input = Types::DisableSecurityHubRequest.new
        disable_security_hub(input)
      end

      def disable_security_hub(input : Types::DisableSecurityHubRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_SECURITY_HUB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disable the service for the current Amazon Web Services Region or specified Amazon Web Services
      # Region.

      def disable_security_hub_v2 : Protocol::Request
        input = Types::DisableSecurityHubV2Request.new
        disable_security_hub_v2(input)
      end

      def disable_security_hub_v2(input : Types::DisableSecurityHubV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_SECURITY_HUB_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates the current Security Hub member account from the associated administrator account.
      # This operation is only used by accounts that are not part of an organization. For organization
      # accounts, only the administrator account can disassociate a member account.

      def disassociate_from_administrator_account : Protocol::Request
        input = Types::DisassociateFromAdministratorAccountRequest.new
        disassociate_from_administrator_account(input)
      end

      def disassociate_from_administrator_account(input : Types::DisassociateFromAdministratorAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_FROM_ADMINISTRATOR_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This method is deprecated. Instead, use DisassociateFromAdministratorAccount . The Security Hub
      # console continues to use DisassociateFromMasterAccount . It will eventually change to use
      # DisassociateFromAdministratorAccount . Any IAM policies that specifically control access to this
      # function must continue to use DisassociateFromMasterAccount . You should also add
      # DisassociateFromAdministratorAccount to your policies to ensure that the correct permissions are in
      # place after the console begins to use DisassociateFromAdministratorAccount . Disassociates the
      # current Security Hub member account from the associated administrator account. This operation is
      # only used by accounts that are not part of an organization. For organization accounts, only the
      # administrator account can disassociate a member account.

      def disassociate_from_master_account : Protocol::Request
        input = Types::DisassociateFromMasterAccountRequest.new
        disassociate_from_master_account(input)
      end

      def disassociate_from_master_account(input : Types::DisassociateFromMasterAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_FROM_MASTER_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates the specified member accounts from the associated administrator account. Can be used
      # to disassociate both accounts that are managed using Organizations and accounts that were invited
      # manually.

      def disassociate_members(
        account_ids : Array(String)
      ) : Protocol::Request
        input = Types::DisassociateMembersRequest.new(account_ids: account_ids)
        disassociate_members(input)
      end

      def disassociate_members(input : Types::DisassociateMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables the integration of a partner product with Security Hub. Integrated products send findings to
      # Security Hub. When you enable a product integration, a permissions policy that grants permission for
      # the product to send findings to Security Hub is applied.

      def enable_import_findings_for_product(
        product_arn : String
      ) : Protocol::Request
        input = Types::EnableImportFindingsForProductRequest.new(product_arn: product_arn)
        enable_import_findings_for_product(input)
      end

      def enable_import_findings_for_product(input : Types::EnableImportFindingsForProductRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_IMPORT_FINDINGS_FOR_PRODUCT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Designates the Security Hub administrator account for an organization. Can only be called by the
      # organization management account.

      def enable_organization_admin_account(
        admin_account_id : String,
        feature : String? = nil
      ) : Protocol::Request
        input = Types::EnableOrganizationAdminAccountRequest.new(admin_account_id: admin_account_id, feature: feature)
        enable_organization_admin_account(input)
      end

      def enable_organization_admin_account(input : Types::EnableOrganizationAdminAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_ORGANIZATION_ADMIN_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables Security Hub for your account in the current Region or the Region you specify in the
      # request. When you enable Security Hub, you grant to Security Hub the permissions necessary to gather
      # findings from other services that are integrated with Security Hub. When you use the
      # EnableSecurityHub operation to enable Security Hub, you also automatically enable the following
      # standards: Center for Internet Security (CIS) Amazon Web Services Foundations Benchmark v1.2.0
      # Amazon Web Services Foundational Security Best Practices Other standards are not automatically
      # enabled. To opt out of automatically enabled standards, set EnableDefaultStandards to false . After
      # you enable Security Hub, to enable a standard, use the BatchEnableStandards operation. To disable a
      # standard, use the BatchDisableStandards operation. To learn more, see the setup information in the
      # Security Hub User Guide .

      def enable_security_hub(
        control_finding_generator : String? = nil,
        enable_default_standards : Bool? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::EnableSecurityHubRequest.new(control_finding_generator: control_finding_generator, enable_default_standards: enable_default_standards, tags: tags)
        enable_security_hub(input)
      end

      def enable_security_hub(input : Types::EnableSecurityHubRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_SECURITY_HUB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables the service in account for the current Amazon Web Services Region or specified Amazon Web
      # Services Region.

      def enable_security_hub_v2(
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::EnableSecurityHubV2Request.new(tags: tags)
        enable_security_hub_v2(input)
      end

      def enable_security_hub_v2(input : Types::EnableSecurityHubV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_SECURITY_HUB_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides the details for the Security Hub administrator account for the current member account. Can
      # be used by both member accounts that are managed using Organizations and accounts that were invited
      # manually.

      def get_administrator_account : Protocol::Request
        input = Types::GetAdministratorAccountRequest.new
        get_administrator_account(input)
      end

      def get_administrator_account(input : Types::GetAdministratorAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ADMINISTRATOR_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the configuration of the specified Aggregator V2.

      def get_aggregator_v2(
        aggregator_v2_arn : String
      ) : Protocol::Request
        input = Types::GetAggregatorV2Request.new(aggregator_v2_arn: aggregator_v2_arn)
        get_aggregator_v2(input)
      end

      def get_aggregator_v2(input : Types::GetAggregatorV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AGGREGATOR_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an automation rule for the V2 service.

      def get_automation_rule_v2(
        identifier : String
      ) : Protocol::Request
        input = Types::GetAutomationRuleV2Request.new(identifier: identifier)
        get_automation_rule_v2(input)
      end

      def get_automation_rule_v2(input : Types::GetAutomationRuleV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUTOMATION_RULE_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides information about a configuration policy. Only the Security Hub delegated administrator can
      # invoke this operation from the home Region.

      def get_configuration_policy(
        identifier : String
      ) : Protocol::Request
        input = Types::GetConfigurationPolicyRequest.new(identifier: identifier)
        get_configuration_policy(input)
      end

      def get_configuration_policy(input : Types::GetConfigurationPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURATION_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the association between a configuration and a target account, organizational unit, or the
      # root. The configuration can be a configuration policy or self-managed behavior. Only the Security
      # Hub delegated administrator can invoke this operation from the home Region.

      def get_configuration_policy_association(
        target : Types::Target
      ) : Protocol::Request
        input = Types::GetConfigurationPolicyAssociationRequest.new(target: target)
        get_configuration_policy_association(input)
      end

      def get_configuration_policy_association(input : Types::GetConfigurationPolicyAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURATION_POLICY_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Grants permission to retrieve details for a connectorV2 based on connector id.

      def get_connector_v2(
        connector_id : String
      ) : Protocol::Request
        input = Types::GetConnectorV2Request.new(connector_id: connector_id)
        get_connector_v2(input)
      end

      def get_connector_v2(input : Types::GetConnectorV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONNECTOR_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the standards that are currently enabled.

      def get_enabled_standards(
        max_results : Int32? = nil,
        next_token : String? = nil,
        standards_subscription_arns : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetEnabledStandardsRequest.new(max_results: max_results, next_token: next_token, standards_subscription_arns: standards_subscription_arns)
        get_enabled_standards(input)
      end

      def get_enabled_standards(input : Types::GetEnabledStandardsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENABLED_STANDARDS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The aggregation Region is now called the home Region . Returns the current configuration in the
      # calling account for cross-Region aggregation. A finding aggregator is a resource that establishes
      # the home Region and any linked Regions.

      def get_finding_aggregator(
        finding_aggregator_arn : String
      ) : Protocol::Request
        input = Types::GetFindingAggregatorRequest.new(finding_aggregator_arn: finding_aggregator_arn)
        get_finding_aggregator(input)
      end

      def get_finding_aggregator(input : Types::GetFindingAggregatorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FINDING_AGGREGATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the history of a Security Hub finding. The history includes changes made to any fields in
      # the Amazon Web Services Security Finding Format (ASFF) except top-level timestamp fields, such as
      # the CreatedAt and UpdatedAt fields. This operation might return fewer results than the maximum
      # number of results ( MaxResults ) specified in a request, even when more results are available. If
      # this occurs, the response includes a NextToken value, which you should use to retrieve the next set
      # of results in the response. The presence of a NextToken value in a response doesn't necessarily
      # indicate that the results are incomplete. However, you should continue to specify a NextToken value
      # until you receive a response that doesn't include this value.

      def get_finding_history(
        finding_identifier : Types::AwsSecurityFindingIdentifier,
        end_time : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        start_time : Time? = nil
      ) : Protocol::Request
        input = Types::GetFindingHistoryRequest.new(finding_identifier: finding_identifier, end_time: end_time, max_results: max_results, next_token: next_token, start_time: start_time)
        get_finding_history(input)
      end

      def get_finding_history(input : Types::GetFindingHistoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FINDING_HISTORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns aggregated statistical data about findings. GetFindingStatisticsV2 use
      # securityhub:GetAdhocInsightResults in the Action element of an IAM policy statement. You must have
      # permission to perform the s action.

      def get_finding_statistics_v2(
        group_by_rules : Array(Types::GroupByRule),
        max_statistic_results : Int32? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::GetFindingStatisticsV2Request.new(group_by_rules: group_by_rules, max_statistic_results: max_statistic_results, sort_order: sort_order)
        get_finding_statistics_v2(input)
      end

      def get_finding_statistics_v2(input : Types::GetFindingStatisticsV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FINDING_STATISTICS_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of findings that match the specified criteria. If cross-Region aggregation is
      # enabled, then when you call GetFindings from the home Region, the results include all of the
      # matching findings from both the home Region and linked Regions.

      def get_findings(
        filters : Types::AwsSecurityFindingFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_criteria : Array(Types::SortCriterion)? = nil
      ) : Protocol::Request
        input = Types::GetFindingsRequest.new(filters: filters, max_results: max_results, next_token: next_token, sort_criteria: sort_criteria)
        get_findings(input)
      end

      def get_findings(input : Types::GetFindingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns findings trend data based on the specified criteria. This operation helps you analyze
      # patterns and changes in findings over time.

      def get_findings_trends_v2(
        end_time : Time,
        start_time : Time,
        filters : Types::FindingsTrendsFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetFindingsTrendsV2Request.new(end_time: end_time, start_time: start_time, filters: filters, max_results: max_results, next_token: next_token)
        get_findings_trends_v2(input)
      end

      def get_findings_trends_v2(input : Types::GetFindingsTrendsV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FINDINGS_TRENDS_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Return a list of findings that match the specified criteria. GetFindings and GetFindingsV2 both use
      # securityhub:GetFindings in the Action element of an IAM policy statement. You must have permission
      # to perform the securityhub:GetFindings action.

      def get_findings_v2(
        filters : Types::OcsfFindingFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_criteria : Array(Types::SortCriterion)? = nil
      ) : Protocol::Request
        input = Types::GetFindingsV2Request.new(filters: filters, max_results: max_results, next_token: next_token, sort_criteria: sort_criteria)
        get_findings_v2(input)
      end

      def get_findings_v2(input : Types::GetFindingsV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FINDINGS_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the results of the Security Hub insight specified by the insight ARN.

      def get_insight_results(
        insight_arn : String
      ) : Protocol::Request
        input = Types::GetInsightResultsRequest.new(insight_arn: insight_arn)
        get_insight_results(input)
      end

      def get_insight_results(input : Types::GetInsightResultsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INSIGHT_RESULTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists and describes insights for the specified insight ARNs.

      def get_insights(
        insight_arns : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetInsightsRequest.new(insight_arns: insight_arns, max_results: max_results, next_token: next_token)
        get_insights(input)
      end

      def get_insights(input : Types::GetInsightsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INSIGHTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # We recommend using Organizations instead of Security Hub invitations to manage your member accounts.
      # For information, see Managing Security Hub administrator and member accounts with Organizations in
      # the Security Hub User Guide . Returns the count of all Security Hub membership invitations that were
      # sent to the calling member account, not including the currently accepted invitation.

      def get_invitations_count : Protocol::Request
        input = Types::GetInvitationsCountRequest.new
        get_invitations_count(input)
      end

      def get_invitations_count(input : Types::GetInvitationsCountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INVITATIONS_COUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This method is deprecated. Instead, use GetAdministratorAccount . The Security Hub console continues
      # to use GetMasterAccount . It will eventually change to use GetAdministratorAccount . Any IAM
      # policies that specifically control access to this function must continue to use GetMasterAccount .
      # You should also add GetAdministratorAccount to your policies to ensure that the correct permissions
      # are in place after the console begins to use GetAdministratorAccount . Provides the details for the
      # Security Hub administrator account for the current member account. Can be used by both member
      # accounts that are managed using Organizations and accounts that were invited manually.

      def get_master_account : Protocol::Request
        input = Types::GetMasterAccountRequest.new
        get_master_account(input)
      end

      def get_master_account(input : Types::GetMasterAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MASTER_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the details for the Security Hub member accounts for the specified account IDs. An
      # administrator account can be either the delegated Security Hub administrator account for an
      # organization or an administrator account that enabled Security Hub manually. The results include
      # both member accounts that are managed using Organizations and accounts that were invited manually.

      def get_members(
        account_ids : Array(String)
      ) : Protocol::Request
        input = Types::GetMembersRequest.new(account_ids: account_ids)
        get_members(input)
      end

      def get_members(input : Types::GetMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves statistical information about Amazon Web Services resources and their associated security
      # findings.

      def get_resources_statistics_v2(
        group_by_rules : Array(Types::ResourceGroupByRule),
        max_statistic_results : Int32? = nil,
        sort_order : String? = nil
      ) : Protocol::Request
        input = Types::GetResourcesStatisticsV2Request.new(group_by_rules: group_by_rules, max_statistic_results: max_statistic_results, sort_order: sort_order)
        get_resources_statistics_v2(input)
      end

      def get_resources_statistics_v2(input : Types::GetResourcesStatisticsV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCES_STATISTICS_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns resource trend data based on the specified criteria. This operation helps you analyze
      # patterns and changes in resource compliance over time.

      def get_resources_trends_v2(
        end_time : Time,
        start_time : Time,
        filters : Types::ResourcesTrendsFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetResourcesTrendsV2Request.new(end_time: end_time, start_time: start_time, filters: filters, max_results: max_results, next_token: next_token)
        get_resources_trends_v2(input)
      end

      def get_resources_trends_v2(input : Types::GetResourcesTrendsV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCES_TRENDS_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of resources.

      def get_resources_v2(
        filters : Types::ResourcesFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_criteria : Array(Types::SortCriterion)? = nil
      ) : Protocol::Request
        input = Types::GetResourcesV2Request.new(filters: filters, max_results: max_results, next_token: next_token, sort_criteria: sort_criteria)
        get_resources_v2(input)
      end

      def get_resources_v2(input : Types::GetResourcesV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCES_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the definition of a security control. The definition includes the control title,
      # description, Region availability, parameter definitions, and other details.

      def get_security_control_definition(
        security_control_id : String
      ) : Protocol::Request
        input = Types::GetSecurityControlDefinitionRequest.new(security_control_id: security_control_id)
        get_security_control_definition(input)
      end

      def get_security_control_definition(input : Types::GetSecurityControlDefinitionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SECURITY_CONTROL_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # We recommend using Organizations instead of Security Hub invitations to manage your member accounts.
      # For information, see Managing Security Hub administrator and member accounts with Organizations in
      # the Security Hub User Guide . Invites other Amazon Web Services accounts to become member accounts
      # for the Security Hub administrator account that the invitation is sent from. This operation is only
      # used to invite accounts that don't belong to an Amazon Web Services organization. Organization
      # accounts don't receive invitations. Before you can use this action to invite a member, you must
      # first use the CreateMembers action to create the member account in Security Hub. When the account
      # owner enables Security Hub and accepts the invitation to become a member account, the administrator
      # account can view the findings generated in the member account.

      def invite_members(
        account_ids : Array(String)
      ) : Protocol::Request
        input = Types::InviteMembersRequest.new(account_ids: account_ids)
        invite_members(input)
      end

      def invite_members(input : Types::InviteMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::INVITE_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of V2 aggregators.

      def list_aggregators_v2(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAggregatorsV2Request.new(max_results: max_results, next_token: next_token)
        list_aggregators_v2(input)
      end

      def list_aggregators_v2(input : Types::ListAggregatorsV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AGGREGATORS_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A list of automation rules and their metadata for the calling account.

      def list_automation_rules(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAutomationRulesRequest.new(max_results: max_results, next_token: next_token)
        list_automation_rules(input)
      end

      def list_automation_rules(input : Types::ListAutomationRulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AUTOMATION_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of automation rules and metadata for the calling account.

      def list_automation_rules_v2(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAutomationRulesV2Request.new(max_results: max_results, next_token: next_token)
        list_automation_rules_v2(input)
      end

      def list_automation_rules_v2(input : Types::ListAutomationRulesV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_AUTOMATION_RULES_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the configuration policies that the Security Hub delegated administrator has created for your
      # organization. Only the delegated administrator can invoke this operation from the home Region.

      def list_configuration_policies(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConfigurationPoliciesRequest.new(max_results: max_results, next_token: next_token)
        list_configuration_policies(input)
      end

      def list_configuration_policies(input : Types::ListConfigurationPoliciesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGURATION_POLICIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides information about the associations for your configuration policies and self-managed
      # behavior. Only the Security Hub delegated administrator can invoke this operation from the home
      # Region.

      def list_configuration_policy_associations(
        filters : Types::AssociationFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConfigurationPolicyAssociationsRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        list_configuration_policy_associations(input)
      end

      def list_configuration_policy_associations(input : Types::ListConfigurationPolicyAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGURATION_POLICY_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Grants permission to retrieve a list of connectorsV2 and their metadata for the calling account.

      def list_connectors_v2(
        connector_status : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        provider_name : String? = nil
      ) : Protocol::Request
        input = Types::ListConnectorsV2Request.new(connector_status: connector_status, max_results: max_results, next_token: next_token, provider_name: provider_name)
        list_connectors_v2(input)
      end

      def list_connectors_v2(input : Types::ListConnectorsV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONNECTORS_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all findings-generating solutions (products) that you are subscribed to receive findings from
      # in Security Hub.

      def list_enabled_products_for_import(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEnabledProductsForImportRequest.new(max_results: max_results, next_token: next_token)
        list_enabled_products_for_import(input)
      end

      def list_enabled_products_for_import(input : Types::ListEnabledProductsForImportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENABLED_PRODUCTS_FOR_IMPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # If cross-Region aggregation is enabled, then ListFindingAggregators returns the Amazon Resource Name
      # (ARN) of the finding aggregator. You can run this operation from any Amazon Web Services Region.

      def list_finding_aggregators(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFindingAggregatorsRequest.new(max_results: max_results, next_token: next_token)
        list_finding_aggregators(input)
      end

      def list_finding_aggregators(input : Types::ListFindingAggregatorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FINDING_AGGREGATORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # We recommend using Organizations instead of Security Hub invitations to manage your member accounts.
      # For information, see Managing Security Hub administrator and member accounts with Organizations in
      # the Security Hub User Guide . Lists all Security Hub membership invitations that were sent to the
      # calling account. Only accounts that are managed by invitation can use this operation. Accounts that
      # are managed using the integration with Organizations don't receive invitations.

      def list_invitations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListInvitationsRequest.new(max_results: max_results, next_token: next_token)
        list_invitations(input)
      end

      def list_invitations(input : Types::ListInvitationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_INVITATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists details about all member accounts for the current Security Hub administrator account. The
      # results include both member accounts that belong to an organization and member accounts that were
      # invited manually.

      def list_members(
        max_results : Int32? = nil,
        next_token : String? = nil,
        only_associated : Bool? = nil
      ) : Protocol::Request
        input = Types::ListMembersRequest.new(max_results: max_results, next_token: next_token, only_associated: only_associated)
        list_members(input)
      end

      def list_members(input : Types::ListMembersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MEMBERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the Security Hub administrator accounts. Can only be called by the organization management
      # account.

      def list_organization_admin_accounts(
        feature : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListOrganizationAdminAccountsRequest.new(feature: feature, max_results: max_results, next_token: next_token)
        list_organization_admin_accounts(input)
      end

      def list_organization_admin_accounts(input : Types::ListOrganizationAdminAccountsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ORGANIZATION_ADMIN_ACCOUNTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the security controls that apply to a specified standard.

      def list_security_control_definitions(
        max_results : Int32? = nil,
        next_token : String? = nil,
        standards_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListSecurityControlDefinitionsRequest.new(max_results: max_results, next_token: next_token, standards_arn: standards_arn)
        list_security_control_definitions(input)
      end

      def list_security_control_definitions(input : Types::ListSecurityControlDefinitionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SECURITY_CONTROL_DEFINITIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Specifies whether a control is currently enabled or disabled in each enabled standard in the calling
      # account. This operation omits standards control associations for standard subscriptions where
      # StandardsControlsUpdatable has value NOT_READY_FOR_UPDATES .

      def list_standards_control_associations(
        security_control_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListStandardsControlAssociationsRequest.new(security_control_id: security_control_id, max_results: max_results, next_token: next_token)
        list_standards_control_associations(input)
      end

      def list_standards_control_associations(input : Types::ListStandardsControlAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_STANDARDS_CONTROL_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of tags associated with a resource.

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

      # Grants permission to complete the authorization based on input parameters.

      def register_connector_v2(
        auth_code : String,
        auth_state : String
      ) : Protocol::Request
        input = Types::RegisterConnectorV2Request.new(auth_code: auth_code, auth_state: auth_state)
        register_connector_v2(input)
      end

      def register_connector_v2(input : Types::RegisterConnectorV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REGISTER_CONNECTOR_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates a target account, organizational unit, or the root with a specified configuration. The
      # target can be associated with a configuration policy or self-managed behavior. Only the Security Hub
      # delegated administrator can invoke this operation from the home Region.

      def start_configuration_policy_association(
        configuration_policy_identifier : String,
        target : Types::Target
      ) : Protocol::Request
        input = Types::StartConfigurationPolicyAssociationRequest.new(configuration_policy_identifier: configuration_policy_identifier, target: target)
        start_configuration_policy_association(input)
      end

      def start_configuration_policy_association(input : Types::StartConfigurationPolicyAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CONFIGURATION_POLICY_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociates a target account, organizational unit, or the root from a specified configuration.
      # When you disassociate a configuration from its target, the target inherits the configuration of the
      # closest parent. If there’s no configuration to inherit, the target retains its settings but becomes
      # a self-managed account. A target can be disassociated from a configuration policy or self-managed
      # behavior. Only the Security Hub delegated administrator can invoke this operation from the home
      # Region.

      def start_configuration_policy_disassociation(
        configuration_policy_identifier : String,
        target : Types::Target? = nil
      ) : Protocol::Request
        input = Types::StartConfigurationPolicyDisassociationRequest.new(configuration_policy_identifier: configuration_policy_identifier, target: target)
        start_configuration_policy_disassociation(input)
      end

      def start_configuration_policy_disassociation(input : Types::StartConfigurationPolicyDisassociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CONFIGURATION_POLICY_DISASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds one or more tags to a resource.

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

      # Removes one or more tags from a resource.

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

      # Updates the name and description of a custom action target in Security Hub.

      def update_action_target(
        action_target_arn : String,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateActionTargetRequest.new(action_target_arn: action_target_arn, description: description, name: name)
        update_action_target(input)
      end

      def update_action_target(input : Types::UpdateActionTargetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACTION_TARGET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Udpates the configuration for the Aggregator V2.

      def update_aggregator_v2(
        aggregator_v2_arn : String,
        region_linking_mode : String,
        linked_regions : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateAggregatorV2Request.new(aggregator_v2_arn: aggregator_v2_arn, region_linking_mode: region_linking_mode, linked_regions: linked_regions)
        update_aggregator_v2(input)
      end

      def update_aggregator_v2(input : Types::UpdateAggregatorV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AGGREGATOR_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a V2 automation rule.

      def update_automation_rule_v2(
        identifier : String,
        actions : Array(Types::AutomationRulesActionV2)? = nil,
        criteria : Types::Criteria? = nil,
        description : String? = nil,
        rule_name : String? = nil,
        rule_order : Float64? = nil,
        rule_status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAutomationRuleV2Request.new(identifier: identifier, actions: actions, criteria: criteria, description: description, rule_name: rule_name, rule_order: rule_order, rule_status: rule_status)
        update_automation_rule_v2(input)
      end

      def update_automation_rule_v2(input : Types::UpdateAutomationRuleV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AUTOMATION_RULE_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a configuration policy. Only the Security Hub delegated administrator can invoke this
      # operation from the home Region.

      def update_configuration_policy(
        identifier : String,
        configuration_policy : Types::Policy? = nil,
        description : String? = nil,
        name : String? = nil,
        updated_reason : String? = nil
      ) : Protocol::Request
        input = Types::UpdateConfigurationPolicyRequest.new(identifier: identifier, configuration_policy: configuration_policy, description: description, name: name, updated_reason: updated_reason)
        update_configuration_policy(input)
      end

      def update_configuration_policy(input : Types::UpdateConfigurationPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONFIGURATION_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Grants permission to update a connectorV2 based on its id and input parameters.

      def update_connector_v2(
        connector_id : String,
        description : String? = nil,
        provider : Types::ProviderUpdateConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateConnectorV2Request.new(connector_id: connector_id, description: description, provider: provider)
        update_connector_v2(input)
      end

      def update_connector_v2(input : Types::UpdateConnectorV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONNECTOR_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The aggregation Region is now called the home Region . Updates cross-Region aggregation settings.
      # You can use this operation to update the Region linking mode and the list of included or excluded
      # Amazon Web Services Regions. However, you can't use this operation to change the home Region. You
      # can invoke this operation from the current home Region only.

      def update_finding_aggregator(
        finding_aggregator_arn : String,
        region_linking_mode : String,
        regions : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateFindingAggregatorRequest.new(finding_aggregator_arn: finding_aggregator_arn, region_linking_mode: region_linking_mode, regions: regions)
        update_finding_aggregator(input)
      end

      def update_finding_aggregator(input : Types::UpdateFindingAggregatorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FINDING_AGGREGATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # UpdateFindings is a deprecated operation. Instead of UpdateFindings , use the BatchUpdateFindings
      # operation. The UpdateFindings operation updates the Note and RecordState of the Security Hub
      # aggregated findings that the filter attributes specify. Any member account that can view the finding
      # can also see the update to the finding. Finding updates made with UpdateFindings aren't persisted if
      # the same finding is later updated by the finding provider through the BatchImportFindings operation.
      # In addition, Security Hub doesn't record updates made with UpdateFindings in the finding history.

      def update_findings(
        filters : Types::AwsSecurityFindingFilters,
        note : Types::NoteUpdate? = nil,
        record_state : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFindingsRequest.new(filters: filters, note: note, record_state: record_state)
        update_findings(input)
      end

      def update_findings(input : Types::UpdateFindingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the Security Hub insight identified by the specified insight ARN.

      def update_insight(
        insight_arn : String,
        filters : Types::AwsSecurityFindingFilters? = nil,
        group_by_attribute : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateInsightRequest.new(insight_arn: insight_arn, filters: filters, group_by_attribute: group_by_attribute, name: name)
        update_insight(input)
      end

      def update_insight(input : Types::UpdateInsightRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INSIGHT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the configuration of your organization in Security Hub. Only the Security Hub administrator
      # account can invoke this operation.

      def update_organization_configuration(
        auto_enable : Bool,
        auto_enable_standards : String? = nil,
        organization_configuration : Types::OrganizationConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateOrganizationConfigurationRequest.new(auto_enable: auto_enable, auto_enable_standards: auto_enable_standards, organization_configuration: organization_configuration)
        update_organization_configuration(input)
      end

      def update_organization_configuration(input : Types::UpdateOrganizationConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ORGANIZATION_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the properties of a security control.

      def update_security_control(
        parameters : Hash(String, Types::ParameterConfiguration),
        security_control_id : String,
        last_update_reason : String? = nil
      ) : Protocol::Request
        input = Types::UpdateSecurityControlRequest.new(parameters: parameters, security_control_id: security_control_id, last_update_reason: last_update_reason)
        update_security_control(input)
      end

      def update_security_control(input : Types::UpdateSecurityControlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SECURITY_CONTROL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates configuration options for Security Hub.

      def update_security_hub_configuration(
        auto_enable_controls : Bool? = nil,
        control_finding_generator : String? = nil
      ) : Protocol::Request
        input = Types::UpdateSecurityHubConfigurationRequest.new(auto_enable_controls: auto_enable_controls, control_finding_generator: control_finding_generator)
        update_security_hub_configuration(input)
      end

      def update_security_hub_configuration(input : Types::UpdateSecurityHubConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SECURITY_HUB_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Used to control whether an individual security standard control is enabled or disabled. Calls to
      # this operation return a RESOURCE_NOT_FOUND_EXCEPTION error when the standard subscription for the
      # control has StandardsControlsUpdatable value NOT_READY_FOR_UPDATES .

      def update_standards_control(
        standards_control_arn : String,
        control_status : String? = nil,
        disabled_reason : String? = nil
      ) : Protocol::Request
        input = Types::UpdateStandardsControlRequest.new(standards_control_arn: standards_control_arn, control_status: control_status, disabled_reason: disabled_reason)
        update_standards_control(input)
      end

      def update_standards_control(input : Types::UpdateStandardsControlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_STANDARDS_CONTROL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
