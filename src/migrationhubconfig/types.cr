require "json"
require "time"

module Aws
  module MigrationHubConfig
    module Types

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateHomeRegionControlRequest
        include JSON::Serializable

        # The name of the home region of the calling account.

        @[JSON::Field(key: "HomeRegion")]
        getter home_region : String

        # The account for which this command sets up a home region control. The Target is always of type
        # ACCOUNT .

        @[JSON::Field(key: "Target")]
        getter target : Types::Target

        # Optional Boolean flag to indicate whether any effect should take place. It tests whether the caller
        # has permission to make the call.

        @[JSON::Field(key: "DryRun")]
        getter dry_run : Bool?

        def initialize(
          @home_region : String,
          @target : Types::Target,
          @dry_run : Bool? = nil
        )
        end
      end


      struct CreateHomeRegionControlResult
        include JSON::Serializable

        # This object is the HomeRegionControl object that's returned by a successful call to
        # CreateHomeRegionControl .

        @[JSON::Field(key: "HomeRegionControl")]
        getter home_region_control : Types::HomeRegionControl?

        def initialize(
          @home_region_control : Types::HomeRegionControl? = nil
        )
        end
      end


      struct DeleteHomeRegionControlRequest
        include JSON::Serializable

        # A unique identifier that's generated for each home region control. It's always a string that begins
        # with "hrc-" followed by 12 lowercase letters and numbers.

        @[JSON::Field(key: "ControlId")]
        getter control_id : String

        def initialize(
          @control_id : String
        )
        end
      end


      struct DeleteHomeRegionControlResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeHomeRegionControlsRequest
        include JSON::Serializable

        # The ControlID is a unique identifier string of your HomeRegionControl object.

        @[JSON::Field(key: "ControlId")]
        getter control_id : String?

        # The name of the home region you'd like to view.

        @[JSON::Field(key: "HomeRegion")]
        getter home_region : String?

        # The maximum number of filtering results to display per page.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If a NextToken was returned by a previous call, more results are available. To retrieve the next
        # page of results, make the call again using the returned token in NextToken .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The target parameter specifies the identifier to which the home region is applied, which is always
        # of type ACCOUNT . It applies the home region to the current ACCOUNT .

        @[JSON::Field(key: "Target")]
        getter target : Types::Target?

        def initialize(
          @control_id : String? = nil,
          @home_region : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @target : Types::Target? = nil
        )
        end
      end


      struct DescribeHomeRegionControlsResult
        include JSON::Serializable

        # An array that contains your HomeRegionControl objects.

        @[JSON::Field(key: "HomeRegionControls")]
        getter home_region_controls : Array(Types::HomeRegionControl)?

        # If a NextToken was returned by a previous call, more results are available. To retrieve the next
        # page of results, make the call again using the returned token in NextToken .

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @home_region_controls : Array(Types::HomeRegionControl)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Exception raised to indicate that authorization of an action was successful, when the DryRun flag is
      # set to true.

      struct DryRunOperation
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetHomeRegionRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetHomeRegionResult
        include JSON::Serializable

        # The name of the home region of the calling account.

        @[JSON::Field(key: "HomeRegion")]
        getter home_region : String?

        def initialize(
          @home_region : String? = nil
        )
        end
      end

      # A home region control is an object that specifies the home region for an account, with some
      # additional information. It contains a target (always of type ACCOUNT ), an ID, and a time at which
      # the home region was set.

      struct HomeRegionControl
        include JSON::Serializable

        # A unique identifier that's generated for each home region control. It's always a string that begins
        # with "hrc-" followed by 12 lowercase letters and numbers.

        @[JSON::Field(key: "ControlId")]
        getter control_id : String?

        # The AWS Region that's been set as home region. For example, "us-west-2" or "eu-central-1" are valid
        # home regions.

        @[JSON::Field(key: "HomeRegion")]
        getter home_region : String?

        # A timestamp representing the time when the customer called CreateHomeregionControl and set the home
        # region for the account.

        @[JSON::Field(key: "RequestedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter requested_time : Time?

        # The target parameter specifies the identifier to which the home region is applied, which is always
        # an ACCOUNT . It applies the home region to the current ACCOUNT .

        @[JSON::Field(key: "Target")]
        getter target : Types::Target?

        def initialize(
          @control_id : String? = nil,
          @home_region : String? = nil,
          @requested_time : Time? = nil,
          @target : Types::Target? = nil
        )
        end
      end

      # Exception raised when an internal, configuration, or dependency error is encountered.

      struct InternalServerError
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Exception raised when the provided input violates a policy constraint or is entered in the wrong
      # format or data type.

      struct InvalidInputException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Exception raised when a request fails due to temporary unavailability of the service.

      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The target parameter specifies the identifier to which the home region is applied, which is always
      # an ACCOUNT . It applies the home region to the current ACCOUNT .

      struct Target
        include JSON::Serializable

        # The target type is always an ACCOUNT .

        @[JSON::Field(key: "Type")]
        getter type : String

        # The TargetID is a 12-character identifier of the ACCOUNT for which the control was created. (This
        # must be the current account.)

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @type : String,
          @id : String? = nil
        )
        end
      end

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The number of seconds the caller should wait before retrying.

        @[JSON::Field(key: "RetryAfterSeconds")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end
    end
  end
end
