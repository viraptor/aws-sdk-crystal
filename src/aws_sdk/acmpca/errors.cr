module AwsSdk
  module ACMPCA
    module Errors
      class ServiceError < Exception
      end

      # The certificate authority certificate you are importing does not comply with conditions specified in
      # the certificate that signed it.

      class CertificateMismatchException < ServiceError
      end

      # A previous update to your private CA is still ongoing.

      class ConcurrentModificationException < ServiceError
      end

      # One or more of the specified arguments was not valid.

      class InvalidArgsException < ServiceError
      end

      # The requested Amazon Resource Name (ARN) does not refer to an existing resource.

      class InvalidArnException < ServiceError
      end

      # The token specified in the NextToken argument is not valid. Use the token returned from your
      # previous call to ListCertificateAuthorities .

      class InvalidNextTokenException < ServiceError
      end

      # The resource policy is invalid or is missing a required statement. For general information about IAM
      # policy and statement structure, see Overview of JSON Policies .

      class InvalidPolicyException < ServiceError
      end

      # The request action cannot be performed or is prohibited.

      class InvalidRequestException < ServiceError
      end

      # The state of the private CA does not allow this action to occur.

      class InvalidStateException < ServiceError
      end

      # The tag associated with the CA is not valid. The invalid argument is contained in the message field.

      class InvalidTagException < ServiceError
      end

      # An Amazon Web Services Private CA quota has been exceeded. See the exception message returned to
      # determine the quota that was exceeded.

      class LimitExceededException < ServiceError
      end

      # The current action was prevented because it would lock the caller out from performing subsequent
      # actions. Verify that the specified parameters would not result in the caller being denied access to
      # the resource.

      class LockoutPreventedException < ServiceError
      end

      # The certificate signing request is invalid.

      class MalformedCSRException < ServiceError
      end

      # One or more fields in the certificate are invalid.

      class MalformedCertificateException < ServiceError
      end

      # The designated permission has already been given to the user.

      class PermissionAlreadyExistsException < ServiceError
      end

      # Your request has already been completed.

      class RequestAlreadyProcessedException < ServiceError
      end

      # The request has failed for an unspecified reason.

      class RequestFailedException < ServiceError
      end

      # Your request is already in progress.

      class RequestInProgressException < ServiceError
      end

      # A resource such as a private CA, S3 bucket, certificate, audit report, or policy cannot be found.

      class ResourceNotFoundException < ServiceError
      end

      # You can associate up to 50 tags with a private CA. Exception information is contained in the
      # exception message field.

      class TooManyTagsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "CertificateMismatchException"
          CertificateMismatchException.new(message)
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "InvalidArgsException"
          InvalidArgsException.new(message)
        when "InvalidArnException"
          InvalidArnException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "InvalidPolicyException"
          InvalidPolicyException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "InvalidStateException"
          InvalidStateException.new(message)
        when "InvalidTagException"
          InvalidTagException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "LockoutPreventedException"
          LockoutPreventedException.new(message)
        when "MalformedCSRException"
          MalformedCSRException.new(message)
        when "MalformedCertificateException"
          MalformedCertificateException.new(message)
        when "PermissionAlreadyExistsException"
          PermissionAlreadyExistsException.new(message)
        when "RequestAlreadyProcessedException"
          RequestAlreadyProcessedException.new(message)
        when "RequestFailedException"
          RequestFailedException.new(message)
        when "RequestInProgressException"
          RequestInProgressException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
