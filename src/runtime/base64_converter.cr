require "base64"
require "json"

module Aws
  module Runtime
    module Base64BytesConverter
      def self.from_json(value : JSON::PullParser) : Bytes?
        return nil if value.kind.null?

        raw = value.read_string
        return Bytes.empty if raw.empty?

        Base64.decode(raw)
      end

      def self.to_json(value : Bytes?, json : JSON::Builder) : Nil
        if value
          json.string(Base64.strict_encode(value))
        else
          json.null
        end
      end
    end

    module Base64BytesListConverter
      def self.from_json(value : JSON::PullParser) : Array(Bytes)?
        return nil if value.kind.null?

        result = [] of Bytes
        value.read_array do
          raw = value.read_string
          result << (raw.empty? ? Bytes.empty : Base64.decode(raw))
        end
        result
      end

      def self.to_json(value : Array(Bytes)?, json : JSON::Builder) : Nil
        if value
          json.array do
            value.each do |item|
              json.string(Base64.strict_encode(item))
            end
          end
        else
          json.null
        end
      end
    end
  end
end
