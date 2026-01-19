require "json"

module AwsSdk
  module CostAndUsageReportService
    module Types

      # Deletes the specified report.
      struct DeleteReportDefinitionRequest
        include JSON::Serializable

        # The name of the report that you want to delete. The name must be unique, is case sensitive, and
        # can't include spaces.
        @[JSON::Field(key: "ReportName")]
        getter report_name : String

        def initialize(
          @report_name : String
        )
        end
      end

      # If the action is successful, the service sends back an HTTP 200 response.
      struct DeleteReportDefinitionResponse
        include JSON::Serializable

        @[JSON::Field(key: "ResponseMessage")]
        getter response_message : String?

        def initialize(
          @response_message : String? = nil
        )
        end
      end

      # Requests a Amazon Web Services Cost and Usage Report list owned by the account.
      struct DescribeReportDefinitionsRequest
        include JSON::Serializable

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # If the action is successful, the service sends back an HTTP 200 response.
      struct DescribeReportDefinitionsResponse
        include JSON::Serializable

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An Amazon Web Services Cost and Usage Report list owned by the account.
        @[JSON::Field(key: "ReportDefinitions")]
        getter report_definitions : Array(Types::ReportDefinition)?

        def initialize(
          @next_token : String? = nil,
          @report_definitions : Array(Types::ReportDefinition)? = nil
        )
        end
      end

      # A report with the specified name already exists in the account. Specify a different report name.
      struct DuplicateReportNameException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An error on the server occurred during the processing of your request. Try again later.
      struct InternalErrorException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The report name of the report definition that tags are to be returned for.
        @[JSON::Field(key: "ReportName")]
        getter report_name : String

        def initialize(
          @report_name : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags assigned to the report definition resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ModifyReportDefinitionRequest
        include JSON::Serializable

        @[JSON::Field(key: "ReportDefinition")]
        getter report_definition : Types::ReportDefinition

        @[JSON::Field(key: "ReportName")]
        getter report_name : String

        def initialize(
          @report_definition : Types::ReportDefinition,
          @report_name : String
        )
        end
      end

      struct ModifyReportDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Creates a Cost and Usage Report.
      struct PutReportDefinitionRequest
        include JSON::Serializable

        # Represents the output of the PutReportDefinition operation. The content consists of the detailed
        # metadata and data file information.
        @[JSON::Field(key: "ReportDefinition")]
        getter report_definition : Types::ReportDefinition

        # The tags to be assigned to the report definition resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @report_definition : Types::ReportDefinition,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # If the action is successful, the service sends back an HTTP 200 response with an empty HTTP body.
      struct PutReportDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The definition of Amazon Web Services Cost and Usage Report. You can specify the report name, time
      # unit, report format, compression format, S3 bucket, additional artifacts, and schema elements in the
      # definition.
      struct ReportDefinition
        include JSON::Serializable

        # A list of strings that indicate additional content that Amazon Web Services includes in the report,
        # such as individual resource IDs.
        @[JSON::Field(key: "AdditionalSchemaElements")]
        getter additional_schema_elements : Array(String)

        @[JSON::Field(key: "Compression")]
        getter compression : String

        @[JSON::Field(key: "Format")]
        getter format : String

        @[JSON::Field(key: "ReportName")]
        getter report_name : String

        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String

        @[JSON::Field(key: "S3Prefix")]
        getter s3_prefix : String

        @[JSON::Field(key: "S3Region")]
        getter s3_region : String

        @[JSON::Field(key: "TimeUnit")]
        getter time_unit : String

        # A list of manifests that you want Amazon Web Services to create for this report.
        @[JSON::Field(key: "AdditionalArtifacts")]
        getter additional_artifacts : Array(String)?

        # The Amazon resource name of the billing view. The BillingViewArn is needed to create Amazon Web
        # Services Cost and Usage Report for each billing group maintained in the Amazon Web Services Billing
        # Conductor service. The BillingViewArn for a billing group can be constructed as:
        # arn:aws:billing::payer-account-id:billingview/billing-group-primary-account-id
        @[JSON::Field(key: "BillingViewArn")]
        getter billing_view_arn : String?

        # Whether you want Amazon Web Services to update your reports after they have been finalized if Amazon
        # Web Services detects charges related to previous months. These charges can include refunds, credits,
        # or support fees.
        @[JSON::Field(key: "RefreshClosedReports")]
        getter refresh_closed_reports : Bool?

        # The status of the report.
        @[JSON::Field(key: "ReportStatus")]
        getter report_status : Types::ReportStatus?

        # Whether you want Amazon Web Services to overwrite the previous version of each report or to deliver
        # the report in addition to the previous versions.
        @[JSON::Field(key: "ReportVersioning")]
        getter report_versioning : String?

        def initialize(
          @additional_schema_elements : Array(String),
          @compression : String,
          @format : String,
          @report_name : String,
          @s3_bucket : String,
          @s3_prefix : String,
          @s3_region : String,
          @time_unit : String,
          @additional_artifacts : Array(String)? = nil,
          @billing_view_arn : String? = nil,
          @refresh_closed_reports : Bool? = nil,
          @report_status : Types::ReportStatus? = nil,
          @report_versioning : String? = nil
        )
        end
      end

      # This account already has five reports defined. To define a new report, you must delete an existing
      # report.
      struct ReportLimitReachedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A two element dictionary with a lastDelivery and lastStatus key whose values describe the date and
      # status of the last delivered report for a particular report definition.
      struct ReportStatus
        include JSON::Serializable

        # A timestamp that gives the date of a report delivery.
        @[JSON::Field(key: "lastDelivery")]
        getter last_delivery : String?

        # An enum that gives the status of a report delivery.
        @[JSON::Field(key: "lastStatus")]
        getter last_status : String?

        def initialize(
          @last_delivery : String? = nil,
          @last_status : String? = nil
        )
        end
      end

      # The specified report ( ReportName ) in the request doesn't exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes a tag. A tag is a key-value pair. You can add up to 50 tags to a report definition.
      struct Tag
        include JSON::Serializable

        # The key of the tag. Tag keys are case sensitive. Each report definition can only have up to one tag
        # with the same key. If you try to add an existing tag with the same key, the existing tag value will
        # be updated to the new value.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the tag. Tag values are case-sensitive. This can be an empty string.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The report name of the report definition that tags are to be associated with.
        @[JSON::Field(key: "ReportName")]
        getter report_name : String

        # The tags to be assigned to the report definition resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @report_name : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The report name of the report definition that tags are to be disassociated from.
        @[JSON::Field(key: "ReportName")]
        getter report_name : String

        # The tags to be disassociated from the report definition resource.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @report_name : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.
      struct ValidationException
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
