module Aws
  module Runtime
    module Imds
      DEFAULT_TIMEOUT = 1.second
      DEFAULT_NUM_ATTEMPTS = 1
      DISABLE_ENV = "AWS_EC2_METADATA_DISABLED"
      TIMEOUT_ENV = "AWS_EC2_METADATA_SERVICE_TIMEOUT"
      ATTEMPTS_ENV = "AWS_EC2_METADATA_SERVICE_NUM_ATTEMPTS"

      def self.disabled? : Bool
        ENV[DISABLE_ENV]?.to_s.downcase == "true"
      end

      def self.timeout : Time::Span
        raw = ENV[TIMEOUT_ENV]?
        return DEFAULT_TIMEOUT unless raw
        seconds = raw.to_f?
        return DEFAULT_TIMEOUT unless seconds && seconds > 0
        seconds.seconds
      end

      def self.num_attempts : Int32
        raw = ENV[ATTEMPTS_ENV]?
        return DEFAULT_NUM_ATTEMPTS unless raw
        value = raw.to_i?
        return DEFAULT_NUM_ATTEMPTS unless value && value > 0
        value
      end

      def self.attempt(attempts : Int32, & : -> T) : T? forall T
        attempts.times do
          begin
            return yield
          rescue
            # swallow; try again until attempts exhausted
          end
        end
        nil
      end
    end
  end
end
