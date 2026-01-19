module AwsSdk
  module Runtime
    module Partitions
      def self.path : String
        repo_root = File.expand_path("../../../../..", __DIR__)
        File.join(repo_root, "gems", "aws-partitions", "partitions.json")
      end

      def self.provider : PartitionProvider
        PartitionProvider.load(path)
      end
    end
  end
end
