module Aws
  module MTurk
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # The AcceptQualificationRequest operation approves a Worker's request for a Qualification. Only the
      # owner of the Qualification type can grant a Qualification request for that type. A successful
      # request for the AcceptQualificationRequest operation returns with no errors and an empty body.

      def accept_qualification_request(
        qualification_request_id : String,
        integer_value : Int32? = nil
      ) : Types::AcceptQualificationRequestResponse

        input = Types::AcceptQualificationRequestRequest.new(qualification_request_id: qualification_request_id, integer_value: integer_value)
        accept_qualification_request(input)
      end

      def accept_qualification_request(input : Types::AcceptQualificationRequestRequest) : Types::AcceptQualificationRequestResponse
        request = Protocol::JsonRpc.build_request(Model::ACCEPT_QUALIFICATION_REQUEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AcceptQualificationRequestResponse, "AcceptQualificationRequest")
      end

      # The ApproveAssignment operation approves the results of a completed assignment. Approving an
      # assignment initiates two payments from the Requester's Amazon.com account The Worker who submitted
      # the results is paid the reward specified in the HIT. Amazon Mechanical Turk fees are debited. If the
      # Requester's account does not have adequate funds for these payments, the call to ApproveAssignment
      # returns an exception, and the approval is not processed. You can include an optional feedback
      # message with the approval, which the Worker can see in the Status section of the web site. You can
      # also call this operation for assignments that were previous rejected and approve them by explicitly
      # overriding the previous rejection. This only works on rejected assignments that were submitted
      # within the previous 30 days and only if the assignment's related HIT has not been deleted.

      def approve_assignment(
        assignment_id : String,
        override_rejection : Bool? = nil,
        requester_feedback : String? = nil
      ) : Types::ApproveAssignmentResponse

        input = Types::ApproveAssignmentRequest.new(assignment_id: assignment_id, override_rejection: override_rejection, requester_feedback: requester_feedback)
        approve_assignment(input)
      end

      def approve_assignment(input : Types::ApproveAssignmentRequest) : Types::ApproveAssignmentResponse
        request = Protocol::JsonRpc.build_request(Model::APPROVE_ASSIGNMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ApproveAssignmentResponse, "ApproveAssignment")
      end

      # The AssociateQualificationWithWorker operation gives a Worker a Qualification.
      # AssociateQualificationWithWorker does not require that the Worker submit a Qualification request. It
      # gives the Qualification directly to the Worker. You can only assign a Qualification of a
      # Qualification type that you created (using the CreateQualificationType operation). Note:
      # AssociateQualificationWithWorker does not affect any pending Qualification requests for the
      # Qualification by the Worker. If you assign a Qualification to a Worker, then later grant a
      # Qualification request made by the Worker, the granting of the request may modify the Qualification
      # score. To resolve a pending Qualification request without affecting the Qualification the Worker
      # already has, reject the request with the RejectQualificationRequest operation.

      def associate_qualification_with_worker(
        qualification_type_id : String,
        worker_id : String,
        integer_value : Int32? = nil,
        send_notification : Bool? = nil
      ) : Types::AssociateQualificationWithWorkerResponse

        input = Types::AssociateQualificationWithWorkerRequest.new(qualification_type_id: qualification_type_id, worker_id: worker_id, integer_value: integer_value, send_notification: send_notification)
        associate_qualification_with_worker(input)
      end

      def associate_qualification_with_worker(input : Types::AssociateQualificationWithWorkerRequest) : Types::AssociateQualificationWithWorkerResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_QUALIFICATION_WITH_WORKER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateQualificationWithWorkerResponse, "AssociateQualificationWithWorker")
      end

      # The CreateAdditionalAssignmentsForHIT operation increases the maximum number of assignments of an
      # existing HIT. To extend the maximum number of assignments, specify the number of additional
      # assignments. HITs created with fewer than 10 assignments cannot be extended to have 10 or more
      # assignments. Attempting to add assignments in a way that brings the total number of assignments for
      # a HIT from fewer than 10 assignments to 10 or more assignments will result in an
      # AWS.MechanicalTurk.InvalidMaximumAssignmentsIncrease exception. HITs that were created before July
      # 22, 2015 cannot be extended. Attempting to extend HITs that were created before July 22, 2015 will
      # result in an AWS.MechanicalTurk.HITTooOldForExtension exception.

      def create_additional_assignments_for_hit(
        hit_id : String,
        number_of_additional_assignments : Int32,
        unique_request_token : String? = nil
      ) : Types::CreateAdditionalAssignmentsForHITResponse

        input = Types::CreateAdditionalAssignmentsForHITRequest.new(hit_id: hit_id, number_of_additional_assignments: number_of_additional_assignments, unique_request_token: unique_request_token)
        create_additional_assignments_for_hit(input)
      end

      def create_additional_assignments_for_hit(input : Types::CreateAdditionalAssignmentsForHITRequest) : Types::CreateAdditionalAssignmentsForHITResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ADDITIONAL_ASSIGNMENTS_FOR_HIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAdditionalAssignmentsForHITResponse, "CreateAdditionalAssignmentsForHIT")
      end

      # The CreateHIT operation creates a new Human Intelligence Task (HIT). The new HIT is made available
      # for Workers to find and accept on the Amazon Mechanical Turk website. This operation allows you to
      # specify a new HIT by passing in values for the properties of the HIT, such as its title, reward
      # amount and number of assignments. When you pass these values to CreateHIT , a new HIT is created for
      # you, with a new HITTypeID . The HITTypeID can be used to create additional HITs in the future
      # without needing to specify common parameters such as the title, description and reward amount each
      # time. An alternative way to create HITs is to first generate a HITTypeID using the CreateHITType
      # operation and then call the CreateHITWithHITType operation. This is the recommended best practice
      # for Requesters who are creating large numbers of HITs. CreateHIT also supports several ways to
      # provide question data: by providing a value for the Question parameter that fully specifies the
      # contents of the HIT, or by providing a HitLayoutId and associated HitLayoutParameters . If a HIT is
      # created with 10 or more maximum assignments, there is an additional fee. For more information, see
      # Amazon Mechanical Turk Pricing .

      def create_hit(
        assignment_duration_in_seconds : Int64,
        description : String,
        lifetime_in_seconds : Int64,
        reward : String,
        title : String,
        assignment_review_policy : Types::ReviewPolicy? = nil,
        auto_approval_delay_in_seconds : Int64? = nil,
        hit_layout_id : String? = nil,
        hit_layout_parameters : Array(Types::HITLayoutParameter)? = nil,
        hit_review_policy : Types::ReviewPolicy? = nil,
        keywords : String? = nil,
        max_assignments : Int32? = nil,
        qualification_requirements : Array(Types::QualificationRequirement)? = nil,
        question : String? = nil,
        requester_annotation : String? = nil,
        unique_request_token : String? = nil
      ) : Types::CreateHITResponse

        input = Types::CreateHITRequest.new(assignment_duration_in_seconds: assignment_duration_in_seconds, description: description, lifetime_in_seconds: lifetime_in_seconds, reward: reward, title: title, assignment_review_policy: assignment_review_policy, auto_approval_delay_in_seconds: auto_approval_delay_in_seconds, hit_layout_id: hit_layout_id, hit_layout_parameters: hit_layout_parameters, hit_review_policy: hit_review_policy, keywords: keywords, max_assignments: max_assignments, qualification_requirements: qualification_requirements, question: question, requester_annotation: requester_annotation, unique_request_token: unique_request_token)
        create_hit(input)
      end

      def create_hit(input : Types::CreateHITRequest) : Types::CreateHITResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_HIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateHITResponse, "CreateHIT")
      end

      # The CreateHITType operation creates a new HIT type. This operation allows you to define a standard
      # set of HIT properties to use when creating HITs. If you register a HIT type with values that match
      # an existing HIT type, the HIT type ID of the existing type will be returned.

      def create_hit_type(
        assignment_duration_in_seconds : Int64,
        description : String,
        reward : String,
        title : String,
        auto_approval_delay_in_seconds : Int64? = nil,
        keywords : String? = nil,
        qualification_requirements : Array(Types::QualificationRequirement)? = nil
      ) : Types::CreateHITTypeResponse

        input = Types::CreateHITTypeRequest.new(assignment_duration_in_seconds: assignment_duration_in_seconds, description: description, reward: reward, title: title, auto_approval_delay_in_seconds: auto_approval_delay_in_seconds, keywords: keywords, qualification_requirements: qualification_requirements)
        create_hit_type(input)
      end

      def create_hit_type(input : Types::CreateHITTypeRequest) : Types::CreateHITTypeResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_HIT_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateHITTypeResponse, "CreateHITType")
      end

      # The CreateHITWithHITType operation creates a new Human Intelligence Task (HIT) using an existing
      # HITTypeID generated by the CreateHITType operation. This is an alternative way to create HITs from
      # the CreateHIT operation. This is the recommended best practice for Requesters who are creating large
      # numbers of HITs. CreateHITWithHITType also supports several ways to provide question data: by
      # providing a value for the Question parameter that fully specifies the contents of the HIT, or by
      # providing a HitLayoutId and associated HitLayoutParameters . If a HIT is created with 10 or more
      # maximum assignments, there is an additional fee. For more information, see Amazon Mechanical Turk
      # Pricing .

      def create_hit_with_hit_type(
        hit_type_id : String,
        lifetime_in_seconds : Int64,
        assignment_review_policy : Types::ReviewPolicy? = nil,
        hit_layout_id : String? = nil,
        hit_layout_parameters : Array(Types::HITLayoutParameter)? = nil,
        hit_review_policy : Types::ReviewPolicy? = nil,
        max_assignments : Int32? = nil,
        question : String? = nil,
        requester_annotation : String? = nil,
        unique_request_token : String? = nil
      ) : Types::CreateHITWithHITTypeResponse

        input = Types::CreateHITWithHITTypeRequest.new(hit_type_id: hit_type_id, lifetime_in_seconds: lifetime_in_seconds, assignment_review_policy: assignment_review_policy, hit_layout_id: hit_layout_id, hit_layout_parameters: hit_layout_parameters, hit_review_policy: hit_review_policy, max_assignments: max_assignments, question: question, requester_annotation: requester_annotation, unique_request_token: unique_request_token)
        create_hit_with_hit_type(input)
      end

      def create_hit_with_hit_type(input : Types::CreateHITWithHITTypeRequest) : Types::CreateHITWithHITTypeResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_HIT_WITH_HIT_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateHITWithHITTypeResponse, "CreateHITWithHITType")
      end

      # The CreateQualificationType operation creates a new Qualification type, which is represented by a
      # QualificationType data structure.

      def create_qualification_type(
        description : String,
        name : String,
        qualification_type_status : String,
        answer_key : String? = nil,
        auto_granted : Bool? = nil,
        auto_granted_value : Int32? = nil,
        keywords : String? = nil,
        retry_delay_in_seconds : Int64? = nil,
        test : String? = nil,
        test_duration_in_seconds : Int64? = nil
      ) : Types::CreateQualificationTypeResponse

        input = Types::CreateQualificationTypeRequest.new(description: description, name: name, qualification_type_status: qualification_type_status, answer_key: answer_key, auto_granted: auto_granted, auto_granted_value: auto_granted_value, keywords: keywords, retry_delay_in_seconds: retry_delay_in_seconds, test: test, test_duration_in_seconds: test_duration_in_seconds)
        create_qualification_type(input)
      end

      def create_qualification_type(input : Types::CreateQualificationTypeRequest) : Types::CreateQualificationTypeResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_QUALIFICATION_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateQualificationTypeResponse, "CreateQualificationType")
      end

      # The CreateWorkerBlock operation allows you to prevent a Worker from working on your HITs. For
      # example, you can block a Worker who is producing poor quality work. You can block up to 100,000
      # Workers.

      def create_worker_block(
        reason : String,
        worker_id : String
      ) : Types::CreateWorkerBlockResponse

        input = Types::CreateWorkerBlockRequest.new(reason: reason, worker_id: worker_id)
        create_worker_block(input)
      end

      def create_worker_block(input : Types::CreateWorkerBlockRequest) : Types::CreateWorkerBlockResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_WORKER_BLOCK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateWorkerBlockResponse, "CreateWorkerBlock")
      end

      # The DeleteHIT operation is used to delete HIT that is no longer needed. Only the Requester who
      # created the HIT can delete it. You can only dispose of HITs that are in the Reviewable state, with
      # all of their submitted assignments already either approved or rejected. If you call the DeleteHIT
      # operation on a HIT that is not in the Reviewable state (for example, that has not expired, or still
      # has active assignments), or on a HIT that is Reviewable but without all of its submitted assignments
      # already approved or rejected, the service will return an error. HITs are automatically disposed of
      # after 120 days. After you dispose of a HIT, you can no longer approve the HIT's rejected
      # assignments. Disposed HITs are not returned in results for the ListHITs operation. Disposing HITs
      # can improve the performance of operations such as ListReviewableHITs and ListHITs.

      def delete_hit(
        hit_id : String
      ) : Types::DeleteHITResponse

        input = Types::DeleteHITRequest.new(hit_id: hit_id)
        delete_hit(input)
      end

      def delete_hit(input : Types::DeleteHITRequest) : Types::DeleteHITResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_HIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteHITResponse, "DeleteHIT")
      end

      # The DeleteQualificationType deletes a Qualification type and deletes any HIT types that are
      # associated with the Qualification type. This operation does not revoke Qualifications already
      # assigned to Workers because the Qualifications might be needed for active HITs. If there are any
      # pending requests for the Qualification type, Amazon Mechanical Turk rejects those requests. After
      # you delete a Qualification type, you can no longer use it to create HITs or HIT types.
      # DeleteQualificationType must wait for all the HITs that use the deleted Qualification type to be
      # deleted before completing. It may take up to 48 hours before DeleteQualificationType completes and
      # the unique name of the Qualification type is available for reuse with CreateQualificationType.

      def delete_qualification_type(
        qualification_type_id : String
      ) : Types::DeleteQualificationTypeResponse

        input = Types::DeleteQualificationTypeRequest.new(qualification_type_id: qualification_type_id)
        delete_qualification_type(input)
      end

      def delete_qualification_type(input : Types::DeleteQualificationTypeRequest) : Types::DeleteQualificationTypeResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_QUALIFICATION_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteQualificationTypeResponse, "DeleteQualificationType")
      end

      # The DeleteWorkerBlock operation allows you to reinstate a blocked Worker to work on your HITs. This
      # operation reverses the effects of the CreateWorkerBlock operation. You need the Worker ID to use
      # this operation. If the Worker ID is missing or invalid, this operation fails and returns the message
      # “WorkerId is invalid.” If the specified Worker is not blocked, this operation returns successfully.

      def delete_worker_block(
        worker_id : String,
        reason : String? = nil
      ) : Types::DeleteWorkerBlockResponse

        input = Types::DeleteWorkerBlockRequest.new(worker_id: worker_id, reason: reason)
        delete_worker_block(input)
      end

      def delete_worker_block(input : Types::DeleteWorkerBlockRequest) : Types::DeleteWorkerBlockResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_WORKER_BLOCK, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteWorkerBlockResponse, "DeleteWorkerBlock")
      end

      # The DisassociateQualificationFromWorker revokes a previously granted Qualification from a user. You
      # can provide a text message explaining why the Qualification was revoked. The user who had the
      # Qualification can see this message.

      def disassociate_qualification_from_worker(
        qualification_type_id : String,
        worker_id : String,
        reason : String? = nil
      ) : Types::DisassociateQualificationFromWorkerResponse

        input = Types::DisassociateQualificationFromWorkerRequest.new(qualification_type_id: qualification_type_id, worker_id: worker_id, reason: reason)
        disassociate_qualification_from_worker(input)
      end

      def disassociate_qualification_from_worker(input : Types::DisassociateQualificationFromWorkerRequest) : Types::DisassociateQualificationFromWorkerResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_QUALIFICATION_FROM_WORKER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateQualificationFromWorkerResponse, "DisassociateQualificationFromWorker")
      end

      # The GetAccountBalance operation retrieves the Prepaid HITs balance in your Amazon Mechanical Turk
      # account if you are a Prepaid Requester. Alternatively, this operation will retrieve the remaining
      # available AWS Billing usage if you have enabled AWS Billing. Note: If you have enabled AWS Billing
      # and still have a remaining Prepaid HITs balance, this balance can be viewed on the My Account page
      # in the Requester console.

      def get_account_balance : Types::GetAccountBalanceResponse
        input = Types::GetAccountBalanceRequest.new
        get_account_balance(input)
      end

      def get_account_balance(input : Types::GetAccountBalanceRequest) : Types::GetAccountBalanceResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ACCOUNT_BALANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAccountBalanceResponse, "GetAccountBalance")
      end

      # The GetAssignment operation retrieves the details of the specified Assignment.

      def get_assignment(
        assignment_id : String
      ) : Types::GetAssignmentResponse

        input = Types::GetAssignmentRequest.new(assignment_id: assignment_id)
        get_assignment(input)
      end

      def get_assignment(input : Types::GetAssignmentRequest) : Types::GetAssignmentResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ASSIGNMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAssignmentResponse, "GetAssignment")
      end

      # The GetFileUploadURL operation generates and returns a temporary URL. You use the temporary URL to
      # retrieve a file uploaded by a Worker as an answer to a FileUploadAnswer question for a HIT. The
      # temporary URL is generated the instant the GetFileUploadURL operation is called, and is valid for 60
      # seconds. You can get a temporary file upload URL any time until the HIT is disposed. After the HIT
      # is disposed, any uploaded files are deleted, and cannot be retrieved. Pending Deprecation on
      # December 12, 2017. The Answer Specification structure will no longer support the FileUploadAnswer
      # element to be used for the QuestionForm data structure. Instead, we recommend that Requesters who
      # want to create HITs asking Workers to upload files to use Amazon S3.

      def get_file_upload_url(
        assignment_id : String,
        question_identifier : String
      ) : Types::GetFileUploadURLResponse

        input = Types::GetFileUploadURLRequest.new(assignment_id: assignment_id, question_identifier: question_identifier)
        get_file_upload_url(input)
      end

      def get_file_upload_url(input : Types::GetFileUploadURLRequest) : Types::GetFileUploadURLResponse
        request = Protocol::JsonRpc.build_request(Model::GET_FILE_UPLOAD_URL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetFileUploadURLResponse, "GetFileUploadURL")
      end

      # The GetHIT operation retrieves the details of the specified HIT.

      def get_hit(
        hit_id : String
      ) : Types::GetHITResponse

        input = Types::GetHITRequest.new(hit_id: hit_id)
        get_hit(input)
      end

      def get_hit(input : Types::GetHITRequest) : Types::GetHITResponse
        request = Protocol::JsonRpc.build_request(Model::GET_HIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetHITResponse, "GetHIT")
      end

      # The GetQualificationScore operation returns the value of a Worker's Qualification for a given
      # Qualification type. To get a Worker's Qualification, you must know the Worker's ID. The Worker's ID
      # is included in the assignment data returned by the ListAssignmentsForHIT operation. Only the owner
      # of a Qualification type can query the value of a Worker's Qualification of that type.

      def get_qualification_score(
        qualification_type_id : String,
        worker_id : String
      ) : Types::GetQualificationScoreResponse

        input = Types::GetQualificationScoreRequest.new(qualification_type_id: qualification_type_id, worker_id: worker_id)
        get_qualification_score(input)
      end

      def get_qualification_score(input : Types::GetQualificationScoreRequest) : Types::GetQualificationScoreResponse
        request = Protocol::JsonRpc.build_request(Model::GET_QUALIFICATION_SCORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetQualificationScoreResponse, "GetQualificationScore")
      end

      # The GetQualificationType operation retrieves information about a Qualification type using its ID.

      def get_qualification_type(
        qualification_type_id : String
      ) : Types::GetQualificationTypeResponse

        input = Types::GetQualificationTypeRequest.new(qualification_type_id: qualification_type_id)
        get_qualification_type(input)
      end

      def get_qualification_type(input : Types::GetQualificationTypeRequest) : Types::GetQualificationTypeResponse
        request = Protocol::JsonRpc.build_request(Model::GET_QUALIFICATION_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetQualificationTypeResponse, "GetQualificationType")
      end

      # The ListAssignmentsForHIT operation retrieves completed assignments for a HIT. You can use this
      # operation to retrieve the results for a HIT. You can get assignments for a HIT at any time, even if
      # the HIT is not yet Reviewable. If a HIT requested multiple assignments, and has received some
      # results but has not yet become Reviewable, you can still retrieve the partial results with this
      # operation. Use the AssignmentStatus parameter to control which set of assignments for a HIT are
      # returned. The ListAssignmentsForHIT operation can return submitted assignments awaiting approval, or
      # it can return assignments that have already been approved or rejected. You can set
      # AssignmentStatus=Approved,Rejected to get assignments that have already been approved and rejected
      # together in one result set. Only the Requester who created the HIT can retrieve the assignments for
      # that HIT. Results are sorted and divided into numbered pages and the operation returns a single page
      # of results. You can use the parameters of the operation to control sorting and pagination.

      def list_assignments_for_hit(
        hit_id : String,
        assignment_statuses : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAssignmentsForHITResponse

        input = Types::ListAssignmentsForHITRequest.new(hit_id: hit_id, assignment_statuses: assignment_statuses, max_results: max_results, next_token: next_token)
        list_assignments_for_hit(input)
      end

      def list_assignments_for_hit(input : Types::ListAssignmentsForHITRequest) : Types::ListAssignmentsForHITResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ASSIGNMENTS_FOR_HIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAssignmentsForHITResponse, "ListAssignmentsForHIT")
      end

      # The ListBonusPayments operation retrieves the amounts of bonuses you have paid to Workers for a
      # given HIT or assignment.

      def list_bonus_payments(
        assignment_id : String? = nil,
        hit_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListBonusPaymentsResponse

        input = Types::ListBonusPaymentsRequest.new(assignment_id: assignment_id, hit_id: hit_id, max_results: max_results, next_token: next_token)
        list_bonus_payments(input)
      end

      def list_bonus_payments(input : Types::ListBonusPaymentsRequest) : Types::ListBonusPaymentsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_BONUS_PAYMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBonusPaymentsResponse, "ListBonusPayments")
      end

      # The ListHITs operation returns all of a Requester's HITs. The operation returns HITs of any status,
      # except for HITs that have been deleted of with the DeleteHIT operation or that have been
      # auto-deleted.

      def list_hi_ts(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListHITsResponse

        input = Types::ListHITsRequest.new(max_results: max_results, next_token: next_token)
        list_hi_ts(input)
      end

      def list_hi_ts(input : Types::ListHITsRequest) : Types::ListHITsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_HI_TS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListHITsResponse, "ListHITs")
      end

      # The ListHITsForQualificationType operation returns the HITs that use the given Qualification type
      # for a Qualification requirement. The operation returns HITs of any status, except for HITs that have
      # been deleted with the DeleteHIT operation or that have been auto-deleted.

      def list_hi_ts_for_qualification_type(
        qualification_type_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListHITsForQualificationTypeResponse

        input = Types::ListHITsForQualificationTypeRequest.new(qualification_type_id: qualification_type_id, max_results: max_results, next_token: next_token)
        list_hi_ts_for_qualification_type(input)
      end

      def list_hi_ts_for_qualification_type(input : Types::ListHITsForQualificationTypeRequest) : Types::ListHITsForQualificationTypeResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_HI_TS_FOR_QUALIFICATION_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListHITsForQualificationTypeResponse, "ListHITsForQualificationType")
      end

      # The ListQualificationRequests operation retrieves requests for Qualifications of a particular
      # Qualification type. The owner of the Qualification type calls this operation to poll for pending
      # requests, and accepts them using the AcceptQualification operation.

      def list_qualification_requests(
        max_results : Int32? = nil,
        next_token : String? = nil,
        qualification_type_id : String? = nil
      ) : Types::ListQualificationRequestsResponse

        input = Types::ListQualificationRequestsRequest.new(max_results: max_results, next_token: next_token, qualification_type_id: qualification_type_id)
        list_qualification_requests(input)
      end

      def list_qualification_requests(input : Types::ListQualificationRequestsRequest) : Types::ListQualificationRequestsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_QUALIFICATION_REQUESTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListQualificationRequestsResponse, "ListQualificationRequests")
      end

      # The ListQualificationTypes operation returns a list of Qualification types, filtered by an optional
      # search term.

      def list_qualification_types(
        must_be_requestable : Bool,
        max_results : Int32? = nil,
        must_be_owned_by_caller : Bool? = nil,
        next_token : String? = nil,
        query : String? = nil
      ) : Types::ListQualificationTypesResponse

        input = Types::ListQualificationTypesRequest.new(must_be_requestable: must_be_requestable, max_results: max_results, must_be_owned_by_caller: must_be_owned_by_caller, next_token: next_token, query: query)
        list_qualification_types(input)
      end

      def list_qualification_types(input : Types::ListQualificationTypesRequest) : Types::ListQualificationTypesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_QUALIFICATION_TYPES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListQualificationTypesResponse, "ListQualificationTypes")
      end

      # The ListReviewPolicyResultsForHIT operation retrieves the computed results and the actions taken in
      # the course of executing your Review Policies for a given HIT. For information about how to specify
      # Review Policies when you call CreateHIT, see Review Policies. The ListReviewPolicyResultsForHIT
      # operation can return results for both Assignment-level and HIT-level review results.

      def list_review_policy_results_for_hit(
        hit_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        policy_levels : Array(String)? = nil,
        retrieve_actions : Bool? = nil,
        retrieve_results : Bool? = nil
      ) : Types::ListReviewPolicyResultsForHITResponse

        input = Types::ListReviewPolicyResultsForHITRequest.new(hit_id: hit_id, max_results: max_results, next_token: next_token, policy_levels: policy_levels, retrieve_actions: retrieve_actions, retrieve_results: retrieve_results)
        list_review_policy_results_for_hit(input)
      end

      def list_review_policy_results_for_hit(input : Types::ListReviewPolicyResultsForHITRequest) : Types::ListReviewPolicyResultsForHITResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_REVIEW_POLICY_RESULTS_FOR_HIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListReviewPolicyResultsForHITResponse, "ListReviewPolicyResultsForHIT")
      end

      # The ListReviewableHITs operation retrieves the HITs with Status equal to Reviewable or Status equal
      # to Reviewing that belong to the Requester calling the operation.

      def list_reviewable_hi_ts(
        hit_type_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Types::ListReviewableHITsResponse

        input = Types::ListReviewableHITsRequest.new(hit_type_id: hit_type_id, max_results: max_results, next_token: next_token, status: status)
        list_reviewable_hi_ts(input)
      end

      def list_reviewable_hi_ts(input : Types::ListReviewableHITsRequest) : Types::ListReviewableHITsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_REVIEWABLE_HI_TS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListReviewableHITsResponse, "ListReviewableHITs")
      end

      # The ListWorkersBlocks operation retrieves a list of Workers who are blocked from working on your
      # HITs.

      def list_worker_blocks(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListWorkerBlocksResponse

        input = Types::ListWorkerBlocksRequest.new(max_results: max_results, next_token: next_token)
        list_worker_blocks(input)
      end

      def list_worker_blocks(input : Types::ListWorkerBlocksRequest) : Types::ListWorkerBlocksResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WORKER_BLOCKS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWorkerBlocksResponse, "ListWorkerBlocks")
      end

      # The ListWorkersWithQualificationType operation returns all of the Workers that have been associated
      # with a given Qualification type.

      def list_workers_with_qualification_type(
        qualification_type_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        status : String? = nil
      ) : Types::ListWorkersWithQualificationTypeResponse

        input = Types::ListWorkersWithQualificationTypeRequest.new(qualification_type_id: qualification_type_id, max_results: max_results, next_token: next_token, status: status)
        list_workers_with_qualification_type(input)
      end

      def list_workers_with_qualification_type(input : Types::ListWorkersWithQualificationTypeRequest) : Types::ListWorkersWithQualificationTypeResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_WORKERS_WITH_QUALIFICATION_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListWorkersWithQualificationTypeResponse, "ListWorkersWithQualificationType")
      end

      # The NotifyWorkers operation sends an email to one or more Workers that you specify with the Worker
      # ID. You can specify up to 100 Worker IDs to send the same message with a single call to the
      # NotifyWorkers operation. The NotifyWorkers operation will send a notification email to a Worker only
      # if you have previously approved or rejected work from the Worker.

      def notify_workers(
        message_text : String,
        subject : String,
        worker_ids : Array(String)
      ) : Types::NotifyWorkersResponse

        input = Types::NotifyWorkersRequest.new(message_text: message_text, subject: subject, worker_ids: worker_ids)
        notify_workers(input)
      end

      def notify_workers(input : Types::NotifyWorkersRequest) : Types::NotifyWorkersResponse
        request = Protocol::JsonRpc.build_request(Model::NOTIFY_WORKERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::NotifyWorkersResponse, "NotifyWorkers")
      end

      # The RejectAssignment operation rejects the results of a completed assignment. You can include an
      # optional feedback message with the rejection, which the Worker can see in the Status section of the
      # web site. When you include a feedback message with the rejection, it helps the Worker understand why
      # the assignment was rejected, and can improve the quality of the results the Worker submits in the
      # future. Only the Requester who created the HIT can reject an assignment for the HIT.

      def reject_assignment(
        assignment_id : String,
        requester_feedback : String
      ) : Types::RejectAssignmentResponse

        input = Types::RejectAssignmentRequest.new(assignment_id: assignment_id, requester_feedback: requester_feedback)
        reject_assignment(input)
      end

      def reject_assignment(input : Types::RejectAssignmentRequest) : Types::RejectAssignmentResponse
        request = Protocol::JsonRpc.build_request(Model::REJECT_ASSIGNMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RejectAssignmentResponse, "RejectAssignment")
      end

      # The RejectQualificationRequest operation rejects a user's request for a Qualification. You can
      # provide a text message explaining why the request was rejected. The Worker who made the request can
      # see this message.

      def reject_qualification_request(
        qualification_request_id : String,
        reason : String? = nil
      ) : Types::RejectQualificationRequestResponse

        input = Types::RejectQualificationRequestRequest.new(qualification_request_id: qualification_request_id, reason: reason)
        reject_qualification_request(input)
      end

      def reject_qualification_request(input : Types::RejectQualificationRequestRequest) : Types::RejectQualificationRequestResponse
        request = Protocol::JsonRpc.build_request(Model::REJECT_QUALIFICATION_REQUEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RejectQualificationRequestResponse, "RejectQualificationRequest")
      end

      # The SendBonus operation issues a payment of money from your account to a Worker. This payment
      # happens separately from the reward you pay to the Worker when you approve the Worker's assignment.
      # The SendBonus operation requires the Worker's ID and the assignment ID as parameters to initiate
      # payment of the bonus. You must include a message that explains the reason for the bonus payment, as
      # the Worker may not be expecting the payment. Amazon Mechanical Turk collects a fee for bonus
      # payments, similar to the HIT listing fee. This operation fails if your account does not have enough
      # funds to pay for both the bonus and the fees.

      def send_bonus(
        assignment_id : String,
        bonus_amount : String,
        reason : String,
        worker_id : String,
        unique_request_token : String? = nil
      ) : Types::SendBonusResponse

        input = Types::SendBonusRequest.new(assignment_id: assignment_id, bonus_amount: bonus_amount, reason: reason, worker_id: worker_id, unique_request_token: unique_request_token)
        send_bonus(input)
      end

      def send_bonus(input : Types::SendBonusRequest) : Types::SendBonusResponse
        request = Protocol::JsonRpc.build_request(Model::SEND_BONUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendBonusResponse, "SendBonus")
      end

      # The SendTestEventNotification operation causes Amazon Mechanical Turk to send a notification message
      # as if a HIT event occurred, according to the provided notification specification. This allows you to
      # test notifications without setting up notifications for a real HIT type and trying to trigger them
      # using the website. When you call this operation, the service attempts to send the test notification
      # immediately.

      def send_test_event_notification(
        notification : Types::NotificationSpecification,
        test_event_type : String
      ) : Types::SendTestEventNotificationResponse

        input = Types::SendTestEventNotificationRequest.new(notification: notification, test_event_type: test_event_type)
        send_test_event_notification(input)
      end

      def send_test_event_notification(input : Types::SendTestEventNotificationRequest) : Types::SendTestEventNotificationResponse
        request = Protocol::JsonRpc.build_request(Model::SEND_TEST_EVENT_NOTIFICATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SendTestEventNotificationResponse, "SendTestEventNotification")
      end

      # The UpdateExpirationForHIT operation allows you update the expiration time of a HIT. If you update
      # it to a time in the past, the HIT will be immediately expired.

      def update_expiration_for_hit(
        expire_at : Time,
        hit_id : String
      ) : Types::UpdateExpirationForHITResponse

        input = Types::UpdateExpirationForHITRequest.new(expire_at: expire_at, hit_id: hit_id)
        update_expiration_for_hit(input)
      end

      def update_expiration_for_hit(input : Types::UpdateExpirationForHITRequest) : Types::UpdateExpirationForHITResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_EXPIRATION_FOR_HIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateExpirationForHITResponse, "UpdateExpirationForHIT")
      end

      # The UpdateHITReviewStatus operation updates the status of a HIT. If the status is Reviewable, this
      # operation can update the status to Reviewing, or it can revert a Reviewing HIT back to the
      # Reviewable status.

      def update_hit_review_status(
        hit_id : String,
        revert : Bool? = nil
      ) : Types::UpdateHITReviewStatusResponse

        input = Types::UpdateHITReviewStatusRequest.new(hit_id: hit_id, revert: revert)
        update_hit_review_status(input)
      end

      def update_hit_review_status(input : Types::UpdateHITReviewStatusRequest) : Types::UpdateHITReviewStatusResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_HIT_REVIEW_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateHITReviewStatusResponse, "UpdateHITReviewStatus")
      end

      # The UpdateHITTypeOfHIT operation allows you to change the HITType properties of a HIT. This
      # operation disassociates the HIT from its old HITType properties and associates it with the new
      # HITType properties. The HIT takes on the properties of the new HITType in place of the old ones.

      def update_hit_type_of_hit(
        hit_id : String,
        hit_type_id : String
      ) : Types::UpdateHITTypeOfHITResponse

        input = Types::UpdateHITTypeOfHITRequest.new(hit_id: hit_id, hit_type_id: hit_type_id)
        update_hit_type_of_hit(input)
      end

      def update_hit_type_of_hit(input : Types::UpdateHITTypeOfHITRequest) : Types::UpdateHITTypeOfHITResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_HIT_TYPE_OF_HIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateHITTypeOfHITResponse, "UpdateHITTypeOfHIT")
      end

      # The UpdateNotificationSettings operation creates, updates, disables or re-enables notifications for
      # a HIT type. If you call the UpdateNotificationSettings operation for a HIT type that already has a
      # notification specification, the operation replaces the old specification with a new one. You can
      # call the UpdateNotificationSettings operation to enable or disable notifications for the HIT type,
      # without having to modify the notification specification itself by providing updates to the Active
      # status without specifying a new notification specification. To change the Active status of a HIT
      # type's notifications, the HIT type must already have a notification specification, or one must be
      # provided in the same call to UpdateNotificationSettings .

      def update_notification_settings(
        hit_type_id : String,
        active : Bool? = nil,
        notification : Types::NotificationSpecification? = nil
      ) : Types::UpdateNotificationSettingsResponse

        input = Types::UpdateNotificationSettingsRequest.new(hit_type_id: hit_type_id, active: active, notification: notification)
        update_notification_settings(input)
      end

      def update_notification_settings(input : Types::UpdateNotificationSettingsRequest) : Types::UpdateNotificationSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_NOTIFICATION_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateNotificationSettingsResponse, "UpdateNotificationSettings")
      end

      # The UpdateQualificationType operation modifies the attributes of an existing Qualification type,
      # which is represented by a QualificationType data structure. Only the owner of a Qualification type
      # can modify its attributes. Most attributes of a Qualification type can be changed after the type has
      # been created. However, the Name and Keywords fields cannot be modified. The RetryDelayInSeconds
      # parameter can be modified or added to change the delay or to enable retries, but RetryDelayInSeconds
      # cannot be used to disable retries. You can use this operation to update the test for a Qualification
      # type. The test is updated based on the values specified for the Test, TestDurationInSeconds and
      # AnswerKey parameters. All three parameters specify the updated test. If you are updating the test
      # for a type, you must specify the Test and TestDurationInSeconds parameters. The AnswerKey parameter
      # is optional; omitting it specifies that the updated test does not have an answer key. If you omit
      # the Test parameter, the test for the Qualification type is unchanged. There is no way to remove a
      # test from a Qualification type that has one. If the type already has a test, you cannot update it to
      # be AutoGranted. If the Qualification type does not have a test and one is provided by an update, the
      # type will henceforth have a test. If you want to update the test duration or answer key for an
      # existing test without changing the questions, you must specify a Test parameter with the original
      # questions, along with the updated values. If you provide an updated Test but no AnswerKey, the new
      # test will not have an answer key. Requests for such Qualifications must be granted manually. You can
      # also update the AutoGranted and AutoGrantedValue attributes of the Qualification type.

      def update_qualification_type(
        qualification_type_id : String,
        answer_key : String? = nil,
        auto_granted : Bool? = nil,
        auto_granted_value : Int32? = nil,
        description : String? = nil,
        qualification_type_status : String? = nil,
        retry_delay_in_seconds : Int64? = nil,
        test : String? = nil,
        test_duration_in_seconds : Int64? = nil
      ) : Types::UpdateQualificationTypeResponse

        input = Types::UpdateQualificationTypeRequest.new(qualification_type_id: qualification_type_id, answer_key: answer_key, auto_granted: auto_granted, auto_granted_value: auto_granted_value, description: description, qualification_type_status: qualification_type_status, retry_delay_in_seconds: retry_delay_in_seconds, test: test, test_duration_in_seconds: test_duration_in_seconds)
        update_qualification_type(input)
      end

      def update_qualification_type(input : Types::UpdateQualificationTypeRequest) : Types::UpdateQualificationTypeResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_QUALIFICATION_TYPE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateQualificationTypeResponse, "UpdateQualificationType")
      end
    end
  end
end
