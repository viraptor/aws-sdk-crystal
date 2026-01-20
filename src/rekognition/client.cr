module Aws
  module Rekognition
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

      # Associates one or more faces with an existing UserID. Takes an array of FaceIds . Each FaceId that
      # are present in the FaceIds list is associated with the provided UserID. The number of FaceIds that
      # can be used as input in a single request is limited to 100. Note that the total number of faces that
      # can be associated with a single UserID is also limited to 100. Once a UserID has 100 faces
      # associated with it, no additional faces can be added. If more API calls are made after the limit is
      # reached, a ServiceQuotaExceededException will result. The UserMatchThreshold parameter specifies the
      # minimum user match confidence required for the face to be associated with a UserID that has at least
      # one FaceID already associated. This ensures that the FaceIds are associated with the right UserID.
      # The value ranges from 0-100 and default value is 75. If successful, an array of AssociatedFace
      # objects containing the associated FaceIds is returned. If a given face is already associated with
      # the given UserID , it will be ignored and will not be returned in the response. If a given face is
      # already associated to a different UserID , isn't found in the collection, doesn’t meet the
      # UserMatchThreshold , or there are already 100 faces associated with the UserID , it will be returned
      # as part of an array of UnsuccessfulFaceAssociations. The UserStatus reflects the status of an
      # operation which updates a UserID representation with a list of given faces. The UserStatus can be:
      # ACTIVE - All associations or disassociations of FaceID(s) for a UserID are complete. CREATED - A
      # UserID has been created, but has no FaceID(s) associated with it. UPDATING - A UserID is being
      # updated and there are current associations or disassociations of FaceID(s) taking place.

      def associate_faces(
        collection_id : String,
        face_ids : Array(String),
        user_id : String,
        client_request_token : String? = nil,
        user_match_threshold : Float64? = nil
      ) : Types::AssociateFacesResponse

        input = Types::AssociateFacesRequest.new(collection_id: collection_id, face_ids: face_ids, user_id: user_id, client_request_token: client_request_token, user_match_threshold: user_match_threshold)
        associate_faces(input)
      end

      def associate_faces(input : Types::AssociateFacesRequest) : Types::AssociateFacesResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_FACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateFacesResponse, "AssociateFaces")
      end

      # Compares a face in the source input image with each of the 100 largest faces detected in the target
      # input image. If the source image contains multiple faces, the service detects the largest face and
      # compares it with each face detected in the target image. CompareFaces uses machine learning
      # algorithms, which are probabilistic. A false negative is an incorrect prediction that a face in the
      # target image has a low similarity confidence score when compared to the face in the source image. To
      # reduce the probability of false negatives, we recommend that you compare the target image against
      # multiple source images. If you plan to use CompareFaces to make a decision that impacts an
      # individual's rights, privacy, or access to services, we recommend that you pass the result to a
      # human for review and further validation before taking action. You pass the input and target images
      # either as base64-encoded image bytes or as references to images in an Amazon S3 bucket. If you use
      # the AWS CLI to call Amazon Rekognition operations, passing image bytes isn't supported. The image
      # must be formatted as a PNG or JPEG file. In response, the operation returns an array of face matches
      # ordered by similarity score in descending order. For each face match, the response provides a
      # bounding box of the face, facial landmarks, pose details (pitch, roll, and yaw), quality (brightness
      # and sharpness), and confidence value (indicating the level of confidence that the bounding box
      # contains a face). The response also provides a similarity score, which indicates how closely the
      # faces match. By default, only faces with a similarity score of greater than or equal to 80% are
      # returned in the response. You can change this value by specifying the SimilarityThreshold parameter.
      # CompareFaces also returns an array of faces that don't match the source image. For each face, it
      # returns a bounding box, confidence value, landmarks, pose details, and quality. The response also
      # returns information about the face in the source image, including the bounding box of the face and
      # confidence value. The QualityFilter input parameter allows you to filter out detected faces that
      # don’t meet a required quality bar. The quality bar is based on a variety of common use cases. Use
      # QualityFilter to set the quality bar by specifying LOW , MEDIUM , or HIGH . If you do not want to
      # filter detected faces, specify NONE . The default value is NONE . If the image doesn't contain Exif
      # metadata, CompareFaces returns orientation information for the source and target images. Use these
      # values to display the images with the correct image orientation. If no faces are detected in the
      # source or target images, CompareFaces returns an InvalidParameterException error. This is a
      # stateless API operation. That is, data returned by this operation doesn't persist. For an example,
      # see Comparing Faces in Images in the Amazon Rekognition Developer Guide. This operation requires
      # permissions to perform the rekognition:CompareFaces action.

      def compare_faces(
        source_image : Types::Image,
        target_image : Types::Image,
        quality_filter : String? = nil,
        similarity_threshold : Float64? = nil
      ) : Types::CompareFacesResponse

        input = Types::CompareFacesRequest.new(source_image: source_image, target_image: target_image, quality_filter: quality_filter, similarity_threshold: similarity_threshold)
        compare_faces(input)
      end

      def compare_faces(input : Types::CompareFacesRequest) : Types::CompareFacesResponse
        request = Protocol::JsonRpc.build_request(Model::COMPARE_FACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CompareFacesResponse, "CompareFaces")
      end

      # This operation applies only to Amazon Rekognition Custom Labels. Copies a version of an Amazon
      # Rekognition Custom Labels model from a source project to a destination project. The source and
      # destination projects can be in different AWS accounts but must be in the same AWS Region. You can't
      # copy a model to another AWS service. To copy a model version to a different AWS account, you need to
      # create a resource-based policy known as a project policy . You attach the project policy to the
      # source project by calling PutProjectPolicy . The project policy gives permission to copy the model
      # version from a trusting AWS account to a trusted account. For more information creating and
      # attaching a project policy, see Attaching a project policy (SDK) in the Amazon Rekognition Custom
      # Labels Developer Guide . If you are copying a model version to a project in the same AWS account,
      # you don't need to create a project policy. Copying project versions is supported only for Custom
      # Labels models. To copy a model, the destination project, source project, and source model version
      # must already exist. Copying a model version takes a while to complete. To get the current status,
      # call DescribeProjectVersions and check the value of Status in the ProjectVersionDescription object.
      # The copy operation has finished when the value of Status is COPYING_COMPLETED . This operation
      # requires permissions to perform the rekognition:CopyProjectVersion action.

      def copy_project_version(
        destination_project_arn : String,
        output_config : Types::OutputConfig,
        source_project_arn : String,
        source_project_version_arn : String,
        version_name : String,
        kms_key_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CopyProjectVersionResponse

        input = Types::CopyProjectVersionRequest.new(destination_project_arn: destination_project_arn, output_config: output_config, source_project_arn: source_project_arn, source_project_version_arn: source_project_version_arn, version_name: version_name, kms_key_id: kms_key_id, tags: tags)
        copy_project_version(input)
      end

      def copy_project_version(input : Types::CopyProjectVersionRequest) : Types::CopyProjectVersionResponse
        request = Protocol::JsonRpc.build_request(Model::COPY_PROJECT_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CopyProjectVersionResponse, "CopyProjectVersion")
      end

      # Creates a collection in an AWS Region. You can add faces to the collection using the IndexFaces
      # operation. For example, you might create collections, one for each of your application users. A user
      # can then index faces using the IndexFaces operation and persist results in a specific collection.
      # Then, a user can search the collection for faces in the user-specific container. When you create a
      # collection, it is associated with the latest version of the face model version. Collection names are
      # case-sensitive. This operation requires permissions to perform the rekognition:CreateCollection
      # action. If you want to tag your collection, you also require permission to perform the
      # rekognition:TagResource operation.

      def create_collection(
        collection_id : String,
        tags : Hash(String, String)? = nil
      ) : Types::CreateCollectionResponse

        input = Types::CreateCollectionRequest.new(collection_id: collection_id, tags: tags)
        create_collection(input)
      end

      def create_collection(input : Types::CreateCollectionRequest) : Types::CreateCollectionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_COLLECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCollectionResponse, "CreateCollection")
      end

      # This operation applies only to Amazon Rekognition Custom Labels. Creates a new Amazon Rekognition
      # Custom Labels dataset. You can create a dataset by using an Amazon Sagemaker format manifest file or
      # by copying an existing Amazon Rekognition Custom Labels dataset. To create a training dataset for a
      # project, specify TRAIN for the value of DatasetType . To create the test dataset for a project,
      # specify TEST for the value of DatasetType . The response from CreateDataset is the Amazon Resource
      # Name (ARN) for the dataset. Creating a dataset takes a while to complete. Use DescribeDataset to
      # check the current status. The dataset created successfully if the value of Status is CREATE_COMPLETE
      # . To check if any non-terminal errors occurred, call ListDatasetEntries and check for the presence
      # of errors lists in the JSON Lines. Dataset creation fails if a terminal error occurs ( Status =
      # CREATE_FAILED ). Currently, you can't access the terminal error information. For more information,
      # see Creating dataset in the Amazon Rekognition Custom Labels Developer Guide . This operation
      # requires permissions to perform the rekognition:CreateDataset action. If you want to copy an
      # existing dataset, you also require permission to perform the rekognition:ListDatasetEntries action.

      def create_dataset(
        dataset_type : String,
        project_arn : String,
        dataset_source : Types::DatasetSource? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateDatasetResponse

        input = Types::CreateDatasetRequest.new(dataset_type: dataset_type, project_arn: project_arn, dataset_source: dataset_source, tags: tags)
        create_dataset(input)
      end

      def create_dataset(input : Types::CreateDatasetRequest) : Types::CreateDatasetResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_DATASET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDatasetResponse, "CreateDataset")
      end

      # This API operation initiates a Face Liveness session. It returns a SessionId , which you can use to
      # start streaming Face Liveness video and get the results for a Face Liveness session. You can use the
      # OutputConfig option in the Settings parameter to provide an Amazon S3 bucket location. The Amazon S3
      # bucket stores reference images and audit images. If no Amazon S3 bucket is defined, raw bytes are
      # sent instead. You can use AuditImagesLimit to limit the number of audit images returned when
      # GetFaceLivenessSessionResults is called. This number is between 0 and 4. By default, it is set to 0.
      # The limit is best effort and based on the duration of the selfie-video.

      def create_face_liveness_session(
        client_request_token : String? = nil,
        kms_key_id : String? = nil,
        settings : Types::CreateFaceLivenessSessionRequestSettings? = nil
      ) : Types::CreateFaceLivenessSessionResponse

        input = Types::CreateFaceLivenessSessionRequest.new(client_request_token: client_request_token, kms_key_id: kms_key_id, settings: settings)
        create_face_liveness_session(input)
      end

      def create_face_liveness_session(input : Types::CreateFaceLivenessSessionRequest) : Types::CreateFaceLivenessSessionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FACE_LIVENESS_SESSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFaceLivenessSessionResponse, "CreateFaceLivenessSession")
      end

      # Creates a new Amazon Rekognition project. A project is a group of resources (datasets, model
      # versions) that you use to create and manage a Amazon Rekognition Custom Labels Model or custom
      # adapter. You can specify a feature to create the project with, if no feature is specified then
      # Custom Labels is used by default. For adapters, you can also choose whether or not to have the
      # project auto update by using the AutoUpdate argument. This operation requires permissions to perform
      # the rekognition:CreateProject action.

      def create_project(
        project_name : String,
        auto_update : String? = nil,
        feature : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateProjectResponse

        input = Types::CreateProjectRequest.new(project_name: project_name, auto_update: auto_update, feature: feature, tags: tags)
        create_project(input)
      end

      def create_project(input : Types::CreateProjectRequest) : Types::CreateProjectResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProjectResponse, "CreateProject")
      end

      # Creates a new version of Amazon Rekognition project (like a Custom Labels model or a custom adapter)
      # and begins training. Models and adapters are managed as part of a Rekognition project. The response
      # from CreateProjectVersion is an Amazon Resource Name (ARN) for the project version. The
      # FeatureConfig operation argument allows you to configure specific model or adapter settings. You can
      # provide a description to the project version by using the VersionDescription argment. Training can
      # take a while to complete. You can get the current status by calling DescribeProjectVersions .
      # Training completed successfully if the value of the Status field is TRAINING_COMPLETED . Once
      # training has successfully completed, call DescribeProjectVersions to get the training results and
      # evaluate the model. This operation requires permissions to perform the
      # rekognition:CreateProjectVersion action. The following applies only to projects with Amazon
      # Rekognition Custom Labels as the chosen feature: You can train a model in a project that doesn't
      # have associated datasets by specifying manifest files in the TrainingData and TestingData fields. If
      # you open the console after training a model with manifest files, Amazon Rekognition Custom Labels
      # creates the datasets for you using the most recent manifest files. You can no longer train a model
      # version for the project by specifying manifest files. Instead of training with a project without
      # associated datasets, we recommend that you use the manifest files to create training and test
      # datasets for the project.

      def create_project_version(
        output_config : Types::OutputConfig,
        project_arn : String,
        version_name : String,
        feature_config : Types::CustomizationFeatureConfig? = nil,
        kms_key_id : String? = nil,
        tags : Hash(String, String)? = nil,
        testing_data : Types::TestingData? = nil,
        training_data : Types::TrainingData? = nil,
        version_description : String? = nil
      ) : Types::CreateProjectVersionResponse

        input = Types::CreateProjectVersionRequest.new(output_config: output_config, project_arn: project_arn, version_name: version_name, feature_config: feature_config, kms_key_id: kms_key_id, tags: tags, testing_data: testing_data, training_data: training_data, version_description: version_description)
        create_project_version(input)
      end

      def create_project_version(input : Types::CreateProjectVersionRequest) : Types::CreateProjectVersionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROJECT_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProjectVersionResponse, "CreateProjectVersion")
      end

      # Creates an Amazon Rekognition stream processor that you can use to detect and recognize faces or to
      # detect labels in a streaming video. Amazon Rekognition Video is a consumer of live video from Amazon
      # Kinesis Video Streams. There are two different settings for stream processors in Amazon Rekognition:
      # detecting faces and detecting labels. If you are creating a stream processor for detecting faces,
      # you provide as input a Kinesis video stream ( Input ) and a Kinesis data stream ( Output ) stream
      # for receiving the output. You must use the FaceSearch option in Settings , specifying the collection
      # that contains the faces you want to recognize. After you have finished analyzing a streaming video,
      # use StopStreamProcessor to stop processing. If you are creating a stream processor to detect labels,
      # you provide as input a Kinesis video stream ( Input ), Amazon S3 bucket information ( Output ), and
      # an Amazon SNS topic ARN ( NotificationChannel ). You can also provide a KMS key ID to encrypt the
      # data sent to your Amazon S3 bucket. You specify what you want to detect by using the ConnectedHome
      # option in settings, and selecting one of the following: PERSON , PET , PACKAGE , ALL You can also
      # specify where in the frame you want Amazon Rekognition to monitor with RegionsOfInterest . When you
      # run the StartStreamProcessor operation on a label detection stream processor, you input start and
      # stop information to determine the length of the processing time. Use Name to assign an identifier
      # for the stream processor. You use Name to manage the stream processor. For example, you can start
      # processing the source video by calling StartStreamProcessor with the Name field. This operation
      # requires permissions to perform the rekognition:CreateStreamProcessor action. If you want to tag
      # your stream processor, you also require permission to perform the rekognition:TagResource operation.

      def create_stream_processor(
        input : Types::StreamProcessorInput,
        name : String,
        output : Types::StreamProcessorOutput,
        role_arn : String,
        settings : Types::StreamProcessorSettings,
        data_sharing_preference : Types::StreamProcessorDataSharingPreference? = nil,
        kms_key_id : String? = nil,
        notification_channel : Types::StreamProcessorNotificationChannel? = nil,
        regions_of_interest : Array(Types::RegionOfInterest)? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateStreamProcessorResponse

        input = Types::CreateStreamProcessorRequest.new(input: input, name: name, output: output, role_arn: role_arn, settings: settings, data_sharing_preference: data_sharing_preference, kms_key_id: kms_key_id, notification_channel: notification_channel, regions_of_interest: regions_of_interest, tags: tags)
        create_stream_processor(input)
      end

      def create_stream_processor(input : Types::CreateStreamProcessorRequest) : Types::CreateStreamProcessorResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_STREAM_PROCESSOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateStreamProcessorResponse, "CreateStreamProcessor")
      end

      # Creates a new User within a collection specified by CollectionId . Takes UserId as a parameter,
      # which is a user provided ID which should be unique within the collection. The provided UserId will
      # alias the system generated UUID to make the UserId more user friendly. Uses a ClientToken , an
      # idempotency token that ensures a call to CreateUser completes only once. If the value is not
      # supplied, the AWS SDK generates an idempotency token for the requests. This prevents retries after a
      # network error results from making multiple CreateUser calls.

      def create_user(
        collection_id : String,
        user_id : String,
        client_request_token : String? = nil
      ) : Types::CreateUserResponse

        input = Types::CreateUserRequest.new(collection_id: collection_id, user_id: user_id, client_request_token: client_request_token)
        create_user(input)
      end

      def create_user(input : Types::CreateUserRequest) : Types::CreateUserResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateUserResponse, "CreateUser")
      end

      # Deletes the specified collection. Note that this operation removes all faces in the collection. For
      # an example, see Deleting a collection . This operation requires permissions to perform the
      # rekognition:DeleteCollection action.

      def delete_collection(
        collection_id : String
      ) : Types::DeleteCollectionResponse

        input = Types::DeleteCollectionRequest.new(collection_id: collection_id)
        delete_collection(input)
      end

      def delete_collection(input : Types::DeleteCollectionRequest) : Types::DeleteCollectionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_COLLECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCollectionResponse, "DeleteCollection")
      end

      # This operation applies only to Amazon Rekognition Custom Labels. Deletes an existing Amazon
      # Rekognition Custom Labels dataset. Deleting a dataset might take while. Use DescribeDataset to check
      # the current status. The dataset is still deleting if the value of Status is DELETE_IN_PROGRESS . If
      # you try to access the dataset after it is deleted, you get a ResourceNotFoundException exception.
      # You can't delete a dataset while it is creating ( Status = CREATE_IN_PROGRESS ) or if the dataset is
      # updating ( Status = UPDATE_IN_PROGRESS ). This operation requires permissions to perform the
      # rekognition:DeleteDataset action.

      def delete_dataset(
        dataset_arn : String
      ) : Types::DeleteDatasetResponse

        input = Types::DeleteDatasetRequest.new(dataset_arn: dataset_arn)
        delete_dataset(input)
      end

      def delete_dataset(input : Types::DeleteDatasetRequest) : Types::DeleteDatasetResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_DATASET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDatasetResponse, "DeleteDataset")
      end

      # Deletes faces from a collection. You specify a collection ID and an array of face IDs to remove from
      # the collection. This operation requires permissions to perform the rekognition:DeleteFaces action.

      def delete_faces(
        collection_id : String,
        face_ids : Array(String)
      ) : Types::DeleteFacesResponse

        input = Types::DeleteFacesRequest.new(collection_id: collection_id, face_ids: face_ids)
        delete_faces(input)
      end

      def delete_faces(input : Types::DeleteFacesRequest) : Types::DeleteFacesResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_FACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFacesResponse, "DeleteFaces")
      end

      # Deletes a Amazon Rekognition project. To delete a project you must first delete all models or
      # adapters associated with the project. To delete a model or adapter, see DeleteProjectVersion .
      # DeleteProject is an asynchronous operation. To check if the project is deleted, call
      # DescribeProjects . The project is deleted when the project no longer appears in the response. Be
      # aware that deleting a given project will also delete any ProjectPolicies associated with that
      # project. This operation requires permissions to perform the rekognition:DeleteProject action.

      def delete_project(
        project_arn : String
      ) : Types::DeleteProjectResponse

        input = Types::DeleteProjectRequest.new(project_arn: project_arn)
        delete_project(input)
      end

      def delete_project(input : Types::DeleteProjectRequest) : Types::DeleteProjectResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROJECT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteProjectResponse, "DeleteProject")
      end

      # This operation applies only to Amazon Rekognition Custom Labels. Deletes an existing project policy.
      # To get a list of project policies attached to a project, call ListProjectPolicies . To attach a
      # project policy to a project, call PutProjectPolicy . This operation requires permissions to perform
      # the rekognition:DeleteProjectPolicy action.

      def delete_project_policy(
        policy_name : String,
        project_arn : String,
        policy_revision_id : String? = nil
      ) : Types::DeleteProjectPolicyResponse

        input = Types::DeleteProjectPolicyRequest.new(policy_name: policy_name, project_arn: project_arn, policy_revision_id: policy_revision_id)
        delete_project_policy(input)
      end

      def delete_project_policy(input : Types::DeleteProjectPolicyRequest) : Types::DeleteProjectPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROJECT_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteProjectPolicyResponse, "DeleteProjectPolicy")
      end

      # Deletes a Rekognition project model or project version, like a Amazon Rekognition Custom Labels
      # model or a custom adapter. You can't delete a project version if it is running or if it is training.
      # To check the status of a project version, use the Status field returned from DescribeProjectVersions
      # . To stop a project version call StopProjectVersion . If the project version is training, wait until
      # it finishes. This operation requires permissions to perform the rekognition:DeleteProjectVersion
      # action.

      def delete_project_version(
        project_version_arn : String
      ) : Types::DeleteProjectVersionResponse

        input = Types::DeleteProjectVersionRequest.new(project_version_arn: project_version_arn)
        delete_project_version(input)
      end

      def delete_project_version(input : Types::DeleteProjectVersionRequest) : Types::DeleteProjectVersionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROJECT_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteProjectVersionResponse, "DeleteProjectVersion")
      end

      # Deletes the stream processor identified by Name . You assign the value for Name when you create the
      # stream processor with CreateStreamProcessor . You might not be able to use the same name for a
      # stream processor for a few seconds after calling DeleteStreamProcessor .

      def delete_stream_processor(
        name : String
      ) : Types::DeleteStreamProcessorResponse

        input = Types::DeleteStreamProcessorRequest.new(name: name)
        delete_stream_processor(input)
      end

      def delete_stream_processor(input : Types::DeleteStreamProcessorRequest) : Types::DeleteStreamProcessorResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_STREAM_PROCESSOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteStreamProcessorResponse, "DeleteStreamProcessor")
      end

      # Deletes the specified UserID within the collection. Faces that are associated with the UserID are
      # disassociated from the UserID before deleting the specified UserID. If the specified Collection or
      # UserID is already deleted or not found, a ResourceNotFoundException will be thrown. If the action is
      # successful with a 200 response, an empty HTTP body is returned.

      def delete_user(
        collection_id : String,
        user_id : String,
        client_request_token : String? = nil
      ) : Types::DeleteUserResponse

        input = Types::DeleteUserRequest.new(collection_id: collection_id, user_id: user_id, client_request_token: client_request_token)
        delete_user(input)
      end

      def delete_user(input : Types::DeleteUserRequest) : Types::DeleteUserResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteUserResponse, "DeleteUser")
      end

      # Describes the specified collection. You can use DescribeCollection to get information, such as the
      # number of faces indexed into a collection and the version of the model used by the collection for
      # face detection. For more information, see Describing a Collection in the Amazon Rekognition
      # Developer Guide.

      def describe_collection(
        collection_id : String
      ) : Types::DescribeCollectionResponse

        input = Types::DescribeCollectionRequest.new(collection_id: collection_id)
        describe_collection(input)
      end

      def describe_collection(input : Types::DescribeCollectionRequest) : Types::DescribeCollectionResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_COLLECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeCollectionResponse, "DescribeCollection")
      end

      # This operation applies only to Amazon Rekognition Custom Labels. Describes an Amazon Rekognition
      # Custom Labels dataset. You can get information such as the current status of a dataset and
      # statistics about the images and labels in a dataset. This operation requires permissions to perform
      # the rekognition:DescribeDataset action.

      def describe_dataset(
        dataset_arn : String
      ) : Types::DescribeDatasetResponse

        input = Types::DescribeDatasetRequest.new(dataset_arn: dataset_arn)
        describe_dataset(input)
      end

      def describe_dataset(input : Types::DescribeDatasetRequest) : Types::DescribeDatasetResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DATASET, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDatasetResponse, "DescribeDataset")
      end

      # Lists and describes the versions of an Amazon Rekognition project. You can specify up to 10 model or
      # adapter versions in ProjectVersionArns . If you don't specify a value, descriptions for all
      # model/adapter versions in the project are returned. This operation requires permissions to perform
      # the rekognition:DescribeProjectVersions action.

      def describe_project_versions(
        project_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        version_names : Array(String)? = nil
      ) : Types::DescribeProjectVersionsResponse

        input = Types::DescribeProjectVersionsRequest.new(project_arn: project_arn, max_results: max_results, next_token: next_token, version_names: version_names)
        describe_project_versions(input)
      end

      def describe_project_versions(input : Types::DescribeProjectVersionsRequest) : Types::DescribeProjectVersionsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PROJECT_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProjectVersionsResponse, "DescribeProjectVersions")
      end

      # Gets information about your Rekognition projects. This operation requires permissions to perform the
      # rekognition:DescribeProjects action.

      def describe_projects(
        features : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        project_names : Array(String)? = nil
      ) : Types::DescribeProjectsResponse

        input = Types::DescribeProjectsRequest.new(features: features, max_results: max_results, next_token: next_token, project_names: project_names)
        describe_projects(input)
      end

      def describe_projects(input : Types::DescribeProjectsRequest) : Types::DescribeProjectsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PROJECTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeProjectsResponse, "DescribeProjects")
      end

      # Provides information about a stream processor created by CreateStreamProcessor . You can get
      # information about the input and output streams, the input parameters for the face recognition being
      # performed, and the current status of the stream processor.

      def describe_stream_processor(
        name : String
      ) : Types::DescribeStreamProcessorResponse

        input = Types::DescribeStreamProcessorRequest.new(name: name)
        describe_stream_processor(input)
      end

      def describe_stream_processor(input : Types::DescribeStreamProcessorRequest) : Types::DescribeStreamProcessorResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_STREAM_PROCESSOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeStreamProcessorResponse, "DescribeStreamProcessor")
      end

      # This operation applies only to Amazon Rekognition Custom Labels. Detects custom labels in a supplied
      # image by using an Amazon Rekognition Custom Labels model. You specify which version of a model
      # version to use by using the ProjectVersionArn input parameter. You pass the input image as
      # base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS
      # CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be
      # either a PNG or JPEG formatted file. For each object that the model version detects on an image, the
      # API returns a ( CustomLabel ) object in an array ( CustomLabels ). Each CustomLabel object provides
      # the label name ( Name ), the level of confidence that the image contains the object ( Confidence ),
      # and object location information, if it exists, for the label on the image ( Geometry ). To filter
      # labels that are returned, specify a value for MinConfidence . DetectCustomLabelsLabels only returns
      # labels with a confidence that's higher than the specified value. The value of MinConfidence maps to
      # the assumed threshold values created during training. For more information, see Assumed threshold in
      # the Amazon Rekognition Custom Labels Developer Guide. Amazon Rekognition Custom Labels metrics
      # expresses an assumed threshold as a floating point value between 0-1. The range of MinConfidence
      # normalizes the threshold value to a percentage value (0-100). Confidence responses from
      # DetectCustomLabels are also returned as a percentage. You can use MinConfidence to change the
      # precision and recall or your model. For more information, see Analyzing an image in the Amazon
      # Rekognition Custom Labels Developer Guide. If you don't specify a value for MinConfidence ,
      # DetectCustomLabels returns labels based on the assumed threshold of each label. This is a stateless
      # API operation. That is, the operation does not persist any data. This operation requires permissions
      # to perform the rekognition:DetectCustomLabels action. For more information, see Analyzing an image
      # in the Amazon Rekognition Custom Labels Developer Guide.

      def detect_custom_labels(
        image : Types::Image,
        project_version_arn : String,
        max_results : Int32? = nil,
        min_confidence : Float64? = nil
      ) : Types::DetectCustomLabelsResponse

        input = Types::DetectCustomLabelsRequest.new(image: image, project_version_arn: project_version_arn, max_results: max_results, min_confidence: min_confidence)
        detect_custom_labels(input)
      end

      def detect_custom_labels(input : Types::DetectCustomLabelsRequest) : Types::DetectCustomLabelsResponse
        request = Protocol::JsonRpc.build_request(Model::DETECT_CUSTOM_LABELS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetectCustomLabelsResponse, "DetectCustomLabels")
      end

      # Detects faces within an image that is provided as input. DetectFaces detects the 100 largest faces
      # in the image. For each face detected, the operation returns face details. These details include a
      # bounding box of the face, a confidence value (that the bounding box contains a face), and a fixed
      # set of attributes such as facial landmarks (for example, coordinates of eye and mouth), pose,
      # presence of facial occlusion, and so on. The face-detection algorithm is most effective on frontal
      # faces. For non-frontal or obscured faces, the algorithm might not detect the faces or might detect
      # faces with lower confidence. You pass the input image either as base64-encoded image bytes or as a
      # reference to an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition
      # operations, passing image bytes is not supported. The image must be either a PNG or JPEG formatted
      # file. This is a stateless API operation. That is, the operation does not persist any data. This
      # operation requires permissions to perform the rekognition:DetectFaces action.

      def detect_faces(
        image : Types::Image,
        attributes : Array(String)? = nil
      ) : Types::DetectFacesResponse

        input = Types::DetectFacesRequest.new(image: image, attributes: attributes)
        detect_faces(input)
      end

      def detect_faces(input : Types::DetectFacesRequest) : Types::DetectFacesResponse
        request = Protocol::JsonRpc.build_request(Model::DETECT_FACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetectFacesResponse, "DetectFaces")
      end

      # Detects instances of real-world entities within an image (JPEG or PNG) provided as input. This
      # includes objects like flower, tree, and table; events like wedding, graduation, and birthday party;
      # and concepts like landscape, evening, and nature. For an example, see Analyzing images stored in an
      # Amazon S3 bucket in the Amazon Rekognition Developer Guide. You pass the input image as
      # base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS
      # CLI to call Amazon Rekognition operations, passing image bytes is not supported. The image must be
      # either a PNG or JPEG formatted file. Optional Parameters You can specify one or both of the
      # GENERAL_LABELS and IMAGE_PROPERTIES feature types when calling the DetectLabels API. Including
      # GENERAL_LABELS will ensure the response includes the labels detected in the input image, while
      # including IMAGE_PROPERTIES will ensure the response includes information about the image quality and
      # color. When using GENERAL_LABELS and/or IMAGE_PROPERTIES you can provide filtering criteria to the
      # Settings parameter. You can filter with sets of individual labels or with label categories. You can
      # specify inclusive filters, exclusive filters, or a combination of inclusive and exclusive filters.
      # For more information on filtering see Detecting Labels in an Image . When getting labels, you can
      # specify MinConfidence to control the confidence threshold for the labels returned. The default is
      # 55%. You can also add the MaxLabels parameter to limit the number of labels returned. The default
      # and upper limit is 1000 labels. These arguments are only valid when supplying GENERAL_LABELS as a
      # feature type. Response Elements For each object, scene, and concept the API returns one or more
      # labels. The API returns the following types of information about labels: Name - The name of the
      # detected label. Confidence - The level of confidence in the label assigned to a detected object.
      # Parents - The ancestor labels for a detected label. DetectLabels returns a hierarchical taxonomy of
      # detected labels. For example, a detected car might be assigned the label car. The label car has two
      # parent labels: Vehicle (its parent) and Transportation (its grandparent). The response includes the
      # all ancestors for a label, where every ancestor is a unique label. In the previous example, Car,
      # Vehicle, and Transportation are returned as unique labels in the response. Aliases - Possible
      # Aliases for the label. Categories - The label categories that the detected label belongs to.
      # BoundingBox — Bounding boxes are described for all instances of detected common object labels,
      # returned in an array of Instance objects. An Instance object contains a BoundingBox object,
      # describing the location of the label on the input image. It also includes the confidence for the
      # accuracy of the detected bounding box. The API returns the following information regarding the
      # image, as part of the ImageProperties structure: Quality - Information about the Sharpness,
      # Brightness, and Contrast of the input image, scored between 0 to 100. Image quality is returned for
      # the entire image, as well as the background and the foreground. Dominant Color - An array of the
      # dominant colors in the image. Foreground - Information about the sharpness, brightness, and dominant
      # colors of the input image’s foreground. Background - Information about the sharpness, brightness,
      # and dominant colors of the input image’s background. The list of returned labels will include at
      # least one label for every detected object, along with information about that label. In the following
      # example, suppose the input image has a lighthouse, the sea, and a rock. The response includes all
      # three labels, one for each object, as well as the confidence in the label: {Name: lighthouse,
      # Confidence: 98.4629} {Name: rock,Confidence: 79.2097} {Name: sea,Confidence: 75.061} The list of
      # labels can include multiple labels for the same object. For example, if the input image shows a
      # flower (for example, a tulip), the operation might return the following three labels. {Name:
      # flower,Confidence: 99.0562} {Name: plant,Confidence: 99.0562} {Name: tulip,Confidence: 99.0562} In
      # this example, the detection algorithm more precisely identifies the flower as a tulip. If the object
      # detected is a person, the operation doesn't provide the same facial details that the DetectFaces
      # operation provides. This is a stateless API operation that doesn't return any data. This operation
      # requires permissions to perform the rekognition:DetectLabels action.

      def detect_labels(
        image : Types::Image,
        features : Array(String)? = nil,
        max_labels : Int32? = nil,
        min_confidence : Float64? = nil,
        settings : Types::DetectLabelsSettings? = nil
      ) : Types::DetectLabelsResponse

        input = Types::DetectLabelsRequest.new(image: image, features: features, max_labels: max_labels, min_confidence: min_confidence, settings: settings)
        detect_labels(input)
      end

      def detect_labels(input : Types::DetectLabelsRequest) : Types::DetectLabelsResponse
        request = Protocol::JsonRpc.build_request(Model::DETECT_LABELS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetectLabelsResponse, "DetectLabels")
      end

      # Detects unsafe content in a specified JPEG or PNG format image. Use DetectModerationLabels to
      # moderate images depending on your requirements. For example, you might want to filter images that
      # contain nudity, but not images containing suggestive content. To filter images, use the labels
      # returned by DetectModerationLabels to determine which types of content are appropriate. For
      # information about moderation labels, see Detecting Unsafe Content in the Amazon Rekognition
      # Developer Guide. You pass the input image either as base64-encoded image bytes or as a reference to
      # an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations,
      # passing image bytes is not supported. The image must be either a PNG or JPEG formatted file. You can
      # specify an adapter to use when retrieving label predictions by providing a ProjectVersionArn to the
      # ProjectVersion argument.

      def detect_moderation_labels(
        image : Types::Image,
        human_loop_config : Types::HumanLoopConfig? = nil,
        min_confidence : Float64? = nil,
        project_version : String? = nil
      ) : Types::DetectModerationLabelsResponse

        input = Types::DetectModerationLabelsRequest.new(image: image, human_loop_config: human_loop_config, min_confidence: min_confidence, project_version: project_version)
        detect_moderation_labels(input)
      end

      def detect_moderation_labels(input : Types::DetectModerationLabelsRequest) : Types::DetectModerationLabelsResponse
        request = Protocol::JsonRpc.build_request(Model::DETECT_MODERATION_LABELS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetectModerationLabelsResponse, "DetectModerationLabels")
      end

      # Detects Personal Protective Equipment (PPE) worn by people detected in an image. Amazon Rekognition
      # can detect the following types of PPE. Face cover Hand cover Head cover You pass the input image as
      # base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. The image must be
      # either a PNG or JPG formatted file. DetectProtectiveEquipment detects PPE worn by up to 15 persons
      # detected in an image. For each person detected in the image the API returns an array of body parts
      # (face, head, left-hand, right-hand). For each body part, an array of detected items of PPE is
      # returned, including an indicator of whether or not the PPE covers the body part. The API returns the
      # confidence it has in each detection (person, PPE, body part and body part coverage). It also returns
      # a bounding box ( BoundingBox ) for each detected person and each detected item of PPE. You can
      # optionally request a summary of detected PPE items with the SummarizationAttributes input parameter.
      # The summary provides the following information. The persons detected as wearing all of the types of
      # PPE that you specify. The persons detected as not wearing all of the types PPE that you specify. The
      # persons detected where PPE adornment could not be determined. This is a stateless API operation.
      # That is, the operation does not persist any data. This operation requires permissions to perform the
      # rekognition:DetectProtectiveEquipment action.

      def detect_protective_equipment(
        image : Types::Image,
        summarization_attributes : Types::ProtectiveEquipmentSummarizationAttributes? = nil
      ) : Types::DetectProtectiveEquipmentResponse

        input = Types::DetectProtectiveEquipmentRequest.new(image: image, summarization_attributes: summarization_attributes)
        detect_protective_equipment(input)
      end

      def detect_protective_equipment(input : Types::DetectProtectiveEquipmentRequest) : Types::DetectProtectiveEquipmentResponse
        request = Protocol::JsonRpc.build_request(Model::DETECT_PROTECTIVE_EQUIPMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetectProtectiveEquipmentResponse, "DetectProtectiveEquipment")
      end

      # Detects text in the input image and converts it into machine-readable text. Pass the input image as
      # base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you use the AWS
      # CLI to call Amazon Rekognition operations, you must pass it as a reference to an image in an Amazon
      # S3 bucket. For the AWS CLI, passing image bytes is not supported. The image must be either a .png or
      # .jpeg formatted file. The DetectText operation returns text in an array of TextDetection elements,
      # TextDetections . Each TextDetection element provides information about a single word or line of text
      # that was detected in the image. A word is one or more script characters that are not separated by
      # spaces. DetectText can detect up to 100 words in an image. A line is a string of equally spaced
      # words. A line isn't necessarily a complete sentence. For example, a driver's license number is
      # detected as a line. A line ends when there is no aligned text after it. Also, a line ends when there
      # is a large gap between words, relative to the length of the words. This means, depending on the gap
      # between words, Amazon Rekognition may detect multiple lines in text aligned in the same direction.
      # Periods don't represent the end of a line. If a sentence spans multiple lines, the DetectText
      # operation returns multiple lines. To determine whether a TextDetection element is a line of text or
      # a word, use the TextDetection object Type field. To be detected, text must be within +/- 90 degrees
      # orientation of the horizontal axis. For more information, see Detecting text in the Amazon
      # Rekognition Developer Guide.

      def detect_text(
        image : Types::Image,
        filters : Types::DetectTextFilters? = nil
      ) : Types::DetectTextResponse

        input = Types::DetectTextRequest.new(image: image, filters: filters)
        detect_text(input)
      end

      def detect_text(input : Types::DetectTextRequest) : Types::DetectTextResponse
        request = Protocol::JsonRpc.build_request(Model::DETECT_TEXT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetectTextResponse, "DetectText")
      end

      # Removes the association between a Face supplied in an array of FaceIds and the User. If the User is
      # not present already, then a ResourceNotFound exception is thrown. If successful, an array of faces
      # that are disassociated from the User is returned. If a given face is already disassociated from the
      # given UserID, it will be ignored and not be returned in the response. If a given face is already
      # associated with a different User or not found in the collection it will be returned as part of
      # UnsuccessfulDisassociations . You can remove 1 - 100 face IDs from a user at one time.

      def disassociate_faces(
        collection_id : String,
        face_ids : Array(String),
        user_id : String,
        client_request_token : String? = nil
      ) : Types::DisassociateFacesResponse

        input = Types::DisassociateFacesRequest.new(collection_id: collection_id, face_ids: face_ids, user_id: user_id, client_request_token: client_request_token)
        disassociate_faces(input)
      end

      def disassociate_faces(input : Types::DisassociateFacesRequest) : Types::DisassociateFacesResponse
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_FACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DisassociateFacesResponse, "DisassociateFaces")
      end

      # This operation applies only to Amazon Rekognition Custom Labels. Distributes the entries (images) in
      # a training dataset across the training dataset and the test dataset for a project.
      # DistributeDatasetEntries moves 20% of the training dataset images to the test dataset. An entry is a
      # JSON Line that describes an image. You supply the Amazon Resource Names (ARN) of a project's
      # training dataset and test dataset. The training dataset must contain the images that you want to
      # split. The test dataset must be empty. The datasets must belong to the same project. To create
      # training and test datasets for a project, call CreateDataset . Distributing a dataset takes a while
      # to complete. To check the status call DescribeDataset . The operation is complete when the Status
      # field for the training dataset and the test dataset is UPDATE_COMPLETE . If the dataset split fails,
      # the value of Status is UPDATE_FAILED . This operation requires permissions to perform the
      # rekognition:DistributeDatasetEntries action.

      def distribute_dataset_entries(
        datasets : Array(Types::DistributeDataset)
      ) : Types::DistributeDatasetEntriesResponse

        input = Types::DistributeDatasetEntriesRequest.new(datasets: datasets)
        distribute_dataset_entries(input)
      end

      def distribute_dataset_entries(input : Types::DistributeDatasetEntriesRequest) : Types::DistributeDatasetEntriesResponse
        request = Protocol::JsonRpc.build_request(Model::DISTRIBUTE_DATASET_ENTRIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DistributeDatasetEntriesResponse, "DistributeDatasetEntries")
      end

      # Gets the name and additional information about a celebrity based on their Amazon Rekognition ID. The
      # additional information is returned as an array of URLs. If there is no additional information about
      # the celebrity, this list is empty. For more information, see Getting information about a celebrity
      # in the Amazon Rekognition Developer Guide. This operation requires permissions to perform the
      # rekognition:GetCelebrityInfo action.

      def get_celebrity_info(
        id : String
      ) : Types::GetCelebrityInfoResponse

        input = Types::GetCelebrityInfoRequest.new(id: id)
        get_celebrity_info(input)
      end

      def get_celebrity_info(input : Types::GetCelebrityInfoRequest) : Types::GetCelebrityInfoResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CELEBRITY_INFO, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCelebrityInfoResponse, "GetCelebrityInfo")
      end

      # Gets the celebrity recognition results for a Amazon Rekognition Video analysis started by
      # StartCelebrityRecognition . Celebrity recognition in a video is an asynchronous operation. Analysis
      # is started by a call to StartCelebrityRecognition which returns a job identifier ( JobId ). When the
      # celebrity recognition operation finishes, Amazon Rekognition Video publishes a completion status to
      # the Amazon Simple Notification Service topic registered in the initial call to
      # StartCelebrityRecognition . To get the results of the celebrity recognition analysis, first check
      # that the status value published to the Amazon SNS topic is SUCCEEDED . If so, call
      # GetCelebrityDetection and pass the job identifier ( JobId ) from the initial call to
      # StartCelebrityDetection . For more information, see Working With Stored Videos in the Amazon
      # Rekognition Developer Guide. GetCelebrityRecognition returns detected celebrities and the time(s)
      # they are detected in an array ( Celebrities ) of CelebrityRecognition objects. Each
      # CelebrityRecognition contains information about the celebrity in a CelebrityDetail object and the
      # time, Timestamp , the celebrity was detected. This CelebrityDetail object stores information about
      # the detected celebrity's face attributes, a face bounding box, known gender, the celebrity's name,
      # and a confidence estimate. GetCelebrityRecognition only returns the default facial attributes (
      # BoundingBox , Confidence , Landmarks , Pose , and Quality ). The BoundingBox field only applies to
      # the detected face instance. The other facial attributes listed in the Face object of the following
      # response syntax are not returned. For more information, see FaceDetail in the Amazon Rekognition
      # Developer Guide. By default, the Celebrities array is sorted by time (milliseconds from the start of
      # the video). You can also sort the array by celebrity by specifying the value ID in the SortBy input
      # parameter. The CelebrityDetail object includes the celebrity identifer and additional information
      # urls. If you don't store the additional information urls, you can get them later by calling
      # GetCelebrityInfo with the celebrity identifer. No information is returned for faces not recognized
      # as celebrities. Use MaxResults parameter to limit the number of labels returned. If there are more
      # results than specified in MaxResults , the value of NextToken in the operation response contains a
      # pagination token for getting the next set of results. To get the next page of results, call
      # GetCelebrityDetection and populate the NextToken request parameter with the token value returned
      # from the previous call to GetCelebrityRecognition .

      def get_celebrity_recognition(
        job_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil
      ) : Types::GetCelebrityRecognitionResponse

        input = Types::GetCelebrityRecognitionRequest.new(job_id: job_id, max_results: max_results, next_token: next_token, sort_by: sort_by)
        get_celebrity_recognition(input)
      end

      def get_celebrity_recognition(input : Types::GetCelebrityRecognitionRequest) : Types::GetCelebrityRecognitionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CELEBRITY_RECOGNITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCelebrityRecognitionResponse, "GetCelebrityRecognition")
      end

      # Gets the inappropriate, unwanted, or offensive content analysis results for a Amazon Rekognition
      # Video analysis started by StartContentModeration . For a list of moderation labels in Amazon
      # Rekognition, see Using the image and video moderation APIs . Amazon Rekognition Video inappropriate
      # or offensive content detection in a stored video is an asynchronous operation. You start analysis by
      # calling StartContentModeration which returns a job identifier ( JobId ). When analysis finishes,
      # Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service
      # topic registered in the initial call to StartContentModeration . To get the results of the content
      # analysis, first check that the status value published to the Amazon SNS topic is SUCCEEDED . If so,
      # call GetContentModeration and pass the job identifier ( JobId ) from the initial call to
      # StartContentModeration . For more information, see Working with Stored Videos in the Amazon
      # Rekognition Devlopers Guide. GetContentModeration returns detected inappropriate, unwanted, or
      # offensive content moderation labels, and the time they are detected, in an array, ModerationLabels ,
      # of ContentModerationDetection objects. By default, the moderated labels are returned sorted by time,
      # in milliseconds from the start of the video. You can also sort them by moderated label by specifying
      # NAME for the SortBy input parameter. Since video analysis can return a large number of results, use
      # the MaxResults parameter to limit the number of labels returned in a single call to
      # GetContentModeration . If there are more results than specified in MaxResults , the value of
      # NextToken in the operation response contains a pagination token for getting the next set of results.
      # To get the next page of results, call GetContentModeration and populate the NextToken request
      # parameter with the value of NextToken returned from the previous call to GetContentModeration . For
      # more information, see moderating content in the Amazon Rekognition Developer Guide.

      def get_content_moderation(
        job_id : String,
        aggregate_by : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil
      ) : Types::GetContentModerationResponse

        input = Types::GetContentModerationRequest.new(job_id: job_id, aggregate_by: aggregate_by, max_results: max_results, next_token: next_token, sort_by: sort_by)
        get_content_moderation(input)
      end

      def get_content_moderation(input : Types::GetContentModerationRequest) : Types::GetContentModerationResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CONTENT_MODERATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetContentModerationResponse, "GetContentModeration")
      end

      # Gets face detection results for a Amazon Rekognition Video analysis started by StartFaceDetection .
      # Face detection with Amazon Rekognition Video is an asynchronous operation. You start face detection
      # by calling StartFaceDetection which returns a job identifier ( JobId ). When the face detection
      # operation finishes, Amazon Rekognition Video publishes a completion status to the Amazon Simple
      # Notification Service topic registered in the initial call to StartFaceDetection . To get the results
      # of the face detection operation, first check that the status value published to the Amazon SNS topic
      # is SUCCEEDED . If so, call GetFaceDetection and pass the job identifier ( JobId ) from the initial
      # call to StartFaceDetection . GetFaceDetection returns an array of detected faces ( Faces ) sorted by
      # the time the faces were detected. Use MaxResults parameter to limit the number of labels returned.
      # If there are more results than specified in MaxResults , the value of NextToken in the operation
      # response contains a pagination token for getting the next set of results. To get the next page of
      # results, call GetFaceDetection and populate the NextToken request parameter with the token value
      # returned from the previous call to GetFaceDetection . Note that for the GetFaceDetection operation,
      # the returned values for FaceOccluded and EyeDirection will always be "null".

      def get_face_detection(
        job_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetFaceDetectionResponse

        input = Types::GetFaceDetectionRequest.new(job_id: job_id, max_results: max_results, next_token: next_token)
        get_face_detection(input)
      end

      def get_face_detection(input : Types::GetFaceDetectionRequest) : Types::GetFaceDetectionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_FACE_DETECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetFaceDetectionResponse, "GetFaceDetection")
      end

      # Retrieves the results of a specific Face Liveness session. It requires the sessionId as input, which
      # was created using CreateFaceLivenessSession . Returns the corresponding Face Liveness confidence
      # score, a reference image that includes a face bounding box, and audit images that also contain face
      # bounding boxes. The Face Liveness confidence score ranges from 0 to 100. The number of audit images
      # returned by GetFaceLivenessSessionResults is defined by the AuditImagesLimit paramater when calling
      # CreateFaceLivenessSession . Reference images are always returned when possible.

      def get_face_liveness_session_results(
        session_id : String
      ) : Types::GetFaceLivenessSessionResultsResponse

        input = Types::GetFaceLivenessSessionResultsRequest.new(session_id: session_id)
        get_face_liveness_session_results(input)
      end

      def get_face_liveness_session_results(input : Types::GetFaceLivenessSessionResultsRequest) : Types::GetFaceLivenessSessionResultsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_FACE_LIVENESS_SESSION_RESULTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetFaceLivenessSessionResultsResponse, "GetFaceLivenessSessionResults")
      end

      # Gets the face search results for Amazon Rekognition Video face search started by StartFaceSearch .
      # The search returns faces in a collection that match the faces of persons detected in a video. It
      # also includes the time(s) that faces are matched in the video. Face search in a video is an
      # asynchronous operation. You start face search by calling to StartFaceSearch which returns a job
      # identifier ( JobId ). When the search operation finishes, Amazon Rekognition Video publishes a
      # completion status to the Amazon Simple Notification Service topic registered in the initial call to
      # StartFaceSearch . To get the search results, first check that the status value published to the
      # Amazon SNS topic is SUCCEEDED . If so, call GetFaceSearch and pass the job identifier ( JobId ) from
      # the initial call to StartFaceSearch . For more information, see Searching Faces in a Collection in
      # the Amazon Rekognition Developer Guide. The search results are retured in an array, Persons , of
      # PersonMatch objects. Each PersonMatch element contains details about the matching faces in the input
      # collection, person information (facial attributes, bounding boxes, and person identifer) for the
      # matched person, and the time the person was matched in the video. GetFaceSearch only returns the
      # default facial attributes ( BoundingBox , Confidence , Landmarks , Pose , and Quality ). The other
      # facial attributes listed in the Face object of the following response syntax are not returned. For
      # more information, see FaceDetail in the Amazon Rekognition Developer Guide. By default, the Persons
      # array is sorted by the time, in milliseconds from the start of the video, persons are matched. You
      # can also sort by persons by specifying INDEX for the SORTBY input parameter.

      def get_face_search(
        job_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil
      ) : Types::GetFaceSearchResponse

        input = Types::GetFaceSearchRequest.new(job_id: job_id, max_results: max_results, next_token: next_token, sort_by: sort_by)
        get_face_search(input)
      end

      def get_face_search(input : Types::GetFaceSearchRequest) : Types::GetFaceSearchResponse
        request = Protocol::JsonRpc.build_request(Model::GET_FACE_SEARCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetFaceSearchResponse, "GetFaceSearch")
      end

      # Gets the label detection results of a Amazon Rekognition Video analysis started by
      # StartLabelDetection . The label detection operation is started by a call to StartLabelDetection
      # which returns a job identifier ( JobId ). When the label detection operation finishes, Amazon
      # Rekognition publishes a completion status to the Amazon Simple Notification Service topic registered
      # in the initial call to StartlabelDetection . To get the results of the label detection operation,
      # first check that the status value published to the Amazon SNS topic is SUCCEEDED . If so, call
      # GetLabelDetection and pass the job identifier ( JobId ) from the initial call to StartLabelDetection
      # . GetLabelDetection returns an array of detected labels ( Labels ) sorted by the time the labels
      # were detected. You can also sort by the label name by specifying NAME for the SortBy input
      # parameter. If there is no NAME specified, the default sort is by timestamp. You can select how
      # results are aggregated by using the AggregateBy input parameter. The default aggregation method is
      # TIMESTAMPS . You can also aggregate by SEGMENTS , which aggregates all instances of labels detected
      # in a given segment. The returned Labels array may include the following attributes: Name - The name
      # of the detected label. Confidence - The level of confidence in the label assigned to a detected
      # object. Parents - The ancestor labels for a detected label. GetLabelDetection returns a hierarchical
      # taxonomy of detected labels. For example, a detected car might be assigned the label car. The label
      # car has two parent labels: Vehicle (its parent) and Transportation (its grandparent). The response
      # includes the all ancestors for a label, where every ancestor is a unique label. In the previous
      # example, Car, Vehicle, and Transportation are returned as unique labels in the response. Aliases -
      # Possible Aliases for the label. Categories - The label categories that the detected label belongs
      # to. BoundingBox — Bounding boxes are described for all instances of detected common object labels,
      # returned in an array of Instance objects. An Instance object contains a BoundingBox object,
      # describing the location of the label on the input image. It also includes the confidence for the
      # accuracy of the detected bounding box. Timestamp - Time, in milliseconds from the start of the
      # video, that the label was detected. For aggregation by SEGMENTS , the StartTimestampMillis ,
      # EndTimestampMillis , and DurationMillis structures are what define a segment. Although the
      # “Timestamp” structure is still returned with each label, its value is set to be the same as
      # StartTimestampMillis . Timestamp and Bounding box information are returned for detected Instances,
      # only if aggregation is done by TIMESTAMPS . If aggregating by SEGMENTS , information about detected
      # instances isn’t returned. The version of the label model used for the detection is also returned.
      # Note DominantColors isn't returned for Instances , although it is shown as part of the response in
      # the sample seen below. Use MaxResults parameter to limit the number of labels returned. If there are
      # more results than specified in MaxResults , the value of NextToken in the operation response
      # contains a pagination token for getting the next set of results. To get the next page of results,
      # call GetlabelDetection and populate the NextToken request parameter with the token value returned
      # from the previous call to GetLabelDetection . If you are retrieving results while using the Amazon
      # Simple Notification Service, note that you will receive an "ERROR" notification if the job
      # encounters an issue.

      def get_label_detection(
        job_id : String,
        aggregate_by : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil
      ) : Types::GetLabelDetectionResponse

        input = Types::GetLabelDetectionRequest.new(job_id: job_id, aggregate_by: aggregate_by, max_results: max_results, next_token: next_token, sort_by: sort_by)
        get_label_detection(input)
      end

      def get_label_detection(input : Types::GetLabelDetectionRequest) : Types::GetLabelDetectionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_LABEL_DETECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLabelDetectionResponse, "GetLabelDetection")
      end

      # Retrieves the results for a given media analysis job. Takes a JobId returned by
      # StartMediaAnalysisJob.

      def get_media_analysis_job(
        job_id : String
      ) : Types::GetMediaAnalysisJobResponse

        input = Types::GetMediaAnalysisJobRequest.new(job_id: job_id)
        get_media_analysis_job(input)
      end

      def get_media_analysis_job(input : Types::GetMediaAnalysisJobRequest) : Types::GetMediaAnalysisJobResponse
        request = Protocol::JsonRpc.build_request(Model::GET_MEDIA_ANALYSIS_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMediaAnalysisJobResponse, "GetMediaAnalysisJob")
      end

      # End of support notice: On October 31, 2025, AWS will discontinue support for Amazon Rekognition
      # People Pathing. After October 31, 2025, you will no longer be able to use the Rekognition People
      # Pathing capability. For more information, visit this blog post . Gets the path tracking results of a
      # Amazon Rekognition Video analysis started by StartPersonTracking . The person path tracking
      # operation is started by a call to StartPersonTracking which returns a job identifier ( JobId ). When
      # the operation finishes, Amazon Rekognition Video publishes a completion status to the Amazon Simple
      # Notification Service topic registered in the initial call to StartPersonTracking . To get the
      # results of the person path tracking operation, first check that the status value published to the
      # Amazon SNS topic is SUCCEEDED . If so, call GetPersonTracking and pass the job identifier ( JobId )
      # from the initial call to StartPersonTracking . GetPersonTracking returns an array, Persons , of
      # tracked persons and the time(s) their paths were tracked in the video. GetPersonTracking only
      # returns the default facial attributes ( BoundingBox , Confidence , Landmarks , Pose , and Quality ).
      # The other facial attributes listed in the Face object of the following response syntax are not
      # returned. For more information, see FaceDetail in the Amazon Rekognition Developer Guide. By
      # default, the array is sorted by the time(s) a person's path is tracked in the video. You can sort by
      # tracked persons by specifying INDEX for the SortBy input parameter. Use the MaxResults parameter to
      # limit the number of items returned. If there are more results than specified in MaxResults , the
      # value of NextToken in the operation response contains a pagination token for getting the next set of
      # results. To get the next page of results, call GetPersonTracking and populate the NextToken request
      # parameter with the token value returned from the previous call to GetPersonTracking .

      def get_person_tracking(
        job_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort_by : String? = nil
      ) : Types::GetPersonTrackingResponse

        input = Types::GetPersonTrackingRequest.new(job_id: job_id, max_results: max_results, next_token: next_token, sort_by: sort_by)
        get_person_tracking(input)
      end

      def get_person_tracking(input : Types::GetPersonTrackingRequest) : Types::GetPersonTrackingResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PERSON_TRACKING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPersonTrackingResponse, "GetPersonTracking")
      end

      # Gets the segment detection results of a Amazon Rekognition Video analysis started by
      # StartSegmentDetection . Segment detection with Amazon Rekognition Video is an asynchronous
      # operation. You start segment detection by calling StartSegmentDetection which returns a job
      # identifier ( JobId ). When the segment detection operation finishes, Amazon Rekognition publishes a
      # completion status to the Amazon Simple Notification Service topic registered in the initial call to
      # StartSegmentDetection . To get the results of the segment detection operation, first check that the
      # status value published to the Amazon SNS topic is SUCCEEDED . if so, call GetSegmentDetection and
      # pass the job identifier ( JobId ) from the initial call of StartSegmentDetection .
      # GetSegmentDetection returns detected segments in an array ( Segments ) of SegmentDetection objects.
      # Segments is sorted by the segment types specified in the SegmentTypes input parameter of
      # StartSegmentDetection . Each element of the array includes the detected segment, the precentage
      # confidence in the acuracy of the detected segment, the type of the segment, and the frame in which
      # the segment was detected. Use SelectedSegmentTypes to find out the type of segment detection
      # requested in the call to StartSegmentDetection . Use the MaxResults parameter to limit the number of
      # segment detections returned. If there are more results than specified in MaxResults , the value of
      # NextToken in the operation response contains a pagination token for getting the next set of results.
      # To get the next page of results, call GetSegmentDetection and populate the NextToken request
      # parameter with the token value returned from the previous call to GetSegmentDetection . For more
      # information, see Detecting video segments in stored video in the Amazon Rekognition Developer Guide.

      def get_segment_detection(
        job_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetSegmentDetectionResponse

        input = Types::GetSegmentDetectionRequest.new(job_id: job_id, max_results: max_results, next_token: next_token)
        get_segment_detection(input)
      end

      def get_segment_detection(input : Types::GetSegmentDetectionRequest) : Types::GetSegmentDetectionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SEGMENT_DETECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSegmentDetectionResponse, "GetSegmentDetection")
      end

      # Gets the text detection results of a Amazon Rekognition Video analysis started by StartTextDetection
      # . Text detection with Amazon Rekognition Video is an asynchronous operation. You start text
      # detection by calling StartTextDetection which returns a job identifier ( JobId ) When the text
      # detection operation finishes, Amazon Rekognition publishes a completion status to the Amazon Simple
      # Notification Service topic registered in the initial call to StartTextDetection . To get the results
      # of the text detection operation, first check that the status value published to the Amazon SNS topic
      # is SUCCEEDED . if so, call GetTextDetection and pass the job identifier ( JobId ) from the initial
      # call of StartLabelDetection . GetTextDetection returns an array of detected text ( TextDetections )
      # sorted by the time the text was detected, up to 100 words per frame of video. Each element of the
      # array includes the detected text, the precentage confidence in the acuracy of the detected text, the
      # time the text was detected, bounding box information for where the text was located, and unique
      # identifiers for words and their lines. Use MaxResults parameter to limit the number of text
      # detections returned. If there are more results than specified in MaxResults , the value of NextToken
      # in the operation response contains a pagination token for getting the next set of results. To get
      # the next page of results, call GetTextDetection and populate the NextToken request parameter with
      # the token value returned from the previous call to GetTextDetection .

      def get_text_detection(
        job_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetTextDetectionResponse

        input = Types::GetTextDetectionRequest.new(job_id: job_id, max_results: max_results, next_token: next_token)
        get_text_detection(input)
      end

      def get_text_detection(input : Types::GetTextDetectionRequest) : Types::GetTextDetectionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TEXT_DETECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTextDetectionResponse, "GetTextDetection")
      end

      # Detects faces in the input image and adds them to the specified collection. Amazon Rekognition
      # doesn't save the actual faces that are detected. Instead, the underlying detection algorithm first
      # detects the faces in the input image. For each face, the algorithm extracts facial features into a
      # feature vector, and stores it in the backend database. Amazon Rekognition uses feature vectors when
      # it performs face match and search operations using the SearchFaces and SearchFacesByImage
      # operations. For more information, see Adding faces to a collection in the Amazon Rekognition
      # Developer Guide. To get the number of faces in a collection, call DescribeCollection . If you're
      # using version 1.0 of the face detection model, IndexFaces indexes the 15 largest faces in the input
      # image. Later versions of the face detection model index the 100 largest faces in the input image. If
      # you're using version 4 or later of the face model, image orientation information is not returned in
      # the OrientationCorrection field. To determine which version of the model you're using, call
      # DescribeCollection and supply the collection ID. You can also get the model version from the value
      # of FaceModelVersion in the response from IndexFaces For more information, see Model Versioning in
      # the Amazon Rekognition Developer Guide. If you provide the optional ExternalImageId for the input
      # image you provided, Amazon Rekognition associates this ID with all faces that it detects. When you
      # call the ListFaces operation, the response returns the external ID. You can use this external image
      # ID to create a client-side index to associate the faces with each image. You can then use the index
      # to find all faces in an image. You can specify the maximum number of faces to index with the
      # MaxFaces input parameter. This is useful when you want to index the largest faces in an image and
      # don't want to index smaller faces, such as those belonging to people standing in the background. The
      # QualityFilter input parameter allows you to filter out detected faces that don’t meet a required
      # quality bar. The quality bar is based on a variety of common use cases. By default, IndexFaces
      # chooses the quality bar that's used to filter faces. You can also explicitly choose the quality bar.
      # Use QualityFilter , to set the quality bar by specifying LOW , MEDIUM , or HIGH . If you do not want
      # to filter detected faces, specify NONE . To use quality filtering, you need a collection associated
      # with version 3 of the face model or higher. To get the version of the face model associated with a
      # collection, call DescribeCollection . Information about faces detected in an image, but not indexed,
      # is returned in an array of UnindexedFace objects, UnindexedFaces . Faces aren't indexed for reasons
      # such as: The number of faces detected exceeds the value of the MaxFaces request parameter. The face
      # is too small compared to the image dimensions. The face is too blurry. The image is too dark. The
      # face has an extreme pose. The face doesn’t have enough detail to be suitable for face search. In
      # response, the IndexFaces operation returns an array of metadata for all detected faces, FaceRecords
      # . This includes: The bounding box, BoundingBox , of the detected face. A confidence value,
      # Confidence , which indicates the confidence that the bounding box contains a face. A face ID, FaceId
      # , assigned by the service for each face that's detected and stored. An image ID, ImageId , assigned
      # by the service for the input image. If you request ALL or specific facial attributes (e.g.,
      # FACE_OCCLUDED ) by using the detectionAttributes parameter, Amazon Rekognition returns detailed
      # facial attributes, such as facial landmarks (for example, location of eye and mouth), facial
      # occlusion, and other facial attributes. If you provide the same image, specify the same collection,
      # and use the same external ID in the IndexFaces operation, Amazon Rekognition doesn't save duplicate
      # face metadata. The input image is passed either as base64-encoded image bytes, or as a reference to
      # an image in an Amazon S3 bucket. If you use the AWS CLI to call Amazon Rekognition operations,
      # passing image bytes isn't supported. The image must be formatted as a PNG or JPEG file. This
      # operation requires permissions to perform the rekognition:IndexFaces action.

      def index_faces(
        collection_id : String,
        image : Types::Image,
        detection_attributes : Array(String)? = nil,
        external_image_id : String? = nil,
        max_faces : Int32? = nil,
        quality_filter : String? = nil
      ) : Types::IndexFacesResponse

        input = Types::IndexFacesRequest.new(collection_id: collection_id, image: image, detection_attributes: detection_attributes, external_image_id: external_image_id, max_faces: max_faces, quality_filter: quality_filter)
        index_faces(input)
      end

      def index_faces(input : Types::IndexFacesRequest) : Types::IndexFacesResponse
        request = Protocol::JsonRpc.build_request(Model::INDEX_FACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::IndexFacesResponse, "IndexFaces")
      end

      # Returns list of collection IDs in your account. If the result is truncated, the response also
      # provides a NextToken that you can use in the subsequent request to fetch the next set of collection
      # IDs. For an example, see Listing collections in the Amazon Rekognition Developer Guide. This
      # operation requires permissions to perform the rekognition:ListCollections action.

      def list_collections(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCollectionsResponse

        input = Types::ListCollectionsRequest.new(max_results: max_results, next_token: next_token)
        list_collections(input)
      end

      def list_collections(input : Types::ListCollectionsRequest) : Types::ListCollectionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_COLLECTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCollectionsResponse, "ListCollections")
      end

      # This operation applies only to Amazon Rekognition Custom Labels. Lists the entries (images) within a
      # dataset. An entry is a JSON Line that contains the information for a single image, including the
      # image location, assigned labels, and object location bounding boxes. For more information, see
      # Creating a manifest file . JSON Lines in the response include information about non-terminal errors
      # found in the dataset. Non terminal errors are reported in errors lists within each JSON Line. The
      # same information is reported in the training and testing validation result manifests that Amazon
      # Rekognition Custom Labels creates during model training. You can filter the response in variety of
      # ways, such as choosing which labels to return and returning JSON Lines created after a specific
      # date. This operation requires permissions to perform the rekognition:ListDatasetEntries action.

      def list_dataset_entries(
        dataset_arn : String,
        contains_labels : Array(String)? = nil,
        has_errors : Bool? = nil,
        labeled : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        source_ref_contains : String? = nil
      ) : Types::ListDatasetEntriesResponse

        input = Types::ListDatasetEntriesRequest.new(dataset_arn: dataset_arn, contains_labels: contains_labels, has_errors: has_errors, labeled: labeled, max_results: max_results, next_token: next_token, source_ref_contains: source_ref_contains)
        list_dataset_entries(input)
      end

      def list_dataset_entries(input : Types::ListDatasetEntriesRequest) : Types::ListDatasetEntriesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATASET_ENTRIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDatasetEntriesResponse, "ListDatasetEntries")
      end

      # This operation applies only to Amazon Rekognition Custom Labels. Lists the labels in a dataset.
      # Amazon Rekognition Custom Labels uses labels to describe images. For more information, see Labeling
      # images . Lists the labels in a dataset. Amazon Rekognition Custom Labels uses labels to describe
      # images. For more information, see Labeling images in the Amazon Rekognition Custom Labels Developer
      # Guide .

      def list_dataset_labels(
        dataset_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDatasetLabelsResponse

        input = Types::ListDatasetLabelsRequest.new(dataset_arn: dataset_arn, max_results: max_results, next_token: next_token)
        list_dataset_labels(input)
      end

      def list_dataset_labels(input : Types::ListDatasetLabelsRequest) : Types::ListDatasetLabelsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_DATASET_LABELS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDatasetLabelsResponse, "ListDatasetLabels")
      end

      # Returns metadata for faces in the specified collection. This metadata includes information such as
      # the bounding box coordinates, the confidence (that the bounding box contains a face), and face ID.
      # For an example, see Listing Faces in a Collection in the Amazon Rekognition Developer Guide. This
      # operation requires permissions to perform the rekognition:ListFaces action.

      def list_faces(
        collection_id : String,
        face_ids : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        user_id : String? = nil
      ) : Types::ListFacesResponse

        input = Types::ListFacesRequest.new(collection_id: collection_id, face_ids: face_ids, max_results: max_results, next_token: next_token, user_id: user_id)
        list_faces(input)
      end

      def list_faces(input : Types::ListFacesRequest) : Types::ListFacesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFacesResponse, "ListFaces")
      end

      # Returns a list of media analysis jobs. Results are sorted by CreationTimestamp in descending order.

      def list_media_analysis_jobs(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListMediaAnalysisJobsResponse

        input = Types::ListMediaAnalysisJobsRequest.new(max_results: max_results, next_token: next_token)
        list_media_analysis_jobs(input)
      end

      def list_media_analysis_jobs(input : Types::ListMediaAnalysisJobsRequest) : Types::ListMediaAnalysisJobsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_MEDIA_ANALYSIS_JOBS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListMediaAnalysisJobsResponse, "ListMediaAnalysisJobs")
      end

      # This operation applies only to Amazon Rekognition Custom Labels. Gets a list of the project policies
      # attached to a project. To attach a project policy to a project, call PutProjectPolicy . To remove a
      # project policy from a project, call DeleteProjectPolicy . This operation requires permissions to
      # perform the rekognition:ListProjectPolicies action.

      def list_project_policies(
        project_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListProjectPoliciesResponse

        input = Types::ListProjectPoliciesRequest.new(project_arn: project_arn, max_results: max_results, next_token: next_token)
        list_project_policies(input)
      end

      def list_project_policies(input : Types::ListProjectPoliciesRequest) : Types::ListProjectPoliciesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PROJECT_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProjectPoliciesResponse, "ListProjectPolicies")
      end

      # Gets a list of stream processors that you have created with CreateStreamProcessor .

      def list_stream_processors(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListStreamProcessorsResponse

        input = Types::ListStreamProcessorsRequest.new(max_results: max_results, next_token: next_token)
        list_stream_processors(input)
      end

      def list_stream_processors(input : Types::ListStreamProcessorsRequest) : Types::ListStreamProcessorsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_STREAM_PROCESSORS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListStreamProcessorsResponse, "ListStreamProcessors")
      end

      # Returns a list of tags in an Amazon Rekognition collection, stream processor, or Custom Labels
      # model. This operation requires permissions to perform the rekognition:ListTagsForResource action.

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Returns metadata of the User such as UserID in the specified collection. Anonymous User (to reserve
      # faces without any identity) is not returned as part of this request. The results are sorted by
      # system generated primary key ID. If the response is truncated, NextToken is returned in the response
      # that can be used in the subsequent request to retrieve the next set of identities.

      def list_users(
        collection_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListUsersResponse

        input = Types::ListUsersRequest.new(collection_id: collection_id, max_results: max_results, next_token: next_token)
        list_users(input)
      end

      def list_users(input : Types::ListUsersRequest) : Types::ListUsersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_USERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListUsersResponse, "ListUsers")
      end

      # This operation applies only to Amazon Rekognition Custom Labels. Attaches a project policy to a
      # Amazon Rekognition Custom Labels project in a trusting AWS account. A project policy specifies that
      # a trusted AWS account can copy a model version from a trusting AWS account to a project in the
      # trusted AWS account. To copy a model version you use the CopyProjectVersion operation. Only applies
      # to Custom Labels projects. For more information about the format of a project policy document, see
      # Attaching a project policy (SDK) in the Amazon Rekognition Custom Labels Developer Guide . The
      # response from PutProjectPolicy is a revision ID for the project policy. You can attach multiple
      # project policies to a project. You can also update an existing project policy by specifying the
      # policy revision ID of the existing policy. To remove a project policy from a project, call
      # DeleteProjectPolicy . To get a list of project policies attached to a project, call
      # ListProjectPolicies . You copy a model version by calling CopyProjectVersion . This operation
      # requires permissions to perform the rekognition:PutProjectPolicy action.

      def put_project_policy(
        policy_document : String,
        policy_name : String,
        project_arn : String,
        policy_revision_id : String? = nil
      ) : Types::PutProjectPolicyResponse

        input = Types::PutProjectPolicyRequest.new(policy_document: policy_document, policy_name: policy_name, project_arn: project_arn, policy_revision_id: policy_revision_id)
        put_project_policy(input)
      end

      def put_project_policy(input : Types::PutProjectPolicyRequest) : Types::PutProjectPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::PUT_PROJECT_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutProjectPolicyResponse, "PutProjectPolicy")
      end

      # Returns an array of celebrities recognized in the input image. For more information, see Recognizing
      # celebrities in the Amazon Rekognition Developer Guide. RecognizeCelebrities returns the 64 largest
      # faces in the image. It lists the recognized celebrities in the CelebrityFaces array and any
      # unrecognized faces in the UnrecognizedFaces array. RecognizeCelebrities doesn't return celebrities
      # whose faces aren't among the largest 64 faces in the image. For each celebrity recognized,
      # RecognizeCelebrities returns a Celebrity object. The Celebrity object contains the celebrity name,
      # ID, URL links to additional information, match confidence, and a ComparedFace object that you can
      # use to locate the celebrity's face on the image. Amazon Rekognition doesn't retain information about
      # which images a celebrity has been recognized in. Your application must store this information and
      # use the Celebrity ID property as a unique identifier for the celebrity. If you don't store the
      # celebrity name or additional information URLs returned by RecognizeCelebrities , you will need the
      # ID to identify the celebrity in a call to the GetCelebrityInfo operation. You pass the input image
      # either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If you
      # use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The
      # image must be either a PNG or JPEG formatted file. For an example, see Recognizing celebrities in an
      # image in the Amazon Rekognition Developer Guide. This operation requires permissions to perform the
      # rekognition:RecognizeCelebrities operation.

      def recognize_celebrities(
        image : Types::Image
      ) : Types::RecognizeCelebritiesResponse

        input = Types::RecognizeCelebritiesRequest.new(image: image)
        recognize_celebrities(input)
      end

      def recognize_celebrities(input : Types::RecognizeCelebritiesRequest) : Types::RecognizeCelebritiesResponse
        request = Protocol::JsonRpc.build_request(Model::RECOGNIZE_CELEBRITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RecognizeCelebritiesResponse, "RecognizeCelebrities")
      end

      # For a given input face ID, searches for matching faces in the collection the face belongs to. You
      # get a face ID when you add a face to the collection using the IndexFaces operation. The operation
      # compares the features of the input face with faces in the specified collection. You can also search
      # faces without indexing faces by using the SearchFacesByImage operation. The operation response
      # returns an array of faces that match, ordered by similarity score with the highest similarity first.
      # More specifically, it is an array of metadata for each face match that is found. Along with the
      # metadata, the response also includes a confidence value for each face match, indicating the
      # confidence that the specific face matches the input face. For an example, see Searching for a face
      # using its face ID in the Amazon Rekognition Developer Guide. This operation requires permissions to
      # perform the rekognition:SearchFaces action.

      def search_faces(
        collection_id : String,
        face_id : String,
        face_match_threshold : Float64? = nil,
        max_faces : Int32? = nil
      ) : Types::SearchFacesResponse

        input = Types::SearchFacesRequest.new(collection_id: collection_id, face_id: face_id, face_match_threshold: face_match_threshold, max_faces: max_faces)
        search_faces(input)
      end

      def search_faces(input : Types::SearchFacesRequest) : Types::SearchFacesResponse
        request = Protocol::JsonRpc.build_request(Model::SEARCH_FACES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SearchFacesResponse, "SearchFaces")
      end

      # For a given input image, first detects the largest face in the image, and then searches the
      # specified collection for matching faces. The operation compares the features of the input face with
      # faces in the specified collection. To search for all faces in an input image, you might first call
      # the IndexFaces operation, and then use the face IDs returned in subsequent calls to the SearchFaces
      # operation. You can also call the DetectFaces operation and use the bounding boxes in the response to
      # make face crops, which then you can pass in to the SearchFacesByImage operation. You pass the input
      # image either as base64-encoded image bytes or as a reference to an image in an Amazon S3 bucket. If
      # you use the AWS CLI to call Amazon Rekognition operations, passing image bytes is not supported. The
      # image must be either a PNG or JPEG formatted file. The response returns an array of faces that
      # match, ordered by similarity score with the highest similarity first. More specifically, it is an
      # array of metadata for each face match found. Along with the metadata, the response also includes a
      # similarity indicating how similar the face is to the input face. In the response, the operation also
      # returns the bounding box (and a confidence level that the bounding box contains a face) of the face
      # that Amazon Rekognition used for the input image. If no faces are detected in the input image,
      # SearchFacesByImage returns an InvalidParameterException error. For an example, Searching for a Face
      # Using an Image in the Amazon Rekognition Developer Guide. The QualityFilter input parameter allows
      # you to filter out detected faces that don’t meet a required quality bar. The quality bar is based on
      # a variety of common use cases. Use QualityFilter to set the quality bar for filtering by specifying
      # LOW , MEDIUM , or HIGH . If you do not want to filter detected faces, specify NONE . The default
      # value is NONE . To use quality filtering, you need a collection associated with version 3 of the
      # face model or higher. To get the version of the face model associated with a collection, call
      # DescribeCollection . This operation requires permissions to perform the
      # rekognition:SearchFacesByImage action.

      def search_faces_by_image(
        collection_id : String,
        image : Types::Image,
        face_match_threshold : Float64? = nil,
        max_faces : Int32? = nil,
        quality_filter : String? = nil
      ) : Types::SearchFacesByImageResponse

        input = Types::SearchFacesByImageRequest.new(collection_id: collection_id, image: image, face_match_threshold: face_match_threshold, max_faces: max_faces, quality_filter: quality_filter)
        search_faces_by_image(input)
      end

      def search_faces_by_image(input : Types::SearchFacesByImageRequest) : Types::SearchFacesByImageResponse
        request = Protocol::JsonRpc.build_request(Model::SEARCH_FACES_BY_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SearchFacesByImageResponse, "SearchFacesByImage")
      end

      # Searches for UserIDs within a collection based on a FaceId or UserId . This API can be used to find
      # the closest UserID (with a highest similarity) to associate a face. The request must be provided
      # with either FaceId or UserId . The operation returns an array of UserID that match the FaceId or
      # UserId , ordered by similarity score with the highest similarity first.

      def search_users(
        collection_id : String,
        face_id : String? = nil,
        max_users : Int32? = nil,
        user_id : String? = nil,
        user_match_threshold : Float64? = nil
      ) : Types::SearchUsersResponse

        input = Types::SearchUsersRequest.new(collection_id: collection_id, face_id: face_id, max_users: max_users, user_id: user_id, user_match_threshold: user_match_threshold)
        search_users(input)
      end

      def search_users(input : Types::SearchUsersRequest) : Types::SearchUsersResponse
        request = Protocol::JsonRpc.build_request(Model::SEARCH_USERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SearchUsersResponse, "SearchUsers")
      end

      # Searches for UserIDs using a supplied image. It first detects the largest face in the image, and
      # then searches a specified collection for matching UserIDs. The operation returns an array of UserIDs
      # that match the face in the supplied image, ordered by similarity score with the highest similarity
      # first. It also returns a bounding box for the face found in the input image. Information about faces
      # detected in the supplied image, but not used for the search, is returned in an array of
      # UnsearchedFace objects. If no valid face is detected in the image, the response will contain an
      # empty UserMatches list and no SearchedFace object.

      def search_users_by_image(
        collection_id : String,
        image : Types::Image,
        max_users : Int32? = nil,
        quality_filter : String? = nil,
        user_match_threshold : Float64? = nil
      ) : Types::SearchUsersByImageResponse

        input = Types::SearchUsersByImageRequest.new(collection_id: collection_id, image: image, max_users: max_users, quality_filter: quality_filter, user_match_threshold: user_match_threshold)
        search_users_by_image(input)
      end

      def search_users_by_image(input : Types::SearchUsersByImageRequest) : Types::SearchUsersByImageResponse
        request = Protocol::JsonRpc.build_request(Model::SEARCH_USERS_BY_IMAGE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SearchUsersByImageResponse, "SearchUsersByImage")
      end

      # Starts asynchronous recognition of celebrities in a stored video. Amazon Rekognition Video can
      # detect celebrities in a video must be stored in an Amazon S3 bucket. Use Video to specify the bucket
      # name and the filename of the video. StartCelebrityRecognition returns a job identifier ( JobId )
      # which you use to get the results of the analysis. When celebrity recognition analysis is finished,
      # Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification Service
      # topic that you specify in NotificationChannel . To get the results of the celebrity recognition
      # analysis, first check that the status value published to the Amazon SNS topic is SUCCEEDED . If so,
      # call GetCelebrityRecognition and pass the job identifier ( JobId ) from the initial call to
      # StartCelebrityRecognition . For more information, see Recognizing celebrities in the Amazon
      # Rekognition Developer Guide.

      def start_celebrity_recognition(
        video : Types::Video,
        client_request_token : String? = nil,
        job_tag : String? = nil,
        notification_channel : Types::NotificationChannel? = nil
      ) : Types::StartCelebrityRecognitionResponse

        input = Types::StartCelebrityRecognitionRequest.new(video: video, client_request_token: client_request_token, job_tag: job_tag, notification_channel: notification_channel)
        start_celebrity_recognition(input)
      end

      def start_celebrity_recognition(input : Types::StartCelebrityRecognitionRequest) : Types::StartCelebrityRecognitionResponse
        request = Protocol::JsonRpc.build_request(Model::START_CELEBRITY_RECOGNITION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartCelebrityRecognitionResponse, "StartCelebrityRecognition")
      end

      # Starts asynchronous detection of inappropriate, unwanted, or offensive content in a stored video.
      # For a list of moderation labels in Amazon Rekognition, see Using the image and video moderation APIs
      # . Amazon Rekognition Video can moderate content in a video stored in an Amazon S3 bucket. Use Video
      # to specify the bucket name and the filename of the video. StartContentModeration returns a job
      # identifier ( JobId ) which you use to get the results of the analysis. When content analysis is
      # finished, Amazon Rekognition Video publishes a completion status to the Amazon Simple Notification
      # Service topic that you specify in NotificationChannel . To get the results of the content analysis,
      # first check that the status value published to the Amazon SNS topic is SUCCEEDED . If so, call
      # GetContentModeration and pass the job identifier ( JobId ) from the initial call to
      # StartContentModeration . For more information, see Moderating content in the Amazon Rekognition
      # Developer Guide.

      def start_content_moderation(
        video : Types::Video,
        client_request_token : String? = nil,
        job_tag : String? = nil,
        min_confidence : Float64? = nil,
        notification_channel : Types::NotificationChannel? = nil
      ) : Types::StartContentModerationResponse

        input = Types::StartContentModerationRequest.new(video: video, client_request_token: client_request_token, job_tag: job_tag, min_confidence: min_confidence, notification_channel: notification_channel)
        start_content_moderation(input)
      end

      def start_content_moderation(input : Types::StartContentModerationRequest) : Types::StartContentModerationResponse
        request = Protocol::JsonRpc.build_request(Model::START_CONTENT_MODERATION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartContentModerationResponse, "StartContentModeration")
      end

      # Starts asynchronous detection of faces in a stored video. Amazon Rekognition Video can detect faces
      # in a video stored in an Amazon S3 bucket. Use Video to specify the bucket name and the filename of
      # the video. StartFaceDetection returns a job identifier ( JobId ) that you use to get the results of
      # the operation. When face detection is finished, Amazon Rekognition Video publishes a completion
      # status to the Amazon Simple Notification Service topic that you specify in NotificationChannel . To
      # get the results of the face detection operation, first check that the status value published to the
      # Amazon SNS topic is SUCCEEDED . If so, call GetFaceDetection and pass the job identifier ( JobId )
      # from the initial call to StartFaceDetection . For more information, see Detecting faces in a stored
      # video in the Amazon Rekognition Developer Guide.

      def start_face_detection(
        video : Types::Video,
        client_request_token : String? = nil,
        face_attributes : String? = nil,
        job_tag : String? = nil,
        notification_channel : Types::NotificationChannel? = nil
      ) : Types::StartFaceDetectionResponse

        input = Types::StartFaceDetectionRequest.new(video: video, client_request_token: client_request_token, face_attributes: face_attributes, job_tag: job_tag, notification_channel: notification_channel)
        start_face_detection(input)
      end

      def start_face_detection(input : Types::StartFaceDetectionRequest) : Types::StartFaceDetectionResponse
        request = Protocol::JsonRpc.build_request(Model::START_FACE_DETECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartFaceDetectionResponse, "StartFaceDetection")
      end

      # Starts the asynchronous search for faces in a collection that match the faces of persons detected in
      # a stored video. The video must be stored in an Amazon S3 bucket. Use Video to specify the bucket
      # name and the filename of the video. StartFaceSearch returns a job identifier ( JobId ) which you use
      # to get the search results once the search has completed. When searching is finished, Amazon
      # Rekognition Video publishes a completion status to the Amazon Simple Notification Service topic that
      # you specify in NotificationChannel . To get the search results, first check that the status value
      # published to the Amazon SNS topic is SUCCEEDED . If so, call GetFaceSearch and pass the job
      # identifier ( JobId ) from the initial call to StartFaceSearch . For more information, see Searching
      # stored videos for faces .

      def start_face_search(
        collection_id : String,
        video : Types::Video,
        client_request_token : String? = nil,
        face_match_threshold : Float64? = nil,
        job_tag : String? = nil,
        notification_channel : Types::NotificationChannel? = nil
      ) : Types::StartFaceSearchResponse

        input = Types::StartFaceSearchRequest.new(collection_id: collection_id, video: video, client_request_token: client_request_token, face_match_threshold: face_match_threshold, job_tag: job_tag, notification_channel: notification_channel)
        start_face_search(input)
      end

      def start_face_search(input : Types::StartFaceSearchRequest) : Types::StartFaceSearchResponse
        request = Protocol::JsonRpc.build_request(Model::START_FACE_SEARCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartFaceSearchResponse, "StartFaceSearch")
      end

      # Starts asynchronous detection of labels in a stored video. Amazon Rekognition Video can detect
      # labels in a video. Labels are instances of real-world entities. This includes objects like flower,
      # tree, and table; events like wedding, graduation, and birthday party; concepts like landscape,
      # evening, and nature; and activities like a person getting out of a car or a person skiing. The video
      # must be stored in an Amazon S3 bucket. Use Video to specify the bucket name and the filename of the
      # video. StartLabelDetection returns a job identifier ( JobId ) which you use to get the results of
      # the operation. When label detection is finished, Amazon Rekognition Video publishes a completion
      # status to the Amazon Simple Notification Service topic that you specify in NotificationChannel . To
      # get the results of the label detection operation, first check that the status value published to the
      # Amazon SNS topic is SUCCEEDED . If so, call GetLabelDetection and pass the job identifier ( JobId )
      # from the initial call to StartLabelDetection . Optional Parameters StartLabelDetection has the
      # GENERAL_LABELS Feature applied by default. This feature allows you to provide filtering criteria to
      # the Settings parameter. You can filter with sets of individual labels or with label categories. You
      # can specify inclusive filters, exclusive filters, or a combination of inclusive and exclusive
      # filters. For more information on filtering, see Detecting labels in a video . You can specify
      # MinConfidence to control the confidence threshold for the labels returned. The default is 50.

      def start_label_detection(
        video : Types::Video,
        client_request_token : String? = nil,
        features : Array(String)? = nil,
        job_tag : String? = nil,
        min_confidence : Float64? = nil,
        notification_channel : Types::NotificationChannel? = nil,
        settings : Types::LabelDetectionSettings? = nil
      ) : Types::StartLabelDetectionResponse

        input = Types::StartLabelDetectionRequest.new(video: video, client_request_token: client_request_token, features: features, job_tag: job_tag, min_confidence: min_confidence, notification_channel: notification_channel, settings: settings)
        start_label_detection(input)
      end

      def start_label_detection(input : Types::StartLabelDetectionRequest) : Types::StartLabelDetectionResponse
        request = Protocol::JsonRpc.build_request(Model::START_LABEL_DETECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartLabelDetectionResponse, "StartLabelDetection")
      end

      # Initiates a new media analysis job. Accepts a manifest file in an Amazon S3 bucket. The output is a
      # manifest file and a summary of the manifest stored in the Amazon S3 bucket.

      def start_media_analysis_job(
        input : Types::MediaAnalysisInput,
        operations_config : Types::MediaAnalysisOperationsConfig,
        output_config : Types::MediaAnalysisOutputConfig,
        client_request_token : String? = nil,
        job_name : String? = nil,
        kms_key_id : String? = nil
      ) : Types::StartMediaAnalysisJobResponse

        input = Types::StartMediaAnalysisJobRequest.new(input: input, operations_config: operations_config, output_config: output_config, client_request_token: client_request_token, job_name: job_name, kms_key_id: kms_key_id)
        start_media_analysis_job(input)
      end

      def start_media_analysis_job(input : Types::StartMediaAnalysisJobRequest) : Types::StartMediaAnalysisJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_MEDIA_ANALYSIS_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartMediaAnalysisJobResponse, "StartMediaAnalysisJob")
      end

      # End of support notice: On October 31, 2025, AWS will discontinue support for Amazon Rekognition
      # People Pathing. After October 31, 2025, you will no longer be able to use the Rekognition People
      # Pathing capability. For more information, visit this blog post . Starts the asynchronous tracking of
      # a person's path in a stored video. Amazon Rekognition Video can track the path of people in a video
      # stored in an Amazon S3 bucket. Use Video to specify the bucket name and the filename of the video.
      # StartPersonTracking returns a job identifier ( JobId ) which you use to get the results of the
      # operation. When label detection is finished, Amazon Rekognition publishes a completion status to the
      # Amazon Simple Notification Service topic that you specify in NotificationChannel . To get the
      # results of the person detection operation, first check that the status value published to the Amazon
      # SNS topic is SUCCEEDED . If so, call GetPersonTracking and pass the job identifier ( JobId ) from
      # the initial call to StartPersonTracking .

      def start_person_tracking(
        video : Types::Video,
        client_request_token : String? = nil,
        job_tag : String? = nil,
        notification_channel : Types::NotificationChannel? = nil
      ) : Types::StartPersonTrackingResponse

        input = Types::StartPersonTrackingRequest.new(video: video, client_request_token: client_request_token, job_tag: job_tag, notification_channel: notification_channel)
        start_person_tracking(input)
      end

      def start_person_tracking(input : Types::StartPersonTrackingRequest) : Types::StartPersonTrackingResponse
        request = Protocol::JsonRpc.build_request(Model::START_PERSON_TRACKING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartPersonTrackingResponse, "StartPersonTracking")
      end

      # This operation applies only to Amazon Rekognition Custom Labels. Starts the running of the version
      # of a model. Starting a model takes a while to complete. To check the current state of the model, use
      # DescribeProjectVersions . Once the model is running, you can detect custom labels in new images by
      # calling DetectCustomLabels . You are charged for the amount of time that the model is running. To
      # stop a running model, call StopProjectVersion . This operation requires permissions to perform the
      # rekognition:StartProjectVersion action.

      def start_project_version(
        min_inference_units : Int32,
        project_version_arn : String,
        max_inference_units : Int32? = nil
      ) : Types::StartProjectVersionResponse

        input = Types::StartProjectVersionRequest.new(min_inference_units: min_inference_units, project_version_arn: project_version_arn, max_inference_units: max_inference_units)
        start_project_version(input)
      end

      def start_project_version(input : Types::StartProjectVersionRequest) : Types::StartProjectVersionResponse
        request = Protocol::JsonRpc.build_request(Model::START_PROJECT_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartProjectVersionResponse, "StartProjectVersion")
      end

      # Starts asynchronous detection of segment detection in a stored video. Amazon Rekognition Video can
      # detect segments in a video stored in an Amazon S3 bucket. Use Video to specify the bucket name and
      # the filename of the video. StartSegmentDetection returns a job identifier ( JobId ) which you use to
      # get the results of the operation. When segment detection is finished, Amazon Rekognition Video
      # publishes a completion status to the Amazon Simple Notification Service topic that you specify in
      # NotificationChannel . You can use the Filters ( StartSegmentDetectionFilters ) input parameter to
      # specify the minimum detection confidence returned in the response. Within Filters , use ShotFilter (
      # StartShotDetectionFilter ) to filter detected shots. Use TechnicalCueFilter (
      # StartTechnicalCueDetectionFilter ) to filter technical cues. To get the results of the segment
      # detection operation, first check that the status value published to the Amazon SNS topic is
      # SUCCEEDED . if so, call GetSegmentDetection and pass the job identifier ( JobId ) from the initial
      # call to StartSegmentDetection . For more information, see Detecting video segments in stored video
      # in the Amazon Rekognition Developer Guide.

      def start_segment_detection(
        segment_types : Array(String),
        video : Types::Video,
        client_request_token : String? = nil,
        filters : Types::StartSegmentDetectionFilters? = nil,
        job_tag : String? = nil,
        notification_channel : Types::NotificationChannel? = nil
      ) : Types::StartSegmentDetectionResponse

        input = Types::StartSegmentDetectionRequest.new(segment_types: segment_types, video: video, client_request_token: client_request_token, filters: filters, job_tag: job_tag, notification_channel: notification_channel)
        start_segment_detection(input)
      end

      def start_segment_detection(input : Types::StartSegmentDetectionRequest) : Types::StartSegmentDetectionResponse
        request = Protocol::JsonRpc.build_request(Model::START_SEGMENT_DETECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartSegmentDetectionResponse, "StartSegmentDetection")
      end

      # Starts processing a stream processor. You create a stream processor by calling CreateStreamProcessor
      # . To tell StartStreamProcessor which stream processor to start, use the value of the Name field
      # specified in the call to CreateStreamProcessor . If you are using a label detection stream processor
      # to detect labels, you need to provide a Start selector and a Stop selector to determine the length
      # of the stream processing time.

      def start_stream_processor(
        name : String,
        start_selector : Types::StreamProcessingStartSelector? = nil,
        stop_selector : Types::StreamProcessingStopSelector? = nil
      ) : Types::StartStreamProcessorResponse

        input = Types::StartStreamProcessorRequest.new(name: name, start_selector: start_selector, stop_selector: stop_selector)
        start_stream_processor(input)
      end

      def start_stream_processor(input : Types::StartStreamProcessorRequest) : Types::StartStreamProcessorResponse
        request = Protocol::JsonRpc.build_request(Model::START_STREAM_PROCESSOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartStreamProcessorResponse, "StartStreamProcessor")
      end

      # Starts asynchronous detection of text in a stored video. Amazon Rekognition Video can detect text in
      # a video stored in an Amazon S3 bucket. Use Video to specify the bucket name and the filename of the
      # video. StartTextDetection returns a job identifier ( JobId ) which you use to get the results of the
      # operation. When text detection is finished, Amazon Rekognition Video publishes a completion status
      # to the Amazon Simple Notification Service topic that you specify in NotificationChannel . To get the
      # results of the text detection operation, first check that the status value published to the Amazon
      # SNS topic is SUCCEEDED . if so, call GetTextDetection and pass the job identifier ( JobId ) from the
      # initial call to StartTextDetection .

      def start_text_detection(
        video : Types::Video,
        client_request_token : String? = nil,
        filters : Types::StartTextDetectionFilters? = nil,
        job_tag : String? = nil,
        notification_channel : Types::NotificationChannel? = nil
      ) : Types::StartTextDetectionResponse

        input = Types::StartTextDetectionRequest.new(video: video, client_request_token: client_request_token, filters: filters, job_tag: job_tag, notification_channel: notification_channel)
        start_text_detection(input)
      end

      def start_text_detection(input : Types::StartTextDetectionRequest) : Types::StartTextDetectionResponse
        request = Protocol::JsonRpc.build_request(Model::START_TEXT_DETECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartTextDetectionResponse, "StartTextDetection")
      end

      # This operation applies only to Amazon Rekognition Custom Labels. Stops a running model. The
      # operation might take a while to complete. To check the current status, call DescribeProjectVersions
      # . Only applies to Custom Labels projects. This operation requires permissions to perform the
      # rekognition:StopProjectVersion action.

      def stop_project_version(
        project_version_arn : String
      ) : Types::StopProjectVersionResponse

        input = Types::StopProjectVersionRequest.new(project_version_arn: project_version_arn)
        stop_project_version(input)
      end

      def stop_project_version(input : Types::StopProjectVersionRequest) : Types::StopProjectVersionResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_PROJECT_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopProjectVersionResponse, "StopProjectVersion")
      end

      # Stops a running stream processor that was created by CreateStreamProcessor .

      def stop_stream_processor(
        name : String
      ) : Types::StopStreamProcessorResponse

        input = Types::StopStreamProcessorRequest.new(name: name)
        stop_stream_processor(input)
      end

      def stop_stream_processor(input : Types::StopStreamProcessorRequest) : Types::StopStreamProcessorResponse
        request = Protocol::JsonRpc.build_request(Model::STOP_STREAM_PROCESSOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StopStreamProcessorResponse, "StopStreamProcessor")
      end

      # Adds one or more key-value tags to an Amazon Rekognition collection, stream processor, or Custom
      # Labels model. For more information, see Tagging AWS Resources . This operation requires permissions
      # to perform the rekognition:TagResource action.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes one or more tags from an Amazon Rekognition collection, stream processor, or Custom Labels
      # model. This operation requires permissions to perform the rekognition:UntagResource action.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # This operation applies only to Amazon Rekognition Custom Labels. Adds or updates one or more entries
      # (images) in a dataset. An entry is a JSON Line which contains the information for a single image,
      # including the image location, assigned labels, and object location bounding boxes. For more
      # information, see Image-Level labels in manifest files and Object localization in manifest files in
      # the Amazon Rekognition Custom Labels Developer Guide . If the source-ref field in the JSON line
      # references an existing image, the existing image in the dataset is updated. If source-ref field
      # doesn't reference an existing image, the image is added as a new image to the dataset. You specify
      # the changes that you want to make in the Changes input parameter. There isn't a limit to the number
      # JSON Lines that you can change, but the size of Changes must be less than 5MB. UpdateDatasetEntries
      # returns immediatly, but the dataset update might take a while to complete. Use DescribeDataset to
      # check the current status. The dataset updated successfully if the value of Status is UPDATE_COMPLETE
      # . To check if any non-terminal errors occured, call ListDatasetEntries and check for the presence of
      # errors lists in the JSON Lines. Dataset update fails if a terminal error occurs ( Status =
      # UPDATE_FAILED ). Currently, you can't access the terminal error information from the Amazon
      # Rekognition Custom Labels SDK. This operation requires permissions to perform the
      # rekognition:UpdateDatasetEntries action.

      def update_dataset_entries(
        changes : Types::DatasetChanges,
        dataset_arn : String
      ) : Types::UpdateDatasetEntriesResponse

        input = Types::UpdateDatasetEntriesRequest.new(changes: changes, dataset_arn: dataset_arn)
        update_dataset_entries(input)
      end

      def update_dataset_entries(input : Types::UpdateDatasetEntriesRequest) : Types::UpdateDatasetEntriesResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DATASET_ENTRIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDatasetEntriesResponse, "UpdateDatasetEntries")
      end

      # Allows you to update a stream processor. You can change some settings and regions of interest and
      # delete certain parameters.

      def update_stream_processor(
        name : String,
        data_sharing_preference_for_update : Types::StreamProcessorDataSharingPreference? = nil,
        parameters_to_delete : Array(String)? = nil,
        regions_of_interest_for_update : Array(Types::RegionOfInterest)? = nil,
        settings_for_update : Types::StreamProcessorSettingsForUpdate? = nil
      ) : Types::UpdateStreamProcessorResponse

        input = Types::UpdateStreamProcessorRequest.new(name: name, data_sharing_preference_for_update: data_sharing_preference_for_update, parameters_to_delete: parameters_to_delete, regions_of_interest_for_update: regions_of_interest_for_update, settings_for_update: settings_for_update)
        update_stream_processor(input)
      end

      def update_stream_processor(input : Types::UpdateStreamProcessorRequest) : Types::UpdateStreamProcessorResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_STREAM_PROCESSOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateStreamProcessorResponse, "UpdateStreamProcessor")
      end
    end
  end
end
