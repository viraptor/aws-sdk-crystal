module AwsSdk
  module KinesisVideoWebrtcStorage
    module Errors
      class ServiceError < Exception
      end

      class AccessDeniedException < ServiceError
      end

      class ClientLimitExceededException < ServiceError
      end

      class InvalidArgumentException < ServiceError
      end

      class ResourceNotFoundException < ServiceError
      end
    end
  end
end
