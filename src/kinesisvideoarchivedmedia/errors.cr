module Aws
  module KinesisVideoArchivedMedia
    module Errors
      class ServiceError < Exception
      end

      # Kinesis Video Streams has throttled the request because you have exceeded a limit. Try making the
      # call later. For information about limits, see Kinesis Video Streams Limits .

      class ClientLimitExceededException < ServiceError
      end

      # A specified parameter exceeds its restrictions, is not supported, or can't be used.

      class InvalidArgumentException < ServiceError
      end

      # The codec private data in at least one of the tracks of the video stream is not valid for this
      # operation.

      class InvalidCodecPrivateDataException < ServiceError
      end

      # One or more frames in the requested clip could not be parsed based on the specified codec.

      class InvalidMediaFrameException < ServiceError
      end

      # No codec private data was found in at least one of tracks of the video stream.

      class MissingCodecPrivateDataException < ServiceError
      end

      # GetImages was requested for a stream that does not retain data (that is, has a DataRetentionInHours
      # of 0).

      class NoDataRetentionException < ServiceError
      end

      # Status Code: 403, The caller is not authorized to perform an operation on the given stream, or the
      # token has expired.

      class NotAuthorizedException < ServiceError
      end

      # GetImages will throw this error when Kinesis Video Streams can't find the stream that you specified.
      # GetHLSStreamingSessionURL and GetDASHStreamingSessionURL throw this error if a session with a
      # PlaybackMode of ON_DEMAND or LIVE_REPLAY is requested for a stream that has no fragments within the
      # requested time range, or if a session with a PlaybackMode of LIVE is requested for a stream that has
      # no fragments within the last 30 seconds.

      class ResourceNotFoundException < ServiceError
      end

      # The type of the media (for example, h.264 or h.265 video or ACC or G.711 audio) could not be
      # determined from the codec IDs of the tracks in the first fragment for a playback session. The codec
      # ID for track 1 should be V_MPEG/ISO/AVC and, optionally, the codec ID for track 2 should be A_AAC .

      class UnsupportedStreamMediaTypeException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ClientLimitExceededException"
          ClientLimitExceededException.new(message)
        when "InvalidArgumentException"
          InvalidArgumentException.new(message)
        when "InvalidCodecPrivateDataException"
          InvalidCodecPrivateDataException.new(message)
        when "InvalidMediaFrameException"
          InvalidMediaFrameException.new(message)
        when "MissingCodecPrivateDataException"
          MissingCodecPrivateDataException.new(message)
        when "NoDataRetentionException"
          NoDataRetentionException.new(message)
        when "NotAuthorizedException"
          NotAuthorizedException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "UnsupportedStreamMediaTypeException"
          UnsupportedStreamMediaTypeException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
