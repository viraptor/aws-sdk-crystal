module Aws
  module Runtime
    module Partitions
      def self.provider : PartitionProvider
        PartitionProvider.default
      end
    end
  end
end
