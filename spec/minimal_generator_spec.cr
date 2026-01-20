require "./spec_helper"
require "file_utils"

describe CrystalSdkGenerator::MinimalGenerator do
  it "generates Kinesis WebRTC Storage files for testing" do
    dir = File.join(Dir.tempdir, "crystal-sdk-gen-#{Random::Secure.hex(6)}")
    FileUtils.mkdir_p(dir)

    begin
      CrystalSdkGenerator::MinimalGenerator.generate_service(CrystalSdkGeneratorSpec::API_PATH, dir)

      base = File.join(dir, "src", "kinesisvideowebrtcstorage")
      File.exists?(File.join(dir, "src", "kinesisvideowebrtcstorage.cr")).should be_true
      File.exists?(File.join(dir, "src", "customizations", "kinesisvideowebrtcstorage", "customizations.cr")).should be_true
      File.exists?(File.join(base, "client.cr")).should be_true
      File.exists?(File.join(base, "model.cr")).should be_true
      File.exists?(File.join(base, "errors.cr")).should be_true
      File.exists?(File.join(base, "types.cr")).should be_true
      File.exists?(File.join(base, "protocol", "rest_json.cr")).should be_true

      File.read(File.join(dir, "src", "kinesisvideowebrtcstorage.cr")).should contain("customizations/kinesisvideowebrtcstorage/customizations")
      File.read(File.join(base, "client.cr")).should contain("class Client")
      File.read(File.join(base, "client.cr")).should contain("Join the ongoing one way-video")
      File.read(File.join(base, "protocol", "rest_json.cr")).should contain("module RestJson")
    ensure
      FileUtils.rm_r(dir)
    end
  end

  it "generates DynamoDB Streams files for testing" do
    dir = File.join(Dir.tempdir, "crystal-sdk-gen-#{Random::Secure.hex(6)}")
    FileUtils.mkdir_p(dir)

    begin
      CrystalSdkGenerator::MinimalGenerator.generate_service(CrystalSdkGeneratorSpec::DYNAMODB_STREAMS_API_PATH, dir)

      base = File.join(dir, "src", "dynamodbstreams")
      File.exists?(File.join(dir, "src", "dynamodbstreams.cr")).should be_true
      File.exists?(File.join(base, "client.cr")).should be_true
      File.exists?(File.join(base, "model.cr")).should be_true
      File.exists?(File.join(base, "errors.cr")).should be_true
      File.exists?(File.join(base, "types.cr")).should be_true
      File.exists?(File.join(base, "protocol", "json_rpc.cr")).should be_true

      File.read(File.join(base, "client.cr")).should contain("class Client")
      File.read(File.join(base, "protocol", "json_rpc.cr")).should contain("module JsonRpc")
      File.read(File.join(base, "types.cr")).should contain("struct ShardFilter")
    ensure
      FileUtils.rm_r(dir)
    end
  end

  it "generates ImportExport files for testing" do
    dir = File.join(Dir.tempdir, "crystal-sdk-gen-#{Random::Secure.hex(6)}")
    FileUtils.mkdir_p(dir)

    begin
      CrystalSdkGenerator::MinimalGenerator.generate_service(CrystalSdkGeneratorSpec::IMPORT_EXPORT_API_PATH, dir)

      base = File.join(dir, "src", "importexport")
      File.exists?(File.join(dir, "src", "importexport.cr")).should be_true
      File.exists?(File.join(base, "client.cr")).should be_true
      File.exists?(File.join(base, "model.cr")).should be_true
      File.exists?(File.join(base, "errors.cr")).should be_true
      File.exists?(File.join(base, "types.cr")).should be_true
      File.exists?(File.join(base, "protocol", "query.cr")).should be_true

      File.read(File.join(base, "client.cr")).should contain("class Client")
      File.read(File.join(base, "protocol", "query.cr")).should contain("module Query")
    ensure
      FileUtils.rm_r(dir)
    end
  end

  it "generates STS files for testing" do
    dir = File.join(Dir.tempdir, "crystal-sdk-gen-#{Random::Secure.hex(6)}")
    FileUtils.mkdir_p(dir)

    begin
      CrystalSdkGenerator::MinimalGenerator.generate_service(CrystalSdkGeneratorSpec::STS_API_PATH, dir)

      base = File.join(dir, "src", "sts")
      File.exists?(File.join(dir, "src", "sts.cr")).should be_true
      File.exists?(File.join(base, "client.cr")).should be_true
      File.exists?(File.join(base, "model.cr")).should be_true
      File.exists?(File.join(base, "errors.cr")).should be_true
      File.exists?(File.join(base, "types.cr")).should be_true
      File.exists?(File.join(base, "protocol", "query.cr")).should be_true

      File.read(File.join(base, "client.cr")).should contain("class Client")
      File.read(File.join(base, "protocol", "query.cr")).should contain("module Query")
    ensure
      FileUtils.rm_r(dir)
    end
  end

  it "generates CloudFront files for testing" do
    dir = File.join(Dir.tempdir, "crystal-sdk-gen-#{Random::Secure.hex(6)}")
    FileUtils.mkdir_p(dir)

    begin
      CrystalSdkGenerator::MinimalGenerator.generate_service(CrystalSdkGeneratorSpec::CLOUDFRONT_API_PATH, dir)

      base = File.join(dir, "src", "cloudfront")
      File.exists?(File.join(dir, "src", "cloudfront.cr")).should be_true
      File.exists?(File.join(base, "client.cr")).should be_true
      File.exists?(File.join(base, "model.cr")).should be_true
      File.exists?(File.join(base, "errors.cr")).should be_true
      File.exists?(File.join(base, "types.cr")).should be_true
      File.exists?(File.join(base, "protocol", "rest_xml.cr")).should be_true

      File.read(File.join(base, "client.cr")).should contain("class Client")
      File.read(File.join(base, "protocol", "rest_xml.cr")).should contain("module RestXml")
    ensure
      FileUtils.rm_r(dir)
    end
  end
end
