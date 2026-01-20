module AwsSdk
  module EC2InstanceConnect
    module Errors
      class ServiceError < Exception
      end

      # Either your AWS credentials are not valid or you do not have access to the EC2 instance.

      class AuthException < ServiceError
      end

      # The specified instance was not found.

      class EC2InstanceNotFoundException < ServiceError
      end

      # Unable to connect because the instance is not in a valid state. Connecting to a stopped or
      # terminated instance is not supported. If the instance is stopped, start your instance, and try to
      # connect again.

      class EC2InstanceStateInvalidException < ServiceError
      end

      # The instance type is not supported for connecting via the serial console. Only Nitro instance types
      # are currently supported.

      class EC2InstanceTypeInvalidException < ServiceError
      end

      # The instance is currently unavailable. Wait a few minutes and try again.

      class EC2InstanceUnavailableException < ServiceError
      end

      # One of the parameters is not valid.

      class InvalidArgsException < ServiceError
      end

      # Your account is not authorized to use the EC2 Serial Console. To authorize your account, run the
      # EnableSerialConsoleAccess API. For more information, see EnableSerialConsoleAccess in the Amazon EC2
      # API Reference .

      class SerialConsoleAccessDisabledException < ServiceError
      end

      # The instance currently has 1 active serial console session. Only 1 session is supported at a time.

      class SerialConsoleSessionLimitExceededException < ServiceError
      end

      # Unable to start a serial console session. Please try again.

      class SerialConsoleSessionUnavailableException < ServiceError
      end

      # Your instance's BIOS version is unsupported for serial console connection. Reboot your instance to
      # update its BIOS, and then try again to connect.

      class SerialConsoleSessionUnsupportedException < ServiceError
      end

      # The service encountered an error. Follow the instructions in the error message and try again.

      class ServiceException < ServiceError
      end

      # The requests were made too frequently and have been throttled. Wait a while and try again. To
      # increase the limit on your request frequency, contact AWS Support.

      class ThrottlingException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AuthException"
          AuthException.new(message)
        when "EC2InstanceNotFoundException"
          EC2InstanceNotFoundException.new(message)
        when "EC2InstanceStateInvalidException"
          EC2InstanceStateInvalidException.new(message)
        when "EC2InstanceTypeInvalidException"
          EC2InstanceTypeInvalidException.new(message)
        when "EC2InstanceUnavailableException"
          EC2InstanceUnavailableException.new(message)
        when "InvalidArgsException"
          InvalidArgsException.new(message)
        when "SerialConsoleAccessDisabledException"
          SerialConsoleAccessDisabledException.new(message)
        when "SerialConsoleSessionLimitExceededException"
          SerialConsoleSessionLimitExceededException.new(message)
        when "SerialConsoleSessionUnavailableException"
          SerialConsoleSessionUnavailableException.new(message)
        when "SerialConsoleSessionUnsupportedException"
          SerialConsoleSessionUnsupportedException.new(message)
        when "ServiceException"
          ServiceException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
