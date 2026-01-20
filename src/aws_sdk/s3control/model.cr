module AwsSdk
  module S3Control
    module Model
      API_VERSION = "2018-08-20"
      TARGET_PREFIX = ""
      SIGNING_NAME = "s3"
      ENDPOINT_PREFIX = "s3-control"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"AccountId":{"required":false,"documentation":"The Account ID used to send the request. This is an optional parameter that will be set automatically for operations that require it.","type":"string"},"RequiresAccountId":{"required":false,"documentation":"Internal parameter for operations that require account id host prefix.","type":"boolean"},"OutpostId":{"required":false,"documentation":"The Outpost ID.  Some operations have an optional OutpostId which should be used in endpoint construction.","type":"string"},"Bucket":{"required":false,"documentation":"The S3 bucket used to send the request. This is an optional parameter that will be set automatically for operations that are scoped to an S3 bucket.","type":"string"},"AccessPointName":{"required":false,"documentation":"The S3 AccessPointName used to send the request. This is an optional parameter that will be set automatically for operations that are scoped to an S3 AccessPoint.","type":"string"},"UseArnRegion":{"builtIn":"AWS::S3Control::UseArnRegion","required":false,"documentation":"When an Access Point ARN is provided and this flag is enabled, the SDK MUST use the ARN's region when constructing the endpoint instead of the client's configured region.","type":"boolean"},"ResourceArn":{"required":false,"documentation":"The resource ARN included in the request.  Only set on TagResource, UntagResourceand ListTagsForResource","type":"string"},"UseS3ExpressControlEndpoint":{"required":false,"documentation":"Internal parameter to indicate whether S3Express operation should use control plane, (ex. ListDirectoryAccessPoints)","type":"boolean"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"partitionResult"},{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"partitionResult"},"name"]},"aws-cn"]}],"error":"Partition does not support FIPS","type":"error"},{"conditions":[{"fn":"isSet","argv":[{"ref":"OutpostId"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"partitionResult"}],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"RequiresAccountId"}]},{"fn":"booleanEquals","argv":[{"ref":"RequiresAccountId"},true]},{"fn":"not","argv":[{"fn":"isSet","argv":[{"ref":"AccountId"}]}]}],"error":"AccountId is required but not set","type":"error"},{"conditions":[{"fn":"isSet","argv":[{"ref":"AccountId"}]},{"fn":"not","argv":[{"fn":"isValidHostLabel","argv":[{"ref":"AccountId"},false]}]}],"error":"AccountId must only contain a-z, A-Z, 0-9 and `-`.","type":"error"},{"conditions":[{"fn":"not","argv":[{"fn":"isValidHostLabel","argv":[{"ref":"OutpostId"},false]}]}],"error":"OutpostId must only contain a-z, A-Z, 0-9 and `-`.","type":"error"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: DualStack and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"isValidHostLabel","argv":[{"ref":"Region"},true]}],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]},{"fn":"parseURL","argv":[{"ref":"Endpoint"}],"assign":"url"}],"endpoint":{"url":"{url#scheme}://{url#authority}{url#path}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3-outposts","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://s3-outposts-fips.{Region}.{partitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3-outposts","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://s3-outposts-fips.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3-outposts","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://s3-outposts.{Region}.{partitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3-outposts","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://s3-outposts.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3-outposts","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"Invalid region: region was not a valid DNS name.","type":"error"}],"type":"tree"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"ResourceArn"}]},{"fn":"aws.parseArn","argv":[{"ref":"ResourceArn"}],"assign":"resourceArn"},{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"resourceArn"},"service"]},"s3express"]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"partitionResult"}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"fn":"getAttr","argv":[{"ref":"resourceArn"},"region"]}],"assign":"arnPartition"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"arnPartition"},"name"]},{"fn":"getAttr","argv":[{"ref":"partitionResult"},"name"]}]}],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"UseArnRegion"}]},{"fn":"booleanEquals","argv":[{"ref":"UseArnRegion"},false]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"resourceArn"},"region"]},"{Region}"]}]}],"error":"Invalid configuration: region from ARN `{resourceArn#region}` does not match client region `{Region}` and UseArnRegion is `false`","type":"error"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: DualStack and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"S3Express does not support Dual-stack.","type":"error"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]},{"fn":"parseURL","argv":[{"ref":"Endpoint"}],"assign":"url"}],"endpoint":{"url":"{url#scheme}://{url#authority}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3express","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://s3express-control-fips.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3express","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://s3express-control.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3express","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"Client was configured for partition `{partitionResult#name}` but ARN has `{arnPartition#name}`","type":"error"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"AccessPointName"}]},{"fn":"substring","argv":[{"ref":"AccessPointName"},0,7,true],"assign":"accessPointSuffix"},{"fn":"stringEquals","argv":[{"ref":"accessPointSuffix"},"--xa-s3"]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"partitionResult"}],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: DualStack and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"S3Express does not support Dual-stack.","type":"error"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]},{"fn":"parseURL","argv":[{"ref":"Endpoint"}],"assign":"url"}],"endpoint":{"url":"{url#scheme}://{url#authority}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3express","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"substring","argv":[{"ref":"AccessPointName"},7,15,true],"assign":"s3expressAvailabilityZoneId"},{"fn":"substring","argv":[{"ref":"AccessPointName"},15,17,true],"assign":"s3expressAvailabilityZoneDelim"},{"fn":"stringEquals","argv":[{"ref":"s3expressAvailabilityZoneDelim"},"--"]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://s3express-control-fips.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3express","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://s3express-control.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3express","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"substring","argv":[{"ref":"AccessPointName"},7,16,true],"assign":"s3expressAvailabilityZoneId"},{"fn":"substring","argv":[{"ref":"AccessPointName"},16,18,true],"assign":"s3expressAvailabilityZoneDelim"},{"fn":"stringEquals","argv":[{"ref":"s3expressAvailabilityZoneDelim"},"--"]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://s3express-control-fips.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3express","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://s3express-control.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3express","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"substring","argv":[{"ref":"AccessPointName"},7,20,true],"assign":"s3expressAvailabilityZoneId"},{"fn":"substring","argv":[{"ref":"AccessPointName"},20,22,true],"assign":"s3expressAvailabilityZoneDelim"},{"fn":"stringEquals","argv":[{"ref":"s3expressAvailabilityZoneDelim"},"--"]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://s3express-control-fips.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3express","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://s3express-control.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3express","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"substring","argv":[{"ref":"AccessPointName"},7,21,true],"assign":"s3expressAvailabilityZoneId"},{"fn":"substring","argv":[{"ref":"AccessPointName"},21,23,true],"assign":"s3expressAvailabilityZoneDelim"},{"fn":"stringEquals","argv":[{"ref":"s3expressAvailabilityZoneDelim"},"--"]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://s3express-control-fips.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3express","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://s3express-control.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3express","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"substring","argv":[{"ref":"AccessPointName"},7,27,true],"assign":"s3expressAvailabilityZoneId"},{"fn":"substring","argv":[{"ref":"AccessPointName"},27,29,true],"assign":"s3expressAvailabilityZoneDelim"},{"fn":"stringEquals","argv":[{"ref":"s3expressAvailabilityZoneDelim"},"--"]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://s3express-control-fips.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3express","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://s3express-control.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3express","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"Unrecognized S3Express Access Point name format.","type":"error"}],"type":"tree"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"UseS3ExpressControlEndpoint"}]},{"fn":"booleanEquals","argv":[{"ref":"UseS3ExpressControlEndpoint"},true]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"partitionResult"}],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: DualStack and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"S3Express does not support Dual-stack.","type":"error"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]},{"fn":"parseURL","argv":[{"ref":"Endpoint"}],"assign":"url"}],"endpoint":{"url":"{url#scheme}://{url#authority}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3express","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://s3express-control-fips.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3express","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://s3express-control.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3express","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"snow"]},{"fn":"isSet","argv":[{"ref":"Endpoint"}]},{"fn":"parseURL","argv":[{"ref":"Endpoint"}],"assign":"url"}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"partitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"S3 Snow does not support DualStack","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"S3 Snow does not support FIPS","type":"error"},{"conditions":[],"endpoint":{"url":"{url#scheme}://{url#authority}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"AccessPointName"}]},{"fn":"aws.parseArn","argv":[{"ref":"AccessPointName"}],"assign":"accessPointArn"}],"rules":[{"conditions":[{"fn":"getAttr","argv":[{"ref":"accessPointArn"},"resourceId[0]"],"assign":"arnType"},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"ref":"arnType"},""]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"accessPointArn"},"service"]},"s3-outposts"]}],"rules":[{"conditions":[{"fn":"getAttr","argv":[{"ref":"accessPointArn"},"resourceId[1]"],"assign":"outpostId"}],"rules":[{"conditions":[{"fn":"isValidHostLabel","argv":[{"ref":"outpostId"},false]}],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: DualStack and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"isSet","argv":[{"ref":"UseArnRegion"}]},{"fn":"booleanEquals","argv":[{"ref":"UseArnRegion"},false]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"accessPointArn"},"region"]},"{Region}"]}]}],"error":"Invalid configuration: region from ARN `{accessPointArn#region}` does not match client region `{Region}` and UseArnRegion is `false`","type":"error"},{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"partitionResult"}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"fn":"getAttr","argv":[{"ref":"accessPointArn"},"region"]}],"assign":"arnPartition"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"arnPartition"},"name"]},{"fn":"getAttr","argv":[{"ref":"partitionResult"},"name"]}]}],"rules":[{"conditions":[{"fn":"isValidHostLabel","argv":[{"fn":"getAttr","argv":[{"ref":"accessPointArn"},"region"]},true]}],"rules":[{"conditions":[{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"accessPointArn"},"accountId"]},""]}]}],"rules":[{"conditions":[{"fn":"isValidHostLabel","argv":[{"fn":"getAttr","argv":[{"ref":"accessPointArn"},"accountId"]},false]}],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"AccountId"}]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"ref":"AccountId"},"{accessPointArn#accountId}"]}]}],"error":"Invalid ARN: the accountId specified in the ARN (`{accessPointArn#accountId}`) does not match the parameter (`{AccountId}`)","type":"error"},{"conditions":[{"fn":"getAttr","argv":[{"ref":"accessPointArn"},"resourceId[2]"],"assign":"outpostType"}],"rules":[{"conditions":[{"fn":"getAttr","argv":[{"ref":"accessPointArn"},"resourceId[3]"],"assign":"accessPointName"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"outpostType"},"accesspoint"]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://s3-outposts-fips.{accessPointArn#region}.{arnPartition#dualStackDnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3-outposts","signingRegion":"{accessPointArn#region}"}]},"headers":{"x-amz-account-id":["{accessPointArn#accountId}"],"x-amz-outpost-id":["{outpostId}"]}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://s3-outposts-fips.{accessPointArn#region}.{arnPartition#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3-outposts","signingRegion":"{accessPointArn#region}"}]},"headers":{"x-amz-account-id":["{accessPointArn#accountId}"],"x-amz-outpost-id":["{outpostId}"]}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://s3-outposts.{accessPointArn#region}.{arnPartition#dualStackDnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3-outposts","signingRegion":"{accessPointArn#region}"}]},"headers":{"x-amz-account-id":["{accessPointArn#accountId}"],"x-amz-outpost-id":["{outpostId}"]}},"type":"endpoint"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]},{"fn":"parseURL","argv":[{"ref":"Endpoint"}],"assign":"url"}],"endpoint":{"url":"{url#scheme}://{url#authority}{url#path}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3-outposts","signingRegion":"{accessPointArn#region}"}]},"headers":{"x-amz-account-id":["{accessPointArn#accountId}"],"x-amz-outpost-id":["{outpostId}"]}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://s3-outposts.{accessPointArn#region}.{arnPartition#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3-outposts","signingRegion":"{accessPointArn#region}"}]},"headers":{"x-amz-account-id":["{accessPointArn#accountId}"],"x-amz-outpost-id":["{outpostId}"]}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"Expected an outpost type `accesspoint`, found `{outpostType}`","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: expected an access point name","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: Expected a 4-component resource","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: The account id may only contain a-z, A-Z, 0-9 and `-`. Found: `{accessPointArn#accountId}`","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: missing account ID","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid region in ARN: `{accessPointArn#region}` (invalid DNS name)","type":"error"}],"type":"tree"},{"conditions":[],"error":"Client was configured for partition `{partitionResult#name}` but ARN has `{arnPartition#name}`","type":"error"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: The outpost Id must only contain a-z, A-Z, 0-9 and `-`., found: `{outpostId}`","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: The Outpost Id was not set","type":"error"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: No ARN type specified","type":"error"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Bucket"}]},{"fn":"aws.parseArn","argv":[{"ref":"Bucket"}],"assign":"bucketArn"}],"rules":[{"conditions":[{"fn":"getAttr","argv":[{"ref":"bucketArn"},"resourceId[0]"],"assign":"arnType"},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"ref":"arnType"},""]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"bucketArn"},"service"]},"s3-outposts"]}],"rules":[{"conditions":[{"fn":"getAttr","argv":[{"ref":"bucketArn"},"resourceId[1]"],"assign":"outpostId"}],"rules":[{"conditions":[{"fn":"isValidHostLabel","argv":[{"ref":"outpostId"},false]}],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: DualStack and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"isSet","argv":[{"ref":"UseArnRegion"}]},{"fn":"booleanEquals","argv":[{"ref":"UseArnRegion"},false]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"bucketArn"},"region"]},"{Region}"]}]}],"error":"Invalid configuration: region from ARN `{bucketArn#region}` does not match client region `{Region}` and UseArnRegion is `false`","type":"error"},{"conditions":[{"fn":"aws.partition","argv":[{"fn":"getAttr","argv":[{"ref":"bucketArn"},"region"]}],"assign":"arnPartition"}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"partitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"arnPartition"},"name"]},{"fn":"getAttr","argv":[{"ref":"partitionResult"},"name"]}]}],"rules":[{"conditions":[{"fn":"isValidHostLabel","argv":[{"fn":"getAttr","argv":[{"ref":"bucketArn"},"region"]},true]}],"rules":[{"conditions":[{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"bucketArn"},"accountId"]},""]}]}],"rules":[{"conditions":[{"fn":"isValidHostLabel","argv":[{"fn":"getAttr","argv":[{"ref":"bucketArn"},"accountId"]},false]}],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"AccountId"}]},{"fn":"not","argv":[{"fn":"stringEquals","argv":[{"ref":"AccountId"},"{bucketArn#accountId}"]}]}],"error":"Invalid ARN: the accountId specified in the ARN (`{bucketArn#accountId}`) does not match the parameter (`{AccountId}`)","type":"error"},{"conditions":[{"fn":"getAttr","argv":[{"ref":"bucketArn"},"resourceId[2]"],"assign":"outpostType"}],"rules":[{"conditions":[{"fn":"getAttr","argv":[{"ref":"bucketArn"},"resourceId[3]"],"assign":"bucketName"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"outpostType"},"bucket"]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://s3-outposts-fips.{bucketArn#region}.{arnPartition#dualStackDnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3-outposts","signingRegion":"{bucketArn#region}"}]},"headers":{"x-amz-account-id":["{bucketArn#accountId}"],"x-amz-outpost-id":["{outpostId}"]}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://s3-outposts-fips.{bucketArn#region}.{arnPartition#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3-outposts","signingRegion":"{bucketArn#region}"}]},"headers":{"x-amz-account-id":["{bucketArn#accountId}"],"x-amz-outpost-id":["{outpostId}"]}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://s3-outposts.{bucketArn#region}.{arnPartition#dualStackDnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3-outposts","signingRegion":"{bucketArn#region}"}]},"headers":{"x-amz-account-id":["{bucketArn#accountId}"],"x-amz-outpost-id":["{outpostId}"]}},"type":"endpoint"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]},{"fn":"parseURL","argv":[{"ref":"Endpoint"}],"assign":"url"}],"endpoint":{"url":"{url#scheme}://{url#authority}{url#path}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3-outposts","signingRegion":"{bucketArn#region}"}]},"headers":{"x-amz-account-id":["{bucketArn#accountId}"],"x-amz-outpost-id":["{outpostId}"]}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://s3-outposts.{bucketArn#region}.{arnPartition#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3-outposts","signingRegion":"{bucketArn#region}"}]},"headers":{"x-amz-account-id":["{bucketArn#accountId}"],"x-amz-outpost-id":["{outpostId}"]}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: Expected an outpost type `bucket`, found `{outpostType}`","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: expected a bucket name","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: Expected a 4-component resource","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: The account id may only contain a-z, A-Z, 0-9 and `-`. Found: `{bucketArn#accountId}`","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: missing account ID","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid region in ARN: `{bucketArn#region}` (invalid DNS name)","type":"error"}],"type":"tree"},{"conditions":[],"error":"Client was configured for partition `{partitionResult#name}` but ARN has `{arnPartition#name}`","type":"error"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: The outpost Id must only contain a-z, A-Z, 0-9 and `-`., found: `{outpostId}`","type":"error"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: The Outpost Id was not set","type":"error"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid ARN: No ARN type specified","type":"error"}],"type":"tree"},{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"partitionResult"}],"rules":[{"conditions":[{"fn":"isValidHostLabel","argv":[{"ref":"Region"},true]}],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"RequiresAccountId"}]},{"fn":"booleanEquals","argv":[{"ref":"RequiresAccountId"},true]},{"fn":"not","argv":[{"fn":"isSet","argv":[{"ref":"AccountId"}]}]}],"error":"AccountId is required but not set","type":"error"},{"conditions":[{"fn":"isSet","argv":[{"ref":"AccountId"}]},{"fn":"not","argv":[{"fn":"isValidHostLabel","argv":[{"ref":"AccountId"},false]}]}],"error":"AccountId must only contain a-z, A-Z, 0-9 and `-`.","type":"error"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]},{"fn":"parseURL","argv":[{"ref":"Endpoint"}],"assign":"url"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: DualStack and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"isSet","argv":[{"ref":"RequiresAccountId"}]},{"fn":"booleanEquals","argv":[{"ref":"RequiresAccountId"},true]},{"fn":"isSet","argv":[{"ref":"AccountId"}]}],"endpoint":{"url":"{url#scheme}://{AccountId}.{url#authority}{url#path}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"{url#scheme}://{url#authority}{url#path}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]},{"fn":"isSet","argv":[{"ref":"RequiresAccountId"}]},{"fn":"booleanEquals","argv":[{"ref":"RequiresAccountId"},true]},{"fn":"isSet","argv":[{"ref":"AccountId"}]}],"endpoint":{"url":"https://{AccountId}.s3-control-fips.dualstack.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://s3-control-fips.dualstack.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]},{"fn":"isSet","argv":[{"ref":"RequiresAccountId"}]},{"fn":"booleanEquals","argv":[{"ref":"RequiresAccountId"},true]},{"fn":"isSet","argv":[{"ref":"AccountId"}]}],"endpoint":{"url":"https://{AccountId}.s3-control-fips.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://s3-control-fips.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]},{"fn":"isSet","argv":[{"ref":"RequiresAccountId"}]},{"fn":"booleanEquals","argv":[{"ref":"RequiresAccountId"},true]},{"fn":"isSet","argv":[{"ref":"AccountId"}]}],"endpoint":{"url":"https://{AccountId}.s3-control.dualstack.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://s3-control.dualstack.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]},{"fn":"isSet","argv":[{"ref":"RequiresAccountId"}]},{"fn":"booleanEquals","argv":[{"ref":"RequiresAccountId"},true]},{"fn":"isSet","argv":[{"ref":"AccountId"}]}],"endpoint":{"url":"https://{AccountId}.s3-control.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://s3-control.{Region}.{partitionResult#dnsSuffix}","properties":{"authSchemes":[{"disableDoubleEncoding":true,"name":"sigv4","signingName":"s3","signingRegion":"{Region}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"Invalid region: region was not a valid DNS name.","type":"error"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Region must be set","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_ACCESS_GRANTS_IDENTITY_CENTER = OperationModel.new(
        name: "AssociateAccessGrantsIdentityCenter",
        http_method: "POST",
        request_uri: "/v20180820/accessgrantsinstance/identitycenter"
      )

      CREATE_ACCESS_GRANT = OperationModel.new(
        name: "CreateAccessGrant",
        http_method: "POST",
        request_uri: "/v20180820/accessgrantsinstance/grant"
      )

      CREATE_ACCESS_GRANTS_INSTANCE = OperationModel.new(
        name: "CreateAccessGrantsInstance",
        http_method: "POST",
        request_uri: "/v20180820/accessgrantsinstance"
      )

      CREATE_ACCESS_GRANTS_LOCATION = OperationModel.new(
        name: "CreateAccessGrantsLocation",
        http_method: "POST",
        request_uri: "/v20180820/accessgrantsinstance/location"
      )

      CREATE_ACCESS_POINT = OperationModel.new(
        name: "CreateAccessPoint",
        http_method: "PUT",
        request_uri: "/v20180820/accesspoint/{name}"
      )

      CREATE_ACCESS_POINT_FOR_OBJECT_LAMBDA = OperationModel.new(
        name: "CreateAccessPointForObjectLambda",
        http_method: "PUT",
        request_uri: "/v20180820/accesspointforobjectlambda/{name}"
      )

      CREATE_BUCKET = OperationModel.new(
        name: "CreateBucket",
        http_method: "PUT",
        request_uri: "/v20180820/bucket/{name}"
      )

      CREATE_JOB = OperationModel.new(
        name: "CreateJob",
        http_method: "POST",
        request_uri: "/v20180820/jobs"
      )

      CREATE_MULTI_REGION_ACCESS_POINT = OperationModel.new(
        name: "CreateMultiRegionAccessPoint",
        http_method: "POST",
        request_uri: "/v20180820/async-requests/mrap/create"
      )

      CREATE_STORAGE_LENS_GROUP = OperationModel.new(
        name: "CreateStorageLensGroup",
        http_method: "POST",
        request_uri: "/v20180820/storagelensgroup"
      )

      DELETE_ACCESS_GRANT = OperationModel.new(
        name: "DeleteAccessGrant",
        http_method: "DELETE",
        request_uri: "/v20180820/accessgrantsinstance/grant/{id}"
      )

      DELETE_ACCESS_GRANTS_INSTANCE = OperationModel.new(
        name: "DeleteAccessGrantsInstance",
        http_method: "DELETE",
        request_uri: "/v20180820/accessgrantsinstance"
      )

      DELETE_ACCESS_GRANTS_INSTANCE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteAccessGrantsInstanceResourcePolicy",
        http_method: "DELETE",
        request_uri: "/v20180820/accessgrantsinstance/resourcepolicy"
      )

      DELETE_ACCESS_GRANTS_LOCATION = OperationModel.new(
        name: "DeleteAccessGrantsLocation",
        http_method: "DELETE",
        request_uri: "/v20180820/accessgrantsinstance/location/{id}"
      )

      DELETE_ACCESS_POINT = OperationModel.new(
        name: "DeleteAccessPoint",
        http_method: "DELETE",
        request_uri: "/v20180820/accesspoint/{name}"
      )

      DELETE_ACCESS_POINT_FOR_OBJECT_LAMBDA = OperationModel.new(
        name: "DeleteAccessPointForObjectLambda",
        http_method: "DELETE",
        request_uri: "/v20180820/accesspointforobjectlambda/{name}"
      )

      DELETE_ACCESS_POINT_POLICY = OperationModel.new(
        name: "DeleteAccessPointPolicy",
        http_method: "DELETE",
        request_uri: "/v20180820/accesspoint/{name}/policy"
      )

      DELETE_ACCESS_POINT_POLICY_FOR_OBJECT_LAMBDA = OperationModel.new(
        name: "DeleteAccessPointPolicyForObjectLambda",
        http_method: "DELETE",
        request_uri: "/v20180820/accesspointforobjectlambda/{name}/policy"
      )

      DELETE_ACCESS_POINT_SCOPE = OperationModel.new(
        name: "DeleteAccessPointScope",
        http_method: "DELETE",
        request_uri: "/v20180820/accesspoint/{name}/scope"
      )

      DELETE_BUCKET = OperationModel.new(
        name: "DeleteBucket",
        http_method: "DELETE",
        request_uri: "/v20180820/bucket/{name}"
      )

      DELETE_BUCKET_LIFECYCLE_CONFIGURATION = OperationModel.new(
        name: "DeleteBucketLifecycleConfiguration",
        http_method: "DELETE",
        request_uri: "/v20180820/bucket/{name}/lifecycleconfiguration"
      )

      DELETE_BUCKET_POLICY = OperationModel.new(
        name: "DeleteBucketPolicy",
        http_method: "DELETE",
        request_uri: "/v20180820/bucket/{name}/policy"
      )

      DELETE_BUCKET_REPLICATION = OperationModel.new(
        name: "DeleteBucketReplication",
        http_method: "DELETE",
        request_uri: "/v20180820/bucket/{name}/replication"
      )

      DELETE_BUCKET_TAGGING = OperationModel.new(
        name: "DeleteBucketTagging",
        http_method: "DELETE",
        request_uri: "/v20180820/bucket/{name}/tagging"
      )

      DELETE_JOB_TAGGING = OperationModel.new(
        name: "DeleteJobTagging",
        http_method: "DELETE",
        request_uri: "/v20180820/jobs/{id}/tagging"
      )

      DELETE_MULTI_REGION_ACCESS_POINT = OperationModel.new(
        name: "DeleteMultiRegionAccessPoint",
        http_method: "POST",
        request_uri: "/v20180820/async-requests/mrap/delete"
      )

      DELETE_PUBLIC_ACCESS_BLOCK = OperationModel.new(
        name: "DeletePublicAccessBlock",
        http_method: "DELETE",
        request_uri: "/v20180820/configuration/publicAccessBlock"
      )

      DELETE_STORAGE_LENS_CONFIGURATION = OperationModel.new(
        name: "DeleteStorageLensConfiguration",
        http_method: "DELETE",
        request_uri: "/v20180820/storagelens/{storagelensid}"
      )

      DELETE_STORAGE_LENS_CONFIGURATION_TAGGING = OperationModel.new(
        name: "DeleteStorageLensConfigurationTagging",
        http_method: "DELETE",
        request_uri: "/v20180820/storagelens/{storagelensid}/tagging"
      )

      DELETE_STORAGE_LENS_GROUP = OperationModel.new(
        name: "DeleteStorageLensGroup",
        http_method: "DELETE",
        request_uri: "/v20180820/storagelensgroup/{name}"
      )

      DESCRIBE_JOB = OperationModel.new(
        name: "DescribeJob",
        http_method: "GET",
        request_uri: "/v20180820/jobs/{id}"
      )

      DESCRIBE_MULTI_REGION_ACCESS_POINT_OPERATION = OperationModel.new(
        name: "DescribeMultiRegionAccessPointOperation",
        http_method: "GET",
        request_uri: "/v20180820/async-requests/mrap/{request_token+}"
      )

      DISSOCIATE_ACCESS_GRANTS_IDENTITY_CENTER = OperationModel.new(
        name: "DissociateAccessGrantsIdentityCenter",
        http_method: "DELETE",
        request_uri: "/v20180820/accessgrantsinstance/identitycenter"
      )

      GET_ACCESS_GRANT = OperationModel.new(
        name: "GetAccessGrant",
        http_method: "GET",
        request_uri: "/v20180820/accessgrantsinstance/grant/{id}"
      )

      GET_ACCESS_GRANTS_INSTANCE = OperationModel.new(
        name: "GetAccessGrantsInstance",
        http_method: "GET",
        request_uri: "/v20180820/accessgrantsinstance"
      )

      GET_ACCESS_GRANTS_INSTANCE_FOR_PREFIX = OperationModel.new(
        name: "GetAccessGrantsInstanceForPrefix",
        http_method: "GET",
        request_uri: "/v20180820/accessgrantsinstance/prefix"
      )

      GET_ACCESS_GRANTS_INSTANCE_RESOURCE_POLICY = OperationModel.new(
        name: "GetAccessGrantsInstanceResourcePolicy",
        http_method: "GET",
        request_uri: "/v20180820/accessgrantsinstance/resourcepolicy"
      )

      GET_ACCESS_GRANTS_LOCATION = OperationModel.new(
        name: "GetAccessGrantsLocation",
        http_method: "GET",
        request_uri: "/v20180820/accessgrantsinstance/location/{id}"
      )

      GET_ACCESS_POINT = OperationModel.new(
        name: "GetAccessPoint",
        http_method: "GET",
        request_uri: "/v20180820/accesspoint/{name}"
      )

      GET_ACCESS_POINT_CONFIGURATION_FOR_OBJECT_LAMBDA = OperationModel.new(
        name: "GetAccessPointConfigurationForObjectLambda",
        http_method: "GET",
        request_uri: "/v20180820/accesspointforobjectlambda/{name}/configuration"
      )

      GET_ACCESS_POINT_FOR_OBJECT_LAMBDA = OperationModel.new(
        name: "GetAccessPointForObjectLambda",
        http_method: "GET",
        request_uri: "/v20180820/accesspointforobjectlambda/{name}"
      )

      GET_ACCESS_POINT_POLICY = OperationModel.new(
        name: "GetAccessPointPolicy",
        http_method: "GET",
        request_uri: "/v20180820/accesspoint/{name}/policy"
      )

      GET_ACCESS_POINT_POLICY_FOR_OBJECT_LAMBDA = OperationModel.new(
        name: "GetAccessPointPolicyForObjectLambda",
        http_method: "GET",
        request_uri: "/v20180820/accesspointforobjectlambda/{name}/policy"
      )

      GET_ACCESS_POINT_POLICY_STATUS = OperationModel.new(
        name: "GetAccessPointPolicyStatus",
        http_method: "GET",
        request_uri: "/v20180820/accesspoint/{name}/policyStatus"
      )

      GET_ACCESS_POINT_POLICY_STATUS_FOR_OBJECT_LAMBDA = OperationModel.new(
        name: "GetAccessPointPolicyStatusForObjectLambda",
        http_method: "GET",
        request_uri: "/v20180820/accesspointforobjectlambda/{name}/policyStatus"
      )

      GET_ACCESS_POINT_SCOPE = OperationModel.new(
        name: "GetAccessPointScope",
        http_method: "GET",
        request_uri: "/v20180820/accesspoint/{name}/scope"
      )

      GET_BUCKET = OperationModel.new(
        name: "GetBucket",
        http_method: "GET",
        request_uri: "/v20180820/bucket/{name}"
      )

      GET_BUCKET_LIFECYCLE_CONFIGURATION = OperationModel.new(
        name: "GetBucketLifecycleConfiguration",
        http_method: "GET",
        request_uri: "/v20180820/bucket/{name}/lifecycleconfiguration"
      )

      GET_BUCKET_POLICY = OperationModel.new(
        name: "GetBucketPolicy",
        http_method: "GET",
        request_uri: "/v20180820/bucket/{name}/policy"
      )

      GET_BUCKET_REPLICATION = OperationModel.new(
        name: "GetBucketReplication",
        http_method: "GET",
        request_uri: "/v20180820/bucket/{name}/replication"
      )

      GET_BUCKET_TAGGING = OperationModel.new(
        name: "GetBucketTagging",
        http_method: "GET",
        request_uri: "/v20180820/bucket/{name}/tagging"
      )

      GET_BUCKET_VERSIONING = OperationModel.new(
        name: "GetBucketVersioning",
        http_method: "GET",
        request_uri: "/v20180820/bucket/{name}/versioning"
      )

      GET_DATA_ACCESS = OperationModel.new(
        name: "GetDataAccess",
        http_method: "GET",
        request_uri: "/v20180820/accessgrantsinstance/dataaccess"
      )

      GET_JOB_TAGGING = OperationModel.new(
        name: "GetJobTagging",
        http_method: "GET",
        request_uri: "/v20180820/jobs/{id}/tagging"
      )

      GET_MULTI_REGION_ACCESS_POINT = OperationModel.new(
        name: "GetMultiRegionAccessPoint",
        http_method: "GET",
        request_uri: "/v20180820/mrap/instances/{name+}"
      )

      GET_MULTI_REGION_ACCESS_POINT_POLICY = OperationModel.new(
        name: "GetMultiRegionAccessPointPolicy",
        http_method: "GET",
        request_uri: "/v20180820/mrap/instances/{name+}/policy"
      )

      GET_MULTI_REGION_ACCESS_POINT_POLICY_STATUS = OperationModel.new(
        name: "GetMultiRegionAccessPointPolicyStatus",
        http_method: "GET",
        request_uri: "/v20180820/mrap/instances/{name+}/policystatus"
      )

      GET_MULTI_REGION_ACCESS_POINT_ROUTES = OperationModel.new(
        name: "GetMultiRegionAccessPointRoutes",
        http_method: "GET",
        request_uri: "/v20180820/mrap/instances/{mrap+}/routes"
      )

      GET_PUBLIC_ACCESS_BLOCK = OperationModel.new(
        name: "GetPublicAccessBlock",
        http_method: "GET",
        request_uri: "/v20180820/configuration/publicAccessBlock"
      )

      GET_STORAGE_LENS_CONFIGURATION = OperationModel.new(
        name: "GetStorageLensConfiguration",
        http_method: "GET",
        request_uri: "/v20180820/storagelens/{storagelensid}"
      )

      GET_STORAGE_LENS_CONFIGURATION_TAGGING = OperationModel.new(
        name: "GetStorageLensConfigurationTagging",
        http_method: "GET",
        request_uri: "/v20180820/storagelens/{storagelensid}/tagging"
      )

      GET_STORAGE_LENS_GROUP = OperationModel.new(
        name: "GetStorageLensGroup",
        http_method: "GET",
        request_uri: "/v20180820/storagelensgroup/{name}"
      )

      LIST_ACCESS_GRANTS = OperationModel.new(
        name: "ListAccessGrants",
        http_method: "GET",
        request_uri: "/v20180820/accessgrantsinstance/grants"
      )

      LIST_ACCESS_GRANTS_INSTANCES = OperationModel.new(
        name: "ListAccessGrantsInstances",
        http_method: "GET",
        request_uri: "/v20180820/accessgrantsinstances"
      )

      LIST_ACCESS_GRANTS_LOCATIONS = OperationModel.new(
        name: "ListAccessGrantsLocations",
        http_method: "GET",
        request_uri: "/v20180820/accessgrantsinstance/locations"
      )

      LIST_ACCESS_POINTS = OperationModel.new(
        name: "ListAccessPoints",
        http_method: "GET",
        request_uri: "/v20180820/accesspoint"
      )

      LIST_ACCESS_POINTS_FOR_DIRECTORY_BUCKETS = OperationModel.new(
        name: "ListAccessPointsForDirectoryBuckets",
        http_method: "GET",
        request_uri: "/v20180820/accesspointfordirectory"
      )

      LIST_ACCESS_POINTS_FOR_OBJECT_LAMBDA = OperationModel.new(
        name: "ListAccessPointsForObjectLambda",
        http_method: "GET",
        request_uri: "/v20180820/accesspointforobjectlambda"
      )

      LIST_CALLER_ACCESS_GRANTS = OperationModel.new(
        name: "ListCallerAccessGrants",
        http_method: "GET",
        request_uri: "/v20180820/accessgrantsinstance/caller/grants"
      )

      LIST_JOBS = OperationModel.new(
        name: "ListJobs",
        http_method: "GET",
        request_uri: "/v20180820/jobs"
      )

      LIST_MULTI_REGION_ACCESS_POINTS = OperationModel.new(
        name: "ListMultiRegionAccessPoints",
        http_method: "GET",
        request_uri: "/v20180820/mrap/instances"
      )

      LIST_REGIONAL_BUCKETS = OperationModel.new(
        name: "ListRegionalBuckets",
        http_method: "GET",
        request_uri: "/v20180820/bucket"
      )

      LIST_STORAGE_LENS_CONFIGURATIONS = OperationModel.new(
        name: "ListStorageLensConfigurations",
        http_method: "GET",
        request_uri: "/v20180820/storagelens"
      )

      LIST_STORAGE_LENS_GROUPS = OperationModel.new(
        name: "ListStorageLensGroups",
        http_method: "GET",
        request_uri: "/v20180820/storagelensgroup"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/v20180820/tags/{resourceArn+}"
      )

      PUT_ACCESS_GRANTS_INSTANCE_RESOURCE_POLICY = OperationModel.new(
        name: "PutAccessGrantsInstanceResourcePolicy",
        http_method: "PUT",
        request_uri: "/v20180820/accessgrantsinstance/resourcepolicy"
      )

      PUT_ACCESS_POINT_CONFIGURATION_FOR_OBJECT_LAMBDA = OperationModel.new(
        name: "PutAccessPointConfigurationForObjectLambda",
        http_method: "PUT",
        request_uri: "/v20180820/accesspointforobjectlambda/{name}/configuration"
      )

      PUT_ACCESS_POINT_POLICY = OperationModel.new(
        name: "PutAccessPointPolicy",
        http_method: "PUT",
        request_uri: "/v20180820/accesspoint/{name}/policy"
      )

      PUT_ACCESS_POINT_POLICY_FOR_OBJECT_LAMBDA = OperationModel.new(
        name: "PutAccessPointPolicyForObjectLambda",
        http_method: "PUT",
        request_uri: "/v20180820/accesspointforobjectlambda/{name}/policy"
      )

      PUT_ACCESS_POINT_SCOPE = OperationModel.new(
        name: "PutAccessPointScope",
        http_method: "PUT",
        request_uri: "/v20180820/accesspoint/{name}/scope"
      )

      PUT_BUCKET_LIFECYCLE_CONFIGURATION = OperationModel.new(
        name: "PutBucketLifecycleConfiguration",
        http_method: "PUT",
        request_uri: "/v20180820/bucket/{name}/lifecycleconfiguration"
      )

      PUT_BUCKET_POLICY = OperationModel.new(
        name: "PutBucketPolicy",
        http_method: "PUT",
        request_uri: "/v20180820/bucket/{name}/policy"
      )

      PUT_BUCKET_REPLICATION = OperationModel.new(
        name: "PutBucketReplication",
        http_method: "PUT",
        request_uri: "/v20180820/bucket/{name}/replication"
      )

      PUT_BUCKET_TAGGING = OperationModel.new(
        name: "PutBucketTagging",
        http_method: "PUT",
        request_uri: "/v20180820/bucket/{name}/tagging"
      )

      PUT_BUCKET_VERSIONING = OperationModel.new(
        name: "PutBucketVersioning",
        http_method: "PUT",
        request_uri: "/v20180820/bucket/{name}/versioning"
      )

      PUT_JOB_TAGGING = OperationModel.new(
        name: "PutJobTagging",
        http_method: "PUT",
        request_uri: "/v20180820/jobs/{id}/tagging"
      )

      PUT_MULTI_REGION_ACCESS_POINT_POLICY = OperationModel.new(
        name: "PutMultiRegionAccessPointPolicy",
        http_method: "POST",
        request_uri: "/v20180820/async-requests/mrap/put-policy"
      )

      PUT_PUBLIC_ACCESS_BLOCK = OperationModel.new(
        name: "PutPublicAccessBlock",
        http_method: "PUT",
        request_uri: "/v20180820/configuration/publicAccessBlock"
      )

      PUT_STORAGE_LENS_CONFIGURATION = OperationModel.new(
        name: "PutStorageLensConfiguration",
        http_method: "PUT",
        request_uri: "/v20180820/storagelens/{storagelensid}"
      )

      PUT_STORAGE_LENS_CONFIGURATION_TAGGING = OperationModel.new(
        name: "PutStorageLensConfigurationTagging",
        http_method: "PUT",
        request_uri: "/v20180820/storagelens/{storagelensid}/tagging"
      )

      SUBMIT_MULTI_REGION_ACCESS_POINT_ROUTES = OperationModel.new(
        name: "SubmitMultiRegionAccessPointRoutes",
        http_method: "PATCH",
        request_uri: "/v20180820/mrap/instances/{mrap+}/routes"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/v20180820/tags/{resourceArn+}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/v20180820/tags/{resourceArn+}"
      )

      UPDATE_ACCESS_GRANTS_LOCATION = OperationModel.new(
        name: "UpdateAccessGrantsLocation",
        http_method: "PUT",
        request_uri: "/v20180820/accessgrantsinstance/location/{id}"
      )

      UPDATE_JOB_PRIORITY = OperationModel.new(
        name: "UpdateJobPriority",
        http_method: "POST",
        request_uri: "/v20180820/jobs/{id}/priority"
      )

      UPDATE_JOB_STATUS = OperationModel.new(
        name: "UpdateJobStatus",
        http_method: "POST",
        request_uri: "/v20180820/jobs/{id}/status"
      )

      UPDATE_STORAGE_LENS_GROUP = OperationModel.new(
        name: "UpdateStorageLensGroup",
        http_method: "PUT",
        request_uri: "/v20180820/storagelensgroup/{name}"
      )
    end
  end
end
