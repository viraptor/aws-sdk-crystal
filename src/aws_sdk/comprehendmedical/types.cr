require "json"
require "time"

module AwsSdk
  module ComprehendMedical
    module Types

      # An extracted segment of the text that is an attribute of an entity, or otherwise related to an
      # entity, such as the dosage of a medication taken. It contains information about the attribute such
      # as id, begin and end offset within the input text, and the segment of the input text.

      struct Attribute
        include JSON::Serializable

        # The 0-based character offset in the input text that shows where the attribute begins. The offset
        # returns the UTF-8 code point in the string.

        @[JSON::Field(key: "BeginOffset")]
        getter begin_offset : Int32?

        # The category of attribute.

        @[JSON::Field(key: "Category")]
        getter category : String?

        # The 0-based character offset in the input text that shows where the attribute ends. The offset
        # returns the UTF-8 code point in the string.

        @[JSON::Field(key: "EndOffset")]
        getter end_offset : Int32?

        # The numeric identifier for this attribute. This is a monotonically increasing id unique within this
        # response rather than a global unique identifier.

        @[JSON::Field(key: "Id")]
        getter id : Int32?

        # The level of confidence that Amazon Comprehend Medical has that this attribute is correctly related
        # to this entity.

        @[JSON::Field(key: "RelationshipScore")]
        getter relationship_score : Float64?

        # The type of relationship between the entity and attribute. Type for the relationship is OVERLAP ,
        # indicating that the entity occurred at the same time as the Date_Expression .

        @[JSON::Field(key: "RelationshipType")]
        getter relationship_type : String?

        # The level of confidence that Amazon Comprehend Medical has that the segment of text is correctly
        # recognized as an attribute.

        @[JSON::Field(key: "Score")]
        getter score : Float64?

        # The segment of input text extracted as this attribute.

        @[JSON::Field(key: "Text")]
        getter text : String?

        # Contextual information for this attribute.

        @[JSON::Field(key: "Traits")]
        getter traits : Array(Types::Trait)?

        # The type of attribute.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @begin_offset : Int32? = nil,
          @category : String? = nil,
          @end_offset : Int32? = nil,
          @id : Int32? = nil,
          @relationship_score : Float64? = nil,
          @relationship_type : String? = nil,
          @score : Float64? = nil,
          @text : String? = nil,
          @traits : Array(Types::Trait)? = nil,
          @type : String? = nil
        )
        end
      end

      # The number of characters in the input text to be analyzed.

      struct Characters
        include JSON::Serializable

        # The number of characters present in the input text document as processed by Amazon Comprehend
        # Medical.

        @[JSON::Field(key: "OriginalTextCharacters")]
        getter original_text_characters : Int32?

        def initialize(
          @original_text_characters : Int32? = nil
        )
        end
      end

      # Provides information for filtering a list of detection jobs.

      struct ComprehendMedicalAsyncJobFilter
        include JSON::Serializable

        # Filters on the name of the job.

        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # Filters the list of jobs based on job status. Returns only jobs with the specified status.

        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # Filters the list of jobs based on the time that the job was submitted for processing. Returns only
        # jobs submitted after the specified time. Jobs are returned in descending order, newest to oldest.

        @[JSON::Field(key: "SubmitTimeAfter", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time_after : Time?

        # Filters the list of jobs based on the time that the job was submitted for processing. Returns only
        # jobs submitted before the specified time. Jobs are returned in ascending order, oldest to newest.

        @[JSON::Field(key: "SubmitTimeBefore", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time_before : Time?

        def initialize(
          @job_name : String? = nil,
          @job_status : String? = nil,
          @submit_time_after : Time? = nil,
          @submit_time_before : Time? = nil
        )
        end
      end

      # Provides information about a detection job.

      struct ComprehendMedicalAsyncJobProperties
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that gives Amazon Comprehend Medical read access to your input data.

        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The time that the detection job completed.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The date and time that job metadata is deleted from the server. Output files in your S3 bucket will
        # not be deleted. After the metadata is deleted, the job will no longer appear in the results of the
        # ListEntitiesDetectionV2Job or the ListPHIDetectionJobs operation.

        @[JSON::Field(key: "ExpirationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiration_time : Time?

        # The input data configuration that you supplied when you created the detection job.

        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig?

        # The identifier assigned to the detection job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The name that you assigned to the detection job.

        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # The current status of the detection job. If the status is FAILED , the Message field shows the
        # reason for the failure.

        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # The AWS Key Management Service key, if any, used to encrypt the output files.

        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?

        # The language code of the input documents.

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The path to the file that describes the results of a batch job.

        @[JSON::Field(key: "ManifestFilePath")]
        getter manifest_file_path : String?

        # A description of the status of a job.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The version of the model used to analyze the documents. The version number looks like X.X.X. You can
        # use this information to track the model used for a particular batch of documents.

        @[JSON::Field(key: "ModelVersion")]
        getter model_version : String?

        # The output data configuration that you supplied when you created the detection job.

        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig?

        # The time that the detection job was submitted for processing.

        @[JSON::Field(key: "SubmitTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time : Time?

        def initialize(
          @data_access_role_arn : String? = nil,
          @end_time : Time? = nil,
          @expiration_time : Time? = nil,
          @input_data_config : Types::InputDataConfig? = nil,
          @job_id : String? = nil,
          @job_name : String? = nil,
          @job_status : String? = nil,
          @kms_key : String? = nil,
          @language_code : String? = nil,
          @manifest_file_path : String? = nil,
          @message : String? = nil,
          @model_version : String? = nil,
          @output_data_config : Types::OutputDataConfig? = nil,
          @submit_time : Time? = nil
        )
        end
      end


      struct DescribeEntitiesDetectionV2JobRequest
        include JSON::Serializable

        # The identifier that Amazon Comprehend Medical generated for the job. The StartEntitiesDetectionV2Job
        # operation returns this identifier in its response.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct DescribeEntitiesDetectionV2JobResponse
        include JSON::Serializable

        # An object that contains the properties associated with a detection job.

        @[JSON::Field(key: "ComprehendMedicalAsyncJobProperties")]
        getter comprehend_medical_async_job_properties : Types::ComprehendMedicalAsyncJobProperties?

        def initialize(
          @comprehend_medical_async_job_properties : Types::ComprehendMedicalAsyncJobProperties? = nil
        )
        end
      end


      struct DescribeICD10CMInferenceJobRequest
        include JSON::Serializable

        # The identifier that Amazon Comprehend Medical generated for the job. The StartICD10CMInferenceJob
        # operation returns this identifier in its response.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct DescribeICD10CMInferenceJobResponse
        include JSON::Serializable

        # An object that contains the properties associated with a detection job.

        @[JSON::Field(key: "ComprehendMedicalAsyncJobProperties")]
        getter comprehend_medical_async_job_properties : Types::ComprehendMedicalAsyncJobProperties?

        def initialize(
          @comprehend_medical_async_job_properties : Types::ComprehendMedicalAsyncJobProperties? = nil
        )
        end
      end


      struct DescribePHIDetectionJobRequest
        include JSON::Serializable

        # The identifier that Amazon Comprehend Medical generated for the job. The StartPHIDetectionJob
        # operation returns this identifier in its response.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct DescribePHIDetectionJobResponse
        include JSON::Serializable

        # An object that contains the properties associated with a detection job.

        @[JSON::Field(key: "ComprehendMedicalAsyncJobProperties")]
        getter comprehend_medical_async_job_properties : Types::ComprehendMedicalAsyncJobProperties?

        def initialize(
          @comprehend_medical_async_job_properties : Types::ComprehendMedicalAsyncJobProperties? = nil
        )
        end
      end


      struct DescribeRxNormInferenceJobRequest
        include JSON::Serializable

        # The identifier that Amazon Comprehend Medical generated for the job. The StartRxNormInferenceJob
        # operation returns this identifier in its response.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct DescribeRxNormInferenceJobResponse
        include JSON::Serializable

        # An object that contains the properties associated with a detection job.

        @[JSON::Field(key: "ComprehendMedicalAsyncJobProperties")]
        getter comprehend_medical_async_job_properties : Types::ComprehendMedicalAsyncJobProperties?

        def initialize(
          @comprehend_medical_async_job_properties : Types::ComprehendMedicalAsyncJobProperties? = nil
        )
        end
      end


      struct DescribeSNOMEDCTInferenceJobRequest
        include JSON::Serializable

        # The identifier that Amazon Comprehend Medical generated for the job. The StartSNOMEDCTInferenceJob
        # operation returns this identifier in its response.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct DescribeSNOMEDCTInferenceJobResponse
        include JSON::Serializable


        @[JSON::Field(key: "ComprehendMedicalAsyncJobProperties")]
        getter comprehend_medical_async_job_properties : Types::ComprehendMedicalAsyncJobProperties?

        def initialize(
          @comprehend_medical_async_job_properties : Types::ComprehendMedicalAsyncJobProperties? = nil
        )
        end
      end


      struct DetectEntitiesRequest
        include JSON::Serializable

        # A UTF-8 text string containing the clinical content being examined for entities.

        @[JSON::Field(key: "Text")]
        getter text : String

        def initialize(
          @text : String
        )
        end
      end


      struct DetectEntitiesResponse
        include JSON::Serializable

        # The collection of medical entities extracted from the input text and their associated information.
        # For each entity, the response provides the entity text, the entity category, where the entity text
        # begins and ends, and the level of confidence that Amazon Comprehend Medical has in the detection and
        # analysis. Attributes and traits of the entity are also returned.

        @[JSON::Field(key: "Entities")]
        getter entities : Array(Types::Entity)

        # The version of the model used to analyze the documents. The version number looks like X.X.X. You can
        # use this information to track the model used for a particular batch of documents.

        @[JSON::Field(key: "ModelVersion")]
        getter model_version : String

        # If the result of the previous request to DetectEntities was truncated, include the PaginationToken
        # to fetch the next page of entities.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        # Attributes extracted from the input text that we were unable to relate to an entity.

        @[JSON::Field(key: "UnmappedAttributes")]
        getter unmapped_attributes : Array(Types::UnmappedAttribute)?

        def initialize(
          @entities : Array(Types::Entity),
          @model_version : String,
          @pagination_token : String? = nil,
          @unmapped_attributes : Array(Types::UnmappedAttribute)? = nil
        )
        end
      end


      struct DetectEntitiesV2Request
        include JSON::Serializable

        # A UTF-8 string containing the clinical content being examined for entities.

        @[JSON::Field(key: "Text")]
        getter text : String

        def initialize(
          @text : String
        )
        end
      end


      struct DetectEntitiesV2Response
        include JSON::Serializable

        # The collection of medical entities extracted from the input text and their associated information.
        # For each entity, the response provides the entity text, the entity category, where the entity text
        # begins and ends, and the level of confidence in the detection and analysis. Attributes and traits of
        # the entity are also returned.

        @[JSON::Field(key: "Entities")]
        getter entities : Array(Types::Entity)

        # The version of the model used to analyze the documents. The version number looks like X.X.X. You can
        # use this information to track the model used for a particular batch of documents.

        @[JSON::Field(key: "ModelVersion")]
        getter model_version : String

        # If the result to the DetectEntitiesV2 operation was truncated, include the PaginationToken to fetch
        # the next page of entities.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        # Attributes extracted from the input text that couldn't be related to an entity.

        @[JSON::Field(key: "UnmappedAttributes")]
        getter unmapped_attributes : Array(Types::UnmappedAttribute)?

        def initialize(
          @entities : Array(Types::Entity),
          @model_version : String,
          @pagination_token : String? = nil,
          @unmapped_attributes : Array(Types::UnmappedAttribute)? = nil
        )
        end
      end


      struct DetectPHIRequest
        include JSON::Serializable

        # A UTF-8 text string containing the clinical content being examined for PHI entities.

        @[JSON::Field(key: "Text")]
        getter text : String

        def initialize(
          @text : String
        )
        end
      end


      struct DetectPHIResponse
        include JSON::Serializable

        # The collection of PHI entities extracted from the input text and their associated information. For
        # each entity, the response provides the entity text, the entity category, where the entity text
        # begins and ends, and the level of confidence that Amazon Comprehend Medical has in its detection.

        @[JSON::Field(key: "Entities")]
        getter entities : Array(Types::Entity)

        # The version of the model used to analyze the documents. The version number looks like X.X.X. You can
        # use this information to track the model used for a particular batch of documents.

        @[JSON::Field(key: "ModelVersion")]
        getter model_version : String

        # If the result of the previous request to DetectPHI was truncated, include the PaginationToken to
        # fetch the next page of PHI entities.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        def initialize(
          @entities : Array(Types::Entity),
          @model_version : String,
          @pagination_token : String? = nil
        )
        end
      end

      # Provides information about an extracted medical entity.

      struct Entity
        include JSON::Serializable

        # The extracted attributes that relate to this entity.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::Attribute)?

        # The 0-based character offset in the input text that shows where the entity begins. The offset
        # returns the UTF-8 code point in the string.

        @[JSON::Field(key: "BeginOffset")]
        getter begin_offset : Int32?

        # The category of the entity.

        @[JSON::Field(key: "Category")]
        getter category : String?

        # The 0-based character offset in the input text that shows where the entity ends. The offset returns
        # the UTF-8 code point in the string.

        @[JSON::Field(key: "EndOffset")]
        getter end_offset : Int32?

        # The numeric identifier for the entity. This is a monotonically increasing id unique within this
        # response rather than a global unique identifier.

        @[JSON::Field(key: "Id")]
        getter id : Int32?

        # The level of confidence that Amazon Comprehend Medical has in the accuracy of the detection.

        @[JSON::Field(key: "Score")]
        getter score : Float64?

        # The segment of input text extracted as this entity.

        @[JSON::Field(key: "Text")]
        getter text : String?

        # Contextual information for the entity.

        @[JSON::Field(key: "Traits")]
        getter traits : Array(Types::Trait)?

        # Describes the specific type of entity with category of entities.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @attributes : Array(Types::Attribute)? = nil,
          @begin_offset : Int32? = nil,
          @category : String? = nil,
          @end_offset : Int32? = nil,
          @id : Int32? = nil,
          @score : Float64? = nil,
          @text : String? = nil,
          @traits : Array(Types::Trait)? = nil,
          @type : String? = nil
        )
        end
      end

      # The detected attributes that relate to an entity. This includes an extracted segment of the text
      # that is an attribute of an entity, or otherwise related to an entity. InferICD10CM detects the
      # following attributes: Direction , System, Organ or Site , and Acuity .

      struct ICD10CMAttribute
        include JSON::Serializable

        # The 0-based character offset in the input text that shows where the attribute begins. The offset
        # returns the UTF-8 code point in the string.

        @[JSON::Field(key: "BeginOffset")]
        getter begin_offset : Int32?

        # The category of attribute. Can be either of DX_NAME or TIME_EXPRESSION .

        @[JSON::Field(key: "Category")]
        getter category : String?

        # The 0-based character offset in the input text that shows where the attribute ends. The offset
        # returns the UTF-8 code point in the string.

        @[JSON::Field(key: "EndOffset")]
        getter end_offset : Int32?

        # The numeric identifier for this attribute. This is a monotonically increasing id unique within this
        # response rather than a global unique identifier.

        @[JSON::Field(key: "Id")]
        getter id : Int32?

        # The level of confidence that Amazon Comprehend Medical has that this attribute is correctly related
        # to this entity.

        @[JSON::Field(key: "RelationshipScore")]
        getter relationship_score : Float64?

        # The type of relationship between the entity and attribute. Type for the relationship can be either
        # of OVERLAP or SYSTEM_ORGAN_SITE .

        @[JSON::Field(key: "RelationshipType")]
        getter relationship_type : String?

        # The level of confidence that Amazon Comprehend Medical has that the segment of text is correctly
        # recognized as an attribute.

        @[JSON::Field(key: "Score")]
        getter score : Float64?

        # The segment of input text which contains the detected attribute.

        @[JSON::Field(key: "Text")]
        getter text : String?

        # The contextual information for the attribute. The traits recognized by InferICD10CM are DIAGNOSIS ,
        # SIGN , SYMPTOM , and NEGATION .

        @[JSON::Field(key: "Traits")]
        getter traits : Array(Types::ICD10CMTrait)?

        # The type of attribute. InferICD10CM detects entities of the type DX_NAME .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @begin_offset : Int32? = nil,
          @category : String? = nil,
          @end_offset : Int32? = nil,
          @id : Int32? = nil,
          @relationship_score : Float64? = nil,
          @relationship_type : String? = nil,
          @score : Float64? = nil,
          @text : String? = nil,
          @traits : Array(Types::ICD10CMTrait)? = nil,
          @type : String? = nil
        )
        end
      end

      # The ICD-10-CM concepts that the entity could refer to, along with a score indicating the likelihood
      # of the match.

      struct ICD10CMConcept
        include JSON::Serializable

        # The ICD-10-CM code that identifies the concept found in the knowledge base from the Centers for
        # Disease Control.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # The long description of the ICD-10-CM code in the ontology.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The level of confidence that Amazon Comprehend Medical has that the entity is accurately linked to
        # an ICD-10-CM concept.

        @[JSON::Field(key: "Score")]
        getter score : Float64?

        def initialize(
          @code : String? = nil,
          @description : String? = nil,
          @score : Float64? = nil
        )
        end
      end

      # The collection of medical entities extracted from the input text and their associated information.
      # For each entity, the response provides the entity text, the entity category, where the entity text
      # begins and ends, and the level of confidence that Amazon Comprehend Medical has in the detection and
      # analysis. Attributes and traits of the entity are also returned.

      struct ICD10CMEntity
        include JSON::Serializable

        # The detected attributes that relate to the entity. An extracted segment of the text that is an
        # attribute of an entity, or otherwise related to an entity, such as the nature of a medical
        # condition.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::ICD10CMAttribute)?

        # The 0-based character offset in the input text that shows where the entity begins. The offset
        # returns the UTF-8 code point in the string.

        @[JSON::Field(key: "BeginOffset")]
        getter begin_offset : Int32?

        # The category of the entity. InferICD10CM detects entities in the MEDICAL_CONDITION category.

        @[JSON::Field(key: "Category")]
        getter category : String?

        # The 0-based character offset in the input text that shows where the entity ends. The offset returns
        # the UTF-8 code point in the string.

        @[JSON::Field(key: "EndOffset")]
        getter end_offset : Int32?

        # The ICD-10-CM concepts that the entity could refer to, along with a score indicating the likelihood
        # of the match.

        @[JSON::Field(key: "ICD10CMConcepts")]
        getter icd10_cm_concepts : Array(Types::ICD10CMConcept)?

        # The numeric identifier for the entity. This is a monotonically increasing id unique within this
        # response rather than a global unique identifier.

        @[JSON::Field(key: "Id")]
        getter id : Int32?

        # The level of confidence that Amazon Comprehend Medical has in the accuracy of the detection.

        @[JSON::Field(key: "Score")]
        getter score : Float64?

        # The segment of input text that is matched to the detected entity.

        @[JSON::Field(key: "Text")]
        getter text : String?

        # Provides Contextual information for the entity. The traits recognized by InferICD10CM are DIAGNOSIS
        # , SIGN , SYMPTOM , and NEGATION.

        @[JSON::Field(key: "Traits")]
        getter traits : Array(Types::ICD10CMTrait)?

        # Describes the specific type of entity with category of entities. InferICD10CM detects entities of
        # the type DX_NAME and TIME_EXPRESSION .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @attributes : Array(Types::ICD10CMAttribute)? = nil,
          @begin_offset : Int32? = nil,
          @category : String? = nil,
          @end_offset : Int32? = nil,
          @icd10_cm_concepts : Array(Types::ICD10CMConcept)? = nil,
          @id : Int32? = nil,
          @score : Float64? = nil,
          @text : String? = nil,
          @traits : Array(Types::ICD10CMTrait)? = nil,
          @type : String? = nil
        )
        end
      end

      # Contextual information for the entity. The traits recognized by InferICD10CM are DIAGNOSIS , SIGN ,
      # SYMPTOM , and NEGATION .

      struct ICD10CMTrait
        include JSON::Serializable

        # Provides a name or contextual description about the trait.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The level of confidence that Amazon Comprehend Medical has that the segment of text is correctly
        # recognized as a trait.

        @[JSON::Field(key: "Score")]
        getter score : Float64?

        def initialize(
          @name : String? = nil,
          @score : Float64? = nil
        )
        end
      end


      struct InferICD10CMRequest
        include JSON::Serializable

        # The input text used for analysis.

        @[JSON::Field(key: "Text")]
        getter text : String

        def initialize(
          @text : String
        )
        end
      end


      struct InferICD10CMResponse
        include JSON::Serializable

        # The medical conditions detected in the text linked to ICD-10-CM concepts. If the action is
        # successful, the service sends back an HTTP 200 response, as well as the entities detected.

        @[JSON::Field(key: "Entities")]
        getter entities : Array(Types::ICD10CMEntity)

        # The version of the model used to analyze the documents, in the format n . n . n You can use this
        # information to track the model used for a particular batch of documents.

        @[JSON::Field(key: "ModelVersion")]
        getter model_version : String?

        # If the result of the previous request to InferICD10CM was truncated, include the PaginationToken to
        # fetch the next page of medical condition entities.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        def initialize(
          @entities : Array(Types::ICD10CMEntity),
          @model_version : String? = nil,
          @pagination_token : String? = nil
        )
        end
      end


      struct InferRxNormRequest
        include JSON::Serializable

        # The input text used for analysis.

        @[JSON::Field(key: "Text")]
        getter text : String

        def initialize(
          @text : String
        )
        end
      end


      struct InferRxNormResponse
        include JSON::Serializable

        # The medication entities detected in the text linked to RxNorm concepts. If the action is successful,
        # the service sends back an HTTP 200 response, as well as the entities detected.

        @[JSON::Field(key: "Entities")]
        getter entities : Array(Types::RxNormEntity)

        # The version of the model used to analyze the documents, in the format n . n . n You can use this
        # information to track the model used for a particular batch of documents.

        @[JSON::Field(key: "ModelVersion")]
        getter model_version : String?

        # If the result of the previous request to InferRxNorm was truncated, include the PaginationToken to
        # fetch the next page of medication entities.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        def initialize(
          @entities : Array(Types::RxNormEntity),
          @model_version : String? = nil,
          @pagination_token : String? = nil
        )
        end
      end


      struct InferSNOMEDCTRequest
        include JSON::Serializable

        # The input text to be analyzed using InferSNOMEDCT.

        @[JSON::Field(key: "Text")]
        getter text : String

        def initialize(
          @text : String
        )
        end
      end


      struct InferSNOMEDCTResponse
        include JSON::Serializable

        # The collection of medical concept entities extracted from the input text and their associated
        # information. For each entity, the response provides the entity text, the entity category, where the
        # entity text begins and ends, and the level of confidence that Amazon Comprehend Medical has in the
        # detection and analysis. Attributes and traits of the entity are also returned.

        @[JSON::Field(key: "Entities")]
        getter entities : Array(Types::SNOMEDCTEntity)

        # The number of characters in the input request documentation.

        @[JSON::Field(key: "Characters")]
        getter characters : Types::Characters?

        # The version of the model used to analyze the documents, in the format n.n.n You can use this
        # information to track the model used for a particular batch of documents.

        @[JSON::Field(key: "ModelVersion")]
        getter model_version : String?

        # If the result of the request is truncated, the pagination token can be used to fetch the next page
        # of entities.

        @[JSON::Field(key: "PaginationToken")]
        getter pagination_token : String?

        # The details of the SNOMED-CT revision, including the edition, language, and version date.

        @[JSON::Field(key: "SNOMEDCTDetails")]
        getter snomedct_details : Types::SNOMEDCTDetails?

        def initialize(
          @entities : Array(Types::SNOMEDCTEntity),
          @characters : Types::Characters? = nil,
          @model_version : String? = nil,
          @pagination_token : String? = nil,
          @snomedct_details : Types::SNOMEDCTDetails? = nil
        )
        end
      end

      # The input properties for an entities detection job. This includes the name of the S3 bucket and the
      # path to the files to be analyzed.

      struct InputDataConfig
        include JSON::Serializable

        # The URI of the S3 bucket that contains the input data. The bucket must be in the same region as the
        # API endpoint that you are calling.

        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String

        # The path to the input data files in the S3 bucket.

        @[JSON::Field(key: "S3Key")]
        getter s3_key : String?

        def initialize(
          @s3_bucket : String,
          @s3_key : String? = nil
        )
        end
      end

      # An internal server error occurred. Retry your request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The input text was not in valid UTF-8 character encoding. Check your text then retry your request.

      struct InvalidEncodingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request that you made is invalid. Check your request to determine why it's invalid and then
      # retry the request.

      struct InvalidRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListEntitiesDetectionV2JobsRequest
        include JSON::Serializable

        # Filters the jobs that are returned. You can filter jobs based on their names, status, or the date
        # and time that they were submitted. You can only set one filter at a time.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::ComprehendMedicalAsyncJobFilter?

        # The maximum number of results to return in each page. The default is 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::ComprehendMedicalAsyncJobFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEntitiesDetectionV2JobsResponse
        include JSON::Serializable

        # A list containing the properties of each job returned.

        @[JSON::Field(key: "ComprehendMedicalAsyncJobPropertiesList")]
        getter comprehend_medical_async_job_properties_list : Array(Types::ComprehendMedicalAsyncJobProperties)?

        # Identifies the next page of results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @comprehend_medical_async_job_properties_list : Array(Types::ComprehendMedicalAsyncJobProperties)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListICD10CMInferenceJobsRequest
        include JSON::Serializable

        # Filters the jobs that are returned. You can filter jobs based on their names, status, or the date
        # and time that they were submitted. You can only set one filter at a time.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::ComprehendMedicalAsyncJobFilter?

        # The maximum number of results to return in each page. The default is 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::ComprehendMedicalAsyncJobFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListICD10CMInferenceJobsResponse
        include JSON::Serializable

        # A list containing the properties of each job that is returned.

        @[JSON::Field(key: "ComprehendMedicalAsyncJobPropertiesList")]
        getter comprehend_medical_async_job_properties_list : Array(Types::ComprehendMedicalAsyncJobProperties)?

        # Identifies the next page of results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @comprehend_medical_async_job_properties_list : Array(Types::ComprehendMedicalAsyncJobProperties)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPHIDetectionJobsRequest
        include JSON::Serializable

        # Filters the jobs that are returned. You can filter jobs based on their names, status, or the date
        # and time that they were submitted. You can only set one filter at a time.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::ComprehendMedicalAsyncJobFilter?

        # The maximum number of results to return in each page. The default is 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::ComprehendMedicalAsyncJobFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPHIDetectionJobsResponse
        include JSON::Serializable

        # A list containing the properties of each job returned.

        @[JSON::Field(key: "ComprehendMedicalAsyncJobPropertiesList")]
        getter comprehend_medical_async_job_properties_list : Array(Types::ComprehendMedicalAsyncJobProperties)?

        # Identifies the next page of results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @comprehend_medical_async_job_properties_list : Array(Types::ComprehendMedicalAsyncJobProperties)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRxNormInferenceJobsRequest
        include JSON::Serializable

        # Filters the jobs that are returned. You can filter jobs based on their names, status, or the date
        # and time that they were submitted. You can only set one filter at a time.

        @[JSON::Field(key: "Filter")]
        getter filter : Types::ComprehendMedicalAsyncJobFilter?

        # Identifies the next page of results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::ComprehendMedicalAsyncJobFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRxNormInferenceJobsResponse
        include JSON::Serializable

        # The maximum number of results to return in each page. The default is 100.

        @[JSON::Field(key: "ComprehendMedicalAsyncJobPropertiesList")]
        getter comprehend_medical_async_job_properties_list : Array(Types::ComprehendMedicalAsyncJobProperties)?

        # Identifies the next page of results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @comprehend_medical_async_job_properties_list : Array(Types::ComprehendMedicalAsyncJobProperties)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSNOMEDCTInferenceJobsRequest
        include JSON::Serializable


        @[JSON::Field(key: "Filter")]
        getter filter : Types::ComprehendMedicalAsyncJobFilter?

        # The maximum number of results to return in each page. The default is 100.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of InferSNOMEDCT results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::ComprehendMedicalAsyncJobFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSNOMEDCTInferenceJobsResponse
        include JSON::Serializable

        # A list containing the properties of each job that is returned.

        @[JSON::Field(key: "ComprehendMedicalAsyncJobPropertiesList")]
        getter comprehend_medical_async_job_properties_list : Array(Types::ComprehendMedicalAsyncJobProperties)?

        # Identifies the next page of results to return.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @comprehend_medical_async_job_properties_list : Array(Types::ComprehendMedicalAsyncJobProperties)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The output properties for a detection job.

      struct OutputDataConfig
        include JSON::Serializable

        # When you use the OutputDataConfig object with asynchronous operations, you specify the Amazon S3
        # location where you want to write the output data. The URI must be in the same region as the API
        # endpoint that you are calling. The location is used as the prefix for the actual location of the
        # output.

        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String

        # The path to the output data files in the S3 bucket. Amazon Comprehend Medical creates an output
        # directory using the job ID so that the output from one job does not overwrite the output of another.

        @[JSON::Field(key: "S3Key")]
        getter s3_key : String?

        def initialize(
          @s3_bucket : String,
          @s3_key : String? = nil
        )
        end
      end

      # The resource identified by the specified Amazon Resource Name (ARN) was not found. Check the ARN and
      # try your request again.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The extracted attributes that relate to this entity. The attributes recognized by InferRxNorm are
      # DOSAGE , DURATION , FORM , FREQUENCY , RATE , ROUTE_OR_MODE .

      struct RxNormAttribute
        include JSON::Serializable

        # The 0-based character offset in the input text that shows where the attribute begins. The offset
        # returns the UTF-8 code point in the string.

        @[JSON::Field(key: "BeginOffset")]
        getter begin_offset : Int32?

        # The 0-based character offset in the input text that shows where the attribute ends. The offset
        # returns the UTF-8 code point in the string.

        @[JSON::Field(key: "EndOffset")]
        getter end_offset : Int32?

        # The numeric identifier for this attribute. This is a monotonically increasing id unique within this
        # response rather than a global unique identifier.

        @[JSON::Field(key: "Id")]
        getter id : Int32?

        # The level of confidence that Amazon Comprehend Medical has that the attribute is accurately linked
        # to an entity.

        @[JSON::Field(key: "RelationshipScore")]
        getter relationship_score : Float64?

        # The level of confidence that Amazon Comprehend Medical has that the segment of text is correctly
        # recognized as an attribute.

        @[JSON::Field(key: "Score")]
        getter score : Float64?

        # The segment of input text which corresponds to the detected attribute.

        @[JSON::Field(key: "Text")]
        getter text : String?

        # Contextual information for the attribute. InferRxNorm recognizes the trait NEGATION for attributes,
        # i.e. that the patient is not taking a specific dose or form of a medication.

        @[JSON::Field(key: "Traits")]
        getter traits : Array(Types::RxNormTrait)?

        # The type of attribute. The types of attributes recognized by InferRxNorm are BRAND_NAME and
        # GENERIC_NAME .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @begin_offset : Int32? = nil,
          @end_offset : Int32? = nil,
          @id : Int32? = nil,
          @relationship_score : Float64? = nil,
          @score : Float64? = nil,
          @text : String? = nil,
          @traits : Array(Types::RxNormTrait)? = nil,
          @type : String? = nil
        )
        end
      end

      # The RxNorm concept that the entity could refer to, along with a score indicating the likelihood of
      # the match.

      struct RxNormConcept
        include JSON::Serializable

        # RxNorm concept ID, also known as the RxCUI.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # The description of the RxNorm concept.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The level of confidence that Amazon Comprehend Medical has that the entity is accurately linked to
        # the reported RxNorm concept.

        @[JSON::Field(key: "Score")]
        getter score : Float64?

        def initialize(
          @code : String? = nil,
          @description : String? = nil,
          @score : Float64? = nil
        )
        end
      end

      # The collection of medical entities extracted from the input text and their associated information.
      # For each entity, the response provides the entity text, the entity category, where the entity text
      # begins and ends, and the level of confidence that Amazon Comprehend Medical has in the detection and
      # analysis. Attributes and traits of the entity are also returned.

      struct RxNormEntity
        include JSON::Serializable

        # The extracted attributes that relate to the entity. The attributes recognized by InferRxNorm are
        # DOSAGE , DURATION , FORM , FREQUENCY , RATE , ROUTE_OR_MODE , and STRENGTH .

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::RxNormAttribute)?

        # The 0-based character offset in the input text that shows where the entity begins. The offset
        # returns the UTF-8 code point in the string.

        @[JSON::Field(key: "BeginOffset")]
        getter begin_offset : Int32?

        # The category of the entity. The recognized categories are GENERIC or BRAND_NAME .

        @[JSON::Field(key: "Category")]
        getter category : String?

        # The 0-based character offset in the input text that shows where the entity ends. The offset returns
        # the UTF-8 code point in the string.

        @[JSON::Field(key: "EndOffset")]
        getter end_offset : Int32?

        # The numeric identifier for the entity. This is a monotonically increasing id unique within this
        # response rather than a global unique identifier.

        @[JSON::Field(key: "Id")]
        getter id : Int32?

        # The RxNorm concepts that the entity could refer to, along with a score indicating the likelihood of
        # the match.

        @[JSON::Field(key: "RxNormConcepts")]
        getter rx_norm_concepts : Array(Types::RxNormConcept)?

        # The level of confidence that Amazon Comprehend Medical has in the accuracy of the detected entity.

        @[JSON::Field(key: "Score")]
        getter score : Float64?

        # The segment of input text extracted from which the entity was detected.

        @[JSON::Field(key: "Text")]
        getter text : String?

        # Contextual information for the entity.

        @[JSON::Field(key: "Traits")]
        getter traits : Array(Types::RxNormTrait)?

        # Describes the specific type of entity. For InferRxNorm, the recognized entity type is MEDICATION .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @attributes : Array(Types::RxNormAttribute)? = nil,
          @begin_offset : Int32? = nil,
          @category : String? = nil,
          @end_offset : Int32? = nil,
          @id : Int32? = nil,
          @rx_norm_concepts : Array(Types::RxNormConcept)? = nil,
          @score : Float64? = nil,
          @text : String? = nil,
          @traits : Array(Types::RxNormTrait)? = nil,
          @type : String? = nil
        )
        end
      end

      # The contextual information for the entity. InferRxNorm recognizes the trait NEGATION , which is any
      # indication that the patient is not taking a medication.

      struct RxNormTrait
        include JSON::Serializable

        # Provides a name or contextual description about the trait.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The level of confidence that Amazon Comprehend Medical has in the accuracy of the detected trait.

        @[JSON::Field(key: "Score")]
        getter score : Float64?

        def initialize(
          @name : String? = nil,
          @score : Float64? = nil
        )
        end
      end

      # The extracted attributes that relate to an entity. An extracted segment of the text that is an
      # attribute of an entity, or otherwise related to an entity, such as the dosage of a medication taken.

      struct SNOMEDCTAttribute
        include JSON::Serializable

        # The 0-based character offset in the input text that shows where the attribute begins. The offset
        # returns the UTF-8 code point in the string.

        @[JSON::Field(key: "BeginOffset")]
        getter begin_offset : Int32?

        # The category of the detected attribute. Possible categories include MEDICAL_CONDITION, ANATOMY, and
        # TEST_TREATMENT_PROCEDURE.

        @[JSON::Field(key: "Category")]
        getter category : String?

        # The 0-based character offset in the input text that shows where the attribute ends. The offset
        # returns the UTF-8 code point in the string.

        @[JSON::Field(key: "EndOffset")]
        getter end_offset : Int32?

        # The numeric identifier for this attribute. This is a monotonically increasing id unique within this
        # response rather than a global unique identifier.

        @[JSON::Field(key: "Id")]
        getter id : Int32?

        # The level of confidence that Amazon Comprehend Medical has that this attribute is correctly related
        # to this entity.

        @[JSON::Field(key: "RelationshipScore")]
        getter relationship_score : Float64?

        # The type of relationship that exists between the entity and the related attribute.

        @[JSON::Field(key: "RelationshipType")]
        getter relationship_type : String?

        # The SNOMED-CT concepts specific to an attribute, along with a score indicating the likelihood of the
        # match.

        @[JSON::Field(key: "SNOMEDCTConcepts")]
        getter snomedct_concepts : Array(Types::SNOMEDCTConcept)?

        # The level of confidence that Amazon Comprehend Medical has that the segment of text is correctly
        # recognized as an attribute.

        @[JSON::Field(key: "Score")]
        getter score : Float64?

        # The segment of input text extracted as this attribute.

        @[JSON::Field(key: "Text")]
        getter text : String?

        # Contextual information for an attribute. Examples include signs, symptoms, diagnosis, and negation.

        @[JSON::Field(key: "Traits")]
        getter traits : Array(Types::SNOMEDCTTrait)?

        # The type of attribute. Possible types include DX_NAME, ACUITY, DIRECTION,
        # SYSTEM_ORGAN_SITE,TEST_NAME, TEST_VALUE, TEST_UNIT, PROCEDURE_NAME, and TREATMENT_NAME.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @begin_offset : Int32? = nil,
          @category : String? = nil,
          @end_offset : Int32? = nil,
          @id : Int32? = nil,
          @relationship_score : Float64? = nil,
          @relationship_type : String? = nil,
          @snomedct_concepts : Array(Types::SNOMEDCTConcept)? = nil,
          @score : Float64? = nil,
          @text : String? = nil,
          @traits : Array(Types::SNOMEDCTTrait)? = nil,
          @type : String? = nil
        )
        end
      end

      # The SNOMED-CT concepts that the entity could refer to, along with a score indicating the likelihood
      # of the match.

      struct SNOMEDCTConcept
        include JSON::Serializable

        # The numeric ID for the SNOMED-CT concept.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # The description of the SNOMED-CT concept.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The level of confidence Amazon Comprehend Medical has that the entity should be linked to the
        # identified SNOMED-CT concept.

        @[JSON::Field(key: "Score")]
        getter score : Float64?

        def initialize(
          @code : String? = nil,
          @description : String? = nil,
          @score : Float64? = nil
        )
        end
      end

      # The information about the revision of the SNOMED-CT ontology in the response. Specifically, the
      # details include the SNOMED-CT edition, language, and version date.

      struct SNOMEDCTDetails
        include JSON::Serializable

        # The edition of SNOMED-CT used. The edition used for the InferSNOMEDCT editions is the US edition.

        @[JSON::Field(key: "Edition")]
        getter edition : String?

        # The language used in the SNOMED-CT ontology. All Amazon Comprehend Medical operations are US English
        # (en).

        @[JSON::Field(key: "Language")]
        getter language : String?

        # The version date of the SNOMED-CT ontology used.

        @[JSON::Field(key: "VersionDate")]
        getter version_date : String?

        def initialize(
          @edition : String? = nil,
          @language : String? = nil,
          @version_date : String? = nil
        )
        end
      end

      # The collection of medical entities extracted from the input text and their associated information.
      # For each entity, the response provides the entity text, the entity category, where the entity text
      # begins and ends, and the level of confidence that Amazon Comprehend Medical has in the detection and
      # analysis. Attributes and traits of the entity are also returned.

      struct SNOMEDCTEntity
        include JSON::Serializable

        # An extracted segment of the text that is an attribute of an entity, or otherwise related to an
        # entity, such as the dosage of a medication taken.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::SNOMEDCTAttribute)?

        # The 0-based character offset in the input text that shows where the entity begins. The offset
        # returns the UTF-8 code point in the string.

        @[JSON::Field(key: "BeginOffset")]
        getter begin_offset : Int32?

        # The category of the detected entity. Possible categories are MEDICAL_CONDITION, ANATOMY, or
        # TEST_TREATMENT_PROCEDURE.

        @[JSON::Field(key: "Category")]
        getter category : String?

        # The 0-based character offset in the input text that shows where the entity ends. The offset returns
        # the UTF-8 code point in the string.

        @[JSON::Field(key: "EndOffset")]
        getter end_offset : Int32?

        # The numeric identifier for the entity. This is a monotonically increasing id unique within this
        # response rather than a global unique identifier.

        @[JSON::Field(key: "Id")]
        getter id : Int32?

        # The SNOMED concepts that the entity could refer to, along with a score indicating the likelihood of
        # the match.

        @[JSON::Field(key: "SNOMEDCTConcepts")]
        getter snomedct_concepts : Array(Types::SNOMEDCTConcept)?

        # The level of confidence that Amazon Comprehend Medical has in the accuracy of the detected entity.

        @[JSON::Field(key: "Score")]
        getter score : Float64?

        # The segment of input text extracted as this entity.

        @[JSON::Field(key: "Text")]
        getter text : String?

        # Contextual information for the entity.

        @[JSON::Field(key: "Traits")]
        getter traits : Array(Types::SNOMEDCTTrait)?

        # Describes the specific type of entity with category of entities. Possible types include DX_NAME,
        # ACUITY, DIRECTION, SYSTEM_ORGAN_SITE, TEST_NAME, TEST_VALUE, TEST_UNIT, PROCEDURE_NAME, or
        # TREATMENT_NAME.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @attributes : Array(Types::SNOMEDCTAttribute)? = nil,
          @begin_offset : Int32? = nil,
          @category : String? = nil,
          @end_offset : Int32? = nil,
          @id : Int32? = nil,
          @snomedct_concepts : Array(Types::SNOMEDCTConcept)? = nil,
          @score : Float64? = nil,
          @text : String? = nil,
          @traits : Array(Types::SNOMEDCTTrait)? = nil,
          @type : String? = nil
        )
        end
      end

      # Contextual information for an entity.

      struct SNOMEDCTTrait
        include JSON::Serializable

        # The name or contextual description of a detected trait.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The level of confidence that Amazon Comprehend Medical has in the accuracy of a detected trait.

        @[JSON::Field(key: "Score")]
        getter score : Float64?

        def initialize(
          @name : String? = nil,
          @score : Float64? = nil
        )
        end
      end

      # The Amazon Comprehend Medical service is temporarily unavailable. Please wait and then retry your
      # request.

      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct StartEntitiesDetectionV2JobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants
        # Amazon Comprehend Medical read access to your input data. For more information, see Role-Based
        # Permissions Required for Asynchronous Operations .

        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # The input configuration that specifies the format and location of the input data for the job.

        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # The language of the input documents. All documents must be in the same language. Amazon Comprehend
        # Medical processes files in US English (en).

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # The output configuration that specifies where to send the output files.

        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # A unique identifier for the request. If you don't set the client request token, Amazon Comprehend
        # Medical generates one for you.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The identifier of the job.

        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # An AWS Key Management Service key to encrypt your output files. If you do not specify a key, the
        # files are written in plain text.

        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?

        def initialize(
          @data_access_role_arn : String,
          @input_data_config : Types::InputDataConfig,
          @language_code : String,
          @output_data_config : Types::OutputDataConfig,
          @client_request_token : String? = nil,
          @job_name : String? = nil,
          @kms_key : String? = nil
        )
        end
      end


      struct StartEntitiesDetectionV2JobResponse
        include JSON::Serializable

        # The identifier generated for the job. To get the status of a job, use this identifier with the
        # DescribeEntitiesDetectionV2Job operation.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end


      struct StartICD10CMInferenceJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants
        # Amazon Comprehend Medical read access to your input data. For more information, see Role-Based
        # Permissions Required for Asynchronous Operations .

        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # Specifies the format and location of the input data for the job.

        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # The language of the input documents. All documents must be in the same language.

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # Specifies where to send the output files.

        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # A unique identifier for the request. If you don't set the client request token, Amazon Comprehend
        # Medical generates one.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The identifier of the job.

        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # An AWS Key Management Service key to encrypt your output files. If you do not specify a key, the
        # files are written in plain text.

        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?

        def initialize(
          @data_access_role_arn : String,
          @input_data_config : Types::InputDataConfig,
          @language_code : String,
          @output_data_config : Types::OutputDataConfig,
          @client_request_token : String? = nil,
          @job_name : String? = nil,
          @kms_key : String? = nil
        )
        end
      end


      struct StartICD10CMInferenceJobResponse
        include JSON::Serializable

        # The identifier generated for the job. To get the status of a job, use this identifier with the
        # StartICD10CMInferenceJob operation.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end


      struct StartPHIDetectionJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants
        # Amazon Comprehend Medical read access to your input data. For more information, see Role-Based
        # Permissions Required for Asynchronous Operations .

        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # Specifies the format and location of the input data for the job.

        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # The language of the input documents. All documents must be in the same language.

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # Specifies where to send the output files.

        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # A unique identifier for the request. If you don't set the client request token, Amazon Comprehend
        # Medical generates one.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The identifier of the job.

        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # An AWS Key Management Service key to encrypt your output files. If you do not specify a key, the
        # files are written in plain text.

        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?

        def initialize(
          @data_access_role_arn : String,
          @input_data_config : Types::InputDataConfig,
          @language_code : String,
          @output_data_config : Types::OutputDataConfig,
          @client_request_token : String? = nil,
          @job_name : String? = nil,
          @kms_key : String? = nil
        )
        end
      end


      struct StartPHIDetectionJobResponse
        include JSON::Serializable

        # The identifier generated for the job. To get the status of a job, use this identifier with the
        # DescribePHIDetectionJob operation.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end


      struct StartRxNormInferenceJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants
        # Amazon Comprehend Medical read access to your input data. For more information, see Role-Based
        # Permissions Required for Asynchronous Operations .

        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # Specifies the format and location of the input data for the job.

        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # The language of the input documents. All documents must be in the same language.

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # Specifies where to send the output files.

        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # A unique identifier for the request. If you don't set the client request token, Amazon Comprehend
        # Medical generates one.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The identifier of the job.

        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # An AWS Key Management Service key to encrypt your output files. If you do not specify a key, the
        # files are written in plain text.

        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?

        def initialize(
          @data_access_role_arn : String,
          @input_data_config : Types::InputDataConfig,
          @language_code : String,
          @output_data_config : Types::OutputDataConfig,
          @client_request_token : String? = nil,
          @job_name : String? = nil,
          @kms_key : String? = nil
        )
        end
      end


      struct StartRxNormInferenceJobResponse
        include JSON::Serializable

        # The identifier of the job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end


      struct StartSNOMEDCTInferenceJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants
        # Amazon Comprehend Medical read access to your input data.

        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String


        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # The language of the input documents. All documents must be in the same language.

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String


        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # A unique identifier for the request. If you don't set the client request token, Amazon Comprehend
        # Medical generates one.

        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The user generated name the asynchronous InferSNOMEDCT job.

        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # An AWS Key Management Service key used to encrypt your output files. If you do not specify a key,
        # the files are written in plain text.

        @[JSON::Field(key: "KMSKey")]
        getter kms_key : String?

        def initialize(
          @data_access_role_arn : String,
          @input_data_config : Types::InputDataConfig,
          @language_code : String,
          @output_data_config : Types::OutputDataConfig,
          @client_request_token : String? = nil,
          @job_name : String? = nil,
          @kms_key : String? = nil
        )
        end
      end


      struct StartSNOMEDCTInferenceJobResponse
        include JSON::Serializable

        # The identifier generated for the job. To get the status of a job, use this identifier with the
        # StartSNOMEDCTInferenceJob operation.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end


      struct StopEntitiesDetectionV2JobRequest
        include JSON::Serializable

        # The identifier of the medical entities job to stop.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct StopEntitiesDetectionV2JobResponse
        include JSON::Serializable

        # The identifier of the medical entities detection job that was stopped.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end


      struct StopICD10CMInferenceJobRequest
        include JSON::Serializable

        # The identifier of the job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct StopICD10CMInferenceJobResponse
        include JSON::Serializable

        # The identifier generated for the job. To get the status of job, use this identifier with the
        # DescribeICD10CMInferenceJob operation.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end


      struct StopPHIDetectionJobRequest
        include JSON::Serializable

        # The identifier of the PHI detection job to stop.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct StopPHIDetectionJobResponse
        include JSON::Serializable

        # The identifier of the PHI detection job that was stopped.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end


      struct StopRxNormInferenceJobRequest
        include JSON::Serializable

        # The identifier of the job.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct StopRxNormInferenceJobResponse
        include JSON::Serializable

        # The identifier generated for the job. To get the status of job, use this identifier with the
        # DescribeRxNormInferenceJob operation.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end


      struct StopSNOMEDCTInferenceJobRequest
        include JSON::Serializable

        # The job id of the asynchronous InferSNOMEDCT job to be stopped.

        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct StopSNOMEDCTInferenceJobResponse
        include JSON::Serializable

        # The identifier generated for the job. To get the status of job, use this identifier with the
        # DescribeSNOMEDCTInferenceJob operation.

        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      # The size of the text you submitted exceeds the size limit. Reduce the size of the text or use a
      # smaller document and then retry your request.

      struct TextSizeLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have made too many requests within a short period of time. Wait for a short time and then try
      # your request again. Contact customer support for more information about a service limit increase.

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides contextual information about the extracted entity.

      struct Trait
        include JSON::Serializable

        # Provides a name or contextual description about the trait.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The level of confidence that Amazon Comprehend Medical has in the accuracy of this trait.

        @[JSON::Field(key: "Score")]
        getter score : Float64?

        def initialize(
          @name : String? = nil,
          @score : Float64? = nil
        )
        end
      end

      # An attribute that was extracted, but Amazon Comprehend Medical was unable to relate to an entity.

      struct UnmappedAttribute
        include JSON::Serializable

        # The specific attribute that has been extracted but not mapped to an entity.

        @[JSON::Field(key: "Attribute")]
        getter attribute : Types::Attribute?

        # The type of the unmapped attribute, could be one of the following values: "MEDICATION",
        # "MEDICAL_CONDITION", "ANATOMY", "TEST_AND_TREATMENT_PROCEDURE" or "PROTECTED_HEALTH_INFORMATION".

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @attribute : Types::Attribute? = nil,
          @type : String? = nil
        )
        end
      end

      # The filter that you specified for the operation is invalid. Check the filter values that you entered
      # and try your request again.

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
