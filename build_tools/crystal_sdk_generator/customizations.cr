require "json"

module CrystalSdkGenerator
  module Customizations
    alias Hook = Proc(Hash(String, JSON::Any), Nil)

    @@hooks = {} of String => Hook

    def self.register(service_key : String, &block : Hook) : Nil
      @@hooks[service_key] = block
    end

    def self.apply(service_key : String, model : Hash(String, JSON::Any)) : Nil
      @@hooks[service_key]?.try(&.call(model))
    end

    def self.clear : Nil
      @@hooks.clear
    end

    def self.service_key(api_path : String, metadata : Hash(String, JSON::Any)) : String
      metadata["serviceId"]?.try(&.as_s) ||
        metadata["endpointPrefix"]?.try(&.as_s) ||
        metadata["signingName"]?.try(&.as_s) ||
        service_from_path(api_path)
    end

    private def self.service_from_path(api_path : String) : String
      base_dir = File.dirname(api_path)
      service_dir = File.basename(File.dirname(base_dir))
      service_dir.empty? ? "service" : service_dir
    end
  end
end

CrystalSdkGenerator::Customizations.register("Route 53") do |root|
  # HACK: Route53 sometimes omits Marker in list responses even though the
  # model marks it required. Keep this until AWS fixes the model.
  shapes = root["shapes"]?.try(&.as_h)
  next unless shapes

  %w[ListHealthChecksResponse ListHostedZonesResponse ListReusableDelegationSetsResponse].each do |shape_name|
    shape = shapes[shape_name]?.try(&.as_h)
    next unless shape

    required_any = shape["required"]?
    next unless required_any

    required = required_any.as_a
    filtered = required.reject { |item| item.as_s == "Marker" }
    next if filtered.size == required.size

    if filtered.empty?
      shape.delete("required")
    else
      shape["required"] = JSON::Any.new(filtered)
    end
  end
end
