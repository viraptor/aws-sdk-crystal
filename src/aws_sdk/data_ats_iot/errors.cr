module AwsSdk
  module IoTDataPlane
    module Errors
      class ServiceError < Exception
      end

      # The specified version does not match the version of the document.
      class ConflictException < ServiceError
      end

      # The caller isn't authorized to make the request.
      class ForbiddenException < ServiceError
      end

      # An unexpected error has occurred.
      class InternalFailureException < ServiceError
      end

      # The request is not valid.
      class InvalidRequestException < ServiceError
      end

      # The specified combination of HTTP verb and URI is not supported.
      class MethodNotAllowedException < ServiceError
      end

      # The payload exceeds the maximum size allowed.
      class RequestEntityTooLargeException < ServiceError
      end

      # The specified resource does not exist.
      class ResourceNotFoundException < ServiceError
      end

      # The service is temporarily unavailable.
      class ServiceUnavailableException < ServiceError
      end

      # The rate exceeds the limit.
      class ThrottlingException < ServiceError
      end

      # You are not authorized to perform this operation.
      class UnauthorizedException < ServiceError
      end

      # The document encoding is not supported.
      class UnsupportedDocumentEncodingException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConflictException"
          ConflictException.new(message)
        when "ForbiddenException"
          ForbiddenException.new(message)
        when "InternalFailureException"
          InternalFailureException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "MethodNotAllowedException"
          MethodNotAllowedException.new(message)
        when "RequestEntityTooLargeException"
          RequestEntityTooLargeException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnauthorizedException"
          UnauthorizedException.new(message)
        when "UnsupportedDocumentEncodingException"
          UnsupportedDocumentEncodingException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
