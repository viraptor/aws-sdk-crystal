require "json"
require "time"

module AwsSdk
  module IotDeviceAdvisor
    module Types

      # Sends a Conflict Exception.

      struct ConflictException
        include JSON::Serializable

        # Sends a Conflict Exception message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateSuiteDefinitionRequest
        include JSON::Serializable

        # Creates a Device Advisor test suite with suite definition configuration.

        @[JSON::Field(key: "suiteDefinitionConfiguration")]
        getter suite_definition_configuration : Types::SuiteDefinitionConfiguration

        # The client token for the test suite definition creation. This token is used for tracking test suite
        # definition creation using retries and obtaining its status. This parameter is optional.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The tags to be attached to the suite definition.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @suite_definition_configuration : Types::SuiteDefinitionConfiguration,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSuiteDefinitionResponse
        include JSON::Serializable

        # The timestamp of when the test suite was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon Resource Name (ARN) of the test suite.

        @[JSON::Field(key: "suiteDefinitionArn")]
        getter suite_definition_arn : String?

        # The UUID of the test suite created.

        @[JSON::Field(key: "suiteDefinitionId")]
        getter suite_definition_id : String?

        # The suite definition name of the test suite. This is a required parameter.

        @[JSON::Field(key: "suiteDefinitionName")]
        getter suite_definition_name : String?

        def initialize(
          @created_at : Time? = nil,
          @suite_definition_arn : String? = nil,
          @suite_definition_id : String? = nil,
          @suite_definition_name : String? = nil
        )
        end
      end


      struct DeleteSuiteDefinitionRequest
        include JSON::Serializable

        # Suite definition ID of the test suite to be deleted.

        @[JSON::Field(key: "suiteDefinitionId")]
        getter suite_definition_id : String

        def initialize(
          @suite_definition_id : String
        )
        end
      end


      struct DeleteSuiteDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Information of a test device. A thing ARN, certificate ARN or device role ARN is required.

      struct DeviceUnderTest
        include JSON::Serializable

        # Lists device's certificate ARN.

        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # Lists device's role ARN.

        @[JSON::Field(key: "deviceRoleArn")]
        getter device_role_arn : String?

        # Lists device's thing ARN.

        @[JSON::Field(key: "thingArn")]
        getter thing_arn : String?

        def initialize(
          @certificate_arn : String? = nil,
          @device_role_arn : String? = nil,
          @thing_arn : String? = nil
        )
        end
      end


      struct GetEndpointRequest
        include JSON::Serializable

        # The authentication method used during the device connection.

        @[JSON::Field(key: "authenticationMethod")]
        getter authentication_method : String?

        # The certificate ARN of the device. This is an optional parameter.

        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The device role ARN of the device. This is an optional parameter.

        @[JSON::Field(key: "deviceRoleArn")]
        getter device_role_arn : String?

        # The thing ARN of the device. This is an optional parameter.

        @[JSON::Field(key: "thingArn")]
        getter thing_arn : String?

        def initialize(
          @authentication_method : String? = nil,
          @certificate_arn : String? = nil,
          @device_role_arn : String? = nil,
          @thing_arn : String? = nil
        )
        end
      end


      struct GetEndpointResponse
        include JSON::Serializable

        # The response of an Device Advisor endpoint.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        def initialize(
          @endpoint : String? = nil
        )
        end
      end


      struct GetSuiteDefinitionRequest
        include JSON::Serializable

        # Suite definition ID of the test suite to get.

        @[JSON::Field(key: "suiteDefinitionId")]
        getter suite_definition_id : String

        # Suite definition version of the test suite to get.

        @[JSON::Field(key: "suiteDefinitionVersion")]
        getter suite_definition_version : String?

        def initialize(
          @suite_definition_id : String,
          @suite_definition_version : String? = nil
        )
        end
      end


      struct GetSuiteDefinitionResponse
        include JSON::Serializable

        # Date (in Unix epoch time) when the suite definition was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Date (in Unix epoch time) when the suite definition was last modified.

        @[JSON::Field(key: "lastModifiedAt")]
        getter last_modified_at : Time?

        # Latest suite definition version of the suite definition.

        @[JSON::Field(key: "latestVersion")]
        getter latest_version : String?

        # The ARN of the suite definition.

        @[JSON::Field(key: "suiteDefinitionArn")]
        getter suite_definition_arn : String?

        # Suite configuration of the suite definition.

        @[JSON::Field(key: "suiteDefinitionConfiguration")]
        getter suite_definition_configuration : Types::SuiteDefinitionConfiguration?

        # Suite definition ID of the suite definition.

        @[JSON::Field(key: "suiteDefinitionId")]
        getter suite_definition_id : String?

        # Suite definition version of the suite definition.

        @[JSON::Field(key: "suiteDefinitionVersion")]
        getter suite_definition_version : String?

        # Tags attached to the suite definition.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time? = nil,
          @last_modified_at : Time? = nil,
          @latest_version : String? = nil,
          @suite_definition_arn : String? = nil,
          @suite_definition_configuration : Types::SuiteDefinitionConfiguration? = nil,
          @suite_definition_id : String? = nil,
          @suite_definition_version : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetSuiteRunReportRequest
        include JSON::Serializable

        # Suite definition ID of the test suite.

        @[JSON::Field(key: "suiteDefinitionId")]
        getter suite_definition_id : String

        # Suite run ID of the test suite run.

        @[JSON::Field(key: "suiteRunId")]
        getter suite_run_id : String

        def initialize(
          @suite_definition_id : String,
          @suite_run_id : String
        )
        end
      end


      struct GetSuiteRunReportResponse
        include JSON::Serializable

        # Download URL of the qualification report.

        @[JSON::Field(key: "qualificationReportDownloadUrl")]
        getter qualification_report_download_url : String?

        def initialize(
          @qualification_report_download_url : String? = nil
        )
        end
      end


      struct GetSuiteRunRequest
        include JSON::Serializable

        # Suite definition ID for the test suite run.

        @[JSON::Field(key: "suiteDefinitionId")]
        getter suite_definition_id : String

        # Suite run ID for the test suite run.

        @[JSON::Field(key: "suiteRunId")]
        getter suite_run_id : String

        def initialize(
          @suite_definition_id : String,
          @suite_run_id : String
        )
        end
      end


      struct GetSuiteRunResponse
        include JSON::Serializable

        # Date (in Unix epoch time) when the test suite run ended.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # Error reason for any test suite run failure.

        @[JSON::Field(key: "errorReason")]
        getter error_reason : String?

        # Date (in Unix epoch time) when the test suite run started.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # Status for the test suite run.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Suite definition ID for the test suite run.

        @[JSON::Field(key: "suiteDefinitionId")]
        getter suite_definition_id : String?

        # Suite definition version for the test suite run.

        @[JSON::Field(key: "suiteDefinitionVersion")]
        getter suite_definition_version : String?

        # The ARN of the suite run.

        @[JSON::Field(key: "suiteRunArn")]
        getter suite_run_arn : String?

        # Suite run configuration for the test suite run.

        @[JSON::Field(key: "suiteRunConfiguration")]
        getter suite_run_configuration : Types::SuiteRunConfiguration?

        # Suite run ID for the test suite run.

        @[JSON::Field(key: "suiteRunId")]
        getter suite_run_id : String?

        # The tags attached to the suite run.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Test results for the test suite run.

        @[JSON::Field(key: "testResult")]
        getter test_result : Types::TestResult?

        def initialize(
          @end_time : Time? = nil,
          @error_reason : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @suite_definition_id : String? = nil,
          @suite_definition_version : String? = nil,
          @suite_run_arn : String? = nil,
          @suite_run_configuration : Types::SuiteRunConfiguration? = nil,
          @suite_run_id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @test_result : Types::TestResult? = nil
        )
        end
      end

      # Show Group Result.

      struct GroupResult
        include JSON::Serializable

        # Group result ID.

        @[JSON::Field(key: "groupId")]
        getter group_id : String?

        # Group Result Name.

        @[JSON::Field(key: "groupName")]
        getter group_name : String?

        # Tests under Group Result.

        @[JSON::Field(key: "tests")]
        getter tests : Array(Types::TestCaseRun)?

        def initialize(
          @group_id : String? = nil,
          @group_name : String? = nil,
          @tests : Array(Types::TestCaseRun)? = nil
        )
        end
      end

      # Sends an Internal Failure exception.

      struct InternalServerException
        include JSON::Serializable

        # Sends an Internal Failure Exception message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListSuiteDefinitionsRequest
        include JSON::Serializable

        # The maximum number of results to return at once.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token used to get the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSuiteDefinitionsResponse
        include JSON::Serializable

        # A token used to get the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that provide summaries of information about the suite definitions in the list.

        @[JSON::Field(key: "suiteDefinitionInformationList")]
        getter suite_definition_information_list : Array(Types::SuiteDefinitionInformation)?

        def initialize(
          @next_token : String? = nil,
          @suite_definition_information_list : Array(Types::SuiteDefinitionInformation)? = nil
        )
        end
      end


      struct ListSuiteRunsRequest
        include JSON::Serializable

        # The maximum number of results to return at once.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Lists the test suite runs of the specified test suite based on suite definition ID.

        @[JSON::Field(key: "suiteDefinitionId")]
        getter suite_definition_id : String?

        # Must be passed along with suiteDefinitionId . Lists the test suite runs of the specified test suite
        # based on suite definition version.

        @[JSON::Field(key: "suiteDefinitionVersion")]
        getter suite_definition_version : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @suite_definition_id : String? = nil,
          @suite_definition_version : String? = nil
        )
        end
      end


      struct ListSuiteRunsResponse
        include JSON::Serializable

        # A token to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of objects that provide summaries of information about the suite runs in the list.

        @[JSON::Field(key: "suiteRunsList")]
        getter suite_runs_list : Array(Types::SuiteRunInformation)?

        def initialize(
          @next_token : String? = nil,
          @suite_runs_list : Array(Types::SuiteRunInformation)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The resource ARN of the IoT Device Advisor resource. This can be SuiteDefinition ARN or SuiteRun
        # ARN.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags attached to the IoT Device Advisor resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Sends a Resource Not Found exception.

      struct ResourceNotFoundException
        include JSON::Serializable

        # Sends a Resource Not Found Exception message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct StartSuiteRunRequest
        include JSON::Serializable

        # Suite definition ID of the test suite.

        @[JSON::Field(key: "suiteDefinitionId")]
        getter suite_definition_id : String

        # Suite run configuration.

        @[JSON::Field(key: "suiteRunConfiguration")]
        getter suite_run_configuration : Types::SuiteRunConfiguration

        # Suite definition version of the test suite.

        @[JSON::Field(key: "suiteDefinitionVersion")]
        getter suite_definition_version : String?

        # The tags to be attached to the suite run.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @suite_definition_id : String,
          @suite_run_configuration : Types::SuiteRunConfiguration,
          @suite_definition_version : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartSuiteRunResponse
        include JSON::Serializable

        # Starts a Device Advisor test suite run based on suite create time.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The response of an Device Advisor test endpoint.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # Amazon Resource Name (ARN) of the started suite run.

        @[JSON::Field(key: "suiteRunArn")]
        getter suite_run_arn : String?

        # Suite Run ID of the started suite run.

        @[JSON::Field(key: "suiteRunId")]
        getter suite_run_id : String?

        def initialize(
          @created_at : Time? = nil,
          @endpoint : String? = nil,
          @suite_run_arn : String? = nil,
          @suite_run_id : String? = nil
        )
        end
      end


      struct StopSuiteRunRequest
        include JSON::Serializable

        # Suite definition ID of the test suite run to be stopped.

        @[JSON::Field(key: "suiteDefinitionId")]
        getter suite_definition_id : String

        # Suite run ID of the test suite run to be stopped.

        @[JSON::Field(key: "suiteRunId")]
        getter suite_run_id : String

        def initialize(
          @suite_definition_id : String,
          @suite_run_id : String
        )
        end
      end


      struct StopSuiteRunResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Gets the suite definition configuration.

      struct SuiteDefinitionConfiguration
        include JSON::Serializable

        # Gets the device permission ARN. This is a required parameter.

        @[JSON::Field(key: "devicePermissionRoleArn")]
        getter device_permission_role_arn : String

        # Gets the test suite root group. This is a required parameter. For updating or creating the latest
        # qualification suite, if intendedForQualification is set to true, rootGroup can be an empty string.
        # If intendedForQualification is false, rootGroup cannot be an empty string. If rootGroup is empty,
        # and intendedForQualification is set to true, all the qualification tests are included, and the
        # configuration is default. For a qualification suite, the minimum length is 0, and the maximum is
        # 2048. For a non-qualification suite, the minimum length is 1, and the maximum is 2048.

        @[JSON::Field(key: "rootGroup")]
        getter root_group : String

        # Gets the suite definition name. This is a required parameter.

        @[JSON::Field(key: "suiteDefinitionName")]
        getter suite_definition_name : String

        # Gets the devices configured.

        @[JSON::Field(key: "devices")]
        getter devices : Array(Types::DeviceUnderTest)?

        # Gets the tests intended for qualification in a suite.

        @[JSON::Field(key: "intendedForQualification")]
        getter intended_for_qualification : Bool?

        # Verifies if the test suite is a long duration test.

        @[JSON::Field(key: "isLongDurationTest")]
        getter is_long_duration_test : Bool?

        # Sets the MQTT protocol that is configured in the suite definition.

        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        def initialize(
          @device_permission_role_arn : String,
          @root_group : String,
          @suite_definition_name : String,
          @devices : Array(Types::DeviceUnderTest)? = nil,
          @intended_for_qualification : Bool? = nil,
          @is_long_duration_test : Bool? = nil,
          @protocol : String? = nil
        )
        end
      end

      # Information about the suite definition.

      struct SuiteDefinitionInformation
        include JSON::Serializable

        # Date (in Unix epoch time) when the test suite was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Specifies the devices that are under test for the test suite.

        @[JSON::Field(key: "defaultDevices")]
        getter default_devices : Array(Types::DeviceUnderTest)?

        # Specifies if the test suite is intended for qualification.

        @[JSON::Field(key: "intendedForQualification")]
        getter intended_for_qualification : Bool?

        # Verifies if the test suite is a long duration test.

        @[JSON::Field(key: "isLongDurationTest")]
        getter is_long_duration_test : Bool?

        # Gets the MQTT protocol that is configured in the suite definition.

        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # Suite definition ID of the test suite.

        @[JSON::Field(key: "suiteDefinitionId")]
        getter suite_definition_id : String?

        # Suite name of the test suite.

        @[JSON::Field(key: "suiteDefinitionName")]
        getter suite_definition_name : String?

        def initialize(
          @created_at : Time? = nil,
          @default_devices : Array(Types::DeviceUnderTest)? = nil,
          @intended_for_qualification : Bool? = nil,
          @is_long_duration_test : Bool? = nil,
          @protocol : String? = nil,
          @suite_definition_id : String? = nil,
          @suite_definition_name : String? = nil
        )
        end
      end

      # Gets suite run configuration.

      struct SuiteRunConfiguration
        include JSON::Serializable

        # Sets the primary device for the test suite run. This requires a thing ARN or a certificate ARN.

        @[JSON::Field(key: "primaryDevice")]
        getter primary_device : Types::DeviceUnderTest

        # TRUE if multiple test suites run in parallel.

        @[JSON::Field(key: "parallelRun")]
        getter parallel_run : Bool?

        # Sets test case list.

        @[JSON::Field(key: "selectedTestList")]
        getter selected_test_list : Array(String)?

        def initialize(
          @primary_device : Types::DeviceUnderTest,
          @parallel_run : Bool? = nil,
          @selected_test_list : Array(String)? = nil
        )
        end
      end

      # Information about the suite run. Requires permission to access the SuiteRunInformation action.

      struct SuiteRunInformation
        include JSON::Serializable

        # Date (in Unix epoch time) when the suite run was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Date (in Unix epoch time) when the suite run ended.

        @[JSON::Field(key: "endAt")]
        getter end_at : Time?

        # Number of test cases that failed in the suite run.

        @[JSON::Field(key: "failed")]
        getter failed : Int32?

        # Number of test cases that passed in the suite run.

        @[JSON::Field(key: "passed")]
        getter passed : Int32?

        # Date (in Unix epoch time) when the suite run was started.

        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # Status of the suite run.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Suite definition ID of the suite run.

        @[JSON::Field(key: "suiteDefinitionId")]
        getter suite_definition_id : String?

        # Suite definition name of the suite run.

        @[JSON::Field(key: "suiteDefinitionName")]
        getter suite_definition_name : String?

        # Suite definition version of the suite run.

        @[JSON::Field(key: "suiteDefinitionVersion")]
        getter suite_definition_version : String?

        # Suite run ID of the suite run.

        @[JSON::Field(key: "suiteRunId")]
        getter suite_run_id : String?

        def initialize(
          @created_at : Time? = nil,
          @end_at : Time? = nil,
          @failed : Int32? = nil,
          @passed : Int32? = nil,
          @started_at : Time? = nil,
          @status : String? = nil,
          @suite_definition_id : String? = nil,
          @suite_definition_name : String? = nil,
          @suite_definition_version : String? = nil,
          @suite_run_id : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The resource ARN of an IoT Device Advisor resource. This can be SuiteDefinition ARN or SuiteRun ARN.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags to be attached to the IoT Device Advisor resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Provides the test case run.

      struct TestCaseRun
        include JSON::Serializable

        # Provides test case run end time.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # Provides test case run failure result.

        @[JSON::Field(key: "failure")]
        getter failure : String?

        # Provides test case run log URL.

        @[JSON::Field(key: "logUrl")]
        getter log_url : String?

        # Provides test case run start time.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # Provides the test case run status. Status is one of the following: PASS : Test passed. FAIL : Test
        # failed. PENDING : Test has not started running but is scheduled. RUNNING : Test is running. STOPPING
        # : Test is performing cleanup steps. You will see this status only if you stop a suite run. STOPPED
        # Test is stopped. You will see this status only if you stop a suite run. PASS_WITH_WARNINGS : Test
        # passed with warnings. ERORR : Test faced an error when running due to an internal issue.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Provides the test case run definition ID.

        @[JSON::Field(key: "testCaseDefinitionId")]
        getter test_case_definition_id : String?

        # Provides the test case run definition name.

        @[JSON::Field(key: "testCaseDefinitionName")]
        getter test_case_definition_name : String?

        # Provides the test case run ID.

        @[JSON::Field(key: "testCaseRunId")]
        getter test_case_run_id : String?

        # Provides the test scenarios for the test case run.

        @[JSON::Field(key: "testScenarios")]
        getter test_scenarios : Array(Types::TestCaseScenario)?

        # Provides test case run warnings.

        @[JSON::Field(key: "warnings")]
        getter warnings : String?

        def initialize(
          @end_time : Time? = nil,
          @failure : String? = nil,
          @log_url : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @test_case_definition_id : String? = nil,
          @test_case_definition_name : String? = nil,
          @test_case_run_id : String? = nil,
          @test_scenarios : Array(Types::TestCaseScenario)? = nil,
          @warnings : String? = nil
        )
        end
      end

      # Provides test case scenario.

      struct TestCaseScenario
        include JSON::Serializable

        # Provides test case scenario failure result.

        @[JSON::Field(key: "failure")]
        getter failure : String?

        # Provides the test case scenario status. Status is one of the following: PASS : Test passed. FAIL :
        # Test failed. PENDING : Test has not started running but is scheduled. RUNNING : Test is running.
        # STOPPING : Test is performing cleanup steps. You will see this status only if you stop a suite run.
        # STOPPED Test is stopped. You will see this status only if you stop a suite run. PASS_WITH_WARNINGS :
        # Test passed with warnings. ERORR : Test faced an error when running due to an internal issue.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Provides test case scenario system messages if any.

        @[JSON::Field(key: "systemMessage")]
        getter system_message : String?

        # Provides test case scenario ID.

        @[JSON::Field(key: "testCaseScenarioId")]
        getter test_case_scenario_id : String?

        # Provides test case scenario type. Type is one of the following: Advanced Basic

        @[JSON::Field(key: "testCaseScenarioType")]
        getter test_case_scenario_type : String?

        def initialize(
          @failure : String? = nil,
          @status : String? = nil,
          @system_message : String? = nil,
          @test_case_scenario_id : String? = nil,
          @test_case_scenario_type : String? = nil
        )
        end
      end

      # Show each group result.

      struct TestResult
        include JSON::Serializable

        # Show each group of test results.

        @[JSON::Field(key: "groups")]
        getter groups : Array(Types::GroupResult)?

        def initialize(
          @groups : Array(Types::GroupResult)? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The resource ARN of an IoT Device Advisor resource. This can be SuiteDefinition ARN or SuiteRun ARN.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # List of tag keys to remove from the IoT Device Advisor resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateSuiteDefinitionRequest
        include JSON::Serializable

        # Updates a Device Advisor test suite with suite definition configuration.

        @[JSON::Field(key: "suiteDefinitionConfiguration")]
        getter suite_definition_configuration : Types::SuiteDefinitionConfiguration

        # Suite definition ID of the test suite to be updated.

        @[JSON::Field(key: "suiteDefinitionId")]
        getter suite_definition_id : String

        def initialize(
          @suite_definition_configuration : Types::SuiteDefinitionConfiguration,
          @suite_definition_id : String
        )
        end
      end


      struct UpdateSuiteDefinitionResponse
        include JSON::Serializable

        # Timestamp of when the test suite was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Timestamp of when the test suite was updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time?

        # Amazon Resource Name (ARN) of the updated test suite.

        @[JSON::Field(key: "suiteDefinitionArn")]
        getter suite_definition_arn : String?

        # Suite definition ID of the updated test suite.

        @[JSON::Field(key: "suiteDefinitionId")]
        getter suite_definition_id : String?

        # Updates the suite definition name. This is a required parameter.

        @[JSON::Field(key: "suiteDefinitionName")]
        getter suite_definition_name : String?

        # Suite definition version of the updated test suite.

        @[JSON::Field(key: "suiteDefinitionVersion")]
        getter suite_definition_version : String?

        def initialize(
          @created_at : Time? = nil,
          @last_updated_at : Time? = nil,
          @suite_definition_arn : String? = nil,
          @suite_definition_id : String? = nil,
          @suite_definition_name : String? = nil,
          @suite_definition_version : String? = nil
        )
        end
      end

      # Sends a validation exception.

      struct ValidationException
        include JSON::Serializable

        # Sends a Validation Exception message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
