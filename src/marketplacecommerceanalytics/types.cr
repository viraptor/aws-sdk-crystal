require "json"
require "time"

module Aws
  module MarketplaceCommerceAnalytics
    module Types

      # Container for the parameters to the GenerateDataSet operation.

      struct GenerateDataSetRequest
        include JSON::Serializable

        # The date a data set was published. For daily data sets, provide a date with day-level granularity
        # for the desired day. For monthly data sets except those with prefix disbursed_amount, provide a date
        # with month-level granularity for the desired month (the day value will be ignored). For data sets
        # with prefix disbursed_amount, provide a date with day-level granularity for the desired day. For
        # these data sets we will look backwards in time over the range of 31 days until the first data set is
        # found (the latest one).

        @[JSON::Field(key: "dataSetPublicationDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter data_set_publication_date : Time

        # The desired data set type. customer_subscriber_hourly_monthly_subscriptions From 2017-09-15 to
        # present: Available daily by 24:00 UTC. customer_subscriber_annual_subscriptions From 2017-09-15 to
        # present: Available daily by 24:00 UTC. daily_business_usage_by_instance_type From 2017-09-15 to
        # present: Available daily by 24:00 UTC. daily_business_fees From 2017-09-15 to present: Available
        # daily by 24:00 UTC. daily_business_free_trial_conversions From 2017-09-15 to present: Available
        # daily by 24:00 UTC. daily_business_new_instances From 2017-09-15 to present: Available daily by
        # 24:00 UTC. daily_business_new_product_subscribers From 2017-09-15 to present: Available daily by
        # 24:00 UTC. daily_business_canceled_product_subscribers From 2017-09-15 to present: Available daily
        # by 24:00 UTC. monthly_revenue_billing_and_revenue_data From 2017-09-15 to present: Available monthly
        # on the 15th day of the month by 24:00 UTC. Data includes metered transactions (e.g. hourly) from one
        # month prior. monthly_revenue_annual_subscriptions From 2017-09-15 to present: Available monthly on
        # the 15th day of the month by 24:00 UTC. Data includes up-front software charges (e.g. annual) from
        # one month prior. monthly_revenue_field_demonstration_usage From 2018-03-15 to present: Available
        # monthly on the 15th day of the month by 24:00 UTC. monthly_revenue_flexible_payment_schedule From
        # 2018-11-15 to present: Available monthly on the 15th day of the month by 24:00 UTC.
        # disbursed_amount_by_product From 2017-09-15 to present: Available every 30 days by 24:00 UTC.
        # disbursed_amount_by_instance_hours From 2017-09-15 to present: Available every 30 days by 24:00 UTC.
        # disbursed_amount_by_customer_geo From 2017-09-15 to present: Available every 30 days by 24:00 UTC.
        # disbursed_amount_by_age_of_uncollected_funds From 2017-09-15 to present: Available every 30 days by
        # 24:00 UTC. disbursed_amount_by_age_of_disbursed_funds From 2017-09-15 to present: Available every 30
        # days by 24:00 UTC. disbursed_amount_by_age_of_past_due_funds From 2018-04-07 to present: Available
        # every 30 days by 24:00 UTC. disbursed_amount_by_uncollected_funds_breakdown From 2019-10-04 to
        # present: Available every 30 days by 24:00 UTC. sales_compensation_billed_revenue From 2017-09-15 to
        # present: Available monthly on the 15th day of the month by 24:00 UTC. Data includes metered
        # transactions (e.g. hourly) from one month prior, and up-front software charges (e.g. annual) from
        # one month prior. us_sales_and_use_tax_records From 2017-09-15 to present: Available monthly on the
        # 15th day of the month by 24:00 UTC. disbursed_amount_by_product_with_uncollected_funds This data set
        # is deprecated. Download related reports from AMMP instead! customer_profile_by_industry This data
        # set is deprecated. Download related reports from AMMP instead! customer_profile_by_revenue This data
        # set is deprecated. Download related reports from AMMP instead! customer_profile_by_geography This
        # data set is deprecated. Download related reports from AMMP instead!

        @[JSON::Field(key: "dataSetType")]
        getter data_set_type : String

        # The name (friendly name, not ARN) of the destination S3 bucket.

        @[JSON::Field(key: "destinationS3BucketName")]
        getter destination_s3_bucket_name : String

        # The Amazon Resource Name (ARN) of the Role with an attached permissions policy to interact with the
        # provided AWS services.

        @[JSON::Field(key: "roleNameArn")]
        getter role_name_arn : String

        # Amazon Resource Name (ARN) for the SNS Topic that will be notified when the data set has been
        # published or if an error has occurred.

        @[JSON::Field(key: "snsTopicArn")]
        getter sns_topic_arn : String

        # (Optional) Key-value pairs which will be returned, unmodified, in the Amazon SNS notification
        # message and the data set metadata file. These key-value pairs can be used to correlated responses
        # with tracking information from other systems.

        @[JSON::Field(key: "customerDefinedValues")]
        getter customer_defined_values : Hash(String, String)?

        # (Optional) The desired S3 prefix for the published data set, similar to a directory path in standard
        # file systems. For example, if given the bucket name "mybucket" and the prefix "myprefix/mydatasets",
        # the output file "outputfile" would be published to "s3://mybucket/myprefix/mydatasets/outputfile".
        # If the prefix directory structure does not exist, it will be created. If no prefix is provided, the
        # data set will be published to the S3 bucket root.

        @[JSON::Field(key: "destinationS3Prefix")]
        getter destination_s3_prefix : String?

        def initialize(
          @data_set_publication_date : Time,
          @data_set_type : String,
          @destination_s3_bucket_name : String,
          @role_name_arn : String,
          @sns_topic_arn : String,
          @customer_defined_values : Hash(String, String)? = nil,
          @destination_s3_prefix : String? = nil
        )
        end
      end

      # Container for the result of the GenerateDataSet operation.

      struct GenerateDataSetResult
        include JSON::Serializable

        # A unique identifier representing a specific request to the GenerateDataSet operation. This
        # identifier can be used to correlate a request with notifications from the SNS topic.

        @[JSON::Field(key: "dataSetRequestId")]
        getter data_set_request_id : String?

        def initialize(
          @data_set_request_id : String? = nil
        )
        end
      end

      # This exception is thrown when an internal service error occurs.

      struct MarketplaceCommerceAnalyticsException
        include JSON::Serializable

        # This message describes details of the error.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This target has been deprecated. Container for the parameters to the StartSupportDataExport
      # operation.

      struct StartSupportDataExportRequest
        include JSON::Serializable

        # This target has been deprecated. Specifies the data set type to be written to the output csv file.
        # The data set types customer_support_contacts_data and test_customer_support_contacts_data both
        # result in a csv file containing the following fields: Product Id, Product Code, Customer Guid,
        # Subscription Guid, Subscription Start Date, Organization, AWS Account Id, Given Name, Surname,
        # Telephone Number, Email, Title, Country Code, ZIP Code, Operation Type, and Operation Time.
        # customer_support_contacts_data Customer support contact data. The data set will contain all changes
        # (Creates, Updates, and Deletes) to customer support contact data from the date specified in the
        # from_date parameter. test_customer_support_contacts_data An example data set containing static test
        # data in the same format as customer_support_contacts_data

        @[JSON::Field(key: "dataSetType")]
        getter data_set_type : String

        # This target has been deprecated. The name (friendly name, not ARN) of the destination S3 bucket.

        @[JSON::Field(key: "destinationS3BucketName")]
        getter destination_s3_bucket_name : String

        # This target has been deprecated. The start date from which to retrieve the data set in UTC. This
        # parameter only affects the customer_support_contacts_data data set type.

        @[JSON::Field(key: "fromDate", converter: Aws::Runtime::UnixTimestampConverter)]
        getter from_date : Time

        # This target has been deprecated. The Amazon Resource Name (ARN) of the Role with an attached
        # permissions policy to interact with the provided AWS services.

        @[JSON::Field(key: "roleNameArn")]
        getter role_name_arn : String

        # This target has been deprecated. Amazon Resource Name (ARN) for the SNS Topic that will be notified
        # when the data set has been published or if an error has occurred.

        @[JSON::Field(key: "snsTopicArn")]
        getter sns_topic_arn : String

        # This target has been deprecated. (Optional) Key-value pairs which will be returned, unmodified, in
        # the Amazon SNS notification message and the data set metadata file.

        @[JSON::Field(key: "customerDefinedValues")]
        getter customer_defined_values : Hash(String, String)?

        # This target has been deprecated. (Optional) The desired S3 prefix for the published data set,
        # similar to a directory path in standard file systems. For example, if given the bucket name
        # "mybucket" and the prefix "myprefix/mydatasets", the output file "outputfile" would be published to
        # "s3://mybucket/myprefix/mydatasets/outputfile". If the prefix directory structure does not exist, it
        # will be created. If no prefix is provided, the data set will be published to the S3 bucket root.

        @[JSON::Field(key: "destinationS3Prefix")]
        getter destination_s3_prefix : String?

        def initialize(
          @data_set_type : String,
          @destination_s3_bucket_name : String,
          @from_date : Time,
          @role_name_arn : String,
          @sns_topic_arn : String,
          @customer_defined_values : Hash(String, String)? = nil,
          @destination_s3_prefix : String? = nil
        )
        end
      end

      # This target has been deprecated. Container for the result of the StartSupportDataExport operation.

      struct StartSupportDataExportResult
        include JSON::Serializable

        # This target has been deprecated. A unique identifier representing a specific request to the
        # StartSupportDataExport operation. This identifier can be used to correlate a request with
        # notifications from the SNS topic.

        @[JSON::Field(key: "dataSetRequestId")]
        getter data_set_request_id : String?

        def initialize(
          @data_set_request_id : String? = nil
        )
        end
      end
    end
  end
end
