module Aws
  module SSM
    module Errors
      class ServiceError < Exception
      end

      # The requester doesn't have permissions to perform the requested operation.

      class AccessDeniedException < ServiceError
      end

      # Error returned if an attempt is made to register a patch group with a patch baseline that is already
      # registered with a different patch baseline.

      class AlreadyExistsException < ServiceError
      end

      # You must disassociate a document from all managed nodes before you can delete it.

      class AssociatedInstances < ServiceError
      end

      # The specified association already exists.

      class AssociationAlreadyExists < ServiceError
      end

      # The specified association doesn't exist.

      class AssociationDoesNotExist < ServiceError
      end

      # The specified execution ID doesn't exist. Verify the ID number and try again.

      class AssociationExecutionDoesNotExist < ServiceError
      end

      # You can have at most 2,000 active associations.

      class AssociationLimitExceeded < ServiceError
      end

      # You have reached the maximum number versions allowed for an association. Each association has a
      # limit of 1,000 versions.

      class AssociationVersionLimitExceeded < ServiceError
      end

      # Indicates that the Change Manager change template used in the change request was rejected or is
      # still in a pending state.

      class AutomationDefinitionNotApprovedException < ServiceError
      end

      # An Automation runbook with the specified name couldn't be found.

      class AutomationDefinitionNotFoundException < ServiceError
      end

      # An Automation runbook with the specified name and version couldn't be found.

      class AutomationDefinitionVersionNotFoundException < ServiceError
      end

      # The number of simultaneously running Automation executions exceeded the allowable limit.

      class AutomationExecutionLimitExceededException < ServiceError
      end

      # There is no automation execution information for the requested automation execution ID.

      class AutomationExecutionNotFoundException < ServiceError
      end

      # The specified step name and execution ID don't exist. Verify the information and try again.

      class AutomationStepNotFoundException < ServiceError
      end

      # You specified too many custom compliance types. You can specify a maximum of 10 different types.

      class ComplianceTypeCountLimitExceededException < ServiceError
      end

      # You have exceeded the limit for custom schemas. Delete one or more custom schemas and try again.

      class CustomSchemaCountLimitExceededException < ServiceError
      end

      # The specified document already exists.

      class DocumentAlreadyExists < ServiceError
      end

      # You can have at most 500 active SSM documents.

      class DocumentLimitExceeded < ServiceError
      end

      # The document can't be shared with more Amazon Web Services accounts. You can specify a maximum of 20
      # accounts per API operation to share a private document. By default, you can share a private document
      # with a maximum of 1,000 accounts and publicly share up to five documents. If you need to increase
      # the quota for privately or publicly shared Systems Manager documents, contact Amazon Web Services
      # Support.

      class DocumentPermissionLimit < ServiceError
      end

      # The document has too many versions. Delete one or more document versions and try again.

      class DocumentVersionLimitExceeded < ServiceError
      end

      # Error returned when the ID specified for a resource, such as a maintenance window or patch baseline,
      # doesn't exist. For information about resource quotas in Amazon Web Services Systems Manager, see
      # Systems Manager service quotas in the Amazon Web Services General Reference .

      class DoesNotExistException < ServiceError
      end

      # The content of the association document matches another document. Change the content of the document
      # and try again.

      class DuplicateDocumentContent < ServiceError
      end

      # The version name has already been used in this document. Specify a different version name, and then
      # try again.

      class DuplicateDocumentVersionName < ServiceError
      end

      # You can't specify a managed node ID in more than one association.

      class DuplicateInstanceId < ServiceError
      end

      # You attempted to register a LAMBDA or STEP_FUNCTIONS task in a region where the corresponding
      # service isn't available.

      class FeatureNotAvailableException < ServiceError
      end

      # A hierarchy can have a maximum of 15 levels. For more information, see Requirements and constraints
      # for parameter names in the Amazon Web Services Systems Manager User Guide .

      class HierarchyLevelLimitExceededException < ServiceError
      end

      # Parameter Store doesn't support changing a parameter type in a hierarchy. For example, you can't
      # change a parameter from a String type to a SecureString type. You must create a new, unique
      # parameter.

      class HierarchyTypeMismatchException < ServiceError
      end

      # Error returned when an idempotent operation is retried and the parameters don't match the original
      # call to the API with the same idempotency token.

      class IdempotentParameterMismatch < ServiceError
      end

      # There is a conflict in the policies specified for this parameter. You can't, for example, specify
      # two Expiration policies for a parameter. Review your policies, and try again.

      class IncompatiblePolicyException < ServiceError
      end

      # An error occurred on the server side.

      class InternalServerError < ServiceError
      end

      # The activation isn't valid. The activation might have been deleted, or the ActivationId and the
      # ActivationCode don't match.

      class InvalidActivation < ServiceError
      end

      # The activation ID isn't valid. Verify that you entered the correct ActivationId or ActivationCode
      # and try again.

      class InvalidActivationId < ServiceError
      end

      # The specified aggregator isn't valid for the group type. Verify that the aggregator you provided is
      # supported.

      class InvalidAggregatorException < ServiceError
      end

      # The request doesn't meet the regular expression requirement.

      class InvalidAllowedPatternException < ServiceError
      end

      # The association isn't valid or doesn't exist.

      class InvalidAssociation < ServiceError
      end

      # The version you specified isn't valid. Use ListAssociationVersions to view all versions of an
      # association according to the association ID. Or, use the $LATEST parameter to view the latest
      # version of the association.

      class InvalidAssociationVersion < ServiceError
      end

      # The supplied parameters for invoking the specified Automation runbook are incorrect. For example,
      # they may not match the set of parameters permitted for the specified Automation document.

      class InvalidAutomationExecutionParametersException < ServiceError
      end

      # The signal isn't valid for the current Automation execution.

      class InvalidAutomationSignalException < ServiceError
      end

      # The specified update status operation isn't valid.

      class InvalidAutomationStatusUpdateException < ServiceError
      end

      # The specified command ID isn't valid. Verify the ID and try again.

      class InvalidCommandId < ServiceError
      end

      # One or more of the parameters specified for the delete operation isn't valid. Verify all parameters
      # and try again.

      class InvalidDeleteInventoryParametersException < ServiceError
      end

      # The ID specified for the delete operation doesn't exist or isn't valid. Verify the ID and try again.

      class InvalidDeletionIdException < ServiceError
      end

      # The specified SSM document doesn't exist.

      class InvalidDocument < ServiceError
      end

      # The content for the document isn't valid.

      class InvalidDocumentContent < ServiceError
      end

      # You attempted to delete a document while it is still shared. You must stop sharing the document
      # before you can delete it.

      class InvalidDocumentOperation < ServiceError
      end

      # The version of the document schema isn't supported.

      class InvalidDocumentSchemaVersion < ServiceError
      end

      # The SSM document type isn't valid. Valid document types are described in the DocumentType property.

      class InvalidDocumentType < ServiceError
      end

      # The document version isn't valid or doesn't exist.

      class InvalidDocumentVersion < ServiceError
      end

      # The filter name isn't valid. Verify that you entered the correct name and try again.

      class InvalidFilter < ServiceError
      end

      # The specified key isn't valid.

      class InvalidFilterKey < ServiceError
      end

      # The specified filter option isn't valid. Valid options are Equals and BeginsWith. For Path filter,
      # valid options are Recursive and OneLevel.

      class InvalidFilterOption < ServiceError
      end

      # The filter value isn't valid. Verify the value and try again.

      class InvalidFilterValue < ServiceError
      end

      # The following problems can cause this exception: You don't have permission to access the managed
      # node. Amazon Web Services Systems Manager Agent (SSM Agent) isn't running. Verify that SSM Agent is
      # running. SSM Agent isn't registered with the SSM endpoint. Try reinstalling SSM Agent. The managed
      # node isn't in a valid state. Valid states are: Running , Pending , Stopped , and Stopping . Invalid
      # states are: Shutting-down and Terminated .

      class InvalidInstanceId < ServiceError
      end

      # The specified filter value isn't valid.

      class InvalidInstanceInformationFilterValue < ServiceError
      end

      # The specified filter value isn't valid.

      class InvalidInstancePropertyFilterValue < ServiceError
      end

      # The specified inventory group isn't valid.

      class InvalidInventoryGroupException < ServiceError
      end

      # You specified invalid keys or values in the Context attribute for InventoryItem . Verify the keys
      # and values, and try again.

      class InvalidInventoryItemContextException < ServiceError
      end

      # The request isn't valid.

      class InvalidInventoryRequestException < ServiceError
      end

      # One or more content items isn't valid.

      class InvalidItemContentException < ServiceError
      end

      # The query key ID isn't valid.

      class InvalidKeyId < ServiceError
      end

      # The specified token isn't valid.

      class InvalidNextToken < ServiceError
      end

      # One or more configuration items isn't valid. Verify that a valid Amazon Resource Name (ARN) was
      # provided for an Amazon Simple Notification Service topic.

      class InvalidNotificationConfig < ServiceError
      end

      # The delete inventory option specified isn't valid. Verify the option and try again.

      class InvalidOptionException < ServiceError
      end

      # The S3 bucket doesn't exist.

      class InvalidOutputFolder < ServiceError
      end

      # The output location isn't valid or doesn't exist.

      class InvalidOutputLocation < ServiceError
      end

      # You must specify values for all required parameters in the Amazon Web Services Systems Manager
      # document (SSM document). You can only supply values to parameters defined in the SSM document.

      class InvalidParameters < ServiceError
      end

      # The permission type isn't supported. Share is the only supported permission type.

      class InvalidPermissionType < ServiceError
      end

      # The plugin name isn't valid.

      class InvalidPluginName < ServiceError
      end

      # A policy attribute or its value is invalid.

      class InvalidPolicyAttributeException < ServiceError
      end

      # The policy type isn't supported. Parameter Store supports the following policy types: Expiration,
      # ExpirationNotification, and NoChangeNotification.

      class InvalidPolicyTypeException < ServiceError
      end

      # The resource ID isn't valid. Verify that you entered the correct ID and try again.

      class InvalidResourceId < ServiceError
      end

      # The resource type isn't valid. For example, if you are attempting to tag an EC2 instance, the
      # instance must be a registered managed node.

      class InvalidResourceType < ServiceError
      end

      # The specified inventory item result attribute isn't valid.

      class InvalidResultAttributeException < ServiceError
      end

      # The role name can't contain invalid characters. Also verify that you specified an IAM role for
      # notifications that includes the required trust policy. For information about configuring the IAM
      # role for Run Command notifications, see Monitoring Systems Manager status changes using Amazon SNS
      # notifications in the Amazon Web Services Systems Manager User Guide .

      class InvalidRole < ServiceError
      end

      # The schedule is invalid. Verify your cron or rate expression and try again.

      class InvalidSchedule < ServiceError
      end

      # The specified tag key or value isn't valid.

      class InvalidTag < ServiceError
      end

      # The target isn't valid or doesn't exist. It might not be configured for Systems Manager or you might
      # not have permission to perform the operation.

      class InvalidTarget < ServiceError
      end

      # TargetMap parameter isn't valid.

      class InvalidTargetMaps < ServiceError
      end

      # The parameter type name isn't valid.

      class InvalidTypeNameException < ServiceError
      end

      # The update isn't valid.

      class InvalidUpdate < ServiceError
      end

      # The command ID and managed node ID you specified didn't match any invocations. Verify the command ID
      # and the managed node ID and try again.

      class InvocationDoesNotExist < ServiceError
      end

      # The inventory item has invalid content.

      class ItemContentMismatchException < ServiceError
      end

      # The inventory item size has exceeded the size limit.

      class ItemSizeLimitExceededException < ServiceError
      end

      # The specified policy document is malformed or invalid, or excessive PutResourcePolicy or
      # DeleteResourcePolicy calls have been made.

      class MalformedResourcePolicyDocumentException < ServiceError
      end

      # The size limit of a document is 64 KB.

      class MaxDocumentSizeExceeded < ServiceError
      end

      # The requested operation is no longer supported by Systems Manager.

      class NoLongerSupportedException < ServiceError
      end

      # You don't have permission to view OpsItems in the specified account. Verify that your account is
      # configured either as a Systems Manager delegated administrator or that you are logged into the
      # Organizations management account.

      class OpsItemAccessDeniedException < ServiceError
      end

      # The OpsItem already exists.

      class OpsItemAlreadyExistsException < ServiceError
      end

      # The specified OpsItem is in the process of being deleted.

      class OpsItemConflictException < ServiceError
      end

      # A specified parameter argument isn't valid. Verify the available arguments and try again.

      class OpsItemInvalidParameterException < ServiceError
      end

      # The request caused OpsItems to exceed one or more quotas.

      class OpsItemLimitExceededException < ServiceError
      end

      # The specified OpsItem ID doesn't exist. Verify the ID and try again.

      class OpsItemNotFoundException < ServiceError
      end

      # The Amazon Resource Name (ARN) is already associated with the OpsItem.

      class OpsItemRelatedItemAlreadyExistsException < ServiceError
      end

      # The association wasn't found using the parameters you specified in the call. Verify the information
      # and try again.

      class OpsItemRelatedItemAssociationNotFoundException < ServiceError
      end

      # An OpsMetadata object already exists for the selected resource.

      class OpsMetadataAlreadyExistsException < ServiceError
      end

      # One of the arguments passed is invalid.

      class OpsMetadataInvalidArgumentException < ServiceError
      end

      # The OpsMetadata object exceeds the maximum number of OpsMetadata keys that you can assign to an
      # application in Application Manager.

      class OpsMetadataKeyLimitExceededException < ServiceError
      end

      # Your account reached the maximum number of OpsMetadata objects allowed by Application Manager. The
      # maximum is 200 OpsMetadata objects. Delete one or more OpsMetadata object and try again.

      class OpsMetadataLimitExceededException < ServiceError
      end

      # The OpsMetadata object doesn't exist.

      class OpsMetadataNotFoundException < ServiceError
      end

      # The system is processing too many concurrent updates. Wait a few moments and try again.

      class OpsMetadataTooManyUpdatesException < ServiceError
      end

      # The parameter already exists. You can't create duplicate parameters.

      class ParameterAlreadyExists < ServiceError
      end

      # You have exceeded the number of parameters for this Amazon Web Services account. Delete one or more
      # parameters and try again.

      class ParameterLimitExceeded < ServiceError
      end

      # Parameter Store retains the 100 most recently created versions of a parameter. After this number of
      # versions has been created, Parameter Store deletes the oldest version when a new one is created.
      # However, if the oldest version has a label attached to it, Parameter Store won't delete the version
      # and instead presents this error message: An error occurred (ParameterMaxVersionLimitExceeded) when
      # calling the PutParameter operation: You attempted to create a new version of parameter-name by
      # calling the PutParameter API with the overwrite flag. Version version-number , the oldest version,
      # can't be deleted because it has a label associated with it. Move the label to another version of the
      # parameter, and try again. This safeguard is to prevent parameter versions with mission critical
      # labels assigned to them from being deleted. To continue creating new parameters, first move the
      # label from the oldest version of the parameter to a newer one for use in your operations. For
      # information about moving parameter labels, see Move a parameter label (console) or Move a parameter
      # label (CLI) in the Amazon Web Services Systems Manager User Guide .

      class ParameterMaxVersionLimitExceeded < ServiceError
      end

      # The parameter couldn't be found. Verify the name and try again. For the DeleteParameter and
      # GetParameter actions, if the specified parameter doesn't exist, the ParameterNotFound exception is
      # not recorded in CloudTrail event logs.

      class ParameterNotFound < ServiceError
      end

      # The parameter name isn't valid.

      class ParameterPatternMismatchException < ServiceError
      end

      # A parameter version can have a maximum of ten labels.

      class ParameterVersionLabelLimitExceeded < ServiceError
      end

      # The specified parameter version wasn't found. Verify the parameter name and version, and try again.

      class ParameterVersionNotFound < ServiceError
      end

      # You specified more than the maximum number of allowed policies for the parameter. The maximum is 10.

      class PoliciesLimitExceededException < ServiceError
      end

      # A sync configuration with the same name already exists.

      class ResourceDataSyncAlreadyExistsException < ServiceError
      end

      # Another UpdateResourceDataSync request is being processed. Wait a few minutes and try again.

      class ResourceDataSyncConflictException < ServiceError
      end

      # You have exceeded the allowed maximum sync configurations.

      class ResourceDataSyncCountExceededException < ServiceError
      end

      # The specified sync configuration is invalid.

      class ResourceDataSyncInvalidConfigurationException < ServiceError
      end

      # The specified sync name wasn't found.

      class ResourceDataSyncNotFoundException < ServiceError
      end

      # Error returned if an attempt is made to delete a patch baseline that is registered for a patch
      # group.

      class ResourceInUseException < ServiceError
      end

      # Error returned when the caller has exceeded the default resource quotas. For example, too many
      # maintenance windows or patch baselines have been created. For information about resource quotas in
      # Systems Manager, see Systems Manager service quotas in the Amazon Web Services General Reference .

      class ResourceLimitExceededException < ServiceError
      end

      # The specified parameter to be shared could not be found.

      class ResourceNotFoundException < ServiceError
      end

      # The hash provided in the call doesn't match the stored hash. This exception is thrown when trying to
      # update an obsolete policy version or when multiple requests to update a policy are sent.

      class ResourcePolicyConflictException < ServiceError
      end

      # One or more parameters specified for the call aren't valid. Verify the parameters and their values
      # and try again.

      class ResourcePolicyInvalidParameterException < ServiceError
      end

      # The PutResourcePolicy API action enforces two limits. A policy can't be greater than 1024 bytes in
      # size. And only one policy can be attached to OpsItemGroup . Verify these limits and try again.

      class ResourcePolicyLimitExceededException < ServiceError
      end

      # No policies with the specified policy ID and hash could be found.

      class ResourcePolicyNotFoundException < ServiceError
      end

      # The request exceeds the service quota. Service quotas, also referred to as limits, are the maximum
      # number of service resources or operations for your Amazon Web Services account.

      class ServiceQuotaExceededException < ServiceError
      end

      # The specified service setting wasn't found. Either the service name or the setting hasn't been
      # provisioned by the Amazon Web Services service team.

      class ServiceSettingNotFound < ServiceError
      end

      # The updated status is the same as the current status.

      class StatusUnchanged < ServiceError
      end

      # The sub-type count exceeded the limit for the inventory type.

      class SubTypeCountLimitExceededException < ServiceError
      end

      # You specified the Safe option for the DeregisterTargetFromMaintenanceWindow operation, but the
      # target is still referenced in a task.

      class TargetInUseException < ServiceError
      end

      # The specified target managed node for the session isn't fully configured for use with Session
      # Manager. For more information, see Setting up Session Manager in the Amazon Web Services Systems
      # Manager User Guide . This error is also returned if you attempt to start a session on a managed node
      # that is located in a different account or Region

      class TargetNotConnected < ServiceError
      end

      # The request or operation couldn't be performed because the service is throttling requests.

      class ThrottlingException < ServiceError
      end

      # The Targets parameter includes too many tags. Remove one or more tags and try the command again.

      class TooManyTagsError < ServiceError
      end

      # There are concurrent updates for a resource that supports one update at a time.

      class TooManyUpdates < ServiceError
      end

      # The size of inventory data has exceeded the total size limit for the resource.

      class TotalSizeLimitExceededException < ServiceError
      end

      # The calendar entry contained in the specified SSM document isn't supported.

      class UnsupportedCalendarException < ServiceError
      end

      # Patching for applications released by Microsoft is only available on EC2 instances and advanced
      # instances. To patch applications released by Microsoft on on-premises servers and VMs, you must
      # enable advanced instances. For more information, see Turning on the advanced-instances tier in the
      # Amazon Web Services Systems Manager User Guide .

      class UnsupportedFeatureRequiredException < ServiceError
      end

      # The Context attribute that you specified for the InventoryItem isn't allowed for this inventory
      # type. You can only use the Context attribute with inventory types like AWS:ComplianceItem .

      class UnsupportedInventoryItemContextException < ServiceError
      end

      # Inventory item type schema version has to match supported versions in the service. Check output of
      # GetInventorySchema to see the available schema version for each type.

      class UnsupportedInventorySchemaVersionException < ServiceError
      end

      # The operating systems you specified isn't supported, or the operation isn't supported for the
      # operating system.

      class UnsupportedOperatingSystem < ServiceError
      end

      # This operation is not supported for the current account. You must first enable the Systems Manager
      # integrated experience in your account.

      class UnsupportedOperationException < ServiceError
      end

      # The parameter type isn't supported.

      class UnsupportedParameterType < ServiceError
      end

      # The document doesn't support the platform type of the given managed node IDs. For example, you sent
      # an document for a Windows managed node to a Linux node.

      class UnsupportedPlatformType < ServiceError
      end

      # The request isn't valid. Verify that you entered valid contents for the command and try again.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "AlreadyExistsException"
          AlreadyExistsException.new(message)
        when "AssociatedInstances"
          AssociatedInstances.new(message)
        when "AssociationAlreadyExists"
          AssociationAlreadyExists.new(message)
        when "AssociationDoesNotExist"
          AssociationDoesNotExist.new(message)
        when "AssociationExecutionDoesNotExist"
          AssociationExecutionDoesNotExist.new(message)
        when "AssociationLimitExceeded"
          AssociationLimitExceeded.new(message)
        when "AssociationVersionLimitExceeded"
          AssociationVersionLimitExceeded.new(message)
        when "AutomationDefinitionNotApprovedException"
          AutomationDefinitionNotApprovedException.new(message)
        when "AutomationDefinitionNotFoundException"
          AutomationDefinitionNotFoundException.new(message)
        when "AutomationDefinitionVersionNotFoundException"
          AutomationDefinitionVersionNotFoundException.new(message)
        when "AutomationExecutionLimitExceededException"
          AutomationExecutionLimitExceededException.new(message)
        when "AutomationExecutionNotFoundException"
          AutomationExecutionNotFoundException.new(message)
        when "AutomationStepNotFoundException"
          AutomationStepNotFoundException.new(message)
        when "ComplianceTypeCountLimitExceededException"
          ComplianceTypeCountLimitExceededException.new(message)
        when "CustomSchemaCountLimitExceededException"
          CustomSchemaCountLimitExceededException.new(message)
        when "DocumentAlreadyExists"
          DocumentAlreadyExists.new(message)
        when "DocumentLimitExceeded"
          DocumentLimitExceeded.new(message)
        when "DocumentPermissionLimit"
          DocumentPermissionLimit.new(message)
        when "DocumentVersionLimitExceeded"
          DocumentVersionLimitExceeded.new(message)
        when "DoesNotExistException"
          DoesNotExistException.new(message)
        when "DuplicateDocumentContent"
          DuplicateDocumentContent.new(message)
        when "DuplicateDocumentVersionName"
          DuplicateDocumentVersionName.new(message)
        when "DuplicateInstanceId"
          DuplicateInstanceId.new(message)
        when "FeatureNotAvailableException"
          FeatureNotAvailableException.new(message)
        when "HierarchyLevelLimitExceededException"
          HierarchyLevelLimitExceededException.new(message)
        when "HierarchyTypeMismatchException"
          HierarchyTypeMismatchException.new(message)
        when "IdempotentParameterMismatch"
          IdempotentParameterMismatch.new(message)
        when "IncompatiblePolicyException"
          IncompatiblePolicyException.new(message)
        when "InternalServerError"
          InternalServerError.new(message)
        when "InvalidActivation"
          InvalidActivation.new(message)
        when "InvalidActivationId"
          InvalidActivationId.new(message)
        when "InvalidAggregatorException"
          InvalidAggregatorException.new(message)
        when "InvalidAllowedPatternException"
          InvalidAllowedPatternException.new(message)
        when "InvalidAssociation"
          InvalidAssociation.new(message)
        when "InvalidAssociationVersion"
          InvalidAssociationVersion.new(message)
        when "InvalidAutomationExecutionParametersException"
          InvalidAutomationExecutionParametersException.new(message)
        when "InvalidAutomationSignalException"
          InvalidAutomationSignalException.new(message)
        when "InvalidAutomationStatusUpdateException"
          InvalidAutomationStatusUpdateException.new(message)
        when "InvalidCommandId"
          InvalidCommandId.new(message)
        when "InvalidDeleteInventoryParametersException"
          InvalidDeleteInventoryParametersException.new(message)
        when "InvalidDeletionIdException"
          InvalidDeletionIdException.new(message)
        when "InvalidDocument"
          InvalidDocument.new(message)
        when "InvalidDocumentContent"
          InvalidDocumentContent.new(message)
        when "InvalidDocumentOperation"
          InvalidDocumentOperation.new(message)
        when "InvalidDocumentSchemaVersion"
          InvalidDocumentSchemaVersion.new(message)
        when "InvalidDocumentType"
          InvalidDocumentType.new(message)
        when "InvalidDocumentVersion"
          InvalidDocumentVersion.new(message)
        when "InvalidFilter"
          InvalidFilter.new(message)
        when "InvalidFilterKey"
          InvalidFilterKey.new(message)
        when "InvalidFilterOption"
          InvalidFilterOption.new(message)
        when "InvalidFilterValue"
          InvalidFilterValue.new(message)
        when "InvalidInstanceId"
          InvalidInstanceId.new(message)
        when "InvalidInstanceInformationFilterValue"
          InvalidInstanceInformationFilterValue.new(message)
        when "InvalidInstancePropertyFilterValue"
          InvalidInstancePropertyFilterValue.new(message)
        when "InvalidInventoryGroupException"
          InvalidInventoryGroupException.new(message)
        when "InvalidInventoryItemContextException"
          InvalidInventoryItemContextException.new(message)
        when "InvalidInventoryRequestException"
          InvalidInventoryRequestException.new(message)
        when "InvalidItemContentException"
          InvalidItemContentException.new(message)
        when "InvalidKeyId"
          InvalidKeyId.new(message)
        when "InvalidNextToken"
          InvalidNextToken.new(message)
        when "InvalidNotificationConfig"
          InvalidNotificationConfig.new(message)
        when "InvalidOptionException"
          InvalidOptionException.new(message)
        when "InvalidOutputFolder"
          InvalidOutputFolder.new(message)
        when "InvalidOutputLocation"
          InvalidOutputLocation.new(message)
        when "InvalidParameters"
          InvalidParameters.new(message)
        when "InvalidPermissionType"
          InvalidPermissionType.new(message)
        when "InvalidPluginName"
          InvalidPluginName.new(message)
        when "InvalidPolicyAttributeException"
          InvalidPolicyAttributeException.new(message)
        when "InvalidPolicyTypeException"
          InvalidPolicyTypeException.new(message)
        when "InvalidResourceId"
          InvalidResourceId.new(message)
        when "InvalidResourceType"
          InvalidResourceType.new(message)
        when "InvalidResultAttributeException"
          InvalidResultAttributeException.new(message)
        when "InvalidRole"
          InvalidRole.new(message)
        when "InvalidSchedule"
          InvalidSchedule.new(message)
        when "InvalidTag"
          InvalidTag.new(message)
        when "InvalidTarget"
          InvalidTarget.new(message)
        when "InvalidTargetMaps"
          InvalidTargetMaps.new(message)
        when "InvalidTypeNameException"
          InvalidTypeNameException.new(message)
        when "InvalidUpdate"
          InvalidUpdate.new(message)
        when "InvocationDoesNotExist"
          InvocationDoesNotExist.new(message)
        when "ItemContentMismatchException"
          ItemContentMismatchException.new(message)
        when "ItemSizeLimitExceededException"
          ItemSizeLimitExceededException.new(message)
        when "MalformedResourcePolicyDocumentException"
          MalformedResourcePolicyDocumentException.new(message)
        when "MaxDocumentSizeExceeded"
          MaxDocumentSizeExceeded.new(message)
        when "NoLongerSupportedException"
          NoLongerSupportedException.new(message)
        when "OpsItemAccessDeniedException"
          OpsItemAccessDeniedException.new(message)
        when "OpsItemAlreadyExistsException"
          OpsItemAlreadyExistsException.new(message)
        when "OpsItemConflictException"
          OpsItemConflictException.new(message)
        when "OpsItemInvalidParameterException"
          OpsItemInvalidParameterException.new(message)
        when "OpsItemLimitExceededException"
          OpsItemLimitExceededException.new(message)
        when "OpsItemNotFoundException"
          OpsItemNotFoundException.new(message)
        when "OpsItemRelatedItemAlreadyExistsException"
          OpsItemRelatedItemAlreadyExistsException.new(message)
        when "OpsItemRelatedItemAssociationNotFoundException"
          OpsItemRelatedItemAssociationNotFoundException.new(message)
        when "OpsMetadataAlreadyExistsException"
          OpsMetadataAlreadyExistsException.new(message)
        when "OpsMetadataInvalidArgumentException"
          OpsMetadataInvalidArgumentException.new(message)
        when "OpsMetadataKeyLimitExceededException"
          OpsMetadataKeyLimitExceededException.new(message)
        when "OpsMetadataLimitExceededException"
          OpsMetadataLimitExceededException.new(message)
        when "OpsMetadataNotFoundException"
          OpsMetadataNotFoundException.new(message)
        when "OpsMetadataTooManyUpdatesException"
          OpsMetadataTooManyUpdatesException.new(message)
        when "ParameterAlreadyExists"
          ParameterAlreadyExists.new(message)
        when "ParameterLimitExceeded"
          ParameterLimitExceeded.new(message)
        when "ParameterMaxVersionLimitExceeded"
          ParameterMaxVersionLimitExceeded.new(message)
        when "ParameterNotFound"
          ParameterNotFound.new(message)
        when "ParameterPatternMismatchException"
          ParameterPatternMismatchException.new(message)
        when "ParameterVersionLabelLimitExceeded"
          ParameterVersionLabelLimitExceeded.new(message)
        when "ParameterVersionNotFound"
          ParameterVersionNotFound.new(message)
        when "PoliciesLimitExceededException"
          PoliciesLimitExceededException.new(message)
        when "ResourceDataSyncAlreadyExistsException"
          ResourceDataSyncAlreadyExistsException.new(message)
        when "ResourceDataSyncConflictException"
          ResourceDataSyncConflictException.new(message)
        when "ResourceDataSyncCountExceededException"
          ResourceDataSyncCountExceededException.new(message)
        when "ResourceDataSyncInvalidConfigurationException"
          ResourceDataSyncInvalidConfigurationException.new(message)
        when "ResourceDataSyncNotFoundException"
          ResourceDataSyncNotFoundException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceLimitExceededException"
          ResourceLimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourcePolicyConflictException"
          ResourcePolicyConflictException.new(message)
        when "ResourcePolicyInvalidParameterException"
          ResourcePolicyInvalidParameterException.new(message)
        when "ResourcePolicyLimitExceededException"
          ResourcePolicyLimitExceededException.new(message)
        when "ResourcePolicyNotFoundException"
          ResourcePolicyNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ServiceSettingNotFound"
          ServiceSettingNotFound.new(message)
        when "StatusUnchanged"
          StatusUnchanged.new(message)
        when "SubTypeCountLimitExceededException"
          SubTypeCountLimitExceededException.new(message)
        when "TargetInUseException"
          TargetInUseException.new(message)
        when "TargetNotConnected"
          TargetNotConnected.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TooManyTagsError"
          TooManyTagsError.new(message)
        when "TooManyUpdates"
          TooManyUpdates.new(message)
        when "TotalSizeLimitExceededException"
          TotalSizeLimitExceededException.new(message)
        when "UnsupportedCalendarException"
          UnsupportedCalendarException.new(message)
        when "UnsupportedFeatureRequiredException"
          UnsupportedFeatureRequiredException.new(message)
        when "UnsupportedInventoryItemContextException"
          UnsupportedInventoryItemContextException.new(message)
        when "UnsupportedInventorySchemaVersionException"
          UnsupportedInventorySchemaVersionException.new(message)
        when "UnsupportedOperatingSystem"
          UnsupportedOperatingSystem.new(message)
        when "UnsupportedOperationException"
          UnsupportedOperationException.new(message)
        when "UnsupportedParameterType"
          UnsupportedParameterType.new(message)
        when "UnsupportedPlatformType"
          UnsupportedPlatformType.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
