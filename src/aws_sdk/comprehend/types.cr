require "json"
require "time"

module AwsSdk
  module Comprehend
    module Types

      # An augmented manifest file that provides training data for your custom model. An augmented manifest
      # file is a labeled dataset that is produced by Amazon SageMaker Ground Truth.
      struct AugmentedManifestsListItem
        include JSON::Serializable

        # The JSON attribute that contains the annotations for your training documents. The number of
        # attribute names that you specify depends on whether your augmented manifest file is the output of a
        # single labeling job or a chained labeling job. If your file is the output of a single labeling job,
        # specify the LabelAttributeName key that was used when the job was created in Ground Truth. If your
        # file is the output of a chained labeling job, specify the LabelAttributeName key for one or more
        # jobs in the chain. Each LabelAttributeName key provides the annotations from an individual job.
        @[JSON::Field(key: "AttributeNames")]
        getter attribute_names : Array(String)

        # The Amazon S3 location of the augmented manifest file.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        # The S3 prefix to the annotation files that are referred in the augmented manifest file.
        @[JSON::Field(key: "AnnotationDataS3Uri")]
        getter annotation_data_s3_uri : String?

        # The type of augmented manifest. PlainTextDocument or SemiStructuredDocument. If you don't specify,
        # the default is PlainTextDocument. PLAIN_TEXT_DOCUMENT A document type that represents any unicode
        # text that is encoded in UTF-8. SEMI_STRUCTURED_DOCUMENT A document type with positional and
        # structural context, like a PDF. For training with Amazon Comprehend, only PDFs are supported. For
        # inference, Amazon Comprehend support PDFs, DOCX and TXT.
        @[JSON::Field(key: "DocumentType")]
        getter document_type : String?

        # The S3 prefix to the source files (PDFs) that are referred to in the augmented manifest file.
        @[JSON::Field(key: "SourceDocumentsS3Uri")]
        getter source_documents_s3_uri : String?

        # The purpose of the data you've provided in the augmented manifest. You can either train or test this
        # data. If you don't specify, the default is train. TRAIN - all of the documents in the manifest will
        # be used for training. If no test documents are provided, Amazon Comprehend will automatically
        # reserve a portion of the training documents for testing. TEST - all of the documents in the manifest
        # will be used for testing.
        @[JSON::Field(key: "Split")]
        getter split : String?

        def initialize(
          @attribute_names : Array(String),
          @s3_uri : String,
          @annotation_data_s3_uri : String? = nil,
          @document_type : String? = nil,
          @source_documents_s3_uri : String? = nil,
          @split : String? = nil
        )
        end
      end

      # The result of calling the operation. The operation returns one object for each document that is
      # successfully processed by the operation.
      struct BatchDetectDominantLanguageItemResult
        include JSON::Serializable

        # The zero-based index of the document in the input list.
        @[JSON::Field(key: "Index")]
        getter index : Int32?

        # One or more DominantLanguage objects describing the dominant languages in the document.
        @[JSON::Field(key: "Languages")]
        getter languages : Array(Types::DominantLanguage)?

        def initialize(
          @index : Int32? = nil,
          @languages : Array(Types::DominantLanguage)? = nil
        )
        end
      end

      struct BatchDetectDominantLanguageRequest
        include JSON::Serializable

        # A list containing the UTF-8 encoded text of the input documents. The list can contain a maximum of
        # 25 documents. Each document should contain at least 20 characters. The maximum size of each document
        # is 5 KB.
        @[JSON::Field(key: "TextList")]
        getter text_list : Array(String)

        def initialize(
          @text_list : Array(String)
        )
        end
      end

      struct BatchDetectDominantLanguageResponse
        include JSON::Serializable

        # A list containing one object for each document that contained an error. The results are sorted in
        # ascending order by the Index field and match the order of the documents in the input list. If there
        # are no errors in the batch, the ErrorList is empty.
        @[JSON::Field(key: "ErrorList")]
        getter error_list : Array(Types::BatchItemError)

        # A list of objects containing the results of the operation. The results are sorted in ascending order
        # by the Index field and match the order of the documents in the input list. If all of the documents
        # contain an error, the ResultList is empty.
        @[JSON::Field(key: "ResultList")]
        getter result_list : Array(Types::BatchDetectDominantLanguageItemResult)

        def initialize(
          @error_list : Array(Types::BatchItemError),
          @result_list : Array(Types::BatchDetectDominantLanguageItemResult)
        )
        end
      end

      # The result of calling the operation. The operation returns one object for each document that is
      # successfully processed by the operation.
      struct BatchDetectEntitiesItemResult
        include JSON::Serializable

        # One or more Entity objects, one for each entity detected in the document.
        @[JSON::Field(key: "Entities")]
        getter entities : Array(Types::Entity)?

        # The zero-based index of the document in the input list.
        @[JSON::Field(key: "Index")]
        getter index : Int32?

        def initialize(
          @entities : Array(Types::Entity)? = nil,
          @index : Int32? = nil
        )
        end
      end

      struct BatchDetectEntitiesRequest
        include JSON::Serializable

        # The language of the input documents. You can specify any of the primary languages supported by
        # Amazon Comprehend. All documents must be in the same language.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # A list containing the UTF-8 encoded text of the input documents. The list can contain a maximum of
        # 25 documents. The maximum size of each document is 5 KB.
        @[JSON::Field(key: "TextList")]
        getter text_list : Array(String)

        def initialize(
          @language_code : String,
          @text_list : Array(String)
        )
        end
      end

      struct BatchDetectEntitiesResponse
        include JSON::Serializable

        # A list containing one object for each document that contained an error. The results are sorted in
        # ascending order by the Index field and match the order of the documents in the input list. If there
        # are no errors in the batch, the ErrorList is empty.
        @[JSON::Field(key: "ErrorList")]
        getter error_list : Array(Types::BatchItemError)

        # A list of objects containing the results of the operation. The results are sorted in ascending order
        # by the Index field and match the order of the documents in the input list. If all of the documents
        # contain an error, the ResultList is empty.
        @[JSON::Field(key: "ResultList")]
        getter result_list : Array(Types::BatchDetectEntitiesItemResult)

        def initialize(
          @error_list : Array(Types::BatchItemError),
          @result_list : Array(Types::BatchDetectEntitiesItemResult)
        )
        end
      end

      # The result of calling the operation. The operation returns one object for each document that is
      # successfully processed by the operation.
      struct BatchDetectKeyPhrasesItemResult
        include JSON::Serializable

        # The zero-based index of the document in the input list.
        @[JSON::Field(key: "Index")]
        getter index : Int32?

        # One or more KeyPhrase objects, one for each key phrase detected in the document.
        @[JSON::Field(key: "KeyPhrases")]
        getter key_phrases : Array(Types::KeyPhrase)?

        def initialize(
          @index : Int32? = nil,
          @key_phrases : Array(Types::KeyPhrase)? = nil
        )
        end
      end

      struct BatchDetectKeyPhrasesRequest
        include JSON::Serializable

        # The language of the input documents. You can specify any of the primary languages supported by
        # Amazon Comprehend. All documents must be in the same language.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # A list containing the UTF-8 encoded text of the input documents. The list can contain a maximum of
        # 25 documents. The maximum size of each document is 5 KB.
        @[JSON::Field(key: "TextList")]
        getter text_list : Array(String)

        def initialize(
          @language_code : String,
          @text_list : Array(String)
        )
        end
      end

      struct BatchDetectKeyPhrasesResponse
        include JSON::Serializable

        # A list containing one object for each document that contained an error. The results are sorted in
        # ascending order by the Index field and match the order of the documents in the input list. If there
        # are no errors in the batch, the ErrorList is empty.
        @[JSON::Field(key: "ErrorList")]
        getter error_list : Array(Types::BatchItemError)

        # A list of objects containing the results of the operation. The results are sorted in ascending order
        # by the Index field and match the order of the documents in the input list. If all of the documents
        # contain an error, the ResultList is empty.
        @[JSON::Field(key: "ResultList")]
        getter result_list : Array(Types::BatchDetectKeyPhrasesItemResult)

        def initialize(
          @error_list : Array(Types::BatchItemError),
          @result_list : Array(Types::BatchDetectKeyPhrasesItemResult)
        )
        end
      end

      # The result of calling the operation. The operation returns one object for each document that is
      # successfully processed by the operation.
      struct BatchDetectSentimentItemResult
        include JSON::Serializable

        # The zero-based index of the document in the input list.
        @[JSON::Field(key: "Index")]
        getter index : Int32?

        # The sentiment detected in the document.
        @[JSON::Field(key: "Sentiment")]
        getter sentiment : String?

        # The level of confidence that Amazon Comprehend has in the accuracy of its sentiment detection.
        @[JSON::Field(key: "SentimentScore")]
        getter sentiment_score : Types::SentimentScore?

        def initialize(
          @index : Int32? = nil,
          @sentiment : String? = nil,
          @sentiment_score : Types::SentimentScore? = nil
        )
        end
      end

      struct BatchDetectSentimentRequest
        include JSON::Serializable

        # The language of the input documents. You can specify any of the primary languages supported by
        # Amazon Comprehend. All documents must be in the same language.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # A list containing the UTF-8 encoded text of the input documents. The list can contain a maximum of
        # 25 documents. The maximum size of each document is 5 KB.
        @[JSON::Field(key: "TextList")]
        getter text_list : Array(String)

        def initialize(
          @language_code : String,
          @text_list : Array(String)
        )
        end
      end

      struct BatchDetectSentimentResponse
        include JSON::Serializable

        # A list containing one object for each document that contained an error. The results are sorted in
        # ascending order by the Index field and match the order of the documents in the input list. If there
        # are no errors in the batch, the ErrorList is empty.
        @[JSON::Field(key: "ErrorList")]
        getter error_list : Array(Types::BatchItemError)

        # A list of objects containing the results of the operation. The results are sorted in ascending order
        # by the Index field and match the order of the documents in the input list. If all of the documents
        # contain an error, the ResultList is empty.
        @[JSON::Field(key: "ResultList")]
        getter result_list : Array(Types::BatchDetectSentimentItemResult)

        def initialize(
          @error_list : Array(Types::BatchItemError),
          @result_list : Array(Types::BatchDetectSentimentItemResult)
        )
        end
      end

      # The result of calling the operation. The operation returns one object that is successfully processed
      # by the operation.
      struct BatchDetectSyntaxItemResult
        include JSON::Serializable

        # The zero-based index of the document in the input list.
        @[JSON::Field(key: "Index")]
        getter index : Int32?

        # The syntax tokens for the words in the document, one token for each word.
        @[JSON::Field(key: "SyntaxTokens")]
        getter syntax_tokens : Array(Types::SyntaxToken)?

        def initialize(
          @index : Int32? = nil,
          @syntax_tokens : Array(Types::SyntaxToken)? = nil
        )
        end
      end

      struct BatchDetectSyntaxRequest
        include JSON::Serializable

        # The language of the input documents. You can specify any of the following languages supported by
        # Amazon Comprehend: German ("de"), English ("en"), Spanish ("es"), French ("fr"), Italian ("it"), or
        # Portuguese ("pt"). All documents must be in the same language.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # A list containing the UTF-8 encoded text of the input documents. The list can contain a maximum of
        # 25 documents. The maximum size for each document is 5 KB.
        @[JSON::Field(key: "TextList")]
        getter text_list : Array(String)

        def initialize(
          @language_code : String,
          @text_list : Array(String)
        )
        end
      end

      struct BatchDetectSyntaxResponse
        include JSON::Serializable

        # A list containing one object for each document that contained an error. The results are sorted in
        # ascending order by the Index field and match the order of the documents in the input list. If there
        # are no errors in the batch, the ErrorList is empty.
        @[JSON::Field(key: "ErrorList")]
        getter error_list : Array(Types::BatchItemError)

        # A list of objects containing the results of the operation. The results are sorted in ascending order
        # by the Index field and match the order of the documents in the input list. If all of the documents
        # contain an error, the ResultList is empty.
        @[JSON::Field(key: "ResultList")]
        getter result_list : Array(Types::BatchDetectSyntaxItemResult)

        def initialize(
          @error_list : Array(Types::BatchItemError),
          @result_list : Array(Types::BatchDetectSyntaxItemResult)
        )
        end
      end

      # Analysis results for one of the documents in the batch.
      struct BatchDetectTargetedSentimentItemResult
        include JSON::Serializable

        # An array of targeted sentiment entities.
        @[JSON::Field(key: "Entities")]
        getter entities : Array(Types::TargetedSentimentEntity)?

        # The zero-based index of this result in the input list.
        @[JSON::Field(key: "Index")]
        getter index : Int32?

        def initialize(
          @entities : Array(Types::TargetedSentimentEntity)? = nil,
          @index : Int32? = nil
        )
        end
      end

      struct BatchDetectTargetedSentimentRequest
        include JSON::Serializable

        # The language of the input documents. Currently, English is the only supported language.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # A list containing the UTF-8 encoded text of the input documents. The list can contain a maximum of
        # 25 documents. The maximum size of each document is 5 KB.
        @[JSON::Field(key: "TextList")]
        getter text_list : Array(String)

        def initialize(
          @language_code : String,
          @text_list : Array(String)
        )
        end
      end

      struct BatchDetectTargetedSentimentResponse
        include JSON::Serializable

        # List of errors that the operation can return.
        @[JSON::Field(key: "ErrorList")]
        getter error_list : Array(Types::BatchItemError)

        # A list of objects containing the results of the operation. The results are sorted in ascending order
        # by the Index field and match the order of the documents in the input list. If all of the documents
        # contain an error, the ResultList is empty.
        @[JSON::Field(key: "ResultList")]
        getter result_list : Array(Types::BatchDetectTargetedSentimentItemResult)

        def initialize(
          @error_list : Array(Types::BatchItemError),
          @result_list : Array(Types::BatchDetectTargetedSentimentItemResult)
        )
        end
      end

      # Describes an error that occurred while processing a document in a batch. The operation returns on
      # BatchItemError object for each document that contained an error.
      struct BatchItemError
        include JSON::Serializable

        # The numeric error code of the error.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # A text description of the error.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The zero-based index of the document in the input list.
        @[JSON::Field(key: "Index")]
        getter index : Int32?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @index : Int32? = nil
        )
        end
      end

      # The number of documents in the request exceeds the limit of 25. Try your request again with fewer
      # documents.
      struct BatchSizeLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about each word or line of text in the input document. For additional information, see
      # Block in the Amazon Textract API reference.
      struct Block
        include JSON::Serializable

        # The block represents a line of text or one word of text. WORD - A word that's detected on a document
        # page. A word is one or more ISO basic Latin script characters that aren't separated by spaces. LINE
        # - A string of tab-delimited, contiguous words that are detected on a document page
        @[JSON::Field(key: "BlockType")]
        getter block_type : String?

        # Co-ordinates of the rectangle or polygon that contains the text.
        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::Geometry?

        # Unique identifier for the block.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # Page number where the block appears.
        @[JSON::Field(key: "Page")]
        getter page : Int32?

        # A list of child blocks of the current block. For example, a LINE object has child blocks for each
        # WORD block that's part of the line of text.
        @[JSON::Field(key: "Relationships")]
        getter relationships : Array(Types::RelationshipsListItem)?

        # The word or line of text extracted from the block.
        @[JSON::Field(key: "Text")]
        getter text : String?

        def initialize(
          @block_type : String? = nil,
          @geometry : Types::Geometry? = nil,
          @id : String? = nil,
          @page : Int32? = nil,
          @relationships : Array(Types::RelationshipsListItem)? = nil,
          @text : String? = nil
        )
        end
      end

      # A reference to a block.
      struct BlockReference
        include JSON::Serializable

        # Offset of the start of the block within its parent block.
        @[JSON::Field(key: "BeginOffset")]
        getter begin_offset : Int32?

        # Unique identifier for the block.
        @[JSON::Field(key: "BlockId")]
        getter block_id : String?

        # List of child blocks within this block.
        @[JSON::Field(key: "ChildBlocks")]
        getter child_blocks : Array(Types::ChildBlock)?

        # Offset of the end of the block within its parent block.
        @[JSON::Field(key: "EndOffset")]
        getter end_offset : Int32?

        def initialize(
          @begin_offset : Int32? = nil,
          @block_id : String? = nil,
          @child_blocks : Array(Types::ChildBlock)? = nil,
          @end_offset : Int32? = nil
        )
        end
      end

      # The bounding box around the detected page or around an element on a document page. The left
      # (x-coordinate) and top (y-coordinate) are coordinates that represent the top and left sides of the
      # bounding box. Note that the upper-left corner of the image is the origin (0,0). For additional
      # information, see BoundingBox in the Amazon Textract API reference.
      struct BoundingBox
        include JSON::Serializable

        # The height of the bounding box as a ratio of the overall document page height.
        @[JSON::Field(key: "Height")]
        getter height : Float64?

        # The left coordinate of the bounding box as a ratio of overall document page width.
        @[JSON::Field(key: "Left")]
        getter left : Float64?

        # The top coordinate of the bounding box as a ratio of overall document page height.
        @[JSON::Field(key: "Top")]
        getter top : Float64?

        # The width of the bounding box as a ratio of the overall document page width.
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

      # Nested block contained within a block.
      struct ChildBlock
        include JSON::Serializable

        # Offset of the start of the child block within its parent block.
        @[JSON::Field(key: "BeginOffset")]
        getter begin_offset : Int32?

        # Unique identifier for the child block.
        @[JSON::Field(key: "ChildBlockId")]
        getter child_block_id : String?

        # Offset of the end of the child block within its parent block.
        @[JSON::Field(key: "EndOffset")]
        getter end_offset : Int32?

        def initialize(
          @begin_offset : Int32? = nil,
          @child_block_id : String? = nil,
          @end_offset : Int32? = nil
        )
        end
      end

      # Describes the result metrics for the test data associated with an documentation classifier.
      struct ClassifierEvaluationMetrics
        include JSON::Serializable

        # The fraction of the labels that were correct recognized. It is computed by dividing the number of
        # labels in the test documents that were correctly recognized by the total number of labels in the
        # test documents.
        @[JSON::Field(key: "Accuracy")]
        getter accuracy : Float64?

        # A measure of how accurate the classifier results are for the test data. It is derived from the
        # Precision and Recall values. The F1Score is the harmonic average of the two scores. The highest
        # score is 1, and the worst score is 0.
        @[JSON::Field(key: "F1Score")]
        getter f1_score : Float64?

        # Indicates the fraction of labels that are incorrectly predicted. Also seen as the fraction of wrong
        # labels compared to the total number of labels. Scores closer to zero are better.
        @[JSON::Field(key: "HammingLoss")]
        getter hamming_loss : Float64?

        # A measure of how accurate the classifier results are for the test data. It is a combination of the
        # Micro Precision and Micro Recall values. The Micro F1Score is the harmonic mean of the two scores.
        # The highest score is 1, and the worst score is 0.
        @[JSON::Field(key: "MicroF1Score")]
        getter micro_f1_score : Float64?

        # A measure of the usefulness of the recognizer results in the test data. High precision means that
        # the recognizer returned substantially more relevant results than irrelevant ones. Unlike the
        # Precision metric which comes from averaging the precision of all available labels, this is based on
        # the overall score of all precision scores added together.
        @[JSON::Field(key: "MicroPrecision")]
        getter micro_precision : Float64?

        # A measure of how complete the classifier results are for the test data. High recall means that the
        # classifier returned most of the relevant results. Specifically, this indicates how many of the
        # correct categories in the text that the model can predict. It is a percentage of correct categories
        # in the text that can found. Instead of averaging the recall scores of all labels (as with Recall),
        # micro Recall is based on the overall score of all recall scores added together.
        @[JSON::Field(key: "MicroRecall")]
        getter micro_recall : Float64?

        # A measure of the usefulness of the classifier results in the test data. High precision means that
        # the classifier returned substantially more relevant results than irrelevant ones.
        @[JSON::Field(key: "Precision")]
        getter precision : Float64?

        # A measure of how complete the classifier results are for the test data. High recall means that the
        # classifier returned most of the relevant results.
        @[JSON::Field(key: "Recall")]
        getter recall : Float64?

        def initialize(
          @accuracy : Float64? = nil,
          @f1_score : Float64? = nil,
          @hamming_loss : Float64? = nil,
          @micro_f1_score : Float64? = nil,
          @micro_precision : Float64? = nil,
          @micro_recall : Float64? = nil,
          @precision : Float64? = nil,
          @recall : Float64? = nil
        )
        end
      end

      # Provides information about a document classifier.
      struct ClassifierMetadata
        include JSON::Serializable

        # Describes the result metrics for the test data associated with an documentation classifier.
        @[JSON::Field(key: "EvaluationMetrics")]
        getter evaluation_metrics : Types::ClassifierEvaluationMetrics?

        # The number of labels in the input data.
        @[JSON::Field(key: "NumberOfLabels")]
        getter number_of_labels : Int32?

        # The number of documents in the input data that were used to test the classifier. Typically this is
        # 10 to 20 percent of the input documents, up to 10,000 documents.
        @[JSON::Field(key: "NumberOfTestDocuments")]
        getter number_of_test_documents : Int32?

        # The number of documents in the input data that were used to train the classifier. Typically this is
        # 80 to 90 percent of the input documents.
        @[JSON::Field(key: "NumberOfTrainedDocuments")]
        getter number_of_trained_documents : Int32?

        def initialize(
          @evaluation_metrics : Types::ClassifierEvaluationMetrics? = nil,
          @number_of_labels : Int32? = nil,
          @number_of_test_documents : Int32? = nil,
          @number_of_trained_documents : Int32? = nil
        )
        end
      end

      struct ClassifyDocumentRequest
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the endpoint. For prompt safety classification, Amazon
        # Comprehend provides the endpoint ARN. For more information about prompt safety classifiers, see
        # Prompt safety classification in the Amazon Comprehend Developer Guide For custom classification, you
        # create an endpoint for your custom model. For more information, see Using Amazon Comprehend
        # endpoints .
        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String

        # Use the Bytes parameter to input a text, PDF, Word or image file. When you classify a document using
        # a custom model, you can also use the Bytes parameter to input an Amazon Textract DetectDocumentText
        # or AnalyzeDocument output file. To classify a document using the prompt safety classifier, use the
        # Text parameter for input. Provide the input document as a sequence of base64-encoded bytes. If your
        # code uses an Amazon Web Services SDK to classify documents, the SDK may encode the document file
        # bytes for you. The maximum length of this field depends on the input document type. For details, see
        # Inputs for real-time custom analysis in the Comprehend Developer Guide. If you use the Bytes
        # parameter, do not use the Text parameter.
        @[JSON::Field(key: "Bytes")]
        getter bytes : Bytes?

        # Provides configuration parameters to override the default actions for extracting text from PDF
        # documents and image files.
        @[JSON::Field(key: "DocumentReaderConfig")]
        getter document_reader_config : Types::DocumentReaderConfig?

        # The document text to be analyzed. If you enter text using this parameter, do not use the Bytes
        # parameter.
        @[JSON::Field(key: "Text")]
        getter text : String?

        def initialize(
          @endpoint_arn : String,
          @bytes : Bytes? = nil,
          @document_reader_config : Types::DocumentReaderConfig? = nil,
          @text : String? = nil
        )
        end
      end

      struct ClassifyDocumentResponse
        include JSON::Serializable

        # The classes used by the document being analyzed. These are used for models trained in multi-class
        # mode. Individual classes are mutually exclusive and each document is expected to have only a single
        # class assigned to it. For example, an animal can be a dog or a cat, but not both at the same time.
        # For prompt safety classification, the response includes only two classes (SAFE_PROMPT and
        # UNSAFE_PROMPT), along with a confidence score for each class. The value range of the score is zero
        # to one, where one is the highest confidence.
        @[JSON::Field(key: "Classes")]
        getter classes : Array(Types::DocumentClass)?

        # Extraction information about the document. This field is present in the response only if your
        # request includes the Byte parameter.
        @[JSON::Field(key: "DocumentMetadata")]
        getter document_metadata : Types::DocumentMetadata?

        # The document type for each page in the input document. This field is present in the response only if
        # your request includes the Byte parameter.
        @[JSON::Field(key: "DocumentType")]
        getter document_type : Array(Types::DocumentTypeListItem)?

        # Page-level errors that the system detected while processing the input document. The field is empty
        # if the system encountered no errors.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::ErrorsListItem)?

        # The labels used in the document being analyzed. These are used for multi-label trained models.
        # Individual labels represent different categories that are related in some manner and are not
        # mutually exclusive. For example, a movie can be just an action movie, or it can be an action movie,
        # a science fiction movie, and a comedy, all at the same time.
        @[JSON::Field(key: "Labels")]
        getter labels : Array(Types::DocumentLabel)?

        # Warnings detected while processing the input document. The response includes a warning if there is a
        # mismatch between the input document type and the model type associated with the endpoint that you
        # specified. The response can also include warnings for individual pages that have a mismatch. The
        # field is empty if the system generated no warnings.
        @[JSON::Field(key: "Warnings")]
        getter warnings : Array(Types::WarningsListItem)?

        def initialize(
          @classes : Array(Types::DocumentClass)? = nil,
          @document_metadata : Types::DocumentMetadata? = nil,
          @document_type : Array(Types::DocumentTypeListItem)? = nil,
          @errors : Array(Types::ErrorsListItem)? = nil,
          @labels : Array(Types::DocumentLabel)? = nil,
          @warnings : Array(Types::WarningsListItem)? = nil
        )
        end
      end

      # Concurrent modification of the tags associated with an Amazon Comprehend resource is not supported.
      struct ConcurrentModificationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ContainsPiiEntitiesRequest
        include JSON::Serializable

        # The language of the input documents.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # A UTF-8 text string. The maximum string size is 100 KB.
        @[JSON::Field(key: "Text")]
        getter text : String

        def initialize(
          @language_code : String,
          @text : String
        )
        end
      end

      struct ContainsPiiEntitiesResponse
        include JSON::Serializable

        # The labels used in the document being analyzed. Individual labels represent personally identifiable
        # information (PII) entity types.
        @[JSON::Field(key: "Labels")]
        getter labels : Array(Types::EntityLabel)?

        def initialize(
          @labels : Array(Types::EntityLabel)? = nil
        )
        end
      end

      struct CreateDatasetRequest
        include JSON::Serializable

        # Name of the dataset.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String

        # The Amazon Resource Number (ARN) of the flywheel of the flywheel to receive the data.
        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String

        # Information about the input data configuration. The type of input data varies based on the format of
        # the input and whether the data is for a classifier model or an entity recognition model.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::DatasetInputDataConfig

        # A unique identifier for the request. If you don't set the client request token, Amazon Comprehend
        # generates one.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The dataset type. You can specify that the data in a dataset is for training the model or for
        # testing the model.
        @[JSON::Field(key: "DatasetType")]
        getter dataset_type : String?

        # Description of the dataset.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Tags for the dataset.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @dataset_name : String,
          @flywheel_arn : String,
          @input_data_config : Types::DatasetInputDataConfig,
          @client_request_token : String? = nil,
          @dataset_type : String? = nil,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateDatasetResponse
        include JSON::Serializable

        # The ARN of the dataset.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String?

        def initialize(
          @dataset_arn : String? = nil
        )
        end
      end

      struct CreateDocumentClassifierRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # The name of the document classifier.
        @[JSON::Field(key: "DocumentClassifierName")]
        getter document_classifier_name : String

        # Specifies the format and location of the input data for the job.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::DocumentClassifierInputDataConfig

        # The language of the input documents. You can specify any of the languages supported by Amazon
        # Comprehend. All documents must be in the same language.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # A unique identifier for the request. If you don't set the client request token, Amazon Comprehend
        # generates one.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Indicates the mode in which the classifier will be trained. The classifier can be trained in
        # multi-class (single-label) mode or multi-label mode. Multi-class mode identifies a single class
        # label for each document and multi-label mode identifies one or more class labels for each document.
        # Multiple labels for an individual document are separated by a delimiter. The default delimiter
        # between labels is a pipe (|).
        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # ID for the KMS key that Amazon Comprehend uses to encrypt trained custom models. The ModelKmsKeyId
        # can be either of the following formats: KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon
        # Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "ModelKmsKeyId")]
        getter model_kms_key_id : String?

        # The resource-based policy to attach to your custom document classifier model. You can use this
        # policy to allow another Amazon Web Services account to import your custom model. Provide your policy
        # as a JSON body that you enter as a UTF-8 encoded string without line breaks. To provide valid JSON,
        # enclose the attribute names and values in double quotes. If the JSON body is also enclosed in double
        # quotes, then you must escape the double quotes that are inside the policy: "{\"attribute\":
        # \"value\", \"attribute\": [\"value\"]}" To avoid escaping quotes, you can use single quotes to
        # enclose the policy and double quotes to enclose the JSON names and values: '{"attribute": "value",
        # "attribute": ["value"]}'
        @[JSON::Field(key: "ModelPolicy")]
        getter model_policy : String?

        # Specifies the location for the output files from a custom classifier job. This parameter is required
        # for a request that creates a native document model.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::DocumentClassifierOutputDataConfig?

        # Tags to associate with the document classifier. A tag is a key-value pair that adds as a metadata to
        # a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a
        # resource to indicate its use by the sales department.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The version name given to the newly created classifier. Version names can have a maximum of 256
        # characters. Alphanumeric characters, hyphens (-) and underscores (_) are allowed. The version name
        # must be unique among all models with the same classifier name in the Amazon Web Services
        # account/Amazon Web Services Region.
        @[JSON::Field(key: "VersionName")]
        getter version_name : String?

        # ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend uses to
        # encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis
        # job. The VolumeKmsKeyId can be either of the following formats: KMS Key ID:
        # "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        # Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the
        # resources you are using for your custom classifier. For more information, see Amazon VPC .
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @data_access_role_arn : String,
          @document_classifier_name : String,
          @input_data_config : Types::DocumentClassifierInputDataConfig,
          @language_code : String,
          @client_request_token : String? = nil,
          @mode : String? = nil,
          @model_kms_key_id : String? = nil,
          @model_policy : String? = nil,
          @output_data_config : Types::DocumentClassifierOutputDataConfig? = nil,
          @tags : Array(Types::Tag)? = nil,
          @version_name : String? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      struct CreateDocumentClassifierResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the document classifier.
        @[JSON::Field(key: "DocumentClassifierArn")]
        getter document_classifier_arn : String?

        def initialize(
          @document_classifier_arn : String? = nil
        )
        end
      end

      struct CreateEndpointRequest
        include JSON::Serializable

        # The desired number of inference units to be used by the model using this endpoint. Each inference
        # unit represents of a throughput of 100 characters per second.
        @[JSON::Field(key: "DesiredInferenceUnits")]
        getter desired_inference_units : Int32

        # This is the descriptive suffix that becomes part of the EndpointArn used for all subsequent requests
        # to this resource.
        @[JSON::Field(key: "EndpointName")]
        getter endpoint_name : String

        # An idempotency token provided by the customer. If this token matches a previous endpoint creation
        # request, Amazon Comprehend will not return a ResourceInUseException .
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to trained
        # custom models encrypted with a customer managed key (ModelKmsKeyId).
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The Amazon Resource Number (ARN) of the flywheel to which the endpoint will be attached.
        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String?

        # The Amazon Resource Number (ARN) of the model to which the endpoint will be attached.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        # Tags to associate with the endpoint. A tag is a key-value pair that adds metadata to the endpoint.
        # For example, a tag with "Sales" as the key might be added to an endpoint to indicate its use by the
        # sales department.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @desired_inference_units : Int32,
          @endpoint_name : String,
          @client_request_token : String? = nil,
          @data_access_role_arn : String? = nil,
          @flywheel_arn : String? = nil,
          @model_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateEndpointResponse
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the endpoint being created.
        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String?

        # The Amazon Resource Number (ARN) of the model to which the endpoint is attached.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        def initialize(
          @endpoint_arn : String? = nil,
          @model_arn : String? = nil
        )
        end
      end

      struct CreateEntityRecognizerRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # Specifies the format and location of the input data. The S3 bucket containing the input data must be
        # located in the same Region as the entity recognizer being created.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::EntityRecognizerInputDataConfig

        # You can specify any of the following languages: English ("en"), Spanish ("es"), French ("fr"),
        # Italian ("it"), German ("de"), or Portuguese ("pt"). If you plan to use this entity recognizer with
        # PDF, Word, or image input files, you must specify English as the language. All training documents
        # must be in the same language.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # The name given to the newly created recognizer. Recognizer names can be a maximum of 256 characters.
        # Alphanumeric characters, hyphens (-) and underscores (_) are allowed. The name must be unique in the
        # account/Region.
        @[JSON::Field(key: "RecognizerName")]
        getter recognizer_name : String

        # A unique identifier for the request. If you don't set the client request token, Amazon Comprehend
        # generates one.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # ID for the KMS key that Amazon Comprehend uses to encrypt trained custom models. The ModelKmsKeyId
        # can be either of the following formats: KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon
        # Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "ModelKmsKeyId")]
        getter model_kms_key_id : String?

        # The JSON resource-based policy to attach to your custom entity recognizer model. You can use this
        # policy to allow another Amazon Web Services account to import your custom model. Provide your JSON
        # as a UTF-8 encoded string without line breaks. To provide valid JSON for your policy, enclose the
        # attribute names and values in double quotes. If the JSON body is also enclosed in double quotes,
        # then you must escape the double quotes that are inside the policy: "{\"attribute\": \"value\",
        # \"attribute\": [\"value\"]}" To avoid escaping quotes, you can use single quotes to enclose the
        # policy and double quotes to enclose the JSON names and values: '{"attribute": "value", "attribute":
        # ["value"]}'
        @[JSON::Field(key: "ModelPolicy")]
        getter model_policy : String?

        # Tags to associate with the entity recognizer. A tag is a key-value pair that adds as a metadata to a
        # resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a
        # resource to indicate its use by the sales department.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The version name given to the newly created recognizer. Version names can be a maximum of 256
        # characters. Alphanumeric characters, hyphens (-) and underscores (_) are allowed. The version name
        # must be unique among all models with the same recognizer name in the account/Region.
        @[JSON::Field(key: "VersionName")]
        getter version_name : String?

        # ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend uses to
        # encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis
        # job. The VolumeKmsKeyId can be either of the following formats: KMS Key ID:
        # "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        # Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the
        # resources you are using for your custom entity recognizer. For more information, see Amazon VPC .
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @data_access_role_arn : String,
          @input_data_config : Types::EntityRecognizerInputDataConfig,
          @language_code : String,
          @recognizer_name : String,
          @client_request_token : String? = nil,
          @model_kms_key_id : String? = nil,
          @model_policy : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @version_name : String? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      struct CreateEntityRecognizerResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the entity recognizer.
        @[JSON::Field(key: "EntityRecognizerArn")]
        getter entity_recognizer_arn : String?

        def initialize(
          @entity_recognizer_arn : String? = nil
        )
        end
      end

      struct CreateFlywheelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend the permissions
        # required to access the flywheel data in the data lake.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # Enter the S3 location for the data lake. You can specify a new S3 bucket or a new folder of an
        # existing S3 bucket. The flywheel creates the data lake at this location.
        @[JSON::Field(key: "DataLakeS3Uri")]
        getter data_lake_s3_uri : String

        # Name for the flywheel.
        @[JSON::Field(key: "FlywheelName")]
        getter flywheel_name : String

        # To associate an existing model with the flywheel, specify the Amazon Resource Number (ARN) of the
        # model version. Do not set TaskConfig or ModelType if you specify an ActiveModelArn .
        @[JSON::Field(key: "ActiveModelArn")]
        getter active_model_arn : String?

        # A unique identifier for the request. If you don't set the client request token, Amazon Comprehend
        # generates one.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Data security configurations.
        @[JSON::Field(key: "DataSecurityConfig")]
        getter data_security_config : Types::DataSecurityConfig?

        # The model type. You need to set ModelType if you are creating a flywheel for a new model.
        @[JSON::Field(key: "ModelType")]
        getter model_type : String?

        # The tags to associate with this flywheel.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Configuration about the model associated with the flywheel. You need to set TaskConfig if you are
        # creating a flywheel for a new model.
        @[JSON::Field(key: "TaskConfig")]
        getter task_config : Types::TaskConfig?

        def initialize(
          @data_access_role_arn : String,
          @data_lake_s3_uri : String,
          @flywheel_name : String,
          @active_model_arn : String? = nil,
          @client_request_token : String? = nil,
          @data_security_config : Types::DataSecurityConfig? = nil,
          @model_type : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @task_config : Types::TaskConfig? = nil
        )
        end
      end

      struct CreateFlywheelResponse
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the active model version.
        @[JSON::Field(key: "ActiveModelArn")]
        getter active_model_arn : String?

        # The Amazon Resource Number (ARN) of the flywheel.
        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String?

        def initialize(
          @active_model_arn : String? = nil,
          @flywheel_arn : String? = nil
        )
        end
      end

      # Data security configuration.
      struct DataSecurityConfig
        include JSON::Serializable

        # ID for the KMS key that Amazon Comprehend uses to encrypt the data in the data lake.
        @[JSON::Field(key: "DataLakeKmsKeyId")]
        getter data_lake_kms_key_id : String?

        # ID for the KMS key that Amazon Comprehend uses to encrypt trained custom models. The ModelKmsKeyId
        # can be either of the following formats: KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon
        # Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "ModelKmsKeyId")]
        getter model_kms_key_id : String?

        # ID for the KMS key that Amazon Comprehend uses to encrypt the volume.
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @data_lake_kms_key_id : String? = nil,
          @model_kms_key_id : String? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # An augmented manifest file that provides training data for your custom model. An augmented manifest
      # file is a labeled dataset that is produced by Amazon SageMaker Ground Truth.
      struct DatasetAugmentedManifestsListItem
        include JSON::Serializable

        # The JSON attribute that contains the annotations for your training documents. The number of
        # attribute names that you specify depends on whether your augmented manifest file is the output of a
        # single labeling job or a chained labeling job. If your file is the output of a single labeling job,
        # specify the LabelAttributeName key that was used when the job was created in Ground Truth. If your
        # file is the output of a chained labeling job, specify the LabelAttributeName key for one or more
        # jobs in the chain. Each LabelAttributeName key provides the annotations from an individual job.
        @[JSON::Field(key: "AttributeNames")]
        getter attribute_names : Array(String)

        # The Amazon S3 location of the augmented manifest file.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        # The S3 prefix to the annotation files that are referred in the augmented manifest file.
        @[JSON::Field(key: "AnnotationDataS3Uri")]
        getter annotation_data_s3_uri : String?

        # The type of augmented manifest. If you don't specify, the default is PlainTextDocument.
        # PLAIN_TEXT_DOCUMENT A document type that represents any unicode text that is encoded in UTF-8.
        @[JSON::Field(key: "DocumentType")]
        getter document_type : String?

        # The S3 prefix to the source files (PDFs) that are referred to in the augmented manifest file.
        @[JSON::Field(key: "SourceDocumentsS3Uri")]
        getter source_documents_s3_uri : String?

        def initialize(
          @attribute_names : Array(String),
          @s3_uri : String,
          @annotation_data_s3_uri : String? = nil,
          @document_type : String? = nil,
          @source_documents_s3_uri : String? = nil
        )
        end
      end

      # Describes the dataset input data configuration for a document classifier model. For more information
      # on how the input file is formatted, see Preparing training data in the Comprehend Developer Guide.
      struct DatasetDocumentClassifierInputDataConfig
        include JSON::Serializable

        # The Amazon S3 URI for the input data. The S3 bucket must be in the same Region as the API endpoint
        # that you are calling. The URI can point to a single input file or it can provide the prefix for a
        # collection of input files. For example, if you use the URI S3://bucketName/prefix , if the prefix is
        # a single file, Amazon Comprehend uses that file as input. If more than one file begins with the
        # prefix, Amazon Comprehend uses all of them as input. This parameter is required if you set
        # DataFormat to COMPREHEND_CSV .
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        # Indicates the delimiter used to separate each label for training a multi-label classifier. The
        # default delimiter between labels is a pipe (|). You can use a different character as a delimiter (if
        # it's an allowed character) by specifying it under Delimiter for labels. If the training documents
        # use a delimiter other than the default or the delimiter you specify, the labels on that line will be
        # combined to make a single unique label, such as LABELLABELLABEL.
        @[JSON::Field(key: "LabelDelimiter")]
        getter label_delimiter : String?

        def initialize(
          @s3_uri : String,
          @label_delimiter : String? = nil
        )
        end
      end

      # Describes the annotations associated with a entity recognizer.
      struct DatasetEntityRecognizerAnnotations
        include JSON::Serializable

        # Specifies the Amazon S3 location where the training documents for an entity recognizer are located.
        # The URI must be in the same Region as the API endpoint that you are calling.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        def initialize(
          @s3_uri : String
        )
        end
      end

      # Describes the documents submitted with a dataset for an entity recognizer model.
      struct DatasetEntityRecognizerDocuments
        include JSON::Serializable

        # Specifies the Amazon S3 location where the documents for the dataset are located.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        # Specifies how the text in an input file should be processed. This is optional, and the default is
        # ONE_DOC_PER_LINE. ONE_DOC_PER_FILE - Each file is considered a separate document. Use this option
        # when you are processing large documents, such as newspaper articles or scientific papers.
        # ONE_DOC_PER_LINE - Each line in a file is considered a separate document. Use this option when you
        # are processing many short documents, such as text messages.
        @[JSON::Field(key: "InputFormat")]
        getter input_format : String?

        def initialize(
          @s3_uri : String,
          @input_format : String? = nil
        )
        end
      end

      # Describes the dataset entity list for an entity recognizer model. For more information on how the
      # input file is formatted, see Preparing training data in the Comprehend Developer Guide.
      struct DatasetEntityRecognizerEntityList
        include JSON::Serializable

        # Specifies the Amazon S3 location where the entity list is located.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        def initialize(
          @s3_uri : String
        )
        end
      end

      # Specifies the format and location of the input data. You must provide either the Annotations
      # parameter or the EntityList parameter.
      struct DatasetEntityRecognizerInputDataConfig
        include JSON::Serializable

        # The format and location of the training documents for your custom entity recognizer.
        @[JSON::Field(key: "Documents")]
        getter documents : Types::DatasetEntityRecognizerDocuments

        # The S3 location of the annotation documents for your custom entity recognizer.
        @[JSON::Field(key: "Annotations")]
        getter annotations : Types::DatasetEntityRecognizerAnnotations?

        # The S3 location of the entity list for your custom entity recognizer.
        @[JSON::Field(key: "EntityList")]
        getter entity_list : Types::DatasetEntityRecognizerEntityList?

        def initialize(
          @documents : Types::DatasetEntityRecognizerDocuments,
          @annotations : Types::DatasetEntityRecognizerAnnotations? = nil,
          @entity_list : Types::DatasetEntityRecognizerEntityList? = nil
        )
        end
      end

      # Filter the datasets based on creation time or dataset status.
      struct DatasetFilter
        include JSON::Serializable

        # Filter the datasets to include datasets created after the specified time.
        @[JSON::Field(key: "CreationTimeAfter", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time_after : Time?

        # Filter the datasets to include datasets created before the specified time.
        @[JSON::Field(key: "CreationTimeBefore", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time_before : Time?

        # Filter the datasets based on the dataset type.
        @[JSON::Field(key: "DatasetType")]
        getter dataset_type : String?

        # Filter the datasets based on the dataset status.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_time_after : Time? = nil,
          @creation_time_before : Time? = nil,
          @dataset_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Specifies the format and location of the input data for the dataset.
      struct DatasetInputDataConfig
        include JSON::Serializable

        # A list of augmented manifest files that provide training data for your custom model. An augmented
        # manifest file is a labeled dataset that is produced by Amazon SageMaker Ground Truth.
        @[JSON::Field(key: "AugmentedManifests")]
        getter augmented_manifests : Array(Types::DatasetAugmentedManifestsListItem)?

        # COMPREHEND_CSV : The data format is a two-column CSV file, where the first column contains labels
        # and the second column contains documents. AUGMENTED_MANIFEST : The data format
        @[JSON::Field(key: "DataFormat")]
        getter data_format : String?

        # The input properties for training a document classifier model. For more information on how the input
        # file is formatted, see Preparing training data in the Comprehend Developer Guide.
        @[JSON::Field(key: "DocumentClassifierInputDataConfig")]
        getter document_classifier_input_data_config : Types::DatasetDocumentClassifierInputDataConfig?

        # The input properties for training an entity recognizer model.
        @[JSON::Field(key: "EntityRecognizerInputDataConfig")]
        getter entity_recognizer_input_data_config : Types::DatasetEntityRecognizerInputDataConfig?

        def initialize(
          @augmented_manifests : Array(Types::DatasetAugmentedManifestsListItem)? = nil,
          @data_format : String? = nil,
          @document_classifier_input_data_config : Types::DatasetDocumentClassifierInputDataConfig? = nil,
          @entity_recognizer_input_data_config : Types::DatasetEntityRecognizerInputDataConfig? = nil
        )
        end
      end

      # Properties associated with the dataset.
      struct DatasetProperties
        include JSON::Serializable

        # Creation time of the dataset.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The ARN of the dataset.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String?

        # The name of the dataset.
        @[JSON::Field(key: "DatasetName")]
        getter dataset_name : String?

        # The S3 URI where the dataset is stored.
        @[JSON::Field(key: "DatasetS3Uri")]
        getter dataset_s3_uri : String?

        # The dataset type (training data or test data).
        @[JSON::Field(key: "DatasetType")]
        getter dataset_type : String?

        # Description of the dataset.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # Time when the data from the dataset becomes available in the data lake.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # A description of the status of the dataset.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The number of documents in the dataset.
        @[JSON::Field(key: "NumberOfDocuments")]
        getter number_of_documents : Int64?

        # The dataset status. While the system creates the dataset, the status is CREATING . When the dataset
        # is ready to use, the status changes to COMPLETED .
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @dataset_arn : String? = nil,
          @dataset_name : String? = nil,
          @dataset_s3_uri : String? = nil,
          @dataset_type : String? = nil,
          @description : String? = nil,
          @end_time : Time? = nil,
          @message : String? = nil,
          @number_of_documents : Int64? = nil,
          @status : String? = nil
        )
        end
      end

      struct DeleteDocumentClassifierRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the document classifier.
        @[JSON::Field(key: "DocumentClassifierArn")]
        getter document_classifier_arn : String

        def initialize(
          @document_classifier_arn : String
        )
        end
      end

      struct DeleteDocumentClassifierResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteEndpointRequest
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the endpoint being deleted.
        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String

        def initialize(
          @endpoint_arn : String
        )
        end
      end

      struct DeleteEndpointResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteEntityRecognizerRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the entity recognizer.
        @[JSON::Field(key: "EntityRecognizerArn")]
        getter entity_recognizer_arn : String

        def initialize(
          @entity_recognizer_arn : String
        )
        end
      end

      struct DeleteEntityRecognizerResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteFlywheelRequest
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the flywheel to delete.
        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String

        def initialize(
          @flywheel_arn : String
        )
        end
      end

      struct DeleteFlywheelResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom model version that has the policy to delete.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The revision ID of the policy to delete.
        @[JSON::Field(key: "PolicyRevisionId")]
        getter policy_revision_id : String?

        def initialize(
          @resource_arn : String,
          @policy_revision_id : String? = nil
        )
        end
      end

      struct DeleteResourcePolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeDatasetRequest
        include JSON::Serializable

        # The ARN of the dataset.
        @[JSON::Field(key: "DatasetArn")]
        getter dataset_arn : String

        def initialize(
          @dataset_arn : String
        )
        end
      end

      struct DescribeDatasetResponse
        include JSON::Serializable

        # The dataset properties.
        @[JSON::Field(key: "DatasetProperties")]
        getter dataset_properties : Types::DatasetProperties?

        def initialize(
          @dataset_properties : Types::DatasetProperties? = nil
        )
        end
      end

      struct DescribeDocumentClassificationJobRequest
        include JSON::Serializable

        # The identifier that Amazon Comprehend generated for the job. The StartDocumentClassificationJob
        # operation returns this identifier in its response.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct DescribeDocumentClassificationJobResponse
        include JSON::Serializable

        # An object that describes the properties associated with the document classification job.
        @[JSON::Field(key: "DocumentClassificationJobProperties")]
        getter document_classification_job_properties : Types::DocumentClassificationJobProperties?

        def initialize(
          @document_classification_job_properties : Types::DocumentClassificationJobProperties? = nil
        )
        end
      end

      struct DescribeDocumentClassifierRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the document classifier. The CreateDocumentClassifier
        # operation returns this identifier in its response.
        @[JSON::Field(key: "DocumentClassifierArn")]
        getter document_classifier_arn : String

        def initialize(
          @document_classifier_arn : String
        )
        end
      end

      struct DescribeDocumentClassifierResponse
        include JSON::Serializable

        # An object that contains the properties associated with a document classifier.
        @[JSON::Field(key: "DocumentClassifierProperties")]
        getter document_classifier_properties : Types::DocumentClassifierProperties?

        def initialize(
          @document_classifier_properties : Types::DocumentClassifierProperties? = nil
        )
        end
      end

      struct DescribeDominantLanguageDetectionJobRequest
        include JSON::Serializable

        # The identifier that Amazon Comprehend generated for the job. The StartDominantLanguageDetectionJob
        # operation returns this identifier in its response.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct DescribeDominantLanguageDetectionJobResponse
        include JSON::Serializable

        # An object that contains the properties associated with a dominant language detection job.
        @[JSON::Field(key: "DominantLanguageDetectionJobProperties")]
        getter dominant_language_detection_job_properties : Types::DominantLanguageDetectionJobProperties?

        def initialize(
          @dominant_language_detection_job_properties : Types::DominantLanguageDetectionJobProperties? = nil
        )
        end
      end

      struct DescribeEndpointRequest
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the endpoint being described.
        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String

        def initialize(
          @endpoint_arn : String
        )
        end
      end

      struct DescribeEndpointResponse
        include JSON::Serializable

        # Describes information associated with the specific endpoint.
        @[JSON::Field(key: "EndpointProperties")]
        getter endpoint_properties : Types::EndpointProperties?

        def initialize(
          @endpoint_properties : Types::EndpointProperties? = nil
        )
        end
      end

      struct DescribeEntitiesDetectionJobRequest
        include JSON::Serializable

        # The identifier that Amazon Comprehend generated for the job. The StartEntitiesDetectionJob operation
        # returns this identifier in its response.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct DescribeEntitiesDetectionJobResponse
        include JSON::Serializable

        # An object that contains the properties associated with an entities detection job.
        @[JSON::Field(key: "EntitiesDetectionJobProperties")]
        getter entities_detection_job_properties : Types::EntitiesDetectionJobProperties?

        def initialize(
          @entities_detection_job_properties : Types::EntitiesDetectionJobProperties? = nil
        )
        end
      end

      struct DescribeEntityRecognizerRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the entity recognizer.
        @[JSON::Field(key: "EntityRecognizerArn")]
        getter entity_recognizer_arn : String

        def initialize(
          @entity_recognizer_arn : String
        )
        end
      end

      struct DescribeEntityRecognizerResponse
        include JSON::Serializable

        # Describes information associated with an entity recognizer.
        @[JSON::Field(key: "EntityRecognizerProperties")]
        getter entity_recognizer_properties : Types::EntityRecognizerProperties?

        def initialize(
          @entity_recognizer_properties : Types::EntityRecognizerProperties? = nil
        )
        end
      end

      struct DescribeEventsDetectionJobRequest
        include JSON::Serializable

        # The identifier of the events detection job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct DescribeEventsDetectionJobResponse
        include JSON::Serializable

        # An object that contains the properties associated with an event detection job.
        @[JSON::Field(key: "EventsDetectionJobProperties")]
        getter events_detection_job_properties : Types::EventsDetectionJobProperties?

        def initialize(
          @events_detection_job_properties : Types::EventsDetectionJobProperties? = nil
        )
        end
      end

      struct DescribeFlywheelIterationRequest
        include JSON::Serializable

        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String

        @[JSON::Field(key: "FlywheelIterationId")]
        getter flywheel_iteration_id : String

        def initialize(
          @flywheel_arn : String,
          @flywheel_iteration_id : String
        )
        end
      end

      struct DescribeFlywheelIterationResponse
        include JSON::Serializable

        # The configuration properties of a flywheel iteration.
        @[JSON::Field(key: "FlywheelIterationProperties")]
        getter flywheel_iteration_properties : Types::FlywheelIterationProperties?

        def initialize(
          @flywheel_iteration_properties : Types::FlywheelIterationProperties? = nil
        )
        end
      end

      struct DescribeFlywheelRequest
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the flywheel.
        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String

        def initialize(
          @flywheel_arn : String
        )
        end
      end

      struct DescribeFlywheelResponse
        include JSON::Serializable

        # The flywheel properties.
        @[JSON::Field(key: "FlywheelProperties")]
        getter flywheel_properties : Types::FlywheelProperties?

        def initialize(
          @flywheel_properties : Types::FlywheelProperties? = nil
        )
        end
      end

      struct DescribeKeyPhrasesDetectionJobRequest
        include JSON::Serializable

        # The identifier that Amazon Comprehend generated for the job. The StartKeyPhrasesDetectionJob
        # operation returns this identifier in its response.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct DescribeKeyPhrasesDetectionJobResponse
        include JSON::Serializable

        # An object that contains the properties associated with a key phrases detection job.
        @[JSON::Field(key: "KeyPhrasesDetectionJobProperties")]
        getter key_phrases_detection_job_properties : Types::KeyPhrasesDetectionJobProperties?

        def initialize(
          @key_phrases_detection_job_properties : Types::KeyPhrasesDetectionJobProperties? = nil
        )
        end
      end

      struct DescribePiiEntitiesDetectionJobRequest
        include JSON::Serializable

        # The identifier that Amazon Comprehend generated for the job. The operation returns this identifier
        # in its response.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct DescribePiiEntitiesDetectionJobResponse
        include JSON::Serializable

        @[JSON::Field(key: "PiiEntitiesDetectionJobProperties")]
        getter pii_entities_detection_job_properties : Types::PiiEntitiesDetectionJobProperties?

        def initialize(
          @pii_entities_detection_job_properties : Types::PiiEntitiesDetectionJobProperties? = nil
        )
        end
      end

      struct DescribeResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom model version that has the resource policy.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct DescribeResourcePolicyResponse
        include JSON::Serializable

        # The time at which the policy was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The time at which the policy was last modified.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The revision ID of the policy. Each time you modify a policy, Amazon Comprehend assigns a new
        # revision ID, and it deletes the prior version of the policy.
        @[JSON::Field(key: "PolicyRevisionId")]
        getter policy_revision_id : String?

        # The JSON body of the resource-based policy.
        @[JSON::Field(key: "ResourcePolicy")]
        getter resource_policy : String?

        def initialize(
          @creation_time : Time? = nil,
          @last_modified_time : Time? = nil,
          @policy_revision_id : String? = nil,
          @resource_policy : String? = nil
        )
        end
      end

      struct DescribeSentimentDetectionJobRequest
        include JSON::Serializable

        # The identifier that Amazon Comprehend generated for the job. The operation returns this identifier
        # in its response.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct DescribeSentimentDetectionJobResponse
        include JSON::Serializable

        # An object that contains the properties associated with a sentiment detection job.
        @[JSON::Field(key: "SentimentDetectionJobProperties")]
        getter sentiment_detection_job_properties : Types::SentimentDetectionJobProperties?

        def initialize(
          @sentiment_detection_job_properties : Types::SentimentDetectionJobProperties? = nil
        )
        end
      end

      struct DescribeTargetedSentimentDetectionJobRequest
        include JSON::Serializable

        # The identifier that Amazon Comprehend generated for the job. The StartTargetedSentimentDetectionJob
        # operation returns this identifier in its response.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct DescribeTargetedSentimentDetectionJobResponse
        include JSON::Serializable

        # An object that contains the properties associated with a targeted sentiment detection job.
        @[JSON::Field(key: "TargetedSentimentDetectionJobProperties")]
        getter targeted_sentiment_detection_job_properties : Types::TargetedSentimentDetectionJobProperties?

        def initialize(
          @targeted_sentiment_detection_job_properties : Types::TargetedSentimentDetectionJobProperties? = nil
        )
        end
      end

      struct DescribeTopicsDetectionJobRequest
        include JSON::Serializable

        # The identifier assigned by the user to the detection job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct DescribeTopicsDetectionJobResponse
        include JSON::Serializable

        # The list of properties for the requested job.
        @[JSON::Field(key: "TopicsDetectionJobProperties")]
        getter topics_detection_job_properties : Types::TopicsDetectionJobProperties?

        def initialize(
          @topics_detection_job_properties : Types::TopicsDetectionJobProperties? = nil
        )
        end
      end

      struct DetectDominantLanguageRequest
        include JSON::Serializable

        # A UTF-8 text string. The string must contain at least 20 characters. The maximum string size is 100
        # KB.
        @[JSON::Field(key: "Text")]
        getter text : String

        def initialize(
          @text : String
        )
        end
      end

      struct DetectDominantLanguageResponse
        include JSON::Serializable

        # Array of languages that Amazon Comprehend detected in the input text. The array is sorted in
        # descending order of the score (the dominant language is always the first element in the array). For
        # each language, the response returns the RFC 5646 language code and the level of confidence that
        # Amazon Comprehend has in the accuracy of its inference. For more information about RFC 5646, see
        # Tags for Identifying Languages on the IETF Tools web site.
        @[JSON::Field(key: "Languages")]
        getter languages : Array(Types::DominantLanguage)?

        def initialize(
          @languages : Array(Types::DominantLanguage)? = nil
        )
        end
      end

      struct DetectEntitiesRequest
        include JSON::Serializable

        # This field applies only when you use a custom entity recognition model that was trained with PDF
        # annotations. For other cases, enter your text input in the Text field. Use the Bytes parameter to
        # input a text, PDF, Word or image file. Using a plain-text file in the Bytes parameter is equivelent
        # to using the Text parameter (the Entities field in the response is identical). You can also use the
        # Bytes parameter to input an Amazon Textract DetectDocumentText or AnalyzeDocument output file.
        # Provide the input document as a sequence of base64-encoded bytes. If your code uses an Amazon Web
        # Services SDK to detect entities, the SDK may encode the document file bytes for you. The maximum
        # length of this field depends on the input document type. For details, see Inputs for real-time
        # custom analysis in the Comprehend Developer Guide. If you use the Bytes parameter, do not use the
        # Text parameter.
        @[JSON::Field(key: "Bytes")]
        getter bytes : Bytes?

        # Provides configuration parameters to override the default actions for extracting text from PDF
        # documents and image files.
        @[JSON::Field(key: "DocumentReaderConfig")]
        getter document_reader_config : Types::DocumentReaderConfig?

        # The Amazon Resource Name of an endpoint that is associated with a custom entity recognition model.
        # Provide an endpoint if you want to detect entities by using your own custom model instead of the
        # default model that is used by Amazon Comprehend. If you specify an endpoint, Amazon Comprehend uses
        # the language of your custom model, and it ignores any language code that you provide in your
        # request. For information about endpoints, see Managing endpoints .
        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String?

        # The language of the input documents. You can specify any of the primary languages supported by
        # Amazon Comprehend. If your request includes the endpoint for a custom entity recognition model,
        # Amazon Comprehend uses the language of your custom model, and it ignores any language code that you
        # specify here. All input documents must be in the same language.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # A UTF-8 text string. The maximum string size is 100 KB. If you enter text using this parameter, do
        # not use the Bytes parameter.
        @[JSON::Field(key: "Text")]
        getter text : String?

        def initialize(
          @bytes : Bytes? = nil,
          @document_reader_config : Types::DocumentReaderConfig? = nil,
          @endpoint_arn : String? = nil,
          @language_code : String? = nil,
          @text : String? = nil
        )
        end
      end

      struct DetectEntitiesResponse
        include JSON::Serializable

        # Information about each block of text in the input document. Blocks are nested. A page block contains
        # a block for each line of text, which contains a block for each word. The Block content for a Word
        # input document does not include a Geometry field. The Block field is not present in the response for
        # plain-text inputs.
        @[JSON::Field(key: "Blocks")]
        getter blocks : Array(Types::Block)?

        # Information about the document, discovered during text extraction. This field is present in the
        # response only if your request used the Byte parameter.
        @[JSON::Field(key: "DocumentMetadata")]
        getter document_metadata : Types::DocumentMetadata?

        # The document type for each page in the input document. This field is present in the response only if
        # your request used the Byte parameter.
        @[JSON::Field(key: "DocumentType")]
        getter document_type : Array(Types::DocumentTypeListItem)?

        # A collection of entities identified in the input text. For each entity, the response provides the
        # entity text, entity type, where the entity text begins and ends, and the level of confidence that
        # Amazon Comprehend has in the detection. If your request uses a custom entity recognition model,
        # Amazon Comprehend detects the entities that the model is trained to recognize. Otherwise, it detects
        # the default entity types. For a list of default entity types, see Entities in the Comprehend
        # Developer Guide.
        @[JSON::Field(key: "Entities")]
        getter entities : Array(Types::Entity)?

        # Page-level errors that the system detected while processing the input document. The field is empty
        # if the system encountered no errors.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::ErrorsListItem)?

        def initialize(
          @blocks : Array(Types::Block)? = nil,
          @document_metadata : Types::DocumentMetadata? = nil,
          @document_type : Array(Types::DocumentTypeListItem)? = nil,
          @entities : Array(Types::Entity)? = nil,
          @errors : Array(Types::ErrorsListItem)? = nil
        )
        end
      end

      struct DetectKeyPhrasesRequest
        include JSON::Serializable

        # The language of the input documents. You can specify any of the primary languages supported by
        # Amazon Comprehend. All documents must be in the same language.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # A UTF-8 text string. The string must contain less than 100 KB of UTF-8 encoded characters.
        @[JSON::Field(key: "Text")]
        getter text : String

        def initialize(
          @language_code : String,
          @text : String
        )
        end
      end

      struct DetectKeyPhrasesResponse
        include JSON::Serializable

        # A collection of key phrases that Amazon Comprehend identified in the input text. For each key
        # phrase, the response provides the text of the key phrase, where the key phrase begins and ends, and
        # the level of confidence that Amazon Comprehend has in the accuracy of the detection.
        @[JSON::Field(key: "KeyPhrases")]
        getter key_phrases : Array(Types::KeyPhrase)?

        def initialize(
          @key_phrases : Array(Types::KeyPhrase)? = nil
        )
        end
      end

      struct DetectPiiEntitiesRequest
        include JSON::Serializable

        # The language of the input text. Enter the language code for English (en) or Spanish (es).
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # A UTF-8 text string. The maximum string size is 100 KB.
        @[JSON::Field(key: "Text")]
        getter text : String

        def initialize(
          @language_code : String,
          @text : String
        )
        end
      end

      struct DetectPiiEntitiesResponse
        include JSON::Serializable

        # A collection of PII entities identified in the input text. For each entity, the response provides
        # the entity type, where the entity text begins and ends, and the level of confidence that Amazon
        # Comprehend has in the detection.
        @[JSON::Field(key: "Entities")]
        getter entities : Array(Types::PiiEntity)?

        def initialize(
          @entities : Array(Types::PiiEntity)? = nil
        )
        end
      end

      struct DetectSentimentRequest
        include JSON::Serializable

        # The language of the input documents. You can specify any of the primary languages supported by
        # Amazon Comprehend. All documents must be in the same language.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # A UTF-8 text string. The maximum string size is 5 KB.
        @[JSON::Field(key: "Text")]
        getter text : String

        def initialize(
          @language_code : String,
          @text : String
        )
        end
      end

      struct DetectSentimentResponse
        include JSON::Serializable

        # The inferred sentiment that Amazon Comprehend has the highest level of confidence in.
        @[JSON::Field(key: "Sentiment")]
        getter sentiment : String?

        # An object that lists the sentiments, and their corresponding confidence levels.
        @[JSON::Field(key: "SentimentScore")]
        getter sentiment_score : Types::SentimentScore?

        def initialize(
          @sentiment : String? = nil,
          @sentiment_score : Types::SentimentScore? = nil
        )
        end
      end

      struct DetectSyntaxRequest
        include JSON::Serializable

        # The language code of the input documents. You can specify any of the following languages supported
        # by Amazon Comprehend: German ("de"), English ("en"), Spanish ("es"), French ("fr"), Italian ("it"),
        # or Portuguese ("pt").
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # A UTF-8 string. The maximum string size is 5 KB.
        @[JSON::Field(key: "Text")]
        getter text : String

        def initialize(
          @language_code : String,
          @text : String
        )
        end
      end

      struct DetectSyntaxResponse
        include JSON::Serializable

        # A collection of syntax tokens describing the text. For each token, the response provides the text,
        # the token type, where the text begins and ends, and the level of confidence that Amazon Comprehend
        # has that the token is correct. For a list of token types, see Syntax in the Comprehend Developer
        # Guide.
        @[JSON::Field(key: "SyntaxTokens")]
        getter syntax_tokens : Array(Types::SyntaxToken)?

        def initialize(
          @syntax_tokens : Array(Types::SyntaxToken)? = nil
        )
        end
      end

      struct DetectTargetedSentimentRequest
        include JSON::Serializable

        # The language of the input documents. Currently, English is the only supported language.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # A UTF-8 text string. The maximum string length is 5 KB.
        @[JSON::Field(key: "Text")]
        getter text : String

        def initialize(
          @language_code : String,
          @text : String
        )
        end
      end

      struct DetectTargetedSentimentResponse
        include JSON::Serializable

        # Targeted sentiment analysis for each of the entities identified in the input text.
        @[JSON::Field(key: "Entities")]
        getter entities : Array(Types::TargetedSentimentEntity)?

        def initialize(
          @entities : Array(Types::TargetedSentimentEntity)? = nil
        )
        end
      end

      struct DetectToxicContentRequest
        include JSON::Serializable

        # The language of the input text. Currently, English is the only supported language.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # A list of up to 10 text strings. Each string has a maximum size of 1 KB, and the maximum size of the
        # list is 10 KB.
        @[JSON::Field(key: "TextSegments")]
        getter text_segments : Array(Types::TextSegment)

        def initialize(
          @language_code : String,
          @text_segments : Array(Types::TextSegment)
        )
        end
      end

      struct DetectToxicContentResponse
        include JSON::Serializable

        # Results of the content moderation analysis. Each entry in the results list contains a list of toxic
        # content types identified in the text, along with a confidence score for each content type. The
        # results list also includes a toxicity score for each entry in the results list.
        @[JSON::Field(key: "ResultList")]
        getter result_list : Array(Types::ToxicLabels)?

        def initialize(
          @result_list : Array(Types::ToxicLabels)? = nil
        )
        end
      end

      # Specifies the class that categorizes the document being analyzed
      struct DocumentClass
        include JSON::Serializable

        # The name of the class.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Page number in the input document. This field is present in the response only if your request
        # includes the Byte parameter.
        @[JSON::Field(key: "Page")]
        getter page : Int32?

        # The confidence score that Amazon Comprehend has this class correctly attributed.
        @[JSON::Field(key: "Score")]
        getter score : Float64?

        def initialize(
          @name : String? = nil,
          @page : Int32? = nil,
          @score : Float64? = nil
        )
        end
      end

      # Configuration required for a document classification model.
      struct DocumentClassificationConfig
        include JSON::Serializable

        # Classification mode indicates whether the documents are MULTI_CLASS or MULTI_LABEL .
        @[JSON::Field(key: "Mode")]
        getter mode : String

        # One or more labels to associate with the custom classifier.
        @[JSON::Field(key: "Labels")]
        getter labels : Array(String)?

        def initialize(
          @mode : String,
          @labels : Array(String)? = nil
        )
        end
      end

      # Provides information for filtering a list of document classification jobs. For more information, see
      # the operation. You can provide only one filter parameter in each request.
      struct DocumentClassificationJobFilter
        include JSON::Serializable

        # Filters on the name of the job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # Filters the list based on job status. Returns only jobs with the specified status.
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

      # Provides information about a document classification job.
      struct DocumentClassificationJobProperties
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The Amazon Resource Name (ARN) that identifies the document classifier.
        @[JSON::Field(key: "DocumentClassifierArn")]
        getter document_classifier_arn : String?

        # The time that the document classification job completed.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The Amazon Resource Number (ARN) of the flywheel
        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String?

        # The input data configuration that you supplied when you created the document classification job.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig?

        # The Amazon Resource Name (ARN) of the document classification job. It is a unique, fully qualified
        # identifier for the job. It includes the Amazon Web Services account, Amazon Web Services Region, and
        # the job ID. The format of the ARN is as follows:
        # arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:document-classification-job/&lt;job-id&gt;
        # The following is an example job ARN:
        # arn:aws:comprehend:us-west-2:111122223333:document-classification-job/1234abcd12ab34cd56ef1234567890ab
        @[JSON::Field(key: "JobArn")]
        getter job_arn : String?

        # The identifier assigned to the document classification job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The name that you assigned to the document classification job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # The current status of the document classification job. If the status is FAILED , the Message field
        # shows the reason for the failure.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # A description of the status of the job.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The output data configuration that you supplied when you created the document classification job.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig?

        # The time that the document classification job was submitted for processing.
        @[JSON::Field(key: "SubmitTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time : Time?

        # ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend uses to
        # encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis
        # job. The VolumeKmsKeyId can be either of the following formats: KMS Key ID:
        # "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        # Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are
        # using for your document classification job. For more information, see Amazon VPC .
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @data_access_role_arn : String? = nil,
          @document_classifier_arn : String? = nil,
          @end_time : Time? = nil,
          @flywheel_arn : String? = nil,
          @input_data_config : Types::InputDataConfig? = nil,
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @job_name : String? = nil,
          @job_status : String? = nil,
          @message : String? = nil,
          @output_data_config : Types::OutputDataConfig? = nil,
          @submit_time : Time? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # The location of the training documents. This parameter is required in a request to create a
      # semi-structured document classification model.
      struct DocumentClassifierDocuments
        include JSON::Serializable

        # The S3 URI location of the training documents specified in the S3Uri CSV file.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        # The S3 URI location of the test documents included in the TestS3Uri CSV file. This field is not
        # required if you do not specify a test CSV file.
        @[JSON::Field(key: "TestS3Uri")]
        getter test_s3_uri : String?

        def initialize(
          @s3_uri : String,
          @test_s3_uri : String? = nil
        )
        end
      end

      # Provides information for filtering a list of document classifiers. You can only specify one
      # filtering parameter in a request. For more information, see the ListDocumentClassifiers operation.
      struct DocumentClassifierFilter
        include JSON::Serializable

        # The name that you assigned to the document classifier
        @[JSON::Field(key: "DocumentClassifierName")]
        getter document_classifier_name : String?

        # Filters the list of classifiers based on status.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Filters the list of classifiers based on the time that the classifier was submitted for processing.
        # Returns only classifiers submitted after the specified time. Classifiers are returned in descending
        # order, newest to oldest.
        @[JSON::Field(key: "SubmitTimeAfter", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time_after : Time?

        # Filters the list of classifiers based on the time that the classifier was submitted for processing.
        # Returns only classifiers submitted before the specified time. Classifiers are returned in ascending
        # order, oldest to newest.
        @[JSON::Field(key: "SubmitTimeBefore", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time_before : Time?

        def initialize(
          @document_classifier_name : String? = nil,
          @status : String? = nil,
          @submit_time_after : Time? = nil,
          @submit_time_before : Time? = nil
        )
        end
      end

      # The input properties for training a document classifier. For more information on how the input file
      # is formatted, see Preparing training data in the Comprehend Developer Guide.
      struct DocumentClassifierInputDataConfig
        include JSON::Serializable

        # A list of augmented manifest files that provide training data for your custom model. An augmented
        # manifest file is a labeled dataset that is produced by Amazon SageMaker Ground Truth. This parameter
        # is required if you set DataFormat to AUGMENTED_MANIFEST .
        @[JSON::Field(key: "AugmentedManifests")]
        getter augmented_manifests : Array(Types::AugmentedManifestsListItem)?

        # The format of your training data: COMPREHEND_CSV : A two-column CSV file, where labels are provided
        # in the first column, and documents are provided in the second. If you use this value, you must
        # provide the S3Uri parameter in your request. AUGMENTED_MANIFEST : A labeled dataset that is produced
        # by Amazon SageMaker Ground Truth. This file is in JSON lines format. Each line is a complete JSON
        # object that contains a training document and its associated labels. If you use this value, you must
        # provide the AugmentedManifests parameter in your request. If you don't specify a value, Amazon
        # Comprehend uses COMPREHEND_CSV as the default.
        @[JSON::Field(key: "DataFormat")]
        getter data_format : String?

        @[JSON::Field(key: "DocumentReaderConfig")]
        getter document_reader_config : Types::DocumentReaderConfig?

        # The type of input documents for training the model. Provide plain-text documents to create a
        # plain-text model, and provide semi-structured documents to create a native document model.
        @[JSON::Field(key: "DocumentType")]
        getter document_type : String?

        # The S3 location of the training documents. This parameter is required in a request to create a
        # native document model.
        @[JSON::Field(key: "Documents")]
        getter documents : Types::DocumentClassifierDocuments?

        # Indicates the delimiter used to separate each label for training a multi-label classifier. The
        # default delimiter between labels is a pipe (|). You can use a different character as a delimiter (if
        # it's an allowed character) by specifying it under Delimiter for labels. If the training documents
        # use a delimiter other than the default or the delimiter you specify, the labels on that line will be
        # combined to make a single unique label, such as LABELLABELLABEL.
        @[JSON::Field(key: "LabelDelimiter")]
        getter label_delimiter : String?

        # The Amazon S3 URI for the input data. The S3 bucket must be in the same Region as the API endpoint
        # that you are calling. The URI can point to a single input file or it can provide the prefix for a
        # collection of input files. For example, if you use the URI S3://bucketName/prefix , if the prefix is
        # a single file, Amazon Comprehend uses that file as input. If more than one file begins with the
        # prefix, Amazon Comprehend uses all of them as input. This parameter is required if you set
        # DataFormat to COMPREHEND_CSV .
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String?

        # This specifies the Amazon S3 location that contains the test annotations for the document
        # classifier. The URI must be in the same Amazon Web Services Region as the API endpoint that you are
        # calling.
        @[JSON::Field(key: "TestS3Uri")]
        getter test_s3_uri : String?

        def initialize(
          @augmented_manifests : Array(Types::AugmentedManifestsListItem)? = nil,
          @data_format : String? = nil,
          @document_reader_config : Types::DocumentReaderConfig? = nil,
          @document_type : String? = nil,
          @documents : Types::DocumentClassifierDocuments? = nil,
          @label_delimiter : String? = nil,
          @s3_uri : String? = nil,
          @test_s3_uri : String? = nil
        )
        end
      end

      # Provide the location for output data from a custom classifier job. This field is mandatory if you
      # are training a native document model.
      struct DocumentClassifierOutputDataConfig
        include JSON::Serializable

        # The Amazon S3 prefix for the data lake location of the flywheel statistics.
        @[JSON::Field(key: "FlywheelStatsS3Prefix")]
        getter flywheel_stats_s3_prefix : String?

        # ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend uses to
        # encrypt the output results from an analysis job. The KmsKeyId can be one of the following formats:
        # KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab" KMS Key Alias:
        # "alias/ExampleAlias" ARN of a KMS Key Alias: "arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias"
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        # When you use the OutputDataConfig object while creating a custom classifier, you specify the Amazon
        # S3 location where you want to write the confusion matrix and other output files. The URI must be in
        # the same Region as the API endpoint that you are calling. The location is used as the prefix for the
        # actual location of this output file. When the custom classifier job is finished, the service creates
        # the output file in a directory specific to the job. The S3Uri field contains the location of the
        # output file, called output.tar.gz . It is a compressed archive that contains the confusion matrix.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String?

        def initialize(
          @flywheel_stats_s3_prefix : String? = nil,
          @kms_key_id : String? = nil,
          @s3_uri : String? = nil
        )
        end
      end

      # Provides information about a document classifier.
      struct DocumentClassifierProperties
        include JSON::Serializable

        # Information about the document classifier, including the number of documents used for training the
        # classifier, the number of documents used for test the classifier, and an accuracy rating.
        @[JSON::Field(key: "ClassifierMetadata")]
        getter classifier_metadata : Types::ClassifierMetadata?

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The Amazon Resource Name (ARN) that identifies the document classifier.
        @[JSON::Field(key: "DocumentClassifierArn")]
        getter document_classifier_arn : String?

        # The time that training the document classifier completed.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The Amazon Resource Number (ARN) of the flywheel
        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String?

        # The input data configuration that you supplied when you created the document classifier for
        # training.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::DocumentClassifierInputDataConfig?

        # The language code for the language of the documents that the classifier was trained on.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # Additional information about the status of the classifier.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # Indicates the mode in which the specific classifier was trained. This also indicates the format of
        # input documents and the format of the confusion matrix. Each classifier can only be trained in one
        # mode and this cannot be changed once the classifier is trained.
        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # ID for the KMS key that Amazon Comprehend uses to encrypt trained custom models. The ModelKmsKeyId
        # can be either of the following formats: KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon
        # Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "ModelKmsKeyId")]
        getter model_kms_key_id : String?

        # Provides output results configuration parameters for custom classifier jobs.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::DocumentClassifierOutputDataConfig?

        # The Amazon Resource Name (ARN) of the source model. This model was imported from a different Amazon
        # Web Services account to create the document classifier model in your Amazon Web Services account.
        @[JSON::Field(key: "SourceModelArn")]
        getter source_model_arn : String?

        # The status of the document classifier. If the status is TRAINED the classifier is ready to use. If
        # the status is TRAINED_WITH_WARNINGS the classifier training succeeded, but you should review the
        # warnings returned in the CreateDocumentClassifier response. If the status is FAILED you can see
        # additional information about why the classifier wasn't trained in the Message field.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The time that the document classifier was submitted for training.
        @[JSON::Field(key: "SubmitTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time : Time?

        # The time that training of the document classifier was completed. Indicates the time when the
        # training completes on documentation classifiers. You are billed for the time interval between this
        # time and the value of TrainingStartTime.
        @[JSON::Field(key: "TrainingEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter training_end_time : Time?

        # Indicates the time when the training starts on documentation classifiers. You are billed for the
        # time interval between this time and the value of TrainingEndTime.
        @[JSON::Field(key: "TrainingStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter training_start_time : Time?

        # The version name that you assigned to the document classifier.
        @[JSON::Field(key: "VersionName")]
        getter version_name : String?

        # ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend uses to
        # encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis
        # job. The VolumeKmsKeyId can be either of the following formats: KMS Key ID:
        # "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        # Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are
        # using for your custom classifier. For more information, see Amazon VPC .
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @classifier_metadata : Types::ClassifierMetadata? = nil,
          @data_access_role_arn : String? = nil,
          @document_classifier_arn : String? = nil,
          @end_time : Time? = nil,
          @flywheel_arn : String? = nil,
          @input_data_config : Types::DocumentClassifierInputDataConfig? = nil,
          @language_code : String? = nil,
          @message : String? = nil,
          @mode : String? = nil,
          @model_kms_key_id : String? = nil,
          @output_data_config : Types::DocumentClassifierOutputDataConfig? = nil,
          @source_model_arn : String? = nil,
          @status : String? = nil,
          @submit_time : Time? = nil,
          @training_end_time : Time? = nil,
          @training_start_time : Time? = nil,
          @version_name : String? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # Describes information about a document classifier and its versions.
      struct DocumentClassifierSummary
        include JSON::Serializable

        # The name that you assigned the document classifier.
        @[JSON::Field(key: "DocumentClassifierName")]
        getter document_classifier_name : String?

        # The time that the latest document classifier version was submitted for processing.
        @[JSON::Field(key: "LatestVersionCreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter latest_version_created_at : Time?

        # The version name you assigned to the latest document classifier version.
        @[JSON::Field(key: "LatestVersionName")]
        getter latest_version_name : String?

        # Provides the status of the latest document classifier version.
        @[JSON::Field(key: "LatestVersionStatus")]
        getter latest_version_status : String?

        # The number of versions you created.
        @[JSON::Field(key: "NumberOfVersions")]
        getter number_of_versions : Int32?

        def initialize(
          @document_classifier_name : String? = nil,
          @latest_version_created_at : Time? = nil,
          @latest_version_name : String? = nil,
          @latest_version_status : String? = nil,
          @number_of_versions : Int32? = nil
        )
        end
      end

      # Specifies one of the label or labels that categorize the document being analyzed.
      struct DocumentLabel
        include JSON::Serializable

        # The name of the label.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Page number where the label occurs. This field is present in the response only if your request
        # includes the Byte parameter.
        @[JSON::Field(key: "Page")]
        getter page : Int32?

        # The confidence score that Amazon Comprehend has this label correctly attributed.
        @[JSON::Field(key: "Score")]
        getter score : Float64?

        def initialize(
          @name : String? = nil,
          @page : Int32? = nil,
          @score : Float64? = nil
        )
        end
      end

      # Information about the document, discovered during text extraction.
      struct DocumentMetadata
        include JSON::Serializable

        # List of pages in the document, with the number of characters extracted from each page.
        @[JSON::Field(key: "ExtractedCharacters")]
        getter extracted_characters : Array(Types::ExtractedCharactersListItem)?

        # Number of pages in the document.
        @[JSON::Field(key: "Pages")]
        getter pages : Int32?

        def initialize(
          @extracted_characters : Array(Types::ExtractedCharactersListItem)? = nil,
          @pages : Int32? = nil
        )
        end
      end

      # Provides configuration parameters to override the default actions for extracting text from PDF
      # documents and image files. By default, Amazon Comprehend performs the following actions to extract
      # text from files, based on the input file type: Word files - Amazon Comprehend parser extracts the
      # text. Digital PDF files - Amazon Comprehend parser extracts the text. Image files and scanned PDF
      # files - Amazon Comprehend uses the Amazon Textract DetectDocumentText API to extract the text.
      # DocumentReaderConfig does not apply to plain text files or Word files. For image files and PDF
      # documents, you can override these default actions using the fields listed below. For more
      # information, see Setting text extraction options in the Comprehend Developer Guide.
      struct DocumentReaderConfig
        include JSON::Serializable

        # This field defines the Amazon Textract API operation that Amazon Comprehend uses to extract text
        # from PDF files and image files. Enter one of the following values: TEXTRACT_DETECT_DOCUMENT_TEXT -
        # The Amazon Comprehend service uses the DetectDocumentText API operation. TEXTRACT_ANALYZE_DOCUMENT -
        # The Amazon Comprehend service uses the AnalyzeDocument API operation.
        @[JSON::Field(key: "DocumentReadAction")]
        getter document_read_action : String

        # Determines the text extraction actions for PDF files. Enter one of the following values:
        # SERVICE_DEFAULT - use the Amazon Comprehend service defaults for PDF files.
        # FORCE_DOCUMENT_READ_ACTION - Amazon Comprehend uses the Textract API specified by DocumentReadAction
        # for all PDF files, including digital PDF files.
        @[JSON::Field(key: "DocumentReadMode")]
        getter document_read_mode : String?

        # Specifies the type of Amazon Textract features to apply. If you chose TEXTRACT_ANALYZE_DOCUMENT as
        # the read action, you must specify one or both of the following values: TABLES - Returns additional
        # information about any tables that are detected in the input document. FORMS - Returns additional
        # information about any forms that are detected in the input document.
        @[JSON::Field(key: "FeatureTypes")]
        getter feature_types : Array(String)?

        def initialize(
          @document_read_action : String,
          @document_read_mode : String? = nil,
          @feature_types : Array(String)? = nil
        )
        end
      end

      # Document type for each page in the document.
      struct DocumentTypeListItem
        include JSON::Serializable

        # Page number.
        @[JSON::Field(key: "Page")]
        getter page : Int32?

        # Document type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @page : Int32? = nil,
          @type : String? = nil
        )
        end
      end

      # Returns the code for the dominant language in the input text and the level of confidence that Amazon
      # Comprehend has in the accuracy of the detection.
      struct DominantLanguage
        include JSON::Serializable

        # The RFC 5646 language code for the dominant language. For more information about RFC 5646, see Tags
        # for Identifying Languages on the IETF Tools web site.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The level of confidence that Amazon Comprehend has in the accuracy of the detection.
        @[JSON::Field(key: "Score")]
        getter score : Float64?

        def initialize(
          @language_code : String? = nil,
          @score : Float64? = nil
        )
        end
      end

      # Provides information for filtering a list of dominant language detection jobs. For more information,
      # see the operation.
      struct DominantLanguageDetectionJobFilter
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

      # Provides information about a dominant language detection job.
      struct DominantLanguageDetectionJobProperties
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The time that the dominant language detection job completed.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The input data configuration that you supplied when you created the dominant language detection job.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig?

        # The Amazon Resource Name (ARN) of the dominant language detection job. It is a unique, fully
        # qualified identifier for the job. It includes the Amazon Web Services account, Amazon Web Services
        # Region, and the job ID. The format of the ARN is as follows:
        # arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:dominant-language-detection-job/&lt;job-id&gt;
        # The following is an example job ARN:
        # arn:aws:comprehend:us-west-2:111122223333:dominant-language-detection-job/1234abcd12ab34cd56ef1234567890ab
        @[JSON::Field(key: "JobArn")]
        getter job_arn : String?

        # The identifier assigned to the dominant language detection job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The name that you assigned to the dominant language detection job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # The current status of the dominant language detection job. If the status is FAILED , the Message
        # field shows the reason for the failure.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # A description for the status of a job.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The output data configuration that you supplied when you created the dominant language detection
        # job.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig?

        # The time that the dominant language detection job was submitted for processing.
        @[JSON::Field(key: "SubmitTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time : Time?

        # ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend uses to
        # encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis
        # job. The VolumeKmsKeyId can be either of the following formats: KMS Key ID:
        # "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        # Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are
        # using for your dominant language detection job. For more information, see Amazon VPC .
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @data_access_role_arn : String? = nil,
          @end_time : Time? = nil,
          @input_data_config : Types::InputDataConfig? = nil,
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @job_name : String? = nil,
          @job_status : String? = nil,
          @message : String? = nil,
          @output_data_config : Types::OutputDataConfig? = nil,
          @submit_time : Time? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # The filter used to determine which endpoints are returned. You can filter jobs on their name, model,
      # status, or the date and time that they were created. You can only set one filter at a time.
      struct EndpointFilter
        include JSON::Serializable

        # Specifies a date after which the returned endpoint or endpoints were created.
        @[JSON::Field(key: "CreationTimeAfter", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time_after : Time?

        # Specifies a date before which the returned endpoint or endpoints were created.
        @[JSON::Field(key: "CreationTimeBefore", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time_before : Time?

        # The Amazon Resource Number (ARN) of the model to which the endpoint is attached.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        # Specifies the status of the endpoint being returned. Possible values are: Creating, Ready, Updating,
        # Deleting, Failed.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_time_after : Time? = nil,
          @creation_time_before : Time? = nil,
          @model_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Specifies information about the specified endpoint. For information about endpoints, see Managing
      # endpoints .
      struct EndpointProperties
        include JSON::Serializable

        # The creation date and time of the endpoint.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The number of inference units currently used by the model using this endpoint.
        @[JSON::Field(key: "CurrentInferenceUnits")]
        getter current_inference_units : Int32?

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to trained
        # custom models encrypted with a customer managed key (ModelKmsKeyId).
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # Data access role ARN to use in case the new model is encrypted with a customer KMS key.
        @[JSON::Field(key: "DesiredDataAccessRoleArn")]
        getter desired_data_access_role_arn : String?

        # The desired number of inference units to be used by the model using this endpoint. Each inference
        # unit represents of a throughput of 100 characters per second.
        @[JSON::Field(key: "DesiredInferenceUnits")]
        getter desired_inference_units : Int32?

        # ARN of the new model to use for updating an existing endpoint. This ARN is going to be different
        # from the model ARN when the update is in progress
        @[JSON::Field(key: "DesiredModelArn")]
        getter desired_model_arn : String?

        # The Amazon Resource Number (ARN) of the endpoint.
        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String?

        # The Amazon Resource Number (ARN) of the flywheel
        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String?

        # The date and time that the endpoint was last modified.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # Specifies a reason for failure in cases of Failed status.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The Amazon Resource Number (ARN) of the model to which the endpoint is attached.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        # Specifies the status of the endpoint. Because the endpoint updates and creation are asynchronous, so
        # customers will need to wait for the endpoint to be Ready status before making inference requests.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_time : Time? = nil,
          @current_inference_units : Int32? = nil,
          @data_access_role_arn : String? = nil,
          @desired_data_access_role_arn : String? = nil,
          @desired_inference_units : Int32? = nil,
          @desired_model_arn : String? = nil,
          @endpoint_arn : String? = nil,
          @flywheel_arn : String? = nil,
          @last_modified_time : Time? = nil,
          @message : String? = nil,
          @model_arn : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides information for filtering a list of dominant language detection jobs. For more information,
      # see the operation.
      struct EntitiesDetectionJobFilter
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

      # Provides information about an entities detection job.
      struct EntitiesDetectionJobProperties
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The time that the entities detection job completed
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The Amazon Resource Name (ARN) that identifies the entity recognizer.
        @[JSON::Field(key: "EntityRecognizerArn")]
        getter entity_recognizer_arn : String?

        # The Amazon Resource Name (ARN) of the flywheel associated with this job.
        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String?

        # The input data configuration that you supplied when you created the entities detection job.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig?

        # The Amazon Resource Name (ARN) of the entities detection job. It is a unique, fully qualified
        # identifier for the job. It includes the Amazon Web Services account, Amazon Web Services Region, and
        # the job ID. The format of the ARN is as follows:
        # arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:entities-detection-job/&lt;job-id&gt;
        # The following is an example job ARN:
        # arn:aws:comprehend:us-west-2:111122223333:entities-detection-job/1234abcd12ab34cd56ef1234567890ab
        @[JSON::Field(key: "JobArn")]
        getter job_arn : String?

        # The identifier assigned to the entities detection job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The name that you assigned the entities detection job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # The current status of the entities detection job. If the status is FAILED , the Message field shows
        # the reason for the failure.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # The language code of the input documents.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # A description of the status of a job.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The output data configuration that you supplied when you created the entities detection job.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig?

        # The time that the entities detection job was submitted for processing.
        @[JSON::Field(key: "SubmitTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time : Time?

        # ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend uses to
        # encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis
        # job. The VolumeKmsKeyId can be either of the following formats: KMS Key ID:
        # "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        # Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are
        # using for your entity detection job. For more information, see Amazon VPC .
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @data_access_role_arn : String? = nil,
          @end_time : Time? = nil,
          @entity_recognizer_arn : String? = nil,
          @flywheel_arn : String? = nil,
          @input_data_config : Types::InputDataConfig? = nil,
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @job_name : String? = nil,
          @job_status : String? = nil,
          @language_code : String? = nil,
          @message : String? = nil,
          @output_data_config : Types::OutputDataConfig? = nil,
          @submit_time : Time? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # Provides information about an entity.
      struct Entity
        include JSON::Serializable

        # The zero-based offset from the beginning of the source text to the first character in the entity.
        # This field is empty for non-text input.
        @[JSON::Field(key: "BeginOffset")]
        getter begin_offset : Int32?

        # A reference to each block for this entity. This field is empty for plain-text input.
        @[JSON::Field(key: "BlockReferences")]
        getter block_references : Array(Types::BlockReference)?

        # The zero-based offset from the beginning of the source text to the last character in the entity.
        # This field is empty for non-text input.
        @[JSON::Field(key: "EndOffset")]
        getter end_offset : Int32?

        # The level of confidence that Amazon Comprehend has in the accuracy of the detection.
        @[JSON::Field(key: "Score")]
        getter score : Float64?

        # The text of the entity.
        @[JSON::Field(key: "Text")]
        getter text : String?

        # The entity type. For entity detection using the built-in model, this field contains one of the
        # standard entity types listed below. For custom entity detection, this field contains one of the
        # entity types that you specified when you trained your custom model.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @begin_offset : Int32? = nil,
          @block_references : Array(Types::BlockReference)? = nil,
          @end_offset : Int32? = nil,
          @score : Float64? = nil,
          @text : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Specifies one of the label or labels that categorize the personally identifiable information (PII)
      # entity being analyzed.
      struct EntityLabel
        include JSON::Serializable

        # The name of the label.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The level of confidence that Amazon Comprehend has in the accuracy of the detection.
        @[JSON::Field(key: "Score")]
        getter score : Float64?

        def initialize(
          @name : String? = nil,
          @score : Float64? = nil
        )
        end
      end

      # Configuration required for an entity recognition model.
      struct EntityRecognitionConfig
        include JSON::Serializable

        # Up to 25 entity types that the model is trained to recognize.
        @[JSON::Field(key: "EntityTypes")]
        getter entity_types : Array(Types::EntityTypesListItem)

        def initialize(
          @entity_types : Array(Types::EntityTypesListItem)
        )
        end
      end

      # Describes the annotations associated with a entity recognizer.
      struct EntityRecognizerAnnotations
        include JSON::Serializable

        # Specifies the Amazon S3 location where the annotations for an entity recognizer are located. The URI
        # must be in the same Region as the API endpoint that you are calling.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        # Specifies the Amazon S3 location where the test annotations for an entity recognizer are located.
        # The URI must be in the same Region as the API endpoint that you are calling.
        @[JSON::Field(key: "TestS3Uri")]
        getter test_s3_uri : String?

        def initialize(
          @s3_uri : String,
          @test_s3_uri : String? = nil
        )
        end
      end

      # Describes the training documents submitted with an entity recognizer.
      struct EntityRecognizerDocuments
        include JSON::Serializable

        # Specifies the Amazon S3 location where the training documents for an entity recognizer are located.
        # The URI must be in the same Region as the API endpoint that you are calling.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        # Specifies how the text in an input file should be processed. This is optional, and the default is
        # ONE_DOC_PER_LINE. ONE_DOC_PER_FILE - Each file is considered a separate document. Use this option
        # when you are processing large documents, such as newspaper articles or scientific papers.
        # ONE_DOC_PER_LINE - Each line in a file is considered a separate document. Use this option when you
        # are processing many short documents, such as text messages.
        @[JSON::Field(key: "InputFormat")]
        getter input_format : String?

        # Specifies the Amazon S3 location where the test documents for an entity recognizer are located. The
        # URI must be in the same Amazon Web Services Region as the API endpoint that you are calling.
        @[JSON::Field(key: "TestS3Uri")]
        getter test_s3_uri : String?

        def initialize(
          @s3_uri : String,
          @input_format : String? = nil,
          @test_s3_uri : String? = nil
        )
        end
      end

      # Describes the entity list submitted with an entity recognizer.
      struct EntityRecognizerEntityList
        include JSON::Serializable

        # Specifies the Amazon S3 location where the entity list is located. The URI must be in the same
        # Region as the API endpoint that you are calling.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        def initialize(
          @s3_uri : String
        )
        end
      end

      # Detailed information about the accuracy of an entity recognizer.
      struct EntityRecognizerEvaluationMetrics
        include JSON::Serializable

        # A measure of how accurate the recognizer results are for the test data. It is derived from the
        # Precision and Recall values. The F1Score is the harmonic average of the two scores. For plain text
        # entity recognizer models, the range is 0 to 100, where 100 is the best score. For PDF/Word entity
        # recognizer models, the range is 0 to 1, where 1 is the best score.
        @[JSON::Field(key: "F1Score")]
        getter f1_score : Float64?

        # A measure of the usefulness of the recognizer results in the test data. High precision means that
        # the recognizer returned substantially more relevant results than irrelevant ones.
        @[JSON::Field(key: "Precision")]
        getter precision : Float64?

        # A measure of how complete the recognizer results are for the test data. High recall means that the
        # recognizer returned most of the relevant results.
        @[JSON::Field(key: "Recall")]
        getter recall : Float64?

        def initialize(
          @f1_score : Float64? = nil,
          @precision : Float64? = nil,
          @recall : Float64? = nil
        )
        end
      end

      # Provides information for filtering a list of entity recognizers. You can only specify one filtering
      # parameter in a request. For more information, see the ListEntityRecognizers operation./&gt;
      struct EntityRecognizerFilter
        include JSON::Serializable

        # The name that you assigned the entity recognizer.
        @[JSON::Field(key: "RecognizerName")]
        getter recognizer_name : String?

        # The status of an entity recognizer.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Filters the list of entities based on the time that the list was submitted for processing. Returns
        # only jobs submitted after the specified time. Jobs are returned in ascending order, oldest to
        # newest.
        @[JSON::Field(key: "SubmitTimeAfter", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time_after : Time?

        # Filters the list of entities based on the time that the list was submitted for processing. Returns
        # only jobs submitted before the specified time. Jobs are returned in descending order, newest to
        # oldest.
        @[JSON::Field(key: "SubmitTimeBefore", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time_before : Time?

        def initialize(
          @recognizer_name : String? = nil,
          @status : String? = nil,
          @submit_time_after : Time? = nil,
          @submit_time_before : Time? = nil
        )
        end
      end

      # Specifies the format and location of the input data.
      struct EntityRecognizerInputDataConfig
        include JSON::Serializable

        # The entity types in the labeled training data that Amazon Comprehend uses to train the custom entity
        # recognizer. Any entity types that you don't specify are ignored. A maximum of 25 entity types can be
        # used at one time to train an entity recognizer. Entity types must not contain the following invalid
        # characters: \n (line break), \\n (escaped line break), \r (carriage return), \\r (escaped carriage
        # return), \t (tab), \\t (escaped tab), space, and , (comma).
        @[JSON::Field(key: "EntityTypes")]
        getter entity_types : Array(Types::EntityTypesListItem)

        # The S3 location of the CSV file that annotates your training documents.
        @[JSON::Field(key: "Annotations")]
        getter annotations : Types::EntityRecognizerAnnotations?

        # A list of augmented manifest files that provide training data for your custom model. An augmented
        # manifest file is a labeled dataset that is produced by Amazon SageMaker Ground Truth. This parameter
        # is required if you set DataFormat to AUGMENTED_MANIFEST .
        @[JSON::Field(key: "AugmentedManifests")]
        getter augmented_manifests : Array(Types::AugmentedManifestsListItem)?

        # The format of your training data: COMPREHEND_CSV : A CSV file that supplements your training
        # documents. The CSV file contains information about the custom entities that your trained model will
        # detect. The required format of the file depends on whether you are providing annotations or an
        # entity list. If you use this value, you must provide your CSV file by using either the Annotations
        # or EntityList parameters. You must provide your training documents by using the Documents parameter.
        # AUGMENTED_MANIFEST : A labeled dataset that is produced by Amazon SageMaker Ground Truth. This file
        # is in JSON lines format. Each line is a complete JSON object that contains a training document and
        # its labels. Each label annotates a named entity in the training document. If you use this value, you
        # must provide the AugmentedManifests parameter in your request. If you don't specify a value, Amazon
        # Comprehend uses COMPREHEND_CSV as the default.
        @[JSON::Field(key: "DataFormat")]
        getter data_format : String?

        # The S3 location of the folder that contains the training documents for your custom entity
        # recognizer. This parameter is required if you set DataFormat to COMPREHEND_CSV .
        @[JSON::Field(key: "Documents")]
        getter documents : Types::EntityRecognizerDocuments?

        # The S3 location of the CSV file that has the entity list for your custom entity recognizer.
        @[JSON::Field(key: "EntityList")]
        getter entity_list : Types::EntityRecognizerEntityList?

        def initialize(
          @entity_types : Array(Types::EntityTypesListItem),
          @annotations : Types::EntityRecognizerAnnotations? = nil,
          @augmented_manifests : Array(Types::AugmentedManifestsListItem)? = nil,
          @data_format : String? = nil,
          @documents : Types::EntityRecognizerDocuments? = nil,
          @entity_list : Types::EntityRecognizerEntityList? = nil
        )
        end
      end

      # Detailed information about an entity recognizer.
      struct EntityRecognizerMetadata
        include JSON::Serializable

        # Entity types from the metadata of an entity recognizer.
        @[JSON::Field(key: "EntityTypes")]
        getter entity_types : Array(Types::EntityRecognizerMetadataEntityTypesListItem)?

        # Detailed information about the accuracy of an entity recognizer.
        @[JSON::Field(key: "EvaluationMetrics")]
        getter evaluation_metrics : Types::EntityRecognizerEvaluationMetrics?

        # The number of documents in the input data that were used to test the entity recognizer. Typically
        # this is 10 to 20 percent of the input documents.
        @[JSON::Field(key: "NumberOfTestDocuments")]
        getter number_of_test_documents : Int32?

        # The number of documents in the input data that were used to train the entity recognizer. Typically
        # this is 80 to 90 percent of the input documents.
        @[JSON::Field(key: "NumberOfTrainedDocuments")]
        getter number_of_trained_documents : Int32?

        def initialize(
          @entity_types : Array(Types::EntityRecognizerMetadataEntityTypesListItem)? = nil,
          @evaluation_metrics : Types::EntityRecognizerEvaluationMetrics? = nil,
          @number_of_test_documents : Int32? = nil,
          @number_of_trained_documents : Int32? = nil
        )
        end
      end

      # Individual item from the list of entity types in the metadata of an entity recognizer.
      struct EntityRecognizerMetadataEntityTypesListItem
        include JSON::Serializable

        # Detailed information about the accuracy of the entity recognizer for a specific item on the list of
        # entity types.
        @[JSON::Field(key: "EvaluationMetrics")]
        getter evaluation_metrics : Types::EntityTypesEvaluationMetrics?

        # Indicates the number of times the given entity type was seen in the training data.
        @[JSON::Field(key: "NumberOfTrainMentions")]
        getter number_of_train_mentions : Int32?

        # Type of entity from the list of entity types in the metadata of an entity recognizer.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @evaluation_metrics : Types::EntityTypesEvaluationMetrics? = nil,
          @number_of_train_mentions : Int32? = nil,
          @type : String? = nil
        )
        end
      end

      # Output data configuration.
      struct EntityRecognizerOutputDataConfig
        include JSON::Serializable

        # The Amazon S3 prefix for the data lake location of the flywheel statistics.
        @[JSON::Field(key: "FlywheelStatsS3Prefix")]
        getter flywheel_stats_s3_prefix : String?

        def initialize(
          @flywheel_stats_s3_prefix : String? = nil
        )
        end
      end

      # Describes information about an entity recognizer.
      struct EntityRecognizerProperties
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The time that the recognizer creation completed.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The Amazon Resource Name (ARN) that identifies the entity recognizer.
        @[JSON::Field(key: "EntityRecognizerArn")]
        getter entity_recognizer_arn : String?

        # The Amazon Resource Number (ARN) of the flywheel
        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String?

        # The input data properties of an entity recognizer.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::EntityRecognizerInputDataConfig?

        # The language of the input documents. All documents must be in the same language. Only English ("en")
        # is currently supported.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # A description of the status of the recognizer.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # ID for the KMS key that Amazon Comprehend uses to encrypt trained custom models. The ModelKmsKeyId
        # can be either of the following formats: KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon
        # Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "ModelKmsKeyId")]
        getter model_kms_key_id : String?

        # Output data configuration.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::EntityRecognizerOutputDataConfig?

        # Provides information about an entity recognizer.
        @[JSON::Field(key: "RecognizerMetadata")]
        getter recognizer_metadata : Types::EntityRecognizerMetadata?

        # The Amazon Resource Name (ARN) of the source model. This model was imported from a different Amazon
        # Web Services account to create the entity recognizer model in your Amazon Web Services account.
        @[JSON::Field(key: "SourceModelArn")]
        getter source_model_arn : String?

        # Provides the status of the entity recognizer.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The time that the recognizer was submitted for processing.
        @[JSON::Field(key: "SubmitTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time : Time?

        # The time that training of the entity recognizer was completed.
        @[JSON::Field(key: "TrainingEndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter training_end_time : Time?

        # The time that training of the entity recognizer started.
        @[JSON::Field(key: "TrainingStartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter training_start_time : Time?

        # The version name you assigned to the entity recognizer.
        @[JSON::Field(key: "VersionName")]
        getter version_name : String?

        # ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend uses to
        # encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis
        # job. The VolumeKmsKeyId can be either of the following formats: KMS Key ID:
        # "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        # Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are
        # using for your custom entity recognizer. For more information, see Amazon VPC .
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @data_access_role_arn : String? = nil,
          @end_time : Time? = nil,
          @entity_recognizer_arn : String? = nil,
          @flywheel_arn : String? = nil,
          @input_data_config : Types::EntityRecognizerInputDataConfig? = nil,
          @language_code : String? = nil,
          @message : String? = nil,
          @model_kms_key_id : String? = nil,
          @output_data_config : Types::EntityRecognizerOutputDataConfig? = nil,
          @recognizer_metadata : Types::EntityRecognizerMetadata? = nil,
          @source_model_arn : String? = nil,
          @status : String? = nil,
          @submit_time : Time? = nil,
          @training_end_time : Time? = nil,
          @training_start_time : Time? = nil,
          @version_name : String? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # Describes the information about an entity recognizer and its versions.
      struct EntityRecognizerSummary
        include JSON::Serializable

        # The time that the latest entity recognizer version was submitted for processing.
        @[JSON::Field(key: "LatestVersionCreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter latest_version_created_at : Time?

        # The version name you assigned to the latest entity recognizer version.
        @[JSON::Field(key: "LatestVersionName")]
        getter latest_version_name : String?

        # Provides the status of the latest entity recognizer version.
        @[JSON::Field(key: "LatestVersionStatus")]
        getter latest_version_status : String?

        # The number of versions you created.
        @[JSON::Field(key: "NumberOfVersions")]
        getter number_of_versions : Int32?

        # The name that you assigned the entity recognizer.
        @[JSON::Field(key: "RecognizerName")]
        getter recognizer_name : String?

        def initialize(
          @latest_version_created_at : Time? = nil,
          @latest_version_name : String? = nil,
          @latest_version_status : String? = nil,
          @number_of_versions : Int32? = nil,
          @recognizer_name : String? = nil
        )
        end
      end

      # Detailed information about the accuracy of an entity recognizer for a specific entity type.
      struct EntityTypesEvaluationMetrics
        include JSON::Serializable

        # A measure of how accurate the recognizer results are for a specific entity type in the test data. It
        # is derived from the Precision and Recall values. The F1Score is the harmonic average of the two
        # scores. The highest score is 1, and the worst score is 0.
        @[JSON::Field(key: "F1Score")]
        getter f1_score : Float64?

        # A measure of the usefulness of the recognizer results for a specific entity type in the test data.
        # High precision means that the recognizer returned substantially more relevant results than
        # irrelevant ones.
        @[JSON::Field(key: "Precision")]
        getter precision : Float64?

        # A measure of how complete the recognizer results are for a specific entity type in the test data.
        # High recall means that the recognizer returned most of the relevant results.
        @[JSON::Field(key: "Recall")]
        getter recall : Float64?

        def initialize(
          @f1_score : Float64? = nil,
          @precision : Float64? = nil,
          @recall : Float64? = nil
        )
        end
      end

      # An entity type within a labeled training dataset that Amazon Comprehend uses to train a custom
      # entity recognizer.
      struct EntityTypesListItem
        include JSON::Serializable

        # An entity type within a labeled training dataset that Amazon Comprehend uses to train a custom
        # entity recognizer. Entity types must not contain the following invalid characters: \n (line break),
        # \\n (escaped line break, \r (carriage return), \\r (escaped carriage return), \t (tab), \\t (escaped
        # tab), and , (comma).
        @[JSON::Field(key: "Type")]
        getter type : String

        def initialize(
          @type : String
        )
        end
      end

      # Text extraction encountered one or more page-level errors in the input document. The ErrorCode
      # contains one of the following values: TEXTRACT_BAD_PAGE - Amazon Textract cannot read the page. For
      # more information about page limits in Amazon Textract, see Page Quotas in Amazon Textract .
      # TEXTRACT_PROVISIONED_THROUGHPUT_EXCEEDED - The number of requests exceeded your throughput limit.
      # For more information about throughput quotas in Amazon Textract, see Default quotas in Amazon
      # Textract . PAGE_CHARACTERS_EXCEEDED - Too many text characters on the page (10,000 characters
      # maximum). PAGE_SIZE_EXCEEDED - The maximum page size is 10 MB. INTERNAL_SERVER_ERROR - The request
      # encountered a service issue. Try the API request again.
      struct ErrorsListItem
        include JSON::Serializable

        # Error code for the cause of the error.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # Text message explaining the reason for the error.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # Page number where the error occurred.
        @[JSON::Field(key: "Page")]
        getter page : Int32?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @page : Int32? = nil
        )
        end
      end

      # Provides information for filtering a list of event detection jobs.
      struct EventsDetectionJobFilter
        include JSON::Serializable

        # Filters on the name of the events detection job.
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

      # Provides information about an events detection job.
      struct EventsDetectionJobProperties
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The time that the events detection job completed.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The input data configuration that you supplied when you created the events detection job.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig?

        # The Amazon Resource Name (ARN) of the events detection job. It is a unique, fully qualified
        # identifier for the job. It includes the Amazon Web Services account, Amazon Web Services Region, and
        # the job ID. The format of the ARN is as follows:
        # arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:events-detection-job/&lt;job-id&gt;
        # The following is an example job ARN:
        # arn:aws:comprehend:us-west-2:111122223333:events-detection-job/1234abcd12ab34cd56ef1234567890ab
        @[JSON::Field(key: "JobArn")]
        getter job_arn : String?

        # The identifier assigned to the events detection job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The name you assigned the events detection job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # The current status of the events detection job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # The language code of the input documents.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # A description of the status of the events detection job.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The output data configuration that you supplied when you created the events detection job.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig?

        # The time that the events detection job was submitted for processing.
        @[JSON::Field(key: "SubmitTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time : Time?

        # The types of events that are detected by the job.
        @[JSON::Field(key: "TargetEventTypes")]
        getter target_event_types : Array(String)?

        def initialize(
          @data_access_role_arn : String? = nil,
          @end_time : Time? = nil,
          @input_data_config : Types::InputDataConfig? = nil,
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @job_name : String? = nil,
          @job_status : String? = nil,
          @language_code : String? = nil,
          @message : String? = nil,
          @output_data_config : Types::OutputDataConfig? = nil,
          @submit_time : Time? = nil,
          @target_event_types : Array(String)? = nil
        )
        end
      end

      # Array of the number of characters extracted from each page.
      struct ExtractedCharactersListItem
        include JSON::Serializable

        # Number of characters extracted from each page.
        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # Page number.
        @[JSON::Field(key: "Page")]
        getter page : Int32?

        def initialize(
          @count : Int32? = nil,
          @page : Int32? = nil
        )
        end
      end

      # Filter the flywheels based on creation time or flywheel status.
      struct FlywheelFilter
        include JSON::Serializable

        # Filter the flywheels to include flywheels created after the specified time.
        @[JSON::Field(key: "CreationTimeAfter", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time_after : Time?

        # Filter the flywheels to include flywheels created before the specified time.
        @[JSON::Field(key: "CreationTimeBefore", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time_before : Time?

        # Filter the flywheels based on the flywheel status.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_time_after : Time? = nil,
          @creation_time_before : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Filter the flywheel iterations based on creation time.
      struct FlywheelIterationFilter
        include JSON::Serializable

        # Filter the flywheel iterations to include iterations created after the specified time.
        @[JSON::Field(key: "CreationTimeAfter", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time_after : Time?

        # Filter the flywheel iterations to include iterations created before the specified time.
        @[JSON::Field(key: "CreationTimeBefore", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time_before : Time?

        def initialize(
          @creation_time_after : Time? = nil,
          @creation_time_before : Time? = nil
        )
        end
      end

      # The configuration properties of a flywheel iteration.
      struct FlywheelIterationProperties
        include JSON::Serializable

        # The creation start time of the flywheel iteration.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The completion time of this flywheel iteration.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The ARN of the evaluated model associated with this flywheel iteration.
        @[JSON::Field(key: "EvaluatedModelArn")]
        getter evaluated_model_arn : String?

        @[JSON::Field(key: "EvaluatedModelMetrics")]
        getter evaluated_model_metrics : Types::FlywheelModelEvaluationMetrics?

        @[JSON::Field(key: "EvaluationManifestS3Prefix")]
        getter evaluation_manifest_s3_prefix : String?

        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String?

        @[JSON::Field(key: "FlywheelIterationId")]
        getter flywheel_iteration_id : String?

        # A description of the status of the flywheel iteration.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The status of the flywheel iteration.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The ARN of the trained model associated with this flywheel iteration.
        @[JSON::Field(key: "TrainedModelArn")]
        getter trained_model_arn : String?

        # The metrics associated with the trained model.
        @[JSON::Field(key: "TrainedModelMetrics")]
        getter trained_model_metrics : Types::FlywheelModelEvaluationMetrics?

        def initialize(
          @creation_time : Time? = nil,
          @end_time : Time? = nil,
          @evaluated_model_arn : String? = nil,
          @evaluated_model_metrics : Types::FlywheelModelEvaluationMetrics? = nil,
          @evaluation_manifest_s3_prefix : String? = nil,
          @flywheel_arn : String? = nil,
          @flywheel_iteration_id : String? = nil,
          @message : String? = nil,
          @status : String? = nil,
          @trained_model_arn : String? = nil,
          @trained_model_metrics : Types::FlywheelModelEvaluationMetrics? = nil
        )
        end
      end

      # The evaluation metrics associated with the evaluated model.
      struct FlywheelModelEvaluationMetrics
        include JSON::Serializable

        # Average accuracy metric for the model.
        @[JSON::Field(key: "AverageAccuracy")]
        getter average_accuracy : Float64?

        # The average F1 score from the evaluation metrics.
        @[JSON::Field(key: "AverageF1Score")]
        getter average_f1_score : Float64?

        # Average precision metric for the model.
        @[JSON::Field(key: "AveragePrecision")]
        getter average_precision : Float64?

        # Average recall metric for the model.
        @[JSON::Field(key: "AverageRecall")]
        getter average_recall : Float64?

        def initialize(
          @average_accuracy : Float64? = nil,
          @average_f1_score : Float64? = nil,
          @average_precision : Float64? = nil,
          @average_recall : Float64? = nil
        )
        end
      end

      # The flywheel properties.
      struct FlywheelProperties
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the active model version.
        @[JSON::Field(key: "ActiveModelArn")]
        getter active_model_arn : String?

        # Creation time of the flywheel.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend permission to access
        # the flywheel data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # Amazon S3 URI of the data lake location.
        @[JSON::Field(key: "DataLakeS3Uri")]
        getter data_lake_s3_uri : String?

        # Data security configuration.
        @[JSON::Field(key: "DataSecurityConfig")]
        getter data_security_config : Types::DataSecurityConfig?

        # The Amazon Resource Number (ARN) of the flywheel.
        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String?

        # Last modified time for the flywheel.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The most recent flywheel iteration.
        @[JSON::Field(key: "LatestFlywheelIteration")]
        getter latest_flywheel_iteration : String?

        # A description of the status of the flywheel.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # Model type of the flywheel's model.
        @[JSON::Field(key: "ModelType")]
        getter model_type : String?

        # The status of the flywheel.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Configuration about the model associated with a flywheel.
        @[JSON::Field(key: "TaskConfig")]
        getter task_config : Types::TaskConfig?

        def initialize(
          @active_model_arn : String? = nil,
          @creation_time : Time? = nil,
          @data_access_role_arn : String? = nil,
          @data_lake_s3_uri : String? = nil,
          @data_security_config : Types::DataSecurityConfig? = nil,
          @flywheel_arn : String? = nil,
          @last_modified_time : Time? = nil,
          @latest_flywheel_iteration : String? = nil,
          @message : String? = nil,
          @model_type : String? = nil,
          @status : String? = nil,
          @task_config : Types::TaskConfig? = nil
        )
        end
      end

      # Flywheel summary information.
      struct FlywheelSummary
        include JSON::Serializable

        # ARN of the active model version for the flywheel.
        @[JSON::Field(key: "ActiveModelArn")]
        getter active_model_arn : String?

        # Creation time of the flywheel.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # Amazon S3 URI of the data lake location.
        @[JSON::Field(key: "DataLakeS3Uri")]
        getter data_lake_s3_uri : String?

        # The Amazon Resource Number (ARN) of the flywheel
        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String?

        # Last modified time for the flywheel.
        @[JSON::Field(key: "LastModifiedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The most recent flywheel iteration.
        @[JSON::Field(key: "LatestFlywheelIteration")]
        getter latest_flywheel_iteration : String?

        # A description of the status of the flywheel.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # Model type of the flywheel's model.
        @[JSON::Field(key: "ModelType")]
        getter model_type : String?

        # The status of the flywheel.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @active_model_arn : String? = nil,
          @creation_time : Time? = nil,
          @data_lake_s3_uri : String? = nil,
          @flywheel_arn : String? = nil,
          @last_modified_time : Time? = nil,
          @latest_flywheel_iteration : String? = nil,
          @message : String? = nil,
          @model_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Information about the location of items on a document page. For additional information, see Geometry
      # in the Amazon Textract API reference.
      struct Geometry
        include JSON::Serializable

        # An axis-aligned coarse representation of the location of the recognized item on the document page.
        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Types::BoundingBox?

        # Within the bounding box, a fine-grained polygon around the recognized item.
        @[JSON::Field(key: "Polygon")]
        getter polygon : Array(Types::Point)?

        def initialize(
          @bounding_box : Types::BoundingBox? = nil,
          @polygon : Array(Types::Point)? = nil
        )
        end
      end

      struct ImportModelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom model to import.
        @[JSON::Field(key: "SourceModelArn")]
        getter source_model_arn : String

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend permission to use
        # Amazon Key Management Service (KMS) to encrypt or decrypt the custom model.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # ID for the KMS key that Amazon Comprehend uses to encrypt trained custom models. The ModelKmsKeyId
        # can be either of the following formats: KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon
        # Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "ModelKmsKeyId")]
        getter model_kms_key_id : String?

        # The name to assign to the custom model that is created in Amazon Comprehend by this import.
        @[JSON::Field(key: "ModelName")]
        getter model_name : String?

        # Tags to associate with the custom model that is created by this import. A tag is a key-value pair
        # that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as
        # the key might be added to a resource to indicate its use by the sales department.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The version name given to the custom model that is created by this import. Version names can have a
        # maximum of 256 characters. Alphanumeric characters, hyphens (-) and underscores (_) are allowed. The
        # version name must be unique among all models with the same classifier name in the account/Region.
        @[JSON::Field(key: "VersionName")]
        getter version_name : String?

        def initialize(
          @source_model_arn : String,
          @data_access_role_arn : String? = nil,
          @model_kms_key_id : String? = nil,
          @model_name : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @version_name : String? = nil
        )
        end
      end

      struct ImportModelResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom model being imported.
        @[JSON::Field(key: "ModelArn")]
        getter model_arn : String?

        def initialize(
          @model_arn : String? = nil
        )
        end
      end

      # The input properties for an inference job. The document reader config field applies only to non-text
      # inputs for custom analysis.
      struct InputDataConfig
        include JSON::Serializable

        # The Amazon S3 URI for the input data. The URI must be in same Region as the API endpoint that you
        # are calling. The URI can point to a single input file or it can provide the prefix for a collection
        # of data files. For example, if you use the URI S3://bucketName/prefix , if the prefix is a single
        # file, Amazon Comprehend uses that file as input. If more than one file begins with the prefix,
        # Amazon Comprehend uses all of them as input.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        # Provides configuration parameters to override the default actions for extracting text from PDF
        # documents and image files.
        @[JSON::Field(key: "DocumentReaderConfig")]
        getter document_reader_config : Types::DocumentReaderConfig?

        # Specifies how the text in an input file should be processed: ONE_DOC_PER_FILE - Each file is
        # considered a separate document. Use this option when you are processing large documents, such as
        # newspaper articles or scientific papers. ONE_DOC_PER_LINE - Each line in a file is considered a
        # separate document. Use this option when you are processing many short documents, such as text
        # messages.
        @[JSON::Field(key: "InputFormat")]
        getter input_format : String?

        def initialize(
          @s3_uri : String,
          @document_reader_config : Types::DocumentReaderConfig? = nil,
          @input_format : String? = nil
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

      # The filter specified for the operation is invalid. Specify a different filter.
      struct InvalidFilterException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides additional detail about why the request failed.
      struct InvalidRequestDetail
        include JSON::Serializable

        # Reason codes include the following values: DOCUMENT_SIZE_EXCEEDED - Document size is too large.
        # Check the size of your file and resubmit the request. UNSUPPORTED_DOC_TYPE - Document type is not
        # supported. Check the file type and resubmit the request. PAGE_LIMIT_EXCEEDED - Too many pages in the
        # document. Check the number of pages in your file and resubmit the request. TEXTRACT_ACCESS_DENIED -
        # Access denied to Amazon Textract. Verify that your account has permission to use Amazon Textract API
        # operations and resubmit the request. NOT_TEXTRACT_JSON - Document is not Amazon Textract JSON
        # format. Verify the format and resubmit the request. MISMATCHED_TOTAL_PAGE_COUNT - Check the number
        # of pages in your file and resubmit the request. INVALID_DOCUMENT - Invalid document. Check the file
        # and resubmit the request.
        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @reason : String? = nil
        )
        end
      end

      # The request is invalid.
      struct InvalidRequestException
        include JSON::Serializable

        @[JSON::Field(key: "Detail")]
        getter detail : Types::InvalidRequestDetail?

        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @detail : Types::InvalidRequestDetail? = nil,
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # The specified job was not found. Check the job ID and try again.
      struct JobNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes a key noun phrase.
      struct KeyPhrase
        include JSON::Serializable

        # The zero-based offset from the beginning of the source text to the first character in the key
        # phrase.
        @[JSON::Field(key: "BeginOffset")]
        getter begin_offset : Int32?

        # The zero-based offset from the beginning of the source text to the last character in the key phrase.
        @[JSON::Field(key: "EndOffset")]
        getter end_offset : Int32?

        # The level of confidence that Amazon Comprehend has in the accuracy of the detection.
        @[JSON::Field(key: "Score")]
        getter score : Float64?

        # The text of a key noun phrase.
        @[JSON::Field(key: "Text")]
        getter text : String?

        def initialize(
          @begin_offset : Int32? = nil,
          @end_offset : Int32? = nil,
          @score : Float64? = nil,
          @text : String? = nil
        )
        end
      end

      # Provides information for filtering a list of dominant language detection jobs. For more information,
      # see the operation.
      struct KeyPhrasesDetectionJobFilter
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

      # Provides information about a key phrases detection job.
      struct KeyPhrasesDetectionJobProperties
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The time that the key phrases detection job completed.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The input data configuration that you supplied when you created the key phrases detection job.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig?

        # The Amazon Resource Name (ARN) of the key phrases detection job. It is a unique, fully qualified
        # identifier for the job. It includes the Amazon Web Services account, Amazon Web Services Region, and
        # the job ID. The format of the ARN is as follows:
        # arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:key-phrases-detection-job/&lt;job-id&gt;
        # The following is an example job ARN:
        # arn:aws:comprehend:us-west-2:111122223333:key-phrases-detection-job/1234abcd12ab34cd56ef1234567890ab
        @[JSON::Field(key: "JobArn")]
        getter job_arn : String?

        # The identifier assigned to the key phrases detection job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The name that you assigned the key phrases detection job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # The current status of the key phrases detection job. If the status is FAILED , the Message field
        # shows the reason for the failure.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # The language code of the input documents.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # A description of the status of a job.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The output data configuration that you supplied when you created the key phrases detection job.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig?

        # The time that the key phrases detection job was submitted for processing.
        @[JSON::Field(key: "SubmitTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time : Time?

        # ID for the KMS key that Amazon Comprehend uses to encrypt data on the storage volume attached to the
        # ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the
        # following formats: KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon Resource Name (ARN) of
        # a KMS Key: "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        # Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are
        # using for your key phrases detection job. For more information, see Amazon VPC .
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @data_access_role_arn : String? = nil,
          @end_time : Time? = nil,
          @input_data_config : Types::InputDataConfig? = nil,
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @job_name : String? = nil,
          @job_status : String? = nil,
          @language_code : String? = nil,
          @message : String? = nil,
          @output_data_config : Types::OutputDataConfig? = nil,
          @submit_time : Time? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # The KMS customer managed key (CMK) entered cannot be validated. Verify the key and re-enter it.
      struct KmsKeyValidationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListDatasetsRequest
        include JSON::Serializable

        # Filters the datasets to be returned in the response.
        @[JSON::Field(key: "Filter")]
        getter filter : Types::DatasetFilter?

        # The Amazon Resource Number (ARN) of the flywheel.
        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String?

        # Maximum number of results to return in a response. The default is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::DatasetFilter? = nil,
          @flywheel_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDatasetsResponse
        include JSON::Serializable

        # The dataset properties list.
        @[JSON::Field(key: "DatasetPropertiesList")]
        getter dataset_properties_list : Array(Types::DatasetProperties)?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @dataset_properties_list : Array(Types::DatasetProperties)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDocumentClassificationJobsRequest
        include JSON::Serializable

        # Filters the jobs that are returned. You can filter jobs on their names, status, or the date and time
        # that they were submitted. You can only set one filter at a time.
        @[JSON::Field(key: "Filter")]
        getter filter : Types::DocumentClassificationJobFilter?

        # The maximum number of results to return in each page. The default is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::DocumentClassificationJobFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDocumentClassificationJobsResponse
        include JSON::Serializable

        # A list containing the properties of each job returned.
        @[JSON::Field(key: "DocumentClassificationJobPropertiesList")]
        getter document_classification_job_properties_list : Array(Types::DocumentClassificationJobProperties)?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @document_classification_job_properties_list : Array(Types::DocumentClassificationJobProperties)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDocumentClassifierSummariesRequest
        include JSON::Serializable

        # The maximum number of results to return on each page. The default is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDocumentClassifierSummariesResponse
        include JSON::Serializable

        # The list of summaries of document classifiers.
        @[JSON::Field(key: "DocumentClassifierSummariesList")]
        getter document_classifier_summaries_list : Array(Types::DocumentClassifierSummary)?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @document_classifier_summaries_list : Array(Types::DocumentClassifierSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDocumentClassifiersRequest
        include JSON::Serializable

        # Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time
        # that they were submitted. You can only set one filter at a time.
        @[JSON::Field(key: "Filter")]
        getter filter : Types::DocumentClassifierFilter?

        # The maximum number of results to return in each page. The default is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::DocumentClassifierFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDocumentClassifiersResponse
        include JSON::Serializable

        # A list containing the properties of each job returned.
        @[JSON::Field(key: "DocumentClassifierPropertiesList")]
        getter document_classifier_properties_list : Array(Types::DocumentClassifierProperties)?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @document_classifier_properties_list : Array(Types::DocumentClassifierProperties)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDominantLanguageDetectionJobsRequest
        include JSON::Serializable

        # Filters that jobs that are returned. You can filter jobs on their name, status, or the date and time
        # that they were submitted. You can only set one filter at a time.
        @[JSON::Field(key: "Filter")]
        getter filter : Types::DominantLanguageDetectionJobFilter?

        # The maximum number of results to return in each page. The default is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::DominantLanguageDetectionJobFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListDominantLanguageDetectionJobsResponse
        include JSON::Serializable

        # A list containing the properties of each job that is returned.
        @[JSON::Field(key: "DominantLanguageDetectionJobPropertiesList")]
        getter dominant_language_detection_job_properties_list : Array(Types::DominantLanguageDetectionJobProperties)?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @dominant_language_detection_job_properties_list : Array(Types::DominantLanguageDetectionJobProperties)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEndpointsRequest
        include JSON::Serializable

        # Filters the endpoints that are returned. You can filter endpoints on their name, model, status, or
        # the date and time that they were created. You can only set one filter at a time.
        @[JSON::Field(key: "Filter")]
        getter filter : Types::EndpointFilter?

        # The maximum number of results to return in each page. The default is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::EndpointFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEndpointsResponse
        include JSON::Serializable

        # Displays a list of endpoint properties being retrieved by the service in response to the request.
        @[JSON::Field(key: "EndpointPropertiesList")]
        getter endpoint_properties_list : Array(Types::EndpointProperties)?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @endpoint_properties_list : Array(Types::EndpointProperties)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEntitiesDetectionJobsRequest
        include JSON::Serializable

        # Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time
        # that they were submitted. You can only set one filter at a time.
        @[JSON::Field(key: "Filter")]
        getter filter : Types::EntitiesDetectionJobFilter?

        # The maximum number of results to return in each page. The default is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::EntitiesDetectionJobFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEntitiesDetectionJobsResponse
        include JSON::Serializable

        # A list containing the properties of each job that is returned.
        @[JSON::Field(key: "EntitiesDetectionJobPropertiesList")]
        getter entities_detection_job_properties_list : Array(Types::EntitiesDetectionJobProperties)?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entities_detection_job_properties_list : Array(Types::EntitiesDetectionJobProperties)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEntityRecognizerSummariesRequest
        include JSON::Serializable

        # The maximum number of results to return on each page. The default is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEntityRecognizerSummariesResponse
        include JSON::Serializable

        # The list entity recognizer summaries.
        @[JSON::Field(key: "EntityRecognizerSummariesList")]
        getter entity_recognizer_summaries_list : Array(Types::EntityRecognizerSummary)?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entity_recognizer_summaries_list : Array(Types::EntityRecognizerSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEntityRecognizersRequest
        include JSON::Serializable

        # Filters the list of entities returned. You can filter on Status , SubmitTimeBefore , or
        # SubmitTimeAfter . You can only set one filter at a time.
        @[JSON::Field(key: "Filter")]
        getter filter : Types::EntityRecognizerFilter?

        # The maximum number of results to return on each page. The default is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::EntityRecognizerFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEntityRecognizersResponse
        include JSON::Serializable

        # The list of properties of an entity recognizer.
        @[JSON::Field(key: "EntityRecognizerPropertiesList")]
        getter entity_recognizer_properties_list : Array(Types::EntityRecognizerProperties)?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @entity_recognizer_properties_list : Array(Types::EntityRecognizerProperties)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEventsDetectionJobsRequest
        include JSON::Serializable

        # Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time
        # that they were submitted. You can only set one filter at a time.
        @[JSON::Field(key: "Filter")]
        getter filter : Types::EventsDetectionJobFilter?

        # The maximum number of results to return in each page.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::EventsDetectionJobFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListEventsDetectionJobsResponse
        include JSON::Serializable

        # A list containing the properties of each job that is returned.
        @[JSON::Field(key: "EventsDetectionJobPropertiesList")]
        getter events_detection_job_properties_list : Array(Types::EventsDetectionJobProperties)?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @events_detection_job_properties_list : Array(Types::EventsDetectionJobProperties)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFlywheelIterationHistoryRequest
        include JSON::Serializable

        # The ARN of the flywheel.
        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String

        # Filter the flywheel iteration history based on creation time.
        @[JSON::Field(key: "Filter")]
        getter filter : Types::FlywheelIterationFilter?

        # Maximum number of iteration history results to return
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Next token
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @flywheel_arn : String,
          @filter : Types::FlywheelIterationFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFlywheelIterationHistoryResponse
        include JSON::Serializable

        # List of flywheel iteration properties
        @[JSON::Field(key: "FlywheelIterationPropertiesList")]
        getter flywheel_iteration_properties_list : Array(Types::FlywheelIterationProperties)?

        # Next token
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @flywheel_iteration_properties_list : Array(Types::FlywheelIterationProperties)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFlywheelsRequest
        include JSON::Serializable

        # Filters the flywheels that are returned. You can filter flywheels on their status, or the date and
        # time that they were submitted. You can only set one filter at a time.
        @[JSON::Field(key: "Filter")]
        getter filter : Types::FlywheelFilter?

        # Maximum number of results to return in a response. The default is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::FlywheelFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFlywheelsResponse
        include JSON::Serializable

        # A list of flywheel properties retrieved by the service in response to the request.
        @[JSON::Field(key: "FlywheelSummaryList")]
        getter flywheel_summary_list : Array(Types::FlywheelSummary)?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @flywheel_summary_list : Array(Types::FlywheelSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListKeyPhrasesDetectionJobsRequest
        include JSON::Serializable

        # Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time
        # that they were submitted. You can only set one filter at a time.
        @[JSON::Field(key: "Filter")]
        getter filter : Types::KeyPhrasesDetectionJobFilter?

        # The maximum number of results to return in each page. The default is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::KeyPhrasesDetectionJobFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListKeyPhrasesDetectionJobsResponse
        include JSON::Serializable

        # A list containing the properties of each job that is returned.
        @[JSON::Field(key: "KeyPhrasesDetectionJobPropertiesList")]
        getter key_phrases_detection_job_properties_list : Array(Types::KeyPhrasesDetectionJobProperties)?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @key_phrases_detection_job_properties_list : Array(Types::KeyPhrasesDetectionJobProperties)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPiiEntitiesDetectionJobsRequest
        include JSON::Serializable

        # Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time
        # that they were submitted. You can only set one filter at a time.
        @[JSON::Field(key: "Filter")]
        getter filter : Types::PiiEntitiesDetectionJobFilter?

        # The maximum number of results to return in each page.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::PiiEntitiesDetectionJobFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListPiiEntitiesDetectionJobsResponse
        include JSON::Serializable

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list containing the properties of each job that is returned.
        @[JSON::Field(key: "PiiEntitiesDetectionJobPropertiesList")]
        getter pii_entities_detection_job_properties_list : Array(Types::PiiEntitiesDetectionJobProperties)?

        def initialize(
          @next_token : String? = nil,
          @pii_entities_detection_job_properties_list : Array(Types::PiiEntitiesDetectionJobProperties)? = nil
        )
        end
      end

      struct ListSentimentDetectionJobsRequest
        include JSON::Serializable

        # Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time
        # that they were submitted. You can only set one filter at a time.
        @[JSON::Field(key: "Filter")]
        getter filter : Types::SentimentDetectionJobFilter?

        # The maximum number of results to return in each page. The default is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::SentimentDetectionJobFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSentimentDetectionJobsResponse
        include JSON::Serializable

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list containing the properties of each job that is returned.
        @[JSON::Field(key: "SentimentDetectionJobPropertiesList")]
        getter sentiment_detection_job_properties_list : Array(Types::SentimentDetectionJobProperties)?

        def initialize(
          @next_token : String? = nil,
          @sentiment_detection_job_properties_list : Array(Types::SentimentDetectionJobProperties)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the given Amazon Comprehend resource you are querying.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the given Amazon Comprehend resource you are querying.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # Tags associated with the Amazon Comprehend resource being queried. A tag is a key-value pair that
        # adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the
        # key might be added to a resource to indicate its use by the sales department.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @resource_arn : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ListTargetedSentimentDetectionJobsRequest
        include JSON::Serializable

        # Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time
        # that they were submitted. You can only set one filter at a time.
        @[JSON::Field(key: "Filter")]
        getter filter : Types::TargetedSentimentDetectionJobFilter?

        # The maximum number of results to return in each page. The default is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::TargetedSentimentDetectionJobFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTargetedSentimentDetectionJobsResponse
        include JSON::Serializable

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list containing the properties of each job that is returned.
        @[JSON::Field(key: "TargetedSentimentDetectionJobPropertiesList")]
        getter targeted_sentiment_detection_job_properties_list : Array(Types::TargetedSentimentDetectionJobProperties)?

        def initialize(
          @next_token : String? = nil,
          @targeted_sentiment_detection_job_properties_list : Array(Types::TargetedSentimentDetectionJobProperties)? = nil
        )
        end
      end

      struct ListTopicsDetectionJobsRequest
        include JSON::Serializable

        # Filters the jobs that are returned. Jobs can be filtered on their name, status, or the date and time
        # that they were submitted. You can set only one filter at a time.
        @[JSON::Field(key: "Filter")]
        getter filter : Types::TopicsDetectionJobFilter?

        # The maximum number of results to return in each page. The default is 100.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filter : Types::TopicsDetectionJobFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTopicsDetectionJobsResponse
        include JSON::Serializable

        # Identifies the next page of results to return.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list containing the properties of each job that is returned.
        @[JSON::Field(key: "TopicsDetectionJobPropertiesList")]
        getter topics_detection_job_properties_list : Array(Types::TopicsDetectionJobProperties)?

        def initialize(
          @next_token : String? = nil,
          @topics_detection_job_properties_list : Array(Types::TopicsDetectionJobProperties)? = nil
        )
        end
      end

      # Contains the sentiment and sentiment score for one mention of an entity. For more information about
      # targeted sentiment, see Targeted sentiment in the Amazon Comprehend Developer Guide .
      struct MentionSentiment
        include JSON::Serializable

        # The sentiment of the mention.
        @[JSON::Field(key: "Sentiment")]
        getter sentiment : String?

        @[JSON::Field(key: "SentimentScore")]
        getter sentiment_score : Types::SentimentScore?

        def initialize(
          @sentiment : String? = nil,
          @sentiment_score : Types::SentimentScore? = nil
        )
        end
      end

      # Provides configuration parameters for the output of inference jobs.
      struct OutputDataConfig
        include JSON::Serializable

        # When you use the OutputDataConfig object with asynchronous operations, you specify the Amazon S3
        # location where you want to write the output data. The URI must be in the same Region as the API
        # endpoint that you are calling. The location is used as the prefix for the actual location of the
        # output file. When the topic detection job is finished, the service creates an output file in a
        # directory specific to the job. The S3Uri field contains the location of the output file, called
        # output.tar.gz . It is a compressed archive that contains the ouput of the operation. For a PII
        # entity detection job, the output file is plain text, not a compressed archive. The output file name
        # is the same as the input file, with .out appended at the end.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        # ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend uses to
        # encrypt the output results from an analysis job. Specify the Key Id of a symmetric key, because you
        # cannot use an asymmetric key for uploading data to S3. The KmsKeyId can be one of the following
        # formats: KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab" KMS Key Alias:
        # "alias/ExampleAlias" ARN of a KMS Key Alias: "arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias"
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @s3_uri : String,
          @kms_key_id : String? = nil
        )
        end
      end

      # Identifies the part of speech represented by the token and gives the confidence that Amazon
      # Comprehend has that the part of speech was correctly identified. For more information about the
      # parts of speech that Amazon Comprehend can identify, see Syntax in the Comprehend Developer Guide.
      struct PartOfSpeechTag
        include JSON::Serializable

        # The confidence that Amazon Comprehend has that the part of speech was correctly identified.
        @[JSON::Field(key: "Score")]
        getter score : Float64?

        # Identifies the part of speech that the token represents.
        @[JSON::Field(key: "Tag")]
        getter tag : String?

        def initialize(
          @score : Float64? = nil,
          @tag : String? = nil
        )
        end
      end

      # Provides information for filtering a list of PII entity detection jobs.
      struct PiiEntitiesDetectionJobFilter
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

      # Provides information about a PII entities detection job.
      struct PiiEntitiesDetectionJobProperties
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The time that the PII entities detection job completed.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The input properties for a PII entities detection job.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig?

        # The Amazon Resource Name (ARN) of the PII entities detection job. It is a unique, fully qualified
        # identifier for the job. It includes the Amazon Web Services account, Amazon Web Services Region, and
        # the job ID. The format of the ARN is as follows:
        # arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:pii-entities-detection-job/&lt;job-id&gt;
        # The following is an example job ARN:
        # arn:aws:comprehend:us-west-2:111122223333:pii-entities-detection-job/1234abcd12ab34cd56ef1234567890ab
        @[JSON::Field(key: "JobArn")]
        getter job_arn : String?

        # The identifier assigned to the PII entities detection job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The name that you assigned the PII entities detection job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # The current status of the PII entities detection job. If the status is FAILED , the Message field
        # shows the reason for the failure.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # The language code of the input documents.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # A description of the status of a job.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # Specifies whether the output provides the locations (offsets) of PII entities or a file in which PII
        # entities are redacted.
        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # The output data configuration that you supplied when you created the PII entities detection job.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::PiiOutputDataConfig?

        # Provides configuration parameters for PII entity redaction. This parameter is required if you set
        # the Mode parameter to ONLY_REDACTION . In that case, you must provide a RedactionConfig definition
        # that includes the PiiEntityTypes parameter.
        @[JSON::Field(key: "RedactionConfig")]
        getter redaction_config : Types::RedactionConfig?

        # The time that the PII entities detection job was submitted for processing.
        @[JSON::Field(key: "SubmitTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time : Time?

        def initialize(
          @data_access_role_arn : String? = nil,
          @end_time : Time? = nil,
          @input_data_config : Types::InputDataConfig? = nil,
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @job_name : String? = nil,
          @job_status : String? = nil,
          @language_code : String? = nil,
          @message : String? = nil,
          @mode : String? = nil,
          @output_data_config : Types::PiiOutputDataConfig? = nil,
          @redaction_config : Types::RedactionConfig? = nil,
          @submit_time : Time? = nil
        )
        end
      end

      # Provides information about a PII entity.
      struct PiiEntity
        include JSON::Serializable

        # The zero-based offset from the beginning of the source text to the first character in the entity.
        @[JSON::Field(key: "BeginOffset")]
        getter begin_offset : Int32?

        # The zero-based offset from the beginning of the source text to the last character in the entity.
        @[JSON::Field(key: "EndOffset")]
        getter end_offset : Int32?

        # The level of confidence that Amazon Comprehend has in the accuracy of the detection.
        @[JSON::Field(key: "Score")]
        getter score : Float64?

        # The entity's type.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @begin_offset : Int32? = nil,
          @end_offset : Int32? = nil,
          @score : Float64? = nil,
          @type : String? = nil
        )
        end
      end

      # Provides configuration parameters for the output of PII entity detection jobs.
      struct PiiOutputDataConfig
        include JSON::Serializable

        # When you use the PiiOutputDataConfig object with asynchronous operations, you specify the Amazon S3
        # location where you want to write the output data. For a PII entity detection job, the output file is
        # plain text, not a compressed archive. The output file name is the same as the input file, with .out
        # appended at the end.
        @[JSON::Field(key: "S3Uri")]
        getter s3_uri : String

        # ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend uses to
        # encrypt the output results from an analysis job.
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @s3_uri : String,
          @kms_key_id : String? = nil
        )
        end
      end

      # The X and Y coordinates of a point on a document page. For additional information, see Point in the
      # Amazon Textract API reference.
      struct Point
        include JSON::Serializable

        # The value of the X coordinate for a point on a polygon
        @[JSON::Field(key: "X")]
        getter x : Float64?

        # The value of the Y coordinate for a point on a polygon
        @[JSON::Field(key: "Y")]
        getter y : Float64?

        def initialize(
          @x : Float64? = nil,
          @y : Float64? = nil
        )
        end
      end

      struct PutResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the custom model to attach the policy to.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The JSON resource-based policy to attach to your custom model. Provide your JSON as a UTF-8 encoded
        # string without line breaks. To provide valid JSON for your policy, enclose the attribute names and
        # values in double quotes. If the JSON body is also enclosed in double quotes, then you must escape
        # the double quotes that are inside the policy: "{\"attribute\": \"value\", \"attribute\":
        # [\"value\"]}" To avoid escaping quotes, you can use single quotes to enclose the policy and double
        # quotes to enclose the JSON names and values: '{"attribute": "value", "attribute": ["value"]}'
        @[JSON::Field(key: "ResourcePolicy")]
        getter resource_policy : String

        # The revision ID that Amazon Comprehend assigned to the policy that you are updating. If you are
        # creating a new policy that has no prior version, don't use this parameter. Amazon Comprehend creates
        # the revision ID for you.
        @[JSON::Field(key: "PolicyRevisionId")]
        getter policy_revision_id : String?

        def initialize(
          @resource_arn : String,
          @resource_policy : String,
          @policy_revision_id : String? = nil
        )
        end
      end

      struct PutResourcePolicyResponse
        include JSON::Serializable

        # The revision ID of the policy. Each time you modify a policy, Amazon Comprehend assigns a new
        # revision ID, and it deletes the prior version of the policy.
        @[JSON::Field(key: "PolicyRevisionId")]
        getter policy_revision_id : String?

        def initialize(
          @policy_revision_id : String? = nil
        )
        end
      end

      # Provides configuration parameters for PII entity redaction.
      struct RedactionConfig
        include JSON::Serializable

        # A character that replaces each character in the redacted PII entity.
        @[JSON::Field(key: "MaskCharacter")]
        getter mask_character : String?

        # Specifies whether the PII entity is redacted with the mask character or the entity type.
        @[JSON::Field(key: "MaskMode")]
        getter mask_mode : String?

        # An array of the types of PII entities that Amazon Comprehend detects in the input text for your
        # request.
        @[JSON::Field(key: "PiiEntityTypes")]
        getter pii_entity_types : Array(String)?

        def initialize(
          @mask_character : String? = nil,
          @mask_mode : String? = nil,
          @pii_entity_types : Array(String)? = nil
        )
        end
      end

      # List of child blocks for the current block.
      struct RelationshipsListItem
        include JSON::Serializable

        # Identifers of the child blocks.
        @[JSON::Field(key: "Ids")]
        getter ids : Array(String)?

        # Only supported relationship is a child relationship.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @ids : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      # The specified resource name is already in use. Use a different name and try your request again.
      struct ResourceInUseException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum number of resources per account has been exceeded. Review the resources, and then try
      # your request again.
      struct ResourceLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource ARN was not found. Check the ARN and try your request again.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource is not available. Check the resource and try your request again.
      struct ResourceUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides information for filtering a list of dominant language detection jobs. For more information,
      # see the operation.
      struct SentimentDetectionJobFilter
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

      # Provides information about a sentiment detection job.
      struct SentimentDetectionJobProperties
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The time that the sentiment detection job ended.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The input data configuration that you supplied when you created the sentiment detection job.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig?

        # The Amazon Resource Name (ARN) of the sentiment detection job. It is a unique, fully qualified
        # identifier for the job. It includes the Amazon Web Services account, Amazon Web Services Region, and
        # the job ID. The format of the ARN is as follows:
        # arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:sentiment-detection-job/&lt;job-id&gt;
        # The following is an example job ARN:
        # arn:aws:comprehend:us-west-2:111122223333:sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab
        @[JSON::Field(key: "JobArn")]
        getter job_arn : String?

        # The identifier assigned to the sentiment detection job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The name that you assigned to the sentiment detection job
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # The current status of the sentiment detection job. If the status is FAILED , the Messages field
        # shows the reason for the failure.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # The language code of the input documents.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # A description of the status of a job.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The output data configuration that you supplied when you created the sentiment detection job.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig?

        # The time that the sentiment detection job was submitted for processing.
        @[JSON::Field(key: "SubmitTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time : Time?

        # ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend uses to
        # encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis
        # job. The VolumeKmsKeyId can be either of the following formats: KMS Key ID:
        # "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        # Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are
        # using for your sentiment detection job. For more information, see Amazon VPC .
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @data_access_role_arn : String? = nil,
          @end_time : Time? = nil,
          @input_data_config : Types::InputDataConfig? = nil,
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @job_name : String? = nil,
          @job_status : String? = nil,
          @language_code : String? = nil,
          @message : String? = nil,
          @output_data_config : Types::OutputDataConfig? = nil,
          @submit_time : Time? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # Describes the level of confidence that Amazon Comprehend has in the accuracy of its detection of
      # sentiments.
      struct SentimentScore
        include JSON::Serializable

        # The level of confidence that Amazon Comprehend has in the accuracy of its detection of the MIXED
        # sentiment.
        @[JSON::Field(key: "Mixed")]
        getter mixed : Float64?

        # The level of confidence that Amazon Comprehend has in the accuracy of its detection of the NEGATIVE
        # sentiment.
        @[JSON::Field(key: "Negative")]
        getter negative : Float64?

        # The level of confidence that Amazon Comprehend has in the accuracy of its detection of the NEUTRAL
        # sentiment.
        @[JSON::Field(key: "Neutral")]
        getter neutral : Float64?

        # The level of confidence that Amazon Comprehend has in the accuracy of its detection of the POSITIVE
        # sentiment.
        @[JSON::Field(key: "Positive")]
        getter positive : Float64?

        def initialize(
          @mixed : Float64? = nil,
          @negative : Float64? = nil,
          @neutral : Float64? = nil,
          @positive : Float64? = nil
        )
        end
      end

      struct StartDocumentClassificationJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # Specifies the format and location of the input data for the job.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # Specifies where to send the output files.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # A unique identifier for the request. If you do not set the client request token, Amazon Comprehend
        # generates one.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The Amazon Resource Name (ARN) of the document classifier to use to process the job.
        @[JSON::Field(key: "DocumentClassifierArn")]
        getter document_classifier_arn : String?

        # The Amazon Resource Number (ARN) of the flywheel associated with the model to use.
        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String?

        # The identifier of the job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # Tags to associate with the document classification job. A tag is a key-value pair that adds metadata
        # to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added
        # to a resource to indicate its use by the sales department.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend uses to
        # encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis
        # job. The VolumeKmsKeyId can be either of the following formats: KMS Key ID:
        # "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        # Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the
        # resources you are using for your document classification job. For more information, see Amazon VPC .
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @data_access_role_arn : String,
          @input_data_config : Types::InputDataConfig,
          @output_data_config : Types::OutputDataConfig,
          @client_request_token : String? = nil,
          @document_classifier_arn : String? = nil,
          @flywheel_arn : String? = nil,
          @job_name : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      struct StartDocumentClassificationJobResponse
        include JSON::Serializable

        # The ARN of the custom classification model.
        @[JSON::Field(key: "DocumentClassifierArn")]
        getter document_classifier_arn : String?

        # The Amazon Resource Name (ARN) of the document classification job. It is a unique, fully qualified
        # identifier for the job. It includes the Amazon Web Services account, Amazon Web Services Region, and
        # the job ID. The format of the ARN is as follows:
        # arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:document-classification-job/&lt;job-id&gt;
        # The following is an example job ARN:
        # arn:aws:comprehend:us-west-2:111122223333:document-classification-job/1234abcd12ab34cd56ef1234567890ab
        @[JSON::Field(key: "JobArn")]
        getter job_arn : String?

        # The identifier generated for the job. To get the status of the job, use this identifier with the
        # DescribeDocumentClassificationJob operation.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The status of the job: SUBMITTED - The job has been received and queued for processing. IN_PROGRESS
        # - Amazon Comprehend is processing the job. COMPLETED - The job was successfully completed and the
        # output is available. FAILED - The job did not complete. For details, use the
        # DescribeDocumentClassificationJob operation. STOP_REQUESTED - Amazon Comprehend has received a stop
        # request for the job and is processing the request. STOPPED - The job was successfully stopped
        # without completing.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @document_classifier_arn : String? = nil,
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil
        )
        end
      end

      struct StartDominantLanguageDetectionJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data. For more information, see Role-based permissions .
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # Specifies the format and location of the input data for the job.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # Specifies where to send the output files.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # A unique identifier for the request. If you do not set the client request token, Amazon Comprehend
        # generates one.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # An identifier for the job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # Tags to associate with the dominant language detection job. A tag is a key-value pair that adds
        # metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might
        # be added to a resource to indicate its use by the sales department.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend uses to
        # encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis
        # job. The VolumeKmsKeyId can be either of the following formats: KMS Key ID:
        # "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        # Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the
        # resources you are using for your dominant language detection job. For more information, see Amazon
        # VPC .
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @data_access_role_arn : String,
          @input_data_config : Types::InputDataConfig,
          @output_data_config : Types::OutputDataConfig,
          @client_request_token : String? = nil,
          @job_name : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      struct StartDominantLanguageDetectionJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the dominant language detection job. It is a unique, fully
        # qualified identifier for the job. It includes the Amazon Web Services account, Amazon Web Services
        # Region, and the job ID. The format of the ARN is as follows:
        # arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:dominant-language-detection-job/&lt;job-id&gt;
        # The following is an example job ARN:
        # arn:aws:comprehend:us-west-2:111122223333:dominant-language-detection-job/1234abcd12ab34cd56ef1234567890ab
        @[JSON::Field(key: "JobArn")]
        getter job_arn : String?

        # The identifier generated for the job. To get the status of a job, use this identifier with the
        # operation.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The status of the job. SUBMITTED - The job has been received and is queued for processing.
        # IN_PROGRESS - Amazon Comprehend is processing the job. COMPLETED - The job was successfully
        # completed and the output is available. FAILED - The job did not complete. To get details, use the
        # operation.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil
        )
        end
      end

      struct StartEntitiesDetectionJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data. For more information, see Role-based permissions .
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # Specifies the format and location of the input data for the job.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # The language of the input documents. All documents must be in the same language. You can specify any
        # of the languages supported by Amazon Comprehend. If custom entities recognition is used, this
        # parameter is ignored and the language used for training the model is used instead.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # Specifies where to send the output files.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # A unique identifier for the request. If you don't set the client request token, Amazon Comprehend
        # generates one.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The Amazon Resource Name (ARN) that identifies the specific entity recognizer to be used by the
        # StartEntitiesDetectionJob . This ARN is optional and is only used for a custom entity recognition
        # job.
        @[JSON::Field(key: "EntityRecognizerArn")]
        getter entity_recognizer_arn : String?

        # The Amazon Resource Number (ARN) of the flywheel associated with the model to use.
        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String?

        # The identifier of the job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # Tags to associate with the entities detection job. A tag is a key-value pair that adds metadata to a
        # resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a
        # resource to indicate its use by the sales department.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend uses to
        # encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis
        # job. The VolumeKmsKeyId can be either of the following formats: KMS Key ID:
        # "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        # Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the
        # resources you are using for your entity detection job. For more information, see Amazon VPC .
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @data_access_role_arn : String,
          @input_data_config : Types::InputDataConfig,
          @language_code : String,
          @output_data_config : Types::OutputDataConfig,
          @client_request_token : String? = nil,
          @entity_recognizer_arn : String? = nil,
          @flywheel_arn : String? = nil,
          @job_name : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      struct StartEntitiesDetectionJobResponse
        include JSON::Serializable

        # The ARN of the custom entity recognition model.
        @[JSON::Field(key: "EntityRecognizerArn")]
        getter entity_recognizer_arn : String?

        # The Amazon Resource Name (ARN) of the entities detection job. It is a unique, fully qualified
        # identifier for the job. It includes the Amazon Web Services account, Amazon Web Services Region, and
        # the job ID. The format of the ARN is as follows:
        # arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:entities-detection-job/&lt;job-id&gt;
        # The following is an example job ARN:
        # arn:aws:comprehend:us-west-2:111122223333:entities-detection-job/1234abcd12ab34cd56ef1234567890ab
        @[JSON::Field(key: "JobArn")]
        getter job_arn : String?

        # The identifier generated for the job. To get the status of job, use this identifier with the
        # operation.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The status of the job. SUBMITTED - The job has been received and is queued for processing.
        # IN_PROGRESS - Amazon Comprehend is processing the job. COMPLETED - The job was successfully
        # completed and the output is available. FAILED - The job did not complete. To get details, use the
        # operation. STOP_REQUESTED - Amazon Comprehend has received a stop request for the job and is
        # processing the request. STOPPED - The job was successfully stopped without completing.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @entity_recognizer_arn : String? = nil,
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil
        )
        end
      end

      struct StartEventsDetectionJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # Specifies the format and location of the input data for the job.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # The language code of the input documents.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # Specifies where to send the output files.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # The types of events to detect in the input documents.
        @[JSON::Field(key: "TargetEventTypes")]
        getter target_event_types : Array(String)

        # An unique identifier for the request. If you don't set the client request token, Amazon Comprehend
        # generates one.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The identifier of the events detection job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # Tags to associate with the events detection job. A tag is a key-value pair that adds metadata to a
        # resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a
        # resource to indicate its use by the sales department.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @data_access_role_arn : String,
          @input_data_config : Types::InputDataConfig,
          @language_code : String,
          @output_data_config : Types::OutputDataConfig,
          @target_event_types : Array(String),
          @client_request_token : String? = nil,
          @job_name : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct StartEventsDetectionJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the events detection job. It is a unique, fully qualified
        # identifier for the job. It includes the Amazon Web Services account, Amazon Web Services Region, and
        # the job ID. The format of the ARN is as follows:
        # arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:events-detection-job/&lt;job-id&gt;
        # The following is an example job ARN:
        # arn:aws:comprehend:us-west-2:111122223333:events-detection-job/1234abcd12ab34cd56ef1234567890ab
        @[JSON::Field(key: "JobArn")]
        getter job_arn : String?

        # An unique identifier for the request. If you don't set the client request token, Amazon Comprehend
        # generates one.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The status of the events detection job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil
        )
        end
      end

      struct StartFlywheelIterationRequest
        include JSON::Serializable

        # The ARN of the flywheel.
        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String

        # A unique identifier for the request. If you don't set the client request token, Amazon Comprehend
        # generates one.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @flywheel_arn : String,
          @client_request_token : String? = nil
        )
        end
      end

      struct StartFlywheelIterationResponse
        include JSON::Serializable

        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String?

        @[JSON::Field(key: "FlywheelIterationId")]
        getter flywheel_iteration_id : String?

        def initialize(
          @flywheel_arn : String? = nil,
          @flywheel_iteration_id : String? = nil
        )
        end
      end

      struct StartKeyPhrasesDetectionJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data. For more information, see Role-based permissions .
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # Specifies the format and location of the input data for the job.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # The language of the input documents. You can specify any of the primary languages supported by
        # Amazon Comprehend. All documents must be in the same language.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # Specifies where to send the output files.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # A unique identifier for the request. If you don't set the client request token, Amazon Comprehend
        # generates one.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The identifier of the job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # Tags to associate with the key phrases detection job. A tag is a key-value pair that adds metadata
        # to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added
        # to a resource to indicate its use by the sales department.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend uses to
        # encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis
        # job. The VolumeKmsKeyId can be either of the following formats: KMS Key ID:
        # "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        # Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the
        # resources you are using for your key phrases detection job. For more information, see Amazon VPC .
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @data_access_role_arn : String,
          @input_data_config : Types::InputDataConfig,
          @language_code : String,
          @output_data_config : Types::OutputDataConfig,
          @client_request_token : String? = nil,
          @job_name : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      struct StartKeyPhrasesDetectionJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the key phrase detection job. It is a unique, fully qualified
        # identifier for the job. It includes the Amazon Web Services account, Amazon Web Services Region, and
        # the job ID. The format of the ARN is as follows:
        # arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:key-phrases-detection-job/&lt;job-id&gt;
        # The following is an example job ARN:
        # arn:aws:comprehend:us-west-2:111122223333:key-phrases-detection-job/1234abcd12ab34cd56ef1234567890ab
        @[JSON::Field(key: "JobArn")]
        getter job_arn : String?

        # The identifier generated for the job. To get the status of a job, use this identifier with the
        # operation.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The status of the job. SUBMITTED - The job has been received and is queued for processing.
        # IN_PROGRESS - Amazon Comprehend is processing the job. COMPLETED - The job was successfully
        # completed and the output is available. FAILED - The job did not complete. To get details, use the
        # operation.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil
        )
        end
      end

      struct StartPiiEntitiesDetectionJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # The input properties for a PII entities detection job.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # The language of the input documents. Enter the language code for English (en) or Spanish (es).
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # Specifies whether the output provides the locations (offsets) of PII entities or a file in which PII
        # entities are redacted.
        @[JSON::Field(key: "Mode")]
        getter mode : String

        # Provides conﬁguration parameters for the output of PII entity detection jobs.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # A unique identifier for the request. If you don't set the client request token, Amazon Comprehend
        # generates one.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The identifier of the job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # Provides configuration parameters for PII entity redaction. This parameter is required if you set
        # the Mode parameter to ONLY_REDACTION . In that case, you must provide a RedactionConfig definition
        # that includes the PiiEntityTypes parameter.
        @[JSON::Field(key: "RedactionConfig")]
        getter redaction_config : Types::RedactionConfig?

        # Tags to associate with the PII entities detection job. A tag is a key-value pair that adds metadata
        # to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added
        # to a resource to indicate its use by the sales department.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @data_access_role_arn : String,
          @input_data_config : Types::InputDataConfig,
          @language_code : String,
          @mode : String,
          @output_data_config : Types::OutputDataConfig,
          @client_request_token : String? = nil,
          @job_name : String? = nil,
          @redaction_config : Types::RedactionConfig? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct StartPiiEntitiesDetectionJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the PII entity detection job. It is a unique, fully qualified
        # identifier for the job. It includes the Amazon Web Services account, Amazon Web Services Region, and
        # the job ID. The format of the ARN is as follows:
        # arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:pii-entities-detection-job/&lt;job-id&gt;
        # The following is an example job ARN:
        # arn:aws:comprehend:us-west-2:111122223333:pii-entities-detection-job/1234abcd12ab34cd56ef1234567890ab
        @[JSON::Field(key: "JobArn")]
        getter job_arn : String?

        # The identifier generated for the job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The status of the job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil
        )
        end
      end

      struct StartSentimentDetectionJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data. For more information, see Role-based permissions .
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # Specifies the format and location of the input data for the job.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # The language of the input documents. You can specify any of the primary languages supported by
        # Amazon Comprehend. All documents must be in the same language.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # Specifies where to send the output files.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # A unique identifier for the request. If you don't set the client request token, Amazon Comprehend
        # generates one.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The identifier of the job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # Tags to associate with the sentiment detection job. A tag is a key-value pair that adds metadata to
        # a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a
        # resource to indicate its use by the sales department.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend uses to
        # encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis
        # job. The VolumeKmsKeyId can be either of the following formats: KMS Key ID:
        # "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        # Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the
        # resources you are using for your sentiment detection job. For more information, see Amazon VPC .
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @data_access_role_arn : String,
          @input_data_config : Types::InputDataConfig,
          @language_code : String,
          @output_data_config : Types::OutputDataConfig,
          @client_request_token : String? = nil,
          @job_name : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      struct StartSentimentDetectionJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the sentiment detection job. It is a unique, fully qualified
        # identifier for the job. It includes the Amazon Web Services account, Amazon Web Services Region, and
        # the job ID. The format of the ARN is as follows:
        # arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:sentiment-detection-job/&lt;job-id&gt;
        # The following is an example job ARN:
        # arn:aws:comprehend:us-west-2:111122223333:sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab
        @[JSON::Field(key: "JobArn")]
        getter job_arn : String?

        # The identifier generated for the job. To get the status of a job, use this identifier with the
        # operation.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The status of the job. SUBMITTED - The job has been received and is queued for processing.
        # IN_PROGRESS - Amazon Comprehend is processing the job. COMPLETED - The job was successfully
        # completed and the output is available. FAILED - The job did not complete. To get details, use the
        # operation.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil
        )
        end
      end

      struct StartTargetedSentimentDetectionJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data. For more information, see Role-based permissions .
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # The language of the input documents. Currently, English is the only supported language.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # Specifies where to send the output files.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # A unique identifier for the request. If you don't set the client request token, Amazon Comprehend
        # generates one.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The identifier of the job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # Tags to associate with the targeted sentiment detection job. A tag is a key-value pair that adds
        # metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might
        # be added to a resource to indicate its use by the sales department.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # ID for the KMS key that Amazon Comprehend uses to encrypt data on the storage volume attached to the
        # ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the
        # following formats: KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon Resource Name (ARN) of
        # a KMS Key: "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @data_access_role_arn : String,
          @input_data_config : Types::InputDataConfig,
          @language_code : String,
          @output_data_config : Types::OutputDataConfig,
          @client_request_token : String? = nil,
          @job_name : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      struct StartTargetedSentimentDetectionJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the targeted sentiment detection job. It is a unique, fully
        # qualified identifier for the job. It includes the Amazon Web Services account, Amazon Web Services
        # Region, and the job ID. The format of the ARN is as follows:
        # arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:targeted-sentiment-detection-job/&lt;job-id&gt;
        # The following is an example job ARN:
        # arn:aws:comprehend:us-west-2:111122223333:targeted-sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab
        @[JSON::Field(key: "JobArn")]
        getter job_arn : String?

        # The identifier generated for the job. To get the status of a job, use this identifier with the
        # DescribeTargetedSentimentDetectionJob operation.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The status of the job. SUBMITTED - The job has been received and is queued for processing.
        # IN_PROGRESS - Amazon Comprehend is processing the job. COMPLETED - The job was successfully
        # completed and the output is available. FAILED - The job did not complete. To get details, use the
        # DescribeTargetedSentimentDetectionJob operation.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil
        )
        end
      end

      struct StartTopicsDetectionJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data. For more information, see Role-based permissions .
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String

        # Specifies the format and location of the input data for the job.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig

        # Specifies where to send the output files. The output is a compressed archive with two files,
        # topic-terms.csv that lists the terms associated with each topic, and doc-topics.csv that lists the
        # documents associated with each topic
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig

        # A unique identifier for the request. If you do not set the client request token, Amazon Comprehend
        # generates one.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The identifier of the job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # The number of topics to detect.
        @[JSON::Field(key: "NumberOfTopics")]
        getter number_of_topics : Int32?

        # Tags to associate with the topics detection job. A tag is a key-value pair that adds metadata to a
        # resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a
        # resource to indicate its use by the sales department.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend uses to
        # encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis
        # job. The VolumeKmsKeyId can be either of the following formats: KMS Key ID:
        # "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        # Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the
        # resources you are using for your topic detection job. For more information, see Amazon VPC .
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @data_access_role_arn : String,
          @input_data_config : Types::InputDataConfig,
          @output_data_config : Types::OutputDataConfig,
          @client_request_token : String? = nil,
          @job_name : String? = nil,
          @number_of_topics : Int32? = nil,
          @tags : Array(Types::Tag)? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      struct StartTopicsDetectionJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the topics detection job. It is a unique, fully qualified
        # identifier for the job. It includes the Amazon Web Services account, Amazon Web Services Region, and
        # the job ID. The format of the ARN is as follows:
        # arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:topics-detection-job/&lt;job-id&gt;
        # The following is an example job ARN:
        # arn:aws:comprehend:us-west-2:111122223333:document-classification-job/1234abcd12ab34cd56ef1234567890ab
        @[JSON::Field(key: "JobArn")]
        getter job_arn : String?

        # The identifier generated for the job. To get the status of the job, use this identifier with the
        # DescribeTopicDetectionJob operation.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The status of the job: SUBMITTED - The job has been received and is queued for processing.
        # IN_PROGRESS - Amazon Comprehend is processing the job. COMPLETED - The job was successfully
        # completed and the output is available. FAILED - The job did not complete. To get details, use the
        # DescribeTopicDetectionJob operation.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @job_status : String? = nil
        )
        end
      end

      struct StopDominantLanguageDetectionJobRequest
        include JSON::Serializable

        # The identifier of the dominant language detection job to stop.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct StopDominantLanguageDetectionJobResponse
        include JSON::Serializable

        # The identifier of the dominant language detection job to stop.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # Either STOP_REQUESTED if the job is currently running, or STOPPED if the job was previously stopped
        # with the StopDominantLanguageDetectionJob operation.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @job_id : String? = nil,
          @job_status : String? = nil
        )
        end
      end

      struct StopEntitiesDetectionJobRequest
        include JSON::Serializable

        # The identifier of the entities detection job to stop.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct StopEntitiesDetectionJobResponse
        include JSON::Serializable

        # The identifier of the entities detection job to stop.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # Either STOP_REQUESTED if the job is currently running, or STOPPED if the job was previously stopped
        # with the StopEntitiesDetectionJob operation.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @job_id : String? = nil,
          @job_status : String? = nil
        )
        end
      end

      struct StopEventsDetectionJobRequest
        include JSON::Serializable

        # The identifier of the events detection job to stop.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct StopEventsDetectionJobResponse
        include JSON::Serializable

        # The identifier of the events detection job to stop.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The status of the events detection job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @job_id : String? = nil,
          @job_status : String? = nil
        )
        end
      end

      struct StopKeyPhrasesDetectionJobRequest
        include JSON::Serializable

        # The identifier of the key phrases detection job to stop.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct StopKeyPhrasesDetectionJobResponse
        include JSON::Serializable

        # The identifier of the key phrases detection job to stop.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # Either STOP_REQUESTED if the job is currently running, or STOPPED if the job was previously stopped
        # with the StopKeyPhrasesDetectionJob operation.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @job_id : String? = nil,
          @job_status : String? = nil
        )
        end
      end

      struct StopPiiEntitiesDetectionJobRequest
        include JSON::Serializable

        # The identifier of the PII entities detection job to stop.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct StopPiiEntitiesDetectionJobResponse
        include JSON::Serializable

        # The identifier of the PII entities detection job to stop.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The status of the PII entities detection job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @job_id : String? = nil,
          @job_status : String? = nil
        )
        end
      end

      struct StopSentimentDetectionJobRequest
        include JSON::Serializable

        # The identifier of the sentiment detection job to stop.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct StopSentimentDetectionJobResponse
        include JSON::Serializable

        # The identifier of the sentiment detection job to stop.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # Either STOP_REQUESTED if the job is currently running, or STOPPED if the job was previously stopped
        # with the StopSentimentDetectionJob operation.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @job_id : String? = nil,
          @job_status : String? = nil
        )
        end
      end

      struct StopTargetedSentimentDetectionJobRequest
        include JSON::Serializable

        # The identifier of the targeted sentiment detection job to stop.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct StopTargetedSentimentDetectionJobResponse
        include JSON::Serializable

        # The identifier of the targeted sentiment detection job to stop.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # Either STOP_REQUESTED if the job is currently running, or STOPPED if the job was previously stopped
        # with the StopSentimentDetectionJob operation.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        def initialize(
          @job_id : String? = nil,
          @job_status : String? = nil
        )
        end
      end

      struct StopTrainingDocumentClassifierRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the document classifier currently being trained.
        @[JSON::Field(key: "DocumentClassifierArn")]
        getter document_classifier_arn : String

        def initialize(
          @document_classifier_arn : String
        )
        end
      end

      struct StopTrainingDocumentClassifierResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct StopTrainingEntityRecognizerRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the entity recognizer currently being trained.
        @[JSON::Field(key: "EntityRecognizerArn")]
        getter entity_recognizer_arn : String

        def initialize(
          @entity_recognizer_arn : String
        )
        end
      end

      struct StopTrainingEntityRecognizerResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a work in the input text that was recognized and assigned a part of speech. There is one
      # syntax token record for each word in the source text.
      struct SyntaxToken
        include JSON::Serializable

        # The zero-based offset from the beginning of the source text to the first character in the word.
        @[JSON::Field(key: "BeginOffset")]
        getter begin_offset : Int32?

        # The zero-based offset from the beginning of the source text to the last character in the word.
        @[JSON::Field(key: "EndOffset")]
        getter end_offset : Int32?

        # Provides the part of speech label and the confidence level that Amazon Comprehend has that the part
        # of speech was correctly identified. For more information, see Syntax in the Comprehend Developer
        # Guide.
        @[JSON::Field(key: "PartOfSpeech")]
        getter part_of_speech : Types::PartOfSpeechTag?

        # The word that was recognized in the source text.
        @[JSON::Field(key: "Text")]
        getter text : String?

        # A unique identifier for a token.
        @[JSON::Field(key: "TokenId")]
        getter token_id : Int32?

        def initialize(
          @begin_offset : Int32? = nil,
          @end_offset : Int32? = nil,
          @part_of_speech : Types::PartOfSpeechTag? = nil,
          @text : String? = nil,
          @token_id : Int32? = nil
        )
        end
      end

      # A key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag
      # with the key-value pair ‘Department’:’Sales’ might be added to a resource to indicate its use by a
      # particular department.
      struct Tag
        include JSON::Serializable

        # The initial part of a key-value pair that forms a tag associated with a given resource. For
        # instance, if you want to show which resources are used by which departments, you might use
        # “Department” as the key portion of the pair, with multiple possible values such as “sales,” “legal,”
        # and “administration.”
        @[JSON::Field(key: "Key")]
        getter key : String

        # The second part of a key-value pair that forms a tag associated with a given resource. For instance,
        # if you want to show which resources are used by which departments, you might use “Department” as the
        # initial (key) portion of the pair, with a value of “sales” to indicate the sales department.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the given Amazon Comprehend resource to which you want to
        # associate the tags.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Tags being associated with a specific Amazon Comprehend resource. There can be a maximum of 50 tags
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

      # Provides information for filtering a list of dominant language detection jobs. For more information,
      # see the ListTargetedSentimentDetectionJobs operation.
      struct TargetedSentimentDetectionJobFilter
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

      # Provides information about a targeted sentiment detection job.
      struct TargetedSentimentDetectionJobProperties
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your
        # input data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The time that the targeted sentiment detection job ended.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig?

        # The Amazon Resource Name (ARN) of the targeted sentiment detection job. It is a unique, fully
        # qualified identifier for the job. It includes the Amazon Web Services account, Amazon Web Services
        # Region, and the job ID. The format of the ARN is as follows:
        # arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:targeted-sentiment-detection-job/&lt;job-id&gt;
        # The following is an example job ARN:
        # arn:aws:comprehend:us-west-2:111122223333:targeted-sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab
        @[JSON::Field(key: "JobArn")]
        getter job_arn : String?

        # The identifier assigned to the targeted sentiment detection job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The name that you assigned to the targeted sentiment detection job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # The current status of the targeted sentiment detection job. If the status is FAILED , the Messages
        # field shows the reason for the failure.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # The language code of the input documents.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # A description of the status of a job.
        @[JSON::Field(key: "Message")]
        getter message : String?

        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig?

        # The time that the targeted sentiment detection job was submitted for processing.
        @[JSON::Field(key: "SubmitTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time : Time?

        # ID for the KMS key that Amazon Comprehend uses to encrypt the data on the storage volume attached to
        # the ML compute instance(s) that process the targeted sentiment detection job. The VolumeKmsKeyId can
        # be either of the following formats: KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon
        # Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @data_access_role_arn : String? = nil,
          @end_time : Time? = nil,
          @input_data_config : Types::InputDataConfig? = nil,
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @job_name : String? = nil,
          @job_status : String? = nil,
          @language_code : String? = nil,
          @message : String? = nil,
          @output_data_config : Types::OutputDataConfig? = nil,
          @submit_time : Time? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # Information about one of the entities found by targeted sentiment analysis. For more information
      # about targeted sentiment, see Targeted sentiment in the Amazon Comprehend Developer Guide .
      struct TargetedSentimentEntity
        include JSON::Serializable

        # One or more index into the Mentions array that provides the best name for the entity group.
        @[JSON::Field(key: "DescriptiveMentionIndex")]
        getter descriptive_mention_index : Array(Int32)?

        # An array of mentions of the entity in the document. The array represents a co-reference group. See
        # Co-reference group for an example.
        @[JSON::Field(key: "Mentions")]
        getter mentions : Array(Types::TargetedSentimentMention)?

        def initialize(
          @descriptive_mention_index : Array(Int32)? = nil,
          @mentions : Array(Types::TargetedSentimentMention)? = nil
        )
        end
      end

      # Information about one mention of an entity. The mention information includes the location of the
      # mention in the text and the sentiment of the mention. For more information about targeted sentiment,
      # see Targeted sentiment in the Amazon Comprehend Developer Guide .
      struct TargetedSentimentMention
        include JSON::Serializable

        # The offset into the document text where the mention begins.
        @[JSON::Field(key: "BeginOffset")]
        getter begin_offset : Int32?

        # The offset into the document text where the mention ends.
        @[JSON::Field(key: "EndOffset")]
        getter end_offset : Int32?

        # The confidence that all the entities mentioned in the group relate to the same entity.
        @[JSON::Field(key: "GroupScore")]
        getter group_score : Float64?

        # Contains the sentiment and sentiment score for the mention.
        @[JSON::Field(key: "MentionSentiment")]
        getter mention_sentiment : Types::MentionSentiment?

        # Model confidence that the entity is relevant. Value range is zero to one, where one is highest
        # confidence.
        @[JSON::Field(key: "Score")]
        getter score : Float64?

        # The text in the document that identifies the entity.
        @[JSON::Field(key: "Text")]
        getter text : String?

        # The type of the entity. Amazon Comprehend supports a variety of entity types .
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @begin_offset : Int32? = nil,
          @end_offset : Int32? = nil,
          @group_score : Float64? = nil,
          @mention_sentiment : Types::MentionSentiment? = nil,
          @score : Float64? = nil,
          @text : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Configuration about the model associated with a flywheel.
      struct TaskConfig
        include JSON::Serializable

        # Language code for the language that the model supports.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # Configuration required for a document classification model.
        @[JSON::Field(key: "DocumentClassificationConfig")]
        getter document_classification_config : Types::DocumentClassificationConfig?

        # Configuration required for an entity recognition model.
        @[JSON::Field(key: "EntityRecognitionConfig")]
        getter entity_recognition_config : Types::EntityRecognitionConfig?

        def initialize(
          @language_code : String,
          @document_classification_config : Types::DocumentClassificationConfig? = nil,
          @entity_recognition_config : Types::EntityRecognitionConfig? = nil
        )
        end
      end

      # One of the of text strings. Each string has a size limit of 1KB.
      struct TextSegment
        include JSON::Serializable

        # The text content.
        @[JSON::Field(key: "Text")]
        getter text : String

        def initialize(
          @text : String
        )
        end
      end

      # The size of the input text exceeds the limit. Use a smaller document.
      struct TextSizeLimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The number of requests exceeds the limit. Resubmit your request later.
      struct TooManyRequestsException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request contains more tag keys than can be associated with a resource (50 tag keys per
      # resource).
      struct TooManyTagKeysException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request contains more tags than can be associated with a resource (50 tags per resource). The
      # maximum number of tags includes both existing tags and those included in your current request.
      struct TooManyTagsException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides information for filtering topic detection jobs. For more information, see .
      struct TopicsDetectionJobFilter
        include JSON::Serializable

        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # Filters the list of topic detection jobs based on job status. Returns only jobs with the specified
        # status.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # Filters the list of jobs based on the time that the job was submitted for processing. Only returns
        # jobs submitted after the specified time. Jobs are returned in ascending order, oldest to newest.
        @[JSON::Field(key: "SubmitTimeAfter", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time_after : Time?

        # Filters the list of jobs based on the time that the job was submitted for processing. Only returns
        # jobs submitted before the specified time. Jobs are returned in descending order, newest to oldest.
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

      # Provides information about a topic detection job.
      struct TopicsDetectionJobProperties
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend read access to your job
        # data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # The time that the topic detection job was completed.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The input data configuration supplied when you created the topic detection job.
        @[JSON::Field(key: "InputDataConfig")]
        getter input_data_config : Types::InputDataConfig?

        # The Amazon Resource Name (ARN) of the topics detection job. It is a unique, fully qualified
        # identifier for the job. It includes the Amazon Web Services account, Amazon Web Services Region, and
        # the job ID. The format of the ARN is as follows:
        # arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:topics-detection-job/&lt;job-id&gt;
        # The following is an example job ARN:
        # arn:aws:comprehend:us-west-2:111122223333:topics-detection-job/1234abcd12ab34cd56ef1234567890ab
        @[JSON::Field(key: "JobArn")]
        getter job_arn : String?

        # The identifier assigned to the topic detection job.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The name of the topic detection job.
        @[JSON::Field(key: "JobName")]
        getter job_name : String?

        # The current status of the topic detection job. If the status is Failed , the reason for the failure
        # is shown in the Message field.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # A description for the status of a job.
        @[JSON::Field(key: "Message")]
        getter message : String?

        # The number of topics to detect supplied when you created the topic detection job. The default is 10.
        @[JSON::Field(key: "NumberOfTopics")]
        getter number_of_topics : Int32?

        # The output data configuration supplied when you created the topic detection job.
        @[JSON::Field(key: "OutputDataConfig")]
        getter output_data_config : Types::OutputDataConfig?

        # The time that the topic detection job was submitted for processing.
        @[JSON::Field(key: "SubmitTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter submit_time : Time?

        # ID for the Amazon Web Services Key Management Service (KMS) key that Amazon Comprehend uses to
        # encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis
        # job. The VolumeKmsKeyId can be either of the following formats: KMS Key ID:
        # "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        # Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are
        # using for your topic detection job. For more information, see Amazon VPC .
        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @data_access_role_arn : String? = nil,
          @end_time : Time? = nil,
          @input_data_config : Types::InputDataConfig? = nil,
          @job_arn : String? = nil,
          @job_id : String? = nil,
          @job_name : String? = nil,
          @job_status : String? = nil,
          @message : String? = nil,
          @number_of_topics : Int32? = nil,
          @output_data_config : Types::OutputDataConfig? = nil,
          @submit_time : Time? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      # Toxic content analysis result for one string. For more information about toxicity detection, see
      # Toxicity detection in the Amazon Comprehend Developer Guide
      struct ToxicContent
        include JSON::Serializable

        # The name of the toxic content type.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Model confidence in the detected content type. Value range is zero to one, where one is highest
        # confidence.
        @[JSON::Field(key: "Score")]
        getter score : Float64?

        def initialize(
          @name : String? = nil,
          @score : Float64? = nil
        )
        end
      end

      # Toxicity analysis result for one string. For more information about toxicity detection, see Toxicity
      # detection in the Amazon Comprehend Developer Guide .
      struct ToxicLabels
        include JSON::Serializable

        # Array of toxic content types identified in the string.
        @[JSON::Field(key: "Labels")]
        getter labels : Array(Types::ToxicContent)?

        # Overall toxicity score for the string. Value range is zero to one, where one is the highest
        # confidence.
        @[JSON::Field(key: "Toxicity")]
        getter toxicity : Float64?

        def initialize(
          @labels : Array(Types::ToxicContent)? = nil,
          @toxicity : Float64? = nil
        )
        end
      end

      # Amazon Comprehend can't process the language of the input text. For a list of supported languages,
      # Supported languages in the Comprehend Developer Guide.
      struct UnsupportedLanguageException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the given Amazon Comprehend resource from which you want to remove
        # the tags.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The initial part of a key-value pair that forms a tag being removed from a given resource. For
        # example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales
        # department. Keys must be unique and cannot be duplicated for a particular resource.
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

      # Data security configuration.
      struct UpdateDataSecurityConfig
        include JSON::Serializable

        # ID for the KMS key that Amazon Comprehend uses to encrypt trained custom models. The ModelKmsKeyId
        # can be either of the following formats: KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab" Amazon
        # Resource Name (ARN) of a KMS Key:
        # "arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
        @[JSON::Field(key: "ModelKmsKeyId")]
        getter model_kms_key_id : String?

        # ID for the KMS key that Amazon Comprehend uses to encrypt the volume.
        @[JSON::Field(key: "VolumeKmsKeyId")]
        getter volume_kms_key_id : String?

        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfig?

        def initialize(
          @model_kms_key_id : String? = nil,
          @volume_kms_key_id : String? = nil,
          @vpc_config : Types::VpcConfig? = nil
        )
        end
      end

      struct UpdateEndpointRequest
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the endpoint being updated.
        @[JSON::Field(key: "EndpointArn")]
        getter endpoint_arn : String

        # Data access role ARN to use in case the new model is encrypted with a customer CMK.
        @[JSON::Field(key: "DesiredDataAccessRoleArn")]
        getter desired_data_access_role_arn : String?

        # The desired number of inference units to be used by the model using this endpoint. Each inference
        # unit represents of a throughput of 100 characters per second.
        @[JSON::Field(key: "DesiredInferenceUnits")]
        getter desired_inference_units : Int32?

        # The ARN of the new model to use when updating an existing endpoint.
        @[JSON::Field(key: "DesiredModelArn")]
        getter desired_model_arn : String?

        # The Amazon Resource Number (ARN) of the flywheel
        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String?

        def initialize(
          @endpoint_arn : String,
          @desired_data_access_role_arn : String? = nil,
          @desired_inference_units : Int32? = nil,
          @desired_model_arn : String? = nil,
          @flywheel_arn : String? = nil
        )
        end
      end

      struct UpdateEndpointResponse
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the new model.
        @[JSON::Field(key: "DesiredModelArn")]
        getter desired_model_arn : String?

        def initialize(
          @desired_model_arn : String? = nil
        )
        end
      end

      struct UpdateFlywheelRequest
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the flywheel to update.
        @[JSON::Field(key: "FlywheelArn")]
        getter flywheel_arn : String

        # The Amazon Resource Number (ARN) of the active model version.
        @[JSON::Field(key: "ActiveModelArn")]
        getter active_model_arn : String?

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon Comprehend permission to access
        # the flywheel data.
        @[JSON::Field(key: "DataAccessRoleArn")]
        getter data_access_role_arn : String?

        # Flywheel data security configuration.
        @[JSON::Field(key: "DataSecurityConfig")]
        getter data_security_config : Types::UpdateDataSecurityConfig?

        def initialize(
          @flywheel_arn : String,
          @active_model_arn : String? = nil,
          @data_access_role_arn : String? = nil,
          @data_security_config : Types::UpdateDataSecurityConfig? = nil
        )
        end
      end

      struct UpdateFlywheelResponse
        include JSON::Serializable

        # The flywheel properties.
        @[JSON::Field(key: "FlywheelProperties")]
        getter flywheel_properties : Types::FlywheelProperties?

        def initialize(
          @flywheel_properties : Types::FlywheelProperties? = nil
        )
        end
      end

      # Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the
      # resources you are using for the job. For more information, see Amazon VPC .
      struct VpcConfig
        include JSON::Serializable

        # The ID number for a security group on an instance of your private VPC. Security groups on your VPC
        # function serve as a virtual firewall to control inbound and outbound traffic and provides security
        # for the resources that you’ll be accessing on the VPC. This ID number is preceded by "sg-", for
        # instance: "sg-03b388029b0a285ea". For more information, see Security Groups for your VPC .
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)

        # The ID for each subnet being used in your private VPC. This subnet is a subset of the a range of
        # IPv4 addresses used by the VPC and is specific to a given availability zone in the VPC’s Region.
        # This ID number is preceded by "subnet-", for instance: "subnet-04ccf456919e69055". For more
        # information, see VPCs and Subnets .
        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(String)

        def initialize(
          @security_group_ids : Array(String),
          @subnets : Array(String)
        )
        end
      end

      # The system identified one of the following warnings while processing the input document: The
      # document to classify is plain text, but the classifier is a native document model. The document to
      # classify is semi-structured, but the classifier is a plain-text model.
      struct WarningsListItem
        include JSON::Serializable

        # Page number in the input document.
        @[JSON::Field(key: "Page")]
        getter page : Int32?

        # The type of warning.
        @[JSON::Field(key: "WarnCode")]
        getter warn_code : String?

        # Text message associated with the warning.
        @[JSON::Field(key: "WarnMessage")]
        getter warn_message : String?

        def initialize(
          @page : Int32? = nil,
          @warn_code : String? = nil,
          @warn_message : String? = nil
        )
        end
      end
    end
  end
end
