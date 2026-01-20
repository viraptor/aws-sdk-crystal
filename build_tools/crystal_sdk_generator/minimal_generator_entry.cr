require "set"
require "./minimal_generator"

module CrystalSdkGenerator
  if PROGRAM_NAME == __FILE__ || File.basename(PROGRAM_NAME) == "generate-services"
    if ARGV.size < 2
      raise ArgumentError.new("usage: generate-services <api-2.json path or model dir>... <output root>")
    end

    output_root = ARGV.last
    input_paths = ARGV[0, ARGV.size - 1]
    api_paths = expand_api_paths(input_paths)

    if api_paths.empty?
      raise ArgumentError.new("no api-2.json files found for inputs: #{input_paths.join(", ")}")
    end

    api_paths.each do |api_path|
      MinimalGenerator.generate_service(api_path, output_root)
    end
  end

  private def self.expand_api_paths(inputs : Array(String)) : Array(String)
    paths = Set(String).new

    inputs.each do |input|
      if File.file?(input)
        paths << input
      elsif File.directory?(input)
        direct_api = File.join(input, "api-2.json")
        if File.file?(direct_api)
          paths << direct_api
        else
          Dir.glob(File.join(input, "**", "api-2.json")) { |path| paths << path }
        end
      else
        raise ArgumentError.new("input not found: #{input}")
      end
    end

    paths.to_a.sort
  end
end
