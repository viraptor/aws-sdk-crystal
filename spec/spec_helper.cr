require "spec"
require "../src/crystal_sdk_generator"
require "../src/aws_sdk/kinesis_video_webrtc_storage"
require "../src/aws_sdk/streams_dynamodb"
require "../src/aws_sdk/import_export"
require "../src/aws_sdk/cloudfront"
require "../src/aws_sdk/route53"
require "../src/aws_sdk/sts"
require "../src/aws_sdk/ssm"

module CrystalSdkGeneratorSpec
  API_PATH = File.expand_path("../apis/kinesis-video-webrtc-storage/2018-05-10/api-2.json", __DIR__)
  ENTITLEMENT_API_PATH = File.expand_path("../apis/entitlement.marketplace/2017-01-11/api-2.json", __DIR__)
  DYNAMODB_STREAMS_API_PATH = File.expand_path("../apis/streams.dynamodb/2012-08-10/api-2.json", __DIR__)
  IMPORT_EXPORT_API_PATH = File.expand_path("../apis/importexport/2010-06-01/api-2.json", __DIR__)
  CLOUDFRONT_API_PATH = File.expand_path("../apis/cloudfront/2016-01-28/api-2.json", __DIR__)
  ROUTE53_API_PATH = File.expand_path("../apis/route53/2013-04-01/api-2.json", __DIR__)
  STS_API_PATH = File.expand_path("../apis/sts/2011-06-15/api-2.json", __DIR__)
  XRAY_API_PATH = File.expand_path("../apis/xray/2016-04-12/api-2.json", __DIR__)
  PARTITIONS_PATH = File.expand_path("../apis/partitions.json", __DIR__)
end
