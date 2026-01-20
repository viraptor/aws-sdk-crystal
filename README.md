# aws-sdk-crystal

An unofficial set of AWS SDK modules in Crystal. They're generated from the
same set of API descriptions as the official [aws-sdk-ruby](https://github.com/aws/aws-sdk-ruby/).

The goal is to provide a programming API as close to the Ruby one as possible.
Ideally with the same behaviour. The internals may vary (for example Seahorse
is not ported).

## Currently still missing

- protocol `smithy-rpc-v2-cbor` (arc-region-switch, monitoring)
- protocol `ec2` (ec2)
- timeouts
- plugins used in some Ruby SDKs

Since the code is generated from spec, all the other modules should "just
work". It has not been widely tested yet or ran into enough edge cases.

## Example use

For most use cases, the code should look the same as the Ruby equivalent.

```
require "aws_sdk/sts"
require "json"

client = Aws::STS::Client.new
puts client.get_caller_identity.to_json
```

## Code development

The development of the SDK generator relies on AI generation and has been based
on the structure of aws-sdk-ruby.

The api definitions can be updated by copying the api json files from https://github.com/aws/aws-sdk-ruby/tree/version-3/apis

The `main` branch contains only the generator. The `main-generated` branch
contains all the generated service interfaces ready for release.
