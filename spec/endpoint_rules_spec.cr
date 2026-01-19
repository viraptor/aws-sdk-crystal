require "./spec_helper"

describe CrystalSdkGenerator::EndpointRulesEngine do
  it "resolves XRay endpoint tests" do
    model = CrystalSdkGenerator::ModelLoader.load(CrystalSdkGeneratorSpec::XRAY_API_PATH)
    rule_set = model.endpoint_rule_set
    tests = model.endpoint_tests

    rule_set.should_not be_nil
    tests.should_not be_nil

    engine = CrystalSdkGenerator::EndpointRulesEngine.new(
      rule_set.not_nil!,
      CrystalSdkGenerator::PartitionProvider.load(CrystalSdkGeneratorSpec::PARTITIONS_PATH)
    )

    tests.not_nil!.test_cases.each do |case_any|
      test_case = case_any.as_h
      params = test_case["params"]?.try(&.as_h) || {} of String => JSON::Any
      expect_hash = test_case["expect"].as_h

      if (error_any = expect_hash["error"]?)
        error_message = error_any.as_s
        error = expect_raises(CrystalSdkGenerator::EndpointRuleError) do
          engine.resolve(params)
        end
        error.message.should eq(error_message)
      else
        endpoint = expect_hash["endpoint"].as_h
        expected_url = endpoint["url"].as_s
        result = engine.resolve(params)
        result.url.should eq(expected_url)
      end
    end
  end

  it "rejects unsupported endpoint parameters" do
    model = CrystalSdkGenerator::ModelLoader.load(CrystalSdkGeneratorSpec::XRAY_API_PATH)
    rule_set = model.endpoint_rule_set

    rule_set.should_not be_nil

    engine = CrystalSdkGenerator::EndpointRulesEngine.new(
      rule_set.not_nil!,
      CrystalSdkGenerator::PartitionProvider.load(CrystalSdkGeneratorSpec::PARTITIONS_PATH)
    )

    params = {
      "Region"       => JSON::Any.new("us-west-2"),
      "UseFIPS"      => JSON::Any.new(false),
      "UseDualStack" => JSON::Any.new(false),
      "Unknown"      => JSON::Any.new(true),
    }

    error = expect_raises(CrystalSdkGenerator::EndpointRuleError) do
      engine.resolve(params)
    end
    error.message.should eq("Unsupported endpoint parameter: Unknown")
  end
end
