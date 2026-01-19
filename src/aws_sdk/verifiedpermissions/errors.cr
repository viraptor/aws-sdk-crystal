module AwsSdk
  module VerifiedPermissions
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient access to perform this action.
      class AccessDeniedException < ServiceError
      end

      # The request failed because another request to modify a resource occurred at the same.
      class ConflictException < ServiceError
      end

      # The request failed because of an internal error. Try your request again later
      class InternalServerException < ServiceError
      end

      # The policy store can't be deleted because deletion protection is enabled. To delete this policy
      # store, disable deletion protection.
      class InvalidStateException < ServiceError
      end

      # The request failed because it references a resource that doesn't exist.
      class ResourceNotFoundException < ServiceError
      end

      # The request failed because it would cause a service quota to be exceeded.
      class ServiceQuotaExceededException < ServiceError
      end

      # The request failed because it exceeded a throttling quota.
      class ThrottlingException < ServiceError
      end

      # No more tags be added because the limit (50) has been reached. To add new tags, use UntagResource to
      # remove existing tags.
      class TooManyTagsException < ServiceError
      end

      # The request failed because one or more input parameters don't satisfy their constraint requirements.
      # The output is provided as a list of fields and a reason for each field that isn't valid. The
      # possible reasons include the following: UnrecognizedEntityType The policy includes an entity type
      # that isn't found in the schema. UnrecognizedActionId The policy includes an action id that isn't
      # found in the schema. InvalidActionApplication The policy includes an action that, according to the
      # schema, doesn't support the specified principal and resource. UnexpectedType The policy included an
      # operand that isn't a valid type for the specified operation. IncompatibleTypes The types of elements
      # included in a set , or the types of expressions used in an if...then...else clause aren't compatible
      # in this context. MissingAttribute The policy attempts to access a record or entity attribute that
      # isn't specified in the schema. Test for the existence of the attribute first before attempting to
      # access its value. For more information, see the has (presence of attribute test) operator in the
      # Cedar Policy Language Guide . UnsafeOptionalAttributeAccess The policy attempts to access a record
      # or entity attribute that is optional and isn't guaranteed to be present. Test for the existence of
      # the attribute first before attempting to access its value. For more information, see the has
      # (presence of attribute test) operator in the Cedar Policy Language Guide . ImpossiblePolicy Cedar
      # has determined that a policy condition always evaluates to false. If the policy is always false, it
      # can never apply to any query, and so it can never affect an authorization decision.
      # WrongNumberArguments The policy references an extension type with the wrong number of arguments.
      # FunctionArgumentValidationError Cedar couldn't parse the argument passed to an extension type. For
      # example, a string that is to be parsed as an IPv4 address can contain only digits and the period
      # character.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidStateException"
          InvalidStateException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
