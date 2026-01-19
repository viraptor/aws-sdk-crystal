require "json"
require "time"

module AwsSdk
  module CodeGuruSecurity
    module Types

      # You do not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        # The identifier for the error.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # Description of the error.
        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier for the resource you don't have access to.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of resource you don't have access to.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @error_code : String,
          @message : String,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # A summary of findings metrics for an account on a specified date.
      struct AccountFindingsMetric
        include JSON::Serializable

        # The number of closed findings of each severity on the specified date.
        @[JSON::Field(key: "closedFindings")]
        getter closed_findings : Types::FindingMetricsValuePerSeverity?

        # The date from which the findings metrics were retrieved.
        @[JSON::Field(key: "date")]
        getter date : Time?

        # The average time in days it takes to close findings of each severity as of a specified date.
        @[JSON::Field(key: "meanTimeToClose")]
        getter mean_time_to_close : Types::FindingMetricsValuePerSeverity?

        # The number of new findings of each severity on the specified date.
        @[JSON::Field(key: "newFindings")]
        getter new_findings : Types::FindingMetricsValuePerSeverity?

        # The number of open findings of each severity as of the specified date.
        @[JSON::Field(key: "openFindings")]
        getter open_findings : Types::FindingMetricsValuePerSeverity?

        def initialize(
          @closed_findings : Types::FindingMetricsValuePerSeverity? = nil,
          @date : Time? = nil,
          @mean_time_to_close : Types::FindingMetricsValuePerSeverity? = nil,
          @new_findings : Types::FindingMetricsValuePerSeverity? = nil,
          @open_findings : Types::FindingMetricsValuePerSeverity? = nil
        )
        end
      end

      # Contains information about the error that caused a finding to fail to be retrieved.
      struct BatchGetFindingsError
        include JSON::Serializable

        # A code associated with the type of error.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # The finding ID of the finding that was not fetched.
        @[JSON::Field(key: "findingId")]
        getter finding_id : String

        # Describes the error.
        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the scan that generated the finding.
        @[JSON::Field(key: "scanName")]
        getter scan_name : String

        def initialize(
          @error_code : String,
          @finding_id : String,
          @message : String,
          @scan_name : String
        )
        end
      end

      struct BatchGetFindingsRequest
        include JSON::Serializable

        # A list of finding identifiers. Each identifier consists of a scanName and a findingId . You retrieve
        # the findingId when you call GetFindings .
        @[JSON::Field(key: "findingIdentifiers")]
        getter finding_identifiers : Array(Types::FindingIdentifier)

        def initialize(
          @finding_identifiers : Array(Types::FindingIdentifier)
        )
        end
      end

      struct BatchGetFindingsResponse
        include JSON::Serializable

        # A list of errors for individual findings which were not fetched. Each BatchGetFindingsError contains
        # the scanName , findingId , errorCode and error message .
        @[JSON::Field(key: "failedFindings")]
        getter failed_findings : Array(Types::BatchGetFindingsError)

        # A list of all findings which were successfully fetched.
        @[JSON::Field(key: "findings")]
        getter findings : Array(Types::Finding)

        def initialize(
          @failed_findings : Array(Types::BatchGetFindingsError),
          @findings : Array(Types::Finding)
        )
        end
      end

      # Information about a finding category with open findings.
      struct CategoryWithFindingNum
        include JSON::Serializable

        # The name of the finding category. A finding category is determined by the detector that detected the
        # finding.
        @[JSON::Field(key: "categoryName")]
        getter category_name : String?

        # The number of open findings in the category.
        @[JSON::Field(key: "findingNumber")]
        getter finding_number : Int32?

        def initialize(
          @category_name : String? = nil,
          @finding_number : Int32? = nil
        )
        end
      end

      # The line of code where a finding was detected.
      struct CodeLine
        include JSON::Serializable

        # The code that contains a vulnerability.
        @[JSON::Field(key: "content")]
        getter content : String?

        # The code line number.
        @[JSON::Field(key: "number")]
        getter number : Int32?

        def initialize(
          @content : String? = nil,
          @number : Int32? = nil
        )
        end
      end

      # The requested operation would cause a conflict with the current state of a service resource
      # associated with the request. Resolve the conflict before retrying this request.
      struct ConflictException
        include JSON::Serializable

        # The identifier for the error.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # Description of the error.
        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier for the service resource associated with the request.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of resource associated with the request.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @error_code : String,
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      struct CreateScanRequest
        include JSON::Serializable

        # The identifier for the resource object to be scanned.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : Types::ResourceId

        # The unique name that CodeGuru Security uses to track revisions across multiple scans of the same
        # resource. Only allowed for a STANDARD scan type.
        @[JSON::Field(key: "scanName")]
        getter scan_name : String

        # The type of analysis you want CodeGuru Security to perform in the scan, either Security or All . The
        # Security type only generates findings related to security. The All type generates both security
        # findings and quality findings. Defaults to Security type if missing.
        @[JSON::Field(key: "analysisType")]
        getter analysis_type : String?

        # The idempotency token for the request. Amazon CodeGuru Security uses this value to prevent the
        # accidental creation of duplicate scans if there are failures and retries.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The type of scan, either Standard or Express . Defaults to Standard type if missing. Express scans
        # run on limited resources and use a limited set of detectors to analyze your code in near-real time.
        # Standard scans have standard resource limits and use the full set of detectors to analyze your code.
        @[JSON::Field(key: "scanType")]
        getter scan_type : String?

        # An array of key-value pairs used to tag a scan. A tag is a custom attribute label with two parts: A
        # tag key. For example, CostCenter , Environment , or Secret . Tag keys are case sensitive. An
        # optional tag value field. For example, 111122223333 , Production , or a team name. Omitting the tag
        # value is the same as using an empty string. Tag values are case sensitive.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @resource_id : Types::ResourceId,
          @scan_name : String,
          @analysis_type : String? = nil,
          @client_token : String? = nil,
          @scan_type : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateScanResponse
        include JSON::Serializable

        # The identifier for the resource object that contains resources that were scanned.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : Types::ResourceId

        # UUID that identifies the individual scan run.
        @[JSON::Field(key: "runId")]
        getter run_id : String

        # The name of the scan.
        @[JSON::Field(key: "scanName")]
        getter scan_name : String

        # The current state of the scan. Returns either InProgress , Successful , or Failed .
        @[JSON::Field(key: "scanState")]
        getter scan_state : String

        # The ARN for the scan name.
        @[JSON::Field(key: "scanNameArn")]
        getter scan_name_arn : String?

        def initialize(
          @resource_id : Types::ResourceId,
          @run_id : String,
          @scan_name : String,
          @scan_state : String,
          @scan_name_arn : String? = nil
        )
        end
      end

      struct CreateUploadUrlRequest
        include JSON::Serializable

        # The name of the scan that will use the uploaded resource. CodeGuru Security uses the unique scan
        # name to track revisions across multiple scans of the same resource. Use this scanName when you call
        # CreateScan on the code resource you upload to this URL.
        @[JSON::Field(key: "scanName")]
        getter scan_name : String

        def initialize(
          @scan_name : String
        )
        end
      end

      struct CreateUploadUrlResponse
        include JSON::Serializable

        # The identifier for the uploaded code resource. Pass this to CreateScan to use the uploaded
        # resources.
        @[JSON::Field(key: "codeArtifactId")]
        getter code_artifact_id : String

        # A set of key-value pairs that contain the required headers when uploading your resource.
        @[JSON::Field(key: "requestHeaders")]
        getter request_headers : Hash(String, String)

        # A pre-signed S3 URL. You can upload the code file you want to scan with the required requestHeaders
        # using any HTTP client.
        @[JSON::Field(key: "s3Url")]
        getter s3_url : String

        def initialize(
          @code_artifact_id : String,
          @request_headers : Hash(String, String),
          @s3_url : String
        )
        end
      end

      # Information about the encryption configuration for an account. Required to call
      # UpdateAccountConfiguration .
      struct EncryptionConfig
        include JSON::Serializable

        # The KMS key ARN that is used for encryption. If an AWS-managed key is used for encryption, returns
        # empty.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @kms_key_arn : String? = nil
        )
        end
      end

      # Information about the location of security vulnerabilities that Amazon CodeGuru Security detected in
      # your code.
      struct FilePath
        include JSON::Serializable

        # A list of CodeLine objects that describe where the security vulnerability appears in your code.
        @[JSON::Field(key: "codeSnippet")]
        getter code_snippet : Array(Types::CodeLine)?

        # The last line number of the code snippet where the security vulnerability appears in your code.
        @[JSON::Field(key: "endLine")]
        getter end_line : Int32?

        # The name of the file.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The path to the resource with the security vulnerability.
        @[JSON::Field(key: "path")]
        getter path : String?

        # The first line number of the code snippet where the security vulnerability appears in your code.
        @[JSON::Field(key: "startLine")]
        getter start_line : Int32?

        def initialize(
          @code_snippet : Array(Types::CodeLine)? = nil,
          @end_line : Int32? = nil,
          @name : String? = nil,
          @path : String? = nil,
          @start_line : Int32? = nil
        )
        end
      end

      # Information about a finding that was detected in your code.
      struct Finding
        include JSON::Serializable

        # The time when the finding was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # A description of the finding.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier for the detector that detected the finding in your code. A detector is a defined rule
        # based on industry standards and AWS best practices.
        @[JSON::Field(key: "detectorId")]
        getter detector_id : String?

        # The name of the detector that identified the security vulnerability in your code.
        @[JSON::Field(key: "detectorName")]
        getter detector_name : String?

        # One or more tags or categorizations that are associated with a detector. These tags are defined by
        # type, programming language, or other classification such as maintainability or consistency.
        @[JSON::Field(key: "detectorTags")]
        getter detector_tags : Array(String)?

        # The identifier for the component that generated a finding such as AmazonCodeGuruSecurity.
        @[JSON::Field(key: "generatorId")]
        getter generator_id : String?

        # The identifier for a finding.
        @[JSON::Field(key: "id")]
        getter id : String?

        # An object that contains the details about how to remediate a finding.
        @[JSON::Field(key: "remediation")]
        getter remediation : Types::Remediation?

        # The resource where Amazon CodeGuru Security detected a finding.
        @[JSON::Field(key: "resource")]
        getter resource : Types::Resource?

        # The identifier for the rule that generated the finding.
        @[JSON::Field(key: "ruleId")]
        getter rule_id : String?

        # The severity of the finding. Severity can be critical, high, medium, low, or informational. For
        # information on severity levels, see Finding severity in the Amazon CodeGuru Security User Guide .
        @[JSON::Field(key: "severity")]
        getter severity : String?

        # The status of the finding. A finding status can be open or closed.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The title of the finding.
        @[JSON::Field(key: "title")]
        getter title : String?

        # The type of finding.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The time when the finding was last updated. Findings are updated when you remediate them or when the
        # finding code location changes.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # An object that describes the detected security vulnerability.
        @[JSON::Field(key: "vulnerability")]
        getter vulnerability : Types::Vulnerability?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @detector_id : String? = nil,
          @detector_name : String? = nil,
          @detector_tags : Array(String)? = nil,
          @generator_id : String? = nil,
          @id : String? = nil,
          @remediation : Types::Remediation? = nil,
          @resource : Types::Resource? = nil,
          @rule_id : String? = nil,
          @severity : String? = nil,
          @status : String? = nil,
          @title : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil,
          @vulnerability : Types::Vulnerability? = nil
        )
        end
      end

      # An object that contains information about a finding and the scan that generated it.
      struct FindingIdentifier
        include JSON::Serializable

        # The identifier for a finding.
        @[JSON::Field(key: "findingId")]
        getter finding_id : String

        # The name of the scan that generated the finding.
        @[JSON::Field(key: "scanName")]
        getter scan_name : String

        def initialize(
          @finding_id : String,
          @scan_name : String
        )
        end
      end

      # A numeric value corresponding to the severity of a finding, such as the number of open findings or
      # the average time it takes to close findings of a given severity.
      struct FindingMetricsValuePerSeverity
        include JSON::Serializable

        # A numeric value corresponding to a critical finding.
        @[JSON::Field(key: "critical")]
        getter critical : Float64?

        # A numeric value corresponding to a high severity finding.
        @[JSON::Field(key: "high")]
        getter high : Float64?

        # A numeric value corresponding to an informational finding.
        @[JSON::Field(key: "info")]
        getter info : Float64?

        # A numeric value corresponding to a low severity finding.
        @[JSON::Field(key: "low")]
        getter low : Float64?

        # A numeric value corresponding to a medium severity finding.
        @[JSON::Field(key: "medium")]
        getter medium : Float64?

        def initialize(
          @critical : Float64? = nil,
          @high : Float64? = nil,
          @info : Float64? = nil,
          @low : Float64? = nil,
          @medium : Float64? = nil
        )
        end
      end

      struct GetAccountConfigurationRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct GetAccountConfigurationResponse
        include JSON::Serializable

        # An EncryptionConfig object that contains the KMS key ARN that is used for encryption. By default,
        # CodeGuru Security uses an AWS-managed key for encryption. To specify your own key, call
        # UpdateAccountConfiguration . If you do not specify a customer-managed key, returns empty.
        @[JSON::Field(key: "encryptionConfig")]
        getter encryption_config : Types::EncryptionConfig

        def initialize(
          @encryption_config : Types::EncryptionConfig
        )
        end
      end

      struct GetFindingsRequest
        include JSON::Serializable

        # The name of the scan you want to retrieve findings from.
        @[JSON::Field(key: "scanName")]
        getter scan_name : String

        # The maximum number of results to return in the response. Use this parameter when paginating results.
        # If additional results exist beyond the number you specify, the nextToken element is returned in the
        # response. Use nextToken in a subsequent request to retrieve additional results. If not specified,
        # returns 1000 results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request. For subsequent calls, use the nextToken value returned from
        # the previous request to continue listing results after the first page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status of the findings you want to get. Pass either Open , Closed , or All .
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @scan_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetFindingsResponse
        include JSON::Serializable

        # A list of findings generated by the specified scan.
        @[JSON::Field(key: "findings")]
        getter findings : Array(Types::Finding)?

        # A pagination token. You can use this in future calls to GetFindings to continue listing results
        # after the current page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @findings : Array(Types::Finding)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetMetricsSummaryRequest
        include JSON::Serializable

        # The date you want to retrieve summary metrics from, rounded to the nearest day. The date must be
        # within the past two years.
        @[JSON::Field(key: "date")]
        getter date : Time

        def initialize(
          @date : Time
        )
        end
      end

      struct GetMetricsSummaryResponse
        include JSON::Serializable

        # The summary metrics from the specified date.
        @[JSON::Field(key: "metricsSummary")]
        getter metrics_summary : Types::MetricsSummary?

        def initialize(
          @metrics_summary : Types::MetricsSummary? = nil
        )
        end
      end

      struct GetScanRequest
        include JSON::Serializable

        # The name of the scan you want to view details about.
        @[JSON::Field(key: "scanName")]
        getter scan_name : String

        # UUID that identifies the individual scan run you want to view details about. You retrieve this when
        # you call the CreateScan operation. Defaults to the latest scan run if missing.
        @[JSON::Field(key: "runId")]
        getter run_id : String?

        def initialize(
          @scan_name : String,
          @run_id : String? = nil
        )
        end
      end

      struct GetScanResponse
        include JSON::Serializable

        # The type of analysis CodeGuru Security performed in the scan, either Security or All . The Security
        # type only generates findings related to security. The All type generates both security findings and
        # quality findings.
        @[JSON::Field(key: "analysisType")]
        getter analysis_type : String

        # The time the scan was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # UUID that identifies the individual scan run.
        @[JSON::Field(key: "runId")]
        getter run_id : String

        # The name of the scan.
        @[JSON::Field(key: "scanName")]
        getter scan_name : String

        # The current state of the scan. Returns either InProgress , Successful , or Failed .
        @[JSON::Field(key: "scanState")]
        getter scan_state : String

        # Details about the error that causes a scan to fail to be retrieved.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The number of times a scan has been re-run on a revised resource.
        @[JSON::Field(key: "numberOfRevisions")]
        getter number_of_revisions : Int64?

        # The ARN for the scan name.
        @[JSON::Field(key: "scanNameArn")]
        getter scan_name_arn : String?

        # The time when the scan was last updated. Only available for STANDARD scan types.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @analysis_type : String,
          @created_at : Time,
          @run_id : String,
          @scan_name : String,
          @scan_state : String,
          @error_message : String? = nil,
          @number_of_revisions : Int64? = nil,
          @scan_name_arn : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The server encountered an internal error and is unable to complete the request.
      struct InternalServerException
        include JSON::Serializable

        # The internal error encountered by the server.
        @[JSON::Field(key: "error")]
        getter error : String?

        # Description of the error.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @error : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct ListFindingsMetricsRequest
        include JSON::Serializable

        # The end date of the interval which you want to retrieve metrics from. Round to the nearest day.
        @[JSON::Field(key: "endDate")]
        getter end_date : Time

        # The start date of the interval which you want to retrieve metrics from. Rounds to the nearest day.
        @[JSON::Field(key: "startDate")]
        getter start_date : Time

        # The maximum number of results to return in the response. Use this parameter when paginating results.
        # If additional results exist beyond the number you specify, the nextToken element is returned in the
        # response. Use nextToken in a subsequent request to retrieve additional results. If not specified,
        # returns 1000 results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request. For subsequent calls, use the nextToken value returned from
        # the previous request to continue listing results after the first page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @end_date : Time,
          @start_date : Time,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFindingsMetricsResponse
        include JSON::Serializable

        # A list of AccountFindingsMetric objects retrieved from the specified time interval.
        @[JSON::Field(key: "findingsMetrics")]
        getter findings_metrics : Array(Types::AccountFindingsMetric)?

        # A pagination token. You can use this in future calls to ListFindingMetrics to continue listing
        # results after the current page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @findings_metrics : Array(Types::AccountFindingsMetric)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListScansRequest
        include JSON::Serializable

        # The maximum number of results to return in the response. Use this parameter when paginating results.
        # If additional results exist beyond the number you specify, the nextToken element is returned in the
        # response. Use nextToken in a subsequent request to retrieve additional results. If not specified,
        # returns 100 results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token to use for paginating results that are returned in the response. Set the value of this
        # parameter to null for the first request. For subsequent calls, use the nextToken value returned from
        # the previous request to continue listing results after the first page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListScansResponse
        include JSON::Serializable

        # A pagination token. You can use this in future calls to ListScans to continue listing results after
        # the current page.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of ScanSummary objects with information about all scans in an account.
        @[JSON::Field(key: "summaries")]
        getter summaries : Array(Types::ScanSummary)?

        def initialize(
          @next_token : String? = nil,
          @summaries : Array(Types::ScanSummary)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the ScanName object. You can retrieve this ARN by calling CreateScan , ListScans , or
        # GetScan .
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # An array of key-value pairs used to tag an existing scan. A tag is a custom attribute label with two
        # parts: A tag key. For example, CostCenter , Environment , or Secret . Tag keys are case sensitive.
        # An optional tag value field. For example, 111122223333 , Production , or a team name. Omitting the
        # tag value is the same as using an empty string. Tag values are case sensitive.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A summary of metrics for an account as of a specified date.
      struct MetricsSummary
        include JSON::Serializable

        # A list of CategoryWithFindingNum objects for the top 5 finding categories with the most findings.
        @[JSON::Field(key: "categoriesWithMostFindings")]
        getter categories_with_most_findings : Array(Types::CategoryWithFindingNum)?

        # The date from which the metrics summary information was retrieved.
        @[JSON::Field(key: "date")]
        getter date : Time?

        # The number of open findings of each severity.
        @[JSON::Field(key: "openFindings")]
        getter open_findings : Types::FindingMetricsValuePerSeverity?

        # A list of ScanNameWithFindingNum objects for the top 3 scans with the most number of open critical
        # findings.
        @[JSON::Field(key: "scansWithMostOpenCriticalFindings")]
        getter scans_with_most_open_critical_findings : Array(Types::ScanNameWithFindingNum)?

        # A list of ScanNameWithFindingNum objects for the top 3 scans with the most number of open findings.
        @[JSON::Field(key: "scansWithMostOpenFindings")]
        getter scans_with_most_open_findings : Array(Types::ScanNameWithFindingNum)?

        def initialize(
          @categories_with_most_findings : Array(Types::CategoryWithFindingNum)? = nil,
          @date : Time? = nil,
          @open_findings : Types::FindingMetricsValuePerSeverity? = nil,
          @scans_with_most_open_critical_findings : Array(Types::ScanNameWithFindingNum)? = nil,
          @scans_with_most_open_findings : Array(Types::ScanNameWithFindingNum)? = nil
        )
        end
      end

      # Information about the recommended course of action to remediate a finding.
      struct Recommendation
        include JSON::Serializable

        # The recommended course of action to remediate the finding.
        @[JSON::Field(key: "text")]
        getter text : String?

        # The URL address to the recommendation for remediating the finding.
        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @text : String? = nil,
          @url : String? = nil
        )
        end
      end

      # Information about how to remediate a finding.
      struct Remediation
        include JSON::Serializable

        # An object that contains information about the recommended course of action to remediate a finding.
        @[JSON::Field(key: "recommendation")]
        getter recommendation : Types::Recommendation?

        # A list of SuggestedFix objects. Each object contains information about a suggested code fix to
        # remediate the finding.
        @[JSON::Field(key: "suggestedFixes")]
        getter suggested_fixes : Array(Types::SuggestedFix)?

        def initialize(
          @recommendation : Types::Recommendation? = nil,
          @suggested_fixes : Array(Types::SuggestedFix)? = nil
        )
        end
      end

      # Information about a resource that contains a finding.
      struct Resource
        include JSON::Serializable

        # The scanName of the scan that was run on the resource.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The identifier for a section of the resource.
        @[JSON::Field(key: "subResourceId")]
        getter sub_resource_id : String?

        def initialize(
          @id : String? = nil,
          @sub_resource_id : String? = nil
        )
        end
      end

      # The identifier for a resource object that contains resources to scan. Specifying a codeArtifactId is
      # required to create a scan.
      struct ResourceId
        include JSON::Serializable

        # The identifier for the code file uploaded to the resource object. Returned by CreateUploadUrl when
        # you upload resources to be scanned.
        @[JSON::Field(key: "codeArtifactId")]
        getter code_artifact_id : String?

        def initialize(
          @code_artifact_id : String? = nil
        )
        end
      end

      # The resource specified in the request was not found.
      struct ResourceNotFoundException
        include JSON::Serializable

        # The identifier for the error.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # Description of the error.
        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier for the resource that was not found.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of resource that was not found.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @error_code : String,
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Information about the number of findings generated by a scan.
      struct ScanNameWithFindingNum
        include JSON::Serializable

        # The number of findings generated by a scan.
        @[JSON::Field(key: "findingNumber")]
        getter finding_number : Int32?

        # The name of the scan.
        @[JSON::Field(key: "scanName")]
        getter scan_name : String?

        def initialize(
          @finding_number : Int32? = nil,
          @scan_name : String? = nil
        )
        end
      end

      # Information about a scan.
      struct ScanSummary
        include JSON::Serializable

        # The time when the scan was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The identifier for the scan run.
        @[JSON::Field(key: "runId")]
        getter run_id : String

        # The name of the scan.
        @[JSON::Field(key: "scanName")]
        getter scan_name : String

        # The state of the scan. A scan can be In Progress , Complete , or Failed .
        @[JSON::Field(key: "scanState")]
        getter scan_state : String

        # The ARN for the scan name.
        @[JSON::Field(key: "scanNameArn")]
        getter scan_name_arn : String?

        # The time the scan was last updated. A scan is updated when it is re-run.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @created_at : Time,
          @run_id : String,
          @scan_name : String,
          @scan_state : String,
          @scan_name_arn : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Information about the suggested code fix to remediate a finding.
      struct SuggestedFix
        include JSON::Serializable

        # The suggested code fix. If applicable, includes code patch to replace your source code.
        @[JSON::Field(key: "code")]
        getter code : String?

        # A description of the suggested code fix and why it is being suggested.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @code : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the ScanName object. You can retrieve this ARN by calling CreateScan , ListScans , or
        # GetScan .
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # An array of key-value pairs used to tag an existing scan. A tag is a custom attribute label with two
        # parts: A tag key. For example, CostCenter , Environment , or Secret . Tag keys are case sensitive.
        # An optional tag value field. For example, 111122223333 , Production , or a team name. Omitting the
        # tag value is the same as using an empty string. Tag values are case sensitive.
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

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        # The identifier for the error.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # Description of the error.
        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier for the originating quota.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The identifier for the originating service.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @error_code : String,
          @message : String,
          @quota_code : String? = nil,
          @service_code : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the ScanName object. You can retrieve this ARN by calling CreateScan , ListScans , or
        # GetScan .
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of keys for each tag you want to remove from a scan.
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

      struct UpdateAccountConfigurationRequest
        include JSON::Serializable

        # The customer-managed KMS key ARN you want to use for encryption. If not specified, CodeGuru Security
        # will use an AWS-managed key for encryption. If you previously specified a customer-managed KMS key
        # and want CodeGuru Security to use an AWS-managed key for encryption instead, pass nothing.
        @[JSON::Field(key: "encryptionConfig")]
        getter encryption_config : Types::EncryptionConfig

        def initialize(
          @encryption_config : Types::EncryptionConfig
        )
        end
      end

      struct UpdateAccountConfigurationResponse
        include JSON::Serializable

        # An EncryptionConfig object that contains the KMS key ARN that is used for encryption. If you did not
        # specify a customer-managed KMS key in the request, returns empty.
        @[JSON::Field(key: "encryptionConfig")]
        getter encryption_config : Types::EncryptionConfig

        def initialize(
          @encryption_config : Types::EncryptionConfig
        )
        end
      end

      # The input fails to satisfy the specified constraints.
      struct ValidationException
        include JSON::Serializable

        # The identifier for the error.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # Description of the error.
        @[JSON::Field(key: "message")]
        getter message : String

        # The reason the request failed validation.
        @[JSON::Field(key: "reason")]
        getter reason : String

        # The field that caused the error, if applicable.
        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @error_code : String,
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # Information about a validation exception.
      struct ValidationExceptionField
        include JSON::Serializable

        # Describes the exception.
        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the exception.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # Information about a security vulnerability that Amazon CodeGuru Security detected.
      struct Vulnerability
        include JSON::Serializable

        # An object that describes the location of the detected security vulnerability in your code.
        @[JSON::Field(key: "filePath")]
        getter file_path : Types::FilePath?

        # The identifier for the vulnerability.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The number of times the vulnerability appears in your code.
        @[JSON::Field(key: "itemCount")]
        getter item_count : Int32?

        # One or more URL addresses that contain details about a vulnerability.
        @[JSON::Field(key: "referenceUrls")]
        getter reference_urls : Array(String)?

        # One or more vulnerabilities that are related to the vulnerability being described.
        @[JSON::Field(key: "relatedVulnerabilities")]
        getter related_vulnerabilities : Array(String)?

        def initialize(
          @file_path : Types::FilePath? = nil,
          @id : String? = nil,
          @item_count : Int32? = nil,
          @reference_urls : Array(String)? = nil,
          @related_vulnerabilities : Array(String)? = nil
        )
        end
      end
    end
  end
end
