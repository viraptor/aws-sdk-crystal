module AwsSdk
  module CloudDirectory
    module Errors
      class ServiceError < Exception
      end

      # Access denied or directory not found. Either you don't have permissions for this directory or the
      # directory does not exist. Try calling ListDirectories and check your permissions.
      class AccessDeniedException < ServiceError
      end

      # A BatchWrite exception has occurred.
      class BatchWriteException < ServiceError
      end

      # Cannot list the parents of a Directory root.
      class CannotListParentOfRootException < ServiceError
      end

      # Indicates that a Directory could not be created due to a naming conflict. Choose a different name
      # and try again.
      class DirectoryAlreadyExistsException < ServiceError
      end

      # A directory that has been deleted and to which access has been attempted. Note: The requested
      # resource will eventually cease to exist.
      class DirectoryDeletedException < ServiceError
      end

      # An operation can only operate on a disabled directory.
      class DirectoryNotDisabledException < ServiceError
      end

      # Operations are only permitted on enabled directories.
      class DirectoryNotEnabledException < ServiceError
      end

      # A facet with the same name already exists.
      class FacetAlreadyExistsException < ServiceError
      end

      # Occurs when deleting a facet that contains an attribute that is a target to an attribute reference
      # in a different facet.
      class FacetInUseException < ServiceError
      end

      # The specified Facet could not be found.
      class FacetNotFoundException < ServiceError
      end

      # The Facet that you provided was not well formed or could not be validated with the schema.
      class FacetValidationException < ServiceError
      end

      # Indicates a failure occurred while performing a check for backward compatibility between the
      # specified schema and the schema that is currently applied to the directory.
      class IncompatibleSchemaException < ServiceError
      end

      # An object has been attempted to be attached to an object that does not have the appropriate
      # attribute value.
      class IndexedAttributeMissingException < ServiceError
      end

      # Indicates a problem that must be resolved by Amazon Web Services. This might be a transient error in
      # which case you can retry your request until it succeeds. Otherwise, go to the AWS Service Health
      # Dashboard site to see if there are any operational issues with the service.
      class InternalServiceException < ServiceError
      end

      # Indicates that the provided ARN value is not valid.
      class InvalidArnException < ServiceError
      end

      # Indicates that an attempt to make an attachment was invalid. For example, attaching two nodes with a
      # link type that is not applicable to the nodes or attempting to apply a schema to a directory a
      # second time.
      class InvalidAttachmentException < ServiceError
      end

      # An attempt to modify a Facet resulted in an invalid schema exception.
      class InvalidFacetUpdateException < ServiceError
      end

      # Indicates that the NextToken value is not valid.
      class InvalidNextTokenException < ServiceError
      end

      # Occurs when any of the rule parameter keys or values are invalid.
      class InvalidRuleException < ServiceError
      end

      # Indicates that the provided SchemaDoc value is not valid.
      class InvalidSchemaDocException < ServiceError
      end

      # Can occur for multiple reasons such as when you tag a resource that doesn’t exist or if you specify
      # a higher number of tags for a resource than the allowed limit. Allowed limit is 50 tags per
      # resource.
      class InvalidTaggingRequestException < ServiceError
      end

      # Indicates that limits are exceeded. See Limits for more information.
      class LimitExceededException < ServiceError
      end

      # Indicates that a link could not be created due to a naming conflict. Choose a different name and
      # then try again.
      class LinkNameAlreadyInUseException < ServiceError
      end

      # Indicates that the requested operation can only operate on index objects.
      class NotIndexException < ServiceError
      end

      # Occurs when any invalid operations are performed on an object that is not a node, such as calling
      # ListObjectChildren for a leaf node object.
      class NotNodeException < ServiceError
      end

      # Indicates that the requested operation can only operate on policy objects.
      class NotPolicyException < ServiceError
      end

      # Indicates that the object is not attached to the index.
      class ObjectAlreadyDetachedException < ServiceError
      end

      # Indicates that the requested operation cannot be completed because the object has not been detached
      # from the tree.
      class ObjectNotDetachedException < ServiceError
      end

      # The specified resource could not be found.
      class ResourceNotFoundException < ServiceError
      end

      # Occurs when a conflict with a previous successful write is detected. For example, if a write
      # operation occurs on an object and then an attempt is made to read the object using “SERIALIZABLE”
      # consistency, this exception may result. This generally occurs when the previous write did not have
      # time to propagate to the host serving the current request. A retry (with appropriate backoff logic)
      # is the recommended response to this exception.
      class RetryableConflictException < ServiceError
      end

      # Indicates that a schema could not be created due to a naming conflict. Please select a different
      # name and then try again.
      class SchemaAlreadyExistsException < ServiceError
      end

      # Indicates that a schema is already published.
      class SchemaAlreadyPublishedException < ServiceError
      end

      # The object could not be deleted because links still exist. Remove the links and then try the
      # operation again.
      class StillContainsLinksException < ServiceError
      end

      # Indicates that the requested index type is not supported.
      class UnsupportedIndexTypeException < ServiceError
      end

      # Indicates that your request is malformed in some manner. See the exception message.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BatchWriteException"
          BatchWriteException.new(message)
        when "CannotListParentOfRootException"
          CannotListParentOfRootException.new(message)
        when "DirectoryAlreadyExistsException"
          DirectoryAlreadyExistsException.new(message)
        when "DirectoryDeletedException"
          DirectoryDeletedException.new(message)
        when "DirectoryNotDisabledException"
          DirectoryNotDisabledException.new(message)
        when "DirectoryNotEnabledException"
          DirectoryNotEnabledException.new(message)
        when "FacetAlreadyExistsException"
          FacetAlreadyExistsException.new(message)
        when "FacetInUseException"
          FacetInUseException.new(message)
        when "FacetNotFoundException"
          FacetNotFoundException.new(message)
        when "FacetValidationException"
          FacetValidationException.new(message)
        when "IncompatibleSchemaException"
          IncompatibleSchemaException.new(message)
        when "IndexedAttributeMissingException"
          IndexedAttributeMissingException.new(message)
        when "InternalServiceException"
          InternalServiceException.new(message)
        when "InvalidArnException"
          InvalidArnException.new(message)
        when "InvalidAttachmentException"
          InvalidAttachmentException.new(message)
        when "InvalidFacetUpdateException"
          InvalidFacetUpdateException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "InvalidRuleException"
          InvalidRuleException.new(message)
        when "InvalidSchemaDocException"
          InvalidSchemaDocException.new(message)
        when "InvalidTaggingRequestException"
          InvalidTaggingRequestException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "LinkNameAlreadyInUseException"
          LinkNameAlreadyInUseException.new(message)
        when "NotIndexException"
          NotIndexException.new(message)
        when "NotNodeException"
          NotNodeException.new(message)
        when "NotPolicyException"
          NotPolicyException.new(message)
        when "ObjectAlreadyDetachedException"
          ObjectAlreadyDetachedException.new(message)
        when "ObjectNotDetachedException"
          ObjectNotDetachedException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "RetryableConflictException"
          RetryableConflictException.new(message)
        when "SchemaAlreadyExistsException"
          SchemaAlreadyExistsException.new(message)
        when "SchemaAlreadyPublishedException"
          SchemaAlreadyPublishedException.new(message)
        when "StillContainsLinksException"
          StillContainsLinksException.new(message)
        when "UnsupportedIndexTypeException"
          UnsupportedIndexTypeException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
