module AwsSdk
  module Polly
    module Errors
      class ServiceError < Exception
      end

      # This engine is not compatible with the voice that you have designated. Choose a new voice that is
      # compatible with the engine or change the engine and restart the operation.
      class EngineNotSupportedException < ServiceError
      end

      # Amazon Polly can't find the specified lexicon. Verify that the lexicon's name is spelled correctly,
      # and then try again.
      class InvalidLexiconException < ServiceError
      end

      # The NextToken is invalid. Verify that it's spelled correctly, and then try again.
      class InvalidNextTokenException < ServiceError
      end

      # The provided Amazon S3 bucket name is invalid. Please check your input with S3 bucket naming
      # requirements and try again.
      class InvalidS3BucketException < ServiceError
      end

      # The provided Amazon S3 key prefix is invalid. Please provide a valid S3 object key name.
      class InvalidS3KeyException < ServiceError
      end

      # The specified sample rate is not valid.
      class InvalidSampleRateException < ServiceError
      end

      # The provided SNS topic ARN is invalid. Please provide a valid SNS topic ARN and try again.
      class InvalidSnsTopicArnException < ServiceError
      end

      # The SSML you provided is invalid. Verify the SSML syntax, spelling of tags and values, and then try
      # again.
      class InvalidSsmlException < ServiceError
      end

      # The provided Task ID is not valid. Please provide a valid Task ID and try again.
      class InvalidTaskIdException < ServiceError
      end

      # The language specified is not currently supported by Amazon Polly in this capacity.
      class LanguageNotSupportedException < ServiceError
      end

      # Amazon Polly can't find the specified lexicon. This could be caused by a lexicon that is missing,
      # its name is misspelled or specifying a lexicon that is in a different region. Verify that the
      # lexicon exists, is in the region (see ListLexicons ) and that you spelled its name is spelled
      # correctly. Then try again.
      class LexiconNotFoundException < ServiceError
      end

      # The maximum size of the specified lexicon would be exceeded by this operation.
      class LexiconSizeExceededException < ServiceError
      end

      # Speech marks are not supported for the OutputFormat selected. Speech marks are only available for
      # content in json format.
      class MarksNotSupportedForFormatException < ServiceError
      end

      # The maximum size of the lexeme would be exceeded by this operation.
      class MaxLexemeLengthExceededException < ServiceError
      end

      # The maximum number of lexicons would be exceeded by this operation.
      class MaxLexiconsNumberExceededException < ServiceError
      end

      # An unknown condition has caused a service failure.
      class ServiceFailureException < ServiceError
      end

      # SSML speech marks are not supported for plain text-type input.
      class SsmlMarksNotSupportedForTextTypeException < ServiceError
      end

      # The Speech Synthesis task with requested Task ID cannot be found.
      class SynthesisTaskNotFoundException < ServiceError
      end

      # The value of the "Text" parameter is longer than the accepted limits. For the SynthesizeSpeech API,
      # the limit for input text is a maximum of 6000 characters total, of which no more than 3000 can be
      # billed characters. For the StartSpeechSynthesisTask API, the maximum is 200,000 characters, of which
      # no more than 100,000 can be billed characters. SSML tags are not counted as billed characters.
      class TextLengthExceededException < ServiceError
      end

      # The alphabet specified by the lexicon is not a supported alphabet. Valid values are x-sampa and ipa
      # .
      class UnsupportedPlsAlphabetException < ServiceError
      end

      # The language specified in the lexicon is unsupported. For a list of supported languages, see Lexicon
      # Attributes .
      class UnsupportedPlsLanguageException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "EngineNotSupportedException"
          EngineNotSupportedException.new(message)
        when "InvalidLexiconException"
          InvalidLexiconException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "InvalidS3BucketException"
          InvalidS3BucketException.new(message)
        when "InvalidS3KeyException"
          InvalidS3KeyException.new(message)
        when "InvalidSampleRateException"
          InvalidSampleRateException.new(message)
        when "InvalidSnsTopicArnException"
          InvalidSnsTopicArnException.new(message)
        when "InvalidSsmlException"
          InvalidSsmlException.new(message)
        when "InvalidTaskIdException"
          InvalidTaskIdException.new(message)
        when "LanguageNotSupportedException"
          LanguageNotSupportedException.new(message)
        when "LexiconNotFoundException"
          LexiconNotFoundException.new(message)
        when "LexiconSizeExceededException"
          LexiconSizeExceededException.new(message)
        when "MarksNotSupportedForFormatException"
          MarksNotSupportedForFormatException.new(message)
        when "MaxLexemeLengthExceededException"
          MaxLexemeLengthExceededException.new(message)
        when "MaxLexiconsNumberExceededException"
          MaxLexiconsNumberExceededException.new(message)
        when "ServiceFailureException"
          ServiceFailureException.new(message)
        when "SsmlMarksNotSupportedForTextTypeException"
          SsmlMarksNotSupportedForTextTypeException.new(message)
        when "SynthesisTaskNotFoundException"
          SynthesisTaskNotFoundException.new(message)
        when "TextLengthExceededException"
          TextLengthExceededException.new(message)
        when "UnsupportedPlsAlphabetException"
          UnsupportedPlsAlphabetException.new(message)
        when "UnsupportedPlsLanguageException"
          UnsupportedPlsLanguageException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
