module Aws
  module Runtime
    USER_AGENT = "aws-sdk-crystal/#{Aws::VERSION}"

    def self.user_agent : String
      USER_AGENT
    end
  end
end
