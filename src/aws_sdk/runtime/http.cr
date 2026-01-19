module AwsSdk
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
          @headers : Hash(String, String) = {} of String => String,
          @body : String? = nil
        )
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
