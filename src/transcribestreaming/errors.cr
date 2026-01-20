module Aws
  module TranscribeStreaming
    module Errors
      class ServiceError < Exception
      end

      # One or more arguments to the StartStreamTranscription , StartMedicalStreamTranscription , or
      # StartCallAnalyticsStreamTranscription operation was not valid. For example, MediaEncoding or
      # LanguageCode used unsupported values. Check the specified parameters and try your request again.

      class BadRequestException < ServiceError
      end

      # A new stream started with the same session ID. The current stream has been terminated.

      class ConflictException < ServiceError
      end

      # A problem occurred while processing the audio. Amazon Transcribe terminated processing.

      class InternalFailureException < ServiceError
      end

      # Your client has exceeded one of the Amazon Transcribe limits. This is typically the audio length
      # limit. Break your audio stream into smaller chunks and try your request again.

      class LimitExceededException < ServiceError
      end

      # The request references a resource which doesn't exist.

      class ResourceNotFoundException < ServiceError
      end

      # The service is currently unavailable. Try your request later.

      class ServiceUnavailableException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalFailureException"
          InternalFailureException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
