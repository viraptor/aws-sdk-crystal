require "json"

module AwsSdk
  module EC2InstanceConnect
    module Types

      # Either your AWS credentials are not valid or you do not have access to the EC2 instance.

      struct AuthException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified instance was not found.

      struct EC2InstanceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Unable to connect because the instance is not in a valid state. Connecting to a stopped or
      # terminated instance is not supported. If the instance is stopped, start your instance, and try to
      # connect again.

      struct EC2InstanceStateInvalidException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The instance type is not supported for connecting via the serial console. Only Nitro instance types
      # are currently supported.

      struct EC2InstanceTypeInvalidException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The instance is currently unavailable. Wait a few minutes and try again.

      struct EC2InstanceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One of the parameters is not valid.

      struct InvalidArgsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct SendSSHPublicKeyRequest
        include JSON::Serializable

        # The ID of the EC2 instance.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # The OS user on the EC2 instance for whom the key can be used to authenticate.

        @[JSON::Field(key: "InstanceOSUser")]
        getter instance_os_user : String

        # The public key material. To use the public key, you must have the matching private key.

        @[JSON::Field(key: "SSHPublicKey")]
        getter ssh_public_key : String

        # The Availability Zone in which the EC2 instance was launched.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        def initialize(
          @instance_id : String,
          @instance_os_user : String,
          @ssh_public_key : String,
          @availability_zone : String? = nil
        )
        end
      end


      struct SendSSHPublicKeyResponse
        include JSON::Serializable

        # The ID of the request. Please provide this ID when contacting AWS Support for assistance.

        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # Is true if the request succeeds and an error otherwise.

        @[JSON::Field(key: "Success")]
        getter success : Bool?

        def initialize(
          @request_id : String? = nil,
          @success : Bool? = nil
        )
        end
      end


      struct SendSerialConsoleSSHPublicKeyRequest
        include JSON::Serializable

        # The ID of the EC2 instance.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String

        # The public key material. To use the public key, you must have the matching private key. For
        # information about the supported key formats and lengths, see Requirements for key pairs in the
        # Amazon EC2 User Guide .

        @[JSON::Field(key: "SSHPublicKey")]
        getter ssh_public_key : String

        # The serial port of the EC2 instance. Currently only port 0 is supported. Default: 0

        @[JSON::Field(key: "SerialPort")]
        getter serial_port : Int32?

        def initialize(
          @instance_id : String,
          @ssh_public_key : String,
          @serial_port : Int32? = nil
        )
        end
      end


      struct SendSerialConsoleSSHPublicKeyResponse
        include JSON::Serializable

        # The ID of the request. Please provide this ID when contacting AWS Support for assistance.

        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # Is true if the request succeeds and an error otherwise.

        @[JSON::Field(key: "Success")]
        getter success : Bool?

        def initialize(
          @request_id : String? = nil,
          @success : Bool? = nil
        )
        end
      end

      # Your account is not authorized to use the EC2 Serial Console. To authorize your account, run the
      # EnableSerialConsoleAccess API. For more information, see EnableSerialConsoleAccess in the Amazon EC2
      # API Reference .

      struct SerialConsoleAccessDisabledException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The instance currently has 1 active serial console session. Only 1 session is supported at a time.

      struct SerialConsoleSessionLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Unable to start a serial console session. Please try again.

      struct SerialConsoleSessionUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your instance's BIOS version is unsupported for serial console connection. Reboot your instance to
      # update its BIOS, and then try again to connect.

      struct SerialConsoleSessionUnsupportedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The service encountered an error. Follow the instructions in the error message and try again.

      struct ServiceException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The requests were made too frequently and have been throttled. Wait a while and try again. To
      # increase the limit on your request frequency, contact AWS Support.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
