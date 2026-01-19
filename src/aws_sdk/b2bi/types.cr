require "json"
require "time"

module AwsSdk
  module B2bi
    module Types

      # You do not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A structure that contains advanced options for EDI processing. Currently, only X12 advanced options
      # are supported.
      struct AdvancedOptions
        include JSON::Serializable

        # A structure that contains X12-specific advanced options, such as split options for processing X12
        # EDI files.
        @[JSON::Field(key: "x12")]
        getter x12 : Types::X12AdvancedOptions?

        def initialize(
          @x12 : Types::X12AdvancedOptions? = nil
        )
        end
      end

      # A capability object. Currently, only EDI (electronic data interchange) capabilities are supported. A
      # trading capability contains the information required to transform incoming EDI documents into JSON
      # or XML outputs.
      struct CapabilityConfiguration
        include JSON::Serializable

        # An EDI (electronic data interchange) configuration object.
        @[JSON::Field(key: "edi")]
        getter edi : Types::EdiConfiguration?

        def initialize(
          @edi : Types::EdiConfiguration? = nil
        )
        end
      end

      # Contains the details for an Outbound EDI capability.
      struct CapabilityOptions
        include JSON::Serializable

        # A structure that contains the inbound EDI options for the capability.
        @[JSON::Field(key: "inboundEdi")]
        getter inbound_edi : Types::InboundEdiOptions?

        # A structure that contains the outbound EDI options.
        @[JSON::Field(key: "outboundEdi")]
        getter outbound_edi : Types::OutboundEdiOptions?

        def initialize(
          @inbound_edi : Types::InboundEdiOptions? = nil,
          @outbound_edi : Types::OutboundEdiOptions? = nil
        )
        end
      end

      # Returns the capability summary details. A trading capability contains the information required to
      # transform incoming EDI documents into JSON or XML outputs.
      struct CapabilitySummary
        include JSON::Serializable

        # Returns a system-assigned unique identifier for the capability.
        @[JSON::Field(key: "capabilityId")]
        getter capability_id : String

        # Returns a timestamp for creation date and time of the capability.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The display name of the capability.
        @[JSON::Field(key: "name")]
        getter name : String

        # Returns the type of the capability. Currently, only edi is supported.
        @[JSON::Field(key: "type")]
        getter type : String

        # Returns a timestamp that identifies the most recent date and time that the capability was modified.
        @[JSON::Field(key: "modifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        def initialize(
          @capability_id : String,
          @created_at : Time,
          @name : String,
          @type : String,
          @modified_at : Time? = nil
        )
        end
      end

      # A conflict exception is thrown when you attempt to delete a resource (such as a profile or a
      # capability) that is being used by other resources.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Describes the input for an outbound transformation.
      struct ConversionSource
        include JSON::Serializable

        # The format for the input file: either JSON or XML.
        @[JSON::Field(key: "fileFormat")]
        getter file_format : String

        # File to be converted
        @[JSON::Field(key: "inputFile")]
        getter input_file : Types::InputFileSource

        def initialize(
          @file_format : String,
          @input_file : Types::InputFileSource
        )
        end
      end

      # Provide a sample of what the output of the transformation should look like.
      struct ConversionTarget
        include JSON::Serializable

        # Currently, only X12 format is supported.
        @[JSON::Field(key: "fileFormat")]
        getter file_format : String

        @[JSON::Field(key: "advancedOptions")]
        getter advanced_options : Types::AdvancedOptions?

        # A structure that contains the formatting details for the conversion target.
        @[JSON::Field(key: "formatDetails")]
        getter format_details : Types::ConversionTargetFormatDetails?

        # Customer uses this to provide a sample on what should file look like after conversion X12 EDI use
        # case around this would be discovering the file syntax
        @[JSON::Field(key: "outputSampleFile")]
        getter output_sample_file : Types::OutputSampleFileSource?

        def initialize(
          @file_format : String,
          @advanced_options : Types::AdvancedOptions? = nil,
          @format_details : Types::ConversionTargetFormatDetails? = nil,
          @output_sample_file : Types::OutputSampleFileSource? = nil
        )
        end
      end

      # Contains a structure describing the X12 details for the conversion target.
      struct ConversionTargetFormatDetails
        include JSON::Serializable

        @[JSON::Field(key: "x12")]
        getter x12 : Types::X12Details?

        def initialize(
          @x12 : Types::X12Details? = nil
        )
        end
      end

      struct CreateCapabilityRequest
        include JSON::Serializable

        # Specifies a structure that contains the details for a capability.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::CapabilityConfiguration

        # Specifies the name of the capability, used to identify it.
        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies the type of the capability. Currently, only edi is supported.
        @[JSON::Field(key: "type")]
        getter type : String

        # Reserved for future use.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies one or more locations in Amazon S3, each specifying an EDI document that can be used with
        # this capability. Each item contains the name of the bucket and the key, to identify the document's
        # location.
        @[JSON::Field(key: "instructionsDocuments")]
        getter instructions_documents : Array(Types::S3Location)?

        # Specifies the key-value pairs assigned to ARNs that you can use to group and search for resources by
        # type. You can attach this metadata to resources (capabilities, partnerships, and so on) for any
        # purpose.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @configuration : Types::CapabilityConfiguration,
          @name : String,
          @type : String,
          @client_token : String? = nil,
          @instructions_documents : Array(Types::S3Location)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateCapabilityResponse
        include JSON::Serializable

        # Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such as a
        # capability, partnership, profile, or transformer.
        @[JSON::Field(key: "capabilityArn")]
        getter capability_arn : String

        # Returns a system-assigned unique identifier for the capability.
        @[JSON::Field(key: "capabilityId")]
        getter capability_id : String

        # Returns a structure that contains the details for a capability.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::CapabilityConfiguration

        # Returns a timestamp for creation date and time of the capability.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # Returns the name of the capability used to identify it.
        @[JSON::Field(key: "name")]
        getter name : String

        # Returns the type of the capability. Currently, only edi is supported.
        @[JSON::Field(key: "type")]
        getter type : String

        # Returns one or more locations in Amazon S3, each specifying an EDI document that can be used with
        # this capability. Each item contains the name of the bucket and the key, to identify the document's
        # location.
        @[JSON::Field(key: "instructionsDocuments")]
        getter instructions_documents : Array(Types::S3Location)?

        def initialize(
          @capability_arn : String,
          @capability_id : String,
          @configuration : Types::CapabilityConfiguration,
          @created_at : Time,
          @name : String,
          @type : String,
          @instructions_documents : Array(Types::S3Location)? = nil
        )
        end
      end

      struct CreatePartnershipRequest
        include JSON::Serializable

        # Specifies a list of the capabilities associated with this partnership.
        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(String)

        # Specifies the email address associated with this trading partner.
        @[JSON::Field(key: "email")]
        getter email : String

        # Specifies a descriptive name for the partnership.
        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies the unique, system-generated identifier for the profile connected to this partnership.
        @[JSON::Field(key: "profileId")]
        getter profile_id : String

        # Specify the structure that contains the details for the associated capabilities.
        @[JSON::Field(key: "capabilityOptions")]
        getter capability_options : Types::CapabilityOptions?

        # Reserved for future use.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies the phone number associated with the partnership.
        @[JSON::Field(key: "phone")]
        getter phone : String?

        # Specifies the key-value pairs assigned to ARNs that you can use to group and search for resources by
        # type. You can attach this metadata to resources (capabilities, partnerships, and so on) for any
        # purpose.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @capabilities : Array(String),
          @email : String,
          @name : String,
          @profile_id : String,
          @capability_options : Types::CapabilityOptions? = nil,
          @client_token : String? = nil,
          @phone : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreatePartnershipResponse
        include JSON::Serializable

        # Returns a timestamp for creation date and time of the partnership.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such as a
        # capability, partnership, profile, or transformer.
        @[JSON::Field(key: "partnershipArn")]
        getter partnership_arn : String

        # Returns the unique, system-generated identifier for a partnership.
        @[JSON::Field(key: "partnershipId")]
        getter partnership_id : String

        # Returns the unique, system-generated identifier for the profile connected to this partnership.
        @[JSON::Field(key: "profileId")]
        getter profile_id : String

        # Returns one or more capabilities associated with this partnership.
        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(String)?

        # Returns the structure that contains the details for the associated capabilities.
        @[JSON::Field(key: "capabilityOptions")]
        getter capability_options : Types::CapabilityOptions?

        # Returns the email address associated with this trading partner.
        @[JSON::Field(key: "email")]
        getter email : String?

        # Returns a descriptive name for the partnership.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Returns the phone number associated with the partnership.
        @[JSON::Field(key: "phone")]
        getter phone : String?

        # Returns the unique, system-generated identifier for a trading partner.
        @[JSON::Field(key: "tradingPartnerId")]
        getter trading_partner_id : String?

        def initialize(
          @created_at : Time,
          @partnership_arn : String,
          @partnership_id : String,
          @profile_id : String,
          @capabilities : Array(String)? = nil,
          @capability_options : Types::CapabilityOptions? = nil,
          @email : String? = nil,
          @name : String? = nil,
          @phone : String? = nil,
          @trading_partner_id : String? = nil
        )
        end
      end

      struct CreateProfileRequest
        include JSON::Serializable

        # Specifies the name for the business associated with this profile.
        @[JSON::Field(key: "businessName")]
        getter business_name : String

        # Specifies whether or not logging is enabled for this profile.
        @[JSON::Field(key: "logging")]
        getter logging : String

        # Specifies the name of the profile.
        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies the phone number associated with the profile.
        @[JSON::Field(key: "phone")]
        getter phone : String

        # Reserved for future use.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies the email address associated with this customer profile.
        @[JSON::Field(key: "email")]
        getter email : String?

        # Specifies the key-value pairs assigned to ARNs that you can use to group and search for resources by
        # type. You can attach this metadata to resources (capabilities, partnerships, and so on) for any
        # purpose.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @business_name : String,
          @logging : String,
          @name : String,
          @phone : String,
          @client_token : String? = nil,
          @email : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateProfileResponse
        include JSON::Serializable

        # Returns the name for the business associated with this profile.
        @[JSON::Field(key: "businessName")]
        getter business_name : String

        # Returns a timestamp representing the time the profile was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # Returns the name of the profile, used to identify it.
        @[JSON::Field(key: "name")]
        getter name : String

        # Returns the phone number associated with the profile.
        @[JSON::Field(key: "phone")]
        getter phone : String

        # Returns an Amazon Resource Name (ARN) for the profile.
        @[JSON::Field(key: "profileArn")]
        getter profile_arn : String

        # Returns the unique, system-generated identifier for the profile.
        @[JSON::Field(key: "profileId")]
        getter profile_id : String

        # Returns the email address associated with this customer profile.
        @[JSON::Field(key: "email")]
        getter email : String?

        # Returns the name of the logging group.
        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String?

        # Returns whether or not logging is turned on for this profile.
        @[JSON::Field(key: "logging")]
        getter logging : String?

        def initialize(
          @business_name : String,
          @created_at : Time,
          @name : String,
          @phone : String,
          @profile_arn : String,
          @profile_id : String,
          @email : String? = nil,
          @log_group_name : String? = nil,
          @logging : String? = nil
        )
        end
      end

      struct CreateStarterMappingTemplateRequest
        include JSON::Serializable

        # Specify the format for the mapping template: either JSONATA or XSLT.
        @[JSON::Field(key: "mappingType")]
        getter mapping_type : String

        # Describes the details needed for generating the template. Specify the X12 transaction set and
        # version for which the template is used: currently, we only support X12.
        @[JSON::Field(key: "templateDetails")]
        getter template_details : Types::TemplateDetails

        # Specify the location of the sample EDI file that is used to generate the mapping template.
        @[JSON::Field(key: "outputSampleLocation")]
        getter output_sample_location : Types::S3Location?

        def initialize(
          @mapping_type : String,
          @template_details : Types::TemplateDetails,
          @output_sample_location : Types::S3Location? = nil
        )
        end
      end

      struct CreateStarterMappingTemplateResponse
        include JSON::Serializable

        # Returns a string that represents the mapping template.
        @[JSON::Field(key: "mappingTemplate")]
        getter mapping_template : String

        def initialize(
          @mapping_template : String
        )
        end
      end

      struct CreateTransformerRequest
        include JSON::Serializable

        # Specifies the name of the transformer, used to identify it.
        @[JSON::Field(key: "name")]
        getter name : String

        # Reserved for future use.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies the details for the EDI standard that is being used for the transformer. Currently, only
        # X12 is supported. X12 is a set of standards and corresponding messages that define specific business
        # documents.
        @[JSON::Field(key: "ediType")]
        getter edi_type : Types::EdiType?

        # Specifies that the currently supported file formats for EDI transformations are JSON and XML .
        @[JSON::Field(key: "fileFormat")]
        getter file_format : String?

        # Specify the InputConversion object, which contains the format options for the inbound
        # transformation.
        @[JSON::Field(key: "inputConversion")]
        getter input_conversion : Types::InputConversion?

        # Specify the structure that contains the mapping template and its language (either XSLT or JSONATA).
        @[JSON::Field(key: "mapping")]
        getter mapping : Types::Mapping?

        # Specifies the mapping template for the transformer. This template is used to map the parsed EDI file
        # using JSONata or XSLT. This parameter is available for backwards compatibility. Use the Mapping data
        # type instead.
        @[JSON::Field(key: "mappingTemplate")]
        getter mapping_template : String?

        # A structure that contains the OutputConversion object, which contains the format options for the
        # outbound transformation.
        @[JSON::Field(key: "outputConversion")]
        getter output_conversion : Types::OutputConversion?

        # Specifies a sample EDI document that is used by a transformer as a guide for processing the EDI
        # data.
        @[JSON::Field(key: "sampleDocument")]
        getter sample_document : String?

        # Specify a structure that contains the Amazon S3 bucket and an array of the corresponding keys used
        # to identify the location for your sample documents.
        @[JSON::Field(key: "sampleDocuments")]
        getter sample_documents : Types::SampleDocuments?

        # Specifies the key-value pairs assigned to ARNs that you can use to group and search for resources by
        # type. You can attach this metadata to resources (capabilities, partnerships, and so on) for any
        # purpose.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @client_token : String? = nil,
          @edi_type : Types::EdiType? = nil,
          @file_format : String? = nil,
          @input_conversion : Types::InputConversion? = nil,
          @mapping : Types::Mapping? = nil,
          @mapping_template : String? = nil,
          @output_conversion : Types::OutputConversion? = nil,
          @sample_document : String? = nil,
          @sample_documents : Types::SampleDocuments? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateTransformerResponse
        include JSON::Serializable

        # Returns a timestamp for creation date and time of the transformer.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # Returns the name of the transformer, used to identify it.
        @[JSON::Field(key: "name")]
        getter name : String

        # Returns the state of the newly created transformer. The transformer can be either active or inactive
        # . For the transformer to be used in a capability, its status must active .
        @[JSON::Field(key: "status")]
        getter status : String

        # Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such as a
        # capability, partnership, profile, or transformer.
        @[JSON::Field(key: "transformerArn")]
        getter transformer_arn : String

        # Returns the system-assigned unique identifier for the transformer.
        @[JSON::Field(key: "transformerId")]
        getter transformer_id : String

        # Returns the details for the EDI standard that is being used for the transformer. Currently, only X12
        # is supported. X12 is a set of standards and corresponding messages that define specific business
        # documents.
        @[JSON::Field(key: "ediType")]
        getter edi_type : Types::EdiType?

        # Returns that the currently supported file formats for EDI transformations are JSON and XML .
        @[JSON::Field(key: "fileFormat")]
        getter file_format : String?

        # Returns the InputConversion object, which contains the format options for the inbound
        # transformation.
        @[JSON::Field(key: "inputConversion")]
        getter input_conversion : Types::InputConversion?

        # Returns the structure that contains the mapping template and its language (either XSLT or JSONATA).
        @[JSON::Field(key: "mapping")]
        getter mapping : Types::Mapping?

        # Returns the mapping template for the transformer. This template is used to map the parsed EDI file
        # using JSONata or XSLT.
        @[JSON::Field(key: "mappingTemplate")]
        getter mapping_template : String?

        # Returns the OutputConversion object, which contains the format options for the outbound
        # transformation.
        @[JSON::Field(key: "outputConversion")]
        getter output_conversion : Types::OutputConversion?

        # Returns a sample EDI document that is used by a transformer as a guide for processing the EDI data.
        @[JSON::Field(key: "sampleDocument")]
        getter sample_document : String?

        # Returns a structure that contains the Amazon S3 bucket and an array of the corresponding keys used
        # to identify the location for your sample documents.
        @[JSON::Field(key: "sampleDocuments")]
        getter sample_documents : Types::SampleDocuments?

        def initialize(
          @created_at : Time,
          @name : String,
          @status : String,
          @transformer_arn : String,
          @transformer_id : String,
          @edi_type : Types::EdiType? = nil,
          @file_format : String? = nil,
          @input_conversion : Types::InputConversion? = nil,
          @mapping : Types::Mapping? = nil,
          @mapping_template : String? = nil,
          @output_conversion : Types::OutputConversion? = nil,
          @sample_document : String? = nil,
          @sample_documents : Types::SampleDocuments? = nil
        )
        end
      end

      struct DeleteCapabilityRequest
        include JSON::Serializable

        # Specifies a system-assigned unique identifier for the capability.
        @[JSON::Field(key: "capabilityId")]
        getter capability_id : String

        def initialize(
          @capability_id : String
        )
        end
      end

      struct DeletePartnershipRequest
        include JSON::Serializable

        # Specifies the unique, system-generated identifier for a partnership.
        @[JSON::Field(key: "partnershipId")]
        getter partnership_id : String

        def initialize(
          @partnership_id : String
        )
        end
      end

      struct DeleteProfileRequest
        include JSON::Serializable

        # Specifies the unique, system-generated identifier for the profile.
        @[JSON::Field(key: "profileId")]
        getter profile_id : String

        def initialize(
          @profile_id : String
        )
        end
      end

      struct DeleteTransformerRequest
        include JSON::Serializable

        # Specifies the system-assigned unique identifier for the transformer.
        @[JSON::Field(key: "transformerId")]
        getter transformer_id : String

        def initialize(
          @transformer_id : String
        )
        end
      end

      # Specifies the details for the EDI (electronic data interchange) transformation.
      struct EdiConfiguration
        include JSON::Serializable

        # Contains the Amazon S3 bucket and prefix for the location of the input file, which is contained in
        # an S3Location object.
        @[JSON::Field(key: "inputLocation")]
        getter input_location : Types::S3Location

        # Contains the Amazon S3 bucket and prefix for the location of the output file, which is contained in
        # an S3Location object.
        @[JSON::Field(key: "outputLocation")]
        getter output_location : Types::S3Location

        # Returns the system-assigned unique identifier for the transformer.
        @[JSON::Field(key: "transformerId")]
        getter transformer_id : String

        # Returns the type of the capability. Currently, only edi is supported.
        @[JSON::Field(key: "type")]
        getter type : Types::EdiType

        # Specifies whether this is capability is for inbound or outbound transformations.
        @[JSON::Field(key: "capabilityDirection")]
        getter capability_direction : String?

        def initialize(
          @input_location : Types::S3Location,
          @output_location : Types::S3Location,
          @transformer_id : String,
          @type : Types::EdiType,
          @capability_direction : String? = nil
        )
        end
      end

      # Specifies the details for the EDI standard that is being used for the transformer. Currently, only
      # X12 is supported. X12 is a set of standards and corresponding messages that define specific business
      # documents.
      struct EdiType
        include JSON::Serializable

        # Returns the details for the EDI standard that is being used for the transformer. Currently, only X12
        # is supported. X12 is a set of standards and corresponding messages that define specific business
        # documents.
        @[JSON::Field(key: "x12Details")]
        getter x12_details : Types::X12Details?

        def initialize(
          @x12_details : Types::X12Details? = nil
        )
        end
      end

      # A structure that contains the X12 transaction set and version.
      struct FormatOptions
        include JSON::Serializable

        @[JSON::Field(key: "x12")]
        getter x12 : Types::X12Details?

        def initialize(
          @x12 : Types::X12Details? = nil
        )
        end
      end

      struct GenerateMappingRequest
        include JSON::Serializable

        # Provide the contents of a sample X12 EDI file, either in JSON or XML format, to use as a starting
        # point for the mapping.
        @[JSON::Field(key: "inputFileContent")]
        getter input_file_content : String

        # Specify the mapping type: either JSONATA or XSLT.
        @[JSON::Field(key: "mappingType")]
        getter mapping_type : String

        # Provide the contents of a sample X12 EDI file, either in JSON or XML format, to use as a target for
        # the mapping.
        @[JSON::Field(key: "outputFileContent")]
        getter output_file_content : String

        def initialize(
          @input_file_content : String,
          @mapping_type : String,
          @output_file_content : String
        )
        end
      end

      struct GenerateMappingResponse
        include JSON::Serializable

        # Returns a mapping template based on your inputs.
        @[JSON::Field(key: "mappingTemplate")]
        getter mapping_template : String

        # Returns a percentage that estimates the accuracy of the generated mapping.
        @[JSON::Field(key: "mappingAccuracy")]
        getter mapping_accuracy : Float64?

        def initialize(
          @mapping_template : String,
          @mapping_accuracy : Float64? = nil
        )
        end
      end

      struct GetCapabilityRequest
        include JSON::Serializable

        # Specifies a system-assigned unique identifier for the capability.
        @[JSON::Field(key: "capabilityId")]
        getter capability_id : String

        def initialize(
          @capability_id : String
        )
        end
      end

      struct GetCapabilityResponse
        include JSON::Serializable

        # Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such as a
        # capability, partnership, profile, or transformer.
        @[JSON::Field(key: "capabilityArn")]
        getter capability_arn : String

        # Returns a system-assigned unique identifier for the capability.
        @[JSON::Field(key: "capabilityId")]
        getter capability_id : String

        # Returns a structure that contains the details for a capability.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::CapabilityConfiguration

        # Returns a timestamp for creation date and time of the capability.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # Returns the name of the capability, used to identify it.
        @[JSON::Field(key: "name")]
        getter name : String

        # Returns the type of the capability. Currently, only edi is supported.
        @[JSON::Field(key: "type")]
        getter type : String

        # Returns one or more locations in Amazon S3, each specifying an EDI document that can be used with
        # this capability. Each item contains the name of the bucket and the key, to identify the document's
        # location.
        @[JSON::Field(key: "instructionsDocuments")]
        getter instructions_documents : Array(Types::S3Location)?

        # Returns a timestamp for last time the capability was modified.
        @[JSON::Field(key: "modifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        def initialize(
          @capability_arn : String,
          @capability_id : String,
          @configuration : Types::CapabilityConfiguration,
          @created_at : Time,
          @name : String,
          @type : String,
          @instructions_documents : Array(Types::S3Location)? = nil,
          @modified_at : Time? = nil
        )
        end
      end

      struct GetPartnershipRequest
        include JSON::Serializable

        # Specifies the unique, system-generated identifier for a partnership.
        @[JSON::Field(key: "partnershipId")]
        getter partnership_id : String

        def initialize(
          @partnership_id : String
        )
        end
      end

      struct GetPartnershipResponse
        include JSON::Serializable

        # Returns a timestamp for creation date and time of the partnership.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such as a
        # capability, partnership, profile, or transformer.
        @[JSON::Field(key: "partnershipArn")]
        getter partnership_arn : String

        # Returns the unique, system-generated identifier for a partnership.
        @[JSON::Field(key: "partnershipId")]
        getter partnership_id : String

        # Returns the unique, system-generated identifier for the profile connected to this partnership.
        @[JSON::Field(key: "profileId")]
        getter profile_id : String

        # Returns one or more capabilities associated with this partnership.
        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(String)?

        @[JSON::Field(key: "capabilityOptions")]
        getter capability_options : Types::CapabilityOptions?

        # Returns the email address associated with this trading partner.
        @[JSON::Field(key: "email")]
        getter email : String?

        # Returns a timestamp that identifies the most recent date and time that the partnership was modified.
        @[JSON::Field(key: "modifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        # Returns the display name of the partnership
        @[JSON::Field(key: "name")]
        getter name : String?

        # Returns the phone number associated with the partnership.
        @[JSON::Field(key: "phone")]
        getter phone : String?

        # Returns the unique identifier for the partner for this partnership.
        @[JSON::Field(key: "tradingPartnerId")]
        getter trading_partner_id : String?

        def initialize(
          @created_at : Time,
          @partnership_arn : String,
          @partnership_id : String,
          @profile_id : String,
          @capabilities : Array(String)? = nil,
          @capability_options : Types::CapabilityOptions? = nil,
          @email : String? = nil,
          @modified_at : Time? = nil,
          @name : String? = nil,
          @phone : String? = nil,
          @trading_partner_id : String? = nil
        )
        end
      end

      struct GetProfileRequest
        include JSON::Serializable

        # Specifies the unique, system-generated identifier for the profile.
        @[JSON::Field(key: "profileId")]
        getter profile_id : String

        def initialize(
          @profile_id : String
        )
        end
      end

      struct GetProfileResponse
        include JSON::Serializable

        # Returns the name for the business associated with this profile.
        @[JSON::Field(key: "businessName")]
        getter business_name : String

        # Returns a timestamp for creation date and time of the transformer.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # Returns the name of the profile, used to identify it.
        @[JSON::Field(key: "name")]
        getter name : String

        # Returns the phone number associated with the profile.
        @[JSON::Field(key: "phone")]
        getter phone : String

        # Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such as a
        # capability, partnership, profile, or transformer.
        @[JSON::Field(key: "profileArn")]
        getter profile_arn : String

        # Returns the unique, system-generated identifier for the profile.
        @[JSON::Field(key: "profileId")]
        getter profile_id : String

        # Returns the email address associated with this customer profile.
        @[JSON::Field(key: "email")]
        getter email : String?

        # Returns the name of the logging group.
        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String?

        # Returns whether or not logging is enabled for this profile.
        @[JSON::Field(key: "logging")]
        getter logging : String?

        # Returns a timestamp for last time the profile was modified.
        @[JSON::Field(key: "modifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        def initialize(
          @business_name : String,
          @created_at : Time,
          @name : String,
          @phone : String,
          @profile_arn : String,
          @profile_id : String,
          @email : String? = nil,
          @log_group_name : String? = nil,
          @logging : String? = nil,
          @modified_at : Time? = nil
        )
        end
      end

      struct GetTransformerJobRequest
        include JSON::Serializable

        # Specifies the system-assigned unique identifier for the transformer.
        @[JSON::Field(key: "transformerId")]
        getter transformer_id : String

        # Specifies the unique, system-generated identifier for a transformer run.
        @[JSON::Field(key: "transformerJobId")]
        getter transformer_job_id : String

        def initialize(
          @transformer_id : String,
          @transformer_job_id : String
        )
        end
      end

      struct GetTransformerJobResponse
        include JSON::Serializable

        # Returns the current state of the transformer job, either running , succeeded , or failed .
        @[JSON::Field(key: "status")]
        getter status : String

        # Returns an optional error message, which gets populated when the job is not run successfully.
        @[JSON::Field(key: "message")]
        getter message : String?

        # Returns the location for the output files. If the caller specified a directory for the output, then
        # this contains the full path to the output file, including the file name generated by the service.
        @[JSON::Field(key: "outputFiles")]
        getter output_files : Array(Types::S3Location)?

        def initialize(
          @status : String,
          @message : String? = nil,
          @output_files : Array(Types::S3Location)? = nil
        )
        end
      end

      struct GetTransformerRequest
        include JSON::Serializable

        # Specifies the system-assigned unique identifier for the transformer.
        @[JSON::Field(key: "transformerId")]
        getter transformer_id : String

        def initialize(
          @transformer_id : String
        )
        end
      end

      struct GetTransformerResponse
        include JSON::Serializable

        # Returns a timestamp for creation date and time of the transformer.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # Returns the name of the transformer, used to identify it.
        @[JSON::Field(key: "name")]
        getter name : String

        # Returns the state of the newly created transformer. The transformer can be either active or inactive
        # . For the transformer to be used in a capability, its status must active .
        @[JSON::Field(key: "status")]
        getter status : String

        # Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such as a
        # capability, partnership, profile, or transformer.
        @[JSON::Field(key: "transformerArn")]
        getter transformer_arn : String

        # Returns the system-assigned unique identifier for the transformer.
        @[JSON::Field(key: "transformerId")]
        getter transformer_id : String

        # Returns the details for the EDI standard that is being used for the transformer. Currently, only X12
        # is supported. X12 is a set of standards and corresponding messages that define specific business
        # documents.
        @[JSON::Field(key: "ediType")]
        getter edi_type : Types::EdiType?

        # Returns that the currently supported file formats for EDI transformations are JSON and XML .
        @[JSON::Field(key: "fileFormat")]
        getter file_format : String?

        # Returns the InputConversion object, which contains the format options for the inbound
        # transformation.
        @[JSON::Field(key: "inputConversion")]
        getter input_conversion : Types::InputConversion?

        # Returns the structure that contains the mapping template and its language (either XSLT or JSONATA).
        @[JSON::Field(key: "mapping")]
        getter mapping : Types::Mapping?

        # Returns the mapping template for the transformer. This template is used to map the parsed EDI file
        # using JSONata or XSLT.
        @[JSON::Field(key: "mappingTemplate")]
        getter mapping_template : String?

        # Returns a timestamp for last time the transformer was modified.
        @[JSON::Field(key: "modifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        # Returns the OutputConversion object, which contains the format options for the outbound
        # transformation.
        @[JSON::Field(key: "outputConversion")]
        getter output_conversion : Types::OutputConversion?

        # Returns a sample EDI document that is used by a transformer as a guide for processing the EDI data.
        @[JSON::Field(key: "sampleDocument")]
        getter sample_document : String?

        # Returns a structure that contains the Amazon S3 bucket and an array of the corresponding keys used
        # to identify the location for your sample documents.
        @[JSON::Field(key: "sampleDocuments")]
        getter sample_documents : Types::SampleDocuments?

        def initialize(
          @created_at : Time,
          @name : String,
          @status : String,
          @transformer_arn : String,
          @transformer_id : String,
          @edi_type : Types::EdiType? = nil,
          @file_format : String? = nil,
          @input_conversion : Types::InputConversion? = nil,
          @mapping : Types::Mapping? = nil,
          @mapping_template : String? = nil,
          @modified_at : Time? = nil,
          @output_conversion : Types::OutputConversion? = nil,
          @sample_document : String? = nil,
          @sample_documents : Types::SampleDocuments? = nil
        )
        end
      end

      # Contains options for processing inbound EDI files. These options allow for customizing how incoming
      # EDI documents are processed.
      struct InboundEdiOptions
        include JSON::Serializable

        # A structure that contains X12-specific options for processing inbound X12 EDI files.
        @[JSON::Field(key: "x12")]
        getter x12 : Types::X12InboundEdiOptions?

        def initialize(
          @x12 : Types::X12InboundEdiOptions? = nil
        )
        end
      end

      # Contains the input formatting options for an inbound transformer (takes an X12-formatted EDI
      # document as input and converts it to JSON or XML.
      struct InputConversion
        include JSON::Serializable

        # The format for the transformer input: currently on X12 is supported.
        @[JSON::Field(key: "fromFormat")]
        getter from_format : String

        # Specifies advanced options for the input conversion process. These options provide additional
        # control over how EDI files are processed during transformation.
        @[JSON::Field(key: "advancedOptions")]
        getter advanced_options : Types::AdvancedOptions?

        # A structure that contains the formatting options for an inbound transformer.
        @[JSON::Field(key: "formatOptions")]
        getter format_options : Types::FormatOptions?

        def initialize(
          @from_format : String,
          @advanced_options : Types::AdvancedOptions? = nil,
          @format_options : Types::FormatOptions? = nil
        )
        end
      end

      # The input file to use for an outbound transformation.
      struct InputFileSource
        include JSON::Serializable

        # Specify the input contents, as a string, for the source of an outbound transformation.
        @[JSON::Field(key: "fileContent")]
        getter file_content : String?

        def initialize(
          @file_content : String? = nil
        )
        end
      end

      # This exception is thrown when an error occurs in the Amazon Web Services B2B Data Interchange
      # service.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The server attempts to retry a failed command.
        @[JSON::Field(key: "retryAfterSeconds")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      struct ListCapabilitiesRequest
        include JSON::Serializable

        # Specifies the maximum number of capabilities to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When additional results are obtained from the command, a NextToken parameter is returned in the
        # output. You can then pass the NextToken parameter in a subsequent command to continue listing
        # additional resources.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListCapabilitiesResponse
        include JSON::Serializable

        # Returns one or more capabilities associated with this partnership.
        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(Types::CapabilitySummary)

        # When additional results are obtained from the command, a NextToken parameter is returned in the
        # output. You can then pass the NextToken parameter in a subsequent command to continue listing
        # additional resources.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @capabilities : Array(Types::CapabilitySummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListPartnershipsRequest
        include JSON::Serializable

        # Specifies the maximum number of capabilities to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When additional results are obtained from the command, a NextToken parameter is returned in the
        # output. You can then pass the NextToken parameter in a subsequent command to continue listing
        # additional resources.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies the unique, system-generated identifier for the profile connected to this partnership.
        @[JSON::Field(key: "profileId")]
        getter profile_id : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @profile_id : String? = nil
        )
        end
      end

      struct ListPartnershipsResponse
        include JSON::Serializable

        # Specifies a list of your partnerships.
        @[JSON::Field(key: "partnerships")]
        getter partnerships : Array(Types::PartnershipSummary)

        # When additional results are obtained from the command, a NextToken parameter is returned in the
        # output. You can then pass the NextToken parameter in a subsequent command to continue listing
        # additional resources.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @partnerships : Array(Types::PartnershipSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListProfilesRequest
        include JSON::Serializable

        # Specifies the maximum number of profiles to return.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When additional results are obtained from the command, a NextToken parameter is returned in the
        # output. You can then pass the NextToken parameter in a subsequent command to continue listing
        # additional resources.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProfilesResponse
        include JSON::Serializable

        # Returns an array of ProfileSummary objects.
        @[JSON::Field(key: "profiles")]
        getter profiles : Array(Types::ProfileSummary)

        # When additional results are obtained from the command, a NextToken parameter is returned in the
        # output. You can then pass the NextToken parameter in a subsequent command to continue listing
        # additional resources.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @profiles : Array(Types::ProfileSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # Requests the tags associated with a particular Amazon Resource Name (ARN). An ARN is an identifier
        # for a specific Amazon Web Services resource, such as a capability, partnership, profile, or
        # transformer.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Returns the key-value pairs assigned to ARNs that you can use to group and search for resources by
        # type. You can attach this metadata to resources (capabilities, partnerships, and so on) for any
        # purpose.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ListTransformersRequest
        include JSON::Serializable

        # Specifies the number of items to return for the API response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # When additional results are obtained from the command, a NextToken parameter is returned in the
        # output. You can then pass the NextToken parameter in a subsequent command to continue listing
        # additional resources.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTransformersResponse
        include JSON::Serializable

        # Returns an array of one or more transformer objects. For each transformer, a TransformerSummary
        # object is returned. The TransformerSummary contains all the details for a specific transformer.
        @[JSON::Field(key: "transformers")]
        getter transformers : Array(Types::TransformerSummary)

        # When additional results are obtained from the command, a NextToken parameter is returned in the
        # output. You can then pass the NextToken parameter in a subsequent command to continue listing
        # additional resources.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @transformers : Array(Types::TransformerSummary),
          @next_token : String? = nil
        )
        end
      end

      # Specifies the mapping template for the transformer. This template is used to map the parsed EDI file
      # using JSONata or XSLT.
      struct Mapping
        include JSON::Serializable

        # The transformation language for the template, either XSLT or JSONATA.
        @[JSON::Field(key: "templateLanguage")]
        getter template_language : String

        # A string that represents the mapping template, in the transformation language specified in
        # templateLanguage .
        @[JSON::Field(key: "template")]
        getter template : String?

        def initialize(
          @template_language : String,
          @template : String? = nil
        )
        end
      end

      # A container for outbound EDI options.
      struct OutboundEdiOptions
        include JSON::Serializable

        # A structure that contains an X12 envelope structure.
        @[JSON::Field(key: "x12")]
        getter x12 : Types::X12Envelope?

        def initialize(
          @x12 : Types::X12Envelope? = nil
        )
        end
      end

      # Contains the formatting options for an outbound transformer (takes JSON or XML as input and converts
      # it to an EDI document (currently only X12 format is supported).
      struct OutputConversion
        include JSON::Serializable

        # The format for the output from an outbound transformer: only X12 is currently supported.
        @[JSON::Field(key: "toFormat")]
        getter to_format : String

        @[JSON::Field(key: "advancedOptions")]
        getter advanced_options : Types::AdvancedOptions?

        # A structure that contains the X12 transaction set and version for the transformer output.
        @[JSON::Field(key: "formatOptions")]
        getter format_options : Types::FormatOptions?

        def initialize(
          @to_format : String,
          @advanced_options : Types::AdvancedOptions? = nil,
          @format_options : Types::FormatOptions? = nil
        )
        end
      end

      # Container for the location of a sample file used for outbound transformations.
      struct OutputSampleFileSource
        include JSON::Serializable

        @[JSON::Field(key: "fileLocation")]
        getter file_location : Types::S3Location?

        def initialize(
          @file_location : Types::S3Location? = nil
        )
        end
      end

      # A structure that contains the details for a partnership. A partnership represents the connection
      # between you and your trading partner. It ties together a profile and one or more trading
      # capabilities.
      struct PartnershipSummary
        include JSON::Serializable

        # Returns a timestamp for creation date and time of the partnership.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # Returns the unique, system-generated identifier for a partnership.
        @[JSON::Field(key: "partnershipId")]
        getter partnership_id : String

        # Returns the unique, system-generated identifier for the profile connected to this partnership.
        @[JSON::Field(key: "profileId")]
        getter profile_id : String

        # Returns one or more capabilities associated with this partnership.
        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(String)?

        @[JSON::Field(key: "capabilityOptions")]
        getter capability_options : Types::CapabilityOptions?

        # Returns a timestamp that identifies the most recent date and time that the partnership was modified.
        @[JSON::Field(key: "modifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        # Returns the name of the partnership.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Returns the unique, system-generated identifier for a trading partner.
        @[JSON::Field(key: "tradingPartnerId")]
        getter trading_partner_id : String?

        def initialize(
          @created_at : Time,
          @partnership_id : String,
          @profile_id : String,
          @capabilities : Array(String)? = nil,
          @capability_options : Types::CapabilityOptions? = nil,
          @modified_at : Time? = nil,
          @name : String? = nil,
          @trading_partner_id : String? = nil
        )
        end
      end

      # Contains the details for a profile. A profile is the mechanism used to create the concept of a
      # private network.
      struct ProfileSummary
        include JSON::Serializable

        # Returns the name for the business associated with this profile.
        @[JSON::Field(key: "businessName")]
        getter business_name : String

        # Returns the timestamp for creation date and time of the profile.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # Returns the display name for profile.
        @[JSON::Field(key: "name")]
        getter name : String

        # Returns the unique, system-generated identifier for the profile.
        @[JSON::Field(key: "profileId")]
        getter profile_id : String

        # Returns the name of the logging group.
        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String?

        # Specifies whether or not logging is enabled for this profile.
        @[JSON::Field(key: "logging")]
        getter logging : String?

        # Returns the timestamp that identifies the most recent date and time that the profile was modified.
        @[JSON::Field(key: "modifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        def initialize(
          @business_name : String,
          @created_at : Time,
          @name : String,
          @profile_id : String,
          @log_group_name : String? = nil,
          @logging : String? = nil,
          @modified_at : Time? = nil
        )
        end
      end

      # Occurs when the requested resource does not exist, or cannot be found. In some cases, the resource
      # exists in a region other than the region specified in the API call.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Specifies the details for the Amazon S3 file location that is being used with Amazon Web Services
      # B2B Data Interchange. File locations in Amazon S3 are identified using a combination of the bucket
      # and key.
      struct S3Location
        include JSON::Serializable

        # Specifies the name of the Amazon S3 bucket.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?

        # Specifies the Amazon S3 key for the file location.
        @[JSON::Field(key: "key")]
        getter key : String?

        def initialize(
          @bucket_name : String? = nil,
          @key : String? = nil
        )
        end
      end

      # An array of the Amazon S3 keys used to identify the location for your sample documents.
      struct SampleDocumentKeys
        include JSON::Serializable

        # An array of keys for your input sample documents.
        @[JSON::Field(key: "input")]
        getter input : String?

        # An array of keys for your output sample documents.
        @[JSON::Field(key: "output")]
        getter output : String?

        def initialize(
          @input : String? = nil,
          @output : String? = nil
        )
        end
      end

      # Describes a structure that contains the Amazon S3 bucket and an array of the corresponding keys used
      # to identify the location for your sample documents.
      struct SampleDocuments
        include JSON::Serializable

        # Contains the Amazon S3 bucket that is used to hold your sample documents.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # Contains an array of the Amazon S3 keys used to identify the location for your sample documents.
        @[JSON::Field(key: "keys")]
        getter keys : Array(Types::SampleDocumentKeys)

        def initialize(
          @bucket_name : String,
          @keys : Array(Types::SampleDocumentKeys)
        )
        end
      end

      # Occurs when the calling command attempts to exceed one of the service quotas, for example trying to
      # create a capability when you already have the maximum number of capabilities allowed.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The quota that was exceeded, which caused the exception.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # The ID for the resource that exceeded the quota, which caused the exception.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The resource type (profile, partnership, transformer, or capability) that exceeded the quota, which
        # caused the exception.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The code responsible for exceeding the quota, which caused the exception.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        def initialize(
          @message : String,
          @quota_code : String,
          @resource_id : String,
          @resource_type : String,
          @service_code : String
        )
        end
      end

      struct StartTransformerJobRequest
        include JSON::Serializable

        # Specifies the location of the input file for the transformation. The location consists of an Amazon
        # S3 bucket and prefix.
        @[JSON::Field(key: "inputFile")]
        getter input_file : Types::S3Location

        # Specifies the location of the output file for the transformation. The location consists of an Amazon
        # S3 bucket and prefix.
        @[JSON::Field(key: "outputLocation")]
        getter output_location : Types::S3Location

        # Specifies the system-assigned unique identifier for the transformer.
        @[JSON::Field(key: "transformerId")]
        getter transformer_id : String

        # Reserved for future use.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @input_file : Types::S3Location,
          @output_location : Types::S3Location,
          @transformer_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct StartTransformerJobResponse
        include JSON::Serializable

        # Returns the unique, system-generated identifier for a transformer run.
        @[JSON::Field(key: "transformerJobId")]
        getter transformer_job_id : String

        def initialize(
          @transformer_job_id : String
        )
        end
      end

      # Creates a key-value pair for a specific resource. Tags are metadata that you can use to search for
      # and group a resource for various purposes. You can apply tags to capabilities, partnerships,
      # profiles and transformers. A tag key can take more than one value. For example, to group
      # capabilities for accounting purposes, you might create a tag called Group and assign the values
      # Research and Accounting to that group.
      struct Tag
        include JSON::Serializable

        # Specifies the name assigned to the tag that you create.
        @[JSON::Field(key: "Key")]
        getter key : String

        # Contains one or more values that you assigned to the key name that you create.
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

        # Specifies an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such as a
        # capability, partnership, profile, or transformer.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # Specifies the key-value pairs assigned to ARNs that you can use to group and search for resources by
        # type. You can attach this metadata to resources (capabilities, partnerships, and so on) for any
        # purpose.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      # A data structure that contains the information to use when generating a mapping template.
      struct TemplateDetails
        include JSON::Serializable

        @[JSON::Field(key: "x12")]
        getter x12 : Types::X12Details?

        def initialize(
          @x12 : Types::X12Details? = nil
        )
        end
      end

      struct TestConversionRequest
        include JSON::Serializable

        # Specify the source file for an outbound EDI request.
        @[JSON::Field(key: "source")]
        getter source : Types::ConversionSource

        # Specify the format (X12 is the only currently supported format), and other details for the
        # conversion target.
        @[JSON::Field(key: "target")]
        getter target : Types::ConversionTarget

        def initialize(
          @source : Types::ConversionSource,
          @target : Types::ConversionTarget
        )
        end
      end

      struct TestConversionResponse
        include JSON::Serializable

        # Returns the converted file content.
        @[JSON::Field(key: "convertedFileContent")]
        getter converted_file_content : String

        # Returns an array of validation messages that Amazon Web Services B2B Data Interchange generates
        # during the conversion process. These messages include both standard EDI validation results and
        # custom validation messages when custom validation rules are configured. Custom validation messages
        # provide detailed feedback on element length constraints, code list validations, and element
        # requirement checks applied during the outbound EDI generation process.
        @[JSON::Field(key: "validationMessages")]
        getter validation_messages : Array(String)?

        def initialize(
          @converted_file_content : String,
          @validation_messages : Array(String)? = nil
        )
        end
      end

      struct TestMappingRequest
        include JSON::Serializable

        # Specifies that the currently supported file formats for EDI transformations are JSON and XML .
        @[JSON::Field(key: "fileFormat")]
        getter file_format : String

        # Specify the contents of the EDI (electronic data interchange) XML or JSON file that is used as input
        # for the transform.
        @[JSON::Field(key: "inputFileContent")]
        getter input_file_content : String

        # Specifies the mapping template for the transformer. This template is used to map the parsed EDI file
        # using JSONata or XSLT. This parameter is available for backwards compatibility. Use the Mapping data
        # type instead.
        @[JSON::Field(key: "mappingTemplate")]
        getter mapping_template : String

        def initialize(
          @file_format : String,
          @input_file_content : String,
          @mapping_template : String
        )
        end
      end

      struct TestMappingResponse
        include JSON::Serializable

        # Returns a string for the mapping that can be used to identify the mapping. Similar to a fingerprint
        @[JSON::Field(key: "mappedFileContent")]
        getter mapped_file_content : String

        def initialize(
          @mapped_file_content : String
        )
        end
      end

      struct TestParsingRequest
        include JSON::Serializable

        # Specifies the details for the EDI standard that is being used for the transformer. Currently, only
        # X12 is supported. X12 is a set of standards and corresponding messages that define specific business
        # documents.
        @[JSON::Field(key: "ediType")]
        getter edi_type : Types::EdiType

        # Specifies that the currently supported file formats for EDI transformations are JSON and XML .
        @[JSON::Field(key: "fileFormat")]
        getter file_format : String

        # Specifies an S3Location object, which contains the Amazon S3 bucket and prefix for the location of
        # the input file.
        @[JSON::Field(key: "inputFile")]
        getter input_file : Types::S3Location

        # Specifies advanced options for parsing the input EDI file. These options allow for more granular
        # control over the parsing process, including split options for X12 files.
        @[JSON::Field(key: "advancedOptions")]
        getter advanced_options : Types::AdvancedOptions?

        def initialize(
          @edi_type : Types::EdiType,
          @file_format : String,
          @input_file : Types::S3Location,
          @advanced_options : Types::AdvancedOptions? = nil
        )
        end
      end

      struct TestParsingResponse
        include JSON::Serializable

        # Returns the contents of the input file being tested, parsed according to the specified EDI
        # (electronic data interchange) type.
        @[JSON::Field(key: "parsedFileContent")]
        getter parsed_file_content : String

        # Returns an array of parsed file contents when the input file is split according to the specified
        # split options. Each element in the array represents a separate split file's parsed content.
        @[JSON::Field(key: "parsedSplitFileContents")]
        getter parsed_split_file_contents : Array(String)?

        # Returns an array of validation messages generated during EDI validation. These messages provide
        # detailed information about validation errors, warnings, or confirmations based on the configured X12
        # validation rules such as element length constraints, code list validations, and element requirement
        # checks. This field is populated when the TestParsing API validates EDI documents.
        @[JSON::Field(key: "validationMessages")]
        getter validation_messages : Array(String)?

        def initialize(
          @parsed_file_content : String,
          @parsed_split_file_contents : Array(String)? = nil,
          @validation_messages : Array(String)? = nil
        )
        end
      end

      # The request was denied due to throttling: the data speed and rendering may be limited depending on
      # various parameters and conditions.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The server attempts to retry a command that was throttled.
        @[JSON::Field(key: "retryAfterSeconds")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # Contains the details for a transformer object. A transformer can take an EDI file as input and
      # transform it into a JSON-or XML-formatted document. Alternatively, a transformer can take a JSON-or
      # XML-formatted document as input and transform it into an EDI file.
      struct TransformerSummary
        include JSON::Serializable

        # Returns a timestamp indicating when the transformer was created. For example,
        # 2023-07-20T19:58:44.624Z .
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # Returns the descriptive name for the transformer.
        @[JSON::Field(key: "name")]
        getter name : String

        # Returns the state of the newly created transformer. The transformer can be either active or inactive
        # . For the transformer to be used in a capability, its status must active .
        @[JSON::Field(key: "status")]
        getter status : String

        # Returns the system-assigned unique identifier for the transformer.
        @[JSON::Field(key: "transformerId")]
        getter transformer_id : String

        # Returns the details for the EDI standard that is being used for the transformer. Currently, only X12
        # is supported. X12 is a set of standards and corresponding messages that define specific business
        # documents.
        @[JSON::Field(key: "ediType")]
        getter edi_type : Types::EdiType?

        # Returns that the currently supported file formats for EDI transformations are JSON and XML .
        @[JSON::Field(key: "fileFormat")]
        getter file_format : String?

        # Returns a structure that contains the format options for the transformation.
        @[JSON::Field(key: "inputConversion")]
        getter input_conversion : Types::InputConversion?

        # Returns the structure that contains the mapping template and its language (either XSLT or JSONATA).
        @[JSON::Field(key: "mapping")]
        getter mapping : Types::Mapping?

        # Returns the mapping template for the transformer. This template is used to map the parsed EDI file
        # using JSONata or XSLT.
        @[JSON::Field(key: "mappingTemplate")]
        getter mapping_template : String?

        # Returns a timestamp representing the date and time for the most recent change for the transformer
        # object.
        @[JSON::Field(key: "modifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        # Returns the OutputConversion object, which contains the format options for the outbound
        # transformation.
        @[JSON::Field(key: "outputConversion")]
        getter output_conversion : Types::OutputConversion?

        # Returns a sample EDI document that is used by a transformer as a guide for processing the EDI data.
        @[JSON::Field(key: "sampleDocument")]
        getter sample_document : String?

        # Returns a structure that contains the Amazon S3 bucket and an array of the corresponding keys used
        # to identify the location for your sample documents.
        @[JSON::Field(key: "sampleDocuments")]
        getter sample_documents : Types::SampleDocuments?

        def initialize(
          @created_at : Time,
          @name : String,
          @status : String,
          @transformer_id : String,
          @edi_type : Types::EdiType? = nil,
          @file_format : String? = nil,
          @input_conversion : Types::InputConversion? = nil,
          @mapping : Types::Mapping? = nil,
          @mapping_template : String? = nil,
          @modified_at : Time? = nil,
          @output_conversion : Types::OutputConversion? = nil,
          @sample_document : String? = nil,
          @sample_documents : Types::SampleDocuments? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # Specifies an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such as a
        # capability, partnership, profile, or transformer.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # Specifies the key-value pairs assigned to ARNs that you can use to group and search for resources by
        # type. You can attach this metadata to resources (capabilities, partnerships, and so on) for any
        # purpose.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UpdateCapabilityRequest
        include JSON::Serializable

        # Specifies a system-assigned unique identifier for the capability.
        @[JSON::Field(key: "capabilityId")]
        getter capability_id : String

        # Specifies a structure that contains the details for a capability.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::CapabilityConfiguration?

        # Specifies one or more locations in Amazon S3, each specifying an EDI document that can be used with
        # this capability. Each item contains the name of the bucket and the key, to identify the document's
        # location.
        @[JSON::Field(key: "instructionsDocuments")]
        getter instructions_documents : Array(Types::S3Location)?

        # Specifies a new name for the capability, to replace the existing name.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @capability_id : String,
          @configuration : Types::CapabilityConfiguration? = nil,
          @instructions_documents : Array(Types::S3Location)? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdateCapabilityResponse
        include JSON::Serializable

        # Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such as a
        # capability, partnership, profile, or transformer.
        @[JSON::Field(key: "capabilityArn")]
        getter capability_arn : String

        # Returns a system-assigned unique identifier for the capability.
        @[JSON::Field(key: "capabilityId")]
        getter capability_id : String

        # Returns a structure that contains the details for a capability.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::CapabilityConfiguration

        # Returns a timestamp for creation date and time of the capability.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # Returns the name of the capability, used to identify it.
        @[JSON::Field(key: "name")]
        getter name : String

        # Returns the type of the capability. Currently, only edi is supported.
        @[JSON::Field(key: "type")]
        getter type : String

        # Returns one or more locations in Amazon S3, each specifying an EDI document that can be used with
        # this capability. Each item contains the name of the bucket and the key, to identify the document's
        # location.
        @[JSON::Field(key: "instructionsDocuments")]
        getter instructions_documents : Array(Types::S3Location)?

        # Returns a timestamp for last time the capability was modified.
        @[JSON::Field(key: "modifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        def initialize(
          @capability_arn : String,
          @capability_id : String,
          @configuration : Types::CapabilityConfiguration,
          @created_at : Time,
          @name : String,
          @type : String,
          @instructions_documents : Array(Types::S3Location)? = nil,
          @modified_at : Time? = nil
        )
        end
      end

      struct UpdatePartnershipRequest
        include JSON::Serializable

        # Specifies the unique, system-generated identifier for a partnership.
        @[JSON::Field(key: "partnershipId")]
        getter partnership_id : String

        # List of the capabilities associated with this partnership.
        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(String)?

        # To update, specify the structure that contains the details for the associated capabilities.
        @[JSON::Field(key: "capabilityOptions")]
        getter capability_options : Types::CapabilityOptions?

        # The name of the partnership, used to identify it.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @partnership_id : String,
          @capabilities : Array(String)? = nil,
          @capability_options : Types::CapabilityOptions? = nil,
          @name : String? = nil
        )
        end
      end

      struct UpdatePartnershipResponse
        include JSON::Serializable

        # Returns a timestamp that identifies the most recent date and time that the partnership was modified.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such as a
        # capability, partnership, profile, or transformer.
        @[JSON::Field(key: "partnershipArn")]
        getter partnership_arn : String

        # Returns the unique, system-generated identifier for a partnership.
        @[JSON::Field(key: "partnershipId")]
        getter partnership_id : String

        # Returns the unique, system-generated identifier for the profile connected to this partnership.
        @[JSON::Field(key: "profileId")]
        getter profile_id : String

        # Returns one or more capabilities associated with this partnership.
        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(String)?

        # Returns the structure that contains the details for the associated capabilities.
        @[JSON::Field(key: "capabilityOptions")]
        getter capability_options : Types::CapabilityOptions?

        # Returns the email address associated with this trading partner.
        @[JSON::Field(key: "email")]
        getter email : String?

        # Returns a timestamp that identifies the most recent date and time that the partnership was modified.
        @[JSON::Field(key: "modifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        # The name of the partnership, used to identify it.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Returns the phone number associated with the partnership.
        @[JSON::Field(key: "phone")]
        getter phone : String?

        # Returns the unique, system-generated identifier for a trading partner.
        @[JSON::Field(key: "tradingPartnerId")]
        getter trading_partner_id : String?

        def initialize(
          @created_at : Time,
          @partnership_arn : String,
          @partnership_id : String,
          @profile_id : String,
          @capabilities : Array(String)? = nil,
          @capability_options : Types::CapabilityOptions? = nil,
          @email : String? = nil,
          @modified_at : Time? = nil,
          @name : String? = nil,
          @phone : String? = nil,
          @trading_partner_id : String? = nil
        )
        end
      end

      struct UpdateProfileRequest
        include JSON::Serializable

        # Specifies the unique, system-generated identifier for the profile.
        @[JSON::Field(key: "profileId")]
        getter profile_id : String

        # Specifies the name for the business associated with this profile.
        @[JSON::Field(key: "businessName")]
        getter business_name : String?

        # Specifies the email address associated with this customer profile.
        @[JSON::Field(key: "email")]
        getter email : String?

        # The name of the profile, used to identify it.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Specifies the phone number associated with the profile.
        @[JSON::Field(key: "phone")]
        getter phone : String?

        def initialize(
          @profile_id : String,
          @business_name : String? = nil,
          @email : String? = nil,
          @name : String? = nil,
          @phone : String? = nil
        )
        end
      end

      struct UpdateProfileResponse
        include JSON::Serializable

        # Returns the name for the business associated with this profile.
        @[JSON::Field(key: "businessName")]
        getter business_name : String

        # Returns a timestamp for creation date and time of the profile.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # Returns the name of the profile.
        @[JSON::Field(key: "name")]
        getter name : String

        # Returns the phone number associated with the profile.
        @[JSON::Field(key: "phone")]
        getter phone : String

        # Returns an Amazon Resource Name (ARN) for the profile.
        @[JSON::Field(key: "profileArn")]
        getter profile_arn : String

        # Returns the unique, system-generated identifier for the profile.
        @[JSON::Field(key: "profileId")]
        getter profile_id : String

        # Returns the email address associated with this customer profile.
        @[JSON::Field(key: "email")]
        getter email : String?

        # Returns the name of the logging group.
        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String?

        # Specifies whether or not logging is enabled for this profile.
        @[JSON::Field(key: "logging")]
        getter logging : String?

        # Returns a timestamp for last time the profile was modified.
        @[JSON::Field(key: "modifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        def initialize(
          @business_name : String,
          @created_at : Time,
          @name : String,
          @phone : String,
          @profile_arn : String,
          @profile_id : String,
          @email : String? = nil,
          @log_group_name : String? = nil,
          @logging : String? = nil,
          @modified_at : Time? = nil
        )
        end
      end

      struct UpdateTransformerRequest
        include JSON::Serializable

        # Specifies the system-assigned unique identifier for the transformer.
        @[JSON::Field(key: "transformerId")]
        getter transformer_id : String

        # Specifies the details for the EDI standard that is being used for the transformer. Currently, only
        # X12 is supported. X12 is a set of standards and corresponding messages that define specific business
        # documents.
        @[JSON::Field(key: "ediType")]
        getter edi_type : Types::EdiType?

        # Specifies that the currently supported file formats for EDI transformations are JSON and XML .
        @[JSON::Field(key: "fileFormat")]
        getter file_format : String?

        # To update, specify the InputConversion object, which contains the format options for the inbound
        # transformation.
        @[JSON::Field(key: "inputConversion")]
        getter input_conversion : Types::InputConversion?

        # Specify the structure that contains the mapping template and its language (either XSLT or JSONATA).
        @[JSON::Field(key: "mapping")]
        getter mapping : Types::Mapping?

        # Specifies the mapping template for the transformer. This template is used to map the parsed EDI file
        # using JSONata or XSLT. This parameter is available for backwards compatibility. Use the Mapping data
        # type instead.
        @[JSON::Field(key: "mappingTemplate")]
        getter mapping_template : String?

        # Specify a new name for the transformer, if you want to update it.
        @[JSON::Field(key: "name")]
        getter name : String?

        # To update, specify the OutputConversion object, which contains the format options for the outbound
        # transformation.
        @[JSON::Field(key: "outputConversion")]
        getter output_conversion : Types::OutputConversion?

        # Specifies a sample EDI document that is used by a transformer as a guide for processing the EDI
        # data.
        @[JSON::Field(key: "sampleDocument")]
        getter sample_document : String?

        # Specify a structure that contains the Amazon S3 bucket and an array of the corresponding keys used
        # to identify the location for your sample documents.
        @[JSON::Field(key: "sampleDocuments")]
        getter sample_documents : Types::SampleDocuments?

        # Specifies the transformer's status. You can update the state of the transformer from inactive to
        # active .
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @transformer_id : String,
          @edi_type : Types::EdiType? = nil,
          @file_format : String? = nil,
          @input_conversion : Types::InputConversion? = nil,
          @mapping : Types::Mapping? = nil,
          @mapping_template : String? = nil,
          @name : String? = nil,
          @output_conversion : Types::OutputConversion? = nil,
          @sample_document : String? = nil,
          @sample_documents : Types::SampleDocuments? = nil,
          @status : String? = nil
        )
        end
      end

      struct UpdateTransformerResponse
        include JSON::Serializable

        # Returns a timestamp for creation date and time of the transformer.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # Returns a timestamp for last time the transformer was modified.
        @[JSON::Field(key: "modifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time

        # Returns the name of the transformer.
        @[JSON::Field(key: "name")]
        getter name : String

        # Returns the state of the newly created transformer. The transformer can be either active or inactive
        # . For the transformer to be used in a capability, its status must active .
        @[JSON::Field(key: "status")]
        getter status : String

        # Returns an Amazon Resource Name (ARN) for a specific Amazon Web Services resource, such as a
        # capability, partnership, profile, or transformer.
        @[JSON::Field(key: "transformerArn")]
        getter transformer_arn : String

        # Returns the system-assigned unique identifier for the transformer.
        @[JSON::Field(key: "transformerId")]
        getter transformer_id : String

        # Returns the details for the EDI standard that is being used for the transformer. Currently, only X12
        # is supported. X12 is a set of standards and corresponding messages that define specific business
        # documents.
        @[JSON::Field(key: "ediType")]
        getter edi_type : Types::EdiType?

        # Returns that the currently supported file formats for EDI transformations are JSON and XML .
        @[JSON::Field(key: "fileFormat")]
        getter file_format : String?

        # Returns the InputConversion object, which contains the format options for the inbound
        # transformation.
        @[JSON::Field(key: "inputConversion")]
        getter input_conversion : Types::InputConversion?

        # Returns the structure that contains the mapping template and its language (either XSLT or JSONATA).
        @[JSON::Field(key: "mapping")]
        getter mapping : Types::Mapping?

        # Returns the mapping template for the transformer. This template is used to map the parsed EDI file
        # using JSONata or XSLT.
        @[JSON::Field(key: "mappingTemplate")]
        getter mapping_template : String?

        # Returns the OutputConversion object, which contains the format options for the outbound
        # transformation.
        @[JSON::Field(key: "outputConversion")]
        getter output_conversion : Types::OutputConversion?

        # Returns a sample EDI document that is used by a transformer as a guide for processing the EDI data.
        @[JSON::Field(key: "sampleDocument")]
        getter sample_document : String?

        # Returns a structure that contains the Amazon S3 bucket and an array of the corresponding keys used
        # to identify the location for your sample documents.
        @[JSON::Field(key: "sampleDocuments")]
        getter sample_documents : Types::SampleDocuments?

        def initialize(
          @created_at : Time,
          @modified_at : Time,
          @name : String,
          @status : String,
          @transformer_arn : String,
          @transformer_id : String,
          @edi_type : Types::EdiType? = nil,
          @file_format : String? = nil,
          @input_conversion : Types::InputConversion? = nil,
          @mapping : Types::Mapping? = nil,
          @mapping_template : String? = nil,
          @output_conversion : Types::OutputConversion? = nil,
          @sample_document : String? = nil,
          @sample_documents : Types::SampleDocuments? = nil
        )
        end
      end

      # Occurs when a B2BI object cannot be validated against a request from another object. This exception
      # can be thrown during standard EDI validation or when custom validation rules fail, such as when
      # element length constraints are violated, invalid codes are used in code list validations, or
      # required elements are missing based on configured element requirement rules.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Contains options for wrapping (line folding) in X12 EDI files. Wrapping controls how long lines are
      # handled in the EDI output.
      struct WrapOptions
        include JSON::Serializable

        # Specifies the method used for wrapping lines in the EDI output. Valid values: SEGMENT : Wraps by
        # segment. ONE_LINE : Indicates that the entire content is on a single line. When you specify ONE_LINE
        # , do not provide either the line length nor the line terminator value. LINE_LENGTH : Wraps by
        # character count, as specified by lineLength value.
        @[JSON::Field(key: "wrapBy")]
        getter wrap_by : String

        # Specifies the maximum length of a line before wrapping occurs. This value is used when wrapBy is set
        # to LINE_LENGTH .
        @[JSON::Field(key: "lineLength")]
        getter line_length : Int32?

        # Specifies the character sequence used to terminate lines when wrapping. Valid values: CRLF :
        # carriage return and line feed LF : line feed) CR : carriage return
        @[JSON::Field(key: "lineTerminator")]
        getter line_terminator : String?

        def initialize(
          @wrap_by : String,
          @line_length : Int32? = nil,
          @line_terminator : String? = nil
        )
        end
      end

      # Contains options for configuring X12 acknowledgments. These options control how functional and
      # technical acknowledgments are handled.
      struct X12AcknowledgmentOptions
        include JSON::Serializable

        # Specifies whether functional acknowledgments (997/999) should be generated for incoming X12
        # transactions. Valid values are DO_NOT_GENERATE , GENERATE_ALL_SEGMENTS and
        # GENERATE_WITHOUT_TRANSACTION_SET_RESPONSE_LOOP . If you choose
        # GENERATE_WITHOUT_TRANSACTION_SET_RESPONSE_LOOP , Amazon Web Services B2B Data Interchange skips the
        # AK2_Loop when generating an acknowledgment document.
        @[JSON::Field(key: "functionalAcknowledgment")]
        getter functional_acknowledgment : String

        # Specifies whether technical acknowledgments (TA1) should be generated for incoming X12 interchanges.
        # Valid values are DO_NOT_GENERATE and GENERATE_ALL_SEGMENTS and.
        @[JSON::Field(key: "technicalAcknowledgment")]
        getter technical_acknowledgment : String

        def initialize(
          @functional_acknowledgment : String,
          @technical_acknowledgment : String
        )
        end
      end

      # Contains advanced options specific to X12 EDI processing, such as splitting large X12 files into
      # smaller units.
      struct X12AdvancedOptions
        include JSON::Serializable

        # Specifies options for splitting X12 EDI files. These options control how large X12 files are divided
        # into smaller, more manageable units.
        @[JSON::Field(key: "splitOptions")]
        getter split_options : Types::X12SplitOptions?

        # Specifies validation options for X12 EDI processing. These options control how validation rules are
        # applied during EDI document processing, including custom validation rules for element length
        # constraints, code list validations, and element requirement checks.
        @[JSON::Field(key: "validationOptions")]
        getter validation_options : Types::X12ValidationOptions?

        def initialize(
          @split_options : Types::X12SplitOptions? = nil,
          @validation_options : Types::X12ValidationOptions? = nil
        )
        end
      end

      # Defines a validation rule that modifies the allowed code values for a specific X12 element. This
      # rule allows you to add or remove valid codes from an element's standard code list, providing
      # flexibility to accommodate trading partner-specific requirements or industry variations. You can
      # specify codes to add to expand the allowed values beyond the X12 standard, or codes to remove to
      # restrict the allowed values for stricter validation.
      struct X12CodeListValidationRule
        include JSON::Serializable

        # Specifies the four-digit element ID to which the code list modifications apply. This identifies
        # which X12 element will have its allowed code values modified.
        @[JSON::Field(key: "elementId")]
        getter element_id : String

        # Specifies a list of code values to add to the element's allowed values. These codes will be
        # considered valid for the specified element in addition to the standard codes defined by the X12
        # specification.
        @[JSON::Field(key: "codesToAdd")]
        getter codes_to_add : Array(String)?

        # Specifies a list of code values to remove from the element's allowed values. These codes will be
        # considered invalid for the specified element, even if they are part of the standard codes defined by
        # the X12 specification.
        @[JSON::Field(key: "codesToRemove")]
        getter codes_to_remove : Array(String)?

        def initialize(
          @element_id : String,
          @codes_to_add : Array(String)? = nil,
          @codes_to_remove : Array(String)? = nil
        )
        end
      end

      # Contains configuration for X12 control numbers used in X12 EDI generation. Control numbers are used
      # to uniquely identify interchanges, functional groups, and transaction sets.
      struct X12ControlNumbers
        include JSON::Serializable

        # Specifies the starting functional group control number (GS06) to use for X12 EDI generation. This
        # number is incremented for each new functional group. For the GS (functional group) envelope, Amazon
        # Web Services B2B Data Interchange generates a functional group control number that is unique to the
        # sender ID, receiver ID, and functional identifier code combination.
        @[JSON::Field(key: "startingFunctionalGroupControlNumber")]
        getter starting_functional_group_control_number : Int32?

        # Specifies the starting interchange control number (ISA13) to use for X12 EDI generation. This number
        # is incremented for each new interchange. For the ISA (interchange) envelope, Amazon Web Services B2B
        # Data Interchange generates an interchange control number that is unique for the ISA05 and ISA06
        # (sender) &amp; ISA07 and ISA08 (receiver) combination.
        @[JSON::Field(key: "startingInterchangeControlNumber")]
        getter starting_interchange_control_number : Int32?

        # Specifies the starting transaction set control number (ST02) to use for X12 EDI generation. This
        # number is incremented for each new transaction set.
        @[JSON::Field(key: "startingTransactionSetControlNumber")]
        getter starting_transaction_set_control_number : Int32?

        def initialize(
          @starting_functional_group_control_number : Int32? = nil,
          @starting_interchange_control_number : Int32? = nil,
          @starting_transaction_set_control_number : Int32? = nil
        )
        end
      end

      # In X12 EDI messages, delimiters are used to mark the end of segments or elements, and are defined in
      # the interchange control header. The delimiters are part of the message's syntax and divide up its
      # different elements.
      struct X12Delimiters
        include JSON::Serializable

        # The component, or sub-element, separator. The default value is : (colon).
        @[JSON::Field(key: "componentSeparator")]
        getter component_separator : String?

        # The data element separator. The default value is * (asterisk).
        @[JSON::Field(key: "dataElementSeparator")]
        getter data_element_separator : String?

        # The segment terminator. The default value is ~ (tilde).
        @[JSON::Field(key: "segmentTerminator")]
        getter segment_terminator : String?

        def initialize(
          @component_separator : String? = nil,
          @data_element_separator : String? = nil,
          @segment_terminator : String? = nil
        )
        end
      end

      # A structure that contains the X12 transaction set and version. The X12 structure is used when the
      # system transforms an EDI (electronic data interchange) file. If an EDI input file contains more than
      # one transaction, each transaction must have the same transaction set and version, for example
      # 214/4010. If not, the transformer cannot parse the file.
      struct X12Details
        include JSON::Serializable

        # Returns an enumerated type where each value identifies an X12 transaction set. Transaction sets are
        # maintained by the X12 Accredited Standards Committee.
        @[JSON::Field(key: "transactionSet")]
        getter transaction_set : String?

        # Returns the version to use for the specified X12 transaction set.
        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @transaction_set : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Defines a validation rule that specifies custom length constraints for a specific X12 element. This
      # rule allows you to override the standard minimum and maximum length requirements for an element,
      # enabling validation of trading partner-specific length requirements that may differ from the X12
      # specification. Both minimum and maximum length values must be specified and must be between 1 and
      # 200 characters.
      struct X12ElementLengthValidationRule
        include JSON::Serializable

        # Specifies the four-digit element ID to which the length constraints will be applied. This identifies
        # which X12 element will have its length requirements modified.
        @[JSON::Field(key: "elementId")]
        getter element_id : String

        # Specifies the maximum allowed length for the identified element. This value must be between 1 and
        # 200 characters and defines the upper limit for the element's content length.
        @[JSON::Field(key: "maxLength")]
        getter max_length : Int32

        # Specifies the minimum required length for the identified element. This value must be between 1 and
        # 200 characters and defines the lower limit for the element's content length.
        @[JSON::Field(key: "minLength")]
        getter min_length : Int32

        def initialize(
          @element_id : String,
          @max_length : Int32,
          @min_length : Int32
        )
        end
      end

      # Defines a validation rule that modifies the requirement status of a specific X12 element within a
      # segment. This rule allows you to make optional elements mandatory or mandatory elements optional,
      # providing flexibility to accommodate different trading partner requirements and business rules. The
      # rule targets a specific element position within a segment and sets its requirement status to either
      # OPTIONAL or MANDATORY.
      struct X12ElementRequirementValidationRule
        include JSON::Serializable

        # Specifies the position of the element within an X12 segment for which the requirement status will be
        # modified. The format follows the pattern of segment identifier followed by element position (e.g.,
        # "ST-01" for the first element of the ST segment).
        @[JSON::Field(key: "elementPosition")]
        getter element_position : String

        # Specifies the requirement status for the element at the specified position. Valid values are
        # OPTIONAL (the element may be omitted) or MANDATORY (the element must be present).
        @[JSON::Field(key: "requirement")]
        getter requirement : String

        def initialize(
          @element_position : String,
          @requirement : String
        )
        end
      end

      # A wrapper structure for an X12 definition object. the X12 envelope ensures the integrity of the data
      # and the efficiency of the information exchange. The X12 message structure has hierarchical levels.
      # From highest to the lowest, they are: Interchange Envelope Functional Group Transaction Set
      struct X12Envelope
        include JSON::Serializable

        # A container for the X12 outbound EDI headers.
        @[JSON::Field(key: "common")]
        getter common : Types::X12OutboundEdiHeaders?

        @[JSON::Field(key: "wrapOptions")]
        getter wrap_options : Types::WrapOptions?

        def initialize(
          @common : Types::X12OutboundEdiHeaders? = nil,
          @wrap_options : Types::WrapOptions? = nil
        )
        end
      end

      # Part of the X12 message structure. These are the functional group headers for the X12 EDI object.
      struct X12FunctionalGroupHeaders
        include JSON::Serializable

        # A value representing the code used to identify the party receiving a message, at position GS-03.
        @[JSON::Field(key: "applicationReceiverCode")]
        getter application_receiver_code : String?

        # A value representing the code used to identify the party transmitting a message, at position GS-02.
        @[JSON::Field(key: "applicationSenderCode")]
        getter application_sender_code : String?

        # A code that identifies the issuer of the standard, at position GS-07.
        @[JSON::Field(key: "responsibleAgencyCode")]
        getter responsible_agency_code : String?

        def initialize(
          @application_receiver_code : String? = nil,
          @application_sender_code : String? = nil,
          @responsible_agency_code : String? = nil
        )
        end
      end

      # Contains options specific to processing inbound X12 EDI files.
      struct X12InboundEdiOptions
        include JSON::Serializable

        # Specifies acknowledgment options for inbound X12 EDI files. These options control how functional and
        # technical acknowledgments are handled.
        @[JSON::Field(key: "acknowledgmentOptions")]
        getter acknowledgment_options : Types::X12AcknowledgmentOptions?

        def initialize(
          @acknowledgment_options : Types::X12AcknowledgmentOptions? = nil
        )
        end
      end

      # In X12, the Interchange Control Header is the first segment of an EDI document and is part of the
      # Interchange Envelope. It contains information about the sender and receiver, the date and time of
      # transmission, and the X12 version being used. It also includes delivery information, such as the
      # sender and receiver IDs.
      struct X12InterchangeControlHeaders
        include JSON::Serializable

        # Located at position ISA-14 in the header. The value "1" indicates that the sender is requesting an
        # interchange acknowledgment at receipt of the interchange. The value "0" is used otherwise.
        @[JSON::Field(key: "acknowledgmentRequestedCode")]
        getter acknowledgment_requested_code : String?

        # Located at position ISA-08 in the header. This value (along with the receiverIdQualifier )
        # identifies the intended recipient of the interchange.
        @[JSON::Field(key: "receiverId")]
        getter receiver_id : String?

        # Located at position ISA-07 in the header. Qualifier for the receiver ID. Together, the ID and
        # qualifier uniquely identify the receiving trading partner.
        @[JSON::Field(key: "receiverIdQualifier")]
        getter receiver_id_qualifier : String?

        # Located at position ISA-11 in the header. This string makes it easier when you need to group similar
        # adjacent element values together without using extra segments. This parameter is only honored for
        # version greater than 401 ( VERSION_4010 and higher). For versions less than 401, this field is
        # called StandardsId , in which case our service sets the value to U .
        @[JSON::Field(key: "repetitionSeparator")]
        getter repetition_separator : String?

        # Located at position ISA-06 in the header. This value (along with the senderIdQualifier ) identifies
        # the sender of the interchange.
        @[JSON::Field(key: "senderId")]
        getter sender_id : String?

        # Located at position ISA-05 in the header. Qualifier for the sender ID. Together, the ID and
        # qualifier uniquely identify the sending trading partner.
        @[JSON::Field(key: "senderIdQualifier")]
        getter sender_id_qualifier : String?

        # Located at position ISA-15 in the header. Specifies how this interchange is being used: T indicates
        # this interchange is for testing. P indicates this interchange is for production. I indicates this
        # interchange is informational.
        @[JSON::Field(key: "usageIndicatorCode")]
        getter usage_indicator_code : String?

        def initialize(
          @acknowledgment_requested_code : String? = nil,
          @receiver_id : String? = nil,
          @receiver_id_qualifier : String? = nil,
          @repetition_separator : String? = nil,
          @sender_id : String? = nil,
          @sender_id_qualifier : String? = nil,
          @usage_indicator_code : String? = nil
        )
        end
      end

      # A structure containing the details for an outbound EDI object.
      struct X12OutboundEdiHeaders
        include JSON::Serializable

        # Specifies control number configuration for outbound X12 EDI headers. These settings determine the
        # starting values for interchange, functional group, and transaction set control numbers.
        @[JSON::Field(key: "controlNumbers")]
        getter control_numbers : Types::X12ControlNumbers?

        # The delimiters, for example semicolon ( ; ), that separates sections of the headers for the X12
        # object.
        @[JSON::Field(key: "delimiters")]
        getter delimiters : Types::X12Delimiters?

        # The functional group headers for the X12 object.
        @[JSON::Field(key: "functionalGroupHeaders")]
        getter functional_group_headers : Types::X12FunctionalGroupHeaders?

        @[JSON::Field(key: "gs05TimeFormat")]
        getter gs05_time_format : String?

        # In X12 EDI messages, delimiters are used to mark the end of segments or elements, and are defined in
        # the interchange control header.
        @[JSON::Field(key: "interchangeControlHeaders")]
        getter interchange_control_headers : Types::X12InterchangeControlHeaders?

        # Specifies whether or not to validate the EDI for this X12 object: TRUE or FALSE . When enabled, this
        # performs both standard EDI validation and applies any configured custom validation rules including
        # element length constraints, code list validations, and element requirement checks. Validation
        # results are returned in the response validation messages.
        @[JSON::Field(key: "validateEdi")]
        getter validate_edi : Bool?

        def initialize(
          @control_numbers : Types::X12ControlNumbers? = nil,
          @delimiters : Types::X12Delimiters? = nil,
          @functional_group_headers : Types::X12FunctionalGroupHeaders? = nil,
          @gs05_time_format : String? = nil,
          @interchange_control_headers : Types::X12InterchangeControlHeaders? = nil,
          @validate_edi : Bool? = nil
        )
        end
      end

      # Contains options for splitting X12 EDI files into smaller units. This is useful for processing large
      # EDI files more efficiently.
      struct X12SplitOptions
        include JSON::Serializable

        # Specifies the method used to split X12 EDI files. Valid values include TRANSACTION (split by
        # individual transaction sets), or NONE (no splitting).
        @[JSON::Field(key: "splitBy")]
        getter split_by : String

        def initialize(
          @split_by : String
        )
        end
      end

      # Contains configuration options for X12 EDI validation. This structure allows you to specify custom
      # validation rules that will be applied during EDI document processing, including element length
      # constraints, code list modifications, and element requirement changes. These validation options
      # provide flexibility to accommodate trading partner-specific requirements while maintaining EDI
      # compliance. The validation rules are applied in addition to standard X12 validation to ensure
      # documents meet both standard and custom requirements.
      struct X12ValidationOptions
        include JSON::Serializable

        # Specifies a list of validation rules to apply during EDI document processing. These rules can
        # include code list modifications, element length constraints, and element requirement changes.
        @[JSON::Field(key: "validationRules")]
        getter validation_rules : Array(Types::X12ValidationRule)?

        def initialize(
          @validation_rules : Array(Types::X12ValidationRule)? = nil
        )
        end
      end

      # Represents a single validation rule that can be applied during X12 EDI processing. This is a union
      # type that can contain one of several specific validation rule types: code list validation rules for
      # modifying allowed element codes, element length validation rules for enforcing custom length
      # constraints, or element requirement validation rules for changing mandatory/optional status. Each
      # validation rule targets specific aspects of EDI document validation to ensure compliance with
      # trading partner requirements and business rules.
      struct X12ValidationRule
        include JSON::Serializable

        # Specifies a code list validation rule that modifies the allowed code values for a specific X12
        # element. This rule enables you to customize which codes are considered valid for an element,
        # allowing for trading partner-specific code requirements.
        @[JSON::Field(key: "codeListValidationRule")]
        getter code_list_validation_rule : Types::X12CodeListValidationRule?

        # Specifies an element length validation rule that defines custom length constraints for a specific
        # X12 element. This rule allows you to enforce minimum and maximum length requirements that may differ
        # from the standard X12 specification.
        @[JSON::Field(key: "elementLengthValidationRule")]
        getter element_length_validation_rule : Types::X12ElementLengthValidationRule?

        # Specifies an element requirement validation rule that modifies whether a specific X12 element is
        # required or optional within a segment. This rule provides flexibility to accommodate different
        # trading partner requirements for element presence.
        @[JSON::Field(key: "elementRequirementValidationRule")]
        getter element_requirement_validation_rule : Types::X12ElementRequirementValidationRule?

        def initialize(
          @code_list_validation_rule : Types::X12CodeListValidationRule? = nil,
          @element_length_validation_rule : Types::X12ElementLengthValidationRule? = nil,
          @element_requirement_validation_rule : Types::X12ElementRequirementValidationRule? = nil
        )
        end
      end
    end
  end
end
