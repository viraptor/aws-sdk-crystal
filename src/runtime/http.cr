module Aws
  module Runtime
    module Http
      struct Request
        getter method : String
        getter uri : String
        getter headers : Hash(String, String)
        getter body : String?

        def initialize(
          @method : String,
          @uri : String,
          headers : Hash(String, String) = {} of String => String,
          @body : String? = nil
        )
          normalized_headers = headers.reject { |key, _| key.downcase == "user-agent" }
          normalized_headers["User-Agent"] = Aws::Runtime.user_agent
          @headers = normalized_headers
        end

      def with_headers(extra : Hash(String, String)) : Request
        return self if extra.empty?
        Request.new(@method, @uri, @headers.merge(extra), @body)
      end
      end

      struct Response
        getter status : Int32
        getter headers : Hash(String, String)
        getter body : String?

        def initialize(@status : Int32, @headers : Hash(String, String), @body : String?)
        end
      end
    end
  end
end
