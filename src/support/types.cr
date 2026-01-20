require "json"

module Aws
  module Support
    module Types


      struct AddAttachmentsToSetRequest
        include JSON::Serializable

        # One or more attachments to add to the set. You can add up to three attachments per set. The size
        # limit is 5 MB per attachment. In the Attachment object, use the data parameter to specify the
        # contents of the attachment file. In the previous request syntax, the value for data appear as blob ,
        # which is represented as a base64-encoded string. The value for fileName is the name of the
        # attachment, such as troubleshoot-screenshot.png .

        @[JSON::Field(key: "attachments")]
        getter attachments : Array(Types::Attachment)

        # The ID of the attachment set. If an attachmentSetId is not specified, a new attachment set is
        # created, and the ID of the set is returned in the response. If an attachmentSetId is specified, the
        # attachments are added to the specified set, if it exists.

        @[JSON::Field(key: "attachmentSetId")]
        getter attachment_set_id : String?

        def initialize(
          @attachments : Array(Types::Attachment),
          @attachment_set_id : String? = nil
        )
        end
      end

      # The ID and expiry time of the attachment set returned by the AddAttachmentsToSet operation.

      struct AddAttachmentsToSetResponse
        include JSON::Serializable

        # The ID of the attachment set. If an attachmentSetId was not specified, a new attachment set is
        # created, and the ID of the set is returned in the response. If an attachmentSetId was specified, the
        # attachments are added to the specified set, if it exists.

        @[JSON::Field(key: "attachmentSetId")]
        getter attachment_set_id : String?

        # The time and date when the attachment set expires.

        @[JSON::Field(key: "expiryTime")]
        getter expiry_time : String?

        def initialize(
          @attachment_set_id : String? = nil,
          @expiry_time : String? = nil
        )
        end
      end


      struct AddCommunicationToCaseRequest
        include JSON::Serializable

        # The body of an email communication to add to the support case.

        @[JSON::Field(key: "communicationBody")]
        getter communication_body : String

        # The ID of a set of one or more attachments for the communication to add to the case. Create the set
        # by calling AddAttachmentsToSet

        @[JSON::Field(key: "attachmentSetId")]
        getter attachment_set_id : String?

        # The support case ID requested or returned in the call. The case ID is an alphanumeric string
        # formatted as shown in this example: case- 12345678910-2013-c4c1d2bf33c5cf47

        @[JSON::Field(key: "caseId")]
        getter case_id : String?

        # The email addresses in the CC line of an email to be added to the support case.

        @[JSON::Field(key: "ccEmailAddresses")]
        getter cc_email_addresses : Array(String)?

        def initialize(
          @communication_body : String,
          @attachment_set_id : String? = nil,
          @case_id : String? = nil,
          @cc_email_addresses : Array(String)? = nil
        )
        end
      end

      # The result of the AddCommunicationToCase operation.

      struct AddCommunicationToCaseResponse
        include JSON::Serializable

        # True if AddCommunicationToCase succeeds. Otherwise, returns an error.

        @[JSON::Field(key: "result")]
        getter result : Bool?

        def initialize(
          @result : Bool? = nil
        )
        end
      end

      # An attachment to a case communication. The attachment consists of the file name and the content of
      # the file. Each attachment file size should not exceed 5 MB. File types that are supported include
      # the following: pdf, jpeg,.doc, .log, .text

      struct Attachment
        include JSON::Serializable

        # The content of the attachment file.

        @[JSON::Field(key: "data")]
        getter data : Bytes?

        # The name of the attachment file.

        @[JSON::Field(key: "fileName")]
        getter file_name : String?

        def initialize(
          @data : Bytes? = nil,
          @file_name : String? = nil
        )
        end
      end

      # The file name and ID of an attachment to a case communication. You can use the ID to retrieve the
      # attachment with the DescribeAttachment operation.

      struct AttachmentDetails
        include JSON::Serializable

        # The ID of the attachment.

        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String?

        # The file name of the attachment.

        @[JSON::Field(key: "fileName")]
        getter file_name : String?

        def initialize(
          @attachment_id : String? = nil,
          @file_name : String? = nil
        )
        end
      end

      # An attachment with the specified ID could not be found.

      struct AttachmentIdNotFound
        include JSON::Serializable

        # An attachment with the specified ID could not be found.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The limit for the number of attachment sets created in a short period of time has been exceeded.

      struct AttachmentLimitExceeded
        include JSON::Serializable

        # The limit for the number of attachment sets created in a short period of time has been exceeded.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The expiration time of the attachment set has passed. The set expires 1 hour after it is created.

      struct AttachmentSetExpired
        include JSON::Serializable

        # The expiration time of the attachment set has passed. The set expires one hour after it is created.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An attachment set with the specified ID could not be found.

      struct AttachmentSetIdNotFound
        include JSON::Serializable

        # An attachment set with the specified ID could not be found.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A limit for the size of an attachment set has been exceeded. The limits are three attachments and 5
      # MB per attachment.

      struct AttachmentSetSizeLimitExceeded
        include JSON::Serializable

        # A limit for the size of an attachment set has been exceeded. The limits are three attachments and 5
        # MB per attachment.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The case creation limit for the account has been exceeded.

      struct CaseCreationLimitExceeded
        include JSON::Serializable

        # An error message that indicates that you have exceeded the number of cases you can have open.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A JSON-formatted object that contains the metadata for a support case. It is contained in the
      # response from a DescribeCases request. CaseDetails contains the following fields: caseId - The
      # support case ID requested or returned in the call. The case ID is an alphanumeric string formatted
      # as shown in this example: case- 12345678910-2013-c4c1d2bf33c5cf47 . categoryCode - The category of
      # problem for the support case. Corresponds to the CategoryCode values returned by a call to
      # DescribeServices . displayId - The identifier for the case on pages in the Amazon Web Services
      # Support Center. language - The language in which Amazon Web Services Support handles the case.
      # Amazon Web Services Support currently supports Chinese (“zh”), English ("en"), Japanese ("ja") and
      # Korean (“ko”). You must specify the ISO 639-1 code for the language parameter if you want support in
      # that language. nextToken - A resumption point for pagination. recentCommunications - One or more
      # Communication objects. Fields of these objects are attachments , body , caseId , submittedBy , and
      # timeCreated . serviceCode - The identifier for the Amazon Web Services service that corresponds to
      # the service code defined in the call to DescribeServices . severityCode - The severity code assigned
      # to the case. Contains one of the values returned by the call to DescribeSeverityLevels . The
      # possible values are: low , normal , high , urgent , and critical . status - The status of the case
      # in the Amazon Web Services Support Center. Valid values: all-open customer-action-completed opened
      # pending-customer-action reopened resolved unassigned work-in-progress subject - The subject line of
      # the case. submittedBy - The email address of the account that submitted the case. timeCreated - The
      # time the case was created, in ISO-8601 format.

      struct CaseDetails
        include JSON::Serializable

        # The support case ID requested or returned in the call. The case ID is an alphanumeric string
        # formatted as shown in this example: case- 12345678910-2013-c4c1d2bf33c5cf47

        @[JSON::Field(key: "caseId")]
        getter case_id : String?

        # The category of problem for the support case.

        @[JSON::Field(key: "categoryCode")]
        getter category_code : String?

        # The email addresses that receive copies of communication about the case.

        @[JSON::Field(key: "ccEmailAddresses")]
        getter cc_email_addresses : Array(String)?

        # The ID displayed for the case in the Amazon Web Services Support Center. This is a numeric string.

        @[JSON::Field(key: "displayId")]
        getter display_id : String?

        # The language in which Amazon Web Services Support handles the case. Amazon Web Services Support
        # currently supports Chinese (“zh”), English ("en"), Japanese ("ja") and Korean (“ko”). You must
        # specify the ISO 639-1 code for the language parameter if you want support in that language.

        @[JSON::Field(key: "language")]
        getter language : String?

        # The five most recent communications between you and Amazon Web Services Support Center, including
        # the IDs of any attachments to the communications. Also includes a nextToken that you can use to
        # retrieve earlier communications.

        @[JSON::Field(key: "recentCommunications")]
        getter recent_communications : Types::RecentCaseCommunications?

        # The code for the Amazon Web Services service. You can get a list of codes and the corresponding
        # service names by calling DescribeServices .

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        # The code for the severity level returned by the call to DescribeSeverityLevels .

        @[JSON::Field(key: "severityCode")]
        getter severity_code : String?

        # The status of the case. Valid values: all-open customer-action-completed opened
        # pending-customer-action reopened resolved unassigned work-in-progress

        @[JSON::Field(key: "status")]
        getter status : String?

        # The subject line for the case in the Amazon Web Services Support Center.

        @[JSON::Field(key: "subject")]
        getter subject : String?

        # The email address of the account that submitted the case.

        @[JSON::Field(key: "submittedBy")]
        getter submitted_by : String?

        # The time that the case was created in the Amazon Web Services Support Center.

        @[JSON::Field(key: "timeCreated")]
        getter time_created : String?

        def initialize(
          @case_id : String? = nil,
          @category_code : String? = nil,
          @cc_email_addresses : Array(String)? = nil,
          @display_id : String? = nil,
          @language : String? = nil,
          @recent_communications : Types::RecentCaseCommunications? = nil,
          @service_code : String? = nil,
          @severity_code : String? = nil,
          @status : String? = nil,
          @subject : String? = nil,
          @submitted_by : String? = nil,
          @time_created : String? = nil
        )
        end
      end

      # The requested caseId couldn't be located.

      struct CaseIdNotFound
        include JSON::Serializable

        # The requested CaseId could not be located.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A JSON-formatted name/value pair that represents the category name and category code of the problem,
      # selected from the DescribeServices response for each Amazon Web Services service.

      struct Category
        include JSON::Serializable

        # The category code for the support case.

        @[JSON::Field(key: "code")]
        getter code : String?

        # The category name for the support case.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @code : String? = nil,
          @name : String? = nil
        )
        end
      end

      # A communication associated with a support case. The communication consists of the case ID, the
      # message body, attachment information, the submitter of the communication, and the date and time of
      # the communication.

      struct Communication
        include JSON::Serializable

        # Information about the attachments to the case communication.

        @[JSON::Field(key: "attachmentSet")]
        getter attachment_set : Array(Types::AttachmentDetails)?

        # The text of the communication between the customer and Amazon Web Services Support.

        @[JSON::Field(key: "body")]
        getter body : String?

        # The support case ID requested or returned in the call. The case ID is an alphanumeric string
        # formatted as shown in this example: case- 12345678910-2013-c4c1d2bf33c5cf47

        @[JSON::Field(key: "caseId")]
        getter case_id : String?

        # The identity of the account that submitted, or responded to, the support case. Customer entries
        # include the IAM role as well as the email address (for example, "AdminRole (Role)
        # &lt;janedoe@example.com&gt;). Entries from the Amazon Web Services Support team display "Amazon Web
        # Services," and don't show an email address.

        @[JSON::Field(key: "submittedBy")]
        getter submitted_by : String?

        # The time the communication was created.

        @[JSON::Field(key: "timeCreated")]
        getter time_created : String?

        def initialize(
          @attachment_set : Array(Types::AttachmentDetails)? = nil,
          @body : String? = nil,
          @case_id : String? = nil,
          @submitted_by : String? = nil,
          @time_created : String? = nil
        )
        end
      end

      # A JSON-formatted object that contains the CommunicationTypeOptions for creating a case for a certain
      # communication channel. It is contained in the response from a DescribeCreateCaseOptions request.
      # CommunicationTypeOptions contains the following fields: datesWithoutSupport - A JSON-formatted list
      # containing date and time ranges for periods without support in UTC time. Date and time format is RFC
      # 3339 : 'yyyy-MM-dd'T'HH:mm:ss.SSSZZ'. supportedHours - A JSON-formatted list containing time ranges
      # when support are available. Time format is RFC 3339 : 'HH:mm:ss.SSS'. type - A string value
      # indicating the communication type that the aforementioned rules apply to. At the moment the type
      # value can assume one of 3 values at the moment chat , web and call .

      struct CommunicationTypeOptions
        include JSON::Serializable

        # A JSON-formatted list containing date and time ranges for periods without support

        @[JSON::Field(key: "datesWithoutSupport")]
        getter dates_without_support : Array(Types::DateInterval)?

        # A JSON-formatted list containing time ranges when support is available.

        @[JSON::Field(key: "supportedHours")]
        getter supported_hours : Array(Types::SupportedHour)?

        # A string value indicating the communication type. At the moment the type value can assume one of 3
        # values at the moment chat, web and call.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @dates_without_support : Array(Types::DateInterval)? = nil,
          @supported_hours : Array(Types::SupportedHour)? = nil,
          @type : String? = nil
        )
        end
      end


      struct CreateCaseRequest
        include JSON::Serializable

        # The communication body text that describes the issue. This text appears in the Description field on
        # the Amazon Web Services Support Center Create Case page.

        @[JSON::Field(key: "communicationBody")]
        getter communication_body : String

        # The title of the support case. The title appears in the Subject field on the Amazon Web Services
        # Support Center Create Case page.

        @[JSON::Field(key: "subject")]
        getter subject : String

        # The ID of a set of one or more attachments for the case. Create the set by using the
        # AddAttachmentsToSet operation.

        @[JSON::Field(key: "attachmentSetId")]
        getter attachment_set_id : String?

        # The category of problem for the support case. You also use the DescribeServices operation to get the
        # category code for a service. Each Amazon Web Services service defines its own set of category codes.

        @[JSON::Field(key: "categoryCode")]
        getter category_code : String?

        # A list of email addresses that Amazon Web Services Support copies on case correspondence. Amazon Web
        # Services Support identifies the account that creates the case when you specify your Amazon Web
        # Services credentials in an HTTP POST method or use the Amazon Web Services SDKs .

        @[JSON::Field(key: "ccEmailAddresses")]
        getter cc_email_addresses : Array(String)?

        # The type of issue for the case. You can specify customer-service or technical . If you don't specify
        # a value, the default is technical .

        @[JSON::Field(key: "issueType")]
        getter issue_type : String?

        # The language in which Amazon Web Services Support handles the case. Amazon Web Services Support
        # currently supports Chinese (“zh”), English ("en"), Japanese ("ja") and Korean (“ko”). You must
        # specify the ISO 639-1 code for the language parameter if you want support in that language.

        @[JSON::Field(key: "language")]
        getter language : String?

        # The code for the Amazon Web Services service. You can use the DescribeServices operation to get the
        # possible serviceCode values.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        # A value that indicates the urgency of the case. This value determines the response time according to
        # your service level agreement with Amazon Web Services Support. You can use the
        # DescribeSeverityLevels operation to get the possible values for severityCode . For more information,
        # see SeverityLevel and Choosing a Severity in the Amazon Web Services Support User Guide . The
        # availability of severity levels depends on the support plan for the Amazon Web Services account.

        @[JSON::Field(key: "severityCode")]
        getter severity_code : String?

        def initialize(
          @communication_body : String,
          @subject : String,
          @attachment_set_id : String? = nil,
          @category_code : String? = nil,
          @cc_email_addresses : Array(String)? = nil,
          @issue_type : String? = nil,
          @language : String? = nil,
          @service_code : String? = nil,
          @severity_code : String? = nil
        )
        end
      end

      # The support case ID returned by a successful completion of the CreateCase operation.

      struct CreateCaseResponse
        include JSON::Serializable

        # The support case ID requested or returned in the call. The case ID is an alphanumeric string in the
        # following format: case- 12345678910-2013-c4c1d2bf33c5cf47

        @[JSON::Field(key: "caseId")]
        getter case_id : String?

        def initialize(
          @case_id : String? = nil
        )
        end
      end

      # Date and time (UTC) format in RFC 3339 : 'yyyy-MM-dd'T'HH:mm:ss.SSSZZ'.

      struct DateInterval
        include JSON::Serializable

        # End Date Time (UTC). RFC 3339 format : 'yyyy-MM-dd'T'HH:mm:ss.SSSZZ'.

        @[JSON::Field(key: "endDateTime")]
        getter end_date_time : String?

        # A JSON object containing start and date time (UTC). Date and time format is RFC 3339 :
        # 'yyyy-MM-dd'T'HH:mm:ss.SSSZZ'.

        @[JSON::Field(key: "startDateTime")]
        getter start_date_time : String?

        def initialize(
          @end_date_time : String? = nil,
          @start_date_time : String? = nil
        )
        end
      end

      # The limit for the number of DescribeAttachment requests in a short period of time has been exceeded.

      struct DescribeAttachmentLimitExceeded
        include JSON::Serializable

        # The limit for the number of DescribeAttachment requests in a short period of time has been exceeded.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DescribeAttachmentRequest
        include JSON::Serializable

        # The ID of the attachment to return. Attachment IDs are returned by the DescribeCommunications
        # operation.

        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String

        def initialize(
          @attachment_id : String
        )
        end
      end

      # The content and file name of the attachment returned by the DescribeAttachment operation.

      struct DescribeAttachmentResponse
        include JSON::Serializable

        # This object includes the attachment content and file name. In the previous response syntax, the
        # value for the data parameter appears as blob , which is represented as a base64-encoded string. The
        # value for fileName is the name of the attachment, such as troubleshoot-screenshot.png .

        @[JSON::Field(key: "attachment")]
        getter attachment : Types::Attachment?

        def initialize(
          @attachment : Types::Attachment? = nil
        )
        end
      end


      struct DescribeCasesRequest
        include JSON::Serializable

        # The start date for a filtered date search on support case communications. Case communications are
        # available for 12 months after creation.

        @[JSON::Field(key: "afterTime")]
        getter after_time : String?

        # The end date for a filtered date search on support case communications. Case communications are
        # available for 12 months after creation.

        @[JSON::Field(key: "beforeTime")]
        getter before_time : String?

        # A list of ID numbers of the support cases you want returned. The maximum number of cases is 100.

        @[JSON::Field(key: "caseIdList")]
        getter case_id_list : Array(String)?

        # The ID displayed for a case in the Amazon Web Services Support Center user interface.

        @[JSON::Field(key: "displayId")]
        getter display_id : String?

        # Specifies whether to include communications in the DescribeCases response. By default,
        # communications are included.

        @[JSON::Field(key: "includeCommunications")]
        getter include_communications : Bool?

        # Specifies whether to include resolved support cases in the DescribeCases response. By default,
        # resolved cases aren't included.

        @[JSON::Field(key: "includeResolvedCases")]
        getter include_resolved_cases : Bool?

        # The language in which Amazon Web Services Support handles the case. Amazon Web Services Support
        # currently supports Chinese (“zh”), English ("en"), Japanese ("ja") and Korean (“ko”). You must
        # specify the ISO 639-1 code for the language parameter if you want support in that language.

        @[JSON::Field(key: "language")]
        getter language : String?

        # The maximum number of results to return before paginating.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A resumption point for pagination.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @after_time : String? = nil,
          @before_time : String? = nil,
          @case_id_list : Array(String)? = nil,
          @display_id : String? = nil,
          @include_communications : Bool? = nil,
          @include_resolved_cases : Bool? = nil,
          @language : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Returns an array of CaseDetails objects and a nextToken that defines a point for pagination in the
      # result set.

      struct DescribeCasesResponse
        include JSON::Serializable

        # The details for the cases that match the request.

        @[JSON::Field(key: "cases")]
        getter cases : Array(Types::CaseDetails)?

        # A resumption point for pagination.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cases : Array(Types::CaseDetails)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeCommunicationsRequest
        include JSON::Serializable

        # The support case ID requested or returned in the call. The case ID is an alphanumeric string
        # formatted as shown in this example: case- 12345678910-2013-c4c1d2bf33c5cf47

        @[JSON::Field(key: "caseId")]
        getter case_id : String

        # The start date for a filtered date search on support case communications. Case communications are
        # available for 12 months after creation.

        @[JSON::Field(key: "afterTime")]
        getter after_time : String?

        # The end date for a filtered date search on support case communications. Case communications are
        # available for 12 months after creation.

        @[JSON::Field(key: "beforeTime")]
        getter before_time : String?

        # The maximum number of results to return before paginating.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A resumption point for pagination.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @case_id : String,
          @after_time : String? = nil,
          @before_time : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The communications returned by the DescribeCommunications operation.

      struct DescribeCommunicationsResponse
        include JSON::Serializable

        # The communications for the case.

        @[JSON::Field(key: "communications")]
        getter communications : Array(Types::Communication)?

        # A resumption point for pagination.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @communications : Array(Types::Communication)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeCreateCaseOptionsRequest
        include JSON::Serializable

        # The category of problem for the support case. You also use the DescribeServices operation to get the
        # category code for a service. Each Amazon Web Services service defines its own set of category codes.

        @[JSON::Field(key: "categoryCode")]
        getter category_code : String

        # The type of issue for the case. You can specify customer-service or technical . If you don't specify
        # a value, the default is technical .

        @[JSON::Field(key: "issueType")]
        getter issue_type : String

        # The language in which Amazon Web Services Support handles the case. Amazon Web Services Support
        # currently supports Chinese (“zh”), English ("en"), Japanese ("ja") and Korean (“ko”). You must
        # specify the ISO 639-1 code for the language parameter if you want support in that language.

        @[JSON::Field(key: "language")]
        getter language : String

        # The code for the Amazon Web Services service. You can use the DescribeServices operation to get the
        # possible serviceCode values.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        def initialize(
          @category_code : String,
          @issue_type : String,
          @language : String,
          @service_code : String
        )
        end
      end


      struct DescribeCreateCaseOptionsResponse
        include JSON::Serializable

        # A JSON-formatted array that contains the available communication type options, along with the
        # available support timeframes for the given inputs.

        @[JSON::Field(key: "communicationTypes")]
        getter communication_types : Array(Types::CommunicationTypeOptions)?

        # Language availability can be any of the following: available best_effort unavailable

        @[JSON::Field(key: "languageAvailability")]
        getter language_availability : String?

        def initialize(
          @communication_types : Array(Types::CommunicationTypeOptions)? = nil,
          @language_availability : String? = nil
        )
        end
      end


      struct DescribeServicesRequest
        include JSON::Serializable

        # The language in which Amazon Web Services Support handles the case. Amazon Web Services Support
        # currently supports Chinese (“zh”), English ("en"), Japanese ("ja") and Korean (“ko”). You must
        # specify the ISO 639-1 code for the language parameter if you want support in that language.

        @[JSON::Field(key: "language")]
        getter language : String?

        # A JSON-formatted list of service codes available for Amazon Web Services services.

        @[JSON::Field(key: "serviceCodeList")]
        getter service_code_list : Array(String)?

        def initialize(
          @language : String? = nil,
          @service_code_list : Array(String)? = nil
        )
        end
      end

      # The list of Amazon Web Services services returned by the DescribeServices operation.

      struct DescribeServicesResponse
        include JSON::Serializable

        # A JSON-formatted list of Amazon Web Services services.

        @[JSON::Field(key: "services")]
        getter services : Array(Types::Service)?

        def initialize(
          @services : Array(Types::Service)? = nil
        )
        end
      end


      struct DescribeSeverityLevelsRequest
        include JSON::Serializable

        # The language in which Amazon Web Services Support handles the case. Amazon Web Services Support
        # currently supports Chinese (“zh”), English ("en"), Japanese ("ja") and Korean (“ko”). You must
        # specify the ISO 639-1 code for the language parameter if you want support in that language.

        @[JSON::Field(key: "language")]
        getter language : String?

        def initialize(
          @language : String? = nil
        )
        end
      end

      # The list of severity levels returned by the DescribeSeverityLevels operation.

      struct DescribeSeverityLevelsResponse
        include JSON::Serializable

        # The available severity levels for the support case. Available severity levels are defined by your
        # service level agreement with Amazon Web Services.

        @[JSON::Field(key: "severityLevels")]
        getter severity_levels : Array(Types::SeverityLevel)?

        def initialize(
          @severity_levels : Array(Types::SeverityLevel)? = nil
        )
        end
      end


      struct DescribeSupportedLanguagesRequest
        include JSON::Serializable

        # The category of problem for the support case. You also use the DescribeServices operation to get the
        # category code for a service. Each Amazon Web Services service defines its own set of category codes.

        @[JSON::Field(key: "categoryCode")]
        getter category_code : String

        # The type of issue for the case. You can specify customer-service or technical .

        @[JSON::Field(key: "issueType")]
        getter issue_type : String

        # The code for the Amazon Web Services service. You can use the DescribeServices operation to get the
        # possible serviceCode values.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        def initialize(
          @category_code : String,
          @issue_type : String,
          @service_code : String
        )
        end
      end


      struct DescribeSupportedLanguagesResponse
        include JSON::Serializable

        # A JSON-formatted array that contains the available ISO 639-1 language codes.

        @[JSON::Field(key: "supportedLanguages")]
        getter supported_languages : Array(Types::SupportedLanguage)?

        def initialize(
          @supported_languages : Array(Types::SupportedLanguage)? = nil
        )
        end
      end


      struct DescribeTrustedAdvisorCheckRefreshStatusesRequest
        include JSON::Serializable

        # The IDs of the Trusted Advisor checks to get the status. If you specify the check ID of a check that
        # is automatically refreshed, you might see an InvalidParameterValue error.

        @[JSON::Field(key: "checkIds")]
        getter check_ids : Array(String)

        def initialize(
          @check_ids : Array(String)
        )
        end
      end

      # The statuses of the Trusted Advisor checks returned by the
      # DescribeTrustedAdvisorCheckRefreshStatuses operation.

      struct DescribeTrustedAdvisorCheckRefreshStatusesResponse
        include JSON::Serializable

        # The refresh status of the specified Trusted Advisor checks.

        @[JSON::Field(key: "statuses")]
        getter statuses : Array(Types::TrustedAdvisorCheckRefreshStatus)

        def initialize(
          @statuses : Array(Types::TrustedAdvisorCheckRefreshStatus)
        )
        end
      end


      struct DescribeTrustedAdvisorCheckResultRequest
        include JSON::Serializable

        # The unique identifier for the Trusted Advisor check.

        @[JSON::Field(key: "checkId")]
        getter check_id : String

        # The ISO 639-1 code for the language that you want your check results to appear in. The Amazon Web
        # Services Support API currently supports the following languages for Trusted Advisor: Chinese,
        # Simplified - zh Chinese, Traditional - zh_TW English - en French - fr German - de Indonesian - id
        # Italian - it Japanese - ja Korean - ko Portuguese, Brazilian - pt_BR Spanish - es

        @[JSON::Field(key: "language")]
        getter language : String?

        def initialize(
          @check_id : String,
          @language : String? = nil
        )
        end
      end

      # The result of the Trusted Advisor check returned by the DescribeTrustedAdvisorCheckResult operation.

      struct DescribeTrustedAdvisorCheckResultResponse
        include JSON::Serializable

        # The detailed results of the Trusted Advisor check.

        @[JSON::Field(key: "result")]
        getter result : Types::TrustedAdvisorCheckResult?

        def initialize(
          @result : Types::TrustedAdvisorCheckResult? = nil
        )
        end
      end


      struct DescribeTrustedAdvisorCheckSummariesRequest
        include JSON::Serializable

        # The IDs of the Trusted Advisor checks.

        @[JSON::Field(key: "checkIds")]
        getter check_ids : Array(String)

        def initialize(
          @check_ids : Array(String)
        )
        end
      end

      # The summaries of the Trusted Advisor checks returned by the DescribeTrustedAdvisorCheckSummaries
      # operation.

      struct DescribeTrustedAdvisorCheckSummariesResponse
        include JSON::Serializable

        # The summary information for the requested Trusted Advisor checks.

        @[JSON::Field(key: "summaries")]
        getter summaries : Array(Types::TrustedAdvisorCheckSummary)

        def initialize(
          @summaries : Array(Types::TrustedAdvisorCheckSummary)
        )
        end
      end


      struct DescribeTrustedAdvisorChecksRequest
        include JSON::Serializable

        # The ISO 639-1 code for the language that you want your checks to appear in. The Amazon Web Services
        # Support API currently supports the following languages for Trusted Advisor: Chinese, Simplified - zh
        # Chinese, Traditional - zh_TW English - en French - fr German - de Indonesian - id Italian - it
        # Japanese - ja Korean - ko Portuguese, Brazilian - pt_BR Spanish - es

        @[JSON::Field(key: "language")]
        getter language : String

        def initialize(
          @language : String
        )
        end
      end

      # Information about the Trusted Advisor checks returned by the DescribeTrustedAdvisorChecks operation.

      struct DescribeTrustedAdvisorChecksResponse
        include JSON::Serializable

        # Information about all available Trusted Advisor checks.

        @[JSON::Field(key: "checks")]
        getter checks : Array(Types::TrustedAdvisorCheckDescription)

        def initialize(
          @checks : Array(Types::TrustedAdvisorCheckDescription)
        )
        end
      end

      # An internal server error occurred.

      struct InternalServerError
        include JSON::Serializable

        # An internal server error occurred.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The five most recent communications associated with the case.

      struct RecentCaseCommunications
        include JSON::Serializable

        # The five most recent communications associated with the case.

        @[JSON::Field(key: "communications")]
        getter communications : Array(Types::Communication)?

        # A resumption point for pagination.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @communications : Array(Types::Communication)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct RefreshTrustedAdvisorCheckRequest
        include JSON::Serializable

        # The unique identifier for the Trusted Advisor check to refresh. Specifying the check ID of a check
        # that is automatically refreshed causes an InvalidParameterValue error.

        @[JSON::Field(key: "checkId")]
        getter check_id : String

        def initialize(
          @check_id : String
        )
        end
      end

      # The current refresh status of a Trusted Advisor check.

      struct RefreshTrustedAdvisorCheckResponse
        include JSON::Serializable

        # The current refresh status for a check, including the amount of time until the check is eligible for
        # refresh.

        @[JSON::Field(key: "status")]
        getter status : Types::TrustedAdvisorCheckRefreshStatus

        def initialize(
          @status : Types::TrustedAdvisorCheckRefreshStatus
        )
        end
      end


      struct ResolveCaseRequest
        include JSON::Serializable

        # The support case ID requested or returned in the call. The case ID is an alphanumeric string
        # formatted as shown in this example: case- 12345678910-2013-c4c1d2bf33c5cf47

        @[JSON::Field(key: "caseId")]
        getter case_id : String?

        def initialize(
          @case_id : String? = nil
        )
        end
      end

      # The status of the case returned by the ResolveCase operation.

      struct ResolveCaseResponse
        include JSON::Serializable

        # The status of the case after the ResolveCase request was processed.

        @[JSON::Field(key: "finalCaseStatus")]
        getter final_case_status : String?

        # The status of the case when the ResolveCase request was sent.

        @[JSON::Field(key: "initialCaseStatus")]
        getter initial_case_status : String?

        def initialize(
          @final_case_status : String? = nil,
          @initial_case_status : String? = nil
        )
        end
      end

      # Information about an Amazon Web Services service returned by the DescribeServices operation.

      struct Service
        include JSON::Serializable

        # A list of categories that describe the type of support issue a case describes. Categories consist of
        # a category name and a category code. Category names and codes are passed to Amazon Web Services
        # Support when you call CreateCase .

        @[JSON::Field(key: "categories")]
        getter categories : Array(Types::Category)?

        # The code for an Amazon Web Services service returned by the DescribeServices response. The name
        # element contains the corresponding friendly name.

        @[JSON::Field(key: "code")]
        getter code : String?

        # The friendly name for an Amazon Web Services service. The code element contains the corresponding
        # code.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @categories : Array(Types::Category)? = nil,
          @code : String? = nil,
          @name : String? = nil
        )
        end
      end

      # A code and name pair that represents the severity level of a support case. The available values
      # depend on the support plan for the account. For more information, see Choosing a severity in the
      # Amazon Web Services Support User Guide .

      struct SeverityLevel
        include JSON::Serializable

        # The code for case severity level. Valid values: low | normal | high | urgent | critical

        @[JSON::Field(key: "code")]
        getter code : String?

        # The name of the severity level that corresponds to the severity level code. The values returned by
        # the API are different from the values that appear in the Amazon Web Services Support Center. For
        # example, the API uses the code low , but the name appears as General guidance in Support Center. The
        # following are the API code names and how they appear in the console: low - General guidance normal -
        # System impaired high - Production system impaired urgent - Production system down critical -
        # Business-critical system down For more information, see Choosing a severity in the Amazon Web
        # Services Support User Guide .

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @code : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Time range object with startTime and endTime range in RFC 3339 format. 'HH:mm:ss.SSS' .

      struct SupportedHour
        include JSON::Serializable

        # End Time. RFC 3339 format 'HH:mm:ss.SSS' .

        @[JSON::Field(key: "endTime")]
        getter end_time : String?

        # Start Time. RFC 3339 format 'HH:mm:ss.SSS' .

        @[JSON::Field(key: "startTime")]
        getter start_time : String?

        def initialize(
          @end_time : String? = nil,
          @start_time : String? = nil
        )
        end
      end

      # A JSON-formatted object that contains the available ISO 639-1 language code , language name and
      # langauge display value. The language code is what should be used in the CreateCase call.

      struct SupportedLanguage
        include JSON::Serializable

        # 2 digit ISO 639-1 code. e.g. en

        @[JSON::Field(key: "code")]
        getter code : String?

        # Language display value e.g. ENGLISH

        @[JSON::Field(key: "display")]
        getter display : String?

        # Full language description e.g. ENGLISH

        @[JSON::Field(key: "language")]
        getter language : String?

        def initialize(
          @code : String? = nil,
          @display : String? = nil,
          @language : String? = nil
        )
        end
      end

      # You have exceeded the maximum allowed TPS (Transactions Per Second) for the operations.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The container for summary information that relates to the category of the Trusted Advisor check.

      struct TrustedAdvisorCategorySpecificSummary
        include JSON::Serializable

        # The summary information about cost savings for a Trusted Advisor check that is in the Cost
        # Optimizing category.

        @[JSON::Field(key: "costOptimizing")]
        getter cost_optimizing : Types::TrustedAdvisorCostOptimizingSummary?

        def initialize(
          @cost_optimizing : Types::TrustedAdvisorCostOptimizingSummary? = nil
        )
        end
      end

      # The description and metadata for a Trusted Advisor check.

      struct TrustedAdvisorCheckDescription
        include JSON::Serializable

        # The category of the Trusted Advisor check.

        @[JSON::Field(key: "category")]
        getter category : String

        # The description of the Trusted Advisor check, which includes the alert criteria and recommended
        # operations (contains HTML markup).

        @[JSON::Field(key: "description")]
        getter description : String

        # The unique identifier for the Trusted Advisor check.

        @[JSON::Field(key: "id")]
        getter id : String

        # The column headings for the data returned by the Trusted Advisor check. The order of the headings
        # corresponds to the order of the data in the Metadata element of the TrustedAdvisorResourceDetail for
        # the check. Metadata contains all the data that is shown in the Excel download, even in those cases
        # where the UI shows just summary data.

        @[JSON::Field(key: "metadata")]
        getter metadata : Array(String)

        # The display name for the Trusted Advisor check.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @category : String,
          @description : String,
          @id : String,
          @metadata : Array(String),
          @name : String
        )
        end
      end

      # The refresh status of a Trusted Advisor check.

      struct TrustedAdvisorCheckRefreshStatus
        include JSON::Serializable

        # The unique identifier for the Trusted Advisor check.

        @[JSON::Field(key: "checkId")]
        getter check_id : String

        # The amount of time, in milliseconds, until the Trusted Advisor check is eligible for refresh.

        @[JSON::Field(key: "millisUntilNextRefreshable")]
        getter millis_until_next_refreshable : Int64

        # The status of the Trusted Advisor check for which a refresh has been requested: none - The check is
        # not refreshed or the non-success status exceeds the timeout enqueued - The check refresh requests
        # has entered the refresh queue processing - The check refresh request is picked up by the rule
        # processing engine success - The check is successfully refreshed abandoned - The check refresh has
        # failed

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @check_id : String,
          @millis_until_next_refreshable : Int64,
          @status : String
        )
        end
      end

      # The results of a Trusted Advisor check returned by DescribeTrustedAdvisorCheckResult .

      struct TrustedAdvisorCheckResult
        include JSON::Serializable

        # Summary information that relates to the category of the check. Cost Optimizing is the only category
        # that is currently supported.

        @[JSON::Field(key: "categorySpecificSummary")]
        getter category_specific_summary : Types::TrustedAdvisorCategorySpecificSummary

        # The unique identifier for the Trusted Advisor check.

        @[JSON::Field(key: "checkId")]
        getter check_id : String

        # The details about each resource listed in the check result.

        @[JSON::Field(key: "flaggedResources")]
        getter flagged_resources : Array(Types::TrustedAdvisorResourceDetail)


        @[JSON::Field(key: "resourcesSummary")]
        getter resources_summary : Types::TrustedAdvisorResourcesSummary

        # The alert status of the check: "ok" (green), "warning" (yellow), "error" (red), or "not_available".

        @[JSON::Field(key: "status")]
        getter status : String

        # The time of the last refresh of the check.

        @[JSON::Field(key: "timestamp")]
        getter timestamp : String

        def initialize(
          @category_specific_summary : Types::TrustedAdvisorCategorySpecificSummary,
          @check_id : String,
          @flagged_resources : Array(Types::TrustedAdvisorResourceDetail),
          @resources_summary : Types::TrustedAdvisorResourcesSummary,
          @status : String,
          @timestamp : String
        )
        end
      end

      # A summary of a Trusted Advisor check result, including the alert status, last refresh, and number of
      # resources examined.

      struct TrustedAdvisorCheckSummary
        include JSON::Serializable

        # Summary information that relates to the category of the check. Cost Optimizing is the only category
        # that is currently supported.

        @[JSON::Field(key: "categorySpecificSummary")]
        getter category_specific_summary : Types::TrustedAdvisorCategorySpecificSummary

        # The unique identifier for the Trusted Advisor check.

        @[JSON::Field(key: "checkId")]
        getter check_id : String


        @[JSON::Field(key: "resourcesSummary")]
        getter resources_summary : Types::TrustedAdvisorResourcesSummary

        # The alert status of the check: "ok" (green), "warning" (yellow), "error" (red), or "not_available".

        @[JSON::Field(key: "status")]
        getter status : String

        # The time of the last refresh of the check.

        @[JSON::Field(key: "timestamp")]
        getter timestamp : String

        # Specifies whether the Trusted Advisor check has flagged resources.

        @[JSON::Field(key: "hasFlaggedResources")]
        getter has_flagged_resources : Bool?

        def initialize(
          @category_specific_summary : Types::TrustedAdvisorCategorySpecificSummary,
          @check_id : String,
          @resources_summary : Types::TrustedAdvisorResourcesSummary,
          @status : String,
          @timestamp : String,
          @has_flagged_resources : Bool? = nil
        )
        end
      end

      # The estimated cost savings that might be realized if the recommended operations are taken.

      struct TrustedAdvisorCostOptimizingSummary
        include JSON::Serializable

        # The estimated monthly savings that might be realized if the recommended operations are taken.

        @[JSON::Field(key: "estimatedMonthlySavings")]
        getter estimated_monthly_savings : Float64

        # The estimated percentage of savings that might be realized if the recommended operations are taken.

        @[JSON::Field(key: "estimatedPercentMonthlySavings")]
        getter estimated_percent_monthly_savings : Float64

        def initialize(
          @estimated_monthly_savings : Float64,
          @estimated_percent_monthly_savings : Float64
        )
        end
      end

      # Contains information about a resource identified by a Trusted Advisor check.

      struct TrustedAdvisorResourceDetail
        include JSON::Serializable

        # Additional information about the identified resource. The exact metadata and its order can be
        # obtained by inspecting the TrustedAdvisorCheckDescription object returned by the call to
        # DescribeTrustedAdvisorChecks . Metadata contains all the data that is shown in the Excel download,
        # even in those cases where the UI shows just summary data.

        @[JSON::Field(key: "metadata")]
        getter metadata : Array(String)

        # The unique identifier for the identified resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The status code for the resource identified in the Trusted Advisor check.

        @[JSON::Field(key: "status")]
        getter status : String

        # Specifies whether the Amazon Web Services resource was ignored by Trusted Advisor because it was
        # marked as suppressed by the user.

        @[JSON::Field(key: "isSuppressed")]
        getter is_suppressed : Bool?

        # The Amazon Web Services Region in which the identified resource is located.

        @[JSON::Field(key: "region")]
        getter region : String?

        def initialize(
          @metadata : Array(String),
          @resource_id : String,
          @status : String,
          @is_suppressed : Bool? = nil,
          @region : String? = nil
        )
        end
      end

      # Details about Amazon Web Services resources that were analyzed in a call to Trusted Advisor
      # DescribeTrustedAdvisorCheckSummaries .

      struct TrustedAdvisorResourcesSummary
        include JSON::Serializable

        # The number of Amazon Web Services resources that were flagged (listed) by the Trusted Advisor check.

        @[JSON::Field(key: "resourcesFlagged")]
        getter resources_flagged : Int64

        # The number of Amazon Web Services resources ignored by Trusted Advisor because information was
        # unavailable.

        @[JSON::Field(key: "resourcesIgnored")]
        getter resources_ignored : Int64

        # The number of Amazon Web Services resources that were analyzed by the Trusted Advisor check.

        @[JSON::Field(key: "resourcesProcessed")]
        getter resources_processed : Int64

        # The number of Amazon Web Services resources ignored by Trusted Advisor because they were marked as
        # suppressed by the user.

        @[JSON::Field(key: "resourcesSuppressed")]
        getter resources_suppressed : Int64

        def initialize(
          @resources_flagged : Int64,
          @resources_ignored : Int64,
          @resources_processed : Int64,
          @resources_suppressed : Int64
        )
        end
      end
    end
  end
end
