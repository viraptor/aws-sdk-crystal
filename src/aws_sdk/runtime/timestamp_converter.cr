require "json"
require "time"

module AwsSdk
  module Runtime
    module UnixTimestampConverter
      def self.from_json(value : JSON::PullParser) : Time?
        return nil if value.kind.null?

        if value.kind.float?
          epoch = value.read_float
          return Time.unix(epoch.to_i)
        end

        if value.kind.int?
          return Time.unix(value.read_int)
        end

        if value.kind.string?
          raw = value.read_string
          return nil if raw.empty?
          return Time.unix(raw.to_f.to_i)
        end

        value.skip
        nil
      end

      def self.to_json(value : Time?, json : JSON::Builder) : Nil
        if value
          json.number(value.to_unix_f)
        else
          json.null
        end
      end
    end
  end
end
