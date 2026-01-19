require "json"
require "time"

module AwsSdk
  module Translate
    module Types

      # The custom terminology applied to the input text by Amazon Translate for the translated text
      # response. This is optional in the response and will only be present if you specified terminology
      # input in the request. Currently, only one terminology can be applied per TranslateText request.
      struct AppliedTerminology
        include JSON::Serializable

        # The name of the custom terminology applied to the input text by Amazon Translate for the translated
        # text response.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The specific terms of the custom terminology applied to the input text by Amazon Translate for the
        # translated text response. A maximum of 250 terms will be returned, and the specific terms applied
        # will be the first 250 terms in the source text.
        @[JSON::Field(key: "Terms")]
        getter terms : Array(Types::Term)?

        def initialize(
          @name : String? = nil,
          @terms : Array(Types::Term)? = nil
        )
        end
      end

      # Another modification is being made. That modification must complete before you can make your change.
      struct ConcurrentModificationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # There was a conflict processing the request. Try your request again.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct CreateParallelDataRequest
        include JSON::Serializable

        # A unique identifier for the request. This token is automatically generated when you use Amazon
        # Translate through an AWS SDK.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # A custom name for the parallel data resource in Amazon Translate. You must assign a name that is
        # unique in the account and region.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies the format and S3 location of the parallel data input file.
        @[JSON::Field(key: "ParallelDataConfig")]
        getter parallel_data_config : Types::ParallelDataConfig

        # A custom description for the parallel data resource in Amazon Translate.
        @[JSON::Field(key: "Description")]
        getter description : String?

        @[JSON::Field(key: "EncryptionKey")]
        getter encryption_key : Types::EncryptionKey?

        # Tags to be associated with this resource. A tag is a key-value pair that adds metadata to a
        # resource. Each tag key for the resource must be unique. For more information, see Tagging your
        # resources .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_token : String,
          @name : String,
          @parallel_data_config : Types::ParallelDataConfig,
          @description : String? = nil,
          @encryption_key : Types::EncryptionKey? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateParallelDataResponse
        include JSON::Serializable

        # The custom name that you assigned to the parallel data resource.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The status of the parallel data resource. When the resource is ready for you to use, the status is
        # ACTIVE .
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DeleteParallelDataRequest
        include JSON::Serializable

        # The name of the parallel data resource that is being deleted.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeleteParallelDataResponse
        include JSON::Serializable

        # The name of the parallel data resource that is being deleted.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The status of the parallel data deletion.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DeleteTerminologyRequest
        include JSON::Serializable

        # The name of the custom terminology being deleted.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DescribeTextTranslationJobRequest
        include JSON::Serializable

        # The identifier that Amazon Translate generated for the job. The StartTextTranslationJob operation
        # returns this identifier in its response.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct DescribeTextTranslationJobResponse
        include JSON::Serializable

        # An object that contains the properties associated with an asynchronous batch translation job.
        @[JSON::Field(key: "TextTranslationJobProperties")]
        getter text_translation_job_properties : Types::TextTranslationJobProperties?

        def initialize(
          @text_translation_job_properties : Types::TextTranslationJobProperties? = nil
        )
        end
      end

      # The confidence that Amazon Comprehend accurately detected the source language is low. If a low
      # confidence level is acceptable for your application, you can use the language in the exception to
      # call Amazon Translate again. For more information, see the DetectDominantLanguage operation in the
      # Amazon Comprehend Developer Guide .
      struct DetectedLanguageLowConfidenceException
        include JSON::Serializable

        # The language code of the auto-detected language from Amazon Comprehend.
        @[JSON::Field(key: "DetectedLanguageCode")]
        getter detected_language_code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @detected_language_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The content and content type of a document.
      struct Document
        include JSON::Serializable

        # The Content field type is Binary large object (blob). This object contains the document content
        # converted into base64-encoded binary data. If you use one of the AWS SDKs, the SDK performs the
        # Base64-encoding on this field before sending the request.
        @[JSON::Field(key: "Content")]
        getter content : Bytes

        # Describes the format of the document. You can specify one of the following: text/html - The input
        # data consists of HTML content. Amazon Translate translates only the text in the HTML element.
        # text/plain - The input data consists of unformatted text. Amazon Translate translates every
        # character in the content. application/vnd.openxmlformats-officedocument.wordprocessingml.document -
        # The input data consists of a Word document (.docx).
        @[JSON::Field(key: "ContentType")]
        getter content_type : String

        def initialize(
          @content : Bytes,
          @content_type : String
        )
        end
      end

      # The encryption key used to encrypt this object.
      struct EncryptionKey
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the encryption key being used to encrypt this object.
        @[JSON::Field(key: "Id")]
        getter id : String

        # The type of encryption key used by Amazon Translate to encrypt this object.
        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @id : String,
          @type : String
        )
        end
      end

      struct GetParallelDataRequest
        include JSON::Serializable

        # The name of the parallel data resource that is being retrieved.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct GetParallelDataResponse
        include JSON::Serializable

        # The Amazon S3 location of a file that provides any errors or warnings that were produced by your
        # input file. This file was created when Amazon Translate attempted to create a parallel data
        # resource. The location is returned as a presigned URL to that has a 30-minute expiration.
        @[JSON::Field(key: "AuxiliaryDataLocation")]
        getter auxiliary_data_location : Types::ParallelDataDataLocation?

        # The Amazon S3 location of the most recent parallel data input file that was successfully imported
        # into Amazon Translate. The location is returned as a presigned URL that has a 30-minute expiration.
        # Amazon Translate doesn't scan all input files for the risk of CSV injection attacks. CSV injection
        # occurs when a .csv or .tsv file is altered so that a record contains malicious code. The record
        # begins with a special character, such as =, +, -, or @. When the file is opened in a spreadsheet
        # program, the program might interpret the record as a formula and run the code within it. Before you
        # download an input file from Amazon S3, ensure that you recognize the file and trust its creator.
        @[JSON::Field(key: "DataLocation")]
        getter data_location : Types::ParallelDataDataLocation?

        # The Amazon S3 location of a file that provides any errors or warnings that were produced by your
        # input file. This file was created when Amazon Translate attempted to update a parallel data
        # resource. The location is returned as a presigned URL to that has a 30-minute expiration.
        @[JSON::Field(key: "LatestUpdateAttemptAuxiliaryDataLocation")]
        getter latest_update_attempt_auxiliary_data_location : Types::ParallelDataDataLocation?

        # The properties of the parallel data resource that is being retrieved.
        @[JSON::Field(key: "ParallelDataProperties")]
        getter parallel_data_properties : Types::ParallelDataProperties?

        def initialize(
          @auxiliary_data_location : Types::ParallelDataDataLocation? = nil,
          @data_location : Types::ParallelDataDataLocation? = nil,
          @latest_update_attempt_auxiliary_data_location : Types::ParallelDataDataLocation? = nil,
          @parallel_data_properties : Types::ParallelDataProperties? = nil
        )
        end
      end

      struct GetTerminologyRequest
        include JSON::Serializable

        # The name of the custom terminology being retrieved.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The data format of the custom terminology being retrieved. If you don't specify this parameter,
        # Amazon Translate returns a file with the same format as the file that was imported to create the
        # terminology. If you specify this parameter when you retrieve a multi-directional terminology
        # resource, you must specify the same format as the input file that was imported to create it.
        # Otherwise, Amazon Translate throws an error.
        @[JSON::Field(key: "TerminologyDataFormat")]
        getter terminology_data_format : String?

        def initialize(
          @name : String,
          @terminology_data_format : String? = nil
        )
        end
      end

      struct GetTerminologyResponse
        include JSON::Serializable

        # The Amazon S3 location of a file that provides any errors or warnings that were produced by your
        # input file. This file was created when Amazon Translate attempted to create a terminology resource.
        # The location is returned as a presigned URL to that has a 30-minute expiration.
        @[JSON::Field(key: "AuxiliaryDataLocation")]
        getter auxiliary_data_location : Types::TerminologyDataLocation?

        # The Amazon S3 location of the most recent custom terminology input file that was successfully
        # imported into Amazon Translate. The location is returned as a presigned URL that has a 30-minute
        # expiration. Amazon Translate doesn't scan all input files for the risk of CSV injection attacks. CSV
        # injection occurs when a .csv or .tsv file is altered so that a record contains malicious code. The
        # record begins with a special character, such as =, +, -, or @. When the file is opened in a
        # spreadsheet program, the program might interpret the record as a formula and run the code within it.
        # Before you download an input file from Amazon S3, ensure that you recognize the file and trust its
        # creator.
        @[JSON::Field(key: "TerminologyDataLocation")]
        getter terminology_data_location : Types::TerminologyDataLocation?

        # The properties of the custom terminology being retrieved.
        @[JSON::Field(key: "TerminologyProperties")]
        getter terminology_properties : Types::TerminologyProperties?

        def initialize(
          @auxiliary_data_location : Types::TerminologyDataLocation? = nil,
          @terminology_data_location : Types::TerminologyDataLocation? = nil,
          @terminology_properties : Types::TerminologyProperties? = nil
        )
        end
      end

      struct ImportTerminologyRequest
        include JSON::Serializable

        # The merge strategy of the custom terminology being imported. Currently, only the OVERWRITE merge
        # strategy is supported. In this case, the imported terminology will overwrite an existing terminology
        # of the same name.
        @[JSON::Field(key: "MergeStrategy")]
        getter merge_strategy : String

        # The name of the custom terminology being imported.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The terminology data for the custom terminology being imported.
        @[JSON::Field(key: "TerminologyData")]
        getter terminology_data : Types::TerminologyData

        # The description of the custom terminology being imported.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The encryption key for the custom terminology being imported.
        @[JSON::Field(key: "EncryptionKey")]
        getter encryption_key : Types::EncryptionKey?

        # Tags to be associated with this resource. A tag is a key-value pair that adds metadata to a
        # resource. Each tag key for the resource must be unique. For more information, see Tagging your
        # resources .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @merge_strategy : String,
          @name : String,
          @terminology_data : Types::TerminologyData,
          @description : String? = nil,
          @encryption_key : Types::EncryptionKey? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ImportTerminologyResponse
        include JSON::Serializable

        # The Amazon S3 location of a file that provides any errors or warnings that were produced by your
        # input file. This file was created when Amazon Translate attempted to create a terminology resource.
        # The location is returned as a presigned URL to that has a 30 minute expiration.
        @[JSON::Field(key: "AuxiliaryDataLocation")]
        getter auxiliary_data_location : Types::TerminologyDataLocation?

        # The properties of the custom terminology being imported.
        @[JSON::Field(key: "TerminologyProperties")]
        getter terminology_properties : Types::TerminologyProperties?

        def initialize(
          @auxiliary_data_location : Types::TerminologyDataLocation? = nil,
          @terminology_properties : Types::TerminologyProperties? = nil
        )
        end
      end

      # The input configuration properties for requesting a batch translation job.
      struct InputDataConfig
        include JSON::Serializable

        # Describes the format of the data that you submit to Amazon Translate as input. You can specify one
        # of the following multipurpose internet mail extension (MIME) types: text/html : The input data
        # consists of one or more HTML files. Amazon Translate translates only the text that resides in the
        # html element in each file. text/plain : The input data consists of one or more unformatted text
        # files. Amazon Translate translates every character in this type of input.
        # application/vnd.openxmlformats-officedocument.wordprocessingml.document : The input data consists of
        # one or more Word documents (.docx).
        # application/vnd.openxmlformats-officedocument.presentationml.presentation : The input data consists
        # of one or more PowerPoint Presentation files (.pptx).
        # application/vnd.openxmlformats-officedocument.spreadsheetml.sheet : The input data consists of one
        # or more Excel Workbook files (.xlsx). application/x-xliff+xml : The input data consists of one or
        # more XML Localization Interchange File Format (XLIFF) files (.xlf). Amazon Translate supports only
        # XLIFF version 1.2. If you structure your input data as HTML, ensure that you set this parameter to
        # text/html . By doing so, you cut costs by limiting the translation to the contents of the html
        # element in each file. Otherwise, if you set this parameter to text/plain , your costs will cover the
        # translation of every character.
        @[JSON::Field(key: "ContentType")]
        getter content_type : String

        # The URI of the AWS S3 folder that contains the input files. Amazon Translate translates all the
        # files in the folder and all its sub-folders. The folder must be in the same Region as the API
        # endpoint you are calling.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        def initialize(
          @content_type : String,
          @s3_uri : String
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

      # The filter specified for the operation is not valid. Specify a different filter.
      struct InvalidFilterException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The value of the parameter is not valid. Review the value of the parameter you are using to correct
      # it, and then retry your operation.
      struct InvalidParameterValueException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request that you made is not valid. Check your request to determine why it's not valid and then
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

      # The number of documents successfully and unsuccessfully processed during a translation job.
      struct JobDetails
        include JSON::Serializable

        # The number of documents that could not be processed during a translation job.
        @[JSON::Field(key: "DocumentsWithErrorsCount")]
        getter documents_with_errors_count : Int32?

        # The number of documents used as input in a translation job.
        @[JSON::Field(key: "InputDocumentsCount")]
        getter input_documents_count : Int32?

        # The number of documents successfully processed during a translation job.
        @[JSON::Field(key: "TranslatedDocumentsCount")]
        getter translated_documents_count : Int32?

        def initialize(
          @documents_with_errors_count : Int32? = nil,
          @input_documents_count : Int32? = nil,
          @translated_documents_count : Int32? = nil
        )
        end
      end

      # A supported language.
      struct Language
        include JSON::Serializable

        # Language code for the supported language.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # Language name of the supported language.
        @[JSON::Field(key: "LanguageName")]
        getter language_name : String

        def initialize(
          @language_code : String,
          @language_name : String
        )
        end
      end

      # The specified limit has been exceeded. Review your request and retry it with a quantity below the
      # stated limit.
      struct LimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListLanguagesRequest
        include JSON::Serializable

        # The language code for the language to use to display the language names in the response. The
        # language code is en by default.
        @[JSON::Field(key: "DisplayLanguageCode")]
        getter display_language_code : String?

        # The maximum number of results to return in each response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Include the NextToken value to fetch the next group of supported languages.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @display_language_code : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListLanguagesResponse
        include JSON::Serializable

        # The language code passed in with the request.
        @[JSON::Field(key: "DisplayLanguageCode")]
        getter display_language_code : String?

        # The list of supported languages.
        @[JSON::Field(key: "Languages")]
        getter languages : Array(Types::Language)?

        # If the response does not include all remaining results, use the NextToken in the next request to
        # fetch the next group of supported languages.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @display_language_code : String? = nil,
          @languages : Array(Types::Language)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListParallelDataRequest
        include JSON::Serializable

        # The maximum number of parallel data resources returned for each request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A string that specifies the next page of results to return in a paginated response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListParallelDataResponse
        include JSON::Serializable

        # The string to use in a subsequent request to get the next page of results in a paginated response.
        # This value is null if there are no additional pages.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The properties of the parallel data resources returned by this request.
        @[JSON::Field(key: "ParallelDataPropertiesList")]
        getter parallel_data_properties_list : Array(Types::ParallelDataProperties)?

        def initialize(
          @next_token : String? = nil,
          @parallel_data_properties_list : Array(Types::ParallelDataProperties)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the given Amazon Translate resource you are querying.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Tags associated with the Amazon Translate resource being queried. A tag is a key-value pair that
        # adds as a metadata to a resource used by Amazon Translate. For example, a tag with "Sales" as the
        # key might be added to a resource to indicate its use by the sales department.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ListTerminologiesRequest
        include JSON::Serializable

        # The maximum number of custom terminologies returned per list request.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the result of the request to ListTerminologies was truncated, include the NextToken to fetch the
        # next group of custom terminologies.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTerminologiesResponse
        include JSON::Serializable

        # If the response to the ListTerminologies was truncated, the NextToken fetches the next group of
        # custom terminologies.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The properties list of the custom terminologies returned on the list request.
        @[JSON::Field(key: "TerminologyPropertiesList")]
        getter terminology_properties_list : Array(Types::TerminologyProperties)?

        def initialize(
          @next_token : String? = nil,
          @terminology_properties_list : Array(Types::TerminologyProperties)? = nil
        )
        end
      end

      struct ListTextTranslationJobsRequest
        include JSON::Serializable

        # The parameters that specify which batch translation jobs to retrieve. Filters include job name, job
        # status, and submission time. You can only set one filter at a time.
        @[JSON::Field(key: "Filter")]
        getter filter : Types::TextTranslationJobFilter?

        # The maximum number of results to return in each page. The default value is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token to request the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::TextTranslationJobFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTextTranslationJobsResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list containing the properties of each job that is returned.
        @[JSON::Field(key: "TextTranslationJobPropertiesList")]
        getter text_translation_job_properties_list : Array(Types::TextTranslationJobProperties)?

        def initialize(
          @next_token : String? = nil,
          @text_translation_job_properties_list : Array(Types::TextTranslationJobProperties)? = nil
        )
        end
      end

      # The output configuration properties for a batch translation job.
      struct OutputDataConfig
        include JSON::Serializable

        # The URI of the S3 folder that contains a translation job's output file. The folder must be in the
        # same Region as the API endpoint that you are calling.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        @[JSON::Field(key: "EncryptionKey")]
        getter encryption_key : Types::EncryptionKey?

        def initialize(
          @s3_uri : String,
          @encryption_key : Types::EncryptionKey? = nil
        )
        end
      end

      # Specifies the format and S3 location of the parallel data input file.
      struct ParallelDataConfig
        include JSON::Serializable

        # The format of the parallel data input file.
        @[JSON::Field(key: "Format")]
        getter format : String?

        # The URI of the Amazon S3 folder that contains the parallel data input file. The folder must be in
        # the same Region as the API endpoint you are calling.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String?

        def initialize(
          @format : String? = nil,
          @s3_uri : String? = nil
        )
        end
      end

      # The location of the most recent parallel data input file that was successfully imported into Amazon
      # Translate.
      struct ParallelDataDataLocation
        include JSON::Serializable

        # The Amazon S3 location of the parallel data input file. The location is returned as a presigned URL
        # to that has a 30-minute expiration. Amazon Translate doesn't scan all input files for the risk of
        # CSV injection attacks. CSV injection occurs when a .csv or .tsv file is altered so that a record
        # contains malicious code. The record begins with a special character, such as =, +, -, or @. When the
        # file is opened in a spreadsheet program, the program might interpret the record as a formula and run
        # the code within it. Before you download an input file from Amazon S3, ensure that you recognize the
        # file and trust its creator.
        @[JSON::Field(key: "Location")]
        getter location : String

        # Describes the repository that contains the parallel data input file.
        @[JSON::Field(key: "RepositoryType")]
        getter repository_type : String

        def initialize(
          @location : String,
          @repository_type : String
        )
        end
      end

      # The properties of a parallel data resource.
      struct ParallelDataProperties
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the parallel data resource.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time at which the parallel data resource was created.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The description assigned to the parallel data resource.
        @[JSON::Field(key: "Description")]
        getter description : String?

        @[JSON::Field(key: "EncryptionKey")]
        getter encryption_key : Types::EncryptionKey?

        # The number of records unsuccessfully imported from the parallel data input file.
        @[JSON::Field(key: "FailedRecordCount")]
        getter failed_record_count : Int64?

        # The number of UTF-8 characters that Amazon Translate imported from the parallel data input file.
        # This number includes only the characters in your translation examples. It does not include
        # characters that are used to format your file. For example, if you provided a Translation Memory
        # Exchange (.tmx) file, this number does not include the tags.
        @[JSON::Field(key: "ImportedDataSize")]
        getter imported_data_size : Int64?

        # The number of records successfully imported from the parallel data input file.
        @[JSON::Field(key: "ImportedRecordCount")]
        getter imported_record_count : Int64?

        # The time at which the parallel data resource was last updated.
        @[JSON::Field(key: "LastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # The time that the most recent update was attempted.
        @[JSON::Field(key: "LatestUpdateAttemptAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter latest_update_attempt_at : Time?

        # The status of the most recent update attempt for the parallel data resource.
        @[JSON::Field(key: "LatestUpdateAttemptStatus")]
        getter latest_update_attempt_status : String?

        # Additional information from Amazon Translate about the parallel data resource.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The custom name assigned to the parallel data resource.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Specifies the format and S3 location of the parallel data input file.
        @[JSON::Field(key: "ParallelDataConfig")]
        getter parallel_data_config : Types::ParallelDataConfig?

        # The number of items in the input file that Amazon Translate skipped when you created or updated the
        # parallel data resource. For example, Amazon Translate skips empty records, empty target texts, and
        # empty lines.
        @[JSON::Field(key: "SkippedRecordCount")]
        getter skipped_record_count : Int64?

        # The source language of the translations in the parallel data file.
        @[JSON::Field(key: "SourceLanguageCode")]
        getter source_language_code : String?

        # The status of the parallel data resource. When the parallel data is ready for you to use, the status
        # is ACTIVE .
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The language codes for the target languages available in the parallel data file. All possible target
        # languages are returned as an array.
        @[JSON::Field(key: "TargetLanguageCodes")]
        getter target_language_codes : Array(String)?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @encryption_key : Types::EncryptionKey? = nil,
          @failed_record_count : Int64? = nil,
          @imported_data_size : Int64? = nil,
          @imported_record_count : Int64? = nil,
          @last_updated_at : Time? = nil,
          @latest_update_attempt_at : Time? = nil,
          @latest_update_attempt_status : String? = nil,
          @message : String? = nil,
          @name : String? = nil,
          @parallel_data_config : Types::ParallelDataConfig? = nil,
          @skipped_record_count : Int64? = nil,
          @source_language_code : String? = nil,
          @status : String? = nil,
          @target_language_codes : Array(String)? = nil
        )
        end
      end

      # The resource you are looking for has not been found. Review the resource you're looking for and see
      # if a different resource will accomplish your needs before retrying the revised request.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The Amazon Translate service is temporarily unavailable. Wait a bit and then retry your request.
      struct ServiceUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct StartTextTranslationJobRequest
        include JSON::Serializable

        # A unique identifier for the request. This token is generated for you when using the Amazon Translate
        # SDK.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The Amazon Resource Name (ARN) of an AWS Identity Access and Management (IAM) role that grants
        # Amazon Translate read access to your input data. For more information, see Identity and access
        # management .
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # Specifies the format and location of the input documents for the translation job.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # Specifies the S3 folder to which your job output will be saved.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # The language code of the input language. Specify the language if all input documents share the same
        # language. If you don't know the language of the source files, or your input documents contains
        # different source languages, select auto . Amazon Translate auto detects the source language for each
        # input document. For a list of supported language codes, see Supported languages .
        @[JSON::Field(key: "SourceLanguageCode")]
        getter source_language_code : String

        # The target languages of the translation job. Enter up to 10 language codes. Each input file is
        # translated into each target language. Each language code is 2 or 5 characters long. For a list of
        # language codes, see Supported languages .
        @[JSON::Field(key: "TargetLanguageCodes")]
        getter target_language_codes : Array(String)

        # The name of the batch translation job to be performed.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # The name of a parallel data resource to add to the translation job. This resource consists of
        # examples that show how you want segments of text to be translated. If you specify multiple target
        # languages for the job, the parallel data file must include translations for all the target
        # languages. When you add parallel data to a translation job, you create an Active Custom Translation
        # job. This parameter accepts only one parallel data resource. Active Custom Translation jobs are
        # priced at a higher rate than other jobs that don't use parallel data. For more information, see
        # Amazon Translate pricing . For a list of available parallel data resources, use the ListParallelData
        # operation. For more information, see Customizing your translations with parallel data .
        @[JSON::Field(key: "ParallelDataNames")]
        getter parallel_data_names : Array(String)?

        # Settings to configure your translation output. You can configure the following options: Brevity: not
        # supported. Formality: sets the formality level of the output text. Profanity: masks profane words
        # and phrases in your translation output.
        @[JSON::Field(key: "Settings")]
        getter settings : Types::TranslationSettings?

        # The name of a custom terminology resource to add to the translation job. This resource lists
        # examples source terms and the desired translation for each term. This parameter accepts only one
        # custom terminology resource. If you specify multiple target languages for the job, translate uses
        # the designated terminology for each requested target language that has an entry for the source term
        # in the terminology file. For a list of available custom terminology resources, use the
        # ListTerminologies operation. For more information, see Custom terminology .
        @[JSON::Field(key: "TerminologyNames")]
        getter terminology_names : Array(String)?

        def initialize(
          @client_token : String,
          @data_access_role_arn : String,
          @input_data_config : Types::InputDataConfig,
          @output_data_config : Types::OutputDataConfig,
          @source_language_code : String,
          @target_language_codes : Array(String),
          @job_name : String? = nil,
          @parallel_data_names : Array(String)? = nil,
          @settings : Types::TranslationSettings? = nil,
          @terminology_names : Array(String)? = nil
        )
        end
      end

      struct StartTextTranslationJobResponse
        include JSON::Serializable

        # The identifier generated for the job. To get the status of a job, use this ID with the
        # DescribeTextTranslationJob operation.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The status of the job. Possible values include: SUBMITTED - The job has been received and is queued
        # for processing. IN_PROGRESS - Amazon Translate is processing the job. COMPLETED - The job was
        # successfully completed and the output is available. COMPLETED_WITH_ERROR - The job was completed
        # with errors. The errors can be analyzed in the job's output. FAILED - The job did not complete. To
        # get details, use the DescribeTextTranslationJob operation. STOP_REQUESTED - The user who started the
        # job has requested that it be stopped. STOPPED - The job has been stopped.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @job_id : String? = nil,
          @job_status : String? = nil
        )
        end
      end

      struct StopTextTranslationJobRequest
        include JSON::Serializable

        # The job ID of the job to be stopped.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct StopTextTranslationJobResponse
        include JSON::Serializable

        # The job ID of the stopped batch translation job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The status of the designated job. Upon successful completion, the job's status will be STOPPED .
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @job_id : String? = nil,
          @job_status : String? = nil
        )
        end
      end

      # A key-value pair that adds as a metadata to a resource used by Amazon Translate.
      struct Tag
        include JSON::Serializable

        # The initial part of a key-value pair that forms a tag associated with a given resource.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The second part of a key-value pair that forms a tag associated with a given resource.
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

        # The Amazon Resource Name (ARN) of the given Amazon Translate resource to which you want to associate
        # the tags.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Tags being associated with a specific Amazon Translate resource. There can be a maximum of 50 tags
        # (both existing and pending) associated with a specific resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The term being translated by the custom terminology.
      struct Term
        include JSON::Serializable

        # The source text of the term being translated by the custom terminology.
        @[JSON::Field(key: "SourceText")]
        getter source_text : String?

        # The target text of the term being translated by the custom terminology.
        @[JSON::Field(key: "TargetText")]
        getter target_text : String?

        def initialize(
          @source_text : String? = nil,
          @target_text : String? = nil
        )
        end
      end

      # The data associated with the custom terminology. For information about the custom terminology file,
      # see Creating a Custom Terminology .
      struct TerminologyData
        include JSON::Serializable

        # The file containing the custom terminology data. Your version of the AWS SDK performs a
        # Base64-encoding on this field before sending a request to the AWS service. Users of the SDK should
        # not perform Base64-encoding themselves.
        @[JSON::Field(key: "File")]
        getter file : Bytes

        # The data format of the custom terminology.
        @[JSON::Field(key: "Format")]
        getter format : String

        # The directionality of your terminology resource indicates whether it has one source language
        # (uni-directional) or multiple (multi-directional). UNI The terminology resource has one source
        # language (for example, the first column in a CSV file), and all of its other languages are target
        # languages. MULTI Any language in the terminology resource can be the source language or a target
        # language. A single multi-directional terminology resource can be used for jobs that translate
        # different language pairs. For example, if the terminology contains English and Spanish terms, it can
        # be used for jobs that translate English to Spanish and Spanish to English. When you create a custom
        # terminology resource without specifying the directionality, it behaves as uni-directional
        # terminology, although this parameter will have a null value.
        @[JSON::Field(key: "Directionality")]
        getter directionality : String?

        def initialize(
          @file : Bytes,
          @format : String,
          @directionality : String? = nil
        )
        end
      end

      # The location of the custom terminology data.
      struct TerminologyDataLocation
        include JSON::Serializable

        # The Amazon S3 location of the most recent custom terminology input file that was successfully
        # imported into Amazon Translate. The location is returned as a presigned URL that has a 30-minute
        # expiration . Amazon Translate doesn't scan all input files for the risk of CSV injection attacks.
        # CSV injection occurs when a .csv or .tsv file is altered so that a record contains malicious code.
        # The record begins with a special character, such as =, +, -, or @. When the file is opened in a
        # spreadsheet program, the program might interpret the record as a formula and run the code within it.
        # Before you download an input file from Amazon S3, ensure that you recognize the file and trust its
        # creator.
        @[JSON::Field(key: "Location")]
        getter location : String

        # The repository type for the custom terminology data.
        @[JSON::Field(key: "RepositoryType")]
        getter repository_type : String

        def initialize(
          @location : String,
          @repository_type : String
        )
        end
      end

      # The properties of the custom terminology.
      struct TerminologyProperties
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom terminology.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time at which the custom terminology was created, based on the timestamp.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The description of the custom terminology properties.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The directionality of your terminology resource indicates whether it has one source language
        # (uni-directional) or multiple (multi-directional). UNI The terminology resource has one source
        # language (the first column in a CSV file), and all of its other languages are target languages.
        # MULTI Any language in the terminology resource can be the source language.
        @[JSON::Field(key: "Directionality")]
        getter directionality : String?

        # The encryption key for the custom terminology.
        @[JSON::Field(key: "EncryptionKey")]
        getter encryption_key : Types::EncryptionKey?

        # The format of the custom terminology input file.
        @[JSON::Field(key: "Format")]
        getter format : String?

        # The time at which the custom terminology was last update, based on the timestamp.
        @[JSON::Field(key: "LastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # Additional information from Amazon Translate about the terminology resource.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The name of the custom terminology.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The size of the file used when importing a custom terminology.
        @[JSON::Field(key: "SizeBytes")]
        getter size_bytes : Int32?

        # The number of terms in the input file that Amazon Translate skipped when you created or updated the
        # terminology resource.
        @[JSON::Field(key: "SkippedTermCount")]
        getter skipped_term_count : Int32?

        # The language code for the source text of the translation request for which the custom terminology is
        # being used.
        @[JSON::Field(key: "SourceLanguageCode")]
        getter source_language_code : String?

        # The language codes for the target languages available with the custom terminology resource. All
        # possible target languages are returned in array.
        @[JSON::Field(key: "TargetLanguageCodes")]
        getter target_language_codes : Array(String)?

        # The number of terms included in the custom terminology.
        @[JSON::Field(key: "TermCount")]
        getter term_count : Int32?

        def initialize(
          @arn : String? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @directionality : String? = nil,
          @encryption_key : Types::EncryptionKey? = nil,
          @format : String? = nil,
          @last_updated_at : Time? = nil,
          @message : String? = nil,
          @name : String? = nil,
          @size_bytes : Int32? = nil,
          @skipped_term_count : Int32? = nil,
          @source_language_code : String? = nil,
          @target_language_codes : Array(String)? = nil,
          @term_count : Int32? = nil
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

      # Provides information for filtering a list of translation jobs. For more information, see
      # ListTextTranslationJobs .
      struct TextTranslationJobFilter
        include JSON::Serializable

        # Filters the list of jobs by name.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # Filters the list of jobs based by job status.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # Filters the list of jobs based on the time that the job was submitted for processing and returns
        # only the jobs submitted after the specified time. Jobs are returned in descending order, newest to
        # oldest.
        @[JSON::Field(key: "SubmittedAfterTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submitted_after_time : Time?

        # Filters the list of jobs based on the time that the job was submitted for processing and returns
        # only the jobs submitted before the specified time. Jobs are returned in ascending order, oldest to
        # newest.
        @[JSON::Field(key: "SubmittedBeforeTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submitted_before_time : Time?

        def initialize(
          @job_name : String? = nil,
          @job_status : String? = nil,
          @submitted_after_time : Time? = nil,
          @submitted_before_time : Time? = nil
        )
        end
      end

      # Provides information about a translation job.
      struct TextTranslationJobProperties
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an AWS Identity Access and Management (IAM) role that granted
        # Amazon Translate read access to the job's input data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The time at which the translation job ended.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The input configuration properties that were specified when the job was requested.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig?

        # The number of documents successfully and unsuccessfully processed during the translation job.
        @[JSON::Field(key: "JobDetails")]
        getter job_details : Types::JobDetails?

        # The ID of the translation job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The user-defined name of the translation job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # The status of the translation job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # An explanation of any errors that may have occurred during the translation job.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The output configuration properties that were specified when the job was requested.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig?

        # A list containing the names of the parallel data resources applied to the translation job.
        @[JSON::Field(key: "ParallelDataNames")]
        getter parallel_data_names : Array(String)?

        # Settings that modify the translation output.
        @[JSON::Field(key: "Settings")]
        getter settings : Types::TranslationSettings?

        # The language code of the language of the source text. The language must be a language supported by
        # Amazon Translate.
        @[JSON::Field(key: "SourceLanguageCode")]
        getter source_language_code : String?

        # The time at which the translation job was submitted.
        @[JSON::Field(key: "SubmittedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submitted_time : Time?

        # The language code of the language of the target text. The language must be a language supported by
        # Amazon Translate.
        @[JSON::Field(key: "TargetLanguageCodes")]
        getter target_language_codes : Array(String)?

        # A list containing the names of the terminologies applied to a translation job. Only one terminology
        # can be applied per StartTextTranslationJob request at this time.
        @[JSON::Field(key: "TerminologyNames")]
        getter terminology_names : Array(String)?

        def initialize(
          @data_access_role_arn : String? = nil,
          @end_time : Time? = nil,
          @input_data_config : Types::InputDataConfig? = nil,
          @job_details : Types::JobDetails? = nil,
          @job_id : String? = nil,
          @job_name : String? = nil,
          @job_status : String? = nil,
          @message : String? = nil,
          @output_data_config : Types::OutputDataConfig? = nil,
          @parallel_data_names : Array(String)? = nil,
          @settings : Types::TranslationSettings? = nil,
          @source_language_code : String? = nil,
          @submitted_time : Time? = nil,
          @target_language_codes : Array(String)? = nil,
          @terminology_names : Array(String)? = nil
        )
        end
      end

      # You have made too many requests within a short period of time. Wait for a short time and then try
      # your request again.
      struct TooManyRequestsException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You have added too many tags to this resource. The maximum is 50 tags.
      struct TooManyTagsException
        include JSON::Serializable

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @resource_arn : String? = nil,
          @message : String? = nil
        )
        end
      end

      struct TranslateDocumentRequest
        include JSON::Serializable

        # The content and content type for the document to be translated. The document size must not exceed
        # 100 KB.
        @[JSON::Field(key: "Document")]
        getter document : Types::Document

        # The language code for the language of the source text. For a list of supported language codes, see
        # Supported languages . To have Amazon Translate determine the source language of your text, you can
        # specify auto in the SourceLanguageCode field. If you specify auto , Amazon Translate will call
        # Amazon Comprehend to determine the source language. If you specify auto , you must send the
        # TranslateDocument request in a region that supports Amazon Comprehend. Otherwise, the request
        # returns an error indicating that autodetect is not supported.
        @[JSON::Field(key: "SourceLanguageCode")]
        getter source_language_code : String

        # The language code requested for the translated document. For a list of supported language codes, see
        # Supported languages .
        @[JSON::Field(key: "TargetLanguageCode")]
        getter target_language_code : String

        # Settings to configure your translation output. You can configure the following options: Brevity: not
        # supported. Formality: sets the formality level of the output text. Profanity: masks profane words
        # and phrases in your translation output.
        @[JSON::Field(key: "Settings")]
        getter settings : Types::TranslationSettings?

        # The name of a terminology list file to add to the translation job. This file provides source terms
        # and the desired translation for each term. A terminology list can contain a maximum of 256 terms.
        # You can use one custom terminology resource in your translation request. Use the ListTerminologies
        # operation to get the available terminology lists. For more information about custom terminology
        # lists, see Custom terminology .
        @[JSON::Field(key: "TerminologyNames")]
        getter terminology_names : Array(String)?

        def initialize(
          @document : Types::Document,
          @source_language_code : String,
          @target_language_code : String,
          @settings : Types::TranslationSettings? = nil,
          @terminology_names : Array(String)? = nil
        )
        end
      end

      struct TranslateDocumentResponse
        include JSON::Serializable

        # The language code of the source document.
        @[JSON::Field(key: "SourceLanguageCode")]
        getter source_language_code : String

        # The language code of the translated document.
        @[JSON::Field(key: "TargetLanguageCode")]
        getter target_language_code : String

        # The document containing the translated content. The document format matches the source document
        # format.
        @[JSON::Field(key: "TranslatedDocument")]
        getter translated_document : Types::TranslatedDocument

        @[JSON::Field(key: "AppliedSettings")]
        getter applied_settings : Types::TranslationSettings?

        # The names of the custom terminologies applied to the input text by Amazon Translate to produce the
        # translated text document.
        @[JSON::Field(key: "AppliedTerminologies")]
        getter applied_terminologies : Array(Types::AppliedTerminology)?

        def initialize(
          @source_language_code : String,
          @target_language_code : String,
          @translated_document : Types::TranslatedDocument,
          @applied_settings : Types::TranslationSettings? = nil,
          @applied_terminologies : Array(Types::AppliedTerminology)? = nil
        )
        end
      end

      struct TranslateTextRequest
        include JSON::Serializable

        # The language code for the language of the source text. For a list of language codes, see Supported
        # languages . To have Amazon Translate determine the source language of your text, you can specify
        # auto in the SourceLanguageCode field. If you specify auto , Amazon Translate will call Amazon
        # Comprehend to determine the source language. If you specify auto , you must send the TranslateText
        # request in a region that supports Amazon Comprehend. Otherwise, the request returns an error
        # indicating that autodetect is not supported.
        @[JSON::Field(key: "SourceLanguageCode")]
        getter source_language_code : String

        # The language code requested for the language of the target text. For a list of language codes, see
        # Supported languages .
        @[JSON::Field(key: "TargetLanguageCode")]
        getter target_language_code : String

        # The text to translate. The text string can be a maximum of 10,000 bytes long. Depending on your
        # character set, this may be fewer than 10,000 characters.
        @[JSON::Field(key: "Text")]
        getter text : String

        # Settings to configure your translation output. You can configure the following options: Brevity:
        # reduces the length of the translated output for most translations. Formality: sets the formality
        # level of the output text. Profanity: masks profane words and phrases in your translation output.
        @[JSON::Field(key: "Settings")]
        getter settings : Types::TranslationSettings?

        # The name of a terminology list file to add to the translation job. This file provides source terms
        # and the desired translation for each term. A terminology list can contain a maximum of 256 terms.
        # You can use one custom terminology resource in your translation request. Use the ListTerminologies
        # operation to get the available terminology lists. For more information about custom terminology
        # lists, see Custom terminology .
        @[JSON::Field(key: "TerminologyNames")]
        getter terminology_names : Array(String)?

        def initialize(
          @source_language_code : String,
          @target_language_code : String,
          @text : String,
          @settings : Types::TranslationSettings? = nil,
          @terminology_names : Array(String)? = nil
        )
        end
      end

      struct TranslateTextResponse
        include JSON::Serializable

        # The language code for the language of the source text.
        @[JSON::Field(key: "SourceLanguageCode")]
        getter source_language_code : String

        # The language code for the language of the target text.
        @[JSON::Field(key: "TargetLanguageCode")]
        getter target_language_code : String

        # The translated text.
        @[JSON::Field(key: "TranslatedText")]
        getter translated_text : String

        # Optional settings that modify the translation output.
        @[JSON::Field(key: "AppliedSettings")]
        getter applied_settings : Types::TranslationSettings?

        # The names of the custom terminologies applied to the input text by Amazon Translate for the
        # translated text response.
        @[JSON::Field(key: "AppliedTerminologies")]
        getter applied_terminologies : Array(Types::AppliedTerminology)?

        def initialize(
          @source_language_code : String,
          @target_language_code : String,
          @translated_text : String,
          @applied_settings : Types::TranslationSettings? = nil,
          @applied_terminologies : Array(Types::AppliedTerminology)? = nil
        )
        end
      end

      # The translated content.
      struct TranslatedDocument
        include JSON::Serializable

        # The document containing the translated content.
        @[JSON::Field(key: "Content")]
        getter content : Bytes

        def initialize(
          @content : Bytes
        )
        end
      end

      # Settings to configure your translation output. You can configure the following options: Brevity:
      # reduces the length of the translation output for most translations. Available for TranslateText
      # only. Formality: sets the formality level of the translation output. Profanity: masks profane words
      # and phrases in the translation output.
      struct TranslationSettings
        include JSON::Serializable

        # When you turn on brevity, Amazon Translate reduces the length of the translation output for most
        # translations (when compared with the same translation with brevity turned off). By default, brevity
        # is turned off. If you turn on brevity for a translation request with an unsupported language pair,
        # the translation proceeds with the brevity setting turned off. For the language pairs that brevity
        # supports, see Using brevity in the Amazon Translate Developer Guide.
        @[JSON::Field(key: "Brevity")]
        getter brevity : String?

        # You can specify the desired level of formality for translations to supported target languages. The
        # formality setting controls the level of formal language usage (also known as register ) in the
        # translation output. You can set the value to informal or formal. If you don't specify a value for
        # formality, or if the target language doesn't support formality, the translation will ignore the
        # formality setting. If you specify multiple target languages for the job, translate ignores the
        # formality setting for any unsupported target language. For a list of target languages that support
        # formality, see Supported languages in the Amazon Translate Developer Guide.
        @[JSON::Field(key: "Formality")]
        getter formality : String?

        # You can enable the profanity setting if you want to mask profane words and phrases in your
        # translation output. To mask profane words and phrases, Amazon Translate replaces them with the
        # grawlix string “?$#@$“. This 5-character sequence is used for each profane word or phrase,
        # regardless of the length or number of words. Amazon Translate doesn't detect profanity in all of its
        # supported languages. For languages that don't support profanity detection, see Unsupported languages
        # in the Amazon Translate Developer Guide. If you specify multiple target languages for the job, all
        # the target languages must support profanity masking. If any of the target languages don't support
        # profanity masking, the translation job won't mask profanity for any target language.
        @[JSON::Field(key: "Profanity")]
        getter profanity : String?

        def initialize(
          @brevity : String? = nil,
          @formality : String? = nil,
          @profanity : String? = nil
        )
        end
      end

      # Requested display language code is not supported.
      struct UnsupportedDisplayLanguageCodeException
        include JSON::Serializable

        # Language code passed in with the request.
        @[JSON::Field(key: "DisplayLanguageCode")]
        getter display_language_code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @display_language_code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Amazon Translate does not support translation from the language of the source text into the
      # requested target language. For more information, see Supported languages .
      struct UnsupportedLanguagePairException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The language code for the language of the input text.
        @[JSON::Field(key: "SourceLanguageCode")]
        getter source_language_code : String?

        # The language code for the language of the translated text.
        @[JSON::Field(key: "TargetLanguageCode")]
        getter target_language_code : String?

        def initialize(
          @message : String? = nil,
          @source_language_code : String? = nil,
          @target_language_code : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the given Amazon Translate resource from which you want to remove
        # the tags.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The initial part of a key-value pair that forms a tag being removed from a given resource. Keys must
        # be unique and cannot be duplicated for a particular resource.
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

      struct UpdateParallelDataRequest
        include JSON::Serializable

        # A unique identifier for the request. This token is automatically generated when you use Amazon
        # Translate through an AWS SDK.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The name of the parallel data resource being updated.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies the format and S3 location of the parallel data input file.
        @[JSON::Field(key: "ParallelDataConfig")]
        getter parallel_data_config : Types::ParallelDataConfig

        # A custom description for the parallel data resource in Amazon Translate.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @client_token : String,
          @name : String,
          @parallel_data_config : Types::ParallelDataConfig,
          @description : String? = nil
        )
        end
      end

      struct UpdateParallelDataResponse
        include JSON::Serializable

        # The time that the most recent update was attempted.
        @[JSON::Field(key: "LatestUpdateAttemptAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter latest_update_attempt_at : Time?

        # The status of the parallel data update attempt. When the updated parallel data resource is ready for
        # you to use, the status is ACTIVE .
        @[JSON::Field(key: "LatestUpdateAttemptStatus")]
        getter latest_update_attempt_status : String?

        # The name of the parallel data resource being updated.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The status of the parallel data resource that you are attempting to update. Your update request is
        # accepted only if this status is either ACTIVE or FAILED .
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @latest_update_attempt_at : Time? = nil,
          @latest_update_attempt_status : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end
    end
  end
end
