require "digest/sha256"
require "openssl/hmac"
require "uri"

module Aws
  module Runtime
    module Signer
      class SigV4
        def initialize(@service : String, @region : String, @credentials : Credentials)
          raise ArgumentError.new("service must not be empty") if @service.empty?
          raise ArgumentError.new("region must not be empty") if @region.empty?
        end

        def sign(request : Http::Request) : Http::Request
          uri = URI.parse(request.uri)
          host = uri.host
          raise ArgumentError.new("request uri must include host") unless host

          timestamp = Time.utc
          amz_date = timestamp.to_s("%Y%m%dT%H%M%SZ")
          date_stamp = timestamp.to_s("%Y%m%d")

          request.headers["host"] = host
          request.headers["x-amz-date"] = amz_date
          if (token = @credentials.session_token)
            request.headers["x-amz-security-token"] = token
          end

          canonical_request, signed_headers = build_canonical_request(request, uri)
          string_to_sign = build_string_to_sign(canonical_request, amz_date, date_stamp)
          signature = sign_string(string_to_sign, date_stamp)

          scope = "#{date_stamp}/#{@region}/#{@service}/aws4_request"
          request.headers["Authorization"] =
            "AWS4-HMAC-SHA256 Credential=#{@credentials.access_key_id}/#{scope}, " +
            "SignedHeaders=#{signed_headers}, Signature=#{signature}"
          request
        end

        private def build_canonical_request(request : Http::Request, uri : URI) : Tuple(String, String)
          canonical_uri = normalize_uri_path(uri.path)
          canonical_query = canonical_querystring(uri.query)
          canonical_headers, signed_headers = canonical_headers(request.headers)
          payload_hash = Digest::SHA256.hexdigest(request.body || "")

          canonical_request = String.build do |io|
            io << request.method.upcase << "\n"
            io << canonical_uri << "\n"
            io << canonical_query << "\n"
            io << canonical_headers << "\n"
            io << signed_headers << "\n"
            io << payload_hash
          end

          {canonical_request, signed_headers}
        end

        private def build_string_to_sign(canonical_request : String, amz_date : String, date_stamp : String) : String
          scope = "#{date_stamp}/#{@region}/#{@service}/aws4_request"
          hash = Digest::SHA256.hexdigest(canonical_request)
          String.build do |io|
            io << "AWS4-HMAC-SHA256\n"
            io << amz_date << "\n"
            io << scope << "\n"
            io << hash
          end
        end

        private def sign_string(string_to_sign : String, date_stamp : String) : String
          k_date = hmac("AWS4#{@credentials.secret_access_key}", date_stamp)
          k_region = hmac(k_date, @region)
          k_service = hmac(k_region, @service)
          k_signing = hmac(k_service, "aws4_request")
          hex(hmac(k_signing, string_to_sign))
        end

        private def hmac(key : String, value : String) : Bytes
          OpenSSL::HMAC.digest(OpenSSL::Algorithm::SHA256, key, value)
        end

        private def hmac(key : Bytes, value : String) : Bytes
          OpenSSL::HMAC.digest(OpenSSL::Algorithm::SHA256, key, value)
        end

        private def hex(bytes : Bytes) : String
          String.build do |io|
            bytes.each do |byte|
              io << byte.to_s(16).rjust(2, '0')
            end
          end
        end

        private def canonical_headers(headers : Hash(String, String)) : Tuple(String, String)
          normalized = headers.map do |name, value|
            {name.downcase, value.strip.gsub(/\s+/, " ")}
          end
          sorted = normalized.sort_by { |pair| pair[0] }

          canonical = String.build do |io|
            sorted.each do |name, value|
              io << name << ":" << value << "\n"
            end
          end

          signed_headers = sorted.map(&.[0]).join(";")
          {canonical, signed_headers}
        end

        private def canonical_querystring(query : String?) : String
          return "" unless query && !query.empty?

          params = URI::Params.parse(query).to_a
          sorted = params.sort_by { |pair| {pair[0], pair[1]} }
          sorted.map do |name, value|
            "#{uri_escape(name)}=#{uri_escape(value)}"
          end.join("&")
        end

        private def normalize_uri_path(path : String?) : String
          return "/" unless path && !path.empty?
          path
        end

        private def uri_escape(value : String) : String
          String.build do |io|
            value.bytes.each do |byte|
              if unreserved?(byte)
                io << byte.chr
              else
                io << "%" << byte.to_s(16).upcase.rjust(2, '0')
              end
            end
          end
        end

        private def unreserved?(byte : UInt8) : Bool
          (byte >= 65 && byte <= 90) ||
            (byte >= 97 && byte <= 122) ||
            (byte >= 48 && byte <= 57) ||
            byte == 45 || byte == 46 || byte == 95 || byte == 126
        end
      end
    end
  end
end
