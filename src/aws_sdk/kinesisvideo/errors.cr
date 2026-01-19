module AwsSdk
  module KinesisVideo
    module Errors
      class ServiceError < Exception
      end

      # You do not have required permissions to perform this operation.
      class AccessDeniedException < ServiceError
      end

      # You have reached the maximum limit of active signaling channels for this Amazon Web Services account
      # in this region.
      class AccountChannelLimitExceededException < ServiceError
      end

      # The number of streams created for the account is too high.
      class AccountStreamLimitExceededException < ServiceError
      end

      # Kinesis Video Streams has throttled the request because you have exceeded the limit of allowed
      # client calls. Try making the call later.
      class ClientLimitExceededException < ServiceError
      end

      # Not implemented.
      class DeviceStreamLimitExceededException < ServiceError
      end

      # The value for this input parameter is invalid.
      class InvalidArgumentException < ServiceError
      end

      # Not implemented.
      class InvalidDeviceException < ServiceError
      end

      # The format of the StreamARN is invalid.
      class InvalidResourceFormatException < ServiceError
      end

      # The Stream data retention in hours is equal to zero.
      class NoDataRetentionException < ServiceError
      end

      # The caller is not authorized to perform this operation.
      class NotAuthorizedException < ServiceError
      end

      # When the input StreamARN or ChannelARN in CLOUD_STORAGE_MODE is already mapped to a different
      # Kinesis Video Stream resource, or if the provided input StreamARN or ChannelARN is not in Active
      # status, try one of the following : The DescribeMediaStorageConfiguration API to determine what the
      # stream given channel is mapped to. The DescribeMappedResourceConfiguration API to determine the
      # channel that the given stream is mapped to. The DescribeStream or DescribeSignalingChannel API to
      # determine the status of the resource.
      class ResourceInUseException < ServiceError
      end

      # Amazon Kinesis Video Streams can't find the stream that you specified.
      class ResourceNotFoundException < ServiceError
      end

      # The Exception rendered when the Amazon Kinesis Video Stream can't find a stream's edge configuration
      # that you specified.
      class StreamEdgeConfigurationNotFoundException < ServiceError
      end

      # You have exceeded the limit of tags that you can associate with the resource. A Kinesis video stream
      # can support up to 50 tags.
      class TagsPerResourceExceededLimitException < ServiceError
      end

      # The stream version that you specified is not the latest version. To get the latest version, use the
      # DescribeStream API.
      class VersionMismatchException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "AccountChannelLimitExceededException"
          AccountChannelLimitExceededException.new(message)
        when "AccountStreamLimitExceededException"
          AccountStreamLimitExceededException.new(message)
        when "ClientLimitExceededException"
          ClientLimitExceededException.new(message)
        when "DeviceStreamLimitExceededException"
          DeviceStreamLimitExceededException.new(message)
        when "InvalidArgumentException"
          InvalidArgumentException.new(message)
        when "InvalidDeviceException"
          InvalidDeviceException.new(message)
        when "InvalidResourceFormatException"
          InvalidResourceFormatException.new(message)
        when "NoDataRetentionException"
          NoDataRetentionException.new(message)
        when "NotAuthorizedException"
          NotAuthorizedException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "StreamEdgeConfigurationNotFoundException"
          StreamEdgeConfigurationNotFoundException.new(message)
        when "TagsPerResourceExceededLimitException"
          TagsPerResourceExceededLimitException.new(message)
        when "VersionMismatchException"
          VersionMismatchException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
