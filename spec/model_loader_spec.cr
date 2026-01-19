require "./spec_helper"

describe CrystalSdkGenerator::ModelLoader do
  it "loads metadata and counts for kinesis model" do
    model = CrystalSdkGenerator::ModelLoader.load(CrystalSdkGeneratorSpec::API_PATH)

    model.metadata.protocol.should eq("rest-json")
    model.metadata.service_id.should eq("Kinesis Video WebRTC Storage")
    model.metadata.api_version.should eq("2018-05-10")
    model.metadata.endpoint_prefix.should eq("kinesisvideo")

    model.operations.size.should eq(2)
    model.shapes.size.should eq(9)
  end

  it "loads operations with HTTP info" do
    model = CrystalSdkGenerator::ModelLoader.load(CrystalSdkGeneratorSpec::API_PATH)
    operation = model.operations["JoinStorageSession"]

    operation.http_method.should eq("POST")
    operation.request_uri.should eq("/joinStorageSession")
    operation.errors.should contain("AccessDeniedException")
  end

  it "marks required members on structure shapes" do
    model = CrystalSdkGenerator::ModelLoader.load(CrystalSdkGeneratorSpec::API_PATH)
    input = model.shapes["JoinStorageSessionInput"]

    input.structure?.should be_true
    input.members["channelArn"].required.should be_true
  end

  it "loads docs for operations and members" do
    model = CrystalSdkGenerator::ModelLoader.load(CrystalSdkGeneratorSpec::API_PATH)
    operation = model.operations["JoinStorageSession"]
    input = model.shapes["JoinStorageSessionInput"]
    error_shape = model.shapes["AccessDeniedException"]

    operation.documentation.should_not be_nil
    input.members["channelArn"].documentation.should_not be_nil
    error_shape.documentation.should_not be_nil

    operation.documentation.not_nil!.should contain("Join the ongoing one way-video")
    input.members["channelArn"].documentation.not_nil!.should contain("signaling channel")
    error_shape.documentation.not_nil!.should contain("required permissions")
  end

  it "applies customizations to the API model" do
    CrystalSdkGenerator::Customizations.clear

    CrystalSdkGenerator::Customizations.register("Kinesis Video WebRTC Storage") do |root|
      root["metadata"].as_h["endpointPrefix"] = JSON::Any.new("patched-prefix")
    end

    model = CrystalSdkGenerator::ModelLoader.load(CrystalSdkGeneratorSpec::API_PATH)

    model.metadata.endpoint_prefix.should eq("patched-prefix")
  ensure
    CrystalSdkGenerator::Customizations.clear
  end

  it "loads optional paginators when present" do
    model = CrystalSdkGenerator::ModelLoader.load(CrystalSdkGeneratorSpec::ENTITLEMENT_API_PATH)
    paginators = model.paginators

    paginators.should_not be_nil
    paginators.not_nil!.rules.has_key?("GetEntitlements").should be_true
  end

  it "leaves optional models empty when missing" do
    model = CrystalSdkGenerator::ModelLoader.load(CrystalSdkGeneratorSpec::API_PATH)

    model.paginators.should_not be_nil
    model.paginators.not_nil!.rules.should be_empty
    model.waiters.should be_nil
    model.resources.should be_nil
  end
end

describe CrystalSdkGenerator::ProtocolSelector do
  it "selects the protocol using metadata" do
    model = CrystalSdkGenerator::ModelLoader.load(CrystalSdkGeneratorSpec::API_PATH)
    CrystalSdkGenerator::ProtocolSelector.select(model.metadata).should eq("rest-json")
  end

  it "raises for unsupported protocols" do
    metadata = CrystalSdkGenerator::Metadata.new(
      {"protocol" => JSON::Any.new("unsupported-protocol")}
    )

    expect_raises(CrystalSdkGenerator::UnsupportedProtocolError, /unsupported protocols/) do
      CrystalSdkGenerator::ProtocolSelector.select(metadata)
    end
  end
end

describe CrystalSdkGenerator::ShapeResolver do
  it "merges shape and ref traits with ref precedence" do
    model = CrystalSdkGenerator::ModelLoader.load(CrystalSdkGeneratorSpec::API_PATH)
    resolver = CrystalSdkGenerator::ShapeResolver.new(model)

    override_traits = {"exception" => JSON::Any.new(false)}
    ref = CrystalSdkGenerator::ShapeRef.new("AccessDeniedException", override_traits)

    resolver.effective_traits(ref)["exception"].as_bool.should be_false
  end
end
