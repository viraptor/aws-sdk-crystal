module Aws
  module Runtime
    class Config
      DEFAULT_RETRY_LIMIT = 3
      DEFAULT_RETRY_BACKOFF = ->(_attempt : Int32) {
        sleep(15.seconds)
        nil
      }

      property http_wire_trace : Bool
      property retry_limit : Int32
      property retry_backoff : Proc(Int32, Nil)

      def initialize(
        @http_wire_trace : Bool = false,
        @retry_limit : Int32 = DEFAULT_RETRY_LIMIT,
        @retry_backoff : Proc(Int32, Nil) = DEFAULT_RETRY_BACKOFF
      )
      end
    end
  end
end
