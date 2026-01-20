require "json"
require "time"

module Aws
  module MTurk
    module Types


      struct AcceptQualificationRequestRequest
        include JSON::Serializable

        # The ID of the Qualification request, as returned by the GetQualificationRequests operation.

        @[JSON::Field(key: "QualificationRequestId")]
        getter qualification_request_id : String

        # The value of the Qualification. You can omit this value if you are using the presence or absence of
        # the Qualification as the basis for a HIT requirement.

        @[JSON::Field(key: "IntegerValue")]
        getter integer_value : Int32?

        def initialize(
          @qualification_request_id : String,
          @integer_value : Int32? = nil
        )
        end
      end


      struct AcceptQualificationRequestResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct ApproveAssignmentRequest
        include JSON::Serializable

        # The ID of the assignment. The assignment must correspond to a HIT created by the Requester.

        @[JSON::Field(key: "AssignmentId")]
        getter assignment_id : String

        # A flag indicating that an assignment should be approved even if it was previously rejected. Defaults
        # to False .

        @[JSON::Field(key: "OverrideRejection")]
        getter override_rejection : Bool?

        # A message for the Worker, which the Worker can see in the Status section of the web site.

        @[JSON::Field(key: "RequesterFeedback")]
        getter requester_feedback : String?

        def initialize(
          @assignment_id : String,
          @override_rejection : Bool? = nil,
          @requester_feedback : String? = nil
        )
        end
      end


      struct ApproveAssignmentResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The Assignment data structure represents a single assignment of a HIT to a Worker. The assignment
      # tracks the Worker's efforts to complete the HIT, and contains the results for later retrieval.

      struct Assignment
        include JSON::Serializable

        # The date and time the Worker accepted the assignment.

        @[JSON::Field(key: "AcceptTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter accept_time : Time?

        # The Worker's answers submitted for the HIT contained in a QuestionFormAnswers document, if the
        # Worker provides an answer. If the Worker does not provide any answers, Answer may contain a
        # QuestionFormAnswers document, or Answer may be empty.

        @[JSON::Field(key: "Answer")]
        getter answer : String?

        # If the Worker has submitted results and the Requester has approved the results, ApprovalTime is the
        # date and time the Requester approved the results. This value is omitted from the assignment if the
        # Requester has not yet approved the results.

        @[JSON::Field(key: "ApprovalTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter approval_time : Time?

        # A unique identifier for the assignment.

        @[JSON::Field(key: "AssignmentId")]
        getter assignment_id : String?

        # The status of the assignment.

        @[JSON::Field(key: "AssignmentStatus")]
        getter assignment_status : String?

        # If results have been submitted, AutoApprovalTime is the date and time the results of the assignment
        # results are considered Approved automatically if they have not already been explicitly approved or
        # rejected by the Requester. This value is derived from the auto-approval delay specified by the
        # Requester in the HIT. This value is omitted from the assignment if the Worker has not yet submitted
        # results.

        @[JSON::Field(key: "AutoApprovalTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter auto_approval_time : Time?

        # The date and time of the deadline for the assignment. This value is derived from the deadline
        # specification for the HIT and the date and time the Worker accepted the HIT.

        @[JSON::Field(key: "Deadline", converter: Aws::Runtime::UnixTimestampConverter)]
        getter deadline : Time?

        # The ID of the HIT.

        @[JSON::Field(key: "HITId")]
        getter hit_id : String?

        # If the Worker has submitted results and the Requester has rejected the results, RejectionTime is the
        # date and time the Requester rejected the results.

        @[JSON::Field(key: "RejectionTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter rejection_time : Time?

        # The feedback string included with the call to the ApproveAssignment operation or the
        # RejectAssignment operation, if the Requester approved or rejected the assignment and specified
        # feedback.

        @[JSON::Field(key: "RequesterFeedback")]
        getter requester_feedback : String?

        # If the Worker has submitted results, SubmitTime is the date and time the assignment was submitted.
        # This value is omitted from the assignment if the Worker has not yet submitted results.

        @[JSON::Field(key: "SubmitTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter submit_time : Time?

        # The ID of the Worker who accepted the HIT.

        @[JSON::Field(key: "WorkerId")]
        getter worker_id : String?

        def initialize(
          @accept_time : Time? = nil,
          @answer : String? = nil,
          @approval_time : Time? = nil,
          @assignment_id : String? = nil,
          @assignment_status : String? = nil,
          @auto_approval_time : Time? = nil,
          @deadline : Time? = nil,
          @hit_id : String? = nil,
          @rejection_time : Time? = nil,
          @requester_feedback : String? = nil,
          @submit_time : Time? = nil,
          @worker_id : String? = nil
        )
        end
      end


      struct AssociateQualificationWithWorkerRequest
        include JSON::Serializable

        # The ID of the Qualification type to use for the assigned Qualification.

        @[JSON::Field(key: "QualificationTypeId")]
        getter qualification_type_id : String

        # The ID of the Worker to whom the Qualification is being assigned. Worker IDs are included with
        # submitted HIT assignments and Qualification requests.

        @[JSON::Field(key: "WorkerId")]
        getter worker_id : String

        # The value of the Qualification to assign.

        @[JSON::Field(key: "IntegerValue")]
        getter integer_value : Int32?

        # Specifies whether to send a notification email message to the Worker saying that the qualification
        # was assigned to the Worker. Note: this is true by default.

        @[JSON::Field(key: "SendNotification")]
        getter send_notification : Bool?

        def initialize(
          @qualification_type_id : String,
          @worker_id : String,
          @integer_value : Int32? = nil,
          @send_notification : Bool? = nil
        )
        end
      end


      struct AssociateQualificationWithWorkerResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An object representing a Bonus payment paid to a Worker.

      struct BonusPayment
        include JSON::Serializable

        # The ID of the assignment associated with this bonus payment.

        @[JSON::Field(key: "AssignmentId")]
        getter assignment_id : String?


        @[JSON::Field(key: "BonusAmount")]
        getter bonus_amount : String?

        # The date and time of when the bonus was granted.

        @[JSON::Field(key: "GrantTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter grant_time : Time?

        # The Reason text given when the bonus was granted, if any.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        # The ID of the Worker to whom the bonus was paid.

        @[JSON::Field(key: "WorkerId")]
        getter worker_id : String?

        def initialize(
          @assignment_id : String? = nil,
          @bonus_amount : String? = nil,
          @grant_time : Time? = nil,
          @reason : String? = nil,
          @worker_id : String? = nil
        )
        end
      end


      struct CreateAdditionalAssignmentsForHITRequest
        include JSON::Serializable

        # The ID of the HIT to extend.

        @[JSON::Field(key: "HITId")]
        getter hit_id : String

        # The number of additional assignments to request for this HIT.

        @[JSON::Field(key: "NumberOfAdditionalAssignments")]
        getter number_of_additional_assignments : Int32

        # A unique identifier for this request, which allows you to retry the call on error without extending
        # the HIT multiple times. This is useful in cases such as network timeouts where it is unclear whether
        # or not the call succeeded on the server. If the extend HIT already exists in the system from a
        # previous call using the same UniqueRequestToken , subsequent calls will return an error with a
        # message containing the request ID.

        @[JSON::Field(key: "UniqueRequestToken")]
        getter unique_request_token : String?

        def initialize(
          @hit_id : String,
          @number_of_additional_assignments : Int32,
          @unique_request_token : String? = nil
        )
        end
      end


      struct CreateAdditionalAssignmentsForHITResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CreateHITRequest
        include JSON::Serializable

        # The amount of time, in seconds, that a Worker has to complete the HIT after accepting it. If a
        # Worker does not complete the assignment within the specified duration, the assignment is considered
        # abandoned. If the HIT is still active (that is, its lifetime has not elapsed), the assignment
        # becomes available for other users to find and accept.

        @[JSON::Field(key: "AssignmentDurationInSeconds")]
        getter assignment_duration_in_seconds : Int64

        # A general description of the HIT. A description includes detailed information about the kind of task
        # the HIT contains. On the Amazon Mechanical Turk web site, the HIT description appears in the
        # expanded view of search results, and in the HIT and assignment screens. A good description gives the
        # user enough information to evaluate the HIT before accepting it.

        @[JSON::Field(key: "Description")]
        getter description : String

        # An amount of time, in seconds, after which the HIT is no longer available for users to accept. After
        # the lifetime of the HIT elapses, the HIT no longer appears in HIT searches, even if not all of the
        # assignments for the HIT have been accepted.

        @[JSON::Field(key: "LifetimeInSeconds")]
        getter lifetime_in_seconds : Int64

        # The amount of money the Requester will pay a Worker for successfully completing the HIT.

        @[JSON::Field(key: "Reward")]
        getter reward : String

        # The title of the HIT. A title should be short and descriptive about the kind of task the HIT
        # contains. On the Amazon Mechanical Turk web site, the HIT title appears in search results, and
        # everywhere the HIT is mentioned.

        @[JSON::Field(key: "Title")]
        getter title : String

        # The Assignment-level Review Policy applies to the assignments under the HIT. You can specify for
        # Mechanical Turk to take various actions based on the policy.

        @[JSON::Field(key: "AssignmentReviewPolicy")]
        getter assignment_review_policy : Types::ReviewPolicy?

        # The number of seconds after an assignment for the HIT has been submitted, after which the assignment
        # is considered Approved automatically unless the Requester explicitly rejects it.

        @[JSON::Field(key: "AutoApprovalDelayInSeconds")]
        getter auto_approval_delay_in_seconds : Int64?

        # The HITLayoutId allows you to use a pre-existing HIT design with placeholder values and create an
        # additional HIT by providing those values as HITLayoutParameters. Constraints: Either a Question
        # parameter or a HITLayoutId parameter must be provided.

        @[JSON::Field(key: "HITLayoutId")]
        getter hit_layout_id : String?

        # If the HITLayoutId is provided, any placeholder values must be filled in with values using the
        # HITLayoutParameter structure. For more information, see HITLayout.

        @[JSON::Field(key: "HITLayoutParameters")]
        getter hit_layout_parameters : Array(Types::HITLayoutParameter)?

        # The HIT-level Review Policy applies to the HIT. You can specify for Mechanical Turk to take various
        # actions based on the policy.

        @[JSON::Field(key: "HITReviewPolicy")]
        getter hit_review_policy : Types::ReviewPolicy?

        # One or more words or phrases that describe the HIT, separated by commas. These words are used in
        # searches to find HITs.

        @[JSON::Field(key: "Keywords")]
        getter keywords : String?

        # The number of times the HIT can be accepted and completed before the HIT becomes unavailable.

        @[JSON::Field(key: "MaxAssignments")]
        getter max_assignments : Int32?

        # Conditions that a Worker's Qualifications must meet in order to accept the HIT. A HIT can have
        # between zero and ten Qualification requirements. All requirements must be met in order for a Worker
        # to accept the HIT. Additionally, other actions can be restricted using the ActionsGuarded field on
        # each QualificationRequirement structure.

        @[JSON::Field(key: "QualificationRequirements")]
        getter qualification_requirements : Array(Types::QualificationRequirement)?

        # The data the person completing the HIT uses to produce the results. Constraints: Must be a
        # QuestionForm data structure, an ExternalQuestion data structure, or an HTMLQuestion data structure.
        # The XML question data must not be larger than 64 kilobytes (65,535 bytes) in size, including
        # whitespace. Either a Question parameter or a HITLayoutId parameter must be provided.

        @[JSON::Field(key: "Question")]
        getter question : String?

        # An arbitrary data field. The RequesterAnnotation parameter lets your application attach arbitrary
        # data to the HIT for tracking purposes. For example, this parameter could be an identifier internal
        # to the Requester's application that corresponds with the HIT. The RequesterAnnotation parameter for
        # a HIT is only visible to the Requester who created the HIT. It is not shown to the Worker, or any
        # other Requester. The RequesterAnnotation parameter may be different for each HIT you submit. It does
        # not affect how your HITs are grouped.

        @[JSON::Field(key: "RequesterAnnotation")]
        getter requester_annotation : String?

        # A unique identifier for this request which allows you to retry the call on error without creating
        # duplicate HITs. This is useful in cases such as network timeouts where it is unclear whether or not
        # the call succeeded on the server. If the HIT already exists in the system from a previous call using
        # the same UniqueRequestToken, subsequent calls will return a AWS.MechanicalTurk.HitAlreadyExists
        # error with a message containing the HITId. Note: It is your responsibility to ensure uniqueness of
        # the token. The unique token expires after 24 hours. Subsequent calls using the same
        # UniqueRequestToken made after the 24 hour limit could create duplicate HITs.

        @[JSON::Field(key: "UniqueRequestToken")]
        getter unique_request_token : String?

        def initialize(
          @assignment_duration_in_seconds : Int64,
          @description : String,
          @lifetime_in_seconds : Int64,
          @reward : String,
          @title : String,
          @assignment_review_policy : Types::ReviewPolicy? = nil,
          @auto_approval_delay_in_seconds : Int64? = nil,
          @hit_layout_id : String? = nil,
          @hit_layout_parameters : Array(Types::HITLayoutParameter)? = nil,
          @hit_review_policy : Types::ReviewPolicy? = nil,
          @keywords : String? = nil,
          @max_assignments : Int32? = nil,
          @qualification_requirements : Array(Types::QualificationRequirement)? = nil,
          @question : String? = nil,
          @requester_annotation : String? = nil,
          @unique_request_token : String? = nil
        )
        end
      end


      struct CreateHITResponse
        include JSON::Serializable

        # Contains the newly created HIT data. For a description of the HIT data structure as it appears in
        # responses, see the HIT Data Structure documentation.

        @[JSON::Field(key: "HIT")]
        getter hit : Types::HIT?

        def initialize(
          @hit : Types::HIT? = nil
        )
        end
      end


      struct CreateHITTypeRequest
        include JSON::Serializable

        # The amount of time, in seconds, that a Worker has to complete the HIT after accepting it. If a
        # Worker does not complete the assignment within the specified duration, the assignment is considered
        # abandoned. If the HIT is still active (that is, its lifetime has not elapsed), the assignment
        # becomes available for other users to find and accept.

        @[JSON::Field(key: "AssignmentDurationInSeconds")]
        getter assignment_duration_in_seconds : Int64

        # A general description of the HIT. A description includes detailed information about the kind of task
        # the HIT contains. On the Amazon Mechanical Turk web site, the HIT description appears in the
        # expanded view of search results, and in the HIT and assignment screens. A good description gives the
        # user enough information to evaluate the HIT before accepting it.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The amount of money the Requester will pay a Worker for successfully completing the HIT.

        @[JSON::Field(key: "Reward")]
        getter reward : String

        # The title of the HIT. A title should be short and descriptive about the kind of task the HIT
        # contains. On the Amazon Mechanical Turk web site, the HIT title appears in search results, and
        # everywhere the HIT is mentioned.

        @[JSON::Field(key: "Title")]
        getter title : String

        # The number of seconds after an assignment for the HIT has been submitted, after which the assignment
        # is considered Approved automatically unless the Requester explicitly rejects it.

        @[JSON::Field(key: "AutoApprovalDelayInSeconds")]
        getter auto_approval_delay_in_seconds : Int64?

        # One or more words or phrases that describe the HIT, separated by commas. These words are used in
        # searches to find HITs.

        @[JSON::Field(key: "Keywords")]
        getter keywords : String?

        # Conditions that a Worker's Qualifications must meet in order to accept the HIT. A HIT can have
        # between zero and ten Qualification requirements. All requirements must be met in order for a Worker
        # to accept the HIT. Additionally, other actions can be restricted using the ActionsGuarded field on
        # each QualificationRequirement structure.

        @[JSON::Field(key: "QualificationRequirements")]
        getter qualification_requirements : Array(Types::QualificationRequirement)?

        def initialize(
          @assignment_duration_in_seconds : Int64,
          @description : String,
          @reward : String,
          @title : String,
          @auto_approval_delay_in_seconds : Int64? = nil,
          @keywords : String? = nil,
          @qualification_requirements : Array(Types::QualificationRequirement)? = nil
        )
        end
      end


      struct CreateHITTypeResponse
        include JSON::Serializable

        # The ID of the newly registered HIT type.

        @[JSON::Field(key: "HITTypeId")]
        getter hit_type_id : String?

        def initialize(
          @hit_type_id : String? = nil
        )
        end
      end


      struct CreateHITWithHITTypeRequest
        include JSON::Serializable

        # The HIT type ID you want to create this HIT with.

        @[JSON::Field(key: "HITTypeId")]
        getter hit_type_id : String

        # An amount of time, in seconds, after which the HIT is no longer available for users to accept. After
        # the lifetime of the HIT elapses, the HIT no longer appears in HIT searches, even if not all of the
        # assignments for the HIT have been accepted.

        @[JSON::Field(key: "LifetimeInSeconds")]
        getter lifetime_in_seconds : Int64

        # The Assignment-level Review Policy applies to the assignments under the HIT. You can specify for
        # Mechanical Turk to take various actions based on the policy.

        @[JSON::Field(key: "AssignmentReviewPolicy")]
        getter assignment_review_policy : Types::ReviewPolicy?

        # The HITLayoutId allows you to use a pre-existing HIT design with placeholder values and create an
        # additional HIT by providing those values as HITLayoutParameters. Constraints: Either a Question
        # parameter or a HITLayoutId parameter must be provided.

        @[JSON::Field(key: "HITLayoutId")]
        getter hit_layout_id : String?

        # If the HITLayoutId is provided, any placeholder values must be filled in with values using the
        # HITLayoutParameter structure. For more information, see HITLayout.

        @[JSON::Field(key: "HITLayoutParameters")]
        getter hit_layout_parameters : Array(Types::HITLayoutParameter)?

        # The HIT-level Review Policy applies to the HIT. You can specify for Mechanical Turk to take various
        # actions based on the policy.

        @[JSON::Field(key: "HITReviewPolicy")]
        getter hit_review_policy : Types::ReviewPolicy?

        # The number of times the HIT can be accepted and completed before the HIT becomes unavailable.

        @[JSON::Field(key: "MaxAssignments")]
        getter max_assignments : Int32?

        # The data the person completing the HIT uses to produce the results. Constraints: Must be a
        # QuestionForm data structure, an ExternalQuestion data structure, or an HTMLQuestion data structure.
        # The XML question data must not be larger than 64 kilobytes (65,535 bytes) in size, including
        # whitespace. Either a Question parameter or a HITLayoutId parameter must be provided.

        @[JSON::Field(key: "Question")]
        getter question : String?

        # An arbitrary data field. The RequesterAnnotation parameter lets your application attach arbitrary
        # data to the HIT for tracking purposes. For example, this parameter could be an identifier internal
        # to the Requester's application that corresponds with the HIT. The RequesterAnnotation parameter for
        # a HIT is only visible to the Requester who created the HIT. It is not shown to the Worker, or any
        # other Requester. The RequesterAnnotation parameter may be different for each HIT you submit. It does
        # not affect how your HITs are grouped.

        @[JSON::Field(key: "RequesterAnnotation")]
        getter requester_annotation : String?

        # A unique identifier for this request which allows you to retry the call on error without creating
        # duplicate HITs. This is useful in cases such as network timeouts where it is unclear whether or not
        # the call succeeded on the server. If the HIT already exists in the system from a previous call using
        # the same UniqueRequestToken, subsequent calls will return a AWS.MechanicalTurk.HitAlreadyExists
        # error with a message containing the HITId. Note: It is your responsibility to ensure uniqueness of
        # the token. The unique token expires after 24 hours. Subsequent calls using the same
        # UniqueRequestToken made after the 24 hour limit could create duplicate HITs.

        @[JSON::Field(key: "UniqueRequestToken")]
        getter unique_request_token : String?

        def initialize(
          @hit_type_id : String,
          @lifetime_in_seconds : Int64,
          @assignment_review_policy : Types::ReviewPolicy? = nil,
          @hit_layout_id : String? = nil,
          @hit_layout_parameters : Array(Types::HITLayoutParameter)? = nil,
          @hit_review_policy : Types::ReviewPolicy? = nil,
          @max_assignments : Int32? = nil,
          @question : String? = nil,
          @requester_annotation : String? = nil,
          @unique_request_token : String? = nil
        )
        end
      end


      struct CreateHITWithHITTypeResponse
        include JSON::Serializable

        # Contains the newly created HIT data. For a description of the HIT data structure as it appears in
        # responses, see the HIT Data Structure documentation.

        @[JSON::Field(key: "HIT")]
        getter hit : Types::HIT?

        def initialize(
          @hit : Types::HIT? = nil
        )
        end
      end


      struct CreateQualificationTypeRequest
        include JSON::Serializable

        # A long description for the Qualification type. On the Amazon Mechanical Turk website, the long
        # description is displayed when a Worker examines a Qualification type.

        @[JSON::Field(key: "Description")]
        getter description : String

        # The name you give to the Qualification type. The type name is used to represent the Qualification to
        # Workers, and to find the type using a Qualification type search. It must be unique across all of
        # your Qualification types.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The initial status of the Qualification type. Constraints: Valid values are: Active | Inactive

        @[JSON::Field(key: "QualificationTypeStatus")]
        getter qualification_type_status : String

        # The answers to the Qualification test specified in the Test parameter, in the form of an AnswerKey
        # data structure. Constraints: Must not be longer than 65535 bytes. Constraints: None. If not
        # specified, you must process Qualification requests manually.

        @[JSON::Field(key: "AnswerKey")]
        getter answer_key : String?

        # Specifies whether requests for the Qualification type are granted immediately, without prompting the
        # Worker with a Qualification test. Constraints: If the Test parameter is specified, this parameter
        # cannot be true.

        @[JSON::Field(key: "AutoGranted")]
        getter auto_granted : Bool?

        # The Qualification value to use for automatically granted Qualifications. This parameter is used only
        # if the AutoGranted parameter is true.

        @[JSON::Field(key: "AutoGrantedValue")]
        getter auto_granted_value : Int32?

        # One or more words or phrases that describe the Qualification type, separated by commas. The keywords
        # of a type make the type easier to find during a search.

        @[JSON::Field(key: "Keywords")]
        getter keywords : String?

        # The number of seconds that a Worker must wait after requesting a Qualification of the Qualification
        # type before the worker can retry the Qualification request. Constraints: None. If not specified,
        # retries are disabled and Workers can request a Qualification of this type only once, even if the
        # Worker has not been granted the Qualification. It is not possible to disable retries for a
        # Qualification type after it has been created with retries enabled. If you want to disable retries,
        # you must delete existing retry-enabled Qualification type and then create a new Qualification type
        # with retries disabled.

        @[JSON::Field(key: "RetryDelayInSeconds")]
        getter retry_delay_in_seconds : Int64?

        # The questions for the Qualification test a Worker must answer correctly to obtain a Qualification of
        # this type. If this parameter is specified, TestDurationInSeconds must also be specified.
        # Constraints: Must not be longer than 65535 bytes. Must be a QuestionForm data structure. This
        # parameter cannot be specified if AutoGranted is true. Constraints: None. If not specified, the
        # Worker may request the Qualification without answering any questions.

        @[JSON::Field(key: "Test")]
        getter test : String?

        # The number of seconds the Worker has to complete the Qualification test, starting from the time the
        # Worker requests the Qualification.

        @[JSON::Field(key: "TestDurationInSeconds")]
        getter test_duration_in_seconds : Int64?

        def initialize(
          @description : String,
          @name : String,
          @qualification_type_status : String,
          @answer_key : String? = nil,
          @auto_granted : Bool? = nil,
          @auto_granted_value : Int32? = nil,
          @keywords : String? = nil,
          @retry_delay_in_seconds : Int64? = nil,
          @test : String? = nil,
          @test_duration_in_seconds : Int64? = nil
        )
        end
      end


      struct CreateQualificationTypeResponse
        include JSON::Serializable

        # The created Qualification type, returned as a QualificationType data structure.

        @[JSON::Field(key: "QualificationType")]
        getter qualification_type : Types::QualificationType?

        def initialize(
          @qualification_type : Types::QualificationType? = nil
        )
        end
      end


      struct CreateWorkerBlockRequest
        include JSON::Serializable

        # A message explaining the reason for blocking the Worker. This parameter enables you to keep track of
        # your Workers. The Worker does not see this message.

        @[JSON::Field(key: "Reason")]
        getter reason : String

        # The ID of the Worker to block.

        @[JSON::Field(key: "WorkerId")]
        getter worker_id : String

        def initialize(
          @reason : String,
          @worker_id : String
        )
        end
      end


      struct CreateWorkerBlockResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteHITRequest
        include JSON::Serializable

        # The ID of the HIT to be deleted.

        @[JSON::Field(key: "HITId")]
        getter hit_id : String

        def initialize(
          @hit_id : String
        )
        end
      end


      struct DeleteHITResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteQualificationTypeRequest
        include JSON::Serializable

        # The ID of the QualificationType to dispose.

        @[JSON::Field(key: "QualificationTypeId")]
        getter qualification_type_id : String

        def initialize(
          @qualification_type_id : String
        )
        end
      end


      struct DeleteQualificationTypeResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteWorkerBlockRequest
        include JSON::Serializable

        # The ID of the Worker to unblock.

        @[JSON::Field(key: "WorkerId")]
        getter worker_id : String

        # A message that explains the reason for unblocking the Worker. The Worker does not see this message.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @worker_id : String,
          @reason : String? = nil
        )
        end
      end


      struct DeleteWorkerBlockResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateQualificationFromWorkerRequest
        include JSON::Serializable

        # The ID of the Qualification type of the Qualification to be revoked.

        @[JSON::Field(key: "QualificationTypeId")]
        getter qualification_type_id : String

        # The ID of the Worker who possesses the Qualification to be revoked.

        @[JSON::Field(key: "WorkerId")]
        getter worker_id : String

        # A text message that explains why the Qualification was revoked. The user who had the Qualification
        # sees this message.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @qualification_type_id : String,
          @worker_id : String,
          @reason : String? = nil
        )
        end
      end


      struct DisassociateQualificationFromWorkerResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct GetAccountBalanceRequest
        include JSON::Serializable

        def initialize
        end
      end


      struct GetAccountBalanceResponse
        include JSON::Serializable


        @[JSON::Field(key: "AvailableBalance")]
        getter available_balance : String?


        @[JSON::Field(key: "OnHoldBalance")]
        getter on_hold_balance : String?

        def initialize(
          @available_balance : String? = nil,
          @on_hold_balance : String? = nil
        )
        end
      end


      struct GetAssignmentRequest
        include JSON::Serializable

        # The ID of the Assignment to be retrieved.

        @[JSON::Field(key: "AssignmentId")]
        getter assignment_id : String

        def initialize(
          @assignment_id : String
        )
        end
      end


      struct GetAssignmentResponse
        include JSON::Serializable

        # The assignment. The response includes one Assignment element.

        @[JSON::Field(key: "Assignment")]
        getter assignment : Types::Assignment?

        # The HIT associated with this assignment. The response includes one HIT element.

        @[JSON::Field(key: "HIT")]
        getter hit : Types::HIT?

        def initialize(
          @assignment : Types::Assignment? = nil,
          @hit : Types::HIT? = nil
        )
        end
      end


      struct GetFileUploadURLRequest
        include JSON::Serializable

        # The ID of the assignment that contains the question with a FileUploadAnswer.

        @[JSON::Field(key: "AssignmentId")]
        getter assignment_id : String

        # The identifier of the question with a FileUploadAnswer, as specified in the QuestionForm of the HIT.

        @[JSON::Field(key: "QuestionIdentifier")]
        getter question_identifier : String

        def initialize(
          @assignment_id : String,
          @question_identifier : String
        )
        end
      end


      struct GetFileUploadURLResponse
        include JSON::Serializable

        # A temporary URL for the file that the Worker uploaded for the answer.

        @[JSON::Field(key: "FileUploadURL")]
        getter file_upload_url : String?

        def initialize(
          @file_upload_url : String? = nil
        )
        end
      end


      struct GetHITRequest
        include JSON::Serializable

        # The ID of the HIT to be retrieved.

        @[JSON::Field(key: "HITId")]
        getter hit_id : String

        def initialize(
          @hit_id : String
        )
        end
      end


      struct GetHITResponse
        include JSON::Serializable

        # Contains the requested HIT data.

        @[JSON::Field(key: "HIT")]
        getter hit : Types::HIT?

        def initialize(
          @hit : Types::HIT? = nil
        )
        end
      end


      struct GetQualificationScoreRequest
        include JSON::Serializable

        # The ID of the QualificationType.

        @[JSON::Field(key: "QualificationTypeId")]
        getter qualification_type_id : String

        # The ID of the Worker whose Qualification is being updated.

        @[JSON::Field(key: "WorkerId")]
        getter worker_id : String

        def initialize(
          @qualification_type_id : String,
          @worker_id : String
        )
        end
      end


      struct GetQualificationScoreResponse
        include JSON::Serializable

        # The Qualification data structure of the Qualification assigned to a user, including the
        # Qualification type and the value (score).

        @[JSON::Field(key: "Qualification")]
        getter qualification : Types::Qualification?

        def initialize(
          @qualification : Types::Qualification? = nil
        )
        end
      end


      struct GetQualificationTypeRequest
        include JSON::Serializable

        # The ID of the QualificationType.

        @[JSON::Field(key: "QualificationTypeId")]
        getter qualification_type_id : String

        def initialize(
          @qualification_type_id : String
        )
        end
      end


      struct GetQualificationTypeResponse
        include JSON::Serializable

        # The returned Qualification Type

        @[JSON::Field(key: "QualificationType")]
        getter qualification_type : Types::QualificationType?

        def initialize(
          @qualification_type : Types::QualificationType? = nil
        )
        end
      end

      # The HIT data structure represents a single HIT, including all the information necessary for a Worker
      # to accept and complete the HIT.

      struct HIT
        include JSON::Serializable

        # The length of time, in seconds, that a Worker has to complete the HIT after accepting it.

        @[JSON::Field(key: "AssignmentDurationInSeconds")]
        getter assignment_duration_in_seconds : Int64?

        # The amount of time, in seconds, after the Worker submits an assignment for the HIT that the results
        # are automatically approved by Amazon Mechanical Turk. This is the amount of time the Requester has
        # to reject an assignment submitted by a Worker before the assignment is auto-approved and the Worker
        # is paid.

        @[JSON::Field(key: "AutoApprovalDelayInSeconds")]
        getter auto_approval_delay_in_seconds : Int64?

        # The date and time the HIT was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A general description of the HIT.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The date and time the HIT expires.

        @[JSON::Field(key: "Expiration", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expiration : Time?

        # The ID of the HIT Group of this HIT.

        @[JSON::Field(key: "HITGroupId")]
        getter hit_group_id : String?

        # A unique identifier for the HIT.

        @[JSON::Field(key: "HITId")]
        getter hit_id : String?

        # The ID of the HIT Layout of this HIT.

        @[JSON::Field(key: "HITLayoutId")]
        getter hit_layout_id : String?

        # Indicates the review status of the HIT. Valid Values are NotReviewed | MarkedForReview |
        # ReviewedAppropriate | ReviewedInappropriate.

        @[JSON::Field(key: "HITReviewStatus")]
        getter hit_review_status : String?

        # The status of the HIT and its assignments. Valid Values are Assignable | Unassignable | Reviewable |
        # Reviewing | Disposed.

        @[JSON::Field(key: "HITStatus")]
        getter hit_status : String?

        # The ID of the HIT type of this HIT

        @[JSON::Field(key: "HITTypeId")]
        getter hit_type_id : String?

        # One or more words or phrases that describe the HIT, separated by commas. Search terms similar to the
        # keywords of a HIT are more likely to have the HIT in the search results.

        @[JSON::Field(key: "Keywords")]
        getter keywords : String?

        # The number of times the HIT can be accepted and completed before the HIT becomes unavailable.

        @[JSON::Field(key: "MaxAssignments")]
        getter max_assignments : Int32?

        # The number of assignments for this HIT that are available for Workers to accept.

        @[JSON::Field(key: "NumberOfAssignmentsAvailable")]
        getter number_of_assignments_available : Int32?

        # The number of assignments for this HIT that have been approved or rejected.

        @[JSON::Field(key: "NumberOfAssignmentsCompleted")]
        getter number_of_assignments_completed : Int32?

        # The number of assignments for this HIT that are being previewed or have been accepted by Workers,
        # but have not yet been submitted, returned, or abandoned.

        @[JSON::Field(key: "NumberOfAssignmentsPending")]
        getter number_of_assignments_pending : Int32?

        # Conditions that a Worker's Qualifications must meet in order to accept the HIT. A HIT can have
        # between zero and ten Qualification requirements. All requirements must be met in order for a Worker
        # to accept the HIT. Additionally, other actions can be restricted using the ActionsGuarded field on
        # each QualificationRequirement structure.

        @[JSON::Field(key: "QualificationRequirements")]
        getter qualification_requirements : Array(Types::QualificationRequirement)?

        # The data the Worker completing the HIT uses produce the results. This is either either a
        # QuestionForm, HTMLQuestion or an ExternalQuestion data structure.

        @[JSON::Field(key: "Question")]
        getter question : String?

        # An arbitrary data field the Requester who created the HIT can use. This field is visible only to the
        # creator of the HIT.

        @[JSON::Field(key: "RequesterAnnotation")]
        getter requester_annotation : String?


        @[JSON::Field(key: "Reward")]
        getter reward : String?

        # The title of the HIT.

        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @assignment_duration_in_seconds : Int64? = nil,
          @auto_approval_delay_in_seconds : Int64? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @expiration : Time? = nil,
          @hit_group_id : String? = nil,
          @hit_id : String? = nil,
          @hit_layout_id : String? = nil,
          @hit_review_status : String? = nil,
          @hit_status : String? = nil,
          @hit_type_id : String? = nil,
          @keywords : String? = nil,
          @max_assignments : Int32? = nil,
          @number_of_assignments_available : Int32? = nil,
          @number_of_assignments_completed : Int32? = nil,
          @number_of_assignments_pending : Int32? = nil,
          @qualification_requirements : Array(Types::QualificationRequirement)? = nil,
          @question : String? = nil,
          @requester_annotation : String? = nil,
          @reward : String? = nil,
          @title : String? = nil
        )
        end
      end

      # The HITLayoutParameter data structure defines parameter values used with a HITLayout. A HITLayout is
      # a reusable Amazon Mechanical Turk project template used to provide Human Intelligence Task (HIT)
      # question data for CreateHIT.

      struct HITLayoutParameter
        include JSON::Serializable

        # The name of the parameter in the HITLayout.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The value substituted for the parameter referenced in the HITLayout.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end


      struct ListAssignmentsForHITRequest
        include JSON::Serializable

        # The ID of the HIT.

        @[JSON::Field(key: "HITId")]
        getter hit_id : String

        # The status of the assignments to return: Submitted | Approved | Rejected

        @[JSON::Field(key: "AssignmentStatuses")]
        getter assignment_statuses : Array(String)?


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagination token

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @hit_id : String,
          @assignment_statuses : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssignmentsForHITResponse
        include JSON::Serializable

        # The collection of Assignment data structures returned by this call.

        @[JSON::Field(key: "Assignments")]
        getter assignments : Array(Types::Assignment)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of assignments on the page in the filtered results list, equivalent to the number of
        # assignments returned by this call.

        @[JSON::Field(key: "NumResults")]
        getter num_results : Int32?

        def initialize(
          @assignments : Array(Types::Assignment)? = nil,
          @next_token : String? = nil,
          @num_results : Int32? = nil
        )
        end
      end


      struct ListBonusPaymentsRequest
        include JSON::Serializable

        # The ID of the assignment associated with the bonus payments to retrieve. If specified, only bonus
        # payments for the given assignment are returned. Either the HITId parameter or the AssignmentId
        # parameter must be specified

        @[JSON::Field(key: "AssignmentId")]
        getter assignment_id : String?

        # The ID of the HIT associated with the bonus payments to retrieve. If not specified, all bonus
        # payments for all assignments for the given HIT are returned. Either the HITId parameter or the
        # AssignmentId parameter must be specified

        @[JSON::Field(key: "HITId")]
        getter hit_id : String?


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagination token

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @assignment_id : String? = nil,
          @hit_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListBonusPaymentsResponse
        include JSON::Serializable

        # A successful request to the ListBonusPayments operation returns a list of BonusPayment objects.

        @[JSON::Field(key: "BonusPayments")]
        getter bonus_payments : Array(Types::BonusPayment)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of bonus payments on this page in the filtered results list, equivalent to the number of
        # bonus payments being returned by this call.

        @[JSON::Field(key: "NumResults")]
        getter num_results : Int32?

        def initialize(
          @bonus_payments : Array(Types::BonusPayment)? = nil,
          @next_token : String? = nil,
          @num_results : Int32? = nil
        )
        end
      end


      struct ListHITsForQualificationTypeRequest
        include JSON::Serializable

        # The ID of the Qualification type to use when querying HITs.

        @[JSON::Field(key: "QualificationTypeId")]
        getter qualification_type_id : String

        # Limit the number of results returned.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagination Token

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @qualification_type_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListHITsForQualificationTypeResponse
        include JSON::Serializable

        # The list of HIT elements returned by the query.

        @[JSON::Field(key: "HITs")]
        getter hi_ts : Array(Types::HIT)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of HITs on this page in the filtered results list, equivalent to the number of HITs being
        # returned by this call.

        @[JSON::Field(key: "NumResults")]
        getter num_results : Int32?

        def initialize(
          @hi_ts : Array(Types::HIT)? = nil,
          @next_token : String? = nil,
          @num_results : Int32? = nil
        )
        end
      end


      struct ListHITsRequest
        include JSON::Serializable


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagination token

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListHITsResponse
        include JSON::Serializable

        # The list of HIT elements returned by the query.

        @[JSON::Field(key: "HITs")]
        getter hi_ts : Array(Types::HIT)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of HITs on this page in the filtered results list, equivalent to the number of HITs being
        # returned by this call.

        @[JSON::Field(key: "NumResults")]
        getter num_results : Int32?

        def initialize(
          @hi_ts : Array(Types::HIT)? = nil,
          @next_token : String? = nil,
          @num_results : Int32? = nil
        )
        end
      end


      struct ListQualificationRequestsRequest
        include JSON::Serializable

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ID of the QualificationType.

        @[JSON::Field(key: "QualificationTypeId")]
        getter qualification_type_id : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @qualification_type_id : String? = nil
        )
        end
      end


      struct ListQualificationRequestsResponse
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of Qualification requests on this page in the filtered results list, equivalent to the
        # number of Qualification requests being returned by this call.

        @[JSON::Field(key: "NumResults")]
        getter num_results : Int32?

        # The Qualification request. The response includes one QualificationRequest element for each
        # Qualification request returned by the query.

        @[JSON::Field(key: "QualificationRequests")]
        getter qualification_requests : Array(Types::QualificationRequest)?

        def initialize(
          @next_token : String? = nil,
          @num_results : Int32? = nil,
          @qualification_requests : Array(Types::QualificationRequest)? = nil
        )
        end
      end


      struct ListQualificationTypesRequest
        include JSON::Serializable

        # Specifies that only Qualification types that a user can request through the Amazon Mechanical Turk
        # web site, such as by taking a Qualification test, are returned as results of the search. Some
        # Qualification types, such as those assigned automatically by the system, cannot be requested
        # directly by users. If false, all Qualification types, including those managed by the system, are
        # considered. Valid values are True | False.

        @[JSON::Field(key: "MustBeRequestable")]
        getter must_be_requestable : Bool

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specifies that only Qualification types that the Requester created are returned. If false, the
        # operation returns all Qualification types.

        @[JSON::Field(key: "MustBeOwnedByCaller")]
        getter must_be_owned_by_caller : Bool?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A text query against all of the searchable attributes of Qualification types.

        @[JSON::Field(key: "Query")]
        getter query : String?

        def initialize(
          @must_be_requestable : Bool,
          @max_results : Int32? = nil,
          @must_be_owned_by_caller : Bool? = nil,
          @next_token : String? = nil,
          @query : String? = nil
        )
        end
      end


      struct ListQualificationTypesResponse
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of Qualification types on this page in the filtered results list, equivalent to the
        # number of types this operation returns.

        @[JSON::Field(key: "NumResults")]
        getter num_results : Int32?

        # The list of QualificationType elements returned by the query.

        @[JSON::Field(key: "QualificationTypes")]
        getter qualification_types : Array(Types::QualificationType)?

        def initialize(
          @next_token : String? = nil,
          @num_results : Int32? = nil,
          @qualification_types : Array(Types::QualificationType)? = nil
        )
        end
      end


      struct ListReviewPolicyResultsForHITRequest
        include JSON::Serializable

        # The unique identifier of the HIT to retrieve review results for.

        @[JSON::Field(key: "HITId")]
        getter hit_id : String

        # Limit the number of results returned.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagination token

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The Policy Level(s) to retrieve review results for - HIT or Assignment. If omitted, the default
        # behavior is to retrieve all data for both policy levels. For a list of all the described policies,
        # see Review Policies.

        @[JSON::Field(key: "PolicyLevels")]
        getter policy_levels : Array(String)?

        # Specify if the operation should retrieve a list of the actions taken executing the Review Policies
        # and their outcomes.

        @[JSON::Field(key: "RetrieveActions")]
        getter retrieve_actions : Bool?

        # Specify if the operation should retrieve a list of the results computed by the Review Policies.

        @[JSON::Field(key: "RetrieveResults")]
        getter retrieve_results : Bool?

        def initialize(
          @hit_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @policy_levels : Array(String)? = nil,
          @retrieve_actions : Bool? = nil,
          @retrieve_results : Bool? = nil
        )
        end
      end


      struct ListReviewPolicyResultsForHITResponse
        include JSON::Serializable

        # The name of the Assignment-level Review Policy. This contains only the PolicyName element.

        @[JSON::Field(key: "AssignmentReviewPolicy")]
        getter assignment_review_policy : Types::ReviewPolicy?

        # Contains both ReviewResult and ReviewAction elements for an Assignment.

        @[JSON::Field(key: "AssignmentReviewReport")]
        getter assignment_review_report : Types::ReviewReport?

        # The HITId of the HIT for which results have been returned.

        @[JSON::Field(key: "HITId")]
        getter hit_id : String?

        # The name of the HIT-level Review Policy. This contains only the PolicyName element.

        @[JSON::Field(key: "HITReviewPolicy")]
        getter hit_review_policy : Types::ReviewPolicy?

        # Contains both ReviewResult and ReviewAction elements for a particular HIT.

        @[JSON::Field(key: "HITReviewReport")]
        getter hit_review_report : Types::ReviewReport?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @assignment_review_policy : Types::ReviewPolicy? = nil,
          @assignment_review_report : Types::ReviewReport? = nil,
          @hit_id : String? = nil,
          @hit_review_policy : Types::ReviewPolicy? = nil,
          @hit_review_report : Types::ReviewReport? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListReviewableHITsRequest
        include JSON::Serializable

        # The ID of the HIT type of the HITs to consider for the query. If not specified, all HITs for the
        # Reviewer are considered

        @[JSON::Field(key: "HITTypeId")]
        getter hit_type_id : String?

        # Limit the number of results returned.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagination Token

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Can be either Reviewable or Reviewing . Reviewable is the default value.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @hit_type_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListReviewableHITsResponse
        include JSON::Serializable

        # The list of HIT elements returned by the query.

        @[JSON::Field(key: "HITs")]
        getter hi_ts : Array(Types::HIT)?


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of HITs on this page in the filtered results list, equivalent to the number of HITs being
        # returned by this call.

        @[JSON::Field(key: "NumResults")]
        getter num_results : Int32?

        def initialize(
          @hi_ts : Array(Types::HIT)? = nil,
          @next_token : String? = nil,
          @num_results : Int32? = nil
        )
        end
      end


      struct ListWorkerBlocksRequest
        include JSON::Serializable


        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagination token

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWorkerBlocksResponse
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of assignments on the page in the filtered results list, equivalent to the number of
        # assignments returned by this call.

        @[JSON::Field(key: "NumResults")]
        getter num_results : Int32?

        # The list of WorkerBlocks, containing the collection of Worker IDs and reasons for blocking.

        @[JSON::Field(key: "WorkerBlocks")]
        getter worker_blocks : Array(Types::WorkerBlock)?

        def initialize(
          @next_token : String? = nil,
          @num_results : Int32? = nil,
          @worker_blocks : Array(Types::WorkerBlock)? = nil
        )
        end
      end


      struct ListWorkersWithQualificationTypeRequest
        include JSON::Serializable

        # The ID of the Qualification type of the Qualifications to return.

        @[JSON::Field(key: "QualificationTypeId")]
        getter qualification_type_id : String

        # Limit the number of results returned.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagination Token

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The status of the Qualifications to return. Can be Granted | Revoked .

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @qualification_type_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListWorkersWithQualificationTypeResponse
        include JSON::Serializable


        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of Qualifications on this page in the filtered results list, equivalent to the number of
        # Qualifications being returned by this call.

        @[JSON::Field(key: "NumResults")]
        getter num_results : Int32?

        # The list of Qualification elements returned by this call.

        @[JSON::Field(key: "Qualifications")]
        getter qualifications : Array(Types::Qualification)?

        def initialize(
          @next_token : String? = nil,
          @num_results : Int32? = nil,
          @qualifications : Array(Types::Qualification)? = nil
        )
        end
      end

      # The Locale data structure represents a geographical region or location.

      struct Locale
        include JSON::Serializable

        # The country of the locale. Must be a valid ISO 3166 country code. For example, the code US refers to
        # the United States of America.

        @[JSON::Field(key: "Country")]
        getter country : String

        # The state or subdivision of the locale. A valid ISO 3166-2 subdivision code. For example, the code
        # WA refers to the state of Washington.

        @[JSON::Field(key: "Subdivision")]
        getter subdivision : String?

        def initialize(
          @country : String,
          @subdivision : String? = nil
        )
        end
      end

      # The NotificationSpecification data structure describes a HIT event notification for a HIT type.

      struct NotificationSpecification
        include JSON::Serializable

        # The target for notification messages. The Destination’s format is determined by the specified
        # Transport: When Transport is Email, the Destination is your email address. When Transport is SQS,
        # the Destination is your queue URL. When Transport is SNS, the Destination is the ARN of your topic.

        @[JSON::Field(key: "Destination")]
        getter destination : String

        # The list of events that should cause notifications to be sent. Valid Values: AssignmentAccepted |
        # AssignmentAbandoned | AssignmentReturned | AssignmentSubmitted | AssignmentRejected |
        # AssignmentApproved | HITCreated | HITExtended | HITDisposed | HITReviewable | HITExpired | Ping. The
        # Ping event is only valid for the SendTestEventNotification operation.

        @[JSON::Field(key: "EventTypes")]
        getter event_types : Array(String)

        # The method Amazon Mechanical Turk uses to send the notification. Valid Values: Email | SQS | SNS.

        @[JSON::Field(key: "Transport")]
        getter transport : String

        # The version of the Notification API to use. Valid value is 2006-05-05.

        @[JSON::Field(key: "Version")]
        getter version : String

        def initialize(
          @destination : String,
          @event_types : Array(String),
          @transport : String,
          @version : String
        )
        end
      end

      # When MTurk encounters an issue with notifying the Workers you specified, it returns back this object
      # with failure details.

      struct NotifyWorkersFailureStatus
        include JSON::Serializable

        # Encoded value for the failure type.

        @[JSON::Field(key: "NotifyWorkersFailureCode")]
        getter notify_workers_failure_code : String?

        # A message detailing the reason the Worker could not be notified.

        @[JSON::Field(key: "NotifyWorkersFailureMessage")]
        getter notify_workers_failure_message : String?

        # The ID of the Worker.

        @[JSON::Field(key: "WorkerId")]
        getter worker_id : String?

        def initialize(
          @notify_workers_failure_code : String? = nil,
          @notify_workers_failure_message : String? = nil,
          @worker_id : String? = nil
        )
        end
      end


      struct NotifyWorkersRequest
        include JSON::Serializable

        # The text of the email message to send. Can include up to 4,096 characters

        @[JSON::Field(key: "MessageText")]
        getter message_text : String

        # The subject line of the email message to send. Can include up to 200 characters.

        @[JSON::Field(key: "Subject")]
        getter subject : String

        # A list of Worker IDs you wish to notify. You can notify upto 100 Workers at a time.

        @[JSON::Field(key: "WorkerIds")]
        getter worker_ids : Array(String)

        def initialize(
          @message_text : String,
          @subject : String,
          @worker_ids : Array(String)
        )
        end
      end


      struct NotifyWorkersResponse
        include JSON::Serializable

        # When MTurk sends notifications to the list of Workers, it returns back any failures it encounters in
        # this list of NotifyWorkersFailureStatus objects.

        @[JSON::Field(key: "NotifyWorkersFailureStatuses")]
        getter notify_workers_failure_statuses : Array(Types::NotifyWorkersFailureStatus)?

        def initialize(
          @notify_workers_failure_statuses : Array(Types::NotifyWorkersFailureStatus)? = nil
        )
        end
      end

      # This data structure is the data type for the AnswerKey parameter of the
      # ScoreMyKnownAnswers/2011-09-01 Review Policy.

      struct ParameterMapEntry
        include JSON::Serializable

        # The QuestionID from the HIT that is used to identify which question requires Mechanical Turk to
        # score as part of the ScoreMyKnownAnswers/2011-09-01 Review Policy.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The list of answers to the question specified in the MapEntry Key element. The Worker must match all
        # values in order for the answer to be scored correctly.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @key : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Name of the parameter from the Review policy.

      struct PolicyParameter
        include JSON::Serializable

        # Name of the parameter from the list of Review Polices.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # List of ParameterMapEntry objects.

        @[JSON::Field(key: "MapEntries")]
        getter map_entries : Array(Types::ParameterMapEntry)?

        # The list of values of the Parameter

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @key : String? = nil,
          @map_entries : Array(Types::ParameterMapEntry)? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # The Qualification data structure represents a Qualification assigned to a user, including the
      # Qualification type and the value (score).

      struct Qualification
        include JSON::Serializable

        # The date and time the Qualification was granted to the Worker. If the Worker's Qualification was
        # revoked, and then re-granted based on a new Qualification request, GrantTime is the date and time of
        # the last call to the AcceptQualificationRequest operation.

        @[JSON::Field(key: "GrantTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter grant_time : Time?

        # The value (score) of the Qualification, if the Qualification has an integer value.

        @[JSON::Field(key: "IntegerValue")]
        getter integer_value : Int32?


        @[JSON::Field(key: "LocaleValue")]
        getter locale_value : Types::Locale?

        # The ID of the Qualification type for the Qualification.

        @[JSON::Field(key: "QualificationTypeId")]
        getter qualification_type_id : String?

        # The status of the Qualification. Valid values are Granted | Revoked.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The ID of the Worker who possesses the Qualification.

        @[JSON::Field(key: "WorkerId")]
        getter worker_id : String?

        def initialize(
          @grant_time : Time? = nil,
          @integer_value : Int32? = nil,
          @locale_value : Types::Locale? = nil,
          @qualification_type_id : String? = nil,
          @status : String? = nil,
          @worker_id : String? = nil
        )
        end
      end

      # The QualificationRequest data structure represents a request a Worker has made for a Qualification.

      struct QualificationRequest
        include JSON::Serializable

        # The Worker's answers for the Qualification type's test contained in a QuestionFormAnswers document,
        # if the type has a test and the Worker has submitted answers. If the Worker does not provide any
        # answers, Answer may be empty.

        @[JSON::Field(key: "Answer")]
        getter answer : String?

        # The ID of the Qualification request, a unique identifier generated when the request was submitted.

        @[JSON::Field(key: "QualificationRequestId")]
        getter qualification_request_id : String?

        # The ID of the Qualification type the Worker is requesting, as returned by the
        # CreateQualificationType operation.

        @[JSON::Field(key: "QualificationTypeId")]
        getter qualification_type_id : String?

        # The date and time the Qualification request had a status of Submitted. This is either the time the
        # Worker submitted answers for a Qualification test, or the time the Worker requested the
        # Qualification if the Qualification type does not have a test.

        @[JSON::Field(key: "SubmitTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter submit_time : Time?

        # The contents of the Qualification test that was presented to the Worker, if the type has a test and
        # the Worker has submitted answers. This value is identical to the QuestionForm associated with the
        # Qualification type at the time the Worker requests the Qualification.

        @[JSON::Field(key: "Test")]
        getter test : String?

        # The ID of the Worker requesting the Qualification.

        @[JSON::Field(key: "WorkerId")]
        getter worker_id : String?

        def initialize(
          @answer : String? = nil,
          @qualification_request_id : String? = nil,
          @qualification_type_id : String? = nil,
          @submit_time : Time? = nil,
          @test : String? = nil,
          @worker_id : String? = nil
        )
        end
      end

      # The QualificationRequirement data structure describes a Qualification that a Worker must have before
      # the Worker is allowed to accept a HIT. A requirement may optionally state that a Worker must have
      # the Qualification in order to preview the HIT, or see the HIT in search results.

      struct QualificationRequirement
        include JSON::Serializable

        # The kind of comparison to make against a Qualification's value. You can compare a Qualification's
        # value to an IntegerValue to see if it is LessThan, LessThanOrEqualTo, GreaterThan,
        # GreaterThanOrEqualTo, EqualTo, or NotEqualTo the IntegerValue. You can compare it to a LocaleValue
        # to see if it is EqualTo, or NotEqualTo the LocaleValue. You can check to see if the value is In or
        # NotIn a set of IntegerValue or LocaleValue values. Lastly, a Qualification requirement can also test
        # if a Qualification Exists or DoesNotExist in the user's profile, regardless of its value.

        @[JSON::Field(key: "Comparator")]
        getter comparator : String

        # The ID of the Qualification type for the requirement.

        @[JSON::Field(key: "QualificationTypeId")]
        getter qualification_type_id : String

        # Setting this attribute prevents Workers whose Qualifications do not meet this
        # QualificationRequirement from taking the specified action. Valid arguments include "Accept" (Worker
        # cannot accept the HIT, but can preview the HIT and see it in their search results),
        # "PreviewAndAccept" (Worker cannot accept or preview the HIT, but can see the HIT in their search
        # results), and "DiscoverPreviewAndAccept" (Worker cannot accept, preview, or see the HIT in their
        # search results). It's possible for you to create a HIT with multiple QualificationRequirements
        # (which can have different values for the ActionGuarded attribute). In this case, the Worker is only
        # permitted to perform an action when they have met all QualificationRequirements guarding the action.
        # The actions in the order of least restrictive to most restrictive are Discover, Preview and Accept.
        # For example, if a Worker meets all QualificationRequirements that are set to
        # DiscoverPreviewAndAccept, but do not meet all requirements that are set with PreviewAndAccept, then
        # the Worker will be able to Discover, i.e. see the HIT in their search result, but will not be able
        # to Preview or Accept the HIT. ActionsGuarded should not be used in combination with the
        # RequiredToPreview field.

        @[JSON::Field(key: "ActionsGuarded")]
        getter actions_guarded : String?

        # The integer value to compare against the Qualification's value. IntegerValue must not be present if
        # Comparator is Exists or DoesNotExist. IntegerValue can only be used if the Qualification type has an
        # integer value; it cannot be used with the Worker_Locale QualificationType ID. When performing a set
        # comparison by using the In or the NotIn comparator, you can use up to 15 IntegerValue elements in a
        # QualificationRequirement data structure.

        @[JSON::Field(key: "IntegerValues")]
        getter integer_values : Array(Int32)?

        # The locale value to compare against the Qualification's value. The local value must be a valid ISO
        # 3166 country code or supports ISO 3166-2 subdivisions. LocaleValue can only be used with a
        # Worker_Locale QualificationType ID. LocaleValue can only be used with the EqualTo, NotEqualTo, In,
        # and NotIn comparators. You must only use a single LocaleValue element when using the EqualTo or
        # NotEqualTo comparators. When performing a set comparison by using the In or the NotIn comparator,
        # you can use up to 30 LocaleValue elements in a QualificationRequirement data structure.

        @[JSON::Field(key: "LocaleValues")]
        getter locale_values : Array(Types::Locale)?

        # DEPRECATED: Use the ActionsGuarded field instead. If RequiredToPreview is true, the question data
        # for the HIT will not be shown when a Worker whose Qualifications do not meet this requirement tries
        # to preview the HIT. That is, a Worker's Qualifications must meet all of the requirements for which
        # RequiredToPreview is true in order to preview the HIT. If a Worker meets all of the requirements
        # where RequiredToPreview is true (or if there are no such requirements), but does not meet all of the
        # requirements for the HIT, the Worker will be allowed to preview the HIT's question data, but will
        # not be allowed to accept and complete the HIT. The default is false. This should not be used in
        # combination with the ActionsGuarded field.

        @[JSON::Field(key: "RequiredToPreview")]
        getter required_to_preview : Bool?

        def initialize(
          @comparator : String,
          @qualification_type_id : String,
          @actions_guarded : String? = nil,
          @integer_values : Array(Int32)? = nil,
          @locale_values : Array(Types::Locale)? = nil,
          @required_to_preview : Bool? = nil
        )
        end
      end

      # The QualificationType data structure represents a Qualification type, a description of a property of
      # a Worker that must match the requirements of a HIT for the Worker to be able to accept the HIT. The
      # type also describes how a Worker can obtain a Qualification of that type, such as through a
      # Qualification test.

      struct QualificationType
        include JSON::Serializable

        # The answers to the Qualification test specified in the Test parameter.

        @[JSON::Field(key: "AnswerKey")]
        getter answer_key : String?

        # Specifies that requests for the Qualification type are granted immediately, without prompting the
        # Worker with a Qualification test. Valid values are True | False.

        @[JSON::Field(key: "AutoGranted")]
        getter auto_granted : Bool?

        # The Qualification integer value to use for automatically granted Qualifications, if AutoGranted is
        # true. This is 1 by default.

        @[JSON::Field(key: "AutoGrantedValue")]
        getter auto_granted_value : Int32?

        # The date and time the Qualification type was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A long description for the Qualification type.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Specifies whether the Qualification type is one that a user can request through the Amazon
        # Mechanical Turk web site, such as by taking a Qualification test. This value is False for
        # Qualifications assigned automatically by the system. Valid values are True | False.

        @[JSON::Field(key: "IsRequestable")]
        getter is_requestable : Bool?

        # One or more words or phrases that describe theQualification type, separated by commas. The Keywords
        # make the type easier to find using a search.

        @[JSON::Field(key: "Keywords")]
        getter keywords : String?

        # The name of the Qualification type. The type name is used to identify the type, and to find the type
        # using a Qualification type search.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A unique identifier for the Qualification type. A Qualification type is given a Qualification type
        # ID when you call the CreateQualificationType operation.

        @[JSON::Field(key: "QualificationTypeId")]
        getter qualification_type_id : String?

        # The status of the Qualification type. A Qualification type's status determines if users can apply to
        # receive a Qualification of this type, and if HITs can be created with requirements based on this
        # type. Valid values are Active | Inactive.

        @[JSON::Field(key: "QualificationTypeStatus")]
        getter qualification_type_status : String?

        # The amount of time, in seconds, Workers must wait after taking the Qualification test before they
        # can take it again. Workers can take a Qualification test multiple times if they were not granted the
        # Qualification from a previous attempt, or if the test offers a gradient score and they want a better
        # score. If not specified, retries are disabled and Workers can request a Qualification only once.

        @[JSON::Field(key: "RetryDelayInSeconds")]
        getter retry_delay_in_seconds : Int64?

        # The questions for a Qualification test associated with this Qualification type that a user can take
        # to obtain a Qualification of this type. This parameter must be specified if AnswerKey is present. A
        # Qualification type cannot have both a specified Test parameter and an AutoGranted value of true.

        @[JSON::Field(key: "Test")]
        getter test : String?

        # The amount of time, in seconds, given to a Worker to complete the Qualification test, beginning from
        # the time the Worker requests the Qualification.

        @[JSON::Field(key: "TestDurationInSeconds")]
        getter test_duration_in_seconds : Int64?

        def initialize(
          @answer_key : String? = nil,
          @auto_granted : Bool? = nil,
          @auto_granted_value : Int32? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @is_requestable : Bool? = nil,
          @keywords : String? = nil,
          @name : String? = nil,
          @qualification_type_id : String? = nil,
          @qualification_type_status : String? = nil,
          @retry_delay_in_seconds : Int64? = nil,
          @test : String? = nil,
          @test_duration_in_seconds : Int64? = nil
        )
        end
      end


      struct RejectAssignmentRequest
        include JSON::Serializable

        # The ID of the assignment. The assignment must correspond to a HIT created by the Requester.

        @[JSON::Field(key: "AssignmentId")]
        getter assignment_id : String

        # A message for the Worker, which the Worker can see in the Status section of the web site.

        @[JSON::Field(key: "RequesterFeedback")]
        getter requester_feedback : String

        def initialize(
          @assignment_id : String,
          @requester_feedback : String
        )
        end
      end


      struct RejectAssignmentResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct RejectQualificationRequestRequest
        include JSON::Serializable

        # The ID of the Qualification request, as returned by the ListQualificationRequests operation.

        @[JSON::Field(key: "QualificationRequestId")]
        getter qualification_request_id : String

        # A text message explaining why the request was rejected, to be shown to the Worker who made the
        # request.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @qualification_request_id : String,
          @reason : String? = nil
        )
        end
      end


      struct RejectQualificationRequestResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Your request is invalid.

      struct RequestError
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "TurkErrorCode")]
        getter turk_error_code : String?

        def initialize(
          @message : String? = nil,
          @turk_error_code : String? = nil
        )
        end
      end

      # Both the AssignmentReviewReport and the HITReviewReport elements contains the ReviewActionDetail
      # data structure. This structure is returned multiple times for each action specified in the Review
      # Policy.

      struct ReviewActionDetail
        include JSON::Serializable

        # The unique identifier for the action.

        @[JSON::Field(key: "ActionId")]
        getter action_id : String?

        # The nature of the action itself. The Review Policy is responsible for examining the HIT and
        # Assignments, emitting results, and deciding which other actions will be necessary.

        @[JSON::Field(key: "ActionName")]
        getter action_name : String?

        # The date when the action was completed.

        @[JSON::Field(key: "CompleteTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter complete_time : Time?

        # Present only when the Results have a FAILED Status.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # A description of the outcome of the review.

        @[JSON::Field(key: "Result")]
        getter result : String?

        # The current disposition of the action: INTENDED, SUCCEEDED, FAILED, or CANCELLED.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The specific HITId or AssignmentID targeted by the action.

        @[JSON::Field(key: "TargetId")]
        getter target_id : String?

        # The type of object in TargetId.

        @[JSON::Field(key: "TargetType")]
        getter target_type : String?

        def initialize(
          @action_id : String? = nil,
          @action_name : String? = nil,
          @complete_time : Time? = nil,
          @error_code : String? = nil,
          @result : String? = nil,
          @status : String? = nil,
          @target_id : String? = nil,
          @target_type : String? = nil
        )
        end
      end

      # HIT Review Policy data structures represent HIT review policies, which you specify when you create a
      # HIT.

      struct ReviewPolicy
        include JSON::Serializable

        # Name of a Review Policy: SimplePlurality/2011-09-01 or ScoreMyKnownAnswers/2011-09-01

        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # Name of the parameter from the Review policy.

        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::PolicyParameter)?

        def initialize(
          @policy_name : String,
          @parameters : Array(Types::PolicyParameter)? = nil
        )
        end
      end

      # Contains both ReviewResult and ReviewAction elements for a particular HIT.

      struct ReviewReport
        include JSON::Serializable

        # A list of ReviewAction objects for each action specified in the Review Policy.

        @[JSON::Field(key: "ReviewActions")]
        getter review_actions : Array(Types::ReviewActionDetail)?

        # A list of ReviewResults objects for each action specified in the Review Policy.

        @[JSON::Field(key: "ReviewResults")]
        getter review_results : Array(Types::ReviewResultDetail)?

        def initialize(
          @review_actions : Array(Types::ReviewActionDetail)? = nil,
          @review_results : Array(Types::ReviewResultDetail)? = nil
        )
        end
      end

      # This data structure is returned multiple times for each result specified in the Review Policy.

      struct ReviewResultDetail
        include JSON::Serializable

        # A unique identifier of the Review action result.

        @[JSON::Field(key: "ActionId")]
        getter action_id : String?

        # Key identifies the particular piece of reviewed information.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # Specifies the QuestionId the result is describing. Depending on whether the TargetType is a HIT or
        # Assignment this results could specify multiple values. If TargetType is HIT and QuestionId is
        # absent, then the result describes results of the HIT, including the HIT agreement score. If
        # ObjectType is Assignment and QuestionId is absent, then the result describes the Worker's
        # performance on the HIT.

        @[JSON::Field(key: "QuestionId")]
        getter question_id : String?

        # The HITID or AssignmentId about which this result was taken. Note that HIT-level Review Policies
        # will often emit results about both the HIT itself and its Assignments, while Assignment-level review
        # policies generally only emit results about the Assignment itself.

        @[JSON::Field(key: "SubjectId")]
        getter subject_id : String?

        # The type of the object from the SubjectId field.

        @[JSON::Field(key: "SubjectType")]
        getter subject_type : String?

        # The values of Key provided by the review policies you have selected.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @action_id : String? = nil,
          @key : String? = nil,
          @question_id : String? = nil,
          @subject_id : String? = nil,
          @subject_type : String? = nil,
          @value : String? = nil
        )
        end
      end


      struct SendBonusRequest
        include JSON::Serializable

        # The ID of the assignment for which this bonus is paid.

        @[JSON::Field(key: "AssignmentId")]
        getter assignment_id : String

        # The Bonus amount is a US Dollar amount specified using a string (for example, "5" represents $5.00
        # USD and "101.42" represents $101.42 USD). Do not include currency symbols or currency codes.

        @[JSON::Field(key: "BonusAmount")]
        getter bonus_amount : String

        # A message that explains the reason for the bonus payment. The Worker receiving the bonus can see
        # this message.

        @[JSON::Field(key: "Reason")]
        getter reason : String

        # The ID of the Worker being paid the bonus.

        @[JSON::Field(key: "WorkerId")]
        getter worker_id : String

        # A unique identifier for this request, which allows you to retry the call on error without granting
        # multiple bonuses. This is useful in cases such as network timeouts where it is unclear whether or
        # not the call succeeded on the server. If the bonus already exists in the system from a previous call
        # using the same UniqueRequestToken, subsequent calls will return an error with a message containing
        # the request ID.

        @[JSON::Field(key: "UniqueRequestToken")]
        getter unique_request_token : String?

        def initialize(
          @assignment_id : String,
          @bonus_amount : String,
          @reason : String,
          @worker_id : String,
          @unique_request_token : String? = nil
        )
        end
      end


      struct SendBonusResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct SendTestEventNotificationRequest
        include JSON::Serializable

        # The notification specification to test. This value is identical to the value you would provide to
        # the UpdateNotificationSettings operation when you establish the notification specification for a HIT
        # type.

        @[JSON::Field(key: "Notification")]
        getter notification : Types::NotificationSpecification

        # The event to simulate to test the notification specification. This event is included in the test
        # message even if the notification specification does not include the event type. The notification
        # specification does not filter out the test event.

        @[JSON::Field(key: "TestEventType")]
        getter test_event_type : String

        def initialize(
          @notification : Types::NotificationSpecification,
          @test_event_type : String
        )
        end
      end


      struct SendTestEventNotificationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Amazon Mechanical Turk is temporarily unable to process your request. Try your call again.

      struct ServiceFault
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?


        @[JSON::Field(key: "TurkErrorCode")]
        getter turk_error_code : String?

        def initialize(
          @message : String? = nil,
          @turk_error_code : String? = nil
        )
        end
      end


      struct UpdateExpirationForHITRequest
        include JSON::Serializable

        # The date and time at which you want the HIT to expire

        @[JSON::Field(key: "ExpireAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expire_at : Time

        # The HIT to update.

        @[JSON::Field(key: "HITId")]
        getter hit_id : String

        def initialize(
          @expire_at : Time,
          @hit_id : String
        )
        end
      end


      struct UpdateExpirationForHITResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateHITReviewStatusRequest
        include JSON::Serializable

        # The ID of the HIT to update.

        @[JSON::Field(key: "HITId")]
        getter hit_id : String

        # Specifies how to update the HIT status. Default is False . Setting this to false will only
        # transition a HIT from Reviewable to Reviewing Setting this to true will only transition a HIT from
        # Reviewing to Reviewable

        @[JSON::Field(key: "Revert")]
        getter revert : Bool?

        def initialize(
          @hit_id : String,
          @revert : Bool? = nil
        )
        end
      end


      struct UpdateHITReviewStatusResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateHITTypeOfHITRequest
        include JSON::Serializable

        # The HIT to update.

        @[JSON::Field(key: "HITId")]
        getter hit_id : String

        # The ID of the new HIT type.

        @[JSON::Field(key: "HITTypeId")]
        getter hit_type_id : String

        def initialize(
          @hit_id : String,
          @hit_type_id : String
        )
        end
      end


      struct UpdateHITTypeOfHITResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateNotificationSettingsRequest
        include JSON::Serializable

        # The ID of the HIT type whose notification specification is being updated.

        @[JSON::Field(key: "HITTypeId")]
        getter hit_type_id : String

        # Specifies whether notifications are sent for HITs of this HIT type, according to the notification
        # specification. You must specify either the Notification parameter or the Active parameter for the
        # call to UpdateNotificationSettings to succeed.

        @[JSON::Field(key: "Active")]
        getter active : Bool?

        # The notification specification for the HIT type.

        @[JSON::Field(key: "Notification")]
        getter notification : Types::NotificationSpecification?

        def initialize(
          @hit_type_id : String,
          @active : Bool? = nil,
          @notification : Types::NotificationSpecification? = nil
        )
        end
      end


      struct UpdateNotificationSettingsResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateQualificationTypeRequest
        include JSON::Serializable

        # The ID of the Qualification type to update.

        @[JSON::Field(key: "QualificationTypeId")]
        getter qualification_type_id : String

        # The answers to the Qualification test specified in the Test parameter, in the form of an AnswerKey
        # data structure.

        @[JSON::Field(key: "AnswerKey")]
        getter answer_key : String?

        # Specifies whether requests for the Qualification type are granted immediately, without prompting the
        # Worker with a Qualification test. Constraints: If the Test parameter is specified, this parameter
        # cannot be true.

        @[JSON::Field(key: "AutoGranted")]
        getter auto_granted : Bool?

        # The Qualification value to use for automatically granted Qualifications. This parameter is used only
        # if the AutoGranted parameter is true.

        @[JSON::Field(key: "AutoGrantedValue")]
        getter auto_granted_value : Int32?

        # The new description of the Qualification type.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The new status of the Qualification type - Active | Inactive

        @[JSON::Field(key: "QualificationTypeStatus")]
        getter qualification_type_status : String?

        # The amount of time, in seconds, that Workers must wait after requesting a Qualification of the
        # specified Qualification type before they can retry the Qualification request. It is not possible to
        # disable retries for a Qualification type after it has been created with retries enabled. If you want
        # to disable retries, you must dispose of the existing retry-enabled Qualification type using
        # DisposeQualificationType and then create a new Qualification type with retries disabled using
        # CreateQualificationType.

        @[JSON::Field(key: "RetryDelayInSeconds")]
        getter retry_delay_in_seconds : Int64?

        # The questions for the Qualification test a Worker must answer correctly to obtain a Qualification of
        # this type. If this parameter is specified, TestDurationInSeconds must also be specified.
        # Constraints: Must not be longer than 65535 bytes. Must be a QuestionForm data structure. This
        # parameter cannot be specified if AutoGranted is true. Constraints: None. If not specified, the
        # Worker may request the Qualification without answering any questions.

        @[JSON::Field(key: "Test")]
        getter test : String?

        # The number of seconds the Worker has to complete the Qualification test, starting from the time the
        # Worker requests the Qualification.

        @[JSON::Field(key: "TestDurationInSeconds")]
        getter test_duration_in_seconds : Int64?

        def initialize(
          @qualification_type_id : String,
          @answer_key : String? = nil,
          @auto_granted : Bool? = nil,
          @auto_granted_value : Int32? = nil,
          @description : String? = nil,
          @qualification_type_status : String? = nil,
          @retry_delay_in_seconds : Int64? = nil,
          @test : String? = nil,
          @test_duration_in_seconds : Int64? = nil
        )
        end
      end


      struct UpdateQualificationTypeResponse
        include JSON::Serializable

        # Contains a QualificationType data structure.

        @[JSON::Field(key: "QualificationType")]
        getter qualification_type : Types::QualificationType?

        def initialize(
          @qualification_type : Types::QualificationType? = nil
        )
        end
      end

      # The WorkerBlock data structure represents a Worker who has been blocked. It has two elements: the
      # WorkerId and the Reason for the block.

      struct WorkerBlock
        include JSON::Serializable

        # A message explaining the reason the Worker was blocked.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        # The ID of the Worker who accepted the HIT.

        @[JSON::Field(key: "WorkerId")]
        getter worker_id : String?

        def initialize(
          @reason : String? = nil,
          @worker_id : String? = nil
        )
        end
      end
    end
  end
end
