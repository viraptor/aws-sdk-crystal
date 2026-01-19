module AwsSdk
  module B2bi
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

      # Instantiates a capability based on the specified parameters. A trading capability contains the
      # information required to transform incoming EDI documents into JSON or XML outputs.
      def create_capability(
        configuration : Types::CapabilityConfiguration,
        name : String,
        type : String,
        client_token : String? = nil,
        instructions_documents : Array(Types::S3Location)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateCapabilityResponse
        input = Types::CreateCapabilityRequest.new(configuration: configuration, name: name, type: type, client_token: client_token, instructions_documents: instructions_documents, tags: tags)
        create_capability(input)
      end
      def create_capability(input : Types::CreateCapabilityRequest) : Types::CreateCapabilityResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CAPABILITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCapabilityResponse, "CreateCapability")
      end

      # Creates a partnership between a customer and a trading partner, based on the supplied parameters. A
      # partnership represents the connection between you and your trading partner. It ties together a
      # profile and one or more trading capabilities.
      def create_partnership(
        capabilities : Array(String),
        email : String,
        name : String,
        profile_id : String,
        capability_options : Types::CapabilityOptions? = nil,
        client_token : String? = nil,
        phone : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreatePartnershipResponse
        input = Types::CreatePartnershipRequest.new(capabilities: capabilities, email: email, name: name, profile_id: profile_id, capability_options: capability_options, client_token: client_token, phone: phone, tags: tags)
        create_partnership(input)
      end
      def create_partnership(input : Types::CreatePartnershipRequest) : Types::CreatePartnershipResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PARTNERSHIP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePartnershipResponse, "CreatePartnership")
      end

      # Creates a customer profile. You can have up to five customer profiles, each representing a distinct
      # private network. A profile is the mechanism used to create the concept of a private network.
      def create_profile(
        business_name : String,
        logging : String,
        name : String,
        phone : String,
        client_token : String? = nil,
        email : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateProfileResponse
        input = Types::CreateProfileRequest.new(business_name: business_name, logging: logging, name: name, phone: phone, client_token: client_token, email: email, tags: tags)
        create_profile(input)
      end
      def create_profile(input : Types::CreateProfileRequest) : Types::CreateProfileResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateProfileResponse, "CreateProfile")
      end

      # Amazon Web Services B2B Data Interchange uses a mapping template in JSONata or XSLT format to
      # transform a customer input file into a JSON or XML file that can be converted to EDI. If you provide
      # a sample EDI file with the same structure as the EDI files that you wish to generate, then the
      # service can generate a mapping template. The starter template contains placeholder values which you
      # can replace with JSONata or XSLT expressions to take data from your input file and insert it into
      # the JSON or XML file that is used to generate the EDI. If you do not provide a sample EDI file, then
      # the service can generate a mapping template based on the EDI settings in the templateDetails
      # parameter. Currently, we only support generating a template that can generate the input to produce
      # an Outbound X12 EDI file.
      def create_starter_mapping_template(
        mapping_type : String,
        template_details : Types::TemplateDetails,
        output_sample_location : Types::S3Location? = nil
      ) : Types::CreateStarterMappingTemplateResponse
        input = Types::CreateStarterMappingTemplateRequest.new(mapping_type: mapping_type, template_details: template_details, output_sample_location: output_sample_location)
        create_starter_mapping_template(input)
      end
      def create_starter_mapping_template(input : Types::CreateStarterMappingTemplateRequest) : Types::CreateStarterMappingTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_STARTER_MAPPING_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateStarterMappingTemplateResponse, "CreateStarterMappingTemplate")
      end

      # Creates a transformer. Amazon Web Services B2B Data Interchange currently supports two scenarios:
      # Inbound EDI : the Amazon Web Services customer receives an EDI file from their trading partner.
      # Amazon Web Services B2B Data Interchange converts this EDI file into a JSON or XML file with a
      # service-defined structure. A mapping template provided by the customer, in JSONata or XSLT format,
      # is optionally applied to this file to produce a JSON or XML file with the structure the customer
      # requires. Outbound EDI : the Amazon Web Services customer has a JSON or XML file containing data
      # that they wish to use in an EDI file. A mapping template, provided by the customer (in either
      # JSONata or XSLT format) is applied to this file to generate a JSON or XML file in the
      # service-defined structure. This file is then converted to an EDI file. The following fields are
      # provided for backwards compatibility only: fileFormat , mappingTemplate , ediType , and
      # sampleDocument . Use the mapping data type in place of mappingTemplate and fileFormat Use the
      # sampleDocuments data type in place of sampleDocument Use either the inputConversion or
      # outputConversion in place of ediType
      def create_transformer(
        name : String,
        client_token : String? = nil,
        edi_type : Types::EdiType? = nil,
        file_format : String? = nil,
        input_conversion : Types::InputConversion? = nil,
        mapping : Types::Mapping? = nil,
        mapping_template : String? = nil,
        output_conversion : Types::OutputConversion? = nil,
        sample_document : String? = nil,
        sample_documents : Types::SampleDocuments? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateTransformerResponse
        input = Types::CreateTransformerRequest.new(name: name, client_token: client_token, edi_type: edi_type, file_format: file_format, input_conversion: input_conversion, mapping: mapping, mapping_template: mapping_template, output_conversion: output_conversion, sample_document: sample_document, sample_documents: sample_documents, tags: tags)
        create_transformer(input)
      end
      def create_transformer(input : Types::CreateTransformerRequest) : Types::CreateTransformerResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_TRANSFORMER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateTransformerResponse, "CreateTransformer")
      end

      # Deletes the specified capability. A trading capability contains the information required to
      # transform incoming EDI documents into JSON or XML outputs.
      def delete_capability(
        capability_id : String
      ) : Nil
        input = Types::DeleteCapabilityRequest.new(capability_id: capability_id)
        delete_capability(input)
      end
      def delete_capability(input : Types::DeleteCapabilityRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_CAPABILITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified partnership. A partnership represents the connection between you and your
      # trading partner. It ties together a profile and one or more trading capabilities.
      def delete_partnership(
        partnership_id : String
      ) : Nil
        input = Types::DeletePartnershipRequest.new(partnership_id: partnership_id)
        delete_partnership(input)
      end
      def delete_partnership(input : Types::DeletePartnershipRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_PARTNERSHIP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified profile. A profile is the mechanism used to create the concept of a private
      # network.
      def delete_profile(
        profile_id : String
      ) : Nil
        input = Types::DeleteProfileRequest.new(profile_id: profile_id)
        delete_profile(input)
      end
      def delete_profile(input : Types::DeleteProfileRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Deletes the specified transformer. A transformer can take an EDI file as input and transform it into
      # a JSON-or XML-formatted document. Alternatively, a transformer can take a JSON-or XML-formatted
      # document as input and transform it into an EDI file.
      def delete_transformer(
        transformer_id : String
      ) : Nil
        input = Types::DeleteTransformerRequest.new(transformer_id: transformer_id)
        delete_transformer(input)
      end
      def delete_transformer(input : Types::DeleteTransformerRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_TRANSFORMER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Takes sample input and output documents and uses Amazon Bedrock to generate a mapping automatically.
      # Depending on the accuracy and other factors, you can then edit the mapping for your needs. Before
      # you can use the AI-assisted feature for Amazon Web Services B2B Data Interchange you must enable
      # models in Amazon Bedrock. For details, see AI-assisted template mapping prerequisites in the Amazon
      # Web Services B2B Data Interchange User guide . To generate a mapping, perform the following steps:
      # Start with an X12 EDI document to use as the input. Call TestMapping using your EDI document. Use
      # the output from the TestMapping operation as either input or output for your GenerateMapping call,
      # along with your sample file.
      def generate_mapping(
        input_file_content : String,
        mapping_type : String,
        output_file_content : String
      ) : Types::GenerateMappingResponse
        input = Types::GenerateMappingRequest.new(input_file_content: input_file_content, mapping_type: mapping_type, output_file_content: output_file_content)
        generate_mapping(input)
      end
      def generate_mapping(input : Types::GenerateMappingRequest) : Types::GenerateMappingResponse
        request = Protocol::JsonRpc.build_request(Model::GENERATE_MAPPING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GenerateMappingResponse, "GenerateMapping")
      end

      # Retrieves the details for the specified capability. A trading capability contains the information
      # required to transform incoming EDI documents into JSON or XML outputs.
      def get_capability(
        capability_id : String
      ) : Types::GetCapabilityResponse
        input = Types::GetCapabilityRequest.new(capability_id: capability_id)
        get_capability(input)
      end
      def get_capability(input : Types::GetCapabilityRequest) : Types::GetCapabilityResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CAPABILITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCapabilityResponse, "GetCapability")
      end

      # Retrieves the details for a partnership, based on the partner and profile IDs specified. A
      # partnership represents the connection between you and your trading partner. It ties together a
      # profile and one or more trading capabilities.
      def get_partnership(
        partnership_id : String
      ) : Types::GetPartnershipResponse
        input = Types::GetPartnershipRequest.new(partnership_id: partnership_id)
        get_partnership(input)
      end
      def get_partnership(input : Types::GetPartnershipRequest) : Types::GetPartnershipResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PARTNERSHIP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPartnershipResponse, "GetPartnership")
      end

      # Retrieves the details for the profile specified by the profile ID. A profile is the mechanism used
      # to create the concept of a private network.
      def get_profile(
        profile_id : String
      ) : Types::GetProfileResponse
        input = Types::GetProfileRequest.new(profile_id: profile_id)
        get_profile(input)
      end
      def get_profile(input : Types::GetProfileRequest) : Types::GetProfileResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetProfileResponse, "GetProfile")
      end

      # Retrieves the details for the transformer specified by the transformer ID. A transformer can take an
      # EDI file as input and transform it into a JSON-or XML-formatted document. Alternatively, a
      # transformer can take a JSON-or XML-formatted document as input and transform it into an EDI file.
      def get_transformer(
        transformer_id : String
      ) : Types::GetTransformerResponse
        input = Types::GetTransformerRequest.new(transformer_id: transformer_id)
        get_transformer(input)
      end
      def get_transformer(input : Types::GetTransformerRequest) : Types::GetTransformerResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TRANSFORMER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTransformerResponse, "GetTransformer")
      end

      # Returns the details of the transformer run, based on the Transformer job ID. If 30 days have elapsed
      # since your transformer job was started, the system deletes it. So, if you run GetTransformerJob and
      # supply a transformerId and transformerJobId for a job that was started more than 30 days previously,
      # you receive a 404 response.
      def get_transformer_job(
        transformer_id : String,
        transformer_job_id : String
      ) : Types::GetTransformerJobResponse
        input = Types::GetTransformerJobRequest.new(transformer_id: transformer_id, transformer_job_id: transformer_job_id)
        get_transformer_job(input)
      end
      def get_transformer_job(input : Types::GetTransformerJobRequest) : Types::GetTransformerJobResponse
        request = Protocol::JsonRpc.build_request(Model::GET_TRANSFORMER_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetTransformerJobResponse, "GetTransformerJob")
      end

      # Lists the capabilities associated with your Amazon Web Services account for your current or
      # specified region. A trading capability contains the information required to transform incoming EDI
      # documents into JSON or XML outputs.
      def list_capabilities(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCapabilitiesResponse
        input = Types::ListCapabilitiesRequest.new(max_results: max_results, next_token: next_token)
        list_capabilities(input)
      end
      def list_capabilities(input : Types::ListCapabilitiesRequest) : Types::ListCapabilitiesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CAPABILITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCapabilitiesResponse, "ListCapabilities")
      end

      # Lists the partnerships associated with your Amazon Web Services account for your current or
      # specified region. A partnership represents the connection between you and your trading partner. It
      # ties together a profile and one or more trading capabilities.
      def list_partnerships(
        max_results : Int32? = nil,
        next_token : String? = nil,
        profile_id : String? = nil
      ) : Types::ListPartnershipsResponse
        input = Types::ListPartnershipsRequest.new(max_results: max_results, next_token: next_token, profile_id: profile_id)
        list_partnerships(input)
      end
      def list_partnerships(input : Types::ListPartnershipsRequest) : Types::ListPartnershipsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PARTNERSHIPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPartnershipsResponse, "ListPartnerships")
      end

      # Lists the profiles associated with your Amazon Web Services account for your current or specified
      # region. A profile is the mechanism used to create the concept of a private network.
      def list_profiles(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListProfilesResponse
        input = Types::ListProfilesRequest.new(max_results: max_results, next_token: next_token)
        list_profiles(input)
      end
      def list_profiles(input : Types::ListProfilesRequest) : Types::ListProfilesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_PROFILES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListProfilesResponse, "ListProfiles")
      end

      # Lists all of the tags associated with the Amazon Resource Name (ARN) that you specify. The resource
      # can be a capability, partnership, profile, or transformer.
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

      # Lists the available transformers. A transformer can take an EDI file as input and transform it into
      # a JSON-or XML-formatted document. Alternatively, a transformer can take a JSON-or XML-formatted
      # document as input and transform it into an EDI file.
      def list_transformers(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTransformersResponse
        input = Types::ListTransformersRequest.new(max_results: max_results, next_token: next_token)
        list_transformers(input)
      end
      def list_transformers(input : Types::ListTransformersRequest) : Types::ListTransformersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TRANSFORMERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTransformersResponse, "ListTransformers")
      end

      # Runs a job, using a transformer, to parse input EDI (electronic data interchange) file into the
      # output structures used by Amazon Web Services B2B Data Interchange. If you only want to transform
      # EDI (electronic data interchange) documents, you don't need to create profiles, partnerships or
      # capabilities. Just create and configure a transformer, and then run the StartTransformerJob API to
      # process your files. The system stores transformer jobs for 30 days. During that period, you can run
      # GetTransformerJob and supply its transformerId and transformerJobId to return details of the job.
      def start_transformer_job(
        input_file : Types::S3Location,
        output_location : Types::S3Location,
        transformer_id : String,
        client_token : String? = nil
      ) : Types::StartTransformerJobResponse
        input = Types::StartTransformerJobRequest.new(input_file: input_file, output_location: output_location, transformer_id: transformer_id, client_token: client_token)
        start_transformer_job(input)
      end
      def start_transformer_job(input : Types::StartTransformerJobRequest) : Types::StartTransformerJobResponse
        request = Protocol::JsonRpc.build_request(Model::START_TRANSFORMER_JOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::StartTransformerJobResponse, "StartTransformerJob")
      end

      # Attaches a key-value pair to a resource, as identified by its Amazon Resource Name (ARN). Resources
      # are capability, partnership, profile, transformers and other entities. There is no response returned
      # from this call.
      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Nil
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # This operation mimics the latter half of a typical Outbound EDI request. It takes an input JSON/XML
      # in the B2Bi shape as input, converts it to an X12 EDI string, and return that string.
      def test_conversion(
        source : Types::ConversionSource,
        target : Types::ConversionTarget
      ) : Types::TestConversionResponse
        input = Types::TestConversionRequest.new(source: source, target: target)
        test_conversion(input)
      end
      def test_conversion(input : Types::TestConversionRequest) : Types::TestConversionResponse
        request = Protocol::JsonRpc.build_request(Model::TEST_CONVERSION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TestConversionResponse, "TestConversion")
      end

      # Maps the input file according to the provided template file. The API call downloads the file
      # contents from the Amazon S3 location, and passes the contents in as a string, to the
      # inputFileContent parameter.
      def test_mapping(
        file_format : String,
        input_file_content : String,
        mapping_template : String
      ) : Types::TestMappingResponse
        input = Types::TestMappingRequest.new(file_format: file_format, input_file_content: input_file_content, mapping_template: mapping_template)
        test_mapping(input)
      end
      def test_mapping(input : Types::TestMappingRequest) : Types::TestMappingResponse
        request = Protocol::JsonRpc.build_request(Model::TEST_MAPPING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TestMappingResponse, "TestMapping")
      end

      # Parses the input EDI (electronic data interchange) file. The input file has a file size limit of 250
      # KB.
      def test_parsing(
        edi_type : Types::EdiType,
        file_format : String,
        input_file : Types::S3Location,
        advanced_options : Types::AdvancedOptions? = nil
      ) : Types::TestParsingResponse
        input = Types::TestParsingRequest.new(edi_type: edi_type, file_format: file_format, input_file: input_file, advanced_options: advanced_options)
        test_parsing(input)
      end
      def test_parsing(input : Types::TestParsingRequest) : Types::TestParsingResponse
        request = Protocol::JsonRpc.build_request(Model::TEST_PARSING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TestParsingResponse, "TestParsing")
      end

      # Detaches a key-value pair from the specified resource, as identified by its Amazon Resource Name
      # (ARN). Resources are capability, partnership, profile, transformers and other entities.
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Nil
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates some of the parameters for a capability, based on the specified parameters. A trading
      # capability contains the information required to transform incoming EDI documents into JSON or XML
      # outputs.
      def update_capability(
        capability_id : String,
        configuration : Types::CapabilityConfiguration? = nil,
        instructions_documents : Array(Types::S3Location)? = nil,
        name : String? = nil
      ) : Types::UpdateCapabilityResponse
        input = Types::UpdateCapabilityRequest.new(capability_id: capability_id, configuration: configuration, instructions_documents: instructions_documents, name: name)
        update_capability(input)
      end
      def update_capability(input : Types::UpdateCapabilityRequest) : Types::UpdateCapabilityResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CAPABILITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCapabilityResponse, "UpdateCapability")
      end

      # Updates some of the parameters for a partnership between a customer and trading partner. A
      # partnership represents the connection between you and your trading partner. It ties together a
      # profile and one or more trading capabilities.
      def update_partnership(
        partnership_id : String,
        capabilities : Array(String)? = nil,
        capability_options : Types::CapabilityOptions? = nil,
        name : String? = nil
      ) : Types::UpdatePartnershipResponse
        input = Types::UpdatePartnershipRequest.new(partnership_id: partnership_id, capabilities: capabilities, capability_options: capability_options, name: name)
        update_partnership(input)
      end
      def update_partnership(input : Types::UpdatePartnershipRequest) : Types::UpdatePartnershipResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PARTNERSHIP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePartnershipResponse, "UpdatePartnership")
      end

      # Updates the specified parameters for a profile. A profile is the mechanism used to create the
      # concept of a private network.
      def update_profile(
        profile_id : String,
        business_name : String? = nil,
        email : String? = nil,
        name : String? = nil,
        phone : String? = nil
      ) : Types::UpdateProfileResponse
        input = Types::UpdateProfileRequest.new(profile_id: profile_id, business_name: business_name, email: email, name: name, phone: phone)
        update_profile(input)
      end
      def update_profile(input : Types::UpdateProfileRequest) : Types::UpdateProfileResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PROFILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateProfileResponse, "UpdateProfile")
      end

      # Updates the specified parameters for a transformer. A transformer can take an EDI file as input and
      # transform it into a JSON-or XML-formatted document. Alternatively, a transformer can take a JSON-or
      # XML-formatted document as input and transform it into an EDI file.
      def update_transformer(
        transformer_id : String,
        edi_type : Types::EdiType? = nil,
        file_format : String? = nil,
        input_conversion : Types::InputConversion? = nil,
        mapping : Types::Mapping? = nil,
        mapping_template : String? = nil,
        name : String? = nil,
        output_conversion : Types::OutputConversion? = nil,
        sample_document : String? = nil,
        sample_documents : Types::SampleDocuments? = nil,
        status : String? = nil
      ) : Types::UpdateTransformerResponse
        input = Types::UpdateTransformerRequest.new(transformer_id: transformer_id, edi_type: edi_type, file_format: file_format, input_conversion: input_conversion, mapping: mapping, mapping_template: mapping_template, name: name, output_conversion: output_conversion, sample_document: sample_document, sample_documents: sample_documents, status: status)
        update_transformer(input)
      end
      def update_transformer(input : Types::UpdateTransformerRequest) : Types::UpdateTransformerResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_TRANSFORMER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateTransformerResponse, "UpdateTransformer")
      end
    end
  end
end
