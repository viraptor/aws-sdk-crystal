require "json"
require "time"

module AwsSdk
  module Textract
    module Types

      # You aren't authorized to perform the action. Use the Amazon Resource Name (ARN) of an authorized
      # user or IAM role to perform the operation.
      struct AccessDeniedException
        include JSON::Serializable

        def initialize
        end
      end

      # An adapter selected for use when analyzing documents. Contains an adapter ID and a version number.
      # Contains information on pages selected for analysis when analyzing documents asychronously.
      struct Adapter
        include JSON::Serializable

        # A unique identifier for the adapter resource.
        @[JSON::Field(key: "AdapterId")]
        getter adapter_id : String

        # A string that identifies the version of the adapter.
        @[JSON::Field(key: "Version")]
        getter version : String

        # Pages is a parameter that the user inputs to specify which pages to apply an adapter to. The
        # following is a list of rules for using this parameter. If a page is not specified, it is set to
        # ["1"] by default. The following characters are allowed in the parameter's string: 0 1 2 3 4 5 6 7 8
        # 9 - * . No whitespace is allowed. When using * to indicate all pages, it must be the only element in
        # the list. You can use page intervals, such as ["1-3", "1-1", "4-*"] . Where * indicates last page of
        # document. Specified pages must be greater than 0 and less than or equal to the number of pages in
        # the document.
        @[JSON::Field(key: "Pages")]
        getter pages : Array(String)?

        def initialize(
          @adapter_id : String,
          @version : String,
          @pages : Array(String)? = nil
        )
        end
      end

      # Contains information on the adapter, including the adapter ID, Name, Creation time, and feature
      # types.
      struct AdapterOverview
        include JSON::Serializable

        # A unique identifier for the adapter resource.
        @[JSON::Field(key: "AdapterId")]
        getter adapter_id : String?

        # A string naming the adapter resource.
        @[JSON::Field(key: "AdapterName")]
        getter adapter_name : String?

        # The date and time that the adapter was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The feature types that the adapter is operating on.
        @[JSON::Field(key: "FeatureTypes")]
        getter feature_types : Array(String)?

        def initialize(
          @adapter_id : String? = nil,
          @adapter_name : String? = nil,
          @creation_time : Time? = nil,
          @feature_types : Array(String)? = nil
        )
        end
      end

      # The dataset configuration options for a given version of an adapter. Can include an Amazon S3 bucket
      # if specified.
      struct AdapterVersionDatasetConfig
        include JSON::Serializable

        @[JSON::Field(key: "ManifestS3Object")]
        getter manifest_s3_object : Types::S3Object?

        def initialize(
          @manifest_s3_object : Types::S3Object? = nil
        )
        end
      end

      # Contains information on the metrics used to evalute the peformance of a given adapter version.
      # Includes data for baseline model performance and individual adapter version perfromance.
      struct AdapterVersionEvaluationMetric
        include JSON::Serializable

        # The F1 score, precision, and recall metrics for the baseline model.
        @[JSON::Field(key: "AdapterVersion")]
        getter adapter_version : Types::EvaluationMetric?

        # The F1 score, precision, and recall metrics for the baseline model.
        @[JSON::Field(key: "Baseline")]
        getter baseline : Types::EvaluationMetric?

        # Indicates the feature type being analyzed by a given adapter version.
        @[JSON::Field(key: "FeatureType")]
        getter feature_type : String?

        def initialize(
          @adapter_version : Types::EvaluationMetric? = nil,
          @baseline : Types::EvaluationMetric? = nil,
          @feature_type : String? = nil
        )
        end
      end

      # Summary info for an adapter version. Contains information on the AdapterId, AdapterVersion,
      # CreationTime, FeatureTypes, and Status.
      struct AdapterVersionOverview
        include JSON::Serializable

        # A unique identifier for the adapter associated with a given adapter version.
        @[JSON::Field(key: "AdapterId")]
        getter adapter_id : String?

        # An identified for a given adapter version.
        @[JSON::Field(key: "AdapterVersion")]
        getter adapter_version : String?

        # The date and time that a given adapter version was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The feature types that the adapter version is operating on.
        @[JSON::Field(key: "FeatureTypes")]
        getter feature_types : Array(String)?

        # Contains information on the status of a given adapter version.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # A message explaining the status of a given adapter vesion.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @adapter_id : String? = nil,
          @adapter_version : String? = nil,
          @creation_time : Time? = nil,
          @feature_types : Array(String)? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Contains information about adapters used when analyzing a document, with each adapter specified
      # using an AdapterId and version
      struct AdaptersConfig
        include JSON::Serializable

        # A list of adapters to be used when analyzing the specified document.
        @[JSON::Field(key: "Adapters")]
        getter adapters : Array(Types::Adapter)

        def initialize(
          @adapters : Array(Types::Adapter)
        )
        end
      end

      struct AnalyzeDocumentRequest
        include JSON::Serializable

        # The input document as base64-encoded bytes or an Amazon S3 object. If you use the AWS CLI to call
        # Amazon Textract operations, you can't pass image bytes. The document must be an image in JPEG, PNG,
        # PDF, or TIFF format. If you're using an AWS SDK to call Amazon Textract, you might not need to
        # base64-encode image bytes that are passed using the Bytes field.
        @[JSON::Field(key: "Document")]
        getter document : Types::Document

        # A list of the types of analysis to perform. Add TABLES to the list to return information about the
        # tables that are detected in the input document. Add FORMS to return detected form data. Add
        # SIGNATURES to return the locations of detected signatures. Add LAYOUT to the list to return
        # information about the layout of the document. All lines and words detected in the document are
        # included in the response (including text that isn't related to the value of FeatureTypes ).
        @[JSON::Field(key: "FeatureTypes")]
        getter feature_types : Array(String)

        # Specifies the adapter to be used when analyzing a document.
        @[JSON::Field(key: "AdaptersConfig")]
        getter adapters_config : Types::AdaptersConfig?

        # Sets the configuration for the human in the loop workflow for analyzing documents.
        @[JSON::Field(key: "HumanLoopConfig")]
        getter human_loop_config : Types::HumanLoopConfig?

        # Contains Queries and the alias for those Queries, as determined by the input.
        @[JSON::Field(key: "QueriesConfig")]
        getter queries_config : Types::QueriesConfig?

        def initialize(
          @document : Types::Document,
          @feature_types : Array(String),
          @adapters_config : Types::AdaptersConfig? = nil,
          @human_loop_config : Types::HumanLoopConfig? = nil,
          @queries_config : Types::QueriesConfig? = nil
        )
        end
      end

      struct AnalyzeDocumentResponse
        include JSON::Serializable

        # The version of the model used to analyze the document.
        @[JSON::Field(key: "AnalyzeDocumentModelVersion")]
        getter analyze_document_model_version : String?

        # The items that are detected and analyzed by AnalyzeDocument .
        @[JSON::Field(key: "Blocks")]
        getter blocks : Array(Types::Block)?

        # Metadata about the analyzed document. An example is the number of pages.
        @[JSON::Field(key: "DocumentMetadata")]
        getter document_metadata : Types::DocumentMetadata?

        # Shows the results of the human in the loop evaluation.
        @[JSON::Field(key: "HumanLoopActivationOutput")]
        getter human_loop_activation_output : Types::HumanLoopActivationOutput?

        def initialize(
          @analyze_document_model_version : String? = nil,
          @blocks : Array(Types::Block)? = nil,
          @document_metadata : Types::DocumentMetadata? = nil,
          @human_loop_activation_output : Types::HumanLoopActivationOutput? = nil
        )
        end
      end

      struct AnalyzeExpenseRequest
        include JSON::Serializable

        @[JSON::Field(key: "Document")]
        getter document : Types::Document

        def initialize(
          @document : Types::Document
        )
        end
      end

      struct AnalyzeExpenseResponse
        include JSON::Serializable

        @[JSON::Field(key: "DocumentMetadata")]
        getter document_metadata : Types::DocumentMetadata?

        # The expenses detected by Amazon Textract.
        @[JSON::Field(key: "ExpenseDocuments")]
        getter expense_documents : Array(Types::ExpenseDocument)?

        def initialize(
          @document_metadata : Types::DocumentMetadata? = nil,
          @expense_documents : Array(Types::ExpenseDocument)? = nil
        )
        end
      end

      # Used to contain the information detected by an AnalyzeID operation.
      struct AnalyzeIDDetections
        include JSON::Serializable

        # Text of either the normalized field or value associated with it.
        @[JSON::Field(key: "Text")]
        getter text : String

        # The confidence score of the detected text.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # Only returned for dates, returns the type of value detected and the date written in a more machine
        # readable way.
        @[JSON::Field(key: "NormalizedValue")]
        getter normalized_value : Types::NormalizedValue?

        def initialize(
          @text : String,
          @confidence : Float64? = nil,
          @normalized_value : Types::NormalizedValue? = nil
        )
        end
      end

      struct AnalyzeIDRequest
        include JSON::Serializable

        # The document being passed to AnalyzeID.
        @[JSON::Field(key: "DocumentPages")]
        getter document_pages : Array(Types::Document)

        def initialize(
          @document_pages : Array(Types::Document)
        )
        end
      end

      struct AnalyzeIDResponse
        include JSON::Serializable

        # The version of the AnalyzeIdentity API being used to process documents.
        @[JSON::Field(key: "AnalyzeIDModelVersion")]
        getter analyze_id_model_version : String?

        @[JSON::Field(key: "DocumentMetadata")]
        getter document_metadata : Types::DocumentMetadata?

        # The list of documents processed by AnalyzeID. Includes a number denoting their place in the list and
        # the response structure for the document.
        @[JSON::Field(key: "IdentityDocuments")]
        getter identity_documents : Array(Types::IdentityDocument)?

        def initialize(
          @analyze_id_model_version : String? = nil,
          @document_metadata : Types::DocumentMetadata? = nil,
          @identity_documents : Array(Types::IdentityDocument)? = nil
        )
        end
      end

      # Amazon Textract isn't able to read the document. For more information on the document limits in
      # Amazon Textract, see limits .
      struct BadDocumentException
        include JSON::Serializable

        def initialize
        end
      end

      # A Block represents items that are recognized in a document within a group of pixels close to each
      # other. The information returned in a Block object depends on the type of operation. In text
      # detection for documents (for example DetectDocumentText ), you get information about the detected
      # words and lines of text. In text analysis (for example AnalyzeDocument ), you can also get
      # information about the fields, tables, and selection elements that are detected in the document. An
      # array of Block objects is returned by both synchronous and asynchronous operations. In synchronous
      # operations, such as DetectDocumentText , the array of Block objects is the entire set of results. In
      # asynchronous operations, such as GetDocumentAnalysis , the array is returned over one or more
      # responses. For more information, see How Amazon Textract Works .
      struct Block
        include JSON::Serializable

        # The type of text item that's recognized. In operations for text detection, the following types are
        # returned: PAGE - Contains a list of the LINE Block objects that are detected on a document page.
        # WORD - A word detected on a document page. A word is one or more ISO basic Latin script characters
        # that aren't separated by spaces. LINE - A string of space-delimited, contiguous words that are
        # detected on a document page. In text analysis operations, the following types are returned: PAGE -
        # Contains a list of child Block objects that are detected on a document page. KEY_VALUE_SET - Stores
        # the KEY and VALUE Block objects for linked text that's detected on a document page. Use the
        # EntityType field to determine if a KEY_VALUE_SET object is a KEY Block object or a VALUE Block
        # object. WORD - A word that's detected on a document page. A word is one or more ISO basic Latin
        # script characters that aren't separated by spaces. LINE - A string of tab-delimited, contiguous
        # words that are detected on a document page. TABLE - A table that's detected on a document page. A
        # table is grid-based information with two or more rows or columns, with a cell span of one row and
        # one column each. TABLE_TITLE - The title of a table. A title is typically a line of text above or
        # below a table, or embedded as the first row of a table. TABLE_FOOTER - The footer associated with a
        # table. A footer is typically a line or lines of text below a table or embedded as the last row of a
        # table. CELL - A cell within a detected table. The cell is the parent of the block that contains the
        # text in the cell. MERGED_CELL - A cell in a table whose content spans more than one row or column.
        # The Relationships array for this cell contain data from individual cells. SELECTION_ELEMENT - A
        # selection element such as an option button (radio button) or a check box that's detected on a
        # document page. Use the value of SelectionStatus to determine the status of the selection element.
        # SIGNATURE - The location and confidence score of a signature detected on a document page. Can be
        # returned as part of a Key-Value pair or a detected cell. QUERY - A question asked during the call of
        # AnalyzeDocument. Contains an alias and an ID that attaches it to its answer. QUERY_RESULT - A
        # response to a question asked during the call of analyze document. Comes with an alias and ID for
        # ease of locating in a response. Also contains location and confidence score. The following
        # BlockTypes are only returned for Amazon Textract Layout. LAYOUT_TITLE - The main title of the
        # document. LAYOUT_HEADER - Text located in the top margin of the document. LAYOUT_FOOTER - Text
        # located in the bottom margin of the document. LAYOUT_SECTION_HEADER - The titles of sections within
        # a document. LAYOUT_PAGE_NUMBER - The page number of the documents. LAYOUT_LIST - Any information
        # grouped together in list form. LAYOUT_FIGURE - Indicates the location of an image in a document.
        # LAYOUT_TABLE - Indicates the location of a table in the document. LAYOUT_KEY_VALUE - Indicates the
        # location of form key-values in a document. LAYOUT_TEXT - Text that is present typically as a part of
        # paragraphs in documents.
        @[JSON::Field(key: "BlockType")]
        getter block_type : String?

        # The column in which a table cell appears. The first column position is 1. ColumnIndex isn't returned
        # by DetectDocumentText and GetDocumentTextDetection .
        @[JSON::Field(key: "ColumnIndex")]
        getter column_index : Int32?

        # The number of columns that a table cell spans. ColumnSpan isn't returned by DetectDocumentText and
        # GetDocumentTextDetection .
        @[JSON::Field(key: "ColumnSpan")]
        getter column_span : Int32?

        # The confidence score that Amazon Textract has in the accuracy of the recognized text and the
        # accuracy of the geometry points around the recognized text.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The type of entity. The following entity types can be returned by FORMS analysis: KEY - An
        # identifier for a field on the document. VALUE - The field text. The following entity types can be
        # returned by TABLES analysis: COLUMN_HEADER - Identifies a cell that is a header of a column.
        # TABLE_TITLE - Identifies a cell that is a title within the table. TABLE_SECTION_TITLE - Identifies a
        # cell that is a title of a section within a table. A section title is a cell that typically spans an
        # entire row above a section. TABLE_FOOTER - Identifies a cell that is a footer of a table.
        # TABLE_SUMMARY - Identifies a summary cell of a table. A summary cell can be a row of a table or an
        # additional, smaller table that contains summary information for another table. STRUCTURED_TABLE -
        # Identifies a table with column headers where the content of each row corresponds to the headers.
        # SEMI_STRUCTURED_TABLE - Identifies a non-structured table. EntityTypes isn't returned by
        # DetectDocumentText and GetDocumentTextDetection .
        @[JSON::Field(key: "EntityTypes")]
        getter entity_types : Array(String)?

        # The location of the recognized text on the image. It includes an axis-aligned, coarse bounding box
        # that surrounds the text, and a finer-grain polygon for more accurate spatial information.
        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::Geometry?

        # The identifier for the recognized text. The identifier is only unique for a single operation.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The page on which a block was detected. Page is returned by synchronous and asynchronous operations.
        # Page values greater than 1 are only returned for multipage documents that are in PDF or TIFF format.
        # A scanned image (JPEG/PNG) provided to an asynchronous operation, even if it contains multiple
        # document pages, is considered a single-page document. This means that for scanned images the value
        # of Page is always 1.
        @[JSON::Field(key: "Page")]
        getter page : Int32?

        @[JSON::Field(key: "Query")]
        getter query : Types::Query?

        # A list of relationship objects that describe how blocks are related to each other. For example, a
        # LINE block object contains a CHILD relationship type with the WORD blocks that make up the line of
        # text. There aren't Relationship objects in the list for relationships that don't exist, such as when
        # the current block has no child blocks.
        @[JSON::Field(key: "Relationships")]
        getter relationships : Array(Types::Relationship)?

        # The row in which a table cell is located. The first row position is 1. RowIndex isn't returned by
        # DetectDocumentText and GetDocumentTextDetection .
        @[JSON::Field(key: "RowIndex")]
        getter row_index : Int32?

        # The number of rows that a table cell spans. RowSpan isn't returned by DetectDocumentText and
        # GetDocumentTextDetection .
        @[JSON::Field(key: "RowSpan")]
        getter row_span : Int32?

        # The selection status of a selection element, such as an option button or check box.
        @[JSON::Field(key: "SelectionStatus")]
        getter selection_status : String?

        # The word or line of text that's recognized by Amazon Textract.
        @[JSON::Field(key: "Text")]
        getter text : String?

        # The kind of text that Amazon Textract has detected. Can check for handwritten text and printed text.
        @[JSON::Field(key: "TextType")]
        getter text_type : String?

        def initialize(
          @block_type : String? = nil,
          @column_index : Int32? = nil,
          @column_span : Int32? = nil,
          @confidence : Float64? = nil,
          @entity_types : Array(String)? = nil,
          @geometry : Types::Geometry? = nil,
          @id : String? = nil,
          @page : Int32? = nil,
          @query : Types::Query? = nil,
          @relationships : Array(Types::Relationship)? = nil,
          @row_index : Int32? = nil,
          @row_span : Int32? = nil,
          @selection_status : String? = nil,
          @text : String? = nil,
          @text_type : String? = nil
        )
        end
      end

      # The bounding box around the detected page, text, key-value pair, table, table cell, or selection
      # element on a document page. The left (x-coordinate) and top (y-coordinate) are coordinates that
      # represent the top and left sides of the bounding box. Note that the upper-left corner of the image
      # is the origin (0,0). The top and left values returned are ratios of the overall document page size.
      # For example, if the input image is 700 x 200 pixels, and the top-left coordinate of the bounding box
      # is 350 x 50 pixels, the API returns a left value of 0.5 (350/700) and a top value of 0.25 (50/200).
      # The width and height values represent the dimensions of the bounding box as a ratio of the overall
      # document page dimension. For example, if the document page size is 700 x 200 pixels, and the
      # bounding box width is 70 pixels, the width returned is 0.1.
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

      # Updating or deleting a resource can cause an inconsistent state.
      struct ConflictException
        include JSON::Serializable

        def initialize
        end
      end

      struct CreateAdapterRequest
        include JSON::Serializable

        # The name to be assigned to the adapter being created.
        @[JSON::Field(key: "AdapterName")]
        getter adapter_name : String

        # The type of feature that the adapter is being trained on. Currrenly, supported feature types are:
        # QUERIES
        @[JSON::Field(key: "FeatureTypes")]
        getter feature_types : Array(String)

        # Controls whether or not the adapter should automatically update.
        @[JSON::Field(key: "AutoUpdate")]
        getter auto_update : String?

        # Idempotent token is used to recognize the request. If the same token is used with multiple
        # CreateAdapter requests, the same session is returned. This token is employed to avoid
        # unintentionally creating the same session multiple times.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The description to be assigned to the adapter being created.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of tags to be added to the adapter.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @adapter_name : String,
          @feature_types : Array(String),
          @auto_update : String? = nil,
          @client_request_token : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateAdapterResponse
        include JSON::Serializable

        # A string containing the unique ID for the adapter that has been created.
        @[JSON::Field(key: "AdapterId")]
        getter adapter_id : String?

        def initialize(
          @adapter_id : String? = nil
        )
        end
      end

      struct CreateAdapterVersionRequest
        include JSON::Serializable

        # A string containing a unique ID for the adapter that will receive a new version.
        @[JSON::Field(key: "AdapterId")]
        getter adapter_id : String

        # Specifies a dataset used to train a new adapter version. Takes a ManifestS3Object as the value.
        @[JSON::Field(key: "DatasetConfig")]
        getter dataset_config : Types::AdapterVersionDatasetConfig

        @[JSON::Field(key: "OutputConfig")]
        getter output_config : Types::OutputConfig

        # Idempotent token is used to recognize the request. If the same token is used with multiple
        # CreateAdapterVersion requests, the same session is returned. This token is employed to avoid
        # unintentionally creating the same session multiple times.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # The identifier for your AWS Key Management Service key (AWS KMS key). Used to encrypt your
        # documents.
        @[JSON::Field(key: "KMSKeyId")]
        getter kms_key_id : String?

        # A set of tags (key-value pairs) that you want to attach to the adapter version.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @adapter_id : String,
          @dataset_config : Types::AdapterVersionDatasetConfig,
          @output_config : Types::OutputConfig,
          @client_request_token : String? = nil,
          @kms_key_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateAdapterVersionResponse
        include JSON::Serializable

        # A string containing the unique ID for the adapter that has received a new version.
        @[JSON::Field(key: "AdapterId")]
        getter adapter_id : String?

        # A string describing the new version of the adapter.
        @[JSON::Field(key: "AdapterVersion")]
        getter adapter_version : String?

        def initialize(
          @adapter_id : String? = nil,
          @adapter_version : String? = nil
        )
        end
      end

      struct DeleteAdapterRequest
        include JSON::Serializable

        # A string containing a unique ID for the adapter to be deleted.
        @[JSON::Field(key: "AdapterId")]
        getter adapter_id : String

        def initialize(
          @adapter_id : String
        )
        end
      end

      struct DeleteAdapterResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteAdapterVersionRequest
        include JSON::Serializable

        # A string containing a unique ID for the adapter version that will be deleted.
        @[JSON::Field(key: "AdapterId")]
        getter adapter_id : String

        # Specifies the adapter version to be deleted.
        @[JSON::Field(key: "AdapterVersion")]
        getter adapter_version : String

        def initialize(
          @adapter_id : String,
          @adapter_version : String
        )
        end
      end

      struct DeleteAdapterVersionResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DetectDocumentTextRequest
        include JSON::Serializable

        # The input document as base64-encoded bytes or an Amazon S3 object. If you use the AWS CLI to call
        # Amazon Textract operations, you can't pass image bytes. The document must be an image in JPEG or PNG
        # format. If you're using an AWS SDK to call Amazon Textract, you might not need to base64-encode
        # image bytes that are passed using the Bytes field.
        @[JSON::Field(key: "Document")]
        getter document : Types::Document

        def initialize(
          @document : Types::Document
        )
        end
      end

      struct DetectDocumentTextResponse
        include JSON::Serializable

        # An array of Block objects that contain the text that's detected in the document.
        @[JSON::Field(key: "Blocks")]
        getter blocks : Array(Types::Block)?

        @[JSON::Field(key: "DetectDocumentTextModelVersion")]
        getter detect_document_text_model_version : String?

        # Metadata about the document. It contains the number of pages that are detected in the document.
        @[JSON::Field(key: "DocumentMetadata")]
        getter document_metadata : Types::DocumentMetadata?

        def initialize(
          @blocks : Array(Types::Block)? = nil,
          @detect_document_text_model_version : String? = nil,
          @document_metadata : Types::DocumentMetadata? = nil
        )
        end
      end

      # A structure that holds information regarding a detected signature on a page.
      struct DetectedSignature
        include JSON::Serializable

        # The page a detected signature was found on.
        @[JSON::Field(key: "Page")]
        getter page : Int32?

        def initialize(
          @page : Int32? = nil
        )
        end
      end

      # The input document, either as bytes or as an S3 object. You pass image bytes to an Amazon Textract
      # API operation by using the Bytes property. For example, you would use the Bytes property to pass a
      # document loaded from a local file system. Image bytes passed by using the Bytes property must be
      # base64 encoded. Your code might not need to encode document file bytes if you're using an AWS SDK to
      # call Amazon Textract API operations. You pass images stored in an S3 bucket to an Amazon Textract
      # API operation by using the S3Object property. Documents stored in an S3 bucket don't need to be
      # base64 encoded. The AWS Region for the S3 bucket that contains the S3 object must match the AWS
      # Region that you use for Amazon Textract operations. If you use the AWS CLI to call Amazon Textract
      # operations, passing image bytes using the Bytes property isn't supported. You must first upload the
      # document to an Amazon S3 bucket, and then call the operation using the S3Object property. For Amazon
      # Textract to process an S3 object, the user must have permission to access the S3 object.
      struct Document
        include JSON::Serializable

        # A blob of base64-encoded document bytes. The maximum size of a document that's provided in a blob of
        # bytes is 5 MB. The document bytes must be in PNG or JPEG format. If you're using an AWS SDK to call
        # Amazon Textract, you might not need to base64-encode image bytes passed using the Bytes field.
        @[JSON::Field(key: "Bytes")]
        getter bytes : Bytes?

        # Identifies an S3 object as the document source. The maximum size of a document that's stored in an
        # S3 bucket is 5 MB.
        @[JSON::Field(key: "S3Object")]
        getter s3_object : Types::S3Object?

        def initialize(
          @bytes : Bytes? = nil,
          @s3_object : Types::S3Object? = nil
        )
        end
      end

      # Summary information about documents grouped by the same document type.
      struct DocumentGroup
        include JSON::Serializable

        # A list of the detected signatures found in a document group.
        @[JSON::Field(key: "DetectedSignatures")]
        getter detected_signatures : Array(Types::DetectedSignature)?

        # An array that contains information about the pages of a document, defined by logical boundary.
        @[JSON::Field(key: "SplitDocuments")]
        getter split_documents : Array(Types::SplitDocument)?

        # The type of document that Amazon Textract has detected. See Analyze Lending Response Objects for a
        # list of all types returned by Textract.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # A list of any expected signatures not found in a document group.
        @[JSON::Field(key: "UndetectedSignatures")]
        getter undetected_signatures : Array(Types::UndetectedSignature)?

        def initialize(
          @detected_signatures : Array(Types::DetectedSignature)? = nil,
          @split_documents : Array(Types::SplitDocument)? = nil,
          @type : String? = nil,
          @undetected_signatures : Array(Types::UndetectedSignature)? = nil
        )
        end
      end

      # The Amazon S3 bucket that contains the document to be processed. It's used by asynchronous
      # operations. The input document can be an image file in JPEG or PNG format. It can also be a file in
      # PDF format.
      struct DocumentLocation
        include JSON::Serializable

        # The Amazon S3 bucket that contains the input document.
        @[JSON::Field(key: "S3Object")]
        getter s3_object : Types::S3Object?

        def initialize(
          @s3_object : Types::S3Object? = nil
        )
        end
      end

      # Information about the input document.
      struct DocumentMetadata
        include JSON::Serializable

        # The number of pages that are detected in the document.
        @[JSON::Field(key: "Pages")]
        getter pages : Int32?

        def initialize(
          @pages : Int32? = nil
        )
        end
      end

      # The document can't be processed because it's too large. The maximum document size for synchronous
      # operations 10 MB. The maximum document size for asynchronous operations is 500 MB for PDF files.
      struct DocumentTooLargeException
        include JSON::Serializable

        def initialize
        end
      end

      # The evaluation metrics (F1 score, Precision, and Recall) for an adapter version.
      struct EvaluationMetric
        include JSON::Serializable

        # The F1 score for an adapter version.
        @[JSON::Field(key: "F1Score")]
        getter f1_score : Float64?

        # The Precision score for an adapter version.
        @[JSON::Field(key: "Precision")]
        getter precision : Float64?

        # The Recall score for an adapter version.
        @[JSON::Field(key: "Recall")]
        getter recall : Float64?

        def initialize(
          @f1_score : Float64? = nil,
          @precision : Float64? = nil,
          @recall : Float64? = nil
        )
        end
      end

      # Returns the kind of currency detected.
      struct ExpenseCurrency
        include JSON::Serializable

        # Currency code for detected currency. the current supported codes are: USD EUR GBP CAD INR JPY CHF
        # AUD CNY BZR SEK HKD
        @[JSON::Field(key: "Code")]
        getter code : String?

        # Percentage confideence in the detected currency.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        def initialize(
          @code : String? = nil,
          @confidence : Float64? = nil
        )
        end
      end

      # An object used to store information about the Value or Label detected by Amazon Textract.
      struct ExpenseDetection
        include JSON::Serializable

        # The confidence in detection, as a percentage
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::Geometry?

        # The word or line of text recognized by Amazon Textract
        @[JSON::Field(key: "Text")]
        getter text : String?

        def initialize(
          @confidence : Float64? = nil,
          @geometry : Types::Geometry? = nil,
          @text : String? = nil
        )
        end
      end

      # The structure holding all the information returned by AnalyzeExpense
      struct ExpenseDocument
        include JSON::Serializable

        # This is a block object, the same as reported when DetectDocumentText is run on a document. It
        # provides word level recognition of text.
        @[JSON::Field(key: "Blocks")]
        getter blocks : Array(Types::Block)?

        # Denotes which invoice or receipt in the document the information is coming from. First document will
        # be 1, the second 2, and so on.
        @[JSON::Field(key: "ExpenseIndex")]
        getter expense_index : Int32?

        # Information detected on each table of a document, seperated into LineItems .
        @[JSON::Field(key: "LineItemGroups")]
        getter line_item_groups : Array(Types::LineItemGroup)?

        # Any information found outside of a table by Amazon Textract.
        @[JSON::Field(key: "SummaryFields")]
        getter summary_fields : Array(Types::ExpenseField)?

        def initialize(
          @blocks : Array(Types::Block)? = nil,
          @expense_index : Int32? = nil,
          @line_item_groups : Array(Types::LineItemGroup)? = nil,
          @summary_fields : Array(Types::ExpenseField)? = nil
        )
        end
      end

      # Breakdown of detected information, seperated into the catagories Type, LabelDetection, and
      # ValueDetection
      struct ExpenseField
        include JSON::Serializable

        # Shows the kind of currency, both the code and confidence associated with any monatary value
        # detected.
        @[JSON::Field(key: "Currency")]
        getter currency : Types::ExpenseCurrency?

        # Shows which group a response object belongs to, such as whether an address line belongs to the
        # vendor's address or the recipent's address.
        @[JSON::Field(key: "GroupProperties")]
        getter group_properties : Array(Types::ExpenseGroupProperty)?

        # The explicitly stated label of a detected element.
        @[JSON::Field(key: "LabelDetection")]
        getter label_detection : Types::ExpenseDetection?

        # The page number the value was detected on.
        @[JSON::Field(key: "PageNumber")]
        getter page_number : Int32?

        # The implied label of a detected element. Present alongside LabelDetection for explicit elements.
        @[JSON::Field(key: "Type")]
        getter type : Types::ExpenseType?

        # The value of a detected element. Present in explicit and implicit elements.
        @[JSON::Field(key: "ValueDetection")]
        getter value_detection : Types::ExpenseDetection?

        def initialize(
          @currency : Types::ExpenseCurrency? = nil,
          @group_properties : Array(Types::ExpenseGroupProperty)? = nil,
          @label_detection : Types::ExpenseDetection? = nil,
          @page_number : Int32? = nil,
          @type : Types::ExpenseType? = nil,
          @value_detection : Types::ExpenseDetection? = nil
        )
        end
      end

      # Shows the group that a certain key belongs to. This helps differentiate between names and addresses
      # for different organizations, that can be hard to determine via JSON response.
      struct ExpenseGroupProperty
        include JSON::Serializable

        # Provides a group Id number, which will be the same for each in the group.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # Informs you on whether the expense group is a name or an address.
        @[JSON::Field(key: "Types")]
        getter types : Array(String)?

        def initialize(
          @id : String? = nil,
          @types : Array(String)? = nil
        )
        end
      end

      # An object used to store information about the Type detected by Amazon Textract.
      struct ExpenseType
        include JSON::Serializable

        # The confidence of accuracy, as a percentage.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The word or line of text detected by Amazon Textract.
        @[JSON::Field(key: "Text")]
        getter text : String?

        def initialize(
          @confidence : Float64? = nil,
          @text : String? = nil
        )
        end
      end

      # Contains information extracted by an analysis operation after using StartLendingAnalysis.
      struct Extraction
        include JSON::Serializable

        @[JSON::Field(key: "ExpenseDocument")]
        getter expense_document : Types::ExpenseDocument?

        @[JSON::Field(key: "IdentityDocument")]
        getter identity_document : Types::IdentityDocument?

        # Holds the structured data returned by AnalyzeDocument for lending documents.
        @[JSON::Field(key: "LendingDocument")]
        getter lending_document : Types::LendingDocument?

        def initialize(
          @expense_document : Types::ExpenseDocument? = nil,
          @identity_document : Types::IdentityDocument? = nil,
          @lending_document : Types::LendingDocument? = nil
        )
        end
      end

      # Information about where the following items are located on a document page: detected page, text,
      # key-value pairs, tables, table cells, and selection elements.
      struct Geometry
        include JSON::Serializable

        # An axis-aligned coarse representation of the location of the recognized item on the document page.
        @[JSON::Field(key: "BoundingBox")]
        getter bounding_box : Types::BoundingBox?

        # Within the bounding box, a fine-grained polygon around the recognized item.
        @[JSON::Field(key: "Polygon")]
        getter polygon : Array(Types::Point)?

        # Provides a numerical value corresponding to the rotation of the text.
        @[JSON::Field(key: "RotationAngle")]
        getter rotation_angle : Float64?

        def initialize(
          @bounding_box : Types::BoundingBox? = nil,
          @polygon : Array(Types::Point)? = nil,
          @rotation_angle : Float64? = nil
        )
        end
      end

      struct GetAdapterRequest
        include JSON::Serializable

        # A string containing a unique ID for the adapter.
        @[JSON::Field(key: "AdapterId")]
        getter adapter_id : String

        def initialize(
          @adapter_id : String
        )
        end
      end

      struct GetAdapterResponse
        include JSON::Serializable

        # A string identifying the adapter that information has been retrieved for.
        @[JSON::Field(key: "AdapterId")]
        getter adapter_id : String?

        # The name of the requested adapter.
        @[JSON::Field(key: "AdapterName")]
        getter adapter_name : String?

        # Binary value indicating if the adapter is being automatically updated or not.
        @[JSON::Field(key: "AutoUpdate")]
        getter auto_update : String?

        # The date and time the requested adapter was created at.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The description for the requested adapter.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # List of the targeted feature types for the requested adapter.
        @[JSON::Field(key: "FeatureTypes")]
        getter feature_types : Array(String)?

        # A set of tags (key-value pairs) associated with the adapter that has been retrieved.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @adapter_id : String? = nil,
          @adapter_name : String? = nil,
          @auto_update : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @feature_types : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetAdapterVersionRequest
        include JSON::Serializable

        # A string specifying a unique ID for the adapter version you want to retrieve information for.
        @[JSON::Field(key: "AdapterId")]
        getter adapter_id : String

        # A string specifying the adapter version you want to retrieve information for.
        @[JSON::Field(key: "AdapterVersion")]
        getter adapter_version : String

        def initialize(
          @adapter_id : String,
          @adapter_version : String
        )
        end
      end

      struct GetAdapterVersionResponse
        include JSON::Serializable

        # A string containing a unique ID for the adapter version being retrieved.
        @[JSON::Field(key: "AdapterId")]
        getter adapter_id : String?

        # A string containing the adapter version that has been retrieved.
        @[JSON::Field(key: "AdapterVersion")]
        getter adapter_version : String?

        # The time that the adapter version was created.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # Specifies a dataset used to train a new adapter version. Takes a ManifestS3Objec as the value.
        @[JSON::Field(key: "DatasetConfig")]
        getter dataset_config : Types::AdapterVersionDatasetConfig?

        # The evaluation metrics (F1 score, Precision, and Recall) for the requested version, grouped by
        # baseline metrics and adapter version.
        @[JSON::Field(key: "EvaluationMetrics")]
        getter evaluation_metrics : Array(Types::AdapterVersionEvaluationMetric)?

        # List of the targeted feature types for the requested adapter version.
        @[JSON::Field(key: "FeatureTypes")]
        getter feature_types : Array(String)?

        # The identifier for your AWS Key Management Service key (AWS KMS key). Used to encrypt your
        # documents.
        @[JSON::Field(key: "KMSKeyId")]
        getter kms_key_id : String?

        @[JSON::Field(key: "OutputConfig")]
        getter output_config : Types::OutputConfig?

        # The status of the adapter version that has been requested.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # A message that describes the status of the requested adapter version.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # A set of tags (key-value pairs) that are associated with the adapter version.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @adapter_id : String? = nil,
          @adapter_version : String? = nil,
          @creation_time : Time? = nil,
          @dataset_config : Types::AdapterVersionDatasetConfig? = nil,
          @evaluation_metrics : Array(Types::AdapterVersionEvaluationMetric)? = nil,
          @feature_types : Array(String)? = nil,
          @kms_key_id : String? = nil,
          @output_config : Types::OutputConfig? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetDocumentAnalysisRequest
        include JSON::Serializable

        # A unique identifier for the text-detection job. The JobId is returned from StartDocumentAnalysis . A
        # JobId value is only valid for 7 days.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The maximum number of results to return per paginated call. The largest value that you can specify
        # is 1,000. If you specify a value greater than 1,000, a maximum of 1,000 results is returned. The
        # default value is 1,000.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there are more blocks to retrieve), Amazon Textract
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of blocks.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @job_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetDocumentAnalysisResponse
        include JSON::Serializable

        @[JSON::Field(key: "AnalyzeDocumentModelVersion")]
        getter analyze_document_model_version : String?

        # The results of the text-analysis operation.
        @[JSON::Field(key: "Blocks")]
        getter blocks : Array(Types::Block)?

        # Information about a document that Amazon Textract processed. DocumentMetadata is returned in every
        # page of paginated responses from an Amazon Textract video operation.
        @[JSON::Field(key: "DocumentMetadata")]
        getter document_metadata : Types::DocumentMetadata?

        # The current status of the text detection job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # If the response is truncated, Amazon Textract returns this token. You can use this token in the
        # subsequent request to retrieve the next set of text detection results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns if the detection job could not be completed. Contains explanation for what error occured.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # A list of warnings that occurred during the document-analysis operation.
        @[JSON::Field(key: "Warnings")]
        getter warnings : Array(Types::Warning)?

        def initialize(
          @analyze_document_model_version : String? = nil,
          @blocks : Array(Types::Block)? = nil,
          @document_metadata : Types::DocumentMetadata? = nil,
          @job_status : String? = nil,
          @next_token : String? = nil,
          @status_message : String? = nil,
          @warnings : Array(Types::Warning)? = nil
        )
        end
      end

      struct GetDocumentTextDetectionRequest
        include JSON::Serializable

        # A unique identifier for the text detection job. The JobId is returned from
        # StartDocumentTextDetection . A JobId value is only valid for 7 days.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The maximum number of results to return per paginated call. The largest value you can specify is
        # 1,000. If you specify a value greater than 1,000, a maximum of 1,000 results is returned. The
        # default value is 1,000.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there are more blocks to retrieve), Amazon Textract
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of blocks.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @job_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetDocumentTextDetectionResponse
        include JSON::Serializable

        # The results of the text-detection operation.
        @[JSON::Field(key: "Blocks")]
        getter blocks : Array(Types::Block)?

        @[JSON::Field(key: "DetectDocumentTextModelVersion")]
        getter detect_document_text_model_version : String?

        # Information about a document that Amazon Textract processed. DocumentMetadata is returned in every
        # page of paginated responses from an Amazon Textract video operation.
        @[JSON::Field(key: "DocumentMetadata")]
        getter document_metadata : Types::DocumentMetadata?

        # The current status of the text detection job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # If the response is truncated, Amazon Textract returns this token. You can use this token in the
        # subsequent request to retrieve the next set of text-detection results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns if the detection job could not be completed. Contains explanation for what error occured.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # A list of warnings that occurred during the text-detection operation for the document.
        @[JSON::Field(key: "Warnings")]
        getter warnings : Array(Types::Warning)?

        def initialize(
          @blocks : Array(Types::Block)? = nil,
          @detect_document_text_model_version : String? = nil,
          @document_metadata : Types::DocumentMetadata? = nil,
          @job_status : String? = nil,
          @next_token : String? = nil,
          @status_message : String? = nil,
          @warnings : Array(Types::Warning)? = nil
        )
        end
      end

      struct GetExpenseAnalysisRequest
        include JSON::Serializable

        # A unique identifier for the text detection job. The JobId is returned from StartExpenseAnalysis . A
        # JobId value is only valid for 7 days.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The maximum number of results to return per paginated call. The largest value you can specify is 20.
        # If you specify a value greater than 20, a maximum of 20 results is returned. The default value is
        # 20.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there are more blocks to retrieve), Amazon Textract
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of blocks.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @job_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetExpenseAnalysisResponse
        include JSON::Serializable

        # The current model version of AnalyzeExpense.
        @[JSON::Field(key: "AnalyzeExpenseModelVersion")]
        getter analyze_expense_model_version : String?

        # Information about a document that Amazon Textract processed. DocumentMetadata is returned in every
        # page of paginated responses from an Amazon Textract operation.
        @[JSON::Field(key: "DocumentMetadata")]
        getter document_metadata : Types::DocumentMetadata?

        # The expenses detected by Amazon Textract.
        @[JSON::Field(key: "ExpenseDocuments")]
        getter expense_documents : Array(Types::ExpenseDocument)?

        # The current status of the text detection job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # If the response is truncated, Amazon Textract returns this token. You can use this token in the
        # subsequent request to retrieve the next set of text-detection results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Returns if the detection job could not be completed. Contains explanation for what error occured.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # A list of warnings that occurred during the text-detection operation for the document.
        @[JSON::Field(key: "Warnings")]
        getter warnings : Array(Types::Warning)?

        def initialize(
          @analyze_expense_model_version : String? = nil,
          @document_metadata : Types::DocumentMetadata? = nil,
          @expense_documents : Array(Types::ExpenseDocument)? = nil,
          @job_status : String? = nil,
          @next_token : String? = nil,
          @status_message : String? = nil,
          @warnings : Array(Types::Warning)? = nil
        )
        end
      end

      struct GetLendingAnalysisRequest
        include JSON::Serializable

        # A unique identifier for the lending or text-detection job. The JobId is returned from
        # StartLendingAnalysis . A JobId value is only valid for 7 days.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        # The maximum number of results to return per paginated call. The largest value that you can specify
        # is 30. If you specify a value greater than 30, a maximum of 30 results is returned. The default
        # value is 30.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete, Amazon Textract returns a pagination token in the response.
        # You can use this pagination token to retrieve the next set of lending results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @job_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetLendingAnalysisResponse
        include JSON::Serializable

        # The current model version of the Analyze Lending API.
        @[JSON::Field(key: "AnalyzeLendingModelVersion")]
        getter analyze_lending_model_version : String?

        @[JSON::Field(key: "DocumentMetadata")]
        getter document_metadata : Types::DocumentMetadata?

        # The current status of the lending analysis job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # If the response is truncated, Amazon Textract returns this token. You can use this token in the
        # subsequent request to retrieve the next set of lending results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Holds the information returned by one of AmazonTextract's document analysis operations for the
        # pinstripe.
        @[JSON::Field(key: "Results")]
        getter results : Array(Types::LendingResult)?

        # Returns if the lending analysis job could not be completed. Contains explanation for what error
        # occurred.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # A list of warnings that occurred during the lending analysis operation.
        @[JSON::Field(key: "Warnings")]
        getter warnings : Array(Types::Warning)?

        def initialize(
          @analyze_lending_model_version : String? = nil,
          @document_metadata : Types::DocumentMetadata? = nil,
          @job_status : String? = nil,
          @next_token : String? = nil,
          @results : Array(Types::LendingResult)? = nil,
          @status_message : String? = nil,
          @warnings : Array(Types::Warning)? = nil
        )
        end
      end

      struct GetLendingAnalysisSummaryRequest
        include JSON::Serializable

        # A unique identifier for the lending or text-detection job. The JobId is returned from
        # StartLendingAnalysis. A JobId value is only valid for 7 days.
        @[JSON::Field(key: "JobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct GetLendingAnalysisSummaryResponse
        include JSON::Serializable

        # The current model version of the Analyze Lending API.
        @[JSON::Field(key: "AnalyzeLendingModelVersion")]
        getter analyze_lending_model_version : String?

        @[JSON::Field(key: "DocumentMetadata")]
        getter document_metadata : Types::DocumentMetadata?

        # The current status of the lending analysis job.
        @[JSON::Field(key: "JobStatus")]
        getter job_status : String?

        # Returns if the lending analysis could not be completed. Contains explanation for what error
        # occurred.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        # Contains summary information for documents grouped by type.
        @[JSON::Field(key: "Summary")]
        getter summary : Types::LendingSummary?

        # A list of warnings that occurred during the lending analysis operation.
        @[JSON::Field(key: "Warnings")]
        getter warnings : Array(Types::Warning)?

        def initialize(
          @analyze_lending_model_version : String? = nil,
          @document_metadata : Types::DocumentMetadata? = nil,
          @job_status : String? = nil,
          @status_message : String? = nil,
          @summary : Types::LendingSummary? = nil,
          @warnings : Array(Types::Warning)? = nil
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

      # Sets up the human review workflow the document will be sent to if one of the conditions is met. You
      # can also set certain attributes of the image before review.
      struct HumanLoopConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the flow definition.
        @[JSON::Field(key: "FlowDefinitionArn")]
        getter flow_definition_arn : String

        # The name of the human workflow used for this image. This should be kept unique within a region.
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
      # identifiable information and adult content.
      struct HumanLoopDataAttributes
        include JSON::Serializable

        # Sets whether the input image is free of personally identifiable information or adult content.
        @[JSON::Field(key: "ContentClassifiers")]
        getter content_classifiers : Array(String)?

        def initialize(
          @content_classifiers : Array(String)? = nil
        )
        end
      end

      # Indicates you have exceeded the maximum number of active human in the loop workflows available
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

      # The structure that lists each document processed in an AnalyzeID operation.
      struct IdentityDocument
        include JSON::Serializable

        # Individual word recognition, as returned by document detection.
        @[JSON::Field(key: "Blocks")]
        getter blocks : Array(Types::Block)?

        # Denotes the placement of a document in the IdentityDocument list. The first document is marked 1,
        # the second 2 and so on.
        @[JSON::Field(key: "DocumentIndex")]
        getter document_index : Int32?

        # The structure used to record information extracted from identity documents. Contains both normalized
        # field and value of the extracted text.
        @[JSON::Field(key: "IdentityDocumentFields")]
        getter identity_document_fields : Array(Types::IdentityDocumentField)?

        def initialize(
          @blocks : Array(Types::Block)? = nil,
          @document_index : Int32? = nil,
          @identity_document_fields : Array(Types::IdentityDocumentField)? = nil
        )
        end
      end

      # Structure containing both the normalized type of the extracted information and the text associated
      # with it. These are extracted as Type and Value respectively.
      struct IdentityDocumentField
        include JSON::Serializable

        @[JSON::Field(key: "Type")]
        getter type : Types::AnalyzeIDDetections?

        @[JSON::Field(key: "ValueDetection")]
        getter value_detection : Types::AnalyzeIDDetections?

        def initialize(
          @type : Types::AnalyzeIDDetections? = nil,
          @value_detection : Types::AnalyzeIDDetections? = nil
        )
        end
      end

      # Amazon Textract experienced a service issue. Try your call again.
      struct InternalServerError
        include JSON::Serializable

        def initialize
        end
      end

      # An invalid job identifier was passed to an asynchronous analysis operation.
      struct InvalidJobIdException
        include JSON::Serializable

        def initialize
        end
      end

      # Indicates you do not have decrypt permissions with the KMS key entered, or the KMS key was entered
      # incorrectly.
      struct InvalidKMSKeyException
        include JSON::Serializable

        def initialize
        end
      end

      # An input parameter violated a constraint. For example, in synchronous operations, an
      # InvalidParameterException exception occurs when neither of the S3Object or Bytes values are supplied
      # in the Document request parameter. Validate your parameter before calling the API operation again.
      struct InvalidParameterException
        include JSON::Serializable

        def initialize
        end
      end

      # Amazon Textract is unable to access the S3 object that's specified in the request. for more
      # information, Configure Access to Amazon S3 For troubleshooting information, see Troubleshooting
      # Amazon S3
      struct InvalidS3ObjectException
        include JSON::Serializable

        def initialize
        end
      end

      # The results extracted for a lending document.
      struct LendingDetection
        include JSON::Serializable

        # The confidence level for the text of a detected value in a lending document.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::Geometry?

        # The selection status of a selection element, such as an option button or check box.
        @[JSON::Field(key: "SelectionStatus")]
        getter selection_status : String?

        # The text extracted for a detected value in a lending document.
        @[JSON::Field(key: "Text")]
        getter text : String?

        def initialize(
          @confidence : Float64? = nil,
          @geometry : Types::Geometry? = nil,
          @selection_status : String? = nil,
          @text : String? = nil
        )
        end
      end

      # Holds the structured data returned by AnalyzeDocument for lending documents.
      struct LendingDocument
        include JSON::Serializable

        # An array of LendingField objects.
        @[JSON::Field(key: "LendingFields")]
        getter lending_fields : Array(Types::LendingField)?

        # A list of signatures detected in a lending document.
        @[JSON::Field(key: "SignatureDetections")]
        getter signature_detections : Array(Types::SignatureDetection)?

        def initialize(
          @lending_fields : Array(Types::LendingField)? = nil,
          @signature_detections : Array(Types::SignatureDetection)? = nil
        )
        end
      end

      # Holds the normalized key-value pairs returned by AnalyzeDocument, including the document type,
      # detected text, and geometry.
      struct LendingField
        include JSON::Serializable

        @[JSON::Field(key: "KeyDetection")]
        getter key_detection : Types::LendingDetection?

        # The type of the lending document.
        @[JSON::Field(key: "Type")]
        getter type : String?

        # An array of LendingDetection objects.
        @[JSON::Field(key: "ValueDetections")]
        getter value_detections : Array(Types::LendingDetection)?

        def initialize(
          @key_detection : Types::LendingDetection? = nil,
          @type : String? = nil,
          @value_detections : Array(Types::LendingDetection)? = nil
        )
        end
      end

      # Contains the detections for each page analyzed through the Analyze Lending API.
      struct LendingResult
        include JSON::Serializable

        # An array of Extraction to hold structured data. e.g. normalized key value pairs instead of raw OCR
        # detections .
        @[JSON::Field(key: "Extractions")]
        getter extractions : Array(Types::Extraction)?

        # The page number for a page, with regard to whole submission.
        @[JSON::Field(key: "Page")]
        getter page : Int32?

        # The classifier result for a given page.
        @[JSON::Field(key: "PageClassification")]
        getter page_classification : Types::PageClassification?

        def initialize(
          @extractions : Array(Types::Extraction)? = nil,
          @page : Int32? = nil,
          @page_classification : Types::PageClassification? = nil
        )
        end
      end

      # Contains information regarding DocumentGroups and UndetectedDocumentTypes.
      struct LendingSummary
        include JSON::Serializable

        # Contains an array of all DocumentGroup objects.
        @[JSON::Field(key: "DocumentGroups")]
        getter document_groups : Array(Types::DocumentGroup)?

        # UndetectedDocumentTypes.
        @[JSON::Field(key: "UndetectedDocumentTypes")]
        getter undetected_document_types : Array(String)?

        def initialize(
          @document_groups : Array(Types::DocumentGroup)? = nil,
          @undetected_document_types : Array(String)? = nil
        )
        end
      end

      # An Amazon Textract service limit was exceeded. For example, if you start too many asynchronous jobs
      # concurrently, calls to start operations ( StartDocumentTextDetection , for example) raise a
      # LimitExceededException exception (HTTP status code: 400) until the number of concurrently running
      # jobs is below the Amazon Textract service limit.
      struct LimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # A structure that holds information about the different lines found in a document's tables.
      struct LineItemFields
        include JSON::Serializable

        # ExpenseFields used to show information from detected lines on a table.
        @[JSON::Field(key: "LineItemExpenseFields")]
        getter line_item_expense_fields : Array(Types::ExpenseField)?

        def initialize(
          @line_item_expense_fields : Array(Types::ExpenseField)? = nil
        )
        end
      end

      # A grouping of tables which contain LineItems, with each table identified by the table's
      # LineItemGroupIndex .
      struct LineItemGroup
        include JSON::Serializable

        # The number used to identify a specific table in a document. The first table encountered will have a
        # LineItemGroupIndex of 1, the second 2, etc.
        @[JSON::Field(key: "LineItemGroupIndex")]
        getter line_item_group_index : Int32?

        # The breakdown of information on a particular line of a table.
        @[JSON::Field(key: "LineItems")]
        getter line_items : Array(Types::LineItemFields)?

        def initialize(
          @line_item_group_index : Int32? = nil,
          @line_items : Array(Types::LineItemFields)? = nil
        )
        end
      end

      struct ListAdapterVersionsRequest
        include JSON::Serializable

        # A string containing a unique ID for the adapter to match for when listing adapter versions.
        @[JSON::Field(key: "AdapterId")]
        getter adapter_id : String?

        # Specifies the lower bound for the ListAdapterVersions operation. Ensures ListAdapterVersions returns
        # only adapter versions created after the specified creation time.
        @[JSON::Field(key: "AfterCreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter after_creation_time : Time?

        # Specifies the upper bound for the ListAdapterVersions operation. Ensures ListAdapterVersions returns
        # only adapter versions created after the specified creation time.
        @[JSON::Field(key: "BeforeCreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter before_creation_time : Time?

        # The maximum number of results to return when listing adapter versions.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return when listing adapter versions.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @adapter_id : String? = nil,
          @after_creation_time : Time? = nil,
          @before_creation_time : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAdapterVersionsResponse
        include JSON::Serializable

        # Adapter versions that match the filtering criteria specified when calling ListAdapters.
        @[JSON::Field(key: "AdapterVersions")]
        getter adapter_versions : Array(Types::AdapterVersionOverview)?

        # Identifies the next page of results to return when listing adapter versions.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @adapter_versions : Array(Types::AdapterVersionOverview)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAdaptersRequest
        include JSON::Serializable

        # Specifies the lower bound for the ListAdapters operation. Ensures ListAdapters returns only adapters
        # created after the specified creation time.
        @[JSON::Field(key: "AfterCreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter after_creation_time : Time?

        # Specifies the upper bound for the ListAdapters operation. Ensures ListAdapters returns only adapters
        # created before the specified creation time.
        @[JSON::Field(key: "BeforeCreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter before_creation_time : Time?

        # The maximum number of results to return when listing adapters.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Identifies the next page of results to return when listing adapters.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @after_creation_time : Time? = nil,
          @before_creation_time : Time? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAdaptersResponse
        include JSON::Serializable

        # A list of adapters that matches the filtering criteria specified when calling ListAdapters.
        @[JSON::Field(key: "Adapters")]
        getter adapters : Array(Types::AdapterOverview)?

        # Identifies the next page of results to return when listing adapters.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @adapters : Array(Types::AdapterOverview)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that specifies the resource to list tags for.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A set of tags (key-value pairs) that are part of the requested resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Contains information relating to dates in a document, including the type of value, and the value.
      struct NormalizedValue
        include JSON::Serializable

        # The value of the date, written as Year-Month-DayTHour:Minute:Second.
        @[JSON::Field(key: "Value")]
        getter value : String?

        # The normalized type of the value detected. In this case, DATE.
        @[JSON::Field(key: "ValueType")]
        getter value_type : String?

        def initialize(
          @value : String? = nil,
          @value_type : String? = nil
        )
        end
      end

      # The Amazon Simple Notification Service (Amazon SNS) topic to which Amazon Textract publishes the
      # completion status of an asynchronous document operation.
      struct NotificationChannel
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an IAM role that gives Amazon Textract publishing permissions to
        # the Amazon SNS topic.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The Amazon SNS topic that Amazon Textract posts the completion status to.
        @[JSON::Field(key: "SNSTopicArn")]
        getter sns_topic_arn : String

        def initialize(
          @role_arn : String,
          @sns_topic_arn : String
        )
        end
      end

      # Sets whether or not your output will go to a user created bucket. Used to set the name of the
      # bucket, and the prefix on the output file. OutputConfig is an optional parameter which lets you
      # adjust where your output will be placed. By default, Amazon Textract will store the results
      # internally and can only be accessed by the Get API operations. With OutputConfig enabled, you can
      # set the name of the bucket the output will be sent to the file prefix of the results where you can
      # download your results. Additionally, you can set the KMSKeyID parameter to a customer master key
      # (CMK) to encrypt your output. Without this parameter set Amazon Textract will encrypt server-side
      # using the AWS managed CMK for Amazon S3. Decryption of Customer Content is necessary for processing
      # of the documents by Amazon Textract. If your account is opted out under an AI services opt out
      # policy then all unencrypted Customer Content is immediately and permanently deleted after the
      # Customer Content has been processed by the service. No copy of of the output is retained by Amazon
      # Textract. For information about how to opt out, see Managing AI services opt-out policy. For more
      # information on data privacy, see the Data Privacy FAQ .
      struct OutputConfig
        include JSON::Serializable

        # The name of the bucket your output will go to.
        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String

        # The prefix of the object key that the output will be saved to. When not enabled, the prefix will be
        # “textract_output".
        @[JSON::Field(key: "S3Prefix")]
        getter s3_prefix : String?

        def initialize(
          @s3_bucket : String,
          @s3_prefix : String? = nil
        )
        end
      end

      # The class assigned to a Page object detected in an input document. Contains information regarding
      # the predicted type/class of a document's page and the page number that the Page object was detected
      # on.
      struct PageClassification
        include JSON::Serializable

        # The page number the value was detected on, relative to Amazon Textract's starting position.
        @[JSON::Field(key: "PageNumber")]
        getter page_number : Array(Types::Prediction)

        # The class, or document type, assigned to a detected Page object. The class, or document type,
        # assigned to a detected Page object.
        @[JSON::Field(key: "PageType")]
        getter page_type : Array(Types::Prediction)

        def initialize(
          @page_number : Array(Types::Prediction),
          @page_type : Array(Types::Prediction)
        )
        end
      end

      # The X and Y coordinates of a point on a document page. The X and Y values that are returned are
      # ratios of the overall document page size. For example, if the input document is 700 x 200 and the
      # operation returns X=0.5 and Y=0.25, then the point is at the (350,50) pixel coordinate on the
      # document page. An array of Point objects, Polygon , is returned by DetectDocumentText . Polygon
      # represents a fine-grained polygon around detected text. For more information, see Geometry in the
      # Amazon Textract Developer Guide.
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

      # Contains information regarding predicted values returned by Amazon Textract operations, including
      # the predicted value and the confidence in the predicted value.
      struct Prediction
        include JSON::Serializable

        # Amazon Textract's confidence in its predicted value.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        # The predicted value of a detected object.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @confidence : Float64? = nil,
          @value : String? = nil
        )
        end
      end

      # The number of requests exceeded your throughput limit. If you want to increase this limit, contact
      # Amazon Textract.
      struct ProvisionedThroughputExceededException
        include JSON::Serializable

        def initialize
        end
      end

      struct QueriesConfig
        include JSON::Serializable

        @[JSON::Field(key: "Queries")]
        getter queries : Array(Types::Query)

        def initialize(
          @queries : Array(Types::Query)
        )
        end
      end

      # Each query contains the question you want to ask in the Text and the alias you want to associate.
      struct Query
        include JSON::Serializable

        # Question that Amazon Textract will apply to the document. An example would be "What is the
        # customer's SSN?"
        @[JSON::Field(key: "Text")]
        getter text : String

        # Alias attached to the query, for ease of location.
        @[JSON::Field(key: "Alias")]
        getter alias : String?

        # Pages is a parameter that the user inputs to specify which pages to apply a query to. The following
        # is a list of rules for using this parameter. If a page is not specified, it is set to ["1"] by
        # default. The following characters are allowed in the parameter's string: 0 1 2 3 4 5 6 7 8 9 - * .
        # No whitespace is allowed. When using * to indicate all pages, it must be the only element in the
        # list. You can use page intervals, such as [“1-3”, “1-1”, “4-*”] . Where * indicates last page of
        # document. Specified pages must be greater than 0 and less than or equal to the number of pages in
        # the document.
        @[JSON::Field(key: "Pages")]
        getter pages : Array(String)?

        def initialize(
          @text : String,
          @alias : String? = nil,
          @pages : Array(String)? = nil
        )
        end
      end

      # Information about how blocks are related to each other. A Block object contains 0 or more Relation
      # objects in a list, Relationships . For more information, see Block . The Type element provides the
      # type of the relationship for all blocks in the IDs array.
      struct Relationship
        include JSON::Serializable

        # An array of IDs for related blocks. You can get the type of the relationship from the Type element.
        @[JSON::Field(key: "Ids")]
        getter ids : Array(String)?

        # The type of relationship between the blocks in the IDs array and the current block. The following
        # list describes the relationship types that can be returned. VALUE - A list that contains the ID of
        # the VALUE block that's associated with the KEY of a key-value pair. CHILD - A list of IDs that
        # identify blocks found within the current block object. For example, WORD blocks have a CHILD
        # relationship to the LINE block type. MERGED_CELL - A list of IDs that identify each of the
        # MERGED_CELL block types in a table. ANSWER - A list that contains the ID of the QUERY_RESULT block
        # that’s associated with the corresponding QUERY block. TABLE - A list of IDs that identify associated
        # TABLE block types. TABLE_TITLE - A list that contains the ID for the TABLE_TITLE block type in a
        # table. TABLE_FOOTER - A list of IDs that identify the TABLE_FOOTER block types in a table.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @ids : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      # Returned when an operation tried to access a nonexistent resource.
      struct ResourceNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The S3 bucket name and file name that identifies the document. The AWS Region for the S3 bucket that
      # contains the document must match the Region that you use for Amazon Textract operations. For Amazon
      # Textract to process a file in an S3 bucket, the user must have permission to access the S3 bucket
      # and file.
      struct S3Object
        include JSON::Serializable

        # The name of the S3 bucket. Note that the # character is not valid in the file name.
        @[JSON::Field(key: "Bucket")]
        getter bucket : String?

        # The file name of the input document. Image files may be in PDF, TIFF, JPEG, or PNG format.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # If the bucket has versioning enabled, you can specify the object version.
        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @bucket : String? = nil,
          @name : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Returned when a request cannot be completed as it would exceed a maximum service quota.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Information regarding a detected signature on a page.
      struct SignatureDetection
        include JSON::Serializable

        # The confidence, from 0 to 100, in the predicted values for a detected signature.
        @[JSON::Field(key: "Confidence")]
        getter confidence : Float64?

        @[JSON::Field(key: "Geometry")]
        getter geometry : Types::Geometry?

        def initialize(
          @confidence : Float64? = nil,
          @geometry : Types::Geometry? = nil
        )
        end
      end

      # Contains information about the pages of a document, defined by logical boundary.
      struct SplitDocument
        include JSON::Serializable

        # The index for a given document in a DocumentGroup of a specific Type.
        @[JSON::Field(key: "Index")]
        getter index : Int32?

        # An array of page numbers for a for a given document, ordered by logical boundary.
        @[JSON::Field(key: "Pages")]
        getter pages : Array(Int32)?

        def initialize(
          @index : Int32? = nil,
          @pages : Array(Int32)? = nil
        )
        end
      end

      struct StartDocumentAnalysisRequest
        include JSON::Serializable

        # The location of the document to be processed.
        @[JSON::Field(key: "DocumentLocation")]
        getter document_location : Types::DocumentLocation

        # A list of the types of analysis to perform. Add TABLES to the list to return information about the
        # tables that are detected in the input document. Add FORMS to return detected form data. To perform
        # both types of analysis, add TABLES and FORMS to FeatureTypes . All lines and words detected in the
        # document are included in the response (including text that isn't related to the value of
        # FeatureTypes ).
        @[JSON::Field(key: "FeatureTypes")]
        getter feature_types : Array(String)

        # Specifies the adapter to be used when analyzing a document.
        @[JSON::Field(key: "AdaptersConfig")]
        getter adapters_config : Types::AdaptersConfig?

        # The idempotent token that you use to identify the start request. If you use the same token with
        # multiple StartDocumentAnalysis requests, the same JobId is returned. Use ClientRequestToken to
        # prevent the same job from being accidentally started more than once. For more information, see
        # Calling Amazon Textract Asynchronous Operations .
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # An identifier that you specify that's included in the completion notification published to the
        # Amazon SNS topic. For example, you can use JobTag to identify the type of document that the
        # completion notification corresponds to (such as a tax form or a receipt).
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        # The KMS key used to encrypt the inference results. This can be in either Key ID or Key Alias format.
        # When a KMS key is provided, the KMS key will be used for server-side encryption of the objects in
        # the customer bucket. When this parameter is not enabled, the result will be encrypted server
        # side,using SSE-S3.
        @[JSON::Field(key: "KMSKeyId")]
        getter kms_key_id : String?

        # The Amazon SNS topic ARN that you want Amazon Textract to publish the completion status of the
        # operation to.
        @[JSON::Field(key: "NotificationChannel")]
        getter notification_channel : Types::NotificationChannel?

        # Sets if the output will go to a customer defined bucket. By default, Amazon Textract will save the
        # results internally to be accessed by the GetDocumentAnalysis operation.
        @[JSON::Field(key: "OutputConfig")]
        getter output_config : Types::OutputConfig?

        @[JSON::Field(key: "QueriesConfig")]
        getter queries_config : Types::QueriesConfig?

        def initialize(
          @document_location : Types::DocumentLocation,
          @feature_types : Array(String),
          @adapters_config : Types::AdaptersConfig? = nil,
          @client_request_token : String? = nil,
          @job_tag : String? = nil,
          @kms_key_id : String? = nil,
          @notification_channel : Types::NotificationChannel? = nil,
          @output_config : Types::OutputConfig? = nil,
          @queries_config : Types::QueriesConfig? = nil
        )
        end
      end

      struct StartDocumentAnalysisResponse
        include JSON::Serializable

        # The identifier for the document text detection job. Use JobId to identify the job in a subsequent
        # call to GetDocumentAnalysis . A JobId value is only valid for 7 days.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      struct StartDocumentTextDetectionRequest
        include JSON::Serializable

        # The location of the document to be processed.
        @[JSON::Field(key: "DocumentLocation")]
        getter document_location : Types::DocumentLocation

        # The idempotent token that's used to identify the start request. If you use the same token with
        # multiple StartDocumentTextDetection requests, the same JobId is returned. Use ClientRequestToken to
        # prevent the same job from being accidentally started more than once. For more information, see
        # Calling Amazon Textract Asynchronous Operations .
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # An identifier that you specify that's included in the completion notification published to the
        # Amazon SNS topic. For example, you can use JobTag to identify the type of document that the
        # completion notification corresponds to (such as a tax form or a receipt).
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        # The KMS key used to encrypt the inference results. This can be in either Key ID or Key Alias format.
        # When a KMS key is provided, the KMS key will be used for server-side encryption of the objects in
        # the customer bucket. When this parameter is not enabled, the result will be encrypted server
        # side,using SSE-S3.
        @[JSON::Field(key: "KMSKeyId")]
        getter kms_key_id : String?

        # The Amazon SNS topic ARN that you want Amazon Textract to publish the completion status of the
        # operation to.
        @[JSON::Field(key: "NotificationChannel")]
        getter notification_channel : Types::NotificationChannel?

        # Sets if the output will go to a customer defined bucket. By default Amazon Textract will save the
        # results internally to be accessed with the GetDocumentTextDetection operation.
        @[JSON::Field(key: "OutputConfig")]
        getter output_config : Types::OutputConfig?

        def initialize(
          @document_location : Types::DocumentLocation,
          @client_request_token : String? = nil,
          @job_tag : String? = nil,
          @kms_key_id : String? = nil,
          @notification_channel : Types::NotificationChannel? = nil,
          @output_config : Types::OutputConfig? = nil
        )
        end
      end

      struct StartDocumentTextDetectionResponse
        include JSON::Serializable

        # The identifier of the text detection job for the document. Use JobId to identify the job in a
        # subsequent call to GetDocumentTextDetection . A JobId value is only valid for 7 days.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      struct StartExpenseAnalysisRequest
        include JSON::Serializable

        # The location of the document to be processed.
        @[JSON::Field(key: "DocumentLocation")]
        getter document_location : Types::DocumentLocation

        # The idempotent token that's used to identify the start request. If you use the same token with
        # multiple StartDocumentTextDetection requests, the same JobId is returned. Use ClientRequestToken to
        # prevent the same job from being accidentally started more than once. For more information, see
        # Calling Amazon Textract Asynchronous Operations
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # An identifier you specify that's included in the completion notification published to the Amazon SNS
        # topic. For example, you can use JobTag to identify the type of document that the completion
        # notification corresponds to (such as a tax form or a receipt).
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        # The KMS key used to encrypt the inference results. This can be in either Key ID or Key Alias format.
        # When a KMS key is provided, the KMS key will be used for server-side encryption of the objects in
        # the customer bucket. When this parameter is not enabled, the result will be encrypted server
        # side,using SSE-S3.
        @[JSON::Field(key: "KMSKeyId")]
        getter kms_key_id : String?

        # The Amazon SNS topic ARN that you want Amazon Textract to publish the completion status of the
        # operation to.
        @[JSON::Field(key: "NotificationChannel")]
        getter notification_channel : Types::NotificationChannel?

        # Sets if the output will go to a customer defined bucket. By default, Amazon Textract will save the
        # results internally to be accessed by the GetExpenseAnalysis operation.
        @[JSON::Field(key: "OutputConfig")]
        getter output_config : Types::OutputConfig?

        def initialize(
          @document_location : Types::DocumentLocation,
          @client_request_token : String? = nil,
          @job_tag : String? = nil,
          @kms_key_id : String? = nil,
          @notification_channel : Types::NotificationChannel? = nil,
          @output_config : Types::OutputConfig? = nil
        )
        end
      end

      struct StartExpenseAnalysisResponse
        include JSON::Serializable

        # A unique identifier for the text detection job. The JobId is returned from StartExpenseAnalysis . A
        # JobId value is only valid for 7 days.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      struct StartLendingAnalysisRequest
        include JSON::Serializable

        @[JSON::Field(key: "DocumentLocation")]
        getter document_location : Types::DocumentLocation

        # The idempotent token that you use to identify the start request. If you use the same token with
        # multiple StartLendingAnalysis requests, the same JobId is returned. Use ClientRequestToken to
        # prevent the same job from being accidentally started more than once. For more information, see
        # Calling Amazon Textract Asynchronous Operations .
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # An identifier that you specify to be included in the completion notification published to the Amazon
        # SNS topic. For example, you can use JobTag to identify the type of document that the completion
        # notification corresponds to (such as a tax form or a receipt).
        @[JSON::Field(key: "JobTag")]
        getter job_tag : String?

        # The KMS key used to encrypt the inference results. This can be in either Key ID or Key Alias format.
        # When a KMS key is provided, the KMS key will be used for server-side encryption of the objects in
        # the customer bucket. When this parameter is not enabled, the result will be encrypted server side,
        # using SSE-S3.
        @[JSON::Field(key: "KMSKeyId")]
        getter kms_key_id : String?

        @[JSON::Field(key: "NotificationChannel")]
        getter notification_channel : Types::NotificationChannel?

        @[JSON::Field(key: "OutputConfig")]
        getter output_config : Types::OutputConfig?

        def initialize(
          @document_location : Types::DocumentLocation,
          @client_request_token : String? = nil,
          @job_tag : String? = nil,
          @kms_key_id : String? = nil,
          @notification_channel : Types::NotificationChannel? = nil,
          @output_config : Types::OutputConfig? = nil
        )
        end
      end

      struct StartLendingAnalysisResponse
        include JSON::Serializable

        # A unique identifier for the lending or text-detection job. The JobId is returned from
        # StartLendingAnalysis . A JobId value is only valid for 7 days.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        def initialize(
          @job_id : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that specifies the resource to be tagged.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A set of tags (key-value pairs) that you want to assign to the resource.
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

      # Amazon Textract is temporarily unable to process the request. Try your call again.
      struct ThrottlingException
        include JSON::Serializable

        def initialize
        end
      end

      # A structure containing information about an undetected signature on a page where it was expected but
      # not found.
      struct UndetectedSignature
        include JSON::Serializable

        # The page where a signature was expected but not found.
        @[JSON::Field(key: "Page")]
        getter page : Int32?

        def initialize(
          @page : Int32? = nil
        )
        end
      end

      # The format of the input document isn't supported. Documents for operations can be in PNG, JPEG, PDF,
      # or TIFF format.
      struct UnsupportedDocumentException
        include JSON::Serializable

        def initialize
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that specifies the resource to be untagged.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # Specifies the tags to be removed from the resource specified by the ResourceARN.
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

      struct UpdateAdapterRequest
        include JSON::Serializable

        # A string containing a unique ID for the adapter that will be updated.
        @[JSON::Field(key: "AdapterId")]
        getter adapter_id : String

        # The new name to be applied to the adapter.
        @[JSON::Field(key: "AdapterName")]
        getter adapter_name : String?

        # The new auto-update status to be applied to the adapter.
        @[JSON::Field(key: "AutoUpdate")]
        getter auto_update : String?

        # The new description to be applied to the adapter.
        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @adapter_id : String,
          @adapter_name : String? = nil,
          @auto_update : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct UpdateAdapterResponse
        include JSON::Serializable

        # A string containing a unique ID for the adapter that has been updated.
        @[JSON::Field(key: "AdapterId")]
        getter adapter_id : String?

        # A string containing the name of the adapter that has been updated.
        @[JSON::Field(key: "AdapterName")]
        getter adapter_name : String?

        # The auto-update status of the adapter that has been updated.
        @[JSON::Field(key: "AutoUpdate")]
        getter auto_update : String?

        # An object specifying the creation time of the the adapter that has been updated.
        @[JSON::Field(key: "CreationTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A string containing the description of the adapter that has been updated.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # List of the targeted feature types for the updated adapter.
        @[JSON::Field(key: "FeatureTypes")]
        getter feature_types : Array(String)?

        def initialize(
          @adapter_id : String? = nil,
          @adapter_name : String? = nil,
          @auto_update : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @feature_types : Array(String)? = nil
        )
        end
      end

      # Indicates that a request was not valid. Check request for proper formatting.
      struct ValidationException
        include JSON::Serializable

        def initialize
        end
      end

      # A warning about an issue that occurred during asynchronous text analysis ( StartDocumentAnalysis )
      # or asynchronous document text detection ( StartDocumentTextDetection ).
      struct Warning
        include JSON::Serializable

        # The error code for the warning.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # A list of the pages that the warning applies to.
        @[JSON::Field(key: "Pages")]
        getter pages : Array(Int32)?

        def initialize(
          @error_code : String? = nil,
          @pages : Array(Int32)? = nil
        )
        end
      end
    end
  end
end
