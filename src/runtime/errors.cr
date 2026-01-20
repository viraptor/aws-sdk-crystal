module AwsSdk
  module Runtime
    module Errors
      class MissingCredentialsError < Exception
      end

      class MissingRegionError < Exception
      end

      class ResponseParseError < Exception
      end
    end
  end
end
