module AwsSdk
  module Textract
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Analyzes an input document for relationships between detected items. The types of information
      # returned are as follows: Form data (key-value pairs). The related information is returned in two
      # Block objects, each of type KEY_VALUE_SET : a KEY Block object and a VALUE Block object. For
      # example, Name: Ana Silva Carolina contains a key and value. Name: is the key. Ana Silva Carolina is
      # the value. Table and table cell data. A TABLE Block object contains information about a detected
      # table. A CELL Block object is returned for each cell in a table. Lines and words of text. A LINE
      # Block object contains one or more WORD Block objects. All lines and words that are detected in the
      # document are returned (including text that doesn't have a relationship with the value of
      # FeatureTypes ). Signatures. A SIGNATURE Block object contains the location information of a
      # signature in a document. If used in conjunction with forms or tables, a signature can be given a
      # Key-Value pairing or be detected in the cell of a table. Query. A QUERY Block object contains the
      # query text, alias and link to the associated Query results block object. Query Result. A
      # QUERY_RESULT Block object contains the answer to the query and an ID that connects it to the query
      # asked. This Block also contains a confidence score. Selection elements such as check boxes and
      # option buttons (radio buttons) can be detected in form data and in tables. A SELECTION_ELEMENT Block
      # object contains information about a selection element, including the selection status. You can
      # choose which type of analysis to perform by specifying the FeatureTypes list. The output is returned
      # in a list of Block objects. AnalyzeDocument is a synchronous operation. To analyze documents
      # asynchronously, use StartDocumentAnalysis . For more information, see Document Text Analysis .

      def analyze_document(
        document : Types::Document,
        feature_types : Array(String),
        adapters_config : Types::AdaptersConfig? = nil,
        human_loop_config : Types::HumanLoopConfig? = nil,
        queries_config : Types::QueriesConfig? = nil
      ) : Types::AnalyzeDocumentResponse

        input = Types::AnalyzeDocumentRequest.new(document: document, feature_types: feature_types, adapters_config: adapters_config, human_loop_config: human_loop_config, queries_config: queries_config)
        analyze_document(input)
      end

      def analyze_document(input : Types::AnalyzeDocumentRequest) : Types::AnalyzeDocumentResponse
        request = Protocol::JsonRpc.build_request(Model::ANALYZE_DOCUMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AnalyzeDocumentResponse, "AnalyzeDocument")
      end

      # AnalyzeExpense synchronously analyzes an input document for financially related relationships
      # between text. Information is returned as ExpenseDocuments and seperated as follows: LineItemGroups -
      # A data set containing LineItems which store information about the lines of text, such as an item
      # purchased and its price on a receipt. SummaryFields - Contains all other information a receipt, such
      # as header information or the vendors name.

      def analyze_expense(
        document : Types::Document
      ) : Types::AnalyzeExpenseResponse

        input = Types::AnalyzeExpenseRequest.new(document: document)
        analyze_expense(input)
      end

      def analyze_expense(input : Types::AnalyzeExpenseRequest) : Types::AnalyzeExpenseResponse
        request = Protocol::JsonRpc.build_request(Model::ANALYZE_EXPENSE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AnalyzeExpenseResponse, "AnalyzeExpense")
      end

      # Analyzes identity documents for relevant information. This information is extracted and returned as
      # IdentityDocumentFields , which records both the normalized field and value of the extracted text.
      # Unlike other Amazon Textract operations, AnalyzeID doesn't return any Geometry data.

      def analyze_id(
        document_pages : Array(Types::Document)
      ) : Types::AnalyzeIDResponse

        input = Types::AnalyzeIDRequest.new(document_pages: document_pages)
        analyze_id(input)
      end

      def analyze_id(input : Types::AnalyzeIDRequest) : Types::AnalyzeIDResponse
        request = Protocol::JsonRpc.build_request(Model::ANALYZE_ID, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AnalyzeIDResponse, "AnalyzeID")
      end

      # Creates an adapter, which can be fine-tuned for enhanced performance on user provided documents.
      # Takes an AdapterName and FeatureType. Currently the only supported feature type is QUERIES . You can
      # also provide a Description, Tags, and a ClientRequestToken. You can choose whether or not the
      # adapter should be AutoUpdated with the AutoUpdate argument. By default, AutoUpdate is set to
      # DISABLED.

      def create_adapter(
        adapter_name : String,
        feature_types : Array(String),
        auto_update : String? = nil,
        client_request_token : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateAdapterResponse

        input = Types::CreateAdapterRequest.new(adapter_name: adapter_name, feature_types: feature_types, auto_update: auto_update, client_request_token: client_request_token, description: description, tags: tags)
        create_adapter(input)
      end

      def create_adapter(input : Types::CreateAdapterRequest) : Types::CreateAdapterResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ADAPTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAdapterResponse, "CreateAdapter")
      end

      # Creates a new version of an adapter. Operates on a provided AdapterId and a specified dataset
      # provided via the DatasetConfig argument. Requires that you specify an Amazon S3 bucket with the
      # OutputConfig argument. You can provide an optional KMSKeyId, an optional ClientRequestToken, and
      # optional tags.

      def create_adapter_version(
        adapter_id : String,
        dataset_config : Types::AdapterVersionDatasetConfig,
        output_config : Types::OutputConfig,
        client_request_token : String? = nil,
        kms_key_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateAdapterVersionResponse

        input = Types::CreateAdapterVersionRequest.new(adapter_id: adapter_id, dataset_config: dataset_config, output_config: output_config, client_request_token: client_request_token, kms_key_id: kms_key_id, tags: tags)
        create_adapter_version(input)
      end

      def create_adapter_version(input : Types::CreateAdapterVersionRequest) : Types::CreateAdapterVersionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ADAPTER_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAdapterVersionResponse, "CreateAdapterVersion")
      end

      # Deletes an Amazon Textract adapter. Takes an AdapterId and deletes the adapter specified by the ID.

      def delete_adapter(
        adapter_id : String
      ) : Types::DeleteAdapterResponse

        input = Types::DeleteAdapterRequest.new(adapter_id: adapter_id)
        delete_adapter(input)
      end

      def delete_adapter(input : Types::DeleteAdapterRequest) : Types::DeleteAdapterResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ADAPTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAdapterResponse, "DeleteAdapter")
      end

      # Deletes an Amazon Textract adapter version. Requires that you specify both an AdapterId and a
      # AdapterVersion. Deletes the adapter version specified by the AdapterId and the AdapterVersion.

      def delete_adapter_version(
        adapter_id : String,
        adapter_version : String
      ) : Types::DeleteAdapterVersionResponse

        input = Types::DeleteAdapterVersionRequest.new(adapter_id: adapter_id, adapter_version: adapter_version)
        delete_adapter_version(input)
      end

      def delete_adapter_version(input : Types::DeleteAdapterVersionRequest) : Types::DeleteAdapterVersionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ADAPTER_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAdapterVersionResponse, "DeleteAdapterVersion")
      end

      # Detects text in the input document. Amazon Textract can detect lines of text and the words that make
      # up a line of text. The input document must be in one of the following image formats: JPEG, PNG, PDF,
      # or TIFF. DetectDocumentText returns the detected text in an array of Block objects. Each document
      # page has as an associated Block of type PAGE. Each PAGE Block object is the parent of LINE Block
      # objects that represent the lines of detected text on a page. A LINE Block object is a parent for
      # each word that makes up the line. Words are represented by Block objects of type WORD.
      # DetectDocumentText is a synchronous operation. To analyze documents asynchronously, use
      # StartDocumentTextDetection . For more information, see Document Text Detection .

      def detect_document_text(
        document : Types::Document
      ) : Types::DetectDocumentTextResponse

        input = Types::DetectDocumentTextRequest.new(document: document)
        detect_document_text(input)
      end

      def detect_document_text(input : Types::DetectDocumentTextRequest) : Types::DetectDocumentTextResponse
        request = Protocol::JsonRpc.build_request(Model::DETECT_DOCUMENT_TEXT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DetectDocumentTextResponse, "DetectDocumentText")
      end

      # Gets configuration information for an adapter specified by an AdapterId, returning information on
      # AdapterName, Description, CreationTime, AutoUpdate status, and FeatureTypes.

      def get_adapter(
        adapter_id : String
      ) : Types::GetAdapterResponse

        input = Types::GetAdapterRequest.new(adapter_id: adapter_id)
        get_adapter(input)
      end

      def get_adapter(input : Types::GetAdapterRequest) : Types::GetAdapterResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ADAPTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAdapterResponse, "GetAdapter")
      end

      # Gets configuration information for the specified adapter version, including: AdapterId,
      # AdapterVersion, FeatureTypes, Status, StatusMessage, DatasetConfig, KMSKeyId, OutputConfig, Tags and
      # EvaluationMetrics.

      def get_adapter_version(
        adapter_id : String,
        adapter_version : String
      ) : Types::GetAdapterVersionResponse

        input = Types::GetAdapterVersionRequest.new(adapter_id: adapter_id, adapter_version: adapter_version)
        get_adapter_version(input)
      end

      def get_adapter_version(input : Types::GetAdapterVersionRequest) : Types::GetAdapterVersionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ADAPTER_VERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAdapterVersionResponse, "GetAdapterVersion")
      end

      # Gets the results for an Amazon Textract asynchronous operation that analyzes text in a document. You
      # start asynchronous text analysis by calling StartDocumentAnalysis , which returns a job identifier (
      # JobId ). When the text analysis operation finishes, Amazon Textract publishes a completion status to
      # the Amazon Simple Notification Service (Amazon SNS) topic that's registered in the initial call to
      # StartDocumentAnalysis . To get the results of the text-detection operation, first check that the
      # status value published to the Amazon SNS topic is SUCCEEDED . If so, call GetDocumentAnalysis , and
      # pass the job identifier ( JobId ) from the initial call to StartDocumentAnalysis .
      # GetDocumentAnalysis returns an array of Block objects. The following types of information are
      # returned: Form data (key-value pairs). The related information is returned in two Block objects,
      # each of type KEY_VALUE_SET : a KEY Block object and a VALUE Block object. For example, Name: Ana
      # Silva Carolina contains a key and value. Name: is the key. Ana Silva Carolina is the value. Table
      # and table cell data. A TABLE Block object contains information about a detected table. A CELL Block
      # object is returned for each cell in a table. Lines and words of text. A LINE Block object contains
      # one or more WORD Block objects. All lines and words that are detected in the document are returned
      # (including text that doesn't have a relationship with the value of the StartDocumentAnalysis
      # FeatureTypes input parameter). Query. A QUERY Block object contains the query text, alias and link
      # to the associated Query results block object. Query Results. A QUERY_RESULT Block object contains
      # the answer to the query and an ID that connects it to the query asked. This Block also contains a
      # confidence score. While processing a document with queries, look out for INVALID_REQUEST_PARAMETERS
      # output. This indicates that either the per page query limit has been exceeded or that the operation
      # is trying to query a page in the document which doesn’t exist. Selection elements such as check
      # boxes and option buttons (radio buttons) can be detected in form data and in tables. A
      # SELECTION_ELEMENT Block object contains information about a selection element, including the
      # selection status. Use the MaxResults parameter to limit the number of blocks that are returned. If
      # there are more results than specified in MaxResults , the value of NextToken in the operation
      # response contains a pagination token for getting the next set of results. To get the next page of
      # results, call GetDocumentAnalysis , and populate the NextToken request parameter with the token
      # value that's returned from the previous call to GetDocumentAnalysis . For more information, see
      # Document Text Analysis .

      def get_document_analysis(
        job_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetDocumentAnalysisResponse

        input = Types::GetDocumentAnalysisRequest.new(job_id: job_id, max_results: max_results, next_token: next_token)
        get_document_analysis(input)
      end

      def get_document_analysis(input : Types::GetDocumentAnalysisRequest) : Types::GetDocumentAnalysisResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DOCUMENT_ANALYSIS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDocumentAnalysisResponse, "GetDocumentAnalysis")
      end

      # Gets the results for an Amazon Textract asynchronous operation that detects text in a document.
      # Amazon Textract can detect lines of text and the words that make up a line of text. You start
      # asynchronous text detection by calling StartDocumentTextDetection , which returns a job identifier (
      # JobId ). When the text detection operation finishes, Amazon Textract publishes a completion status
      # to the Amazon Simple Notification Service (Amazon SNS) topic that's registered in the initial call
      # to StartDocumentTextDetection . To get the results of the text-detection operation, first check that
      # the status value published to the Amazon SNS topic is SUCCEEDED . If so, call
      # GetDocumentTextDetection , and pass the job identifier ( JobId ) from the initial call to
      # StartDocumentTextDetection . GetDocumentTextDetection returns an array of Block objects. Each
      # document page has as an associated Block of type PAGE. Each PAGE Block object is the parent of LINE
      # Block objects that represent the lines of detected text on a page. A LINE Block object is a parent
      # for each word that makes up the line. Words are represented by Block objects of type WORD. Use the
      # MaxResults parameter to limit the number of blocks that are returned. If there are more results than
      # specified in MaxResults , the value of NextToken in the operation response contains a pagination
      # token for getting the next set of results. To get the next page of results, call
      # GetDocumentTextDetection , and populate the NextToken request parameter with the token value that's
      # returned from the previous call to GetDocumentTextDetection . For more information, see Document
      # Text Detection .

      def get_document_text_detection(
        job_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetDocumentTextDetectionResponse

        input = Types::GetDocumentTextDetectionRequest.new(job_id: job_id, max_results: max_results, next_token: next_token)
        get_document_text_detection(input)
      end

      def get_document_text_detection(input : Types::GetDocumentTextDetectionRequest) : Types::GetDocumentTextDetectionResponse
        request = Protocol::JsonRpc.build_request(Model::GET_DOCUMENT_TEXT_DETECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDocumentTextDetectionResponse, "GetDocumentTextDetection")
      end

      # Gets the results for an Amazon Textract asynchronous operation that analyzes invoices and receipts.
      # Amazon Textract finds contact information, items purchased, and vendor name, from input invoices and
      # receipts. You start asynchronous invoice/receipt analysis by calling StartExpenseAnalysis , which
      # returns a job identifier ( JobId ). Upon completion of the invoice/receipt analysis, Amazon Textract
      # publishes the completion status to the Amazon Simple Notification Service (Amazon SNS) topic. This
      # topic must be registered in the initial call to StartExpenseAnalysis . To get the results of the
      # invoice/receipt analysis operation, first ensure that the status value published to the Amazon SNS
      # topic is SUCCEEDED . If so, call GetExpenseAnalysis , and pass the job identifier ( JobId ) from the
      # initial call to StartExpenseAnalysis . Use the MaxResults parameter to limit the number of blocks
      # that are returned. If there are more results than specified in MaxResults , the value of NextToken
      # in the operation response contains a pagination token for getting the next set of results. To get
      # the next page of results, call GetExpenseAnalysis , and populate the NextToken request parameter
      # with the token value that's returned from the previous call to GetExpenseAnalysis . For more
      # information, see Analyzing Invoices and Receipts .

      def get_expense_analysis(
        job_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetExpenseAnalysisResponse

        input = Types::GetExpenseAnalysisRequest.new(job_id: job_id, max_results: max_results, next_token: next_token)
        get_expense_analysis(input)
      end

      def get_expense_analysis(input : Types::GetExpenseAnalysisRequest) : Types::GetExpenseAnalysisResponse
        request = Protocol::JsonRpc.build_request(Model::GET_EXPENSE_ANALYSIS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetExpenseAnalysisResponse, "GetExpenseAnalysis")
      end

      # Gets the results for an Amazon Textract asynchronous operation that analyzes text in a lending
      # document. You start asynchronous text analysis by calling StartLendingAnalysis , which returns a job
      # identifier ( JobId ). When the text analysis operation finishes, Amazon Textract publishes a
      # completion status to the Amazon Simple Notification Service (Amazon SNS) topic that's registered in
      # the initial call to StartLendingAnalysis . To get the results of the text analysis operation, first
      # check that the status value published to the Amazon SNS topic is SUCCEEDED. If so, call
      # GetLendingAnalysis, and pass the job identifier ( JobId ) from the initial call to
      # StartLendingAnalysis .

      def get_lending_analysis(
        job_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetLendingAnalysisResponse

        input = Types::GetLendingAnalysisRequest.new(job_id: job_id, max_results: max_results, next_token: next_token)
        get_lending_analysis(input)
      end

      def get_lending_analysis(input : Types::GetLendingAnalysisRequest) : Types::GetLendingAnalysisResponse
        request = Protocol::JsonRpc.build_request(Model::GET_LENDING_ANALYSIS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLendingAnalysisResponse, "GetLendingAnalysis")
      end

      # Gets summarized results for the StartLendingAnalysis operation, which analyzes text in a lending
      # document. The returned summary consists of information about documents grouped together by a common
      # document type. Information like detected signatures, page numbers, and split documents is returned
      # with respect to the type of grouped document. You start asynchronous text analysis by calling
      # StartLendingAnalysis , which returns a job identifier ( JobId ). When the text analysis operation
      # finishes, Amazon Textract publishes a completion status to the Amazon Simple Notification Service
      # (Amazon SNS) topic that's registered in the initial call to StartLendingAnalysis . To get the
      # results of the text analysis operation, first check that the status value published to the Amazon
      # SNS topic is SUCCEEDED. If so, call GetLendingAnalysisSummary , and pass the job identifier ( JobId
      # ) from the initial call to StartLendingAnalysis .

      def get_lending_analysis_summary(
        job_id : String
      ) : Types::GetLendingAnalysisSummaryResponse

        input = Types::GetLendingAnalysisSummaryRequest.new(job_id: job_id)
        get_lending_analysis_summary(input)
      end

      def get_lending_analysis_summary(input : Types::GetLendingAnalysisSummaryRequest) : Types::GetLendingAnalysisSummaryResponse
        request = Protocol::JsonRpc.build_request(Model::GET_LENDING_ANALYSIS_SUMMARY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetLendingAnalysisSummaryResponse, "GetLendingAnalysisSummary")
      end

      # List all version of an adapter that meet the specified filtration criteria.

      def list_adapter_versions(
        adapter_id : String? = nil,
        after_creation_time : Time? = nil,
        before_creation_time : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAdapterVersionsResponse

        input = Types::ListAdapterVersionsRequest.new(adapter_id: adapter_id, after_creation_time: after_creation_time, before_creation_time: before_creation_time, max_results: max_results, next_token: next_token)
        list_adapter_versions(input)
      end

      def list_adapter_versions(input : Types::ListAdapterVersionsRequest) : Types::ListAdapterVersionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ADAPTER_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAdapterVersionsResponse, "ListAdapterVersions")
      end

      # Lists all adapters that match the specified filtration criteria.

      def list_adapters(
        after_creation_time : Time? = nil,
        before_creation_time : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAdaptersResponse

        input = Types::ListAdaptersRequest.new(after_creation_time: after_creation_time, before_creation_time: before_creation_time, max_results: max_results, next_token: next_token)
        list_adapters(input)
      end

      def list_adapters(input : Types::ListAdaptersRequest) : Types::ListAdaptersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ADAPTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAdaptersResponse, "ListAdapters")
      end

      # Lists all tags for an Amazon Textract resource.

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

      # Starts the asynchronous analysis of an input document for relationships between detected items such
      # as key-value pairs, tables, and selection elements. StartDocumentAnalysis can analyze text in
      # documents that are in JPEG, PNG, TIFF, and PDF format. The documents are stored in an Amazon S3
      # bucket. Use DocumentLocation to specify the bucket name and file name of the document.
      # StartDocumentAnalysis returns a job identifier ( JobId ) that you use to get the results of the
      # operation. When text analysis is finished, Amazon Textract publishes a completion status to the
      # Amazon Simple Notification Service (Amazon SNS) topic that you specify in NotificationChannel . To
      # get the results of the text analysis operation, first check that the status value published to the
      # Amazon SNS topic is SUCCEEDED . If so, call GetDocumentAnalysis , and pass the job identifier (
      # JobId ) from the initial call to StartDocumentAnalysis . For more information, see Document Text
      # Analysis .

      def start_document_analysis(
        document_location : Types::DocumentLocation,
        feature_types : Array(String),
        adapters_config : Types::AdaptersConfig? = nil,
        client_request_token : String? = nil,
        job_tag : String? = nil,
        kms_key_id : String? = nil,
        notification_channel : Types::NotificationChannel? = nil,
        output_config : Types::OutputConfig? = nil,
        queries_config : Types::QueriesConfig? = nil
      ) : Types::StartDocumentAnalysisResponse

        input = Types::StartDocumentAnalysisRequest.new(document_location: document_location, feature_types: feature_types, adapters_config: adapters_config, client_request_token: client_request_token, job_tag: job_tag, kms_key_id: kms_key_id, notification_channel: notification_channel, output_config: output_config, queries_config: queries_config)
        start_document_analysis(input)
      end

      def start_document_analysis(input : Types::StartDocumentAnalysisRequest) : Types::StartDocumentAnalysisResponse
        request = Protocol::JsonRpc.build_request(Model::START_DOCUMENT_ANALYSIS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartDocumentAnalysisResponse, "StartDocumentAnalysis")
      end

      # Starts the asynchronous detection of text in a document. Amazon Textract can detect lines of text
      # and the words that make up a line of text. StartDocumentTextDetection can analyze text in documents
      # that are in JPEG, PNG, TIFF, and PDF format. The documents are stored in an Amazon S3 bucket. Use
      # DocumentLocation to specify the bucket name and file name of the document.
      # StartDocumentTextDetection returns a job identifier ( JobId ) that you use to get the results of the
      # operation. When text detection is finished, Amazon Textract publishes a completion status to the
      # Amazon Simple Notification Service (Amazon SNS) topic that you specify in NotificationChannel . To
      # get the results of the text detection operation, first check that the status value published to the
      # Amazon SNS topic is SUCCEEDED . If so, call GetDocumentTextDetection , and pass the job identifier (
      # JobId ) from the initial call to StartDocumentTextDetection . For more information, see Document
      # Text Detection .

      def start_document_text_detection(
        document_location : Types::DocumentLocation,
        client_request_token : String? = nil,
        job_tag : String? = nil,
        kms_key_id : String? = nil,
        notification_channel : Types::NotificationChannel? = nil,
        output_config : Types::OutputConfig? = nil
      ) : Types::StartDocumentTextDetectionResponse

        input = Types::StartDocumentTextDetectionRequest.new(document_location: document_location, client_request_token: client_request_token, job_tag: job_tag, kms_key_id: kms_key_id, notification_channel: notification_channel, output_config: output_config)
        start_document_text_detection(input)
      end

      def start_document_text_detection(input : Types::StartDocumentTextDetectionRequest) : Types::StartDocumentTextDetectionResponse
        request = Protocol::JsonRpc.build_request(Model::START_DOCUMENT_TEXT_DETECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartDocumentTextDetectionResponse, "StartDocumentTextDetection")
      end

      # Starts the asynchronous analysis of invoices or receipts for data like contact information, items
      # purchased, and vendor names. StartExpenseAnalysis can analyze text in documents that are in JPEG,
      # PNG, and PDF format. The documents must be stored in an Amazon S3 bucket. Use the DocumentLocation
      # parameter to specify the name of your S3 bucket and the name of the document in that bucket.
      # StartExpenseAnalysis returns a job identifier ( JobId ) that you will provide to GetExpenseAnalysis
      # to retrieve the results of the operation. When the analysis of the input invoices/receipts is
      # finished, Amazon Textract publishes a completion status to the Amazon Simple Notification Service
      # (Amazon SNS) topic that you provide to the NotificationChannel . To obtain the results of the
      # invoice and receipt analysis operation, ensure that the status value published to the Amazon SNS
      # topic is SUCCEEDED . If so, call GetExpenseAnalysis , and pass the job identifier ( JobId ) that was
      # returned by your call to StartExpenseAnalysis . For more information, see Analyzing Invoices and
      # Receipts .

      def start_expense_analysis(
        document_location : Types::DocumentLocation,
        client_request_token : String? = nil,
        job_tag : String? = nil,
        kms_key_id : String? = nil,
        notification_channel : Types::NotificationChannel? = nil,
        output_config : Types::OutputConfig? = nil
      ) : Types::StartExpenseAnalysisResponse

        input = Types::StartExpenseAnalysisRequest.new(document_location: document_location, client_request_token: client_request_token, job_tag: job_tag, kms_key_id: kms_key_id, notification_channel: notification_channel, output_config: output_config)
        start_expense_analysis(input)
      end

      def start_expense_analysis(input : Types::StartExpenseAnalysisRequest) : Types::StartExpenseAnalysisResponse
        request = Protocol::JsonRpc.build_request(Model::START_EXPENSE_ANALYSIS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartExpenseAnalysisResponse, "StartExpenseAnalysis")
      end

      # Starts the classification and analysis of an input document. StartLendingAnalysis initiates the
      # classification and analysis of a packet of lending documents. StartLendingAnalysis operates on a
      # document file located in an Amazon S3 bucket. StartLendingAnalysis can analyze text in documents
      # that are in one of the following formats: JPEG, PNG, TIFF, PDF. Use DocumentLocation to specify the
      # bucket name and the file name of the document. StartLendingAnalysis returns a job identifier ( JobId
      # ) that you use to get the results of the operation. When the text analysis is finished, Amazon
      # Textract publishes a completion status to the Amazon Simple Notification Service (Amazon SNS) topic
      # that you specify in NotificationChannel . To get the results of the text analysis operation, first
      # check that the status value published to the Amazon SNS topic is SUCCEEDED. If the status is
      # SUCCEEDED you can call either GetLendingAnalysis or GetLendingAnalysisSummary and provide the JobId
      # to obtain the results of the analysis. If using OutputConfig to specify an Amazon S3 bucket, the
      # output will be contained within the specified prefix in a directory labeled with the job-id. In the
      # directory there are 3 sub-directories: detailedResponse (contains the GetLendingAnalysis response)
      # summaryResponse (for the GetLendingAnalysisSummary response) splitDocuments (documents split across
      # logical boundaries)

      def start_lending_analysis(
        document_location : Types::DocumentLocation,
        client_request_token : String? = nil,
        job_tag : String? = nil,
        kms_key_id : String? = nil,
        notification_channel : Types::NotificationChannel? = nil,
        output_config : Types::OutputConfig? = nil
      ) : Types::StartLendingAnalysisResponse

        input = Types::StartLendingAnalysisRequest.new(document_location: document_location, client_request_token: client_request_token, job_tag: job_tag, kms_key_id: kms_key_id, notification_channel: notification_channel, output_config: output_config)
        start_lending_analysis(input)
      end

      def start_lending_analysis(input : Types::StartLendingAnalysisRequest) : Types::StartLendingAnalysisResponse
        request = Protocol::JsonRpc.build_request(Model::START_LENDING_ANALYSIS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartLendingAnalysisResponse, "StartLendingAnalysis")
      end

      # Adds one or more tags to the specified resource.

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

      # Removes any tags with the specified keys from the specified resource.

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

      # Update the configuration for an adapter. FeatureTypes configurations cannot be updated. At least one
      # new parameter must be specified as an argument.

      def update_adapter(
        adapter_id : String,
        adapter_name : String? = nil,
        auto_update : String? = nil,
        description : String? = nil
      ) : Types::UpdateAdapterResponse

        input = Types::UpdateAdapterRequest.new(adapter_id: adapter_id, adapter_name: adapter_name, auto_update: auto_update, description: description)
        update_adapter(input)
      end

      def update_adapter(input : Types::UpdateAdapterRequest) : Types::UpdateAdapterResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ADAPTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAdapterResponse, "UpdateAdapter")
      end
    end
  end
end
