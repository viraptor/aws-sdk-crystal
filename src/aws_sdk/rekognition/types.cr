require "json"
require "time"

module AwsSdk
  module Rekognition
    module Types

      # You are not authorized to perform the action.
      struct AccessDeniedException
        include JSON::Serializable

        def initialize
        end
      end

      # Structure containing the estimated age range, in years, for a face. Amazon Rekognition estimates an
      # age range for faces detected in the input image. Estimated age ranges can overlap. A face of a
      # 5-year-old might have an estimated range of 4-6, while the face of a 6-year-old might have an
      # estimated range of 4-8.
      struct AgeRange
        include JSON::Serializable

        # The highest estimated age.
        @[JSON::Field(key: "High")]
        getter high : Int32?

        # The lowest estimated age.
        @[JSON::Field(key: "Low")]
        getter low : Int32?

        def initialize(
          @high : Int32? = nil,
          @low : Int32? = nil
        )
        end
      end

      # Assets are the images that you use to train and evaluate a model version. Assets can also contain
      # validation information that you use to debug a failed model training.
      struct Asset
        include JSON::Serializable

        @[JSON::Field(key: "GroundTruthManifest")]
        getter ground_truth_manifest : Types::GroundTruthManifest?

        def initialize(
          @ground_truth_manifest : Types::GroundTruthManifest? = nil
        )
        end
      end

      struct AssociateFacesRequest
        include JSON::Serializable

        # The ID of an existing collection containing the UserID.
        @[JSON::Field(key: "CollectionId")]
        getter collection_id : String

        # An array of FaceIDs to associate with the UserID.
        @[JSON::Field(key: "FaceIds")]
        getter face_ids : Array(String)

        # The ID for the existing UserID.
        @[JSON::Field(key: "UserId")]
        getter user_id : String

        # Idempotent token used to identify the request to AssociateFaces . If you use the same token with
        # multiple AssociateFaces requests, the same response is returned. Use ClientRequestToken to prevent
        # the same request from being processed more than once.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # An optional value specifying the minimum confidence in the UserID match to return. The default value
        # is 75.
        @[JSON::Field(key: "UserMatchThreshold")]
        getter user_match_threshold : Float64?

        def initialize(
          @collection_id : String,
          @face_ids : Array(String),
          @user_id : String,
          @client_request_token : String? = nil,
          @user_match_threshold : Float64? = nil
        )
        end
      end

      struct AssociateFacesResponse
        include JSON::Serializable

        # An array of AssociatedFace objects containing FaceIDs that have been successfully associated with
        # the UserID. Returned if the AssociateFaces action is successful.
        @[JSON::Field(key: "AssociatedFaces")]
        getter associated_faces : Array(Types::AssociatedFace)?

        # An array of UnsuccessfulAssociation objects containing FaceIDs that are not successfully associated
        # along with the reasons. Returned if the AssociateFaces action is successful.
        @[JSON::Field(key: "UnsuccessfulFaceAssociations")]
        getter unsuccessful_face_associations : Array(Types::UnsuccessfulFaceAssociation)?

        # The status of an update made to a UserID. Reflects if the UserID has been updated for every
        # requested change.
        @[JSON::Field(key: "UserStatus")]
        getter user_status : String?

        def initialize(
          @associated_faces : Array(Types::AssociatedFace)? = nil,
          @unsuccessful_face_associations : Array(Types::UnsuccessfulFaceAssociation)? = nil,
          @user_status : String? = nil
        )
        end
      end

      # Provides face metadata for the faces that are associated to a specific UserID.
      struct AssociatedFace
        include JSON::Serializable

        # Unique identifier assigned to the face.
        @[JSON::Field(key: "FaceId")]
        getter face_id : String?

        def initialize(
          @face_id : String? = nil
        )
        end
      end

      # Metadata information about an audio stream. An array of AudioMetadata objects for the audio streams
      # found in a stored video is returned by GetSegmentDetection .
      struct AudioMetadata
        include JSON::Serializable

        # The audio codec used to encode or decode the audio stream.
        @[JSON::Field(key: "Codec")]
        getter codec : String?

        # The duration of the audio stream in milliseconds.
        @[JSON::Field(key: "DurationMillis")]
        getter duration_millis : Int64?

        # The number of audio channels in the segment.
        @[JSON::Field(key: "NumberOfChannels")]
        getter number_of_channels : Int64?

        # The sample rate for the audio stream.
        @[JSON::Field(key: "SampleRate")]
        getter sample_rate : Int64?

        def initialize(
          @codec : String? = nil,
          @duration_millis : Int64? = nil,
          @number_of_channels : Int64? = nil,
          @sample_rate : Int64? = nil
        )
        end
      end

      # An image that is picked from the Face Liveness video and returned for audit trail purposes, returned
      # as Base64-encoded bytes.
      struct AuditImage
        include JSON::Serializable

        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Types::BoundingBox?

        # The Base64-encoded bytes representing an image selected from the Face Liveness video and returned
        # for audit purposes.
        @[JSON::Field(key: "Bytes")]
        getter bytes : Bytes?

        @[JSON::Field(key: "S3Object")]
        getter s3_object : Types::S3Object?

        def initialize(
          @bounding_box : Types::BoundingBox? = nil,
          @bytes : Bytes? = nil,
          @s3_object : Types::S3Object? = nil
        )
        end
      end

      # Indicates whether or not the face has a beard, and the confidence level in the determination.
      struct Beard
        include JSON::Serializable

        # Level of confidence in the determination.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # Boolean value that indicates whether the face has beard or not.
        @[JSON::Field(key: "Value")]
        getter value : Bool?

        def initialize(
          @confidence : Float64? = nil,
          @value : Bool? = nil
        )
        end
      end

      # A filter that allows you to control the black frame detection by specifying the black levels and
      # pixel coverage of black pixels in a frame. As videos can come from multiple sources, formats, and
      # time periods, they may contain different standards and varying noise levels for black frames that
      # need to be accounted for. For more information, see StartSegmentDetection .
      struct BlackFrame
        include JSON::Serializable

        # A threshold used to determine the maximum luminance value for a pixel to be considered black. In a
        # full color range video, luminance values range from 0-255. A pixel value of 0 is pure black, and the
        # most strict filter. The maximum black pixel value is computed as follows: max_black_pixel_value =
        # minimum_luminance + MaxPixelThreshold *luminance_range. For example, for a full range video with
        # BlackPixelThreshold = 0.1, max_black_pixel_value is 0 + 0.1 * (255-0) = 25.5. The default value of
        # MaxPixelThreshold is 0.2, which maps to a max_black_pixel_value of 51 for a full range video. You
        # can lower this threshold to be more strict on black levels.
        @[JSON::Field(key: "MaxPixelThreshold")]
        getter max_pixel_threshold : Float64?

        # The minimum percentage of pixels in a frame that need to have a luminance below the
        # max_black_pixel_value for a frame to be considered a black frame. Luminance is calculated using the
        # BT.709 matrix. The default value is 99, which means at least 99% of all pixels in the frame are
        # black pixels as per the MaxPixelThreshold set. You can reduce this value to allow more noise on the
        # black frame.
        @[JSON::Field(key: "MinCoveragePercentage")]
        getter min_coverage_percentage : Float64?

        def initialize(
          @max_pixel_threshold : Float64? = nil,
          @min_coverage_percentage : Float64? = nil
        )
        end
      end

      # Identifies the bounding box around the label, face, text, object of interest, or personal protective
      # equipment. The left (x-coordinate) and top (y-coordinate) are coordinates representing the top and
      # left sides of the bounding box. Note that the upper-left corner of the image is the origin (0,0).
      # The top and left values returned are ratios of the overall image size. For example, if the input
      # image is 700x200 pixels, and the top-left coordinate of the bounding box is 350x50 pixels, the API
      # returns a left value of 0.5 (350/700) and a top value of 0.25 (50/200). The width and height values
      # represent the dimensions of the bounding box as a ratio of the overall image dimension. For example,
      # if the input image is 700x200 pixels, and the bounding box width is 70 pixels, the width returned is
      # 0.1. The bounding box coordinates can have negative values. For example, if Amazon Rekognition is
      # able to detect a face that is at the image edge and is only partially visible, the service can
      # return coordinates that are outside the image bounds and, depending on the image edge, you might get
      # negative values or values greater than 1 for the left or top values.
      struct BoundingBox
        include JSON::Serializable

        # Height of the bounding box as a ratio of the overall image height.
        @[JSON::Field(key: "Height")]
        getter height : Float64?

        # Left coordinate of the bounding box as a ratio of overall image width.
        @[JSON::Field(key: "Left")]
        getter left : Float64?

        # Top coordinate of the bounding box as a ratio of overall image height.
        @[JSON::Field(key: "Top")]
        getter top : Float64?

        # Width of the bounding box as a ratio of the overall image width.
        @[JSON::Field(key: "Width")]
        getter width : Float64?

        def initialize(
          @height : Float64? = nil,
          @left : Float64? = nil,
          @top : Float64? = nil,
          @width : Float64? = nil
        )
        end
      end

      # Provides information about a celebrity recognized by the RecognizeCelebrities operation.
      struct Celebrity
        include JSON::Serializable

        # Provides information about the celebrity's face, such as its location on the image.
        @[JSON::Field(key: "Face")]
        getter face : Types::ComparedFace?

        # A unique identifier for the celebrity.
        @[JSON::Field(key: "Id")]
        getter id : String?

        @[JSON::Field(key: "KnownGender")]
        getter known_gender : Types::KnownGender?

        # The confidence, in percentage, that Amazon Rekognition has that the recognized face is the
        # celebrity.
        @[JSON::Field(key: "MatchConfidence")]
        getter match_confidence : Float64?

        # The name of the celebrity.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # An array of URLs pointing to additional information about the celebrity. If there is no additional
        # information about the celebrity, this list is empty.
        @[JSON::Field(key: "Urls")]
        getter urls : Array(String)?

        def initialize(
          @face : Types::ComparedFace? = nil,
          @id : String? = nil,
          @known_gender : Types::KnownGender? = nil,
          @match_confidence : Float64? = nil,
          @name : String? = nil,
          @urls : Array(String)? = nil
        )
        end
      end

      # Information about a recognized celebrity.
      struct CelebrityDetail
        include JSON::Serializable

        # Bounding box around the body of a celebrity.
        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Types::BoundingBox?

        # The confidence, in percentage, that Amazon Rekognition has that the recognized face is the
        # celebrity.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # Face details for the recognized celebrity.
        @[JSON::Field(key: "Face")]
        getter face : Types::FaceDetail?

        # The unique identifier for the celebrity.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # Retrieves the known gender for the celebrity.
        @[JSON::Field(key: "KnownGender")]
        getter known_gender : Types::KnownGender?

        # The name of the celebrity.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # An array of URLs pointing to additional celebrity information.
        @[JSON::Field(key: "Urls")]
        getter urls : Array(String)?

        def initialize(
          @bounding_box : Types::BoundingBox? = nil,
          @confidence : Float64? = nil,
          @face : Types::FaceDetail? = nil,
          @id : String? = nil,
          @known_gender : Types::KnownGender? = nil,
          @name : String? = nil,
          @urls : Array(String)? = nil
        )
        end
      end

      # Information about a detected celebrity and the time the celebrity was detected in a stored video.
      # For more information, see GetCelebrityRecognition in the Amazon Rekognition Developer Guide.
      struct CelebrityRecognition
        include JSON::Serializable

        # Information about a recognized celebrity.
        @[JSON::Field(key: "Celebrity")]
        getter celebrity : Types::CelebrityDetail?

        # The time, in milliseconds from the start of the video, that the celebrity was recognized. Note that
        # Timestamp is not guaranteed to be accurate to the individual frame where the celebrity first
        # appears.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Int64?

        def initialize(
          @celebrity : Types::CelebrityDetail? = nil,
          @timestamp : Int64? = nil
        )
        end
      end

      # Describes the type and version of the challenge being used for the Face Liveness session.
      struct Challenge
        include JSON::Serializable

        # The type of the challenge being used for the Face Liveness session.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The version of the challenge being used for the Face Liveness session.
        @[JSON::Field(key: "Version")]
        getter version : String

        def initialize(
          @type : String,
          @version : String
        )
        end
      end

      # An ordered list of preferred challenge type and versions.
      struct ChallengePreference
        include JSON::Serializable

        # The types of challenges that have been selected for the Face Liveness session.
        @[JSON::Field(key: "Type")]
        getter type : String

        # The version of the challenges that have been selected for the Face Liveness session.
        @[JSON::Field(key: "Versions")]
        getter versions : Types::Versions?

        def initialize(
          @type : String,
          @versions : Types::Versions? = nil
        )
        end
      end

      # Provides information about a face in a target image that matches the source image face analyzed by
      # CompareFaces . The Face property contains the bounding box of the face in the target image. The
      # Similarity property is the confidence that the source image face matches the face in the bounding
      # box.
      struct CompareFacesMatch
        include JSON::Serializable

        # Provides face metadata (bounding box and confidence that the bounding box actually contains a face).
        @[JSON::Field(key: "Face")]
        getter face : Types::ComparedFace?

        # Level of confidence that the faces match.
        @[JSON::Field(key: "Similarity")]
        getter similarity : Float64?

        def initialize(
          @face : Types::ComparedFace? = nil,
          @similarity : Float64? = nil
        )
        end
      end

      struct CompareFacesRequest
        include JSON::Serializable

        # The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon
        # Rekognition operations, passing base64-encoded image bytes is not supported. If you are using an AWS
        # SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the
        # Bytes field. For more information, see Images in the Amazon Rekognition developer guide.
        @[JSON::Field(key: "SourceImage")]
        getter source_image : Types::Image

        # The target image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon
        # Rekognition operations, passing base64-encoded image bytes is not supported. If you are using an AWS
        # SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the
        # Bytes field. For more information, see Images in the Amazon Rekognition developer guide.
        @[JSON::Field(key: "TargetImage")]
        getter target_image : Types::Image

        # A filter that specifies a quality bar for how much filtering is done to identify faces. Filtered
        # faces aren't compared. If you specify AUTO , Amazon Rekognition chooses the quality bar. If you
        # specify LOW , MEDIUM , or HIGH , filtering removes all faces that don’t meet the chosen quality bar.
        # The quality bar is based on a variety of common use cases. Low-quality detections can occur for a
        # number of reasons. Some examples are an object that's misidentified as a face, a face that's too
        # blurry, or a face with a pose that's too extreme to use. If you specify NONE , no filtering is
        # performed. The default value is NONE . To use quality filtering, the collection you are using must
        # be associated with version 3 of the face model or higher.
        @[JSON::Field(key: "QualityFilter")]
        getter quality_filter : String?

        # The minimum level of confidence in the face matches that a match must meet to be included in the
        # FaceMatches array.
        @[JSON::Field(key: "SimilarityThreshold")]
        getter similarity_threshold : Float64?

        def initialize(
          @source_image : Types::Image,
          @target_image : Types::Image,
          @quality_filter : String? = nil,
          @similarity_threshold : Float64? = nil
        )
        end
      end

      struct CompareFacesResponse
        include JSON::Serializable

        # An array of faces in the target image that match the source image face. Each CompareFacesMatch
        # object provides the bounding box, the confidence level that the bounding box contains a face, and
        # the similarity score for the face in the bounding box and the face in the source image.
        @[JSON::Field(key: "FaceMatches")]
        getter face_matches : Array(Types::CompareFacesMatch)?

        # The face in the source image that was used for comparison.
        @[JSON::Field(key: "SourceImageFace")]
        getter source_image_face : Types::ComparedSourceImageFace?

        # The value of SourceImageOrientationCorrection is always null. If the input image is in .jpeg format,
        # it might contain exchangeable image file format (Exif) metadata that includes the image's
        # orientation. Amazon Rekognition uses this orientation information to perform image correction. The
        # bounding box coordinates are translated to represent object locations after the orientation
        # information in the Exif metadata is used to correct the image orientation. Images in .png format
        # don't contain Exif metadata. Amazon Rekognition doesn’t perform image correction for images in .png
        # format and .jpeg images without orientation information in the image Exif metadata. The bounding box
        # coordinates aren't translated and represent the object locations before the image is rotated.
        @[JSON::Field(key: "SourceImageOrientationCorrection")]
        getter source_image_orientation_correction : String?

        # The value of TargetImageOrientationCorrection is always null. If the input image is in .jpeg format,
        # it might contain exchangeable image file format (Exif) metadata that includes the image's
        # orientation. Amazon Rekognition uses this orientation information to perform image correction. The
        # bounding box coordinates are translated to represent object locations after the orientation
        # information in the Exif metadata is used to correct the image orientation. Images in .png format
        # don't contain Exif metadata. Amazon Rekognition doesn’t perform image correction for images in .png
        # format and .jpeg images without orientation information in the image Exif metadata. The bounding box
        # coordinates aren't translated and represent the object locations before the image is rotated.
        @[JSON::Field(key: "TargetImageOrientationCorrection")]
        getter target_image_orientation_correction : String?

        # An array of faces in the target image that did not match the source image face.
        @[JSON::Field(key: "UnmatchedFaces")]
        getter unmatched_faces : Array(Types::ComparedFace)?

        def initialize(
          @face_matches : Array(Types::CompareFacesMatch)? = nil,
          @source_image_face : Types::ComparedSourceImageFace? = nil,
          @source_image_orientation_correction : String? = nil,
          @target_image_orientation_correction : String? = nil,
          @unmatched_faces : Array(Types::ComparedFace)? = nil
        )
        end
      end

      # Provides face metadata for target image faces that are analyzed by CompareFaces and
      # RecognizeCelebrities .
      struct ComparedFace
        include JSON::Serializable

        # Bounding box of the face.
        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Types::BoundingBox?

        # Level of confidence that what the bounding box contains is a face.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The emotions that appear to be expressed on the face, and the confidence level in the determination.
        # Valid values include "Happy", "Sad", "Angry", "Confused", "Disgusted", "Surprised", "Calm",
        # "Unknown", and "Fear".
        @[JSON::Field(key: "Emotions")]
        getter emotions : Array(Types::Emotion)?

        # An array of facial landmarks.
        @[JSON::Field(key: "Landmarks")]
        getter landmarks : Array(Types::Landmark)?

        # Indicates the pose of the face as determined by its pitch, roll, and yaw.
        @[JSON::Field(key: "Pose")]
        getter pose : Types::Pose?

        # Identifies face image brightness and sharpness.
        @[JSON::Field(key: "Quality")]
        getter quality : Types::ImageQuality?

        # Indicates whether or not the face is smiling, and the confidence level in the determination.
        @[JSON::Field(key: "Smile")]
        getter smile : Types::Smile?

        def initialize(
          @bounding_box : Types::BoundingBox? = nil,
          @confidence : Float64? = nil,
          @emotions : Array(Types::Emotion)? = nil,
          @landmarks : Array(Types::Landmark)? = nil,
          @pose : Types::Pose? = nil,
          @quality : Types::ImageQuality? = nil,
          @smile : Types::Smile? = nil
        )
        end
      end

      # Type that describes the face Amazon Rekognition chose to compare with the faces in the target. This
      # contains a bounding box for the selected face and confidence level that the bounding box contains a
      # face. Note that Amazon Rekognition selects the largest face in the source image for this comparison.
      struct ComparedSourceImageFace
        include JSON::Serializable

        # Bounding box of the face.
        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Types::BoundingBox?

        # Confidence level that the selected bounding box contains a face.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        def initialize(
          @bounding_box : Types::BoundingBox? = nil,
          @confidence : Float64? = nil
        )
        end
      end

      # A User with the same Id already exists within the collection, or the update or deletion of the User
      # caused an inconsistent state. **
      struct ConflictException
        include JSON::Serializable

        def initialize
        end
      end

      # Label detection settings to use on a streaming video. Defining the settings is required in the
      # request parameter for CreateStreamProcessor . Including this setting in the CreateStreamProcessor
      # request enables you to use the stream processor for label detection. You can then select what you
      # want the stream processor to detect, such as people or pets. When the stream processor has started,
      # one notification is sent for each object class specified. For example, if packages and pets are
      # selected, one SNS notification is published the first time a package is detected and one SNS
      # notification is published the first time a pet is detected, as well as an end-of-session summary.
      struct ConnectedHomeSettings
        include JSON::Serializable

        # Specifies what you want to detect in the video, such as people, packages, or pets. The current valid
        # labels you can include in this list are: "PERSON", "PET", "PACKAGE", and "ALL".
        @[JSON::Field(key: "Labels")]
        getter labels : Array(String)

        # The minimum confidence required to label an object in the video.
        @[JSON::Field(key: "MinConfidence")]
        getter min_confidence : Float64?

        def initialize(
          @labels : Array(String),
          @min_confidence : Float64? = nil
        )
        end
      end

      # The label detection settings you want to use in your stream processor. This includes the labels you
      # want the stream processor to detect and the minimum confidence level allowed to label objects.
      struct ConnectedHomeSettingsForUpdate
        include JSON::Serializable

        # Specifies what you want to detect in the video, such as people, packages, or pets. The current valid
        # labels you can include in this list are: "PERSON", "PET", "PACKAGE", and "ALL".
        @[JSON::Field(key: "Labels")]
        getter labels : Array(String)?

        # The minimum confidence required to label an object in the video.
        @[JSON::Field(key: "MinConfidence")]
        getter min_confidence : Float64?

        def initialize(
          @labels : Array(String)? = nil,
          @min_confidence : Float64? = nil
        )
        end
      end

      # Information about an inappropriate, unwanted, or offensive content label detection in a stored
      # video.
      struct ContentModerationDetection
        include JSON::Serializable

        # A list of predicted results for the type of content an image contains. For example, the image
        # content might be from animation, sports, or a video game.
        @[JSON::Field(key: "ContentTypes")]
        getter content_types : Array(Types::ContentType)?

        # The time duration of a segment in milliseconds, I.e. time elapsed from StartTimestampMillis to
        # EndTimestampMillis.
        @[JSON::Field(key: "DurationMillis")]
        getter duration_millis : Int64?

        # The time in milliseconds defining the end of the timeline segment containing a continuously detected
        # moderation label.
        @[JSON::Field(key: "EndTimestampMillis")]
        getter end_timestamp_millis : Int64?

        # The content moderation label detected by in the stored video.
        @[JSON::Field(key: "ModerationLabel")]
        getter moderation_label : Types::ModerationLabel?

        # The time in milliseconds defining the start of the timeline segment containing a continuously
        # detected moderation label.
        @[JSON::Field(key: "StartTimestampMillis")]
        getter start_timestamp_millis : Int64?

        # Time, in milliseconds from the beginning of the video, that the content moderation label was
        # detected. Note that Timestamp is not guaranteed to be accurate to the individual frame where the
        # moderated content first appears.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Int64?

        def initialize(
          @content_types : Array(Types::ContentType)? = nil,
          @duration_millis : Int64? = nil,
          @end_timestamp_millis : Int64? = nil,
          @moderation_label : Types::ModerationLabel? = nil,
          @start_timestamp_millis : Int64? = nil,
          @timestamp : Int64? = nil
        )
        end
      end

      # Contains information regarding the confidence and name of a detected content type.
      struct ContentType
        include JSON::Serializable

        # The confidence level of the label given
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The name of the label
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @confidence : Float64? = nil,
          @name : String? = nil
        )
        end
      end

      struct CopyProjectVersionRequest
        include JSON::Serializable

        # The ARN of the project in the trusted AWS account that you want to copy the model version to.
        @[JSON::Field(key: "DestinationProjectArn")]
        getter destination_project_arn : String

        # The S3 bucket and folder location where the training output for the source model version is placed.
        @[JSON::Field(key: "OutputConfig")]
        getter output_config : Types::OutputConfig

        # The ARN of the source project in the trusting AWS account.
        @[JSON::Field(key: "SourceProjectArn")]
        getter source_project_arn : String

        # The ARN of the model version in the source project that you want to copy to a destination project.
        @[JSON::Field(key: "SourceProjectVersionArn")]
        getter source_project_version_arn : String

        # A name for the version of the model that's copied to the destination project.
        @[JSON::Field(key: "VersionName")]
        getter version_name : String

        # The identifier for your AWS Key Management Service key (AWS KMS key). You can supply the Amazon
        # Resource Name (ARN) of your KMS key, the ID of your KMS key, an alias for your KMS key, or an alias
        # ARN. The key is used to encrypt training results and manifest files written to the output Amazon S3
        # bucket ( OutputConfig ). If you choose to use your own KMS key, you need the following permissions
        # on the KMS key. kms:CreateGrant kms:DescribeKey kms:GenerateDataKey kms:Decrypt If you don't specify
        # a value for KmsKeyId , images copied into the service are encrypted using a key that AWS owns and
        # manages.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The key-value tags to assign to the model version.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @destination_project_arn : String,
          @output_config : Types::OutputConfig,
          @source_project_arn : String,
          @source_project_version_arn : String,
          @version_name : String,
          @kms_key_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CopyProjectVersionResponse
        include JSON::Serializable

        # The ARN of the copied model version in the destination project.
        @[JSON::Field(key: "ProjectVersionArn")]
        getter project_version_arn : String?

        def initialize(
          @project_version_arn : String? = nil
        )
        end
      end

      # Information about an item of Personal Protective Equipment covering a corresponding body part. For
      # more information, see DetectProtectiveEquipment .
      struct CoversBodyPart
        include JSON::Serializable

        # The confidence that Amazon Rekognition has in the value of Value .
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # True if the PPE covers the corresponding body part, otherwise false.
        @[JSON::Field(key: "Value")]
        getter value : Bool?

        def initialize(
          @confidence : Float64? = nil,
          @value : Bool? = nil
        )
        end
      end

      struct CreateCollectionRequest
        include JSON::Serializable

        # ID for the collection that you are creating.
        @[JSON::Field(key: "CollectionId")]
        getter collection_id : String

        # A set of tags (key-value pairs) that you want to attach to the collection.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @collection_id : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateCollectionResponse
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the collection. You can use this to manage permissions on your
        # resources.
        @[JSON::Field(key: "CollectionArn")]
        getter collection_arn : String?

        # Version number of the face detection model associated with the collection you are creating.
        @[JSON::Field(key: "FaceModelVersion")]
        getter face_model_version : String?

        # HTTP status code indicating the result of the operation.
        @[JSON::Field(key: "StatusCode")]
        getter status_code : Int32?

        def initialize(
          @collection_arn : String? = nil,
          @face_model_version : String? = nil,
          @status_code : Int32? = nil
        )
        end
      end

      struct CreateDatasetRequest
        include JSON::Serializable

        # The type of the dataset. Specify TRAIN to create a training dataset. Specify TEST to create a test
        # dataset.
        @[JSON::Field(key: "DatasetType")]
        getter dataset_type : String

        # The ARN of the Amazon Rekognition Custom Labels project to which you want to asssign the dataset.
        @[JSON::Field(key: "ProjectArn")]
        getter project_arn : String

        # The source files for the dataset. You can specify the ARN of an existing dataset or specify the
        # Amazon S3 bucket location of an Amazon Sagemaker format manifest file. If you don't specify
        # datasetSource , an empty dataset is created. To add labeled images to the dataset, You can use the
        # console or call UpdateDatasetEntries .
        @[JSON::Field(key: "DatasetSource")]
        getter dataset_source : Types::DatasetSource?

        # A set of tags (key-value pairs) that you want to attach to the dataset.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @dataset_type : String,
          @project_arn : String,
          @dataset_source : Types::DatasetSource? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateDatasetResponse
        include JSON::Serializable

        # The ARN of the created Amazon Rekognition Custom Labels dataset.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String?

        def initialize(
          @dataset_arn : String? = nil
        )
        end
      end

      struct CreateFaceLivenessSessionRequest
        include JSON::Serializable

        # Idempotent token is used to recognize the Face Liveness request. If the same token is used with
        # multiple CreateFaceLivenessSession requests, the same session is returned. This token is employed to
        # avoid unintentionally creating the same session multiple times.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The identifier for your AWS Key Management Service key (AWS KMS key). Used to encrypt audit images
        # and reference images.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # A session settings object. It contains settings for the operation to be performed. For Face
        # Liveness, it accepts OutputConfig and AuditImagesLimit .
        @[JSON::Field(key: "Settings")]
        getter settings : Types::CreateFaceLivenessSessionRequestSettings?

        def initialize(
          @client_request_token : String? = nil,
          @kms_key_id : String? = nil,
          @settings : Types::CreateFaceLivenessSessionRequestSettings? = nil
        )
        end
      end

      # A session settings object. It contains settings for the operation to be performed. It accepts
      # arguments for OutputConfig and AuditImagesLimit.
      struct CreateFaceLivenessSessionRequestSettings
        include JSON::Serializable

        # Number of audit images to be returned back. Takes an integer between 0-4. Any integer less than 0
        # will return 0, any integer above 4 will return 4 images in the response. By default, it is set to 0.
        # The limit is best effort and is based on the actual duration of the selfie-video.
        @[JSON::Field(key: "AuditImagesLimit")]
        getter audit_images_limit : Int32?

        # Indicates preferred challenge types and versions for the Face Liveness session to be created.
        @[JSON::Field(key: "ChallengePreferences")]
        getter challenge_preferences : Array(Types::ChallengePreference)?

        # Can specify the location of an Amazon S3 bucket, where reference and audit images will be stored.
        # Note that the Amazon S3 bucket must be located in the caller's AWS account and in the same region as
        # the Face Liveness end-point. Additionally, the Amazon S3 object keys are auto-generated by the Face
        # Liveness system. Requires that the caller has the s3:PutObject permission on the Amazon S3 bucket.
        @[JSON::Field(key: "OutputConfig")]
        getter output_config : Types::LivenessOutputConfig?

        def initialize(
          @audit_images_limit : Int32? = nil,
          @challenge_preferences : Array(Types::ChallengePreference)? = nil,
          @output_config : Types::LivenessOutputConfig? = nil
        )
        end
      end

      struct CreateFaceLivenessSessionResponse
        include JSON::Serializable

        # A unique 128-bit UUID identifying a Face Liveness session. A new sessionID must be used for every
        # Face Liveness check. If a given sessionID is used for subsequent Face Liveness checks, the checks
        # will fail. Additionally, a SessionId expires 3 minutes after it's sent, making all Liveness data
        # associated with the session (e.g., sessionID, reference image, audit images, etc.) unavailable.
        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        def initialize(
          @session_id : String
        )
        end
      end

      struct CreateProjectRequest
        include JSON::Serializable

        # The name of the project to create.
        @[JSON::Field(key: "ProjectName")]
        getter project_name : String

        # Specifies whether automatic retraining should be attempted for the versions of the project.
        # Automatic retraining is done as a best effort. Required argument for Content Moderation. Applicable
        # only to adapters.
        @[JSON::Field(key: "AutoUpdate")]
        getter auto_update : String?

        # Specifies feature that is being customized. If no value is provided CUSTOM_LABELS is used as a
        # default.
        @[JSON::Field(key: "Feature")]
        getter feature : String?

        # A set of tags (key-value pairs) that you want to attach to the project.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @project_name : String,
          @auto_update : String? = nil,
          @feature : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateProjectResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the new project. You can use the ARN to configure IAM access to
        # the project.
        @[JSON::Field(key: "ProjectArn")]
        getter project_arn : String?

        def initialize(
          @project_arn : String? = nil
        )
        end
      end

      struct CreateProjectVersionRequest
        include JSON::Serializable

        # The Amazon S3 bucket location to store the results of training. The bucket can be any S3 bucket in
        # your AWS account. You need s3:PutObject permission on the bucket.
        @[JSON::Field(key: "OutputConfig")]
        getter output_config : Types::OutputConfig

        # The ARN of the Amazon Rekognition project that will manage the project version you want to train.
        @[JSON::Field(key: "ProjectArn")]
        getter project_arn : String

        # A name for the version of the project version. This value must be unique.
        @[JSON::Field(key: "VersionName")]
        getter version_name : String

        # Feature-specific configuration of the training job. If the job configuration does not match the
        # feature type associated with the project, an InvalidParameterException is returned.
        @[JSON::Field(key: "FeatureConfig")]
        getter feature_config : Types::CustomizationFeatureConfig?

        # The identifier for your AWS Key Management Service key (AWS KMS key). You can supply the Amazon
        # Resource Name (ARN) of your KMS key, the ID of your KMS key, an alias for your KMS key, or an alias
        # ARN. The key is used to encrypt training images, test images, and manifest files copied into the
        # service for the project version. Your source images are unaffected. The key is also used to encrypt
        # training results and manifest files written to the output Amazon S3 bucket ( OutputConfig ). If you
        # choose to use your own KMS key, you need the following permissions on the KMS key. kms:CreateGrant
        # kms:DescribeKey kms:GenerateDataKey kms:Decrypt If you don't specify a value for KmsKeyId , images
        # copied into the service are encrypted using a key that AWS owns and manages.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # A set of tags (key-value pairs) that you want to attach to the project version.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # Specifies an external manifest that the service uses to test the project version. If you specify
        # TestingData you must also specify TrainingData . The project must not have any associated datasets.
        @[JSON::Field(key: "TestingData")]
        getter testing_data : Types::TestingData?

        # Specifies an external manifest that the services uses to train the project version. If you specify
        # TrainingData you must also specify TestingData . The project must not have any associated datasets.
        @[JSON::Field(key: "TrainingData")]
        getter training_data : Types::TrainingData?

        # A description applied to the project version being created.
        @[JSON::Field(key: "VersionDescription")]
        getter version_description : String?

        def initialize(
          @output_config : Types::OutputConfig,
          @project_arn : String,
          @version_name : String,
          @feature_config : Types::CustomizationFeatureConfig? = nil,
          @kms_key_id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @testing_data : Types::TestingData? = nil,
          @training_data : Types::TrainingData? = nil,
          @version_description : String? = nil
        )
        end
      end

      struct CreateProjectVersionResponse
        include JSON::Serializable

        # The ARN of the model or the project version that was created. Use DescribeProjectVersion to get the
        # current status of the training operation.
        @[JSON::Field(key: "ProjectVersionArn")]
        getter project_version_arn : String?

        def initialize(
          @project_version_arn : String? = nil
        )
        end
      end

      struct CreateStreamProcessorRequest
        include JSON::Serializable

        # Kinesis video stream stream that provides the source streaming video. If you are using the AWS CLI,
        # the parameter name is StreamProcessorInput . This is required for both face search and label
        # detection stream processors.
        @[JSON::Field(key: "Input")]
        getter input : Types::StreamProcessorInput

        # An identifier you assign to the stream processor. You can use Name to manage the stream processor.
        # For example, you can get the current status of the stream processor by calling
        # DescribeStreamProcessor . Name is idempotent. This is required for both face search and label
        # detection stream processors.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Kinesis data stream stream or Amazon S3 bucket location to which Amazon Rekognition Video puts the
        # analysis results. If you are using the AWS CLI, the parameter name is StreamProcessorOutput . This
        # must be a S3Destination of an Amazon S3 bucket that you own for a label detection stream processor
        # or a Kinesis data stream ARN for a face search stream processor.
        @[JSON::Field(key: "Output")]
        getter output : Types::StreamProcessorOutput

        # The Amazon Resource Number (ARN) of the IAM role that allows access to the stream processor. The IAM
        # role provides Rekognition read permissions for a Kinesis stream. It also provides write permissions
        # to an Amazon S3 bucket and Amazon Simple Notification Service topic for a label detection stream
        # processor. This is required for both face search and label detection stream processors.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # Input parameters used in a streaming video analyzed by a stream processor. You can use FaceSearch to
        # recognize faces in a streaming video, or you can use ConnectedHome to detect labels.
        @[JSON::Field(key: "Settings")]
        getter settings : Types::StreamProcessorSettings

        # Shows whether you are sharing data with Rekognition to improve model performance. You can choose
        # this option at the account level or on a per-stream basis. Note that if you opt out at the account
        # level this setting is ignored on individual streams.
        @[JSON::Field(key: "DataSharingPreference")]
        getter data_sharing_preference : Types::StreamProcessorDataSharingPreference?

        # The identifier for your AWS Key Management Service key (AWS KMS key). This is an optional parameter
        # for label detection stream processors and should not be used to create a face search stream
        # processor. You can supply the Amazon Resource Name (ARN) of your KMS key, the ID of your KMS key, an
        # alias for your KMS key, or an alias ARN. The key is used to encrypt results and data published to
        # your Amazon S3 bucket, which includes image frames and hero images. Your source images are
        # unaffected.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        @[JSON::Field(key: "NotificationChannel")]
        getter notification_channel : Types::StreamProcessorNotificationChannel?

        # Specifies locations in the frames where Amazon Rekognition checks for objects or people. You can
        # specify up to 10 regions of interest, and each region has either a polygon or a bounding box. This
        # is an optional parameter for label detection stream processors and should not be used to create a
        # face search stream processor.
        @[JSON::Field(key: "RegionsOfInterest")]
        getter regions_of_interest : Array(Types::RegionOfInterest)?

        # A set of tags (key-value pairs) that you want to attach to the stream processor.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @input : Types::StreamProcessorInput,
          @name : String,
          @output : Types::StreamProcessorOutput,
          @role_arn : String,
          @settings : Types::StreamProcessorSettings,
          @data_sharing_preference : Types::StreamProcessorDataSharingPreference? = nil,
          @kms_key_id : String? = nil,
          @notification_channel : Types::StreamProcessorNotificationChannel? = nil,
          @regions_of_interest : Array(Types::RegionOfInterest)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateStreamProcessorResponse
        include JSON::Serializable

        # Amazon Resource Number for the newly created stream processor.
        @[JSON::Field(key: "StreamProcessorArn")]
        getter stream_processor_arn : String?

        def initialize(
          @stream_processor_arn : String? = nil
        )
        end
      end

      struct CreateUserRequest
        include JSON::Serializable

        # The ID of an existing collection to which the new UserID needs to be created.
        @[JSON::Field(key: "CollectionId")]
        getter collection_id : String

        # ID for the UserID to be created. This ID needs to be unique within the collection.
        @[JSON::Field(key: "UserId")]
        getter user_id : String

        # Idempotent token used to identify the request to CreateUser . If you use the same token with
        # multiple CreateUser requests, the same response is returned. Use ClientRequestToken to prevent the
        # same request from being processed more than once.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @collection_id : String,
          @user_id : String,
          @client_request_token : String? = nil
        )
        end
      end

      struct CreateUserResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A custom label detected in an image by a call to DetectCustomLabels .
      struct CustomLabel
        include JSON::Serializable

        # The confidence that the model has in the detection of the custom label. The range is 0-100. A higher
        # value indicates a higher confidence.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The location of the detected object on the image that corresponds to the custom label. Includes an
        # axis aligned coarse bounding box surrounding the object and a finer grain polygon for more accurate
        # spatial information.
        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::Geometry?

        # The name of the custom label.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @confidence : Float64? = nil,
          @geometry : Types::Geometry? = nil,
          @name : String? = nil
        )
        end
      end

      # Feature specific configuration for the training job. Configuration provided for the job must match
      # the feature type parameter associated with project. If configuration and feature type do not match
      # an InvalidParameterException is returned.
      struct CustomizationFeatureConfig
        include JSON::Serializable

        # Configuration options for Custom Moderation training.
        @[JSON::Field(key: "ContentModeration")]
        getter content_moderation : Types::CustomizationFeatureContentModerationConfig?

        def initialize(
          @content_moderation : Types::CustomizationFeatureContentModerationConfig? = nil
        )
        end
      end

      # Configuration options for Content Moderation training.
      struct CustomizationFeatureContentModerationConfig
        include JSON::Serializable

        # The confidence level you plan to use to identify if unsafe content is present during inference.
        @[JSON::Field(key: "ConfidenceThreshold")]
        getter confidence_threshold : Float64?

        def initialize(
          @confidence_threshold : Float64? = nil
        )
        end
      end

      # Describes updates or additions to a dataset. A Single update or addition is an entry (JSON Line)
      # that provides information about a single image. To update an existing entry, you match the
      # source-ref field of the update entry with the source-ref filed of the entry that you want to update.
      # If the source-ref field doesn't match an existing entry, the entry is added to dataset as a new
      # entry.
      struct DatasetChanges
        include JSON::Serializable

        # A Base64-encoded binary data object containing one or JSON lines that either update the dataset or
        # are additions to the dataset. You change a dataset by calling UpdateDatasetEntries . If you are
        # using an AWS SDK to call UpdateDatasetEntries , you don't need to encode Changes as the SDK encodes
        # the data for you. For example JSON lines, see Image-Level labels in manifest files and and Object
        # localization in manifest files in the Amazon Rekognition Custom Labels Developer Guide .
        @[JSON::Field(key: "GroundTruth")]
        getter ground_truth : Bytes

        def initialize(
          @ground_truth : Bytes
        )
        end
      end

      # A description for a dataset. For more information, see DescribeDataset . The status fields Status ,
      # StatusMessage , and StatusMessageCode reflect the last operation on the dataset.
      struct DatasetDescription
        include JSON::Serializable

        # The Unix timestamp for the time and date that the dataset was created.
        @[JSON::Field(key: "CreationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_timestamp : Time?

        # The status message code for the dataset.
        @[JSON::Field(key: "DatasetStats")]
        getter dataset_stats : Types::DatasetStats?

        # The Unix timestamp for the date and time that the dataset was last updated.
        @[JSON::Field(key: "LastUpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_timestamp : Time?

        # The status of the dataset.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The status message for the dataset.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The status message code for the dataset operation. If a service error occurs, try the API call again
        # later. If a client error occurs, check the input parameters to the dataset API call that failed.
        @[JSON::Field(key: "StatusMessageCode")]
        getter status_message_code : String?

        def initialize(
          @creation_timestamp : Time? = nil,
          @dataset_stats : Types::DatasetStats? = nil,
          @last_updated_timestamp : Time? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @status_message_code : String? = nil
        )
        end
      end

      # Describes a dataset label. For more information, see ListDatasetLabels .
      struct DatasetLabelDescription
        include JSON::Serializable

        # The name of the label.
        @[JSON::Field(key: "LabelName")]
        getter label_name : String?

        # Statistics about the label.
        @[JSON::Field(key: "LabelStats")]
        getter label_stats : Types::DatasetLabelStats?

        def initialize(
          @label_name : String? = nil,
          @label_stats : Types::DatasetLabelStats? = nil
        )
        end
      end

      # Statistics about a label used in a dataset. For more information, see DatasetLabelDescription .
      struct DatasetLabelStats
        include JSON::Serializable

        # The total number of images that have the label assigned to a bounding box.
        @[JSON::Field(key: "BoundingBoxCount")]
        getter bounding_box_count : Int32?

        # The total number of images that use the label.
        @[JSON::Field(key: "EntryCount")]
        getter entry_count : Int32?

        def initialize(
          @bounding_box_count : Int32? = nil,
          @entry_count : Int32? = nil
        )
        end
      end

      # Summary information for an Amazon Rekognition Custom Labels dataset. For more information, see
      # ProjectDescription .
      struct DatasetMetadata
        include JSON::Serializable

        # The Unix timestamp for the date and time that the dataset was created.
        @[JSON::Field(key: "CreationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_timestamp : Time?

        # The Amazon Resource Name (ARN) for the dataset.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String?

        # The type of the dataset.
        @[JSON::Field(key: "DatasetType")]
        getter dataset_type : String?

        # The status for the dataset.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The status message for the dataset.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # The status message code for the dataset operation. If a service error occurs, try the API call again
        # later. If a client error occurs, check the input parameters to the dataset API call that failed.
        @[JSON::Field(key: "StatusMessageCode")]
        getter status_message_code : String?

        def initialize(
          @creation_timestamp : Time? = nil,
          @dataset_arn : String? = nil,
          @dataset_type : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @status_message_code : String? = nil
        )
        end
      end

      # The source that Amazon Rekognition Custom Labels uses to create a dataset. To use an Amazon
      # Sagemaker format manifest file, specify the S3 bucket location in the GroundTruthManifest field. The
      # S3 bucket must be in your AWS account. To create a copy of an existing dataset, specify the Amazon
      # Resource Name (ARN) of an existing dataset in DatasetArn . You need to specify a value for
      # DatasetArn or GroundTruthManifest , but not both. if you supply both values, or if you don't specify
      # any values, an InvalidParameterException exception occurs. For more information, see CreateDataset .
      struct DatasetSource
        include JSON::Serializable

        # The ARN of an Amazon Rekognition Custom Labels dataset that you want to copy.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String?

        @[JSON::Field(key: "GroundTruthManifest")]
        getter ground_truth_manifest : Types::GroundTruthManifest?

        def initialize(
          @dataset_arn : String? = nil,
          @ground_truth_manifest : Types::GroundTruthManifest? = nil
        )
        end
      end

      # Provides statistics about a dataset. For more information, see DescribeDataset .
      struct DatasetStats
        include JSON::Serializable

        # The total number of entries that contain at least one error.
        @[JSON::Field(key: "ErrorEntries")]
        getter error_entries : Int32?

        # The total number of images in the dataset that have labels.
        @[JSON::Field(key: "LabeledEntries")]
        getter labeled_entries : Int32?

        # The total number of images in the dataset.
        @[JSON::Field(key: "TotalEntries")]
        getter total_entries : Int32?

        # The total number of labels declared in the dataset.
        @[JSON::Field(key: "TotalLabels")]
        getter total_labels : Int32?

        def initialize(
          @error_entries : Int32? = nil,
          @labeled_entries : Int32? = nil,
          @total_entries : Int32? = nil,
          @total_labels : Int32? = nil
        )
        end
      end

      struct DeleteCollectionRequest
        include JSON::Serializable

        # ID of the collection to delete.
        @[JSON::Field(key: "CollectionId")]
        getter collection_id : String

        def initialize(
          @collection_id : String
        )
        end
      end

      struct DeleteCollectionResponse
        include JSON::Serializable

        # HTTP status code that indicates the result of the operation.
        @[JSON::Field(key: "StatusCode")]
        getter status_code : Int32?

        def initialize(
          @status_code : Int32? = nil
        )
        end
      end

      struct DeleteDatasetRequest
        include JSON::Serializable

        # The ARN of the Amazon Rekognition Custom Labels dataset that you want to delete.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String

        def initialize(
          @dataset_arn : String
        )
        end
      end

      struct DeleteDatasetResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteFacesRequest
        include JSON::Serializable

        # Collection from which to remove the specific faces.
        @[JSON::Field(key: "CollectionId")]
        getter collection_id : String

        # An array of face IDs to delete.
        @[JSON::Field(key: "FaceIds")]
        getter face_ids : Array(String)

        def initialize(
          @collection_id : String,
          @face_ids : Array(String)
        )
        end
      end

      struct DeleteFacesResponse
        include JSON::Serializable

        # An array of strings (face IDs) of the faces that were deleted.
        @[JSON::Field(key: "DeletedFaces")]
        getter deleted_faces : Array(String)?

        # An array of any faces that weren't deleted.
        @[JSON::Field(key: "UnsuccessfulFaceDeletions")]
        getter unsuccessful_face_deletions : Array(Types::UnsuccessfulFaceDeletion)?

        def initialize(
          @deleted_faces : Array(String)? = nil,
          @unsuccessful_face_deletions : Array(Types::UnsuccessfulFaceDeletion)? = nil
        )
        end
      end

      struct DeleteProjectPolicyRequest
        include JSON::Serializable

        # The name of the policy that you want to delete.
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The Amazon Resource Name (ARN) of the project that the project policy you want to delete is attached
        # to.
        @[JSON::Field(key: "ProjectArn")]
        getter project_arn : String

        # The ID of the project policy revision that you want to delete.
        @[JSON::Field(key: "PolicyRevisionId")]
        getter policy_revision_id : String?

        def initialize(
          @policy_name : String,
          @project_arn : String,
          @policy_revision_id : String? = nil
        )
        end
      end

      struct DeleteProjectPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteProjectRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the project that you want to delete.
        @[JSON::Field(key: "ProjectArn")]
        getter project_arn : String

        def initialize(
          @project_arn : String
        )
        end
      end

      struct DeleteProjectResponse
        include JSON::Serializable

        # The current status of the delete project operation.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      struct DeleteProjectVersionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the project version that you want to delete.
        @[JSON::Field(key: "ProjectVersionArn")]
        getter project_version_arn : String

        def initialize(
          @project_version_arn : String
        )
        end
      end

      struct DeleteProjectVersionResponse
        include JSON::Serializable

        # The status of the deletion operation.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      struct DeleteStreamProcessorRequest
        include JSON::Serializable

        # The name of the stream processor you want to delete.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeleteStreamProcessorResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteUserRequest
        include JSON::Serializable

        # The ID of an existing collection from which the UserID needs to be deleted.
        @[JSON::Field(key: "CollectionId")]
        getter collection_id : String

        # ID for the UserID to be deleted.
        @[JSON::Field(key: "UserId")]
        getter user_id : String

        # Idempotent token used to identify the request to DeleteUser . If you use the same token with
        # multiple DeleteUser requests, the same response is returned. Use ClientRequestToken to prevent the
        # same request from being processed more than once.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @collection_id : String,
          @user_id : String,
          @client_request_token : String? = nil
        )
        end
      end

      struct DeleteUserResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeCollectionRequest
        include JSON::Serializable

        # The ID of the collection to describe.
        @[JSON::Field(key: "CollectionId")]
        getter collection_id : String

        def initialize(
          @collection_id : String
        )
        end
      end

      struct DescribeCollectionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the collection.
        @[JSON::Field(key: "CollectionARN")]
        getter collection_arn : String?

        # The number of milliseconds since the Unix epoch time until the creation of the collection. The Unix
        # epoch time is 00:00:00 Coordinated Universal Time (UTC), Thursday, 1 January 1970.
        @[JSON::Field(key: "CreationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_timestamp : Time?

        # The number of faces that are indexed into the collection. To index faces into a collection, use
        # IndexFaces .
        @[JSON::Field(key: "FaceCount")]
        getter face_count : Int64?

        # The version of the face model that's used by the collection for face detection. For more
        # information, see Model versioning in the Amazon Rekognition Developer Guide.
        @[JSON::Field(key: "FaceModelVersion")]
        getter face_model_version : String?

        # The number of UserIDs assigned to the specified colleciton.
        @[JSON::Field(key: "UserCount")]
        getter user_count : Int64?

        def initialize(
          @collection_arn : String? = nil,
          @creation_timestamp : Time? = nil,
          @face_count : Int64? = nil,
          @face_model_version : String? = nil,
          @user_count : Int64? = nil
        )
        end
      end

      struct DescribeDatasetRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset that you want to describe.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String

        def initialize(
          @dataset_arn : String
        )
        end
      end

      struct DescribeDatasetResponse
        include JSON::Serializable

        # The description for the dataset.
        @[JSON::Field(key: "DatasetDescription")]
        getter dataset_description : Types::DatasetDescription?

        def initialize(
          @dataset_description : Types::DatasetDescription? = nil
        )
        end
      end

      struct DescribeProjectVersionsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the project that contains the model/adapter you want to describe.
        @[JSON::Field(key: "ProjectArn")]
        getter project_arn : String

        # The maximum number of results to return per paginated call. The largest value you can specify is
        # 100. If you specify a value greater than 100, a ValidationException error occurs. The default value
        # is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more results to retrieve), Amazon
        # Rekognition returns a pagination token in the response. You can use this pagination token to
        # retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of model or project version names that you want to describe. You can add up to 10 model or
        # project version names to the list. If you don't specify a value, all project version descriptions
        # are returned. A version name is part of a project version ARN. For example,
        # my-model.2020-01-21T09.10.15 is the version name in the following ARN.
        # arn:aws:rekognition:us-east-1:123456789012:project/getting-started/version/
        # my-model.2020-01-21T09.10.15 /1234567890123 .
        @[JSON::Field(key: "VersionNames")]
        getter version_names : Array(String)?

        def initialize(
          @project_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @version_names : Array(String)? = nil
        )
        end
      end

      struct DescribeProjectVersionsResponse
        include JSON::Serializable

        # If the previous response was incomplete (because there is more results to retrieve), Amazon
        # Rekognition returns a pagination token in the response. You can use this pagination token to
        # retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of project version descriptions. The list is sorted by the creation date and time of the
        # project versions, latest to earliest.
        @[JSON::Field(key: "ProjectVersionDescriptions")]
        getter project_version_descriptions : Array(Types::ProjectVersionDescription)?

        def initialize(
          @next_token : String? = nil,
          @project_version_descriptions : Array(Types::ProjectVersionDescription)? = nil
        )
        end
      end

      struct DescribeProjectsRequest
        include JSON::Serializable

        # Specifies the type of customization to filter projects by. If no value is specified, CUSTOM_LABELS
        # is used as a default.
        @[JSON::Field(key: "Features")]
        getter features : Array(String)?

        # The maximum number of results to return per paginated call. The largest value you can specify is
        # 100. If you specify a value greater than 100, a ValidationException error occurs. The default value
        # is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more results to retrieve), Rekognition
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of the projects that you want Rekognition to describe. If you don't specify a value, the
        # response includes descriptions for all the projects in your AWS account.
        @[JSON::Field(key: "ProjectNames")]
        getter project_names : Array(String)?

        def initialize(
          @features : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @project_names : Array(String)? = nil
        )
        end
      end

      struct DescribeProjectsResponse
        include JSON::Serializable

        # If the previous response was incomplete (because there is more results to retrieve), Amazon
        # Rekognition returns a pagination token in the response. You can use this pagination token to
        # retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of project descriptions. The list is sorted by the date and time the projects are created.
        @[JSON::Field(key: "ProjectDescriptions")]
        getter project_descriptions : Array(Types::ProjectDescription)?

        def initialize(
          @next_token : String? = nil,
          @project_descriptions : Array(Types::ProjectDescription)? = nil
        )
        end
      end

      struct DescribeStreamProcessorRequest
        include JSON::Serializable

        # Name of the stream processor for which you want information.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DescribeStreamProcessorResponse
        include JSON::Serializable

        # Date and time the stream processor was created
        @[JSON::Field(key: "CreationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_timestamp : Time?

        # Shows whether you are sharing data with Rekognition to improve model performance. You can choose
        # this option at the account level or on a per-stream basis. Note that if you opt out at the account
        # level this setting is ignored on individual streams.
        @[JSON::Field(key: "DataSharingPreference")]
        getter data_sharing_preference : Types::StreamProcessorDataSharingPreference?

        # Kinesis video stream that provides the source streaming video.
        @[JSON::Field(key: "Input")]
        getter input : Types::StreamProcessorInput?

        # The identifier for your AWS Key Management Service key (AWS KMS key). This is an optional parameter
        # for label detection stream processors.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The time, in Unix format, the stream processor was last updated. For example, when the stream
        # processor moves from a running state to a failed state, or when the user starts or stops the stream
        # processor.
        @[JSON::Field(key: "LastUpdateTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_timestamp : Time?

        # Name of the stream processor.
        @[JSON::Field(key: "Name")]
        getter name : String?

        @[JSON::Field(key: "NotificationChannel")]
        getter notification_channel : Types::StreamProcessorNotificationChannel?

        # Kinesis data stream to which Amazon Rekognition Video puts the analysis results.
        @[JSON::Field(key: "Output")]
        getter output : Types::StreamProcessorOutput?

        # Specifies locations in the frames where Amazon Rekognition checks for objects or people. This is an
        # optional parameter for label detection stream processors.
        @[JSON::Field(key: "RegionsOfInterest")]
        getter regions_of_interest : Array(Types::RegionOfInterest)?

        # ARN of the IAM role that allows access to the stream processor.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Input parameters used in a streaming video analyzed by a stream processor. You can use FaceSearch to
        # recognize faces in a streaming video, or you can use ConnectedHome to detect labels.
        @[JSON::Field(key: "Settings")]
        getter settings : Types::StreamProcessorSettings?

        # Current status of the stream processor.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Detailed status message about the stream processor.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # ARN of the stream processor.
        @[JSON::Field(key: "StreamProcessorArn")]
        getter stream_processor_arn : String?

        def initialize(
          @creation_timestamp : Time? = nil,
          @data_sharing_preference : Types::StreamProcessorDataSharingPreference? = nil,
          @input : Types::StreamProcessorInput? = nil,
          @kms_key_id : String? = nil,
          @last_update_timestamp : Time? = nil,
          @name : String? = nil,
          @notification_channel : Types::StreamProcessorNotificationChannel? = nil,
          @output : Types::StreamProcessorOutput? = nil,
          @regions_of_interest : Array(Types::RegionOfInterest)? = nil,
          @role_arn : String? = nil,
          @settings : Types::StreamProcessorSettings? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @stream_processor_arn : String? = nil
        )
        end
      end

      struct DetectCustomLabelsRequest
        include JSON::Serializable

        @[JSON::Field(key: "Image")]
        getter image : Types::Image

        # The ARN of the model version that you want to use. Only models associated with Custom Labels
        # projects accepted by the operation. If a provided ARN refers to a model version associated with a
        # project for a different feature type, then an InvalidParameterException is returned.
        @[JSON::Field(key: "ProjectVersionArn")]
        getter project_version_arn : String

        # Maximum number of results you want the service to return in the response. The service returns the
        # specified number of highest confidence labels ranked from highest confidence to lowest.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Specifies the minimum confidence level for the labels to return. DetectCustomLabels doesn't return
        # any labels with a confidence value that's lower than this specified value. If you specify a value of
        # 0, DetectCustomLabels returns all labels, regardless of the assumed threshold applied to each label.
        # If you don't specify a value for MinConfidence , DetectCustomLabels returns labels based on the
        # assumed threshold of each label.
        @[JSON::Field(key: "MinConfidence")]
        getter min_confidence : Float64?

        def initialize(
          @image : Types::Image,
          @project_version_arn : String,
          @max_results : Int32? = nil,
          @min_confidence : Float64? = nil
        )
        end
      end

      struct DetectCustomLabelsResponse
        include JSON::Serializable

        # An array of custom labels detected in the input image.
        @[JSON::Field(key: "CustomLabels")]
        getter custom_labels : Array(Types::CustomLabel)?

        def initialize(
          @custom_labels : Array(Types::CustomLabel)? = nil
        )
        end
      end

      struct DetectFacesRequest
        include JSON::Serializable

        # The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon
        # Rekognition operations, passing base64-encoded image bytes is not supported. If you are using an AWS
        # SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the
        # Bytes field. For more information, see Images in the Amazon Rekognition developer guide.
        @[JSON::Field(key: "Image")]
        getter image : Types::Image

        # An array of facial attributes you want to be returned. A DEFAULT subset of facial attributes -
        # BoundingBox , Confidence , Pose , Quality , and Landmarks - will always be returned. You can request
        # for specific facial attributes (in addition to the default list) - by using [ "DEFAULT",
        # "FACE_OCCLUDED" ] or just [ "FACE_OCCLUDED" ]. You can request for all facial attributes by using [
        # "ALL"] . Requesting more attributes may increase response time. If you provide both, ["ALL",
        # "DEFAULT"] , the service uses a logical "AND" operator to determine which attributes to return (in
        # this case, all attributes). Note that while the FaceOccluded and EyeDirection attributes are
        # supported when using DetectFaces , they aren't supported when analyzing videos with
        # StartFaceDetection and GetFaceDetection .
        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(String)?

        def initialize(
          @image : Types::Image,
          @attributes : Array(String)? = nil
        )
        end
      end

      struct DetectFacesResponse
        include JSON::Serializable

        # Details of each face found in the image.
        @[JSON::Field(key: "FaceDetails")]
        getter face_details : Array(Types::FaceDetail)?

        # The value of OrientationCorrection is always null. If the input image is in .jpeg format, it might
        # contain exchangeable image file format (Exif) metadata that includes the image's orientation. Amazon
        # Rekognition uses this orientation information to perform image correction. The bounding box
        # coordinates are translated to represent object locations after the orientation information in the
        # Exif metadata is used to correct the image orientation. Images in .png format don't contain Exif
        # metadata. Amazon Rekognition doesn’t perform image correction for images in .png format and .jpeg
        # images without orientation information in the image Exif metadata. The bounding box coordinates
        # aren't translated and represent the object locations before the image is rotated.
        @[JSON::Field(key: "OrientationCorrection")]
        getter orientation_correction : String?

        def initialize(
          @face_details : Array(Types::FaceDetail)? = nil,
          @orientation_correction : String? = nil
        )
        end
      end

      # The background of the image with regard to image quality and dominant colors.
      struct DetectLabelsImageBackground
        include JSON::Serializable

        # The dominant colors found in the background of an image, defined with RGB values, CSS color name,
        # simplified color name, and PixelPercentage (the percentage of image pixels that have a particular
        # color).
        @[JSON::Field(key: "DominantColors")]
        getter dominant_colors : Array(Types::DominantColor)?

        # The quality of the image background as defined by brightness and sharpness.
        @[JSON::Field(key: "Quality")]
        getter quality : Types::DetectLabelsImageQuality?

        def initialize(
          @dominant_colors : Array(Types::DominantColor)? = nil,
          @quality : Types::DetectLabelsImageQuality? = nil
        )
        end
      end

      # The foreground of the image with regard to image quality and dominant colors.
      struct DetectLabelsImageForeground
        include JSON::Serializable

        # The dominant colors found in the foreground of an image, defined with RGB values, CSS color name,
        # simplified color name, and PixelPercentage (the percentage of image pixels that have a particular
        # color).
        @[JSON::Field(key: "DominantColors")]
        getter dominant_colors : Array(Types::DominantColor)?

        # The quality of the image foreground as defined by brightness and sharpness.
        @[JSON::Field(key: "Quality")]
        getter quality : Types::DetectLabelsImageQuality?

        def initialize(
          @dominant_colors : Array(Types::DominantColor)? = nil,
          @quality : Types::DetectLabelsImageQuality? = nil
        )
        end
      end

      # Information about the quality and dominant colors of an input image. Quality and color information
      # is returned for the entire image, foreground, and background.
      struct DetectLabelsImageProperties
        include JSON::Serializable

        # Information about the properties of an image’s background, including the background’s quality and
        # dominant colors, including the quality and dominant colors of the image.
        @[JSON::Field(key: "Background")]
        getter background : Types::DetectLabelsImageBackground?

        # Information about the dominant colors found in an image, described with RGB values, CSS color name,
        # simplified color name, and PixelPercentage (the percentage of image pixels that have a particular
        # color).
        @[JSON::Field(key: "DominantColors")]
        getter dominant_colors : Array(Types::DominantColor)?

        # Information about the properties of an image’s foreground, including the foreground’s quality and
        # dominant colors, including the quality and dominant colors of the image.
        @[JSON::Field(key: "Foreground")]
        getter foreground : Types::DetectLabelsImageForeground?

        # Information about the quality of the image foreground as defined by brightness, sharpness, and
        # contrast. The higher the value the greater the brightness, sharpness, and contrast respectively.
        @[JSON::Field(key: "Quality")]
        getter quality : Types::DetectLabelsImageQuality?

        def initialize(
          @background : Types::DetectLabelsImageBackground? = nil,
          @dominant_colors : Array(Types::DominantColor)? = nil,
          @foreground : Types::DetectLabelsImageForeground? = nil,
          @quality : Types::DetectLabelsImageQuality? = nil
        )
        end
      end

      # Settings for the IMAGE_PROPERTIES feature type.
      struct DetectLabelsImagePropertiesSettings
        include JSON::Serializable

        # The maximum number of dominant colors to return when detecting labels in an image. The default value
        # is 10.
        @[JSON::Field(key: "MaxDominantColors")]
        getter max_dominant_colors : Int32?

        def initialize(
          @max_dominant_colors : Int32? = nil
        )
        end
      end

      # The quality of an image provided for label detection, with regard to brightness, sharpness, and
      # contrast.
      struct DetectLabelsImageQuality
        include JSON::Serializable

        # The brightness of an image provided for label detection.
        @[JSON::Field(key: "Brightness")]
        getter brightness : Float64?

        # The contrast of an image provided for label detection.
        @[JSON::Field(key: "Contrast")]
        getter contrast : Float64?

        # The sharpness of an image provided for label detection.
        @[JSON::Field(key: "Sharpness")]
        getter sharpness : Float64?

        def initialize(
          @brightness : Float64? = nil,
          @contrast : Float64? = nil,
          @sharpness : Float64? = nil
        )
        end
      end

      struct DetectLabelsRequest
        include JSON::Serializable

        # The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon
        # Rekognition operations, passing image bytes is not supported. Images stored in an S3 Bucket do not
        # need to be base64-encoded. If you are using an AWS SDK to call Amazon Rekognition, you might not
        # need to base64-encode image bytes passed using the Bytes field. For more information, see Images in
        # the Amazon Rekognition developer guide.
        @[JSON::Field(key: "Image")]
        getter image : Types::Image

        # A list of the types of analysis to perform. Specifying GENERAL_LABELS uses the label detection
        # feature, while specifying IMAGE_PROPERTIES returns information regarding image color and quality. If
        # no option is specified GENERAL_LABELS is used by default.
        @[JSON::Field(key: "Features")]
        getter features : Array(String)?

        # Maximum number of labels you want the service to return in the response. The service returns the
        # specified number of highest confidence labels. Only valid when GENERAL_LABELS is specified as a
        # feature type in the Feature input parameter.
        @[JSON::Field(key: "MaxLabels")]
        getter max_labels : Int32?

        # Specifies the minimum confidence level for the labels to return. Amazon Rekognition doesn't return
        # any labels with confidence lower than this specified value. If MinConfidence is not specified, the
        # operation returns labels with a confidence values greater than or equal to 55 percent. Only valid
        # when GENERAL_LABELS is specified as a feature type in the Feature input parameter.
        @[JSON::Field(key: "MinConfidence")]
        getter min_confidence : Float64?

        # A list of the filters to be applied to returned detected labels and image properties. Specified
        # filters can be inclusive, exclusive, or a combination of both. Filters can be used for individual
        # labels or label categories. The exact label names or label categories must be supplied. For a full
        # list of labels and label categories, see Detecting labels .
        @[JSON::Field(key: "Settings")]
        getter settings : Types::DetectLabelsSettings?

        def initialize(
          @image : Types::Image,
          @features : Array(String)? = nil,
          @max_labels : Int32? = nil,
          @min_confidence : Float64? = nil,
          @settings : Types::DetectLabelsSettings? = nil
        )
        end
      end

      struct DetectLabelsResponse
        include JSON::Serializable

        # Information about the properties of the input image, such as brightness, sharpness, contrast, and
        # dominant colors.
        @[JSON::Field(key: "ImageProperties")]
        getter image_properties : Types::DetectLabelsImageProperties?

        # Version number of the label detection model that was used to detect labels.
        @[JSON::Field(key: "LabelModelVersion")]
        getter label_model_version : String?

        # An array of labels for the real-world objects detected.
        @[JSON::Field(key: "Labels")]
        getter labels : Array(Types::Label)?

        # The value of OrientationCorrection is always null. If the input image is in .jpeg format, it might
        # contain exchangeable image file format (Exif) metadata that includes the image's orientation. Amazon
        # Rekognition uses this orientation information to perform image correction. The bounding box
        # coordinates are translated to represent object locations after the orientation information in the
        # Exif metadata is used to correct the image orientation. Images in .png format don't contain Exif
        # metadata. Amazon Rekognition doesn’t perform image correction for images in .png format and .jpeg
        # images without orientation information in the image Exif metadata. The bounding box coordinates
        # aren't translated and represent the object locations before the image is rotated.
        @[JSON::Field(key: "OrientationCorrection")]
        getter orientation_correction : String?

        def initialize(
          @image_properties : Types::DetectLabelsImageProperties? = nil,
          @label_model_version : String? = nil,
          @labels : Array(Types::Label)? = nil,
          @orientation_correction : String? = nil
        )
        end
      end

      # Settings for the DetectLabels request. Settings can include filters for both GENERAL_LABELS and
      # IMAGE_PROPERTIES. GENERAL_LABELS filters can be inclusive or exclusive and applied to individual
      # labels or label categories. IMAGE_PROPERTIES filters allow specification of a maximum number of
      # dominant colors.
      struct DetectLabelsSettings
        include JSON::Serializable

        # Contains the specified filters for GENERAL_LABELS.
        @[JSON::Field(key: "GeneralLabels")]
        getter general_labels : Types::GeneralLabelsSettings?

        # Contains the chosen number of maximum dominant colors in an image.
        @[JSON::Field(key: "ImageProperties")]
        getter image_properties : Types::DetectLabelsImagePropertiesSettings?

        def initialize(
          @general_labels : Types::GeneralLabelsSettings? = nil,
          @image_properties : Types::DetectLabelsImagePropertiesSettings? = nil
        )
        end
      end

      struct DetectModerationLabelsRequest
        include JSON::Serializable

        # The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon
        # Rekognition operations, passing base64-encoded image bytes is not supported. If you are using an AWS
        # SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the
        # Bytes field. For more information, see Images in the Amazon Rekognition developer guide.
        @[JSON::Field(key: "Image")]
        getter image : Types::Image

        # Sets up the configuration for human evaluation, including the FlowDefinition the image will be sent
        # to.
        @[JSON::Field(key: "HumanLoopConfig")]
        getter human_loop_config : Types::HumanLoopConfig?

        # Specifies the minimum confidence level for the labels to return. Amazon Rekognition doesn't return
        # any labels with a confidence level lower than this specified value. If you don't specify
        # MinConfidence , the operation returns labels with confidence values greater than or equal to 50
        # percent.
        @[JSON::Field(key: "MinConfidence")]
        getter min_confidence : Float64?

        # Identifier for the custom adapter. Expects the ProjectVersionArn as a value. Use the CreateProject
        # or CreateProjectVersion APIs to create a custom adapter.
        @[JSON::Field(key: "ProjectVersion")]
        getter project_version : String?

        def initialize(
          @image : Types::Image,
          @human_loop_config : Types::HumanLoopConfig? = nil,
          @min_confidence : Float64? = nil,
          @project_version : String? = nil
        )
        end
      end

      struct DetectModerationLabelsResponse
        include JSON::Serializable

        # A list of predicted results for the type of content an image contains. For example, the image
        # content might be from animation, sports, or a video game.
        @[JSON::Field(key: "ContentTypes")]
        getter content_types : Array(Types::ContentType)?

        # Shows the results of the human in the loop evaluation.
        @[JSON::Field(key: "HumanLoopActivationOutput")]
        getter human_loop_activation_output : Types::HumanLoopActivationOutput?

        # Array of detected Moderation labels. For video operations, this includes the time, in milliseconds
        # from the start of the video, they were detected.
        @[JSON::Field(key: "ModerationLabels")]
        getter moderation_labels : Array(Types::ModerationLabel)?

        # Version number of the base moderation detection model that was used to detect unsafe content.
        @[JSON::Field(key: "ModerationModelVersion")]
        getter moderation_model_version : String?

        # Identifier of the custom adapter that was used during inference. If during inference the adapter was
        # EXPIRED, then the parameter will not be returned, indicating that a base moderation detection
        # project version was used.
        @[JSON::Field(key: "ProjectVersion")]
        getter project_version : String?

        def initialize(
          @content_types : Array(Types::ContentType)? = nil,
          @human_loop_activation_output : Types::HumanLoopActivationOutput? = nil,
          @moderation_labels : Array(Types::ModerationLabel)? = nil,
          @moderation_model_version : String? = nil,
          @project_version : String? = nil
        )
        end
      end

      struct DetectProtectiveEquipmentRequest
        include JSON::Serializable

        # The image in which you want to detect PPE on detected persons. The image can be passed as image
        # bytes or you can reference an image stored in an Amazon S3 bucket.
        @[JSON::Field(key: "Image")]
        getter image : Types::Image

        # An array of PPE types that you want to summarize.
        @[JSON::Field(key: "SummarizationAttributes")]
        getter summarization_attributes : Types::ProtectiveEquipmentSummarizationAttributes?

        def initialize(
          @image : Types::Image,
          @summarization_attributes : Types::ProtectiveEquipmentSummarizationAttributes? = nil
        )
        end
      end

      struct DetectProtectiveEquipmentResponse
        include JSON::Serializable

        # An array of persons detected in the image (including persons not wearing PPE).
        @[JSON::Field(key: "Persons")]
        getter persons : Array(Types::ProtectiveEquipmentPerson)?

        # The version number of the PPE detection model used to detect PPE in the image.
        @[JSON::Field(key: "ProtectiveEquipmentModelVersion")]
        getter protective_equipment_model_version : String?

        # Summary information for the types of PPE specified in the SummarizationAttributes input parameter.
        @[JSON::Field(key: "Summary")]
        getter summary : Types::ProtectiveEquipmentSummary?

        def initialize(
          @persons : Array(Types::ProtectiveEquipmentPerson)? = nil,
          @protective_equipment_model_version : String? = nil,
          @summary : Types::ProtectiveEquipmentSummary? = nil
        )
        end
      end

      # A set of optional parameters that you can use to set the criteria that the text must meet to be
      # included in your response. WordFilter looks at a word’s height, width, and minimum confidence.
      # RegionOfInterest lets you set a specific region of the image to look for text in.
      struct DetectTextFilters
        include JSON::Serializable

        # A Filter focusing on a certain area of the image. Uses a BoundingBox object to set the region of the
        # image.
        @[JSON::Field(key: "RegionsOfInterest")]
        getter regions_of_interest : Array(Types::RegionOfInterest)?

        @[JSON::Field(key: "WordFilter")]
        getter word_filter : Types::DetectionFilter?

        def initialize(
          @regions_of_interest : Array(Types::RegionOfInterest)? = nil,
          @word_filter : Types::DetectionFilter? = nil
        )
        end
      end

      struct DetectTextRequest
        include JSON::Serializable

        # The input image as base64-encoded bytes or an Amazon S3 object. If you use the AWS CLI to call
        # Amazon Rekognition operations, you can't pass image bytes. If you are using an AWS SDK to call
        # Amazon Rekognition, you might not need to base64-encode image bytes passed using the Bytes field.
        # For more information, see Images in the Amazon Rekognition developer guide.
        @[JSON::Field(key: "Image")]
        getter image : Types::Image

        # Optional parameters that let you set the criteria that the text must meet to be included in your
        # response.
        @[JSON::Field(key: "Filters")]
        getter filters : Types::DetectTextFilters?

        def initialize(
          @image : Types::Image,
          @filters : Types::DetectTextFilters? = nil
        )
        end
      end

      struct DetectTextResponse
        include JSON::Serializable

        # An array of text that was detected in the input image.
        @[JSON::Field(key: "TextDetections")]
        getter text_detections : Array(Types::TextDetection)?

        # The model version used to detect text.
        @[JSON::Field(key: "TextModelVersion")]
        getter text_model_version : String?

        def initialize(
          @text_detections : Array(Types::TextDetection)? = nil,
          @text_model_version : String? = nil
        )
        end
      end

      # A set of parameters that allow you to filter out certain results from your returned results.
      struct DetectionFilter
        include JSON::Serializable

        # Sets the minimum height of the word bounding box. Words with bounding box heights lesser than this
        # value will be excluded from the result. Value is relative to the video frame height.
        @[JSON::Field(key: "MinBoundingBoxHeight")]
        getter min_bounding_box_height : Float64?

        # Sets the minimum width of the word bounding box. Words with bounding boxes widths lesser than this
        # value will be excluded from the result. Value is relative to the video frame width.
        @[JSON::Field(key: "MinBoundingBoxWidth")]
        getter min_bounding_box_width : Float64?

        # Sets the confidence of word detection. Words with detection confidence below this will be excluded
        # from the result. Values should be between 0 and 100. The default MinConfidence is 80.
        @[JSON::Field(key: "MinConfidence")]
        getter min_confidence : Float64?

        def initialize(
          @min_bounding_box_height : Float64? = nil,
          @min_bounding_box_width : Float64? = nil,
          @min_confidence : Float64? = nil
        )
        end
      end

      struct DisassociateFacesRequest
        include JSON::Serializable

        # The ID of an existing collection containing the UserID.
        @[JSON::Field(key: "CollectionId")]
        getter collection_id : String

        # An array of face IDs to disassociate from the UserID.
        @[JSON::Field(key: "FaceIds")]
        getter face_ids : Array(String)

        # ID for the existing UserID.
        @[JSON::Field(key: "UserId")]
        getter user_id : String

        # Idempotent token used to identify the request to DisassociateFaces . If you use the same token with
        # multiple DisassociateFaces requests, the same response is returned. Use ClientRequestToken to
        # prevent the same request from being processed more than once.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @collection_id : String,
          @face_ids : Array(String),
          @user_id : String,
          @client_request_token : String? = nil
        )
        end
      end

      struct DisassociateFacesResponse
        include JSON::Serializable

        # An array of DissociatedFace objects containing FaceIds that are successfully disassociated with the
        # UserID is returned. Returned if the DisassociatedFaces action is successful.
        @[JSON::Field(key: "DisassociatedFaces")]
        getter disassociated_faces : Array(Types::DisassociatedFace)?

        # An array of UnsuccessfulDisassociation objects containing FaceIds that are not successfully
        # associated, along with the reasons for the failure to associate. Returned if the DisassociateFaces
        # action is successful.
        @[JSON::Field(key: "UnsuccessfulFaceDisassociations")]
        getter unsuccessful_face_disassociations : Array(Types::UnsuccessfulFaceDisassociation)?

        # The status of an update made to a User. Reflects if the User has been updated for every requested
        # change.
        @[JSON::Field(key: "UserStatus")]
        getter user_status : String?

        def initialize(
          @disassociated_faces : Array(Types::DisassociatedFace)? = nil,
          @unsuccessful_face_disassociations : Array(Types::UnsuccessfulFaceDisassociation)? = nil,
          @user_status : String? = nil
        )
        end
      end

      # Provides face metadata for the faces that are disassociated from a specific UserID.
      struct DisassociatedFace
        include JSON::Serializable

        # Unique identifier assigned to the face.
        @[JSON::Field(key: "FaceId")]
        getter face_id : String?

        def initialize(
          @face_id : String? = nil
        )
        end
      end

      # A training dataset or a test dataset used in a dataset distribution operation. For more information,
      # see DistributeDatasetEntries .
      struct DistributeDataset
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset that you want to use.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      struct DistributeDatasetEntriesRequest
        include JSON::Serializable

        # The ARNS for the training dataset and test dataset that you want to use. The datasets must belong to
        # the same project. The test dataset must be empty.
        @[JSON::Field(key: "Datasets")]
        getter datasets : Array(Types::DistributeDataset)

        def initialize(
          @datasets : Array(Types::DistributeDataset)
        )
        end
      end

      struct DistributeDatasetEntriesResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A description of the dominant colors in an image.
      struct DominantColor
        include JSON::Serializable

        # The Blue RGB value for a dominant color.
        @[JSON::Field(key: "Blue")]
        getter blue : Int32?

        # The CSS color name of a dominant color.
        @[JSON::Field(key: "CSSColor")]
        getter css_color : String?

        # The Green RGB value for a dominant color.
        @[JSON::Field(key: "Green")]
        getter green : Int32?

        # The Hex code equivalent of the RGB values for a dominant color.
        @[JSON::Field(key: "HexCode")]
        getter hex_code : String?

        # The percentage of image pixels that have a given dominant color.
        @[JSON::Field(key: "PixelPercent")]
        getter pixel_percent : Float64?

        # The Red RGB value for a dominant color.
        @[JSON::Field(key: "Red")]
        getter red : Int32?

        # One of 12 simplified color names applied to a dominant color.
        @[JSON::Field(key: "SimplifiedColor")]
        getter simplified_color : String?

        def initialize(
          @blue : Int32? = nil,
          @css_color : String? = nil,
          @green : Int32? = nil,
          @hex_code : String? = nil,
          @pixel_percent : Float64? = nil,
          @red : Int32? = nil,
          @simplified_color : String? = nil
        )
        end
      end

      # The API returns a prediction of an emotion based on a person's facial expressions, along with the
      # confidence level for the predicted emotion. It is not a determination of the person’s internal
      # emotional state and should not be used in such a way. For example, a person pretending to have a sad
      # face might not be sad emotionally. The API is not intended to be used, and you may not use it, in a
      # manner that violates the EU Artificial Intelligence Act or any other applicable law.
      struct Emotion
        include JSON::Serializable

        # Level of confidence in the determination.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # Type of emotion detected.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @confidence : Float64? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about an item of Personal Protective Equipment (PPE) detected by
      # DetectProtectiveEquipment . For more information, see DetectProtectiveEquipment .
      struct EquipmentDetection
        include JSON::Serializable

        # A bounding box surrounding the item of detected PPE.
        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Types::BoundingBox?

        # The confidence that Amazon Rekognition has that the bounding box ( BoundingBox ) contains an item of
        # PPE.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # Information about the body part covered by the detected PPE.
        @[JSON::Field(key: "CoversBodyPart")]
        getter covers_body_part : Types::CoversBodyPart?

        # The type of detected PPE.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @bounding_box : Types::BoundingBox? = nil,
          @confidence : Float64? = nil,
          @covers_body_part : Types::CoversBodyPart? = nil,
          @type : String? = nil
        )
        end
      end

      # The evaluation results for the training of a model.
      struct EvaluationResult
        include JSON::Serializable

        # The F1 score for the evaluation of all labels. The F1 score metric evaluates the overall precision
        # and recall performance of the model as a single value. A higher value indicates better precision and
        # recall performance. A lower score indicates that precision, recall, or both are performing poorly.
        @[JSON::Field(key: "F1Score")]
        getter f1_score : Float64?

        # The S3 bucket that contains the training summary.
        @[JSON::Field(key: "Summary")]
        getter summary : Types::Summary?

        def initialize(
          @f1_score : Float64? = nil,
          @summary : Types::Summary? = nil
        )
        end
      end

      # Indicates the direction the eyes are gazing in (independent of the head pose) as determined by its
      # pitch and yaw.
      struct EyeDirection
        include JSON::Serializable

        # The confidence that the service has in its predicted eye direction.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # Value representing eye direction on the pitch axis.
        @[JSON::Field(key: "Pitch")]
        getter pitch : Float64?

        # Value representing eye direction on the yaw axis.
        @[JSON::Field(key: "Yaw")]
        getter yaw : Float64?

        def initialize(
          @confidence : Float64? = nil,
          @pitch : Float64? = nil,
          @yaw : Float64? = nil
        )
        end
      end

      # Indicates whether or not the eyes on the face are open, and the confidence level in the
      # determination.
      struct EyeOpen
        include JSON::Serializable

        # Level of confidence in the determination.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # Boolean value that indicates whether the eyes on the face are open.
        @[JSON::Field(key: "Value")]
        getter value : Bool?

        def initialize(
          @confidence : Float64? = nil,
          @value : Bool? = nil
        )
        end
      end

      # Indicates whether or not the face is wearing eye glasses, and the confidence level in the
      # determination.
      struct Eyeglasses
        include JSON::Serializable

        # Level of confidence in the determination.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # Boolean value that indicates whether the face is wearing eye glasses or not.
        @[JSON::Field(key: "Value")]
        getter value : Bool?

        def initialize(
          @confidence : Float64? = nil,
          @value : Bool? = nil
        )
        end
      end

      # Describes the face properties such as the bounding box, face ID, image ID of the input image, and
      # external image ID that you assigned.
      struct Face
        include JSON::Serializable

        # Bounding box of the face.
        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Types::BoundingBox?

        # Confidence level that the bounding box contains a face (and not a different object such as a tree).
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # Identifier that you assign to all the faces in the input image.
        @[JSON::Field(key: "ExternalImageId")]
        getter external_image_id : String?

        # Unique identifier that Amazon Rekognition assigns to the face.
        @[JSON::Field(key: "FaceId")]
        getter face_id : String?

        # Unique identifier that Amazon Rekognition assigns to the input image.
        @[JSON::Field(key: "ImageId")]
        getter image_id : String?

        # The version of the face detect and storage model that was used when indexing the face vector.
        @[JSON::Field(key: "IndexFacesModelVersion")]
        getter index_faces_model_version : String?

        # Unique identifier assigned to the user.
        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @bounding_box : Types::BoundingBox? = nil,
          @confidence : Float64? = nil,
          @external_image_id : String? = nil,
          @face_id : String? = nil,
          @image_id : String? = nil,
          @index_faces_model_version : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      # Structure containing attributes of the face that the algorithm detected. A FaceDetail object
      # contains either the default facial attributes or all facial attributes. The default attributes are
      # BoundingBox , Confidence , Landmarks , Pose , and Quality . GetFaceDetection is the only Amazon
      # Rekognition Video stored video operation that can return a FaceDetail object with all attributes. To
      # specify which attributes to return, use the FaceAttributes input parameter for StartFaceDetection .
      # The following Amazon Rekognition Video operations return only the default attributes. The
      # corresponding Start operations don't have a FaceAttributes input parameter: GetCelebrityRecognition
      # GetPersonTracking GetFaceSearch The Amazon Rekognition Image DetectFaces and IndexFaces operations
      # can return all facial attributes. To specify which attributes to return, use the Attributes input
      # parameter for DetectFaces . For IndexFaces , use the DetectAttributes input parameter.
      struct FaceDetail
        include JSON::Serializable

        # The estimated age range, in years, for the face. Low represents the lowest estimated age and High
        # represents the highest estimated age.
        @[JSON::Field(key: "AgeRange")]
        getter age_range : Types::AgeRange?

        # Indicates whether or not the face has a beard, and the confidence level in the determination.
        @[JSON::Field(key: "Beard")]
        getter beard : Types::Beard?

        # Bounding box of the face. Default attribute.
        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Types::BoundingBox?

        # Confidence level that the bounding box contains a face (and not a different object such as a tree).
        # Default attribute.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The emotions that appear to be expressed on the face, and the confidence level in the determination.
        # The API is only making a determination of the physical appearance of a person's face. It is not a
        # determination of the person’s internal emotional state and should not be used in such a way. For
        # example, a person pretending to have a sad face might not be sad emotionally.
        @[JSON::Field(key: "Emotions")]
        getter emotions : Array(Types::Emotion)?

        # Indicates the direction the eyes are gazing in, as defined by pitch and yaw.
        @[JSON::Field(key: "EyeDirection")]
        getter eye_direction : Types::EyeDirection?

        # Indicates whether or not the face is wearing eye glasses, and the confidence level in the
        # determination.
        @[JSON::Field(key: "Eyeglasses")]
        getter eyeglasses : Types::Eyeglasses?

        # Indicates whether or not the eyes on the face are open, and the confidence level in the
        # determination.
        @[JSON::Field(key: "EyesOpen")]
        getter eyes_open : Types::EyeOpen?

        # FaceOccluded should return "true" with a high confidence score if a detected face’s eyes, nose, and
        # mouth are partially captured or if they are covered by masks, dark sunglasses, cell phones, hands,
        # or other objects. FaceOccluded should return "false" with a high confidence score if common
        # occurrences that do not impact face verification are detected, such as eye glasses, lightly tinted
        # sunglasses, strands of hair, and others.
        @[JSON::Field(key: "FaceOccluded")]
        getter face_occluded : Types::FaceOccluded?

        # The predicted gender of a detected face.
        @[JSON::Field(key: "Gender")]
        getter gender : Types::Gender?

        # Indicates the location of landmarks on the face. Default attribute.
        @[JSON::Field(key: "Landmarks")]
        getter landmarks : Array(Types::Landmark)?

        # Indicates whether or not the mouth on the face is open, and the confidence level in the
        # determination.
        @[JSON::Field(key: "MouthOpen")]
        getter mouth_open : Types::MouthOpen?

        # Indicates whether or not the face has a mustache, and the confidence level in the determination.
        @[JSON::Field(key: "Mustache")]
        getter mustache : Types::Mustache?

        # Indicates the pose of the face as determined by its pitch, roll, and yaw. Default attribute.
        @[JSON::Field(key: "Pose")]
        getter pose : Types::Pose?

        # Identifies image brightness and sharpness. Default attribute.
        @[JSON::Field(key: "Quality")]
        getter quality : Types::ImageQuality?

        # Indicates whether or not the face is smiling, and the confidence level in the determination.
        @[JSON::Field(key: "Smile")]
        getter smile : Types::Smile?

        # Indicates whether or not the face is wearing sunglasses, and the confidence level in the
        # determination.
        @[JSON::Field(key: "Sunglasses")]
        getter sunglasses : Types::Sunglasses?

        def initialize(
          @age_range : Types::AgeRange? = nil,
          @beard : Types::Beard? = nil,
          @bounding_box : Types::BoundingBox? = nil,
          @confidence : Float64? = nil,
          @emotions : Array(Types::Emotion)? = nil,
          @eye_direction : Types::EyeDirection? = nil,
          @eyeglasses : Types::Eyeglasses? = nil,
          @eyes_open : Types::EyeOpen? = nil,
          @face_occluded : Types::FaceOccluded? = nil,
          @gender : Types::Gender? = nil,
          @landmarks : Array(Types::Landmark)? = nil,
          @mouth_open : Types::MouthOpen? = nil,
          @mustache : Types::Mustache? = nil,
          @pose : Types::Pose? = nil,
          @quality : Types::ImageQuality? = nil,
          @smile : Types::Smile? = nil,
          @sunglasses : Types::Sunglasses? = nil
        )
        end
      end

      # Information about a face detected in a video analysis request and the time the face was detected in
      # the video.
      struct FaceDetection
        include JSON::Serializable

        # The face properties for the detected face.
        @[JSON::Field(key: "Face")]
        getter face : Types::FaceDetail?

        # Time, in milliseconds from the start of the video, that the face was detected. Note that Timestamp
        # is not guaranteed to be accurate to the individual frame where the face first appears.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Int64?

        def initialize(
          @face : Types::FaceDetail? = nil,
          @timestamp : Int64? = nil
        )
        end
      end

      # Provides face metadata. In addition, it also provides the confidence in the match of this face with
      # the input face.
      struct FaceMatch
        include JSON::Serializable

        # Describes the face properties such as the bounding box, face ID, image ID of the source image, and
        # external image ID that you assigned.
        @[JSON::Field(key: "Face")]
        getter face : Types::Face?

        # Confidence in the match of this face with the input face.
        @[JSON::Field(key: "Similarity")]
        getter similarity : Float64?

        def initialize(
          @face : Types::Face? = nil,
          @similarity : Float64? = nil
        )
        end
      end

      # FaceOccluded should return "true" with a high confidence score if a detected face’s eyes, nose, and
      # mouth are partially captured or if they are covered by masks, dark sunglasses, cell phones, hands,
      # or other objects. FaceOccluded should return "false" with a high confidence score if common
      # occurrences that do not impact face verification are detected, such as eye glasses, lightly tinted
      # sunglasses, strands of hair, and others. You can use FaceOccluded to determine if an obstruction on
      # a face negatively impacts using the image for face matching.
      struct FaceOccluded
        include JSON::Serializable

        # The confidence that the service has detected the presence of a face occlusion.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # True if a detected face’s eyes, nose, and mouth are partially captured or if they are covered by
        # masks, dark sunglasses, cell phones, hands, or other objects. False if common occurrences that do
        # not impact face verification are detected, such as eye glasses, lightly tinted sunglasses, strands
        # of hair, and others.
        @[JSON::Field(key: "Value")]
        getter value : Bool?

        def initialize(
          @confidence : Float64? = nil,
          @value : Bool? = nil
        )
        end
      end

      # Object containing both the face metadata (stored in the backend database), and facial attributes
      # that are detected but aren't stored in the database.
      struct FaceRecord
        include JSON::Serializable

        # Describes the face properties such as the bounding box, face ID, image ID of the input image, and
        # external image ID that you assigned.
        @[JSON::Field(key: "Face")]
        getter face : Types::Face?

        # Structure containing attributes of the face that the algorithm detected.
        @[JSON::Field(key: "FaceDetail")]
        getter face_detail : Types::FaceDetail?

        def initialize(
          @face : Types::Face? = nil,
          @face_detail : Types::FaceDetail? = nil
        )
        end
      end

      # Input face recognition parameters for an Amazon Rekognition stream processor. Includes the
      # collection to use for face recognition and the face attributes to detect. Defining the settings is
      # required in the request parameter for CreateStreamProcessor .
      struct FaceSearchSettings
        include JSON::Serializable

        # The ID of a collection that contains faces that you want to search for.
        @[JSON::Field(key: "CollectionId")]
        getter collection_id : String?

        # Minimum face match confidence score that must be met to return a result for a recognized face. The
        # default is 80. 0 is the lowest confidence. 100 is the highest confidence. Values between 0 and 100
        # are accepted, and values lower than 80 are set to 80.
        @[JSON::Field(key: "FaceMatchThreshold")]
        getter face_match_threshold : Float64?

        def initialize(
          @collection_id : String? = nil,
          @face_match_threshold : Float64? = nil
        )
        end
      end

      # The predicted gender of a detected face. Amazon Rekognition makes gender binary (male/female)
      # predictions based on the physical appearance of a face in a particular image. This kind of
      # prediction is not designed to categorize a person’s gender identity, and you shouldn't use Amazon
      # Rekognition to make such a determination. For example, a male actor wearing a long-haired wig and
      # earrings for a role might be predicted as female. Using Amazon Rekognition to make gender binary
      # predictions is best suited for use cases where aggregate gender distribution statistics need to be
      # analyzed without identifying specific users. For example, the percentage of female users compared to
      # male users on a social media platform. We don't recommend using gender binary predictions to make
      # decisions that impact an individual's rights, privacy, or access to services.
      struct Gender
        include JSON::Serializable

        # Level of confidence in the prediction.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The predicted gender of the face.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @confidence : Float64? = nil,
          @value : String? = nil
        )
        end
      end

      # Contains filters for the object labels returned by DetectLabels. Filters can be inclusive,
      # exclusive, or a combination of both and can be applied to individual labels or entire label
      # categories. To see a list of label categories, see Detecting Labels .
      struct GeneralLabelsSettings
        include JSON::Serializable

        # The label categories that should be excluded from the return from DetectLabels.
        @[JSON::Field(key: "LabelCategoryExclusionFilters")]
        getter label_category_exclusion_filters : Array(String)?

        # The label categories that should be included in the return from DetectLabels.
        @[JSON::Field(key: "LabelCategoryInclusionFilters")]
        getter label_category_inclusion_filters : Array(String)?

        # The labels that should be excluded from the return from DetectLabels.
        @[JSON::Field(key: "LabelExclusionFilters")]
        getter label_exclusion_filters : Array(String)?

        # The labels that should be included in the return from DetectLabels.
        @[JSON::Field(key: "LabelInclusionFilters")]
        getter label_inclusion_filters : Array(String)?

        def initialize(
          @label_category_exclusion_filters : Array(String)? = nil,
          @label_category_inclusion_filters : Array(String)? = nil,
          @label_exclusion_filters : Array(String)? = nil,
          @label_inclusion_filters : Array(String)? = nil
        )
        end
      end

      # Information about where an object ( DetectCustomLabels ) or text ( DetectText ) is located on an
      # image.
      struct Geometry
        include JSON::Serializable

        # An axis-aligned coarse representation of the detected item's location on the image.
        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Types::BoundingBox?

        # Within the bounding box, a fine-grained polygon around the detected item.
        @[JSON::Field(key: "Polygon")]
        getter polygon : Array(Types::Point)?

        def initialize(
          @bounding_box : Types::BoundingBox? = nil,
          @polygon : Array(Types::Point)? = nil
        )
        end
      end

      struct GetCelebrityInfoRequest
        include JSON::Serializable

        # The ID for the celebrity. You get the celebrity ID from a call to the RecognizeCelebrities
        # operation, which recognizes celebrities in an image.
        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct GetCelebrityInfoResponse
        include JSON::Serializable

        # Retrieves the known gender for the celebrity.
        @[JSON::Field(key: "KnownGender")]
        getter known_gender : Types::KnownGender?

        # The name of the celebrity.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # An array of URLs pointing to additional celebrity information.
        @[JSON::Field(key: "Urls")]
        getter urls : Array(String)?

        def initialize(
          @known_gender : Types::KnownGender? = nil,
          @name : String? = nil,
          @urls : Array(String)? = nil
        )
        end
      end

      struct GetCelebrityRecognitionRequest
        include JSON::Serializable

        # Job identifier for the required celebrity recognition analysis. You can get the job identifer from a
        # call to StartCelebrityRecognition .
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # Maximum number of results to return per paginated call. The largest value you can specify is 1000.
        # If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value
        # is 1000.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more recognized celebrities to retrieve),
        # Amazon Rekognition Video returns a pagination token in the response. You can use this pagination
        # token to retrieve the next set of celebrities.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Sort to use for celebrities returned in Celebrities field. Specify ID to sort by the celebrity
        # identifier, specify TIMESTAMP to sort by the time the celebrity was recognized.
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        def initialize(
          @job_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil
        )
        end
      end

      struct GetCelebrityRecognitionResponse
        include JSON::Serializable

        # Array of celebrities recognized in the video.
        @[JSON::Field(key: "Celebrities")]
        getter celebrities : Array(Types::CelebrityRecognition)?

        # Job identifier for the celebrity recognition operation for which you want to obtain results. The job
        # identifer is returned by an initial call to StartCelebrityRecognition.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The current status of the celebrity recognition job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # A job identifier specified in the call to StartCelebrityRecognition and returned in the job
        # completion notification sent to your Amazon Simple Notification Service topic.
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        # If the response is truncated, Amazon Rekognition Video returns this token that you can use in the
        # subsequent request to retrieve the next set of celebrities.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # If the job fails, StatusMessage provides a descriptive error message.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        @[JSON::Field(key: "Video")]
        getter video : Types::Video?

        # Information about a video that Amazon Rekognition Video analyzed. Videometadata is returned in every
        # page of paginated responses from a Amazon Rekognition Video operation.
        @[JSON::Field(key: "VideoMetadata")]
        getter video_metadata : Types::VideoMetadata?

        def initialize(
          @celebrities : Array(Types::CelebrityRecognition)? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil,
          @job_tag : String? = nil,
          @next_token : String? = nil,
          @status_message : String? = nil,
          @video : Types::Video? = nil,
          @video_metadata : Types::VideoMetadata? = nil
        )
        end
      end

      struct GetContentModerationRequest
        include JSON::Serializable

        # The identifier for the inappropriate, unwanted, or offensive content moderation job. Use JobId to
        # identify the job in a subsequent call to GetContentModeration .
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # Defines how to aggregate results of the StartContentModeration request. Default aggregation option
        # is TIMESTAMPS. SEGMENTS mode aggregates moderation labels over time.
        @[JSON::Field(key: "AggregateBy")]
        getter aggregate_by : String?

        # Maximum number of results to return per paginated call. The largest value you can specify is 1000.
        # If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value
        # is 1000.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more data to retrieve), Amazon Rekognition
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of content moderation labels.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Sort to use for elements in the ModerationLabelDetections array. Use TIMESTAMP to sort array
        # elements by the time labels are detected. Use NAME to alphabetically group elements for a label
        # together. Within each label group, the array element are sorted by detection confidence. The default
        # sort is by TIMESTAMP .
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        def initialize(
          @job_id : String,
          @aggregate_by : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil
        )
        end
      end

      # Contains metadata about a content moderation request, including the SortBy and AggregateBy options.
      struct GetContentModerationRequestMetadata
        include JSON::Serializable

        # The aggregation method chosen for a GetContentModeration request.
        @[JSON::Field(key: "AggregateBy")]
        getter aggregate_by : String?

        # The sorting method chosen for a GetContentModeration request.
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        def initialize(
          @aggregate_by : String? = nil,
          @sort_by : String? = nil
        )
        end
      end

      struct GetContentModerationResponse
        include JSON::Serializable

        # Information about the paramters used when getting a response. Includes information on aggregation
        # and sorting methods.
        @[JSON::Field(key: "GetRequestMetadata")]
        getter get_request_metadata : Types::GetContentModerationRequestMetadata?

        # Job identifier for the content moderation operation for which you want to obtain results. The job
        # identifer is returned by an initial call to StartContentModeration.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The current status of the content moderation analysis job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # A job identifier specified in the call to StartContentModeration and returned in the job completion
        # notification sent to your Amazon Simple Notification Service topic.
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        # The detected inappropriate, unwanted, or offensive content moderation labels and the time(s) they
        # were detected.
        @[JSON::Field(key: "ModerationLabels")]
        getter moderation_labels : Array(Types::ContentModerationDetection)?

        # Version number of the moderation detection model that was used to detect inappropriate, unwanted, or
        # offensive content.
        @[JSON::Field(key: "ModerationModelVersion")]
        getter moderation_model_version : String?

        # If the response is truncated, Amazon Rekognition Video returns this token that you can use in the
        # subsequent request to retrieve the next set of content moderation labels.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # If the job fails, StatusMessage provides a descriptive error message.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        @[JSON::Field(key: "Video")]
        getter video : Types::Video?

        # Information about a video that Amazon Rekognition analyzed. Videometadata is returned in every page
        # of paginated responses from GetContentModeration .
        @[JSON::Field(key: "VideoMetadata")]
        getter video_metadata : Types::VideoMetadata?

        def initialize(
          @get_request_metadata : Types::GetContentModerationRequestMetadata? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil,
          @job_tag : String? = nil,
          @moderation_labels : Array(Types::ContentModerationDetection)? = nil,
          @moderation_model_version : String? = nil,
          @next_token : String? = nil,
          @status_message : String? = nil,
          @video : Types::Video? = nil,
          @video_metadata : Types::VideoMetadata? = nil
        )
        end
      end

      struct GetFaceDetectionRequest
        include JSON::Serializable

        # Unique identifier for the face detection job. The JobId is returned from StartFaceDetection .
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # Maximum number of results to return per paginated call. The largest value you can specify is 1000.
        # If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value
        # is 1000.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there are more faces to retrieve), Amazon
        # Rekognition Video returns a pagination token in the response. You can use this pagination token to
        # retrieve the next set of faces.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @job_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetFaceDetectionResponse
        include JSON::Serializable

        # An array of faces detected in the video. Each element contains a detected face's details and the
        # time, in milliseconds from the start of the video, the face was detected.
        @[JSON::Field(key: "Faces")]
        getter faces : Array(Types::FaceDetection)?

        # Job identifier for the face detection operation for which you want to obtain results. The job
        # identifer is returned by an initial call to StartFaceDetection.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The current status of the face detection job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # A job identifier specified in the call to StartFaceDetection and returned in the job completion
        # notification sent to your Amazon Simple Notification Service topic.
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        # If the response is truncated, Amazon Rekognition returns this token that you can use in the
        # subsequent request to retrieve the next set of faces.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # If the job fails, StatusMessage provides a descriptive error message.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        @[JSON::Field(key: "Video")]
        getter video : Types::Video?

        # Information about a video that Amazon Rekognition Video analyzed. Videometadata is returned in every
        # page of paginated responses from a Amazon Rekognition video operation.
        @[JSON::Field(key: "VideoMetadata")]
        getter video_metadata : Types::VideoMetadata?

        def initialize(
          @faces : Array(Types::FaceDetection)? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil,
          @job_tag : String? = nil,
          @next_token : String? = nil,
          @status_message : String? = nil,
          @video : Types::Video? = nil,
          @video_metadata : Types::VideoMetadata? = nil
        )
        end
      end

      struct GetFaceLivenessSessionResultsRequest
        include JSON::Serializable

        # A unique 128-bit UUID. This is used to uniquely identify the session and also acts as an idempotency
        # token for all operations associated with the session.
        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        def initialize(
          @session_id : String
        )
        end
      end

      struct GetFaceLivenessSessionResultsResponse
        include JSON::Serializable

        # The sessionId for which this request was called.
        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        # Represents a status corresponding to the state of the session. Possible statuses are: CREATED,
        # IN_PROGRESS, SUCCEEDED, FAILED, EXPIRED.
        @[JSON::Field(key: "Status")]
        getter status : String

        # A set of images from the Face Liveness video that can be used for audit purposes. It includes a
        # bounding box of the face and the Base64-encoded bytes that return an image. If the
        # CreateFaceLivenessSession request included an OutputConfig argument, the image will be uploaded to
        # an S3Object specified in the output configuration. If no Amazon S3 bucket is defined, raw bytes are
        # sent instead.
        @[JSON::Field(key: "AuditImages")]
        getter audit_images : Array(Types::AuditImage)?

        # Contains information regarding the challenge type used for the Face Liveness check.
        @[JSON::Field(key: "Challenge")]
        getter challenge : Types::Challenge?

        # Probabalistic confidence score for if the person in the given video was live, represented as a float
        # value between 0 to 100.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # A high-quality image from the Face Liveness video that can be used for face comparison or search. It
        # includes a bounding box of the face and the Base64-encoded bytes that return an image. If the
        # CreateFaceLivenessSession request included an OutputConfig argument, the image will be uploaded to
        # an S3Object specified in the output configuration. In case the reference image is not returned, it's
        # recommended to retry the Liveness check.
        @[JSON::Field(key: "ReferenceImage")]
        getter reference_image : Types::AuditImage?

        def initialize(
          @session_id : String,
          @status : String,
          @audit_images : Array(Types::AuditImage)? = nil,
          @challenge : Types::Challenge? = nil,
          @confidence : Float64? = nil,
          @reference_image : Types::AuditImage? = nil
        )
        end
      end

      struct GetFaceSearchRequest
        include JSON::Serializable

        # The job identifer for the search request. You get the job identifier from an initial call to
        # StartFaceSearch .
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # Maximum number of results to return per paginated call. The largest value you can specify is 1000.
        # If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value
        # is 1000.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more search results to retrieve), Amazon
        # Rekognition Video returns a pagination token in the response. You can use this pagination token to
        # retrieve the next set of search results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Sort to use for grouping faces in the response. Use TIMESTAMP to group faces by the time that they
        # are recognized. Use INDEX to sort by recognized faces.
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        def initialize(
          @job_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil
        )
        end
      end

      struct GetFaceSearchResponse
        include JSON::Serializable

        # Job identifier for the face search operation for which you want to obtain results. The job identifer
        # is returned by an initial call to StartFaceSearch.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The current status of the face search job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # A job identifier specified in the call to StartFaceSearch and returned in the job completion
        # notification sent to your Amazon Simple Notification Service topic.
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        # If the response is truncated, Amazon Rekognition Video returns this token that you can use in the
        # subsequent request to retrieve the next set of search results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of persons, PersonMatch , in the video whose face(s) match the face(s) in an Amazon
        # Rekognition collection. It also includes time information for when persons are matched in the video.
        # You specify the input collection in an initial call to StartFaceSearch . Each Persons element
        # includes a time the person was matched, face match details ( FaceMatches ) for matching faces in the
        # collection, and person information ( Person ) for the matched person.
        @[JSON::Field(key: "Persons")]
        getter persons : Array(Types::PersonMatch)?

        # If the job fails, StatusMessage provides a descriptive error message.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        @[JSON::Field(key: "Video")]
        getter video : Types::Video?

        # Information about a video that Amazon Rekognition analyzed. Videometadata is returned in every page
        # of paginated responses from a Amazon Rekognition Video operation.
        @[JSON::Field(key: "VideoMetadata")]
        getter video_metadata : Types::VideoMetadata?

        def initialize(
          @job_id : String? = nil,
          @job_status : String? = nil,
          @job_tag : String? = nil,
          @next_token : String? = nil,
          @persons : Array(Types::PersonMatch)? = nil,
          @status_message : String? = nil,
          @video : Types::Video? = nil,
          @video_metadata : Types::VideoMetadata? = nil
        )
        end
      end

      struct GetLabelDetectionRequest
        include JSON::Serializable

        # Job identifier for the label detection operation for which you want results returned. You get the
        # job identifer from an initial call to StartlabelDetection .
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # Defines how to aggregate the returned results. Results can be aggregated by timestamps or segments.
        @[JSON::Field(key: "AggregateBy")]
        getter aggregate_by : String?

        # Maximum number of results to return per paginated call. The largest value you can specify is 1000.
        # If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value
        # is 1000.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there are more labels to retrieve), Amazon
        # Rekognition Video returns a pagination token in the response. You can use this pagination token to
        # retrieve the next set of labels.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Sort to use for elements in the Labels array. Use TIMESTAMP to sort array elements by the time
        # labels are detected. Use NAME to alphabetically group elements for a label together. Within each
        # label group, the array element are sorted by detection confidence. The default sort is by TIMESTAMP
        # .
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        def initialize(
          @job_id : String,
          @aggregate_by : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil
        )
        end
      end

      # Contains metadata about a label detection request, including the SortBy and AggregateBy options.
      struct GetLabelDetectionRequestMetadata
        include JSON::Serializable

        # The aggregation method chosen for a GetLabelDetection request.
        @[JSON::Field(key: "AggregateBy")]
        getter aggregate_by : String?

        # The sorting method chosen for a GetLabelDetection request.
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        def initialize(
          @aggregate_by : String? = nil,
          @sort_by : String? = nil
        )
        end
      end

      struct GetLabelDetectionResponse
        include JSON::Serializable

        # Information about the paramters used when getting a response. Includes information on aggregation
        # and sorting methods.
        @[JSON::Field(key: "GetRequestMetadata")]
        getter get_request_metadata : Types::GetLabelDetectionRequestMetadata?

        # Job identifier for the label detection operation for which you want to obtain results. The job
        # identifer is returned by an initial call to StartLabelDetection.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The current status of the label detection job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # A job identifier specified in the call to StartLabelDetection and returned in the job completion
        # notification sent to your Amazon Simple Notification Service topic.
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        # Version number of the label detection model that was used to detect labels.
        @[JSON::Field(key: "LabelModelVersion")]
        getter label_model_version : String?

        # An array of labels detected in the video. Each element contains the detected label and the time, in
        # milliseconds from the start of the video, that the label was detected.
        @[JSON::Field(key: "Labels")]
        getter labels : Array(Types::LabelDetection)?

        # If the response is truncated, Amazon Rekognition Video returns this token that you can use in the
        # subsequent request to retrieve the next set of labels.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # If the job fails, StatusMessage provides a descriptive error message.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        @[JSON::Field(key: "Video")]
        getter video : Types::Video?

        # Information about a video that Amazon Rekognition Video analyzed. Videometadata is returned in every
        # page of paginated responses from a Amazon Rekognition video operation.
        @[JSON::Field(key: "VideoMetadata")]
        getter video_metadata : Types::VideoMetadata?

        def initialize(
          @get_request_metadata : Types::GetLabelDetectionRequestMetadata? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil,
          @job_tag : String? = nil,
          @label_model_version : String? = nil,
          @labels : Array(Types::LabelDetection)? = nil,
          @next_token : String? = nil,
          @status_message : String? = nil,
          @video : Types::Video? = nil,
          @video_metadata : Types::VideoMetadata? = nil
        )
        end
      end

      struct GetMediaAnalysisJobRequest
        include JSON::Serializable

        # Unique identifier for the media analysis job for which you want to retrieve results.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct GetMediaAnalysisJobResponse
        include JSON::Serializable

        # The Unix date and time when the job was started.
        @[JSON::Field(key: "CreationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_timestamp : Time

        # Reference to the input manifest that was provided in the job creation request.
        @[JSON::Field(key: "Input")]
        getter input : Types::MediaAnalysisInput

        # The identifier for the media analysis job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # Operation configurations that were provided during job creation.
        @[JSON::Field(key: "OperationsConfig")]
        getter operations_config : Types::MediaAnalysisOperationsConfig

        # Output configuration that was provided in the creation request.
        @[JSON::Field(key: "OutputConfig")]
        getter output_config : Types::MediaAnalysisOutputConfig

        # The current status of the media analysis job.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The Unix date and time when the job finished.
        @[JSON::Field(key: "CompletionTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completion_timestamp : Time?

        # Details about the error that resulted in failure of the job.
        @[JSON::Field(key: "FailureDetails")]
        getter failure_details : Types::MediaAnalysisJobFailureDetails?

        # The name of the media analysis job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # KMS Key that was provided in the creation request.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The summary manifest provides statistics on input manifest and errors identified in the input
        # manifest.
        @[JSON::Field(key: "ManifestSummary")]
        getter manifest_summary : Types::MediaAnalysisManifestSummary?

        # Output manifest that contains prediction results.
        @[JSON::Field(key: "Results")]
        getter results : Types::MediaAnalysisResults?

        def initialize(
          @creation_timestamp : Time,
          @input : Types::MediaAnalysisInput,
          @job_id : String,
          @operations_config : Types::MediaAnalysisOperationsConfig,
          @output_config : Types::MediaAnalysisOutputConfig,
          @status : String,
          @completion_timestamp : Time? = nil,
          @failure_details : Types::MediaAnalysisJobFailureDetails? = nil,
          @job_name : String? = nil,
          @kms_key_id : String? = nil,
          @manifest_summary : Types::MediaAnalysisManifestSummary? = nil,
          @results : Types::MediaAnalysisResults? = nil
        )
        end
      end

      struct GetPersonTrackingRequest
        include JSON::Serializable

        # The identifier for a job that tracks persons in a video. You get the JobId from a call to
        # StartPersonTracking .
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # Maximum number of results to return per paginated call. The largest value you can specify is 1000.
        # If you specify a value greater than 1000, a maximum of 1000 results is returned. The default value
        # is 1000.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there are more persons to retrieve), Amazon
        # Rekognition Video returns a pagination token in the response. You can use this pagination token to
        # retrieve the next set of persons.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Sort to use for elements in the Persons array. Use TIMESTAMP to sort array elements by the time
        # persons are detected. Use INDEX to sort by the tracked persons. If you sort by INDEX , the array
        # elements for each person are sorted by detection confidence. The default sort is by TIMESTAMP .
        @[JSON::Field(key: "SortBy")]
        getter sort_by : String?

        def initialize(
          @job_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_by : String? = nil
        )
        end
      end

      struct GetPersonTrackingResponse
        include JSON::Serializable

        # Job identifier for the person tracking operation for which you want to obtain results. The job
        # identifer is returned by an initial call to StartPersonTracking.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The current status of the person tracking job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # A job identifier specified in the call to StartCelebrityRecognition and returned in the job
        # completion notification sent to your Amazon Simple Notification Service topic.
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        # If the response is truncated, Amazon Rekognition Video returns this token that you can use in the
        # subsequent request to retrieve the next set of persons.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of the persons detected in the video and the time(s) their path was tracked throughout the
        # video. An array element will exist for each time a person's path is tracked.
        @[JSON::Field(key: "Persons")]
        getter persons : Array(Types::PersonDetection)?

        # If the job fails, StatusMessage provides a descriptive error message.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        @[JSON::Field(key: "Video")]
        getter video : Types::Video?

        # Information about a video that Amazon Rekognition Video analyzed. Videometadata is returned in every
        # page of paginated responses from a Amazon Rekognition Video operation.
        @[JSON::Field(key: "VideoMetadata")]
        getter video_metadata : Types::VideoMetadata?

        def initialize(
          @job_id : String? = nil,
          @job_status : String? = nil,
          @job_tag : String? = nil,
          @next_token : String? = nil,
          @persons : Array(Types::PersonDetection)? = nil,
          @status_message : String? = nil,
          @video : Types::Video? = nil,
          @video_metadata : Types::VideoMetadata? = nil
        )
        end
      end

      struct GetSegmentDetectionRequest
        include JSON::Serializable

        # Job identifier for the text detection operation for which you want results returned. You get the job
        # identifer from an initial call to StartSegmentDetection .
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # Maximum number of results to return per paginated call. The largest value you can specify is 1000.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the response is truncated, Amazon Rekognition Video returns this token that you can use in the
        # subsequent request to retrieve the next set of text.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @job_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetSegmentDetectionResponse
        include JSON::Serializable

        # An array of objects. There can be multiple audio streams. Each AudioMetadata object contains
        # metadata for a single audio stream. Audio information in an AudioMetadata objects includes the audio
        # codec, the number of audio channels, the duration of the audio stream, and the sample rate. Audio
        # metadata is returned in each page of information returned by GetSegmentDetection .
        @[JSON::Field(key: "AudioMetadata")]
        getter audio_metadata : Array(Types::AudioMetadata)?

        # Job identifier for the segment detection operation for which you want to obtain results. The job
        # identifer is returned by an initial call to StartSegmentDetection.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # Current status of the segment detection job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # A job identifier specified in the call to StartSegmentDetection and returned in the job completion
        # notification sent to your Amazon Simple Notification Service topic.
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        # If the previous response was incomplete (because there are more labels to retrieve), Amazon
        # Rekognition Video returns a pagination token in the response. You can use this pagination token to
        # retrieve the next set of text.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of segments detected in a video. The array is sorted by the segment types (TECHNICAL_CUE or
        # SHOT) specified in the SegmentTypes input parameter of StartSegmentDetection . Within each segment
        # type the array is sorted by timestamp values.
        @[JSON::Field(key: "Segments")]
        getter segments : Array(Types::SegmentDetection)?

        # An array containing the segment types requested in the call to StartSegmentDetection .
        @[JSON::Field(key: "SelectedSegmentTypes")]
        getter selected_segment_types : Array(Types::SegmentTypeInfo)?

        # If the job fails, StatusMessage provides a descriptive error message.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        @[JSON::Field(key: "Video")]
        getter video : Types::Video?

        # Currently, Amazon Rekognition Video returns a single object in the VideoMetadata array. The object
        # contains information about the video stream in the input file that Amazon Rekognition Video chose to
        # analyze. The VideoMetadata object includes the video codec, video format and other information.
        # Video metadata is returned in each page of information returned by GetSegmentDetection .
        @[JSON::Field(key: "VideoMetadata")]
        getter video_metadata : Array(Types::VideoMetadata)?

        def initialize(
          @audio_metadata : Array(Types::AudioMetadata)? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil,
          @job_tag : String? = nil,
          @next_token : String? = nil,
          @segments : Array(Types::SegmentDetection)? = nil,
          @selected_segment_types : Array(Types::SegmentTypeInfo)? = nil,
          @status_message : String? = nil,
          @video : Types::Video? = nil,
          @video_metadata : Array(Types::VideoMetadata)? = nil
        )
        end
      end

      struct GetTextDetectionRequest
        include JSON::Serializable

        # Job identifier for the text detection operation for which you want results returned. You get the job
        # identifer from an initial call to StartTextDetection .
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # Maximum number of results to return per paginated call. The largest value you can specify is 1000.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there are more labels to retrieve), Amazon
        # Rekognition Video returns a pagination token in the response. You can use this pagination token to
        # retrieve the next set of text.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @job_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetTextDetectionResponse
        include JSON::Serializable

        # Job identifier for the text detection operation for which you want to obtain results. The job
        # identifer is returned by an initial call to StartTextDetection.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # Current status of the text detection job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # A job identifier specified in the call to StartTextDetection and returned in the job completion
        # notification sent to your Amazon Simple Notification Service topic.
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        # If the response is truncated, Amazon Rekognition Video returns this token that you can use in the
        # subsequent request to retrieve the next set of text.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # If the job fails, StatusMessage provides a descriptive error message.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # An array of text detected in the video. Each element contains the detected text, the time in
        # milliseconds from the start of the video that the text was detected, and where it was detected on
        # the screen.
        @[JSON::Field(key: "TextDetections")]
        getter text_detections : Array(Types::TextDetectionResult)?

        # Version number of the text detection model that was used to detect text.
        @[JSON::Field(key: "TextModelVersion")]
        getter text_model_version : String?

        @[JSON::Field(key: "Video")]
        getter video : Types::Video?

        @[JSON::Field(key: "VideoMetadata")]
        getter video_metadata : Types::VideoMetadata?

        def initialize(
          @job_id : String? = nil,
          @job_status : String? = nil,
          @job_tag : String? = nil,
          @next_token : String? = nil,
          @status_message : String? = nil,
          @text_detections : Array(Types::TextDetectionResult)? = nil,
          @text_model_version : String? = nil,
          @video : Types::Video? = nil,
          @video_metadata : Types::VideoMetadata? = nil
        )
        end
      end

      # The S3 bucket that contains an Amazon Sagemaker Ground Truth format manifest file.
      struct GroundTruthManifest
        include JSON::Serializable

        @[JSON::Field(key: "S3Object")]
        getter s3_object : Types::S3Object?

        def initialize(
          @s3_object : Types::S3Object? = nil
        )
        end
      end

      # Shows the results of the human in the loop evaluation. If there is no HumanLoopArn, the input did
      # not trigger human review.
      struct HumanLoopActivationOutput
        include JSON::Serializable

        # Shows the result of condition evaluations, including those conditions which activated a human
        # review.
        @[JSON::Field(key: "HumanLoopActivationConditionsEvaluationResults")]
        getter human_loop_activation_conditions_evaluation_results : String?

        # Shows if and why human review was needed.
        @[JSON::Field(key: "HumanLoopActivationReasons")]
        getter human_loop_activation_reasons : Array(String)?

        # The Amazon Resource Name (ARN) of the HumanLoop created.
        @[JSON::Field(key: "HumanLoopArn")]
        getter human_loop_arn : String?

        def initialize(
          @human_loop_activation_conditions_evaluation_results : String? = nil,
          @human_loop_activation_reasons : Array(String)? = nil,
          @human_loop_arn : String? = nil
        )
        end
      end

      # Sets up the flow definition the image will be sent to if one of the conditions is met. You can also
      # set certain attributes of the image before review.
      struct HumanLoopConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow definition. You can create a flow definition by using the
        # Amazon Sagemaker CreateFlowDefinition Operation.
        @[JSON::Field(key: "FlowDefinitionArn")]
        getter flow_definition_arn : String

        # The name of the human review used for this image. This should be kept unique within a region.
        @[JSON::Field(key: "HumanLoopName")]
        getter human_loop_name : String

        # Sets attributes of the input data.
        @[JSON::Field(key: "DataAttributes")]
        getter data_attributes : Types::HumanLoopDataAttributes?

        def initialize(
          @flow_definition_arn : String,
          @human_loop_name : String,
          @data_attributes : Types::HumanLoopDataAttributes? = nil
        )
        end
      end

      # Allows you to set attributes of the image. Currently, you can declare an image as free of personally
      # identifiable information.
      struct HumanLoopDataAttributes
        include JSON::Serializable

        # Sets whether the input image is free of personally identifiable information.
        @[JSON::Field(key: "ContentClassifiers")]
        getter content_classifiers : Array(String)?

        def initialize(
          @content_classifiers : Array(String)? = nil
        )
        end
      end

      # The number of in-progress human reviews you have has exceeded the number allowed.
      struct HumanLoopQuotaExceededException
        include JSON::Serializable

        # The quota code.
        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String?

        # The resource type.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # The service code.
        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        def initialize(
          @quota_code : String? = nil,
          @resource_type : String? = nil,
          @service_code : String? = nil
        )
        end
      end

      # A ClientRequestToken input parameter was reused with an operation, but at least one of the other
      # input parameters is different from the previous call to the operation.
      struct IdempotentParameterMismatchException
        include JSON::Serializable

        def initialize
        end
      end

      # Provides the input image either as bytes or an S3 object. You pass image bytes to an Amazon
      # Rekognition API operation by using the Bytes property. For example, you would use the Bytes property
      # to pass an image loaded from a local file system. Image bytes passed by using the Bytes property
      # must be base64-encoded. Your code may not need to encode image bytes if you are using an AWS SDK to
      # call Amazon Rekognition API operations. For more information, see Analyzing an Image Loaded from a
      # Local File System in the Amazon Rekognition Developer Guide. You pass images stored in an S3 bucket
      # to an Amazon Rekognition API operation by using the S3Object property. Images stored in an S3 bucket
      # do not need to be base64-encoded. The region for the S3 bucket containing the S3 object must match
      # the region you use for Amazon Rekognition operations. If you use the AWS CLI to call Amazon
      # Rekognition operations, passing image bytes using the Bytes property is not supported. You must
      # first upload the image to an Amazon S3 bucket and then call the operation using the S3Object
      # property. For Amazon Rekognition to process an S3 object, the user must have permission to access
      # the S3 object. For more information, see How Amazon Rekognition works with IAM in the Amazon
      # Rekognition Developer Guide.
      struct Image
        include JSON::Serializable

        # Blob of image bytes up to 5 MBs. Note that the maximum image size you can pass to DetectCustomLabels
        # is 4MB.
        @[JSON::Field(key: "Bytes")]
        getter bytes : Bytes?

        # Identifies an S3 object as the image source.
        @[JSON::Field(key: "S3Object")]
        getter s3_object : Types::S3Object?

        def initialize(
          @bytes : Bytes? = nil,
          @s3_object : Types::S3Object? = nil
        )
        end
      end

      # Identifies face image brightness and sharpness.
      struct ImageQuality
        include JSON::Serializable

        # Value representing brightness of the face. The service returns a value between 0 and 100
        # (inclusive). A higher value indicates a brighter face image.
        @[JSON::Field(key: "Brightness")]
        getter brightness : Float64?

        # Value representing sharpness of the face. The service returns a value between 0 and 100 (inclusive).
        # A higher value indicates a sharper face image.
        @[JSON::Field(key: "Sharpness")]
        getter sharpness : Float64?

        def initialize(
          @brightness : Float64? = nil,
          @sharpness : Float64? = nil
        )
        end
      end

      # The input image size exceeds the allowed limit. If you are calling DetectProtectiveEquipment, the
      # image size or resolution exceeds the allowed limit. For more information, see Guidelines and quotas
      # in Amazon Rekognition in the Amazon Rekognition Developer Guide.
      struct ImageTooLargeException
        include JSON::Serializable

        def initialize
        end
      end

      struct IndexFacesRequest
        include JSON::Serializable

        # The ID of an existing collection to which you want to add the faces that are detected in the input
        # images.
        @[JSON::Field(key: "CollectionId")]
        getter collection_id : String

        # The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon
        # Rekognition operations, passing base64-encoded image bytes isn't supported. If you are using an AWS
        # SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the
        # Bytes field. For more information, see Images in the Amazon Rekognition developer guide.
        @[JSON::Field(key: "Image")]
        getter image : Types::Image

        # An array of facial attributes you want to be returned. A DEFAULT subset of facial attributes -
        # BoundingBox , Confidence , Pose , Quality , and Landmarks - will always be returned. You can request
        # for specific facial attributes (in addition to the default list) - by using ["DEFAULT",
        # "FACE_OCCLUDED"] or just ["FACE_OCCLUDED"] . You can request for all facial attributes by using
        # ["ALL"] . Requesting more attributes may increase response time. If you provide both, ["ALL",
        # "DEFAULT"] , the service uses a logical AND operator to determine which attributes to return (in
        # this case, all attributes).
        @[JSON::Field(key: "DetectionAttributes")]
        getter detection_attributes : Array(String)?

        # The ID you want to assign to all the faces detected in the image.
        @[JSON::Field(key: "ExternalImageId")]
        getter external_image_id : String?

        # The maximum number of faces to index. The value of MaxFaces must be greater than or equal to 1.
        # IndexFaces returns no more than 100 detected faces in an image, even if you specify a larger value
        # for MaxFaces . If IndexFaces detects more faces than the value of MaxFaces , the faces with the
        # lowest quality are filtered out first. If there are still more faces than the value of MaxFaces ,
        # the faces with the smallest bounding boxes are filtered out (up to the number that's needed to
        # satisfy the value of MaxFaces ). Information about the unindexed faces is available in the
        # UnindexedFaces array. The faces that are returned by IndexFaces are sorted by the largest face
        # bounding box size to the smallest size, in descending order. MaxFaces can be used with a collection
        # associated with any version of the face model.
        @[JSON::Field(key: "MaxFaces")]
        getter max_faces : Int32?

        # A filter that specifies a quality bar for how much filtering is done to identify faces. Filtered
        # faces aren't indexed. If you specify AUTO , Amazon Rekognition chooses the quality bar. If you
        # specify LOW , MEDIUM , or HIGH , filtering removes all faces that don’t meet the chosen quality bar.
        # The default value is AUTO . The quality bar is based on a variety of common use cases. Low-quality
        # detections can occur for a number of reasons. Some examples are an object that's misidentified as a
        # face, a face that's too blurry, or a face with a pose that's too extreme to use. If you specify NONE
        # , no filtering is performed. To use quality filtering, the collection you are using must be
        # associated with version 3 of the face model or higher.
        @[JSON::Field(key: "QualityFilter")]
        getter quality_filter : String?

        def initialize(
          @collection_id : String,
          @image : Types::Image,
          @detection_attributes : Array(String)? = nil,
          @external_image_id : String? = nil,
          @max_faces : Int32? = nil,
          @quality_filter : String? = nil
        )
        end
      end

      struct IndexFacesResponse
        include JSON::Serializable

        # The version number of the face detection model that's associated with the input collection (
        # CollectionId ).
        @[JSON::Field(key: "FaceModelVersion")]
        getter face_model_version : String?

        # An array of faces detected and added to the collection. For more information, see Searching Faces in
        # a Collection in the Amazon Rekognition Developer Guide.
        @[JSON::Field(key: "FaceRecords")]
        getter face_records : Array(Types::FaceRecord)?

        # If your collection is associated with a face detection model that's later than version 3.0, the
        # value of OrientationCorrection is always null and no orientation information is returned. If your
        # collection is associated with a face detection model that's version 3.0 or earlier, the following
        # applies: If the input image is in .jpeg format, it might contain exchangeable image file format
        # (Exif) metadata that includes the image's orientation. Amazon Rekognition uses this orientation
        # information to perform image correction - the bounding box coordinates are translated to represent
        # object locations after the orientation information in the Exif metadata is used to correct the image
        # orientation. Images in .png format don't contain Exif metadata. The value of OrientationCorrection
        # is null. If the image doesn't contain orientation information in its Exif metadata, Amazon
        # Rekognition returns an estimated orientation (ROTATE_0, ROTATE_90, ROTATE_180, ROTATE_270). Amazon
        # Rekognition doesn’t perform image correction for images. The bounding box coordinates aren't
        # translated and represent the object locations before the image is rotated. Bounding box information
        # is returned in the FaceRecords array. You can get the version of the face detection model by calling
        # DescribeCollection .
        @[JSON::Field(key: "OrientationCorrection")]
        getter orientation_correction : String?

        # An array of faces that were detected in the image but weren't indexed. They weren't indexed because
        # the quality filter identified them as low quality, or the MaxFaces request parameter filtered them
        # out. To use the quality filter, you specify the QualityFilter request parameter.
        @[JSON::Field(key: "UnindexedFaces")]
        getter unindexed_faces : Array(Types::UnindexedFace)?

        def initialize(
          @face_model_version : String? = nil,
          @face_records : Array(Types::FaceRecord)? = nil,
          @orientation_correction : String? = nil,
          @unindexed_faces : Array(Types::UnindexedFace)? = nil
        )
        end
      end

      # An instance of a label returned by Amazon Rekognition Image ( DetectLabels ) or by Amazon
      # Rekognition Video ( GetLabelDetection ).
      struct Instance
        include JSON::Serializable

        # The position of the label instance on the image.
        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Types::BoundingBox?

        # The confidence that Amazon Rekognition has in the accuracy of the bounding box.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The dominant colors found in an individual instance of a label.
        @[JSON::Field(key: "DominantColors")]
        getter dominant_colors : Array(Types::DominantColor)?

        def initialize(
          @bounding_box : Types::BoundingBox? = nil,
          @confidence : Float64? = nil,
          @dominant_colors : Array(Types::DominantColor)? = nil
        )
        end
      end

      # Amazon Rekognition experienced a service issue. Try your call again.
      struct InternalServerError
        include JSON::Serializable

        def initialize
        end
      end

      # The provided image format is not supported.
      struct InvalidImageFormatException
        include JSON::Serializable

        def initialize
        end
      end

      # Indicates that a provided manifest file is empty or larger than the allowed limit.
      struct InvalidManifestException
        include JSON::Serializable

        def initialize
        end
      end

      # Pagination token in the request is not valid.
      struct InvalidPaginationTokenException
        include JSON::Serializable

        def initialize
        end
      end

      # Input parameter violated a constraint. Validate your parameter before calling the API operation
      # again.
      struct InvalidParameterException
        include JSON::Serializable

        def initialize
        end
      end

      # The supplied revision id for the project policy is invalid.
      struct InvalidPolicyRevisionIdException
        include JSON::Serializable

        def initialize
        end
      end

      # Amazon Rekognition is unable to access the S3 object specified in the request.
      struct InvalidS3ObjectException
        include JSON::Serializable

        def initialize
        end
      end

      # The Kinesis data stream Amazon Rekognition to which the analysis results of a Amazon Rekognition
      # stream processor are streamed. For more information, see CreateStreamProcessor in the Amazon
      # Rekognition Developer Guide.
      struct KinesisDataStream
        include JSON::Serializable

        # ARN of the output Amazon Kinesis Data Streams stream.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # Kinesis video stream stream that provides the source streaming video for a Amazon Rekognition Video
      # stream processor. For more information, see CreateStreamProcessor in the Amazon Rekognition
      # Developer Guide.
      struct KinesisVideoStream
        include JSON::Serializable

        # ARN of the Kinesis video stream stream that streams the source video.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # Specifies the starting point in a Kinesis stream to start processing. You can use the producer
      # timestamp or the fragment number. One of either producer timestamp or fragment number is required.
      # If you use the producer timestamp, you must put the time in milliseconds. For more information about
      # fragment numbers, see Fragment .
      struct KinesisVideoStreamStartSelector
        include JSON::Serializable

        # The unique identifier of the fragment. This value monotonically increases based on the ingestion
        # order.
        @[JSON::Field(key: "FragmentNumber")]
        getter fragment_number : String?

        # The timestamp from the producer corresponding to the fragment, in milliseconds, expressed in unix
        # time format.
        @[JSON::Field(key: "ProducerTimestamp")]
        getter producer_timestamp : Int64?

        def initialize(
          @fragment_number : String? = nil,
          @producer_timestamp : Int64? = nil
        )
        end
      end

      # The known gender identity for the celebrity that matches the provided ID. The known gender identity
      # can be Male, Female, Nonbinary, or Unlisted.
      struct KnownGender
        include JSON::Serializable

        # A string value of the KnownGender info about the Celebrity.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @type : String? = nil
        )
        end
      end

      # Structure containing details about the detected label, including the name, detected instances,
      # parent labels, and level of confidence.
      struct Label
        include JSON::Serializable

        # A list of potential aliases for a given label.
        @[JSON::Field(key: "Aliases")]
        getter aliases : Array(Types::LabelAlias)?

        # A list of the categories associated with a given label.
        @[JSON::Field(key: "Categories")]
        getter categories : Array(Types::LabelCategory)?

        # Level of confidence.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # If Label represents an object, Instances contains the bounding boxes for each instance of the
        # detected object. Bounding boxes are returned for common object labels such as people, cars,
        # furniture, apparel or pets.
        @[JSON::Field(key: "Instances")]
        getter instances : Array(Types::Instance)?

        # The name (label) of the object or scene.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The parent labels for a label. The response includes all ancestor labels.
        @[JSON::Field(key: "Parents")]
        getter parents : Array(Types::Parent)?

        def initialize(
          @aliases : Array(Types::LabelAlias)? = nil,
          @categories : Array(Types::LabelCategory)? = nil,
          @confidence : Float64? = nil,
          @instances : Array(Types::Instance)? = nil,
          @name : String? = nil,
          @parents : Array(Types::Parent)? = nil
        )
        end
      end

      # A potential alias of for a given label.
      struct LabelAlias
        include JSON::Serializable

        # The name of an alias for a given label.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # The category that applies to a given label.
      struct LabelCategory
        include JSON::Serializable

        # The name of a category that applies to a given label.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Information about a label detected in a video analysis request and the time the label was detected
      # in the video.
      struct LabelDetection
        include JSON::Serializable

        # The time duration of a segment in milliseconds, I.e. time elapsed from StartTimestampMillis to
        # EndTimestampMillis.
        @[JSON::Field(key: "DurationMillis")]
        getter duration_millis : Int64?

        # The time in milliseconds defining the end of the timeline segment containing a continuously detected
        # label.
        @[JSON::Field(key: "EndTimestampMillis")]
        getter end_timestamp_millis : Int64?

        # Details about the detected label.
        @[JSON::Field(key: "Label")]
        getter label : Types::Label?

        # The time in milliseconds defining the start of the timeline segment containing a continuously
        # detected label.
        @[JSON::Field(key: "StartTimestampMillis")]
        getter start_timestamp_millis : Int64?

        # Time, in milliseconds from the start of the video, that the label was detected. Note that Timestamp
        # is not guaranteed to be accurate to the individual frame where the label first appears.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Int64?

        def initialize(
          @duration_millis : Int64? = nil,
          @end_timestamp_millis : Int64? = nil,
          @label : Types::Label? = nil,
          @start_timestamp_millis : Int64? = nil,
          @timestamp : Int64? = nil
        )
        end
      end

      # Contains the specified filters that should be applied to a list of returned GENERAL_LABELS.
      struct LabelDetectionSettings
        include JSON::Serializable

        @[JSON::Field(key: "GeneralLabels")]
        getter general_labels : Types::GeneralLabelsSettings?

        def initialize(
          @general_labels : Types::GeneralLabelsSettings? = nil
        )
        end
      end

      # Indicates the location of the landmark on the face.
      struct Landmark
        include JSON::Serializable

        # Type of landmark.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # The x-coordinate of the landmark expressed as a ratio of the width of the image. The x-coordinate is
        # measured from the left-side of the image. For example, if the image is 700 pixels wide and the
        # x-coordinate of the landmark is at 350 pixels, this value is 0.5.
        @[JSON::Field(key: "X")]
        getter x : Float64?

        # The y-coordinate of the landmark expressed as a ratio of the height of the image. The y-coordinate
        # is measured from the top of the image. For example, if the image height is 200 pixels and the
        # y-coordinate of the landmark is at 50 pixels, this value is 0.25.
        @[JSON::Field(key: "Y")]
        getter y : Float64?

        def initialize(
          @type : String? = nil,
          @x : Float64? = nil,
          @y : Float64? = nil
        )
        end
      end

      # An Amazon Rekognition service limit was exceeded. For example, if you start too many jobs
      # concurrently, subsequent calls to start operations (ex: StartLabelDetection ) will raise a
      # LimitExceededException exception (HTTP status code: 400) until the number of concurrently running
      # jobs is below the Amazon Rekognition service limit.
      struct LimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      struct ListCollectionsRequest
        include JSON::Serializable

        # Maximum number of collection IDs to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagination token from the previous response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCollectionsResponse
        include JSON::Serializable

        # An array of collection IDs.
        @[JSON::Field(key: "CollectionIds")]
        getter collection_ids : Array(String)?

        # Version numbers of the face detection models associated with the collections in the array
        # CollectionIds . For example, the value of FaceModelVersions[2] is the version number for the face
        # detection model used by the collection in CollectionId[2] .
        @[JSON::Field(key: "FaceModelVersions")]
        getter face_model_versions : Array(String)?

        # If the result is truncated, the response provides a NextToken that you can use in the subsequent
        # request to fetch the next set of collection IDs.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @collection_ids : Array(String)? = nil,
          @face_model_versions : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDatasetEntriesRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the dataset that you want to use.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String

        # Specifies a label filter for the response. The response includes an entry only if one or more of the
        # labels in ContainsLabels exist in the entry.
        @[JSON::Field(key: "ContainsLabels")]
        getter contains_labels : Array(String)?

        # Specifies an error filter for the response. Specify True to only include entries that have errors.
        @[JSON::Field(key: "HasErrors")]
        getter has_errors : Bool?

        # Specify true to get only the JSON Lines where the image is labeled. Specify false to get only the
        # JSON Lines where the image isn't labeled. If you don't specify Labeled , ListDatasetEntries returns
        # JSON Lines for labeled and unlabeled images.
        @[JSON::Field(key: "Labeled")]
        getter labeled : Bool?

        # The maximum number of results to return per paginated call. The largest value you can specify is
        # 100. If you specify a value greater than 100, a ValidationException error occurs. The default value
        # is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more results to retrieve), Amazon
        # Rekognition Custom Labels returns a pagination token in the response. You can use this pagination
        # token to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # If specified, ListDatasetEntries only returns JSON Lines where the value of SourceRefContains is
        # part of the source-ref field. The source-ref field contains the Amazon S3 location of the image. You
        # can use SouceRefContains for tasks such as getting the JSON Line for a single image, or gettting
        # JSON Lines for all images within a specific folder.
        @[JSON::Field(key: "SourceRefContains")]
        getter source_ref_contains : String?

        def initialize(
          @dataset_arn : String,
          @contains_labels : Array(String)? = nil,
          @has_errors : Bool? = nil,
          @labeled : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @source_ref_contains : String? = nil
        )
        end
      end

      struct ListDatasetEntriesResponse
        include JSON::Serializable

        # A list of entries (images) in the dataset.
        @[JSON::Field(key: "DatasetEntries")]
        getter dataset_entries : Array(String)?

        # If the previous response was incomplete (because there is more results to retrieve), Amazon
        # Rekognition Custom Labels returns a pagination token in the response. You can use this pagination
        # token to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @dataset_entries : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDatasetLabelsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dataset that you want to use.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String

        # The maximum number of results to return per paginated call. The largest value you can specify is
        # 100. If you specify a value greater than 100, a ValidationException error occurs. The default value
        # is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more results to retrieve), Amazon
        # Rekognition Custom Labels returns a pagination token in the response. You can use this pagination
        # token to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @dataset_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDatasetLabelsResponse
        include JSON::Serializable

        # A list of the labels in the dataset.
        @[JSON::Field(key: "DatasetLabelDescriptions")]
        getter dataset_label_descriptions : Array(Types::DatasetLabelDescription)?

        # If the previous response was incomplete (because there is more results to retrieve), Amazon
        # Rekognition Custom Labels returns a pagination token in the response. You can use this pagination
        # token to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @dataset_label_descriptions : Array(Types::DatasetLabelDescription)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFacesRequest
        include JSON::Serializable

        # ID of the collection from which to list the faces.
        @[JSON::Field(key: "CollectionId")]
        getter collection_id : String

        # An array of face IDs to filter results with when listing faces in a collection.
        @[JSON::Field(key: "FaceIds")]
        getter face_ids : Array(String)?

        # Maximum number of faces to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more data to retrieve), Amazon Rekognition
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of faces.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of user IDs to filter results with when listing faces in a collection.
        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @collection_id : String,
          @face_ids : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      struct ListFacesResponse
        include JSON::Serializable

        # Version number of the face detection model associated with the input collection ( CollectionId ).
        @[JSON::Field(key: "FaceModelVersion")]
        getter face_model_version : String?

        # An array of Face objects.
        @[JSON::Field(key: "Faces")]
        getter faces : Array(Types::Face)?

        # If the response is truncated, Amazon Rekognition returns this token that you can use in the
        # subsequent request to retrieve the next set of faces.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @face_model_version : String? = nil,
          @faces : Array(Types::Face)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMediaAnalysisJobsRequest
        include JSON::Serializable

        # The maximum number of results to return per paginated call. The largest value user can specify is
        # 100. If user specifies a value greater than 100, an InvalidParameterException error occurs. The
        # default value is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagination token, if the previous response was incomplete.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMediaAnalysisJobsResponse
        include JSON::Serializable

        # Contains a list of all media analysis jobs.
        @[JSON::Field(key: "MediaAnalysisJobs")]
        getter media_analysis_jobs : Array(Types::MediaAnalysisJobDescription)

        # Pagination token, if the previous response was incomplete.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @media_analysis_jobs : Array(Types::MediaAnalysisJobDescription),
          @next_token : String? = nil
        )
        end
      end

      struct ListProjectPoliciesRequest
        include JSON::Serializable

        # The ARN of the project for which you want to list the project policies.
        @[JSON::Field(key: "ProjectArn")]
        getter project_arn : String

        # The maximum number of results to return per paginated call. The largest value you can specify is 5.
        # If you specify a value greater than 5, a ValidationException error occurs. The default value is 5.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more results to retrieve), Amazon
        # Rekognition Custom Labels returns a pagination token in the response. You can use this pagination
        # token to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @project_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProjectPoliciesResponse
        include JSON::Serializable

        # If the response is truncated, Amazon Rekognition returns this token that you can use in the
        # subsequent request to retrieve the next set of project policies.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of project policies attached to the project.
        @[JSON::Field(key: "ProjectPolicies")]
        getter project_policies : Array(Types::ProjectPolicy)?

        def initialize(
          @next_token : String? = nil,
          @project_policies : Array(Types::ProjectPolicy)? = nil
        )
        end
      end

      struct ListStreamProcessorsRequest
        include JSON::Serializable

        # Maximum number of stream processors you want Amazon Rekognition Video to return in the response. The
        # default is 1000.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there are more stream processors to retrieve),
        # Amazon Rekognition Video returns a pagination token in the response. You can use this pagination
        # token to retrieve the next set of stream processors.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListStreamProcessorsResponse
        include JSON::Serializable

        # If the response is truncated, Amazon Rekognition Video returns this token that you can use in the
        # subsequent request to retrieve the next set of stream processors.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of stream processors that you have created.
        @[JSON::Field(key: "StreamProcessors")]
        getter stream_processors : Array(Types::StreamProcessor)?

        def initialize(
          @next_token : String? = nil,
          @stream_processors : Array(Types::StreamProcessor)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the model, collection, or stream processor that contains the tags that
        # you want a list of.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of key-value tags assigned to the resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ListUsersRequest
        include JSON::Serializable

        # The ID of an existing collection.
        @[JSON::Field(key: "CollectionId")]
        getter collection_id : String

        # Maximum number of UsersID to return.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Pagingation token to receive the next set of UsersID.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @collection_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListUsersResponse
        include JSON::Serializable

        # A pagination token to be used with the subsequent request if the response is truncated.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # List of UsersID associated with the specified collection.
        @[JSON::Field(key: "Users")]
        getter users : Array(Types::User)?

        def initialize(
          @next_token : String? = nil,
          @users : Array(Types::User)? = nil
        )
        end
      end

      # Contains settings that specify the location of an Amazon S3 bucket used to store the output of a
      # Face Liveness session. Note that the S3 bucket must be located in the caller's AWS account and in
      # the same region as the Face Liveness end-point. Additionally, the Amazon S3 object keys are
      # auto-generated by the Face Liveness system.
      struct LivenessOutputConfig
        include JSON::Serializable

        # The path to an AWS Amazon S3 bucket used to store Face Liveness session results.
        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String

        # The prefix prepended to the output files for the Face Liveness session results.
        @[JSON::Field(key: "S3KeyPrefix")]
        getter s3_key_prefix : String?

        def initialize(
          @s3_bucket : String,
          @s3_key_prefix : String? = nil
        )
        end
      end

      # The format of the project policy document that you supplied to PutProjectPolicy is incorrect.
      struct MalformedPolicyDocumentException
        include JSON::Serializable

        def initialize
        end
      end

      # Contains metadata for a UserID matched with a given face.
      struct MatchedUser
        include JSON::Serializable

        # A provided ID for the UserID. Unique within the collection.
        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        # The status of the user matched to a provided FaceID.
        @[JSON::Field(key: "UserStatus")]
        getter user_status : String?

        def initialize(
          @user_id : String? = nil,
          @user_status : String? = nil
        )
        end
      end

      # Configuration for Moderation Labels Detection.
      struct MediaAnalysisDetectModerationLabelsConfig
        include JSON::Serializable

        # Specifies the minimum confidence level for the moderation labels to return. Amazon Rekognition
        # doesn't return any labels with a confidence level lower than this specified value.
        @[JSON::Field(key: "MinConfidence")]
        getter min_confidence : Float64?

        # Specifies the custom moderation model to be used during the label detection job. If not provided the
        # pre-trained model is used.
        @[JSON::Field(key: "ProjectVersion")]
        getter project_version : String?

        def initialize(
          @min_confidence : Float64? = nil,
          @project_version : String? = nil
        )
        end
      end

      # Contains input information for a media analysis job.
      struct MediaAnalysisInput
        include JSON::Serializable

        @[JSON::Field(key: "S3Object")]
        getter s3_object : Types::S3Object

        def initialize(
          @s3_object : Types::S3Object
        )
        end
      end

      # Description for a media analysis job.
      struct MediaAnalysisJobDescription
        include JSON::Serializable

        # The Unix date and time when the job was started.
        @[JSON::Field(key: "CreationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_timestamp : Time

        # Reference to the input manifest that was provided in the job creation request.
        @[JSON::Field(key: "Input")]
        getter input : Types::MediaAnalysisInput

        # The identifier for a media analysis job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # Operation configurations that were provided during job creation.
        @[JSON::Field(key: "OperationsConfig")]
        getter operations_config : Types::MediaAnalysisOperationsConfig

        # Output configuration that was provided in the creation request.
        @[JSON::Field(key: "OutputConfig")]
        getter output_config : Types::MediaAnalysisOutputConfig

        # The status of the media analysis job being retrieved.
        @[JSON::Field(key: "Status")]
        getter status : String

        # The Unix date and time when the job finished.
        @[JSON::Field(key: "CompletionTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completion_timestamp : Time?

        # Details about the error that resulted in failure of the job.
        @[JSON::Field(key: "FailureDetails")]
        getter failure_details : Types::MediaAnalysisJobFailureDetails?

        # The name of a media analysis job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # KMS Key that was provided in the creation request.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # Provides statistics on input manifest and errors identified in the input manifest.
        @[JSON::Field(key: "ManifestSummary")]
        getter manifest_summary : Types::MediaAnalysisManifestSummary?

        # Output manifest that contains prediction results.
        @[JSON::Field(key: "Results")]
        getter results : Types::MediaAnalysisResults?

        def initialize(
          @creation_timestamp : Time,
          @input : Types::MediaAnalysisInput,
          @job_id : String,
          @operations_config : Types::MediaAnalysisOperationsConfig,
          @output_config : Types::MediaAnalysisOutputConfig,
          @status : String,
          @completion_timestamp : Time? = nil,
          @failure_details : Types::MediaAnalysisJobFailureDetails? = nil,
          @job_name : String? = nil,
          @kms_key_id : String? = nil,
          @manifest_summary : Types::MediaAnalysisManifestSummary? = nil,
          @results : Types::MediaAnalysisResults? = nil
        )
        end
      end

      # Details about the error that resulted in failure of the job.
      struct MediaAnalysisJobFailureDetails
        include JSON::Serializable

        # Error code for the failed job.
        @[JSON::Field(key: "Code")]
        getter code : String?

        # Human readable error message.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Summary that provides statistics on input manifest and errors identified in the input manifest.
      struct MediaAnalysisManifestSummary
        include JSON::Serializable

        @[JSON::Field(key: "S3Object")]
        getter s3_object : Types::S3Object?

        def initialize(
          @s3_object : Types::S3Object? = nil
        )
        end
      end

      # Object containing information about the model versions of selected features in a given job.
      struct MediaAnalysisModelVersions
        include JSON::Serializable

        # The Moderation base model version.
        @[JSON::Field(key: "Moderation")]
        getter moderation : String?

        def initialize(
          @moderation : String? = nil
        )
        end
      end

      # Configuration options for a media analysis job. Configuration is operation-specific.
      struct MediaAnalysisOperationsConfig
        include JSON::Serializable

        # Contains configuration options for a DetectModerationLabels job.
        @[JSON::Field(key: "DetectModerationLabels")]
        getter detect_moderation_labels : Types::MediaAnalysisDetectModerationLabelsConfig?

        def initialize(
          @detect_moderation_labels : Types::MediaAnalysisDetectModerationLabelsConfig? = nil
        )
        end
      end

      # Output configuration provided in the job creation request.
      struct MediaAnalysisOutputConfig
        include JSON::Serializable

        # Specifies the Amazon S3 bucket to contain the output of the media analysis job.
        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String

        # Specifies the Amazon S3 key prefix that comes after the name of the bucket you have designated for
        # storage.
        @[JSON::Field(key: "S3KeyPrefix")]
        getter s3_key_prefix : String?

        def initialize(
          @s3_bucket : String,
          @s3_key_prefix : String? = nil
        )
        end
      end

      # Contains the results for a media analysis job created with StartMediaAnalysisJob.
      struct MediaAnalysisResults
        include JSON::Serializable

        # Information about the model versions for the features selected in a given job.
        @[JSON::Field(key: "ModelVersions")]
        getter model_versions : Types::MediaAnalysisModelVersions?

        @[JSON::Field(key: "S3Object")]
        getter s3_object : Types::S3Object?

        def initialize(
          @model_versions : Types::MediaAnalysisModelVersions? = nil,
          @s3_object : Types::S3Object? = nil
        )
        end
      end

      # Provides information about a single type of inappropriate, unwanted, or offensive content found in
      # an image or video. Each type of moderated content has a label within a hierarchical taxonomy. For
      # more information, see Content moderation in the Amazon Rekognition Developer Guide.
      struct ModerationLabel
        include JSON::Serializable

        # Specifies the confidence that Amazon Rekognition has that the label has been correctly identified.
        # If you don't specify the MinConfidence parameter in the call to DetectModerationLabels , the
        # operation returns labels with a confidence value greater than or equal to 50 percent.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The label name for the type of unsafe content detected in the image.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The name for the parent label. Labels at the top level of the hierarchy have the parent label "" .
        @[JSON::Field(key: "ParentName")]
        getter parent_name : String?

        # The level of the moderation label with regard to its taxonomy, from 1 to 3.
        @[JSON::Field(key: "TaxonomyLevel")]
        getter taxonomy_level : Int32?

        def initialize(
          @confidence : Float64? = nil,
          @name : String? = nil,
          @parent_name : String? = nil,
          @taxonomy_level : Int32? = nil
        )
        end
      end

      # Indicates whether or not the mouth on the face is open, and the confidence level in the
      # determination.
      struct MouthOpen
        include JSON::Serializable

        # Level of confidence in the determination.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # Boolean value that indicates whether the mouth on the face is open or not.
        @[JSON::Field(key: "Value")]
        getter value : Bool?

        def initialize(
          @confidence : Float64? = nil,
          @value : Bool? = nil
        )
        end
      end

      # Indicates whether or not the face has a mustache, and the confidence level in the determination.
      struct Mustache
        include JSON::Serializable

        # Level of confidence in the determination.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # Boolean value that indicates whether the face has mustache or not.
        @[JSON::Field(key: "Value")]
        getter value : Bool?

        def initialize(
          @confidence : Float64? = nil,
          @value : Bool? = nil
        )
        end
      end

      # The Amazon Simple Notification Service topic to which Amazon Rekognition publishes the completion
      # status of a video analysis operation. For more information, see Calling Amazon Rekognition Video
      # operations . Note that the Amazon SNS topic must have a topic name that begins with
      # AmazonRekognition if you are using the AmazonRekognitionServiceRole permissions policy to access the
      # topic. For more information, see Giving access to multiple Amazon SNS topics .
      struct NotificationChannel
        include JSON::Serializable

        # The ARN of an IAM role that gives Amazon Rekognition publishing permissions to the Amazon SNS topic.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The Amazon SNS topic to which Amazon Rekognition posts the completion status.
        @[JSON::Field(key: "SNSTopicArn")]
        getter sns_topic_arn : String

        def initialize(
          @role_arn : String,
          @sns_topic_arn : String
        )
        end
      end

      # The S3 bucket and folder location where training output is placed.
      struct OutputConfig
        include JSON::Serializable

        # The S3 bucket where training output is placed.
        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String?

        # The prefix applied to the training output files.
        @[JSON::Field(key: "S3KeyPrefix")]
        getter s3_key_prefix : String?

        def initialize(
          @s3_bucket : String? = nil,
          @s3_key_prefix : String? = nil
        )
        end
      end

      # A parent label for a label. A label can have 0, 1, or more parents.
      struct Parent
        include JSON::Serializable

        # The name of the parent label.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Details about a person detected in a video analysis request.
      struct PersonDetail
        include JSON::Serializable

        # Bounding box around the detected person.
        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Types::BoundingBox?

        # Face details for the detected person.
        @[JSON::Field(key: "Face")]
        getter face : Types::FaceDetail?

        # Identifier for the person detected person within a video. Use to keep track of the person throughout
        # the video. The identifier is not stored by Amazon Rekognition.
        @[JSON::Field(key: "Index")]
        getter index : Int64?

        def initialize(
          @bounding_box : Types::BoundingBox? = nil,
          @face : Types::FaceDetail? = nil,
          @index : Int64? = nil
        )
        end
      end

      # Details and path tracking information for a single time a person's path is tracked in a video.
      # Amazon Rekognition operations that track people's paths return an array of PersonDetection objects
      # with elements for each time a person's path is tracked in a video. For more information, see
      # GetPersonTracking in the Amazon Rekognition Developer Guide.
      struct PersonDetection
        include JSON::Serializable

        # Details about a person whose path was tracked in a video.
        @[JSON::Field(key: "Person")]
        getter person : Types::PersonDetail?

        # The time, in milliseconds from the start of the video, that the person's path was tracked. Note that
        # Timestamp is not guaranteed to be accurate to the individual frame where the person's path first
        # appears.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Int64?

        def initialize(
          @person : Types::PersonDetail? = nil,
          @timestamp : Int64? = nil
        )
        end
      end

      # Information about a person whose face matches a face(s) in an Amazon Rekognition collection.
      # Includes information about the faces in the Amazon Rekognition collection ( FaceMatch ), information
      # about the person ( PersonDetail ), and the time stamp for when the person was detected in a video.
      # An array of PersonMatch objects is returned by GetFaceSearch .
      struct PersonMatch
        include JSON::Serializable

        # Information about the faces in the input collection that match the face of a person in the video.
        @[JSON::Field(key: "FaceMatches")]
        getter face_matches : Array(Types::FaceMatch)?

        # Information about the matched person.
        @[JSON::Field(key: "Person")]
        getter person : Types::PersonDetail?

        # The time, in milliseconds from the beginning of the video, that the person was matched in the video.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Int64?

        def initialize(
          @face_matches : Array(Types::FaceMatch)? = nil,
          @person : Types::PersonDetail? = nil,
          @timestamp : Int64? = nil
        )
        end
      end

      # The X and Y coordinates of a point on an image or video frame. The X and Y values are ratios of the
      # overall image size or video resolution. For example, if an input image is 700x200 and the values are
      # X=0.5 and Y=0.25, then the point is at the (350,50) pixel coordinate on the image. An array of Point
      # objects makes up a Polygon . A Polygon is returned by DetectText and by DetectCustomLabels Polygon
      # represents a fine-grained polygon around a detected item. For more information, see Geometry in the
      # Amazon Rekognition Developer Guide.
      struct Point
        include JSON::Serializable

        # The value of the X coordinate for a point on a Polygon .
        @[JSON::Field(key: "X")]
        getter x : Float64?

        # The value of the Y coordinate for a point on a Polygon .
        @[JSON::Field(key: "Y")]
        getter y : Float64?

        def initialize(
          @x : Float64? = nil,
          @y : Float64? = nil
        )
        end
      end

      # Indicates the pose of the face as determined by its pitch, roll, and yaw.
      struct Pose
        include JSON::Serializable

        # Value representing the face rotation on the pitch axis.
        @[JSON::Field(key: "Pitch")]
        getter pitch : Float64?

        # Value representing the face rotation on the roll axis.
        @[JSON::Field(key: "Roll")]
        getter roll : Float64?

        # Value representing the face rotation on the yaw axis.
        @[JSON::Field(key: "Yaw")]
        getter yaw : Float64?

        def initialize(
          @pitch : Float64? = nil,
          @roll : Float64? = nil,
          @yaw : Float64? = nil
        )
        end
      end

      # A description of an Amazon Rekognition Custom Labels project. For more information, see
      # DescribeProjects .
      struct ProjectDescription
        include JSON::Serializable

        # Indicates whether automatic retraining will be attempted for the versions of the project. Applies
        # only to adapters.
        @[JSON::Field(key: "AutoUpdate")]
        getter auto_update : String?

        # The Unix timestamp for the date and time that the project was created.
        @[JSON::Field(key: "CreationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_timestamp : Time?

        # Information about the training and test datasets in the project.
        @[JSON::Field(key: "Datasets")]
        getter datasets : Array(Types::DatasetMetadata)?

        # Specifies the project that is being customized.
        @[JSON::Field(key: "Feature")]
        getter feature : String?

        # The Amazon Resource Name (ARN) of the project.
        @[JSON::Field(key: "ProjectArn")]
        getter project_arn : String?

        # The current status of the project.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @auto_update : String? = nil,
          @creation_timestamp : Time? = nil,
          @datasets : Array(Types::DatasetMetadata)? = nil,
          @feature : String? = nil,
          @project_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes a project policy in the response from ListProjectPolicies .
      struct ProjectPolicy
        include JSON::Serializable

        # The Unix datetime for the creation of the project policy.
        @[JSON::Field(key: "CreationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_timestamp : Time?

        # The Unix datetime for when the project policy was last updated.
        @[JSON::Field(key: "LastUpdatedTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_timestamp : Time?

        # The JSON document for the project policy.
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String?

        # The name of the project policy.
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String?

        # The revision ID of the project policy.
        @[JSON::Field(key: "PolicyRevisionId")]
        getter policy_revision_id : String?

        # The Amazon Resource Name (ARN) of the project to which the project policy is attached.
        @[JSON::Field(key: "ProjectArn")]
        getter project_arn : String?

        def initialize(
          @creation_timestamp : Time? = nil,
          @last_updated_timestamp : Time? = nil,
          @policy_document : String? = nil,
          @policy_name : String? = nil,
          @policy_revision_id : String? = nil,
          @project_arn : String? = nil
        )
        end
      end

      # A description of a version of a Amazon Rekognition project version.
      struct ProjectVersionDescription
        include JSON::Serializable

        # The base detection model version used to create the project version.
        @[JSON::Field(key: "BaseModelVersion")]
        getter base_model_version : String?

        # The duration, in seconds, that you were billed for a successful training of the model version. This
        # value is only returned if the model version has been successfully trained.
        @[JSON::Field(key: "BillableTrainingTimeInSeconds")]
        getter billable_training_time_in_seconds : Int64?

        # The Unix datetime for the date and time that training started.
        @[JSON::Field(key: "CreationTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_timestamp : Time?

        # The training results. EvaluationResult is only returned if training is successful.
        @[JSON::Field(key: "EvaluationResult")]
        getter evaluation_result : Types::EvaluationResult?

        # The feature that was customized.
        @[JSON::Field(key: "Feature")]
        getter feature : String?

        # Feature specific configuration that was applied during training.
        @[JSON::Field(key: "FeatureConfig")]
        getter feature_config : Types::CustomizationFeatureConfig?

        # The identifer for the AWS Key Management Service key (AWS KMS key) that was used to encrypt the
        # model during training.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # The location of the summary manifest. The summary manifest provides aggregate data validation
        # results for the training and test datasets.
        @[JSON::Field(key: "ManifestSummary")]
        getter manifest_summary : Types::GroundTruthManifest?

        # The maximum number of inference units Amazon Rekognition uses to auto-scale the model. Applies only
        # to Custom Labels projects. For more information, see StartProjectVersion .
        @[JSON::Field(key: "MaxInferenceUnits")]
        getter max_inference_units : Int32?

        # The minimum number of inference units used by the model. Applies only to Custom Labels projects. For
        # more information, see StartProjectVersion .
        @[JSON::Field(key: "MinInferenceUnits")]
        getter min_inference_units : Int32?

        # The location where training results are saved.
        @[JSON::Field(key: "OutputConfig")]
        getter output_config : Types::OutputConfig?

        # The Amazon Resource Name (ARN) of the project version.
        @[JSON::Field(key: "ProjectVersionArn")]
        getter project_version_arn : String?

        # If the model version was copied from a different project, SourceProjectVersionArn contains the ARN
        # of the source model version.
        @[JSON::Field(key: "SourceProjectVersionArn")]
        getter source_project_version_arn : String?

        # The current status of the model version.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # A descriptive message for an error or warning that occurred.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # Contains information about the testing results.
        @[JSON::Field(key: "TestingDataResult")]
        getter testing_data_result : Types::TestingDataResult?

        # Contains information about the training results.
        @[JSON::Field(key: "TrainingDataResult")]
        getter training_data_result : Types::TrainingDataResult?

        # The Unix date and time that training of the model ended.
        @[JSON::Field(key: "TrainingEndTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter training_end_timestamp : Time?

        # A user-provided description of the project version.
        @[JSON::Field(key: "VersionDescription")]
        getter version_description : String?

        def initialize(
          @base_model_version : String? = nil,
          @billable_training_time_in_seconds : Int64? = nil,
          @creation_timestamp : Time? = nil,
          @evaluation_result : Types::EvaluationResult? = nil,
          @feature : String? = nil,
          @feature_config : Types::CustomizationFeatureConfig? = nil,
          @kms_key_id : String? = nil,
          @manifest_summary : Types::GroundTruthManifest? = nil,
          @max_inference_units : Int32? = nil,
          @min_inference_units : Int32? = nil,
          @output_config : Types::OutputConfig? = nil,
          @project_version_arn : String? = nil,
          @source_project_version_arn : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @testing_data_result : Types::TestingDataResult? = nil,
          @training_data_result : Types::TrainingDataResult? = nil,
          @training_end_timestamp : Time? = nil,
          @version_description : String? = nil
        )
        end
      end

      # Information about a body part detected by DetectProtectiveEquipment that contains PPE. An array of
      # ProtectiveEquipmentBodyPart objects is returned for each person detected by
      # DetectProtectiveEquipment .
      struct ProtectiveEquipmentBodyPart
        include JSON::Serializable

        # The confidence that Amazon Rekognition has in the detection accuracy of the detected body part.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # An array of Personal Protective Equipment items detected around a body part.
        @[JSON::Field(key: "EquipmentDetections")]
        getter equipment_detections : Array(Types::EquipmentDetection)?

        # The detected body part.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @confidence : Float64? = nil,
          @equipment_detections : Array(Types::EquipmentDetection)? = nil,
          @name : String? = nil
        )
        end
      end

      # A person detected by a call to DetectProtectiveEquipment . The API returns all persons detected in
      # the input image in an array of ProtectiveEquipmentPerson objects.
      struct ProtectiveEquipmentPerson
        include JSON::Serializable

        # An array of body parts detected on a person's body (including body parts without PPE).
        @[JSON::Field(key: "BodyParts")]
        getter body_parts : Array(Types::ProtectiveEquipmentBodyPart)?

        # A bounding box around the detected person.
        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Types::BoundingBox?

        # The confidence that Amazon Rekognition has that the bounding box contains a person.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The identifier for the detected person. The identifier is only unique for a single call to
        # DetectProtectiveEquipment .
        @[JSON::Field(key: "Id")]
        getter id : Int32?

        def initialize(
          @body_parts : Array(Types::ProtectiveEquipmentBodyPart)? = nil,
          @bounding_box : Types::BoundingBox? = nil,
          @confidence : Float64? = nil,
          @id : Int32? = nil
        )
        end
      end

      # Specifies summary attributes to return from a call to DetectProtectiveEquipment . You can specify
      # which types of PPE to summarize. You can also specify a minimum confidence value for detections.
      # Summary information is returned in the Summary ( ProtectiveEquipmentSummary ) field of the response
      # from DetectProtectiveEquipment . The summary includes which persons in an image were detected
      # wearing the requested types of person protective equipment (PPE), which persons were detected as not
      # wearing PPE, and the persons in which a determination could not be made. For more information, see
      # ProtectiveEquipmentSummary .
      struct ProtectiveEquipmentSummarizationAttributes
        include JSON::Serializable

        # The minimum confidence level for which you want summary information. The confidence level applies to
        # person detection, body part detection, equipment detection, and body part coverage. Amazon
        # Rekognition doesn't return summary information with a confidence than this specified value. There
        # isn't a default value. Specify a MinConfidence value that is between 50-100% as
        # DetectProtectiveEquipment returns predictions only where the detection confidence is between 50% -
        # 100%. If you specify a value that is less than 50%, the results are the same specifying a value of
        # 50%.
        @[JSON::Field(key: "MinConfidence")]
        getter min_confidence : Float64

        # An array of personal protective equipment types for which you want summary information. If a person
        # is detected wearing a required requipment type, the person's ID is added to the
        # PersonsWithRequiredEquipment array field returned in ProtectiveEquipmentSummary by
        # DetectProtectiveEquipment .
        @[JSON::Field(key: "RequiredEquipmentTypes")]
        getter required_equipment_types : Array(String)

        def initialize(
          @min_confidence : Float64,
          @required_equipment_types : Array(String)
        )
        end
      end

      # Summary information for required items of personal protective equipment (PPE) detected on persons by
      # a call to DetectProtectiveEquipment . You specify the required type of PPE in the
      # SummarizationAttributes ( ProtectiveEquipmentSummarizationAttributes ) input parameter. The summary
      # includes which persons were detected wearing the required personal protective equipment (
      # PersonsWithRequiredEquipment ), which persons were detected as not wearing the required PPE (
      # PersonsWithoutRequiredEquipment ), and the persons in which a determination could not be made (
      # PersonsIndeterminate ). To get a total for each category, use the size of the field array. For
      # example, to find out how many people were detected as wearing the specified PPE, use the size of the
      # PersonsWithRequiredEquipment array. If you want to find out more about a person, such as the
      # location ( BoundingBox ) of the person on the image, use the person ID in each array element. Each
      # person ID matches the ID field of a ProtectiveEquipmentPerson object returned in the Persons array
      # by DetectProtectiveEquipment .
      struct ProtectiveEquipmentSummary
        include JSON::Serializable

        # An array of IDs for persons where it was not possible to determine if they are wearing personal
        # protective equipment.
        @[JSON::Field(key: "PersonsIndeterminate")]
        getter persons_indeterminate : Array(Int32)?

        # An array of IDs for persons who are wearing detected personal protective equipment.
        @[JSON::Field(key: "PersonsWithRequiredEquipment")]
        getter persons_with_required_equipment : Array(Int32)?

        # An array of IDs for persons who are not wearing all of the types of PPE specified in the
        # RequiredEquipmentTypes field of the detected personal protective equipment.
        @[JSON::Field(key: "PersonsWithoutRequiredEquipment")]
        getter persons_without_required_equipment : Array(Int32)?

        def initialize(
          @persons_indeterminate : Array(Int32)? = nil,
          @persons_with_required_equipment : Array(Int32)? = nil,
          @persons_without_required_equipment : Array(Int32)? = nil
        )
        end
      end

      # The number of requests exceeded your throughput limit. If you want to increase this limit, contact
      # Amazon Rekognition.
      struct ProvisionedThroughputExceededException
        include JSON::Serializable

        def initialize
        end
      end

      struct PutProjectPolicyRequest
        include JSON::Serializable

        # A resource policy to add to the model. The policy is a JSON structure that contains one or more
        # statements that define the policy. The policy must follow the IAM syntax. For more information about
        # the contents of a JSON policy document, see IAM JSON policy reference .
        @[JSON::Field(key: "PolicyDocument")]
        getter policy_document : String

        # A name for the policy.
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String

        # The Amazon Resource Name (ARN) of the project that the project policy is attached to.
        @[JSON::Field(key: "ProjectArn")]
        getter project_arn : String

        # The revision ID for the Project Policy. Each time you modify a policy, Amazon Rekognition Custom
        # Labels generates and assigns a new PolicyRevisionId and then deletes the previous version of the
        # policy.
        @[JSON::Field(key: "PolicyRevisionId")]
        getter policy_revision_id : String?

        def initialize(
          @policy_document : String,
          @policy_name : String,
          @project_arn : String,
          @policy_revision_id : String? = nil
        )
        end
      end

      struct PutProjectPolicyResponse
        include JSON::Serializable

        # The ID of the project policy.
        @[JSON::Field(key: "PolicyRevisionId")]
        getter policy_revision_id : String?

        def initialize(
          @policy_revision_id : String? = nil
        )
        end
      end

      struct RecognizeCelebritiesRequest
        include JSON::Serializable

        # The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon
        # Rekognition operations, passing base64-encoded image bytes is not supported. If you are using an AWS
        # SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the
        # Bytes field. For more information, see Images in the Amazon Rekognition developer guide.
        @[JSON::Field(key: "Image")]
        getter image : Types::Image

        def initialize(
          @image : Types::Image
        )
        end
      end

      struct RecognizeCelebritiesResponse
        include JSON::Serializable

        # Details about each celebrity found in the image. Amazon Rekognition can detect a maximum of 64
        # celebrities in an image. Each celebrity object includes the following attributes: Face , Confidence
        # , Emotions , Landmarks , Pose , Quality , Smile , Id , KnownGender , MatchConfidence , Name , Urls .
        @[JSON::Field(key: "CelebrityFaces")]
        getter celebrity_faces : Array(Types::Celebrity)?

        # Support for estimating image orientation using the the OrientationCorrection field has ceased as of
        # August 2021. Any returned values for this field included in an API response will always be NULL. The
        # orientation of the input image (counterclockwise direction). If your application displays the image,
        # you can use this value to correct the orientation. The bounding box coordinates returned in
        # CelebrityFaces and UnrecognizedFaces represent face locations before the image orientation is
        # corrected. If the input image is in .jpeg format, it might contain exchangeable image (Exif)
        # metadata that includes the image's orientation. If so, and the Exif metadata for the input image
        # populates the orientation field, the value of OrientationCorrection is null. The CelebrityFaces and
        # UnrecognizedFaces bounding box coordinates represent face locations after Exif metadata is used to
        # correct the image orientation. Images in .png format don't contain Exif metadata.
        @[JSON::Field(key: "OrientationCorrection")]
        getter orientation_correction : String?

        # Details about each unrecognized face in the image.
        @[JSON::Field(key: "UnrecognizedFaces")]
        getter unrecognized_faces : Array(Types::ComparedFace)?

        def initialize(
          @celebrity_faces : Array(Types::Celebrity)? = nil,
          @orientation_correction : String? = nil,
          @unrecognized_faces : Array(Types::ComparedFace)? = nil
        )
        end
      end

      # Specifies a location within the frame that Rekognition checks for objects of interest such as text,
      # labels, or faces. It uses a BoundingBox or Polygon to set a region of the screen. A word, face, or
      # label is included in the region if it is more than half in that region. If there is more than one
      # region, the word, face, or label is compared with all regions of the screen. Any object of interest
      # that is more than half in a region is kept in the results.
      struct RegionOfInterest
        include JSON::Serializable

        # The box representing a region of interest on screen.
        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Types::BoundingBox?

        # Specifies a shape made up of up to 10 Point objects to define a region of interest.
        @[JSON::Field(key: "Polygon")]
        getter polygon : Array(Types::Point)?

        def initialize(
          @bounding_box : Types::BoundingBox? = nil,
          @polygon : Array(Types::Point)? = nil
        )
        end
      end

      # A resource with the specified ID already exists.
      struct ResourceAlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified resource is already being used.
      struct ResourceInUseException
        include JSON::Serializable

        def initialize
        end
      end

      # The resource specified in the request cannot be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The requested resource isn't ready. For example, this exception occurs when you call
      # DetectCustomLabels with a model version that isn't deployed.
      struct ResourceNotReadyException
        include JSON::Serializable

        def initialize
        end
      end

      # The Amazon S3 bucket location to which Amazon Rekognition publishes the detailed inference results
      # of a video analysis operation. These results include the name of the stream processor resource, the
      # session ID of the stream processing session, and labeled timestamps and bounding boxes for detected
      # labels.
      struct S3Destination
        include JSON::Serializable

        # The name of the Amazon S3 bucket you want to associate with the streaming video project. You must be
        # the owner of the Amazon S3 bucket.
        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # The prefix value of the location within the bucket that you want the information to be published to.
        # For more information, see Using prefixes .
        @[JSON::Field(key: "KeyPrefix")]
        getter key_prefix : String?

        def initialize(
          @bucket : String? = nil,
          @key_prefix : String? = nil
        )
        end
      end

      # Provides the S3 bucket name and object name. The region for the S3 bucket containing the S3 object
      # must match the region you use for Amazon Rekognition operations. For Amazon Rekognition to process
      # an S3 object, the user must have permission to access the S3 object. For more information, see How
      # Amazon Rekognition works with IAM in the Amazon Rekognition Developer Guide.
      struct S3Object
        include JSON::Serializable

        # Name of the S3 bucket.
        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # S3 object key name.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # If the bucket is versioning enabled, you can specify the object version.
        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @bucket : String? = nil,
          @name : String? = nil,
          @version : String? = nil
        )
        end
      end

      struct SearchFacesByImageRequest
        include JSON::Serializable

        # ID of the collection to search.
        @[JSON::Field(key: "CollectionId")]
        getter collection_id : String

        # The input image as base64-encoded bytes or an S3 object. If you use the AWS CLI to call Amazon
        # Rekognition operations, passing base64-encoded image bytes is not supported. If you are using an AWS
        # SDK to call Amazon Rekognition, you might not need to base64-encode image bytes passed using the
        # Bytes field. For more information, see Images in the Amazon Rekognition developer guide.
        @[JSON::Field(key: "Image")]
        getter image : Types::Image

        # (Optional) Specifies the minimum confidence in the face match to return. For example, don't return
        # any matches where confidence in matches is less than 70%. The default value is 80%.
        @[JSON::Field(key: "FaceMatchThreshold")]
        getter face_match_threshold : Float64?

        # Maximum number of faces to return. The operation returns the maximum number of faces with the
        # highest confidence in the match.
        @[JSON::Field(key: "MaxFaces")]
        getter max_faces : Int32?

        # A filter that specifies a quality bar for how much filtering is done to identify faces. Filtered
        # faces aren't searched for in the collection. If you specify AUTO , Amazon Rekognition chooses the
        # quality bar. If you specify LOW , MEDIUM , or HIGH , filtering removes all faces that don’t meet the
        # chosen quality bar. The quality bar is based on a variety of common use cases. Low-quality
        # detections can occur for a number of reasons. Some examples are an object that's misidentified as a
        # face, a face that's too blurry, or a face with a pose that's too extreme to use. If you specify NONE
        # , no filtering is performed. The default value is NONE . To use quality filtering, the collection
        # you are using must be associated with version 3 of the face model or higher.
        @[JSON::Field(key: "QualityFilter")]
        getter quality_filter : String?

        def initialize(
          @collection_id : String,
          @image : Types::Image,
          @face_match_threshold : Float64? = nil,
          @max_faces : Int32? = nil,
          @quality_filter : String? = nil
        )
        end
      end

      struct SearchFacesByImageResponse
        include JSON::Serializable

        # An array of faces that match the input face, along with the confidence in the match.
        @[JSON::Field(key: "FaceMatches")]
        getter face_matches : Array(Types::FaceMatch)?

        # Version number of the face detection model associated with the input collection ( CollectionId ).
        @[JSON::Field(key: "FaceModelVersion")]
        getter face_model_version : String?

        # The bounding box around the face in the input image that Amazon Rekognition used for the search.
        @[JSON::Field(key: "SearchedFaceBoundingBox")]
        getter searched_face_bounding_box : Types::BoundingBox?

        # The level of confidence that the searchedFaceBoundingBox , contains a face.
        @[JSON::Field(key: "SearchedFaceConfidence")]
        getter searched_face_confidence : Float64?

        def initialize(
          @face_matches : Array(Types::FaceMatch)? = nil,
          @face_model_version : String? = nil,
          @searched_face_bounding_box : Types::BoundingBox? = nil,
          @searched_face_confidence : Float64? = nil
        )
        end
      end

      struct SearchFacesRequest
        include JSON::Serializable

        # ID of the collection the face belongs to.
        @[JSON::Field(key: "CollectionId")]
        getter collection_id : String

        # ID of a face to find matches for in the collection.
        @[JSON::Field(key: "FaceId")]
        getter face_id : String

        # Optional value specifying the minimum confidence in the face match to return. For example, don't
        # return any matches where confidence in matches is less than 70%. The default value is 80%.
        @[JSON::Field(key: "FaceMatchThreshold")]
        getter face_match_threshold : Float64?

        # Maximum number of faces to return. The operation returns the maximum number of faces with the
        # highest confidence in the match.
        @[JSON::Field(key: "MaxFaces")]
        getter max_faces : Int32?

        def initialize(
          @collection_id : String,
          @face_id : String,
          @face_match_threshold : Float64? = nil,
          @max_faces : Int32? = nil
        )
        end
      end

      struct SearchFacesResponse
        include JSON::Serializable

        # An array of faces that matched the input face, along with the confidence in the match.
        @[JSON::Field(key: "FaceMatches")]
        getter face_matches : Array(Types::FaceMatch)?

        # Version number of the face detection model associated with the input collection ( CollectionId ).
        @[JSON::Field(key: "FaceModelVersion")]
        getter face_model_version : String?

        # ID of the face that was searched for matches in a collection.
        @[JSON::Field(key: "SearchedFaceId")]
        getter searched_face_id : String?

        def initialize(
          @face_matches : Array(Types::FaceMatch)? = nil,
          @face_model_version : String? = nil,
          @searched_face_id : String? = nil
        )
        end
      end

      struct SearchUsersByImageRequest
        include JSON::Serializable

        # The ID of an existing collection containing the UserID.
        @[JSON::Field(key: "CollectionId")]
        getter collection_id : String

        @[JSON::Field(key: "Image")]
        getter image : Types::Image

        # Maximum number of UserIDs to return.
        @[JSON::Field(key: "MaxUsers")]
        getter max_users : Int32?

        # A filter that specifies a quality bar for how much filtering is done to identify faces. Filtered
        # faces aren't searched for in the collection. The default value is NONE.
        @[JSON::Field(key: "QualityFilter")]
        getter quality_filter : String?

        # Specifies the minimum confidence in the UserID match to return. Default value is 80.
        @[JSON::Field(key: "UserMatchThreshold")]
        getter user_match_threshold : Float64?

        def initialize(
          @collection_id : String,
          @image : Types::Image,
          @max_users : Int32? = nil,
          @quality_filter : String? = nil,
          @user_match_threshold : Float64? = nil
        )
        end
      end

      struct SearchUsersByImageResponse
        include JSON::Serializable

        # Version number of the face detection model associated with the input collection CollectionId.
        @[JSON::Field(key: "FaceModelVersion")]
        getter face_model_version : String?

        # A list of FaceDetail objects containing the BoundingBox for the largest face in image, as well as
        # the confidence in the bounding box, that was searched for matches. If no valid face is detected in
        # the image the response will contain no SearchedFace object.
        @[JSON::Field(key: "SearchedFace")]
        getter searched_face : Types::SearchedFaceDetails?

        # List of UnsearchedFace objects. Contains the face details infered from the specified image but not
        # used for search. Contains reasons that describe why a face wasn't used for Search.
        @[JSON::Field(key: "UnsearchedFaces")]
        getter unsearched_faces : Array(Types::UnsearchedFace)?

        # An array of UserID objects that matched the input face, along with the confidence in the match. The
        # returned structure will be empty if there are no matches. Returned if the SearchUsersByImageResponse
        # action is successful.
        @[JSON::Field(key: "UserMatches")]
        getter user_matches : Array(Types::UserMatch)?

        def initialize(
          @face_model_version : String? = nil,
          @searched_face : Types::SearchedFaceDetails? = nil,
          @unsearched_faces : Array(Types::UnsearchedFace)? = nil,
          @user_matches : Array(Types::UserMatch)? = nil
        )
        end
      end

      struct SearchUsersRequest
        include JSON::Serializable

        # The ID of an existing collection containing the UserID, used with a UserId or FaceId. If a FaceId is
        # provided, UserId isn’t required to be present in the Collection.
        @[JSON::Field(key: "CollectionId")]
        getter collection_id : String

        # ID for the existing face.
        @[JSON::Field(key: "FaceId")]
        getter face_id : String?

        # Maximum number of identities to return.
        @[JSON::Field(key: "MaxUsers")]
        getter max_users : Int32?

        # ID for the existing User.
        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        # Optional value that specifies the minimum confidence in the matched UserID to return. Default value
        # of 80.
        @[JSON::Field(key: "UserMatchThreshold")]
        getter user_match_threshold : Float64?

        def initialize(
          @collection_id : String,
          @face_id : String? = nil,
          @max_users : Int32? = nil,
          @user_id : String? = nil,
          @user_match_threshold : Float64? = nil
        )
        end
      end

      struct SearchUsersResponse
        include JSON::Serializable

        # Version number of the face detection model associated with the input CollectionId.
        @[JSON::Field(key: "FaceModelVersion")]
        getter face_model_version : String?

        # Contains the ID of a face that was used to search for matches in a collection.
        @[JSON::Field(key: "SearchedFace")]
        getter searched_face : Types::SearchedFace?

        # Contains the ID of the UserID that was used to search for matches in a collection.
        @[JSON::Field(key: "SearchedUser")]
        getter searched_user : Types::SearchedUser?

        # An array of UserMatch objects that matched the input face along with the confidence in the match.
        # Array will be empty if there are no matches.
        @[JSON::Field(key: "UserMatches")]
        getter user_matches : Array(Types::UserMatch)?

        def initialize(
          @face_model_version : String? = nil,
          @searched_face : Types::SearchedFace? = nil,
          @searched_user : Types::SearchedUser? = nil,
          @user_matches : Array(Types::UserMatch)? = nil
        )
        end
      end

      # Provides face metadata such as FaceId, BoundingBox, Confidence of the input face used for search.
      struct SearchedFace
        include JSON::Serializable

        # Unique identifier assigned to the face.
        @[JSON::Field(key: "FaceId")]
        getter face_id : String?

        def initialize(
          @face_id : String? = nil
        )
        end
      end

      # Contains data regarding the input face used for a search.
      struct SearchedFaceDetails
        include JSON::Serializable

        @[JSON::Field(key: "FaceDetail")]
        getter face_detail : Types::FaceDetail?

        def initialize(
          @face_detail : Types::FaceDetail? = nil
        )
        end
      end

      # Contains metadata about a User searched for within a collection.
      struct SearchedUser
        include JSON::Serializable

        # A provided ID for the UserID. Unique within the collection.
        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @user_id : String? = nil
        )
        end
      end

      # A technical cue or shot detection segment detected in a video. An array of SegmentDetection objects
      # containing all segments detected in a stored video is returned by GetSegmentDetection .
      struct SegmentDetection
        include JSON::Serializable

        # The duration of a video segment, expressed in frames.
        @[JSON::Field(key: "DurationFrames")]
        getter duration_frames : Int64?

        # The duration of the detected segment in milliseconds.
        @[JSON::Field(key: "DurationMillis")]
        getter duration_millis : Int64?

        # The duration of the timecode for the detected segment in SMPTE format.
        @[JSON::Field(key: "DurationSMPTE")]
        getter duration_smpte : String?

        # The frame number at the end of a video segment, using a frame index that starts with 0.
        @[JSON::Field(key: "EndFrameNumber")]
        getter end_frame_number : Int64?

        # The frame-accurate SMPTE timecode, from the start of a video, for the end of a detected segment.
        # EndTimecode is in HH:MM:SS:fr format (and ;fr for drop frame-rates).
        @[JSON::Field(key: "EndTimecodeSMPTE")]
        getter end_timecode_smpte : String?

        # The end time of the detected segment, in milliseconds, from the start of the video. This value is
        # rounded down.
        @[JSON::Field(key: "EndTimestampMillis")]
        getter end_timestamp_millis : Int64?

        # If the segment is a shot detection, contains information about the shot detection.
        @[JSON::Field(key: "ShotSegment")]
        getter shot_segment : Types::ShotSegment?

        # The frame number of the start of a video segment, using a frame index that starts with 0.
        @[JSON::Field(key: "StartFrameNumber")]
        getter start_frame_number : Int64?

        # The frame-accurate SMPTE timecode, from the start of a video, for the start of a detected segment.
        # StartTimecode is in HH:MM:SS:fr format (and ;fr for drop frame-rates).
        @[JSON::Field(key: "StartTimecodeSMPTE")]
        getter start_timecode_smpte : String?

        # The start time of the detected segment in milliseconds from the start of the video. This value is
        # rounded down. For example, if the actual timestamp is 100.6667 milliseconds, Amazon Rekognition
        # Video returns a value of 100 millis.
        @[JSON::Field(key: "StartTimestampMillis")]
        getter start_timestamp_millis : Int64?

        # If the segment is a technical cue, contains information about the technical cue.
        @[JSON::Field(key: "TechnicalCueSegment")]
        getter technical_cue_segment : Types::TechnicalCueSegment?

        # The type of the segment. Valid values are TECHNICAL_CUE and SHOT .
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @duration_frames : Int64? = nil,
          @duration_millis : Int64? = nil,
          @duration_smpte : String? = nil,
          @end_frame_number : Int64? = nil,
          @end_timecode_smpte : String? = nil,
          @end_timestamp_millis : Int64? = nil,
          @shot_segment : Types::ShotSegment? = nil,
          @start_frame_number : Int64? = nil,
          @start_timecode_smpte : String? = nil,
          @start_timestamp_millis : Int64? = nil,
          @technical_cue_segment : Types::TechnicalCueSegment? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about the type of a segment requested in a call to StartSegmentDetection . An array of
      # SegmentTypeInfo objects is returned by the response from GetSegmentDetection .
      struct SegmentTypeInfo
        include JSON::Serializable

        # The version of the model used to detect segments.
        @[JSON::Field(key: "ModelVersion")]
        getter model_version : String?

        # The type of a segment (technical cue or shot detection).
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @model_version : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The size of the collection exceeds the allowed limit. For more information, see Guidelines and
      # quotas in Amazon Rekognition in the Amazon Rekognition Developer Guide.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Occurs when a given sessionId is not found.
      struct SessionNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a shot detection segment detected in a video. For more information, see
      # SegmentDetection .
      struct ShotSegment
        include JSON::Serializable

        # The confidence that Amazon Rekognition Video has in the accuracy of the detected segment.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # An Identifier for a shot detection segment detected in a video.
        @[JSON::Field(key: "Index")]
        getter index : Int64?

        def initialize(
          @confidence : Float64? = nil,
          @index : Int64? = nil
        )
        end
      end

      # Indicates whether or not the face is smiling, and the confidence level in the determination.
      struct Smile
        include JSON::Serializable

        # Level of confidence in the determination.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # Boolean value that indicates whether the face is smiling or not.
        @[JSON::Field(key: "Value")]
        getter value : Bool?

        def initialize(
          @confidence : Float64? = nil,
          @value : Bool? = nil
        )
        end
      end

      struct StartCelebrityRecognitionRequest
        include JSON::Serializable

        # The video in which you want to recognize celebrities. The video must be stored in an Amazon S3
        # bucket.
        @[JSON::Field(key: "Video")]
        getter video : Types::Video

        # Idempotent token used to identify the start request. If you use the same token with multiple
        # StartCelebrityRecognition requests, the same JobId is returned. Use ClientRequestToken to prevent
        # the same job from being accidently started more than once.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # An identifier you specify that's returned in the completion notification that's published to your
        # Amazon Simple Notification Service topic. For example, you can use JobTag to group related jobs and
        # identify them in the completion notification.
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        # The Amazon SNS topic ARN that you want Amazon Rekognition Video to publish the completion status of
        # the celebrity recognition analysis to. The Amazon SNS topic must have a topic name that begins with
        # AmazonRekognition if you are using the AmazonRekognitionServiceRole permissions policy.
        @[JSON::Field(key: "NotificationChannel")]
        getter notification_channel : Types::NotificationChannel?

        def initialize(
          @video : Types::Video,
          @client_request_token : String? = nil,
          @job_tag : String? = nil,
          @notification_channel : Types::NotificationChannel? = nil
        )
        end
      end

      struct StartCelebrityRecognitionResponse
        include JSON::Serializable

        # The identifier for the celebrity recognition analysis job. Use JobId to identify the job in a
        # subsequent call to GetCelebrityRecognition .
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      struct StartContentModerationRequest
        include JSON::Serializable

        # The video in which you want to detect inappropriate, unwanted, or offensive content. The video must
        # be stored in an Amazon S3 bucket.
        @[JSON::Field(key: "Video")]
        getter video : Types::Video

        # Idempotent token used to identify the start request. If you use the same token with multiple
        # StartContentModeration requests, the same JobId is returned. Use ClientRequestToken to prevent the
        # same job from being accidently started more than once.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # An identifier you specify that's returned in the completion notification that's published to your
        # Amazon Simple Notification Service topic. For example, you can use JobTag to group related jobs and
        # identify them in the completion notification.
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        # Specifies the minimum confidence that Amazon Rekognition must have in order to return a moderated
        # content label. Confidence represents how certain Amazon Rekognition is that the moderated content is
        # correctly identified. 0 is the lowest confidence. 100 is the highest confidence. Amazon Rekognition
        # doesn't return any moderated content labels with a confidence level lower than this specified value.
        # If you don't specify MinConfidence , GetContentModeration returns labels with confidence values
        # greater than or equal to 50 percent.
        @[JSON::Field(key: "MinConfidence")]
        getter min_confidence : Float64?

        # The Amazon SNS topic ARN that you want Amazon Rekognition Video to publish the completion status of
        # the content analysis to. The Amazon SNS topic must have a topic name that begins with
        # AmazonRekognition if you are using the AmazonRekognitionServiceRole permissions policy to access the
        # topic.
        @[JSON::Field(key: "NotificationChannel")]
        getter notification_channel : Types::NotificationChannel?

        def initialize(
          @video : Types::Video,
          @client_request_token : String? = nil,
          @job_tag : String? = nil,
          @min_confidence : Float64? = nil,
          @notification_channel : Types::NotificationChannel? = nil
        )
        end
      end

      struct StartContentModerationResponse
        include JSON::Serializable

        # The identifier for the content analysis job. Use JobId to identify the job in a subsequent call to
        # GetContentModeration .
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      struct StartFaceDetectionRequest
        include JSON::Serializable

        # The video in which you want to detect faces. The video must be stored in an Amazon S3 bucket.
        @[JSON::Field(key: "Video")]
        getter video : Types::Video

        # Idempotent token used to identify the start request. If you use the same token with multiple
        # StartFaceDetection requests, the same JobId is returned. Use ClientRequestToken to prevent the same
        # job from being accidently started more than once.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The face attributes you want returned. DEFAULT - The following subset of facial attributes are
        # returned: BoundingBox, Confidence, Pose, Quality and Landmarks. ALL - All facial attributes are
        # returned.
        @[JSON::Field(key: "FaceAttributes")]
        getter face_attributes : String?

        # An identifier you specify that's returned in the completion notification that's published to your
        # Amazon Simple Notification Service topic. For example, you can use JobTag to group related jobs and
        # identify them in the completion notification.
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        # The ARN of the Amazon SNS topic to which you want Amazon Rekognition Video to publish the completion
        # status of the face detection operation. The Amazon SNS topic must have a topic name that begins with
        # AmazonRekognition if you are using the AmazonRekognitionServiceRole permissions policy.
        @[JSON::Field(key: "NotificationChannel")]
        getter notification_channel : Types::NotificationChannel?

        def initialize(
          @video : Types::Video,
          @client_request_token : String? = nil,
          @face_attributes : String? = nil,
          @job_tag : String? = nil,
          @notification_channel : Types::NotificationChannel? = nil
        )
        end
      end

      struct StartFaceDetectionResponse
        include JSON::Serializable

        # The identifier for the face detection job. Use JobId to identify the job in a subsequent call to
        # GetFaceDetection .
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      struct StartFaceSearchRequest
        include JSON::Serializable

        # ID of the collection that contains the faces you want to search for.
        @[JSON::Field(key: "CollectionId")]
        getter collection_id : String

        # The video you want to search. The video must be stored in an Amazon S3 bucket.
        @[JSON::Field(key: "Video")]
        getter video : Types::Video

        # Idempotent token used to identify the start request. If you use the same token with multiple
        # StartFaceSearch requests, the same JobId is returned. Use ClientRequestToken to prevent the same job
        # from being accidently started more than once.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The minimum confidence in the person match to return. For example, don't return any matches where
        # confidence in matches is less than 70%. The default value is 80%.
        @[JSON::Field(key: "FaceMatchThreshold")]
        getter face_match_threshold : Float64?

        # An identifier you specify that's returned in the completion notification that's published to your
        # Amazon Simple Notification Service topic. For example, you can use JobTag to group related jobs and
        # identify them in the completion notification.
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        # The ARN of the Amazon SNS topic to which you want Amazon Rekognition Video to publish the completion
        # status of the search. The Amazon SNS topic must have a topic name that begins with AmazonRekognition
        # if you are using the AmazonRekognitionServiceRole permissions policy to access the topic.
        @[JSON::Field(key: "NotificationChannel")]
        getter notification_channel : Types::NotificationChannel?

        def initialize(
          @collection_id : String,
          @video : Types::Video,
          @client_request_token : String? = nil,
          @face_match_threshold : Float64? = nil,
          @job_tag : String? = nil,
          @notification_channel : Types::NotificationChannel? = nil
        )
        end
      end

      struct StartFaceSearchResponse
        include JSON::Serializable

        # The identifier for the search job. Use JobId to identify the job in a subsequent call to
        # GetFaceSearch .
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      struct StartLabelDetectionRequest
        include JSON::Serializable

        # The video in which you want to detect labels. The video must be stored in an Amazon S3 bucket.
        @[JSON::Field(key: "Video")]
        getter video : Types::Video

        # Idempotent token used to identify the start request. If you use the same token with multiple
        # StartLabelDetection requests, the same JobId is returned. Use ClientRequestToken to prevent the same
        # job from being accidently started more than once.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The features to return after video analysis. You can specify that GENERAL_LABELS are returned.
        @[JSON::Field(key: "Features")]
        getter features : Array(String)?

        # An identifier you specify that's returned in the completion notification that's published to your
        # Amazon Simple Notification Service topic. For example, you can use JobTag to group related jobs and
        # identify them in the completion notification.
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        # Specifies the minimum confidence that Amazon Rekognition Video must have in order to return a
        # detected label. Confidence represents how certain Amazon Rekognition is that a label is correctly
        # identified.0 is the lowest confidence. 100 is the highest confidence. Amazon Rekognition Video
        # doesn't return any labels with a confidence level lower than this specified value. If you don't
        # specify MinConfidence , the operation returns labels and bounding boxes (if detected) with
        # confidence values greater than or equal to 50 percent.
        @[JSON::Field(key: "MinConfidence")]
        getter min_confidence : Float64?

        # The Amazon SNS topic ARN you want Amazon Rekognition Video to publish the completion status of the
        # label detection operation to. The Amazon SNS topic must have a topic name that begins with
        # AmazonRekognition if you are using the AmazonRekognitionServiceRole permissions policy.
        @[JSON::Field(key: "NotificationChannel")]
        getter notification_channel : Types::NotificationChannel?

        # The settings for a StartLabelDetection request.Contains the specified parameters for the label
        # detection request of an asynchronous label analysis operation. Settings can include filters for
        # GENERAL_LABELS.
        @[JSON::Field(key: "Settings")]
        getter settings : Types::LabelDetectionSettings?

        def initialize(
          @video : Types::Video,
          @client_request_token : String? = nil,
          @features : Array(String)? = nil,
          @job_tag : String? = nil,
          @min_confidence : Float64? = nil,
          @notification_channel : Types::NotificationChannel? = nil,
          @settings : Types::LabelDetectionSettings? = nil
        )
        end
      end

      struct StartLabelDetectionResponse
        include JSON::Serializable

        # The identifier for the label detection job. Use JobId to identify the job in a subsequent call to
        # GetLabelDetection .
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      struct StartMediaAnalysisJobRequest
        include JSON::Serializable

        # Input data to be analyzed by the job.
        @[JSON::Field(key: "Input")]
        getter input : Types::MediaAnalysisInput

        # Configuration options for the media analysis job to be created.
        @[JSON::Field(key: "OperationsConfig")]
        getter operations_config : Types::MediaAnalysisOperationsConfig

        # The Amazon S3 bucket location to store the results.
        @[JSON::Field(key: "OutputConfig")]
        getter output_config : Types::MediaAnalysisOutputConfig

        # Idempotency token used to prevent the accidental creation of duplicate versions. If you use the same
        # token with multiple StartMediaAnalysisJobRequest requests, the same response is returned. Use
        # ClientRequestToken to prevent the same request from being processed more than once.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The name of the job. Does not have to be unique.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # The identifier of customer managed AWS KMS key (name or ARN). The key is used to encrypt images
        # copied into the service. The key is also used to encrypt results and manifest files written to the
        # output Amazon S3 bucket.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @input : Types::MediaAnalysisInput,
          @operations_config : Types::MediaAnalysisOperationsConfig,
          @output_config : Types::MediaAnalysisOutputConfig,
          @client_request_token : String? = nil,
          @job_name : String? = nil,
          @kms_key_id : String? = nil
        )
        end
      end

      struct StartMediaAnalysisJobResponse
        include JSON::Serializable

        # Identifier for the created job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct StartPersonTrackingRequest
        include JSON::Serializable

        # The video in which you want to detect people. The video must be stored in an Amazon S3 bucket.
        @[JSON::Field(key: "Video")]
        getter video : Types::Video

        # Idempotent token used to identify the start request. If you use the same token with multiple
        # StartPersonTracking requests, the same JobId is returned. Use ClientRequestToken to prevent the same
        # job from being accidently started more than once.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # An identifier you specify that's returned in the completion notification that's published to your
        # Amazon Simple Notification Service topic. For example, you can use JobTag to group related jobs and
        # identify them in the completion notification.
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        # The Amazon SNS topic ARN you want Amazon Rekognition Video to publish the completion status of the
        # people detection operation to. The Amazon SNS topic must have a topic name that begins with
        # AmazonRekognition if you are using the AmazonRekognitionServiceRole permissions policy.
        @[JSON::Field(key: "NotificationChannel")]
        getter notification_channel : Types::NotificationChannel?

        def initialize(
          @video : Types::Video,
          @client_request_token : String? = nil,
          @job_tag : String? = nil,
          @notification_channel : Types::NotificationChannel? = nil
        )
        end
      end

      struct StartPersonTrackingResponse
        include JSON::Serializable

        # The identifier for the person detection job. Use JobId to identify the job in a subsequent call to
        # GetPersonTracking .
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      struct StartProjectVersionRequest
        include JSON::Serializable

        # The minimum number of inference units to use. A single inference unit represents 1 hour of
        # processing. Use a higher number to increase the TPS throughput of your model. You are charged for
        # the number of inference units that you use.
        @[JSON::Field(key: "MinInferenceUnits")]
        getter min_inference_units : Int32

        # The Amazon Resource Name(ARN) of the model version that you want to start.
        @[JSON::Field(key: "ProjectVersionArn")]
        getter project_version_arn : String

        # The maximum number of inference units to use for auto-scaling the model. If you don't specify a
        # value, Amazon Rekognition Custom Labels doesn't auto-scale the model.
        @[JSON::Field(key: "MaxInferenceUnits")]
        getter max_inference_units : Int32?

        def initialize(
          @min_inference_units : Int32,
          @project_version_arn : String,
          @max_inference_units : Int32? = nil
        )
        end
      end

      struct StartProjectVersionResponse
        include JSON::Serializable

        # The current running status of the model.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # Filters applied to the technical cue or shot detection segments. For more information, see
      # StartSegmentDetection .
      struct StartSegmentDetectionFilters
        include JSON::Serializable

        # Filters that are specific to shot detections.
        @[JSON::Field(key: "ShotFilter")]
        getter shot_filter : Types::StartShotDetectionFilter?

        # Filters that are specific to technical cues.
        @[JSON::Field(key: "TechnicalCueFilter")]
        getter technical_cue_filter : Types::StartTechnicalCueDetectionFilter?

        def initialize(
          @shot_filter : Types::StartShotDetectionFilter? = nil,
          @technical_cue_filter : Types::StartTechnicalCueDetectionFilter? = nil
        )
        end
      end

      struct StartSegmentDetectionRequest
        include JSON::Serializable

        # An array of segment types to detect in the video. Valid values are TECHNICAL_CUE and SHOT.
        @[JSON::Field(key: "SegmentTypes")]
        getter segment_types : Array(String)

        @[JSON::Field(key: "Video")]
        getter video : Types::Video

        # Idempotent token used to identify the start request. If you use the same token with multiple
        # StartSegmentDetection requests, the same JobId is returned. Use ClientRequestToken to prevent the
        # same job from being accidently started more than once.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Filters for technical cue or shot detection.
        @[JSON::Field(key: "Filters")]
        getter filters : Types::StartSegmentDetectionFilters?

        # An identifier you specify that's returned in the completion notification that's published to your
        # Amazon Simple Notification Service topic. For example, you can use JobTag to group related jobs and
        # identify them in the completion notification.
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        # The ARN of the Amazon SNS topic to which you want Amazon Rekognition Video to publish the completion
        # status of the segment detection operation. Note that the Amazon SNS topic must have a topic name
        # that begins with AmazonRekognition if you are using the AmazonRekognitionServiceRole permissions
        # policy to access the topic.
        @[JSON::Field(key: "NotificationChannel")]
        getter notification_channel : Types::NotificationChannel?

        def initialize(
          @segment_types : Array(String),
          @video : Types::Video,
          @client_request_token : String? = nil,
          @filters : Types::StartSegmentDetectionFilters? = nil,
          @job_tag : String? = nil,
          @notification_channel : Types::NotificationChannel? = nil
        )
        end
      end

      struct StartSegmentDetectionResponse
        include JSON::Serializable

        # Unique identifier for the segment detection job. The JobId is returned from StartSegmentDetection .
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      # Filters for the shot detection segments returned by GetSegmentDetection . For more information, see
      # StartSegmentDetectionFilters .
      struct StartShotDetectionFilter
        include JSON::Serializable

        # Specifies the minimum confidence that Amazon Rekognition Video must have in order to return a
        # detected segment. Confidence represents how certain Amazon Rekognition is that a segment is
        # correctly identified. 0 is the lowest confidence. 100 is the highest confidence. Amazon Rekognition
        # Video doesn't return any segments with a confidence level lower than this specified value. If you
        # don't specify MinSegmentConfidence , the GetSegmentDetection returns segments with confidence values
        # greater than or equal to 50 percent.
        @[JSON::Field(key: "MinSegmentConfidence")]
        getter min_segment_confidence : Float64?

        def initialize(
          @min_segment_confidence : Float64? = nil
        )
        end
      end

      struct StartStreamProcessorRequest
        include JSON::Serializable

        # The name of the stream processor to start processing.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies the starting point in the Kinesis stream to start processing. You can use the producer
        # timestamp or the fragment number. If you use the producer timestamp, you must put the time in
        # milliseconds. For more information about fragment numbers, see Fragment . This is a required
        # parameter for label detection stream processors and should not be used to start a face search stream
        # processor.
        @[JSON::Field(key: "StartSelector")]
        getter start_selector : Types::StreamProcessingStartSelector?

        # Specifies when to stop processing the stream. You can specify a maximum amount of time to process
        # the video. This is a required parameter for label detection stream processors and should not be used
        # to start a face search stream processor.
        @[JSON::Field(key: "StopSelector")]
        getter stop_selector : Types::StreamProcessingStopSelector?

        def initialize(
          @name : String,
          @start_selector : Types::StreamProcessingStartSelector? = nil,
          @stop_selector : Types::StreamProcessingStopSelector? = nil
        )
        end
      end

      struct StartStreamProcessorResponse
        include JSON::Serializable

        # A unique identifier for the stream processing session.
        @[JSON::Field(key: "SessionId")]
        getter session_id : String?

        def initialize(
          @session_id : String? = nil
        )
        end
      end

      # Filters for the technical segments returned by GetSegmentDetection . For more information, see
      # StartSegmentDetectionFilters .
      struct StartTechnicalCueDetectionFilter
        include JSON::Serializable

        # A filter that allows you to control the black frame detection by specifying the black levels and
        # pixel coverage of black pixels in a frame. Videos can come from multiple sources, formats, and time
        # periods, with different standards and varying noise levels for black frames that need to be
        # accounted for.
        @[JSON::Field(key: "BlackFrame")]
        getter black_frame : Types::BlackFrame?

        # Specifies the minimum confidence that Amazon Rekognition Video must have in order to return a
        # detected segment. Confidence represents how certain Amazon Rekognition is that a segment is
        # correctly identified. 0 is the lowest confidence. 100 is the highest confidence. Amazon Rekognition
        # Video doesn't return any segments with a confidence level lower than this specified value. If you
        # don't specify MinSegmentConfidence , GetSegmentDetection returns segments with confidence values
        # greater than or equal to 50 percent.
        @[JSON::Field(key: "MinSegmentConfidence")]
        getter min_segment_confidence : Float64?

        def initialize(
          @black_frame : Types::BlackFrame? = nil,
          @min_segment_confidence : Float64? = nil
        )
        end
      end

      # Set of optional parameters that let you set the criteria text must meet to be included in your
      # response. WordFilter looks at a word's height, width and minimum confidence. RegionOfInterest lets
      # you set a specific region of the screen to look for text in.
      struct StartTextDetectionFilters
        include JSON::Serializable

        # Filter focusing on a certain area of the frame. Uses a BoundingBox object to set the region of the
        # screen.
        @[JSON::Field(key: "RegionsOfInterest")]
        getter regions_of_interest : Array(Types::RegionOfInterest)?

        # Filters focusing on qualities of the text, such as confidence or size.
        @[JSON::Field(key: "WordFilter")]
        getter word_filter : Types::DetectionFilter?

        def initialize(
          @regions_of_interest : Array(Types::RegionOfInterest)? = nil,
          @word_filter : Types::DetectionFilter? = nil
        )
        end
      end

      struct StartTextDetectionRequest
        include JSON::Serializable

        @[JSON::Field(key: "Video")]
        getter video : Types::Video

        # Idempotent token used to identify the start request. If you use the same token with multiple
        # StartTextDetection requests, the same JobId is returned. Use ClientRequestToken to prevent the same
        # job from being accidentaly started more than once.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Optional parameters that let you set criteria the text must meet to be included in your response.
        @[JSON::Field(key: "Filters")]
        getter filters : Types::StartTextDetectionFilters?

        # An identifier returned in the completion status published by your Amazon Simple Notification Service
        # topic. For example, you can use JobTag to group related jobs and identify them in the completion
        # notification.
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        @[JSON::Field(key: "NotificationChannel")]
        getter notification_channel : Types::NotificationChannel?

        def initialize(
          @video : Types::Video,
          @client_request_token : String? = nil,
          @filters : Types::StartTextDetectionFilters? = nil,
          @job_tag : String? = nil,
          @notification_channel : Types::NotificationChannel? = nil
        )
        end
      end

      struct StartTextDetectionResponse
        include JSON::Serializable

        # Identifier for the text detection job. Use JobId to identify the job in a subsequent call to
        # GetTextDetection .
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      struct StopProjectVersionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the model version that you want to stop. This operation requires
        # permissions to perform the rekognition:StopProjectVersion action.
        @[JSON::Field(key: "ProjectVersionArn")]
        getter project_version_arn : String

        def initialize(
          @project_version_arn : String
        )
        end
      end

      struct StopProjectVersionResponse
        include JSON::Serializable

        # The current status of the stop operation.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      struct StopStreamProcessorRequest
        include JSON::Serializable

        # The name of a stream processor created by CreateStreamProcessor .
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct StopStreamProcessorResponse
        include JSON::Serializable

        def initialize
        end
      end

      # This is a required parameter for label detection stream processors and should not be used to start a
      # face search stream processor.
      struct StreamProcessingStartSelector
        include JSON::Serializable

        # Specifies the starting point in the stream to start processing. This can be done with a producer
        # timestamp or a fragment number in a Kinesis stream.
        @[JSON::Field(key: "KVSStreamStartSelector")]
        getter kvs_stream_start_selector : Types::KinesisVideoStreamStartSelector?

        def initialize(
          @kvs_stream_start_selector : Types::KinesisVideoStreamStartSelector? = nil
        )
        end
      end

      # Specifies when to stop processing the stream. You can specify a maximum amount of time to process
      # the video.
      struct StreamProcessingStopSelector
        include JSON::Serializable

        # Specifies the maximum amount of time in seconds that you want the stream to be processed. The
        # largest amount of time is 2 minutes. The default is 10 seconds.
        @[JSON::Field(key: "MaxDurationInSeconds")]
        getter max_duration_in_seconds : Int64?

        def initialize(
          @max_duration_in_seconds : Int64? = nil
        )
        end
      end

      # An object that recognizes faces or labels in a streaming video. An Amazon Rekognition stream
      # processor is created by a call to CreateStreamProcessor . The request parameters for
      # CreateStreamProcessor describe the Kinesis video stream source for the streaming video, face
      # recognition parameters, and where to stream the analysis resullts.
      struct StreamProcessor
        include JSON::Serializable

        # Name of the Amazon Rekognition stream processor.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Current status of the Amazon Rekognition stream processor.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Allows you to opt in or opt out to share data with Rekognition to improve model performance. You can
      # choose this option at the account level or on a per-stream basis. Note that if you opt out at the
      # account level this setting is ignored on individual streams.
      struct StreamProcessorDataSharingPreference
        include JSON::Serializable

        # If this option is set to true, you choose to share data with Rekognition to improve model
        # performance.
        @[JSON::Field(key: "OptIn")]
        getter opt_in : Bool

        def initialize(
          @opt_in : Bool
        )
        end
      end

      # Information about the source streaming video.
      struct StreamProcessorInput
        include JSON::Serializable

        # The Kinesis video stream input stream for the source streaming video.
        @[JSON::Field(key: "KinesisVideoStream")]
        getter kinesis_video_stream : Types::KinesisVideoStream?

        def initialize(
          @kinesis_video_stream : Types::KinesisVideoStream? = nil
        )
        end
      end

      # The Amazon Simple Notification Service topic to which Amazon Rekognition publishes the object
      # detection results and completion status of a video analysis operation. Amazon Rekognition publishes
      # a notification the first time an object of interest or a person is detected in the video stream. For
      # example, if Amazon Rekognition detects a person at second 2, a pet at second 4, and a person again
      # at second 5, Amazon Rekognition sends 2 object class detected notifications, one for a person at
      # second 2 and one for a pet at second 4. Amazon Rekognition also publishes an an end-of-session
      # notification with a summary when the stream processing session is complete.
      struct StreamProcessorNotificationChannel
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the Amazon Amazon Simple Notification Service topic to which
        # Amazon Rekognition posts the completion status.
        @[JSON::Field(key: "SNSTopicArn")]
        getter sns_topic_arn : String

        def initialize(
          @sns_topic_arn : String
        )
        end
      end

      # Information about the Amazon Kinesis Data Streams stream to which a Amazon Rekognition Video stream
      # processor streams the results of a video analysis. For more information, see CreateStreamProcessor
      # in the Amazon Rekognition Developer Guide.
      struct StreamProcessorOutput
        include JSON::Serializable

        # The Amazon Kinesis Data Streams stream to which the Amazon Rekognition stream processor streams the
        # analysis results.
        @[JSON::Field(key: "KinesisDataStream")]
        getter kinesis_data_stream : Types::KinesisDataStream?

        # The Amazon S3 bucket location to which Amazon Rekognition publishes the detailed inference results
        # of a video analysis operation.
        @[JSON::Field(key: "S3Destination")]
        getter s3_destination : Types::S3Destination?

        def initialize(
          @kinesis_data_stream : Types::KinesisDataStream? = nil,
          @s3_destination : Types::S3Destination? = nil
        )
        end
      end

      # Input parameters used in a streaming video analyzed by a Amazon Rekognition stream processor. You
      # can use FaceSearch to recognize faces in a streaming video, or you can use ConnectedHome to detect
      # labels.
      struct StreamProcessorSettings
        include JSON::Serializable

        @[JSON::Field(key: "ConnectedHome")]
        getter connected_home : Types::ConnectedHomeSettings?

        # Face search settings to use on a streaming video.
        @[JSON::Field(key: "FaceSearch")]
        getter face_search : Types::FaceSearchSettings?

        def initialize(
          @connected_home : Types::ConnectedHomeSettings? = nil,
          @face_search : Types::FaceSearchSettings? = nil
        )
        end
      end

      # The stream processor settings that you want to update. ConnectedHome settings can be updated to
      # detect different labels with a different minimum confidence.
      struct StreamProcessorSettingsForUpdate
        include JSON::Serializable

        # The label detection settings you want to use for your stream processor.
        @[JSON::Field(key: "ConnectedHomeForUpdate")]
        getter connected_home_for_update : Types::ConnectedHomeSettingsForUpdate?

        def initialize(
          @connected_home_for_update : Types::ConnectedHomeSettingsForUpdate? = nil
        )
        end
      end

      # The S3 bucket that contains the training summary. The training summary includes aggregated
      # evaluation metrics for the entire testing dataset and metrics for each individual label. You get the
      # training summary S3 bucket location by calling DescribeProjectVersions .
      struct Summary
        include JSON::Serializable

        @[JSON::Field(key: "S3Object")]
        getter s3_object : Types::S3Object?

        def initialize(
          @s3_object : Types::S3Object? = nil
        )
        end
      end

      # Indicates whether or not the face is wearing sunglasses, and the confidence level in the
      # determination.
      struct Sunglasses
        include JSON::Serializable

        # Level of confidence in the determination.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # Boolean value that indicates whether the face is wearing sunglasses or not.
        @[JSON::Field(key: "Value")]
        getter value : Bool?

        def initialize(
          @confidence : Float64? = nil,
          @value : Bool? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the model, collection, or stream processor that you want to assign the
        # tags to.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The key-value tags to assign to the resource.
        @[JSON::Field(key: "Tags")]
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

      # Information about a technical cue segment. For more information, see SegmentDetection .
      struct TechnicalCueSegment
        include JSON::Serializable

        # The confidence that Amazon Rekognition Video has in the accuracy of the detected segment.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The type of the technical cue.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @confidence : Float64? = nil,
          @type : String? = nil
        )
        end
      end

      # The dataset used for testing. Optionally, if AutoCreate is set, Amazon Rekognition uses the training
      # dataset to create a test dataset with a temporary split of the training dataset.
      struct TestingData
        include JSON::Serializable

        # The assets used for testing.
        @[JSON::Field(key: "Assets")]
        getter assets : Array(Types::Asset)?

        # If specified, Rekognition splits training dataset to create a test dataset for the training job.
        @[JSON::Field(key: "AutoCreate")]
        getter auto_create : Bool?

        def initialize(
          @assets : Array(Types::Asset)? = nil,
          @auto_create : Bool? = nil
        )
        end
      end

      # Sagemaker Groundtruth format manifest files for the input, output and validation datasets that are
      # used and created during testing.
      struct TestingDataResult
        include JSON::Serializable

        # The testing dataset that was supplied for training.
        @[JSON::Field(key: "Input")]
        getter input : Types::TestingData?

        # The subset of the dataset that was actually tested. Some images (assets) might not be tested due to
        # file formatting and other issues.
        @[JSON::Field(key: "Output")]
        getter output : Types::TestingData?

        # The location of the data validation manifest. The data validation manifest is created for the test
        # dataset during model training.
        @[JSON::Field(key: "Validation")]
        getter validation : Types::ValidationData?

        def initialize(
          @input : Types::TestingData? = nil,
          @output : Types::TestingData? = nil,
          @validation : Types::ValidationData? = nil
        )
        end
      end

      # Information about a word or line of text detected by DetectText . The DetectedText field contains
      # the text that Amazon Rekognition detected in the image. Every word and line has an identifier ( Id
      # ). Each word belongs to a line and has a parent identifier ( ParentId ) that identifies the line of
      # text in which the word appears. The word Id is also an index for the word within a line of words.
      # For more information, see Detecting text in the Amazon Rekognition Developer Guide.
      struct TextDetection
        include JSON::Serializable

        # The confidence that Amazon Rekognition has in the accuracy of the detected text and the accuracy of
        # the geometry points around the detected text.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The word or line of text recognized by Amazon Rekognition.
        @[JSON::Field(key: "DetectedText")]
        getter detected_text : String?

        # The location of the detected text on the image. Includes an axis aligned coarse bounding box
        # surrounding the text and a finer grain polygon for more accurate spatial information.
        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::Geometry?

        # The identifier for the detected text. The identifier is only unique for a single call to DetectText
        # .
        @[JSON::Field(key: "Id")]
        getter id : Int32?

        # The Parent identifier for the detected text identified by the value of ID . If the type of detected
        # text is LINE , the value of ParentId is Null .
        @[JSON::Field(key: "ParentId")]
        getter parent_id : Int32?

        # The type of text that was detected.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @confidence : Float64? = nil,
          @detected_text : String? = nil,
          @geometry : Types::Geometry? = nil,
          @id : Int32? = nil,
          @parent_id : Int32? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about text detected in a video. Incudes the detected text, the time in milliseconds from
      # the start of the video that the text was detected, and where it was detected on the screen.
      struct TextDetectionResult
        include JSON::Serializable

        # Details about text detected in a video.
        @[JSON::Field(key: "TextDetection")]
        getter text_detection : Types::TextDetection?

        # The time, in milliseconds from the start of the video, that the text was detected. Note that
        # Timestamp is not guaranteed to be accurate to the individual frame where the text first appears.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Int64?

        def initialize(
          @text_detection : Types::TextDetection? = nil,
          @timestamp : Int64? = nil
        )
        end
      end

      # Amazon Rekognition is temporarily unable to process the request. Try your call again.
      struct ThrottlingException
        include JSON::Serializable

        def initialize
        end
      end

      # The dataset used for training.
      struct TrainingData
        include JSON::Serializable

        # A manifest file that contains references to the training images and ground-truth annotations.
        @[JSON::Field(key: "Assets")]
        getter assets : Array(Types::Asset)?

        def initialize(
          @assets : Array(Types::Asset)? = nil
        )
        end
      end

      # The data validation manifest created for the training dataset during model training.
      struct TrainingDataResult
        include JSON::Serializable

        # The training data that you supplied.
        @[JSON::Field(key: "Input")]
        getter input : Types::TrainingData?

        # Reference to images (assets) that were actually used during training with trained model predictions.
        @[JSON::Field(key: "Output")]
        getter output : Types::TrainingData?

        # A manifest that you supplied for training, with validation results for each line.
        @[JSON::Field(key: "Validation")]
        getter validation : Types::ValidationData?

        def initialize(
          @input : Types::TrainingData? = nil,
          @output : Types::TrainingData? = nil,
          @validation : Types::ValidationData? = nil
        )
        end
      end

      # A face that IndexFaces detected, but didn't index. Use the Reasons response attribute to determine
      # why a face wasn't indexed.
      struct UnindexedFace
        include JSON::Serializable

        # The structure that contains attributes of a face that IndexFaces detected, but didn't index.
        @[JSON::Field(key: "FaceDetail")]
        getter face_detail : Types::FaceDetail?

        # An array of reasons that specify why a face wasn't indexed. EXTREME_POSE - The face is at a pose
        # that can't be detected. For example, the head is turned too far away from the camera.
        # EXCEEDS_MAX_FACES - The number of faces detected is already higher than that specified by the
        # MaxFaces input parameter for IndexFaces . LOW_BRIGHTNESS - The image is too dark. LOW_SHARPNESS -
        # The image is too blurry. LOW_CONFIDENCE - The face was detected with a low confidence.
        # SMALL_BOUNDING_BOX - The bounding box around the face is too small.
        @[JSON::Field(key: "Reasons")]
        getter reasons : Array(String)?

        def initialize(
          @face_detail : Types::FaceDetail? = nil,
          @reasons : Array(String)? = nil
        )
        end
      end

      # Face details inferred from the image but not used for search. The response attribute contains
      # reasons for why a face wasn't used for Search.
      struct UnsearchedFace
        include JSON::Serializable

        @[JSON::Field(key: "FaceDetails")]
        getter face_details : Types::FaceDetail?

        # Reasons why a face wasn't used for Search.
        @[JSON::Field(key: "Reasons")]
        getter reasons : Array(String)?

        def initialize(
          @face_details : Types::FaceDetail? = nil,
          @reasons : Array(String)? = nil
        )
        end
      end

      # Contains metadata like FaceId, UserID, and Reasons, for a face that was unsuccessfully associated.
      struct UnsuccessfulFaceAssociation
        include JSON::Serializable

        # Match confidence with the UserID, provides information regarding if a face association was
        # unsuccessful because it didn't meet UserMatchThreshold.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # A unique identifier assigned to the face.
        @[JSON::Field(key: "FaceId")]
        getter face_id : String?

        # The reason why the association was unsuccessful.
        @[JSON::Field(key: "Reasons")]
        getter reasons : Array(String)?

        # A provided ID for the UserID. Unique within the collection.
        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @confidence : Float64? = nil,
          @face_id : String? = nil,
          @reasons : Array(String)? = nil,
          @user_id : String? = nil
        )
        end
      end

      # Contains metadata like FaceId, UserID, and Reasons, for a face that was unsuccessfully deleted.
      struct UnsuccessfulFaceDeletion
        include JSON::Serializable

        # A unique identifier assigned to the face.
        @[JSON::Field(key: "FaceId")]
        getter face_id : String?

        # The reason why the deletion was unsuccessful.
        @[JSON::Field(key: "Reasons")]
        getter reasons : Array(String)?

        # A provided ID for the UserID. Unique within the collection.
        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @face_id : String? = nil,
          @reasons : Array(String)? = nil,
          @user_id : String? = nil
        )
        end
      end

      # Contains metadata like FaceId, UserID, and Reasons, for a face that was unsuccessfully
      # disassociated.
      struct UnsuccessfulFaceDisassociation
        include JSON::Serializable

        # A unique identifier assigned to the face.
        @[JSON::Field(key: "FaceId")]
        getter face_id : String?

        # The reason why the deletion was unsuccessful.
        @[JSON::Field(key: "Reasons")]
        getter reasons : Array(String)?

        # A provided ID for the UserID. Unique within the collection.
        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @face_id : String? = nil,
          @reasons : Array(String)? = nil,
          @user_id : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the model, collection, or stream processor that you want to remove the
        # tags from.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of the tags that you want to remove.
        @[JSON::Field(key: "TagKeys")]
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

      struct UpdateDatasetEntriesRequest
        include JSON::Serializable

        # The changes that you want to make to the dataset.
        @[JSON::Field(key: "Changes")]
        getter changes : Types::DatasetChanges

        # The Amazon Resource Name (ARN) of the dataset that you want to update.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String

        def initialize(
          @changes : Types::DatasetChanges,
          @dataset_arn : String
        )
        end
      end

      struct UpdateDatasetEntriesResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateStreamProcessorRequest
        include JSON::Serializable

        # Name of the stream processor that you want to update.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Shows whether you are sharing data with Rekognition to improve model performance. You can choose
        # this option at the account level or on a per-stream basis. Note that if you opt out at the account
        # level this setting is ignored on individual streams.
        @[JSON::Field(key: "DataSharingPreferenceForUpdate")]
        getter data_sharing_preference_for_update : Types::StreamProcessorDataSharingPreference?

        # A list of parameters you want to delete from the stream processor.
        @[JSON::Field(key: "ParametersToDelete")]
        getter parameters_to_delete : Array(String)?

        # Specifies locations in the frames where Amazon Rekognition checks for objects or people. This is an
        # optional parameter for label detection stream processors.
        @[JSON::Field(key: "RegionsOfInterestForUpdate")]
        getter regions_of_interest_for_update : Array(Types::RegionOfInterest)?

        # The stream processor settings that you want to update. Label detection settings can be updated to
        # detect different labels with a different minimum confidence.
        @[JSON::Field(key: "SettingsForUpdate")]
        getter settings_for_update : Types::StreamProcessorSettingsForUpdate?

        def initialize(
          @name : String,
          @data_sharing_preference_for_update : Types::StreamProcessorDataSharingPreference? = nil,
          @parameters_to_delete : Array(String)? = nil,
          @regions_of_interest_for_update : Array(Types::RegionOfInterest)? = nil,
          @settings_for_update : Types::StreamProcessorSettingsForUpdate? = nil
        )
        end
      end

      struct UpdateStreamProcessorResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Metadata of the user stored in a collection.
      struct User
        include JSON::Serializable

        # A provided ID for the User. Unique within the collection.
        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        # Communicates if the UserID has been updated with latest set of faces to be associated with the
        # UserID.
        @[JSON::Field(key: "UserStatus")]
        getter user_status : String?

        def initialize(
          @user_id : String? = nil,
          @user_status : String? = nil
        )
        end
      end

      # Provides UserID metadata along with the confidence in the match of this UserID with the input face.
      struct UserMatch
        include JSON::Serializable

        # Describes the UserID metadata.
        @[JSON::Field(key: "Similarity")]
        getter similarity : Float64?

        # Confidence in the match of this UserID with the input face.
        @[JSON::Field(key: "User")]
        getter user : Types::MatchedUser?

        def initialize(
          @similarity : Float64? = nil,
          @user : Types::MatchedUser? = nil
        )
        end
      end

      # Contains the Amazon S3 bucket location of the validation data for a model training job. The
      # validation data includes error information for individual JSON Lines in the dataset. For more
      # information, see Debugging a Failed Model Training in the Amazon Rekognition Custom Labels Developer
      # Guide. You get the ValidationData object for the training dataset ( TrainingDataResult ) and the
      # test dataset ( TestingDataResult ) by calling DescribeProjectVersions . The assets array contains a
      # single Asset object. The GroundTruthManifest field of the Asset object contains the S3 bucket
      # location of the validation data.
      struct ValidationData
        include JSON::Serializable

        # The assets that comprise the validation data.
        @[JSON::Field(key: "Assets")]
        getter assets : Array(Types::Asset)?

        def initialize(
          @assets : Array(Types::Asset)? = nil
        )
        end
      end

      # Object specifying the acceptable range of challenge versions.
      struct Versions
        include JSON::Serializable

        # The desired maximum version for the challenge.
        @[JSON::Field(key: "Maximum")]
        getter maximum : String?

        # The desired minimum version for the challenge.
        @[JSON::Field(key: "Minimum")]
        getter minimum : String?

        def initialize(
          @maximum : String? = nil,
          @minimum : String? = nil
        )
        end
      end

      # Video file stored in an Amazon S3 bucket. Amazon Rekognition video start operations such as
      # StartLabelDetection use Video to specify a video for analysis. The supported file formats are .mp4,
      # .mov and .avi.
      struct Video
        include JSON::Serializable

        # The Amazon S3 bucket name and file name for the video.
        @[JSON::Field(key: "S3Object")]
        getter s3_object : Types::S3Object?

        def initialize(
          @s3_object : Types::S3Object? = nil
        )
        end
      end

      # Information about a video that Amazon Rekognition analyzed. Videometadata is returned in every page
      # of paginated responses from a Amazon Rekognition video operation.
      struct VideoMetadata
        include JSON::Serializable

        # Type of compression used in the analyzed video.
        @[JSON::Field(key: "Codec")]
        getter codec : String?

        # A description of the range of luminance values in a video, either LIMITED (16 to 235) or FULL (0 to
        # 255).
        @[JSON::Field(key: "ColorRange")]
        getter color_range : String?

        # Length of the video in milliseconds.
        @[JSON::Field(key: "DurationMillis")]
        getter duration_millis : Int64?

        # Format of the analyzed video. Possible values are MP4, MOV and AVI.
        @[JSON::Field(key: "Format")]
        getter format : String?

        # Vertical pixel dimension of the video.
        @[JSON::Field(key: "FrameHeight")]
        getter frame_height : Int64?

        # Number of frames per second in the video.
        @[JSON::Field(key: "FrameRate")]
        getter frame_rate : Float64?

        # Horizontal pixel dimension of the video.
        @[JSON::Field(key: "FrameWidth")]
        getter frame_width : Int64?

        def initialize(
          @codec : String? = nil,
          @color_range : String? = nil,
          @duration_millis : Int64? = nil,
          @format : String? = nil,
          @frame_height : Int64? = nil,
          @frame_rate : Float64? = nil,
          @frame_width : Int64? = nil
        )
        end
      end

      # The file size or duration of the supplied media is too large. The maximum file size is 10GB. The
      # maximum duration is 6 hours.
      struct VideoTooLargeException
        include JSON::Serializable

        def initialize
        end
      end
    end
  end
end
