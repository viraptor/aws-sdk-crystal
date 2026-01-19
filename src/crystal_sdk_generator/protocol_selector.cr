module CrystalSdkGenerator
  class UnsupportedProtocolError < Exception
  end

  class ProtocolSelector
    SUPPORTED_PROTOCOLS = [
      "api-gateway",
      "json_1.0",
      "json_1.1",
      "smithy-rpc-v2-cbor",
      "rest-json",
      "rest-xml",
      "query",
      "ec2",
    ]

    def self.select(metadata : Metadata) : String
      candidates = if (protocols = metadata.protocols)
                     protocols
                   elsif (protocol = metadata.protocol)
                     [protocol]
                   else
                     [] of String
                   end

      raise UnsupportedProtocolError.new("no protocol listed in metadata") if candidates.empty?

      normalized = candidates.map { |protocol| normalize_protocol(protocol, metadata) }
      selected = normalized.find { |protocol| SUPPORTED_PROTOCOLS.includes?(protocol) }

      if selected.nil?
        raise UnsupportedProtocolError.new("unsupported protocols: #{normalized.join(", ")}")
      end

      selected
    end

    private def self.normalize_protocol(protocol : String, metadata : Metadata) : String
      return protocol unless protocol == "json"

      case metadata.json_version
      when "1.0"
        "json_1.0"
      when "1.1"
        "json_1.1"
      else
        "json_1.0"
      end
    end
  end
end
