module Aws
  module Runtime
    class Config
      property http_wire_trace : Bool

      def initialize(@http_wire_trace : Bool = false)
      end
    end
  end
end
