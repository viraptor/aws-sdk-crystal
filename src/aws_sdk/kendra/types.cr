require "json"
require "time"

module AwsSdk
  module Kendra
    module Types

      # Summary information on an access control configuration that you created for your documents in an
      # index.

      struct AccessControlConfigurationSummary
        include JSON::Serializable

        # The identifier of the access control configuration.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      # Access Control List files for the documents in a data source. For the format of the file, see Access
      # control for S3 data sources .

      struct AccessControlListConfiguration
        include JSON::Serializable

        # Path to the Amazon S3 bucket that contains the ACL files.

        @[JSON::Field(key: "KeyPath")]
        getter key_path : String?

        def initialize(
          @key_path : String? = nil
        )
        end
      end

      # You don't have sufficient access to perform this action. Please ensure you have the required
      # permission policies and user accounts and try again.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides information about the column that should be used for filtering the query response by
      # groups.

      struct AclConfiguration
        include JSON::Serializable

        # A list of groups, separated by semi-colons, that filters a query response based on user context. The
        # document is only returned to users that are in one of the groups specified in the UserContext field
        # of the Query API.

        @[JSON::Field(key: "AllowedGroupsColumnName")]
        getter allowed_groups_column_name : String

        def initialize(
          @allowed_groups_column_name : String
        )
        end
      end

      # An attribute returned from an index query.

      struct AdditionalResultAttribute
        include JSON::Serializable

        # The key that identifies the attribute.

        @[JSON::Field(key: "Key")]
        getter key : String

        # An object that contains the attribute value.

        @[JSON::Field(key: "Value")]
        getter value : Types::AdditionalResultAttributeValue

        # The data type of the Value property.

        @[JSON::Field(key: "ValueType")]
        getter value_type : String

        def initialize(
          @key : String,
          @value : Types::AdditionalResultAttributeValue,
          @value_type : String
        )
        end
      end

      # An attribute returned with a document from a search.

      struct AdditionalResultAttributeValue
        include JSON::Serializable

        # The text associated with the attribute and information about the highlight to apply to the text.

        @[JSON::Field(key: "TextWithHighlightsValue")]
        getter text_with_highlights_value : Types::TextWithHighlights?

        def initialize(
          @text_with_highlights_value : Types::TextWithHighlights? = nil
        )
        end
      end

      # Provides the configuration information to connect to Alfresco as your data source. Support for
      # AlfrescoConfiguration ended May 2023. We recommend migrating to or using the Alfresco data source
      # template schema / TemplateConfiguration API.

      struct AlfrescoConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Secrets Manager secret that contains the key-value pairs
        # required to connect to your Alfresco data source. The secret must contain a JSON structure with the
        # following keys: username—The user name of the Alfresco account. password—The password of the
        # Alfresco account.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String

        # The identifier of the Alfresco site. For example, my-site .

        @[JSON::Field(key: "SiteId")]
        getter site_id : String

        # The URL of the Alfresco site. For example, https://hostname:8080 .

        @[JSON::Field(key: "SiteUrl")]
        getter site_url : String

        # The path to the SSL certificate stored in an Amazon S3 bucket. You use this to connect to Alfresco
        # if you require a secure SSL connection. You can simply generate a self-signed X509 certificate on
        # any computer using OpenSSL. For an example of using OpenSSL to create an X509 certificate, see
        # Create and sign an X509 certificate .

        @[JSON::Field(key: "SslCertificateS3Path")]
        getter ssl_certificate_s3_path : Types::S3Path

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of Alfresco blogs
        # to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before you map
        # to Alfresco fields. For more information, see Mapping data source fields . The Alfresco data source
        # field names must exist in your Alfresco custom metadata.

        @[JSON::Field(key: "BlogFieldMappings")]
        getter blog_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # TRUE to index comments of blogs and other content.

        @[JSON::Field(key: "CrawlComments")]
        getter crawl_comments : Bool?

        # TRUE to index shared files.

        @[JSON::Field(key: "CrawlSystemFolders")]
        getter crawl_system_folders : Bool?

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of Alfresco
        # document libraries to Amazon Kendra index field names. To create custom fields, use the UpdateIndex
        # API before you map to Alfresco fields. For more information, see Mapping data source fields . The
        # Alfresco data source field names must exist in your Alfresco custom metadata.

        @[JSON::Field(key: "DocumentLibraryFieldMappings")]
        getter document_library_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # Specify whether to index document libraries, wikis, or blogs. You can specify one or more of these
        # options.

        @[JSON::Field(key: "EntityFilter")]
        getter entity_filter : Array(String)?

        # A list of regular expression patterns to exclude certain files in your Alfresco data source. Files
        # that match the patterns are excluded from the index. Files that don't match the patterns are
        # included in the index. If a file matches both an inclusion pattern and an exclusion pattern, the
        # exclusion pattern takes precedence and the file isn't included in the index.

        @[JSON::Field(key: "ExclusionPatterns")]
        getter exclusion_patterns : Array(String)?

        # A list of regular expression patterns to include certain files in your Alfresco data source. Files
        # that match the patterns are included in the index. Files that don't match the patterns are excluded
        # from the index. If a file matches both an inclusion pattern and an exclusion pattern, the exclusion
        # pattern takes precedence and the file isn't included in the index.

        @[JSON::Field(key: "InclusionPatterns")]
        getter inclusion_patterns : Array(String)?

        # Configuration information for an Amazon Virtual Private Cloud to connect to your Alfresco. For more
        # information, see Configuring a VPC .

        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::DataSourceVpcConfiguration?

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of Alfresco wikis
        # to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before you map
        # to Alfresco fields. For more information, see Mapping data source fields . The Alfresco data source
        # field names must exist in your Alfresco custom metadata.

        @[JSON::Field(key: "WikiFieldMappings")]
        getter wiki_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        def initialize(
          @secret_arn : String,
          @site_id : String,
          @site_url : String,
          @ssl_certificate_s3_path : Types::S3Path,
          @blog_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @crawl_comments : Bool? = nil,
          @crawl_system_folders : Bool? = nil,
          @document_library_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @entity_filter : Array(String)? = nil,
          @exclusion_patterns : Array(String)? = nil,
          @inclusion_patterns : Array(String)? = nil,
          @vpc_configuration : Types::DataSourceVpcConfiguration? = nil,
          @wiki_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil
        )
        end
      end


      struct AssociateEntitiesToExperienceRequest
        include JSON::Serializable

        # Lists users or groups in your IAM Identity Center identity source.

        @[JSON::Field(key: "EntityList")]
        getter entity_list : Array(Types::EntityConfiguration)

        # The identifier of your Amazon Kendra experience.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for your Amazon Kendra experience.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @entity_list : Array(Types::EntityConfiguration),
          @id : String,
          @index_id : String
        )
        end
      end


      struct AssociateEntitiesToExperienceResponse
        include JSON::Serializable

        # Lists the users or groups in your IAM Identity Center identity source that failed to properly
        # configure with your Amazon Kendra experience.

        @[JSON::Field(key: "FailedEntityList")]
        getter failed_entity_list : Array(Types::FailedEntity)?

        def initialize(
          @failed_entity_list : Array(Types::FailedEntity)? = nil
        )
        end
      end


      struct AssociatePersonasToEntitiesRequest
        include JSON::Serializable

        # The identifier of your Amazon Kendra experience.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for your Amazon Kendra experience.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # The personas that define the specific permissions of users or groups in your IAM Identity Center
        # identity source. The available personas or access roles are Owner and Viewer . For more information
        # on these personas, see Providing access to your search page .

        @[JSON::Field(key: "Personas")]
        getter personas : Array(Types::EntityPersonaConfiguration)

        def initialize(
          @id : String,
          @index_id : String,
          @personas : Array(Types::EntityPersonaConfiguration)
        )
        end
      end


      struct AssociatePersonasToEntitiesResponse
        include JSON::Serializable

        # Lists the users or groups in your IAM Identity Center identity source that failed to properly
        # configure with your Amazon Kendra experience.

        @[JSON::Field(key: "FailedEntityList")]
        getter failed_entity_list : Array(Types::FailedEntity)?

        def initialize(
          @failed_entity_list : Array(Types::FailedEntity)? = nil
        )
        end
      end

      # Filters the search results based on document attributes or fields. You can filter results using
      # attributes for your particular documents. The attributes must exist in your index. For example, if
      # your documents include the custom attribute "Department", you can filter documents that belong to
      # the "HR" department. You would use the EqualsTo operation to filter results or documents with
      # "Department" equals to "HR". You can use AndAllFilters and OrAllFilters in combination with each
      # other or with other operations such as EqualsTo . For example: AndAllFilters EqualsTo :
      # "Department", "HR" OrAllFilters ContainsAny : "Project Name", ["new hires", "new hiring"] This
      # example filters results or documents that belong to the HR department AND belong to projects that
      # contain "new hires" OR "new hiring" in the project name (must use ContainAny with StringListValue ).
      # This example is filtering with a depth of 2. You cannot filter more than a depth of 2, otherwise you
      # receive a ValidationException exception with the message "AttributeFilter cannot have a depth of
      # more than 2." Also, if you use more than 10 attribute filters in a given list for AndAllFilters or
      # OrAllFilters , you receive a ValidationException with the message "AttributeFilter cannot have a
      # length of more than 10". For examples of using AttributeFilter , see Using document attributes to
      # filter search results .

      struct AttributeFilter
        include JSON::Serializable

        # Performs a logical AND operation on all filters that you specify.

        @[JSON::Field(key: "AndAllFilters")]
        getter and_all_filters : Array(Types::AttributeFilter)?

        # Returns true when a document contains all of the specified document attributes/fields. This filter
        # is only applicable to StringListValue .

        @[JSON::Field(key: "ContainsAll")]
        getter contains_all : Types::DocumentAttribute?

        # Returns true when a document contains any of the specified document attributes/fields. This filter
        # is only applicable to StringListValue .

        @[JSON::Field(key: "ContainsAny")]
        getter contains_any : Types::DocumentAttribute?

        # Performs an equals operation on document attributes/fields and their values.

        @[JSON::Field(key: "EqualsTo")]
        getter equals_to : Types::DocumentAttribute?

        # Performs a greater than operation on document attributes/fields and their values. Use with the
        # document attribute type Date or Long .

        @[JSON::Field(key: "GreaterThan")]
        getter greater_than : Types::DocumentAttribute?

        # Performs a greater or equals than operation on document attributes/fields and their values. Use with
        # the document attribute type Date or Long .

        @[JSON::Field(key: "GreaterThanOrEquals")]
        getter greater_than_or_equals : Types::DocumentAttribute?

        # Performs a less than operation on document attributes/fields and their values. Use with the document
        # attribute type Date or Long .

        @[JSON::Field(key: "LessThan")]
        getter less_than : Types::DocumentAttribute?

        # Performs a less than or equals operation on document attributes/fields and their values. Use with
        # the document attribute type Date or Long .

        @[JSON::Field(key: "LessThanOrEquals")]
        getter less_than_or_equals : Types::DocumentAttribute?

        # Performs a logical NOT operation on all filters that you specify.

        @[JSON::Field(key: "NotFilter")]
        getter not_filter : Types::AttributeFilter?

        # Performs a logical OR operation on all filters that you specify.

        @[JSON::Field(key: "OrAllFilters")]
        getter or_all_filters : Array(Types::AttributeFilter)?

        def initialize(
          @and_all_filters : Array(Types::AttributeFilter)? = nil,
          @contains_all : Types::DocumentAttribute? = nil,
          @contains_any : Types::DocumentAttribute? = nil,
          @equals_to : Types::DocumentAttribute? = nil,
          @greater_than : Types::DocumentAttribute? = nil,
          @greater_than_or_equals : Types::DocumentAttribute? = nil,
          @less_than : Types::DocumentAttribute? = nil,
          @less_than_or_equals : Types::DocumentAttribute? = nil,
          @not_filter : Types::AttributeFilter? = nil,
          @or_all_filters : Array(Types::AttributeFilter)? = nil
        )
        end
      end

      # Gets information on the configuration of document fields/attributes that you want to base query
      # suggestions on. To change your configuration, use AttributeSuggestionsUpdateConfig and then call
      # UpdateQuerySuggestionsConfig .

      struct AttributeSuggestionsDescribeConfig
        include JSON::Serializable

        # The mode is set to either ACTIVE or INACTIVE . If the Mode for query history is set to ENABLED when
        # calling UpdateQuerySuggestionsConfig and AttributeSuggestionsMode to use fields/attributes is set to
        # ACTIVE , and you haven't set your SuggestionTypes preference to DOCUMENT_ATTRIBUTES , then Amazon
        # Kendra uses the query history.

        @[JSON::Field(key: "AttributeSuggestionsMode")]
        getter attribute_suggestions_mode : String?

        # The list of fields/attributes that you want to set as suggestible for query suggestions.

        @[JSON::Field(key: "SuggestableConfigList")]
        getter suggestable_config_list : Array(Types::SuggestableConfig)?

        def initialize(
          @attribute_suggestions_mode : String? = nil,
          @suggestable_config_list : Array(Types::SuggestableConfig)? = nil
        )
        end
      end

      # Provides the configuration information for the document fields/attributes that you want to base
      # query suggestions on.

      struct AttributeSuggestionsGetConfig
        include JSON::Serializable

        # The list of additional document field/attribute keys or field names to include in the response. You
        # can use additional fields to provide extra information in the response. Additional fields are not
        # used to based suggestions on.

        @[JSON::Field(key: "AdditionalResponseAttributes")]
        getter additional_response_attributes : Array(String)?

        # Filters the search results based on document fields/attributes.

        @[JSON::Field(key: "AttributeFilter")]
        getter attribute_filter : Types::AttributeFilter?

        # The list of document field/attribute keys or field names to use for query suggestions. If the
        # content within any of the fields match what your user starts typing as their query, then the field
        # content is returned as a query suggestion.

        @[JSON::Field(key: "SuggestionAttributes")]
        getter suggestion_attributes : Array(String)?

        # Applies user context filtering so that only users who are given access to certain documents see
        # these document in their search results.

        @[JSON::Field(key: "UserContext")]
        getter user_context : Types::UserContext?

        def initialize(
          @additional_response_attributes : Array(String)? = nil,
          @attribute_filter : Types::AttributeFilter? = nil,
          @suggestion_attributes : Array(String)? = nil,
          @user_context : Types::UserContext? = nil
        )
        end
      end

      # Updates the configuration information for the document fields/attributes that you want to base query
      # suggestions on. To deactivate using documents fields for query suggestions, set the mode to INACTIVE
      # . You must also set SuggestionTypes as either QUERY or DOCUMENT_ATTRIBUTES and then call
      # GetQuerySuggestions . If you set to QUERY , then Amazon Kendra uses the query history to base
      # suggestions on. If you set to DOCUMENT_ATTRIBUTES , then Amazon Kendra uses the contents of document
      # fields to base suggestions on.

      struct AttributeSuggestionsUpdateConfig
        include JSON::Serializable

        # You can set the mode to ACTIVE or INACTIVE . You must also set SuggestionTypes as either QUERY or
        # DOCUMENT_ATTRIBUTES and then call GetQuerySuggestions . If Mode to use query history is set to
        # ENABLED when calling UpdateQuerySuggestionsConfig and AttributeSuggestionsMode to use
        # fields/attributes is set to ACTIVE , and you haven't set your SuggestionTypes preference to
        # DOCUMENT_ATTRIBUTES , then Amazon Kendra uses the query history.

        @[JSON::Field(key: "AttributeSuggestionsMode")]
        getter attribute_suggestions_mode : String?

        # The list of fields/attributes that you want to set as suggestible for query suggestions.

        @[JSON::Field(key: "SuggestableConfigList")]
        getter suggestable_config_list : Array(Types::SuggestableConfig)?

        def initialize(
          @attribute_suggestions_mode : String? = nil,
          @suggestable_config_list : Array(Types::SuggestableConfig)? = nil
        )
        end
      end

      # Provides the configuration information to connect to websites that require user authentication.

      struct AuthenticationConfiguration
        include JSON::Serializable

        # The list of configuration information that's required to connect to and crawl a website host using
        # basic authentication credentials. The list includes the name and port number of the website host.

        @[JSON::Field(key: "BasicAuthentication")]
        getter basic_authentication : Array(Types::BasicAuthenticationConfiguration)?

        def initialize(
          @basic_authentication : Array(Types::BasicAuthenticationConfiguration)? = nil
        )
        end
      end

      # Provides the configuration information to connect to websites that require basic user
      # authentication.

      struct BasicAuthenticationConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Secrets Manager secret. You create a secret to store your
        # credentials in Secrets Manager You use a secret if basic authentication credentials are required to
        # connect to a website. The secret stores your credentials of user name and password.

        @[JSON::Field(key: "Credentials")]
        getter credentials : String

        # The name of the website host you want to connect to using authentication credentials. For example,
        # the host name of https://a.example.com/page1.html is "a.example.com".

        @[JSON::Field(key: "Host")]
        getter host : String

        # The port number of the website host you want to connect to using authentication credentials. For
        # example, the port for https://a.example.com/page1.html is 443, the standard port for HTTPS.

        @[JSON::Field(key: "Port")]
        getter port : Int32

        def initialize(
          @credentials : String,
          @host : String,
          @port : Int32
        )
        end
      end


      struct BatchDeleteDocumentRequest
        include JSON::Serializable

        # One or more identifiers for documents to delete from the index.

        @[JSON::Field(key: "DocumentIdList")]
        getter document_id_list : Array(String)

        # The identifier of the index that contains the documents to delete.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String


        @[JSON::Field(key: "DataSourceSyncJobMetricTarget")]
        getter data_source_sync_job_metric_target : Types::DataSourceSyncJobMetricTarget?

        def initialize(
          @document_id_list : Array(String),
          @index_id : String,
          @data_source_sync_job_metric_target : Types::DataSourceSyncJobMetricTarget? = nil
        )
        end
      end


      struct BatchDeleteDocumentResponse
        include JSON::Serializable

        # A list of documents that could not be removed from the index. Each entry contains an error message
        # that indicates why the document couldn't be removed from the index.

        @[JSON::Field(key: "FailedDocuments")]
        getter failed_documents : Array(Types::BatchDeleteDocumentResponseFailedDocument)?

        def initialize(
          @failed_documents : Array(Types::BatchDeleteDocumentResponseFailedDocument)? = nil
        )
        end
      end

      # Provides information about documents that could not be removed from an index by the
      # BatchDeleteDocument API.

      struct BatchDeleteDocumentResponseFailedDocument
        include JSON::Serializable

        # The identifier of the data source connector that the document belongs to.

        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String?

        # The error code for why the document couldn't be removed from the index.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # An explanation for why the document couldn't be removed from the index.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The identifier of the document that couldn't be removed from the index.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @data_source_id : String? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Provides information about a set of featured results that couldn't be removed from an index by the
      # BatchDeleteFeaturedResultsSet API.

      struct BatchDeleteFeaturedResultsSetError
        include JSON::Serializable

        # The error code for why the set of featured results couldn't be removed from the index.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String

        # An explanation for why the set of featured results couldn't be removed from the index.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String

        # The identifier of the set of featured results that couldn't be removed from the index.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @error_code : String,
          @error_message : String,
          @id : String
        )
        end
      end


      struct BatchDeleteFeaturedResultsSetRequest
        include JSON::Serializable

        # The identifiers of the featured results sets that you want to delete.

        @[JSON::Field(key: "FeaturedResultsSetIds")]
        getter featured_results_set_ids : Array(String)

        # The identifier of the index used for featuring results.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @featured_results_set_ids : Array(String),
          @index_id : String
        )
        end
      end


      struct BatchDeleteFeaturedResultsSetResponse
        include JSON::Serializable

        # The list of errors for the featured results set IDs, explaining why they couldn't be removed from
        # the index.

        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::BatchDeleteFeaturedResultsSetError)

        def initialize(
          @errors : Array(Types::BatchDeleteFeaturedResultsSetError)
        )
        end
      end


      struct BatchGetDocumentStatusRequest
        include JSON::Serializable

        # A list of DocumentInfo objects that identify the documents for which to get the status. You identify
        # the documents by their document ID and optional attributes.

        @[JSON::Field(key: "DocumentInfoList")]
        getter document_info_list : Array(Types::DocumentInfo)

        # The identifier of the index to add documents to. The index ID is returned by the CreateIndex API.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @document_info_list : Array(Types::DocumentInfo),
          @index_id : String
        )
        end
      end


      struct BatchGetDocumentStatusResponse
        include JSON::Serializable

        # The status of documents. The status indicates if the document is waiting to be indexed, is in the
        # process of indexing, has completed indexing, or failed indexing. If a document failed indexing, the
        # status provides the reason why.

        @[JSON::Field(key: "DocumentStatusList")]
        getter document_status_list : Array(Types::Status)?

        # A list of documents that Amazon Kendra couldn't get the status for. The list includes the ID of the
        # document and the reason that the status couldn't be found.

        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::BatchGetDocumentStatusResponseError)?

        def initialize(
          @document_status_list : Array(Types::Status)? = nil,
          @errors : Array(Types::BatchGetDocumentStatusResponseError)? = nil
        )
        end
      end

      # Provides a response when the status of a document could not be retrieved.

      struct BatchGetDocumentStatusResponseError
        include JSON::Serializable

        # The identifier of the data source connector that the failed document belongs to.

        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String?

        # The identifier of the document whose status could not be retrieved.

        @[JSON::Field(key: "DocumentId")]
        getter document_id : String?

        # Indicates the source of the error.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # States that the API could not get the status of a document. This could be because the request is not
        # valid or there is a system error.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @data_source_id : String? = nil,
          @document_id : String? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end


      struct BatchPutDocumentRequest
        include JSON::Serializable

        # One or more documents to add to the index. Documents have the following file size limits. 50 MB
        # total size for any file 5 MB extracted text for any file For more information, see Quotas .

        @[JSON::Field(key: "Documents")]
        getter documents : Array(Types::Document)

        # The identifier of the index to add the documents to. You need to create the index first using the
        # CreateIndex API.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # Configuration information for altering your document metadata and content during the document
        # ingestion process when you use the BatchPutDocument API. For more information on how to create,
        # modify and delete document metadata, or make other content alterations when you ingest documents
        # into Amazon Kendra, see Customizing document metadata during the ingestion process .

        @[JSON::Field(key: "CustomDocumentEnrichmentConfiguration")]
        getter custom_document_enrichment_configuration : Types::CustomDocumentEnrichmentConfiguration?

        # The Amazon Resource Name (ARN) of an IAM role with permission to access your S3 bucket. For more
        # information, see IAM access roles for Amazon Kendra .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @documents : Array(Types::Document),
          @index_id : String,
          @custom_document_enrichment_configuration : Types::CustomDocumentEnrichmentConfiguration? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct BatchPutDocumentResponse
        include JSON::Serializable

        # A list of documents that were not added to the index because the document failed a validation check.
        # Each document contains an error message that indicates why the document couldn't be added to the
        # index. If there was an error adding a document to an index the error is reported in your Amazon Web
        # Services CloudWatch log. For more information, see Monitoring Amazon Kendra with Amazon CloudWatch
        # logs .

        @[JSON::Field(key: "FailedDocuments")]
        getter failed_documents : Array(Types::BatchPutDocumentResponseFailedDocument)?

        def initialize(
          @failed_documents : Array(Types::BatchPutDocumentResponseFailedDocument)? = nil
        )
        end
      end

      # Provides information about a document that could not be indexed.

      struct BatchPutDocumentResponseFailedDocument
        include JSON::Serializable

        # The identifier of the data source connector that the failed document belongs to.

        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String?

        # The type of error that caused the document to fail to be indexed.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # A description of the reason why the document could not be indexed.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The identifier of the document.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @data_source_id : String? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Provides the configuration information to connect to Box as your data source.

      struct BoxConfiguration
        include JSON::Serializable

        # The identifier of the Box Enterprise platform. You can find the enterprise ID in the Box Developer
        # Console settings or when you create an app in Box and download your authentication credentials. For
        # example, 801234567 .

        @[JSON::Field(key: "EnterpriseId")]
        getter enterprise_id : String

        # The Amazon Resource Name (ARN) of an Secrets Manager secret that contains the key-value pairs
        # required to connect to your Box platform. The secret must contain a JSON structure with the
        # following keys: clientID—The identifier of the client OAuth 2.0 authentication application created
        # in Box. clientSecret—A set of characters known only to the OAuth 2.0 authentication application
        # created in Box. publicKeyId—The identifier of the public key contained within an identity
        # certificate. privateKey—A set of characters that make up an encryption key. passphrase—A set of
        # characters that act like a password. You create an application in Box to generate the keys or
        # credentials required for the secret. For more information, see Using a Box data source .

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of Box comments
        # to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before you map
        # to Box fields. For more information, see Mapping data source fields . The Box field names must exist
        # in your Box custom metadata.

        @[JSON::Field(key: "CommentFieldMappings")]
        getter comment_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # TRUE to index comments.

        @[JSON::Field(key: "CrawlComments")]
        getter crawl_comments : Bool?

        # TRUE to index the contents of tasks.

        @[JSON::Field(key: "CrawlTasks")]
        getter crawl_tasks : Bool?

        # TRUE to index web links.

        @[JSON::Field(key: "CrawlWebLinks")]
        getter crawl_web_links : Bool?

        # A list of regular expression patterns to exclude certain files and folders from your Box platform.
        # Files and folders that match the patterns are excluded from the index.Files and folders that don't
        # match the patterns are included in the index. If a file or folder matches both an inclusion and
        # exclusion pattern, the exclusion pattern takes precedence and the file or folder isn't included in
        # the index.

        @[JSON::Field(key: "ExclusionPatterns")]
        getter exclusion_patterns : Array(String)?

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of Box files to
        # Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before you map to
        # Box fields. For more information, see Mapping data source fields . The Box field names must exist in
        # your Box custom metadata.

        @[JSON::Field(key: "FileFieldMappings")]
        getter file_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # A list of regular expression patterns to include certain files and folders in your Box platform.
        # Files and folders that match the patterns are included in the index. Files and folders that don't
        # match the patterns are excluded from the index. If a file or folder matches both an inclusion and
        # exclusion pattern, the exclusion pattern takes precedence and the file or folder isn't included in
        # the index.

        @[JSON::Field(key: "InclusionPatterns")]
        getter inclusion_patterns : Array(String)?

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of Box tasks to
        # Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before you map to
        # Box fields. For more information, see Mapping data source fields . The Box field names must exist in
        # your Box custom metadata.

        @[JSON::Field(key: "TaskFieldMappings")]
        getter task_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # TRUE to use the Slack change log to determine which documents require updating in the index.
        # Depending on the data source change log's size, it may take longer for Amazon Kendra to use the
        # change log than to scan all of your documents.

        @[JSON::Field(key: "UseChangeLog")]
        getter use_change_log : Bool?

        # Configuration information for an Amazon VPC to connect to your Box. For more information, see
        # Configuring a VPC .

        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::DataSourceVpcConfiguration?

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of Box web links
        # to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before you map
        # to Box fields. For more information, see Mapping data source fields . The Box field names must exist
        # in your Box custom metadata.

        @[JSON::Field(key: "WebLinkFieldMappings")]
        getter web_link_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        def initialize(
          @enterprise_id : String,
          @secret_arn : String,
          @comment_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @crawl_comments : Bool? = nil,
          @crawl_tasks : Bool? = nil,
          @crawl_web_links : Bool? = nil,
          @exclusion_patterns : Array(String)? = nil,
          @file_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @inclusion_patterns : Array(String)? = nil,
          @task_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @use_change_log : Bool? = nil,
          @vpc_configuration : Types::DataSourceVpcConfiguration? = nil,
          @web_link_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil
        )
        end
      end

      # Specifies additional capacity units configured for your Enterprise Edition index. You can add and
      # remove capacity units to fit your usage requirements.

      struct CapacityUnitsConfiguration
        include JSON::Serializable

        # The amount of extra query capacity for an index and GetQuerySuggestions capacity. A single extra
        # capacity unit for an index provides 0.1 queries per second or approximately 8,000 queries per day.
        # You can add up to 100 extra capacity units. GetQuerySuggestions capacity is five times the
        # provisioned query capacity for an index, or the base capacity of 2.5 calls per second, whichever is
        # higher. For example, the base capacity for an index is 0.1 queries per second, and
        # GetQuerySuggestions capacity has a base of 2.5 calls per second. If you add another 0.1 queries per
        # second to total 0.2 queries per second for an index, the GetQuerySuggestions capacity is 2.5 calls
        # per second (higher than five times 0.2 queries per second).

        @[JSON::Field(key: "QueryCapacityUnits")]
        getter query_capacity_units : Int32

        # The amount of extra storage capacity for an index. A single capacity unit provides 30 GB of storage
        # space or 100,000 documents, whichever is reached first. You can add up to 100 extra capacity units.

        @[JSON::Field(key: "StorageCapacityUnits")]
        getter storage_capacity_units : Int32

        def initialize(
          @query_capacity_units : Int32,
          @storage_capacity_units : Int32
        )
        end
      end


      struct ClearQuerySuggestionsRequest
        include JSON::Serializable

        # The identifier of the index you want to clear query suggestions from.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @index_id : String
        )
        end
      end

      # Gathers information about when a particular result was clicked by a user. Your application uses the
      # SubmitFeedback API to provide click information.

      struct ClickFeedback
        include JSON::Serializable

        # The Unix timestamp when the result was clicked.

        @[JSON::Field(key: "ClickTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter click_time : Time

        # The identifier of the search result that was clicked.

        @[JSON::Field(key: "ResultId")]
        getter result_id : String

        def initialize(
          @click_time : Time,
          @result_id : String
        )
        end
      end

      # Specifies how to group results by document attribute value, and how to display them
      # collapsed/expanded under a designated primary document for each group.

      struct CollapseConfiguration
        include JSON::Serializable

        # The document attribute used to group search results. You can use any attribute that has the Sortable
        # flag set to true. You can also sort by any of the following built-in
        # attributes:"_category","_created_at", "_last_updated_at", "_version", "_view_count".

        @[JSON::Field(key: "DocumentAttributeKey")]
        getter document_attribute_key : String

        # Specifies whether to expand the collapsed results.

        @[JSON::Field(key: "Expand")]
        getter expand : Bool?

        # Provides configuration information to customize expansion options for a collapsed group.

        @[JSON::Field(key: "ExpandConfiguration")]
        getter expand_configuration : Types::ExpandConfiguration?

        # Specifies the behavior for documents without a value for the collapse attribute. Amazon Kendra
        # offers three customization options: Choose to COLLAPSE all documents with null or missing values in
        # one group. This is the default configuration. Choose to IGNORE documents with null or missing
        # values. Ignored documents will not appear in query results. Choose to EXPAND each document with a
        # null or missing value into a group of its own.

        @[JSON::Field(key: "MissingAttributeKeyStrategy")]
        getter missing_attribute_key_strategy : String?

        # A prioritized list of document attributes/fields that determine the primary document among those in
        # a collapsed group.

        @[JSON::Field(key: "SortingConfigurations")]
        getter sorting_configurations : Array(Types::SortingConfiguration)?

        def initialize(
          @document_attribute_key : String,
          @expand : Bool? = nil,
          @expand_configuration : Types::ExpandConfiguration? = nil,
          @missing_attribute_key_strategy : String? = nil,
          @sorting_configurations : Array(Types::SortingConfiguration)? = nil
        )
        end
      end

      # Provides details about a collapsed group of search results.

      struct CollapsedResultDetail
        include JSON::Serializable

        # The value of the document attribute that results are collapsed on.

        @[JSON::Field(key: "DocumentAttribute")]
        getter document_attribute : Types::DocumentAttribute

        # A list of results in the collapsed group.

        @[JSON::Field(key: "ExpandedResults")]
        getter expanded_results : Array(Types::ExpandedResultItem)?

        def initialize(
          @document_attribute : Types::DocumentAttribute,
          @expanded_results : Array(Types::ExpandedResultItem)? = nil
        )
        end
      end

      # Provides information about how Amazon Kendra should use the columns of a database in an index.

      struct ColumnConfiguration
        include JSON::Serializable

        # One to five columns that indicate when a document in the database has changed.

        @[JSON::Field(key: "ChangeDetectingColumns")]
        getter change_detecting_columns : Array(String)

        # The column that contains the contents of the document.

        @[JSON::Field(key: "DocumentDataColumnName")]
        getter document_data_column_name : String

        # The column that provides the document's identifier.

        @[JSON::Field(key: "DocumentIdColumnName")]
        getter document_id_column_name : String

        # The column that contains the title of the document.

        @[JSON::Field(key: "DocumentTitleColumnName")]
        getter document_title_column_name : String?

        # An array of objects that map database column names to the corresponding fields in an index. You must
        # first create the fields in the index using the UpdateIndex API.

        @[JSON::Field(key: "FieldMappings")]
        getter field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        def initialize(
          @change_detecting_columns : Array(String),
          @document_data_column_name : String,
          @document_id_column_name : String,
          @document_title_column_name : String? = nil,
          @field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil
        )
        end
      end

      # A conflict occurred with the request. Please fix any inconsistences with your resources and try
      # again.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about a conflicting query used across different sets of featured results. When you
      # create a featured results set, you must check that the queries are unique per featured results set
      # for each index.

      struct ConflictingItem
        include JSON::Serializable

        # The text of the conflicting query.

        @[JSON::Field(key: "QueryText")]
        getter query_text : String?

        # The identifier of the set of featured results that the conflicting query belongs to.

        @[JSON::Field(key: "SetId")]
        getter set_id : String?

        # The name for the set of featured results that the conflicting query belongs to.

        @[JSON::Field(key: "SetName")]
        getter set_name : String?

        def initialize(
          @query_text : String? = nil,
          @set_id : String? = nil,
          @set_name : String? = nil
        )
        end
      end

      # Configuration of attachment settings for the Confluence data source. Attachment settings are
      # optional, if you don't specify settings attachments, Amazon Kendra won't index them.

      struct ConfluenceAttachmentConfiguration
        include JSON::Serializable

        # Maps attributes or field names of Confluence attachments to Amazon Kendra index field names. To
        # create custom fields, use the UpdateIndex API before you map to Confluence fields. For more
        # information, see Mapping data source fields . The Confluence data source field names must exist in
        # your Confluence custom metadata. If you specify the AttachentFieldMappings parameter, you must
        # specify at least one field mapping.

        @[JSON::Field(key: "AttachmentFieldMappings")]
        getter attachment_field_mappings : Array(Types::ConfluenceAttachmentToIndexFieldMapping)?

        # TRUE to index attachments of pages and blogs in Confluence.

        @[JSON::Field(key: "CrawlAttachments")]
        getter crawl_attachments : Bool?

        def initialize(
          @attachment_field_mappings : Array(Types::ConfluenceAttachmentToIndexFieldMapping)? = nil,
          @crawl_attachments : Bool? = nil
        )
        end
      end

      # Maps attributes or field names of Confluence attachments to Amazon Kendra index field names. To
      # create custom fields, use the UpdateIndex API before you map to Confluence fields. For more
      # information, see Mapping data source fields . The Confuence data source field names must exist in
      # your Confluence custom metadata.

      struct ConfluenceAttachmentToIndexFieldMapping
        include JSON::Serializable

        # The name of the field in the data source. You must first create the index field using the
        # UpdateIndex API.

        @[JSON::Field(key: "DataSourceFieldName")]
        getter data_source_field_name : String?

        # The format for date fields in the data source. If the field specified in DataSourceFieldName is a
        # date field you must specify the date format. If the field is not a date field, an exception is
        # thrown.

        @[JSON::Field(key: "DateFieldFormat")]
        getter date_field_format : String?

        # The name of the index field to map to the Confluence data source field. The index field type must
        # match the Confluence field type.

        @[JSON::Field(key: "IndexFieldName")]
        getter index_field_name : String?

        def initialize(
          @data_source_field_name : String? = nil,
          @date_field_format : String? = nil,
          @index_field_name : String? = nil
        )
        end
      end

      # Configuration of blog settings for the Confluence data source. Blogs are always indexed unless
      # filtered from the index by the ExclusionPatterns or InclusionPatterns fields in the
      # ConfluenceConfiguration object.

      struct ConfluenceBlogConfiguration
        include JSON::Serializable

        # Maps attributes or field names of Confluence blogs to Amazon Kendra index field names. To create
        # custom fields, use the UpdateIndex API before you map to Confluence fields. For more information,
        # see Mapping data source fields . The Confluence data source field names must exist in your
        # Confluence custom metadata. If you specify the BlogFieldMappings parameter, you must specify at
        # least one field mapping.

        @[JSON::Field(key: "BlogFieldMappings")]
        getter blog_field_mappings : Array(Types::ConfluenceBlogToIndexFieldMapping)?

        def initialize(
          @blog_field_mappings : Array(Types::ConfluenceBlogToIndexFieldMapping)? = nil
        )
        end
      end

      # Maps attributes or field names of Confluence blog to Amazon Kendra index field names. To create
      # custom fields, use the UpdateIndex API before you map to Confluence fields. For more information,
      # see Mapping data source fields . The Confluence data source field names must exist in your
      # Confluence custom metadata.

      struct ConfluenceBlogToIndexFieldMapping
        include JSON::Serializable

        # The name of the field in the data source.

        @[JSON::Field(key: "DataSourceFieldName")]
        getter data_source_field_name : String?

        # The format for date fields in the data source. If the field specified in DataSourceFieldName is a
        # date field you must specify the date format. If the field is not a date field, an exception is
        # thrown.

        @[JSON::Field(key: "DateFieldFormat")]
        getter date_field_format : String?

        # The name of the index field to map to the Confluence data source field. The index field type must
        # match the Confluence field type.

        @[JSON::Field(key: "IndexFieldName")]
        getter index_field_name : String?

        def initialize(
          @data_source_field_name : String? = nil,
          @date_field_format : String? = nil,
          @index_field_name : String? = nil
        )
        end
      end

      # Provides the configuration information to connect to Confluence as your data source.

      struct ConfluenceConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Secrets Manager secret that contains the user name and password
        # required to connect to the Confluence instance. If you use Confluence Cloud, you use a generated API
        # token as the password. You can also provide authentication credentials in the form of a personal
        # access token. For more information, see Using a Confluence data source .

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String

        # The URL of your Confluence instance. Use the full URL of the server. For example,
        # https://server.example.com:port/ . You can also use an IP address, for example,
        # https://192.168.1.113/ .

        @[JSON::Field(key: "ServerUrl")]
        getter server_url : String

        # The version or the type of Confluence installation to connect to.

        @[JSON::Field(key: "Version")]
        getter version : String

        # Configuration information for indexing attachments to Confluence blogs and pages.

        @[JSON::Field(key: "AttachmentConfiguration")]
        getter attachment_configuration : Types::ConfluenceAttachmentConfiguration?

        # Whether you want to connect to Confluence using basic authentication of user name and password, or a
        # personal access token. You can use a personal access token for Confluence Server.

        @[JSON::Field(key: "AuthenticationType")]
        getter authentication_type : String?

        # Configuration information for indexing Confluence blogs.

        @[JSON::Field(key: "BlogConfiguration")]
        getter blog_configuration : Types::ConfluenceBlogConfiguration?

        # A list of regular expression patterns to exclude certain blog posts, pages, spaces, or attachments
        # in your Confluence. Content that matches the patterns are excluded from the index. Content that
        # doesn't match the patterns is included in the index. If content matches both an inclusion and
        # exclusion pattern, the exclusion pattern takes precedence and the content isn't included in the
        # index.

        @[JSON::Field(key: "ExclusionPatterns")]
        getter exclusion_patterns : Array(String)?

        # A list of regular expression patterns to include certain blog posts, pages, spaces, or attachments
        # in your Confluence. Content that matches the patterns are included in the index. Content that
        # doesn't match the patterns is excluded from the index. If content matches both an inclusion and
        # exclusion pattern, the exclusion pattern takes precedence and the content isn't included in the
        # index.

        @[JSON::Field(key: "InclusionPatterns")]
        getter inclusion_patterns : Array(String)?

        # Configuration information for indexing Confluence pages.

        @[JSON::Field(key: "PageConfiguration")]
        getter page_configuration : Types::ConfluencePageConfiguration?

        # Configuration information to connect to your Confluence URL instance via a web proxy. You can use
        # this option for Confluence Server. You must provide the website host name and port number. For
        # example, the host name of https://a.example.com/page1.html is "a.example.com" and the port is 443,
        # the standard port for HTTPS. Web proxy credentials are optional and you can use them to connect to a
        # web proxy server that requires basic authentication of user name and password. To store web proxy
        # credentials, you use a secret in Secrets Manager. It is recommended that you follow best security
        # practices when configuring your web proxy. This includes setting up throttling, setting up logging
        # and monitoring, and applying security patches on a regular basis. If you use your web proxy with
        # multiple data sources, sync jobs that occur at the same time could strain the load on your proxy. It
        # is recommended you prepare your proxy beforehand for any security and load requirements.

        @[JSON::Field(key: "ProxyConfiguration")]
        getter proxy_configuration : Types::ProxyConfiguration?

        # Configuration information for indexing Confluence spaces.

        @[JSON::Field(key: "SpaceConfiguration")]
        getter space_configuration : Types::ConfluenceSpaceConfiguration?

        # Configuration information for an Amazon Virtual Private Cloud to connect to your Confluence. For
        # more information, see Configuring a VPC .

        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::DataSourceVpcConfiguration?

        def initialize(
          @secret_arn : String,
          @server_url : String,
          @version : String,
          @attachment_configuration : Types::ConfluenceAttachmentConfiguration? = nil,
          @authentication_type : String? = nil,
          @blog_configuration : Types::ConfluenceBlogConfiguration? = nil,
          @exclusion_patterns : Array(String)? = nil,
          @inclusion_patterns : Array(String)? = nil,
          @page_configuration : Types::ConfluencePageConfiguration? = nil,
          @proxy_configuration : Types::ProxyConfiguration? = nil,
          @space_configuration : Types::ConfluenceSpaceConfiguration? = nil,
          @vpc_configuration : Types::DataSourceVpcConfiguration? = nil
        )
        end
      end

      # Configuration of the page settings for the Confluence data source.

      struct ConfluencePageConfiguration
        include JSON::Serializable

        # Maps attributes or field names of Confluence pages to Amazon Kendra index field names. To create
        # custom fields, use the UpdateIndex API before you map to Confluence fields. For more information,
        # see Mapping data source fields . The Confluence data source field names must exist in your
        # Confluence custom metadata. If you specify the PageFieldMappings parameter, you must specify at
        # least one field mapping.

        @[JSON::Field(key: "PageFieldMappings")]
        getter page_field_mappings : Array(Types::ConfluencePageToIndexFieldMapping)?

        def initialize(
          @page_field_mappings : Array(Types::ConfluencePageToIndexFieldMapping)? = nil
        )
        end
      end

      # Maps attributes or field names of Confluence pages to Amazon Kendra index field names. To create
      # custom fields, use the UpdateIndex API before you map to Confluence fields. For more information,
      # see Mapping data source fields . The Confluence data source field names must exist in your
      # Confluence custom metadata.

      struct ConfluencePageToIndexFieldMapping
        include JSON::Serializable

        # The name of the field in the data source.

        @[JSON::Field(key: "DataSourceFieldName")]
        getter data_source_field_name : String?

        # The format for date fields in the data source. If the field specified in DataSourceFieldName is a
        # date field you must specify the date format. If the field is not a date field, an exception is
        # thrown.

        @[JSON::Field(key: "DateFieldFormat")]
        getter date_field_format : String?

        # The name of the index field to map to the Confluence data source field. The index field type must
        # match the Confluence field type.

        @[JSON::Field(key: "IndexFieldName")]
        getter index_field_name : String?

        def initialize(
          @data_source_field_name : String? = nil,
          @date_field_format : String? = nil,
          @index_field_name : String? = nil
        )
        end
      end

      # Configuration information for indexing Confluence spaces.

      struct ConfluenceSpaceConfiguration
        include JSON::Serializable

        # TRUE to index archived spaces.

        @[JSON::Field(key: "CrawlArchivedSpaces")]
        getter crawl_archived_spaces : Bool?

        # TRUE to index personal spaces. You can add restrictions to items in personal spaces. If personal
        # spaces are indexed, queries without user context information may return restricted items from a
        # personal space in their results. For more information, see Filtering on user context .

        @[JSON::Field(key: "CrawlPersonalSpaces")]
        getter crawl_personal_spaces : Bool?

        # A list of space keys of Confluence spaces. If you include a key, the blogs, documents, and
        # attachments in the space are not indexed. If a space is in both the ExcludeSpaces and the
        # IncludeSpaces list, the space is excluded.

        @[JSON::Field(key: "ExcludeSpaces")]
        getter exclude_spaces : Array(String)?

        # A list of space keys for Confluence spaces. If you include a key, the blogs, documents, and
        # attachments in the space are indexed. Spaces that aren't in the list aren't indexed. A space in the
        # list must exist. Otherwise, Amazon Kendra logs an error when the data source is synchronized. If a
        # space is in both the IncludeSpaces and the ExcludeSpaces list, the space is excluded.

        @[JSON::Field(key: "IncludeSpaces")]
        getter include_spaces : Array(String)?

        # Maps attributes or field names of Confluence spaces to Amazon Kendra index field names. To create
        # custom fields, use the UpdateIndex API before you map to Confluence fields. For more information,
        # see Mapping data source fields . The Confluence data source field names must exist in your
        # Confluence custom metadata. If you specify the SpaceFieldMappings parameter, you must specify at
        # least one field mapping.

        @[JSON::Field(key: "SpaceFieldMappings")]
        getter space_field_mappings : Array(Types::ConfluenceSpaceToIndexFieldMapping)?

        def initialize(
          @crawl_archived_spaces : Bool? = nil,
          @crawl_personal_spaces : Bool? = nil,
          @exclude_spaces : Array(String)? = nil,
          @include_spaces : Array(String)? = nil,
          @space_field_mappings : Array(Types::ConfluenceSpaceToIndexFieldMapping)? = nil
        )
        end
      end

      # Maps attributes or field names of Confluence spaces to Amazon Kendra index field names. To create
      # custom fields, use the UpdateIndex API before you map to Confluence fields. For more information,
      # see Mapping data source fields . The Confluence data source field names must exist in your
      # Confluence custom metadata.

      struct ConfluenceSpaceToIndexFieldMapping
        include JSON::Serializable

        # The name of the field in the data source.

        @[JSON::Field(key: "DataSourceFieldName")]
        getter data_source_field_name : String?

        # The format for date fields in the data source. If the field specified in DataSourceFieldName is a
        # date field you must specify the date format. If the field is not a date field, an exception is
        # thrown.

        @[JSON::Field(key: "DateFieldFormat")]
        getter date_field_format : String?

        # The name of the index field to map to the Confluence data source field. The index field type must
        # match the Confluence field type.

        @[JSON::Field(key: "IndexFieldName")]
        getter index_field_name : String?

        def initialize(
          @data_source_field_name : String? = nil,
          @date_field_format : String? = nil,
          @index_field_name : String? = nil
        )
        end
      end

      # Provides the configuration information that's required to connect to a database.

      struct ConnectionConfiguration
        include JSON::Serializable

        # The name of the host for the database. Can be either a string (host.subdomain.domain.tld) or an IPv4
        # or IPv6 address.

        @[JSON::Field(key: "DatabaseHost")]
        getter database_host : String

        # The name of the database containing the document data.

        @[JSON::Field(key: "DatabaseName")]
        getter database_name : String

        # The port that the database uses for connections.

        @[JSON::Field(key: "DatabasePort")]
        getter database_port : Int32

        # The Amazon Resource Name (ARN) of an Secrets Manager secret that stores the credentials. The
        # credentials should be a user-password pair. For more information, see Using a Database Data Source .
        # For more information about Secrets Manager, see What Is Secrets Manager in the Secrets Manager user
        # guide.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String

        # The name of the table that contains the document data.

        @[JSON::Field(key: "TableName")]
        getter table_name : String

        def initialize(
          @database_host : String,
          @database_name : String,
          @database_port : Int32,
          @secret_arn : String,
          @table_name : String
        )
        end
      end

      # Provides the configuration information for your content sources, such as data sources, FAQs, and
      # content indexed directly via BatchPutDocument .

      struct ContentSourceConfiguration
        include JSON::Serializable

        # The identifier of the data sources you want to use for your Amazon Kendra experience.

        @[JSON::Field(key: "DataSourceIds")]
        getter data_source_ids : Array(String)?

        # TRUE to use documents you indexed directly using the BatchPutDocument API.

        @[JSON::Field(key: "DirectPutContent")]
        getter direct_put_content : Bool?

        # The identifier of the FAQs that you want to use for your Amazon Kendra experience.

        @[JSON::Field(key: "FaqIds")]
        getter faq_ids : Array(String)?

        def initialize(
          @data_source_ids : Array(String)? = nil,
          @direct_put_content : Bool? = nil,
          @faq_ids : Array(String)? = nil
        )
        end
      end

      # A corrected misspelled word in a query.

      struct Correction
        include JSON::Serializable

        # The zero-based location in the response string or text where the corrected word starts.

        @[JSON::Field(key: "BeginOffset")]
        getter begin_offset : Int32?

        # The string or text of a corrected misspelled word in a query.

        @[JSON::Field(key: "CorrectedTerm")]
        getter corrected_term : String?

        # The zero-based location in the response string or text where the corrected word ends.

        @[JSON::Field(key: "EndOffset")]
        getter end_offset : Int32?

        # The string or text of a misspelled word in a query.

        @[JSON::Field(key: "Term")]
        getter term : String?

        def initialize(
          @begin_offset : Int32? = nil,
          @corrected_term : String? = nil,
          @end_offset : Int32? = nil,
          @term : String? = nil
        )
        end
      end


      struct CreateAccessControlConfigurationRequest
        include JSON::Serializable

        # The identifier of the index to create an access control configuration for your documents.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # A name for the access control configuration.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Information on principals (users and/or groups) and which documents they should have access to. This
        # is useful for user context filtering, where search results are filtered based on the user or their
        # group access to documents.

        @[JSON::Field(key: "AccessControlList")]
        getter access_control_list : Array(Types::Principal)?

        # A token that you provide to identify the request to create an access control configuration. Multiple
        # calls to the CreateAccessControlConfiguration API with the same client token will create only one
        # access control configuration.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A description for the access control configuration.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The list of principal lists that define the hierarchy for which documents users should have access
        # to.

        @[JSON::Field(key: "HierarchicalAccessControlList")]
        getter hierarchical_access_control_list : Array(Types::HierarchicalPrincipal)?

        def initialize(
          @index_id : String,
          @name : String,
          @access_control_list : Array(Types::Principal)? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @hierarchical_access_control_list : Array(Types::HierarchicalPrincipal)? = nil
        )
        end
      end


      struct CreateAccessControlConfigurationResponse
        include JSON::Serializable

        # The identifier of the access control configuration for your documents in an index.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct CreateDataSourceRequest
        include JSON::Serializable

        # The identifier of the index you want to use with the data source connector.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # A name for the data source connector.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The type of data source repository. For example, SHAREPOINT .

        @[JSON::Field(key: "Type")]
        getter type : String

        # A token that you provide to identify the request to create a data source connector. Multiple calls
        # to the CreateDataSource API with the same client token will create only one data source connector.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Configuration information to connect to your data source repository. You can't specify the
        # Configuration parameter when the Type parameter is set to CUSTOM . If you do, you receive a
        # ValidationException exception. The Configuration parameter is required for all other data sources.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::DataSourceConfiguration?

        # Configuration information for altering document metadata and content during the document ingestion
        # process. For more information on how to create, modify and delete document metadata, or make other
        # content alterations when you ingest documents into Amazon Kendra, see Customizing document metadata
        # during the ingestion process .

        @[JSON::Field(key: "CustomDocumentEnrichmentConfiguration")]
        getter custom_document_enrichment_configuration : Types::CustomDocumentEnrichmentConfiguration?

        # A description for the data source connector.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The code for a language. This allows you to support a language for all documents when creating the
        # data source connector. English is supported by default. For more information on supported languages,
        # including their codes, see Adding documents in languages other than English .

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The Amazon Resource Name (ARN) of an IAM role with permission to access the data source and required
        # resources. For more information, see IAM access roles for Amazon Kendra. . You can't specify the
        # RoleArn parameter when the Type parameter is set to CUSTOM . If you do, you receive a
        # ValidationException exception. The RoleArn parameter is required for all other data sources.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Sets the frequency for Amazon Kendra to check the documents in your data source repository and
        # update the index. If you don't set a schedule Amazon Kendra will not periodically update the index.
        # You can call the StartDataSourceSyncJob API to update the index. Specify a cron- format schedule
        # string or an empty string to indicate that the index is updated on demand. You can't specify the
        # Schedule parameter when the Type parameter is set to CUSTOM . If you do, you receive a
        # ValidationException exception.

        @[JSON::Field(key: "Schedule")]
        getter schedule : String?

        # A list of key-value pairs that identify or categorize the data source connector. You can also use
        # tags to help control access to the data source connector. Tag keys and values can consist of Unicode
        # letters, digits, white space, and any of the following symbols: _ . : / = + - @.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Configuration information for an Amazon Virtual Private Cloud to connect to your data source. For
        # more information, see Configuring a VPC .

        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::DataSourceVpcConfiguration?

        def initialize(
          @index_id : String,
          @name : String,
          @type : String,
          @client_token : String? = nil,
          @configuration : Types::DataSourceConfiguration? = nil,
          @custom_document_enrichment_configuration : Types::CustomDocumentEnrichmentConfiguration? = nil,
          @description : String? = nil,
          @language_code : String? = nil,
          @role_arn : String? = nil,
          @schedule : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @vpc_configuration : Types::DataSourceVpcConfiguration? = nil
        )
        end
      end


      struct CreateDataSourceResponse
        include JSON::Serializable

        # The identifier of the data source connector.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct CreateExperienceRequest
        include JSON::Serializable

        # The identifier of the index for your Amazon Kendra experience.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # A name for your Amazon Kendra experience.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A token that you provide to identify the request to create your Amazon Kendra experience. Multiple
        # calls to the CreateExperience API with the same client token creates only one Amazon Kendra
        # experience.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Configuration information for your Amazon Kendra experience. This includes
        # ContentSourceConfiguration , which specifies the data source IDs and/or FAQ IDs, and
        # UserIdentityConfiguration , which specifies the user or group information to grant access to your
        # Amazon Kendra experience.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::ExperienceConfiguration?

        # A description for your Amazon Kendra experience.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of an IAM role with permission to access Query API,
        # GetQuerySuggestions API, and other required APIs. The role also must include permission to access
        # IAM Identity Center that stores your user and group information. For more information, see IAM
        # access roles for Amazon Kendra .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @index_id : String,
          @name : String,
          @client_token : String? = nil,
          @configuration : Types::ExperienceConfiguration? = nil,
          @description : String? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct CreateExperienceResponse
        include JSON::Serializable

        # The identifier of your Amazon Kendra experience.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct CreateFaqRequest
        include JSON::Serializable

        # The identifier of the index for the FAQ.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # A name for the FAQ.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) of an IAM role with permission to access the S3 bucket that contains
        # the FAQ file. For more information, see IAM access roles for Amazon Kendra .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The path to the FAQ file in S3.

        @[JSON::Field(key: "S3Path")]
        getter s3_path : Types::S3Path

        # A token that you provide to identify the request to create a FAQ. Multiple calls to the
        # CreateFaqRequest API with the same client token will create only one FAQ.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A description for the FAQ.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The format of the FAQ input file. You can choose between a basic CSV format, a CSV format that
        # includes customs attributes in a header, and a JSON format that includes custom attributes. The
        # default format is CSV. The format must match the format of the file stored in the S3 bucket
        # identified in the S3Path parameter. For more information, see Adding questions and answers .

        @[JSON::Field(key: "FileFormat")]
        getter file_format : String?

        # The code for a language. This allows you to support a language for the FAQ document. English is
        # supported by default. For more information on supported languages, including their codes, see Adding
        # documents in languages other than English .

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # A list of key-value pairs that identify the FAQ. You can use the tags to identify and organize your
        # resources and to control access to resources.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @index_id : String,
          @name : String,
          @role_arn : String,
          @s3_path : Types::S3Path,
          @client_token : String? = nil,
          @description : String? = nil,
          @file_format : String? = nil,
          @language_code : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateFaqResponse
        include JSON::Serializable

        # The identifier of the FAQ.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end


      struct CreateFeaturedResultsSetRequest
        include JSON::Serializable

        # A name for the set of featured results.

        @[JSON::Field(key: "FeaturedResultsSetName")]
        getter featured_results_set_name : String

        # The identifier of the index that you want to use for featuring results.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # A token that you provide to identify the request to create a set of featured results. Multiple calls
        # to the CreateFeaturedResultsSet API with the same client token will create only one featured results
        # set.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A description for the set of featured results.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of document IDs for the documents you want to feature at the top of the search results page.
        # For more information on the list of documents, see FeaturedResultsSet .

        @[JSON::Field(key: "FeaturedDocuments")]
        getter featured_documents : Array(Types::FeaturedDocument)?

        # A list of queries for featuring results. For more information on the list of queries, see
        # FeaturedResultsSet .

        @[JSON::Field(key: "QueryTexts")]
        getter query_texts : Array(String)?

        # The current status of the set of featured results. When the value is ACTIVE , featured results are
        # ready for use. You can still configure your settings before setting the status to ACTIVE . You can
        # set the status to ACTIVE or INACTIVE using the UpdateFeaturedResultsSet API. The queries you specify
        # for featured results must be unique per featured results set for each index, whether the status is
        # ACTIVE or INACTIVE .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A list of key-value pairs that identify or categorize the featured results set. You can also use
        # tags to help control access to the featured results set. Tag keys and values can consist of Unicode
        # letters, digits, white space, and any of the following symbols:_ . : / = + - @.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @featured_results_set_name : String,
          @index_id : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @featured_documents : Array(Types::FeaturedDocument)? = nil,
          @query_texts : Array(String)? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateFeaturedResultsSetResponse
        include JSON::Serializable

        # Information on the set of featured results. This includes the identifier of the featured results
        # set, whether the featured results set is active or inactive, when the featured results set was
        # created, and more.

        @[JSON::Field(key: "FeaturedResultsSet")]
        getter featured_results_set : Types::FeaturedResultsSet?

        def initialize(
          @featured_results_set : Types::FeaturedResultsSet? = nil
        )
        end
      end


      struct CreateIndexRequest
        include JSON::Serializable

        # A name for the index.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) of an IAM role with permission to access your Amazon CloudWatch logs
        # and metrics. For more information, see IAM access roles for Amazon Kendra .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # A token that you provide to identify the request to create an index. Multiple calls to the
        # CreateIndex API with the same client token will create only one index.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A description for the index.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The Amazon Kendra edition to use for the index. Choose DEVELOPER_EDITION for indexes intended for
        # development, testing, or proof of concept. Use ENTERPRISE_EDITION for production. Use
        # GEN_AI_ENTERPRISE_EDITION for creating generative AI applications. Once you set the edition for an
        # index, it can't be changed. The Edition parameter is optional. If you don't supply a value, the
        # default is ENTERPRISE_EDITION . For more information on quota limits for Gen AI Enterprise Edition,
        # Enterprise Edition, and Developer Edition indices, see Quotas .

        @[JSON::Field(key: "Edition")]
        getter edition : String?

        # The identifier of the KMS customer managed key (CMK) that's used to encrypt data indexed by Amazon
        # Kendra. Amazon Kendra doesn't support asymmetric CMKs.

        @[JSON::Field(key: "ServerSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # A list of key-value pairs that identify or categorize the index. You can also use tags to help
        # control access to the index. Tag keys and values can consist of Unicode letters, digits, white
        # space, and any of the following symbols: _ . : / = + - @.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The user context policy. If you're using an Amazon Kendra Gen AI Enterprise Edition index, you can
        # only use ATTRIBUTE_FILTER to filter search results by user context. If you're using an Amazon Kendra
        # Gen AI Enterprise Edition index and you try to use USER_TOKEN to configure user context policy,
        # Amazon Kendra returns a ValidationException error. ATTRIBUTE_FILTER All indexed content is
        # searchable and displayable for all users. If you want to filter search results on user context, you
        # can use the attribute filters of _user_id and _group_ids or you can provide user and group
        # information in UserContext . USER_TOKEN Enables token-based user access control to filter search
        # results on user context. All documents with no access control and all documents accessible to the
        # user will be searchable and displayable.

        @[JSON::Field(key: "UserContextPolicy")]
        getter user_context_policy : String?

        # Gets users and groups from IAM Identity Center identity source. To configure this, see
        # UserGroupResolutionConfiguration . This is useful for user context filtering, where search results
        # are filtered based on the user or their group access to documents. If you're using an Amazon Kendra
        # Gen AI Enterprise Edition index, UserGroupResolutionConfiguration isn't supported.

        @[JSON::Field(key: "UserGroupResolutionConfiguration")]
        getter user_group_resolution_configuration : Types::UserGroupResolutionConfiguration?

        # The user token configuration. If you're using an Amazon Kendra Gen AI Enterprise Edition index and
        # you try to use UserTokenConfigurations to configure user context policy, Amazon Kendra returns a
        # ValidationException error.

        @[JSON::Field(key: "UserTokenConfigurations")]
        getter user_token_configurations : Array(Types::UserTokenConfiguration)?

        def initialize(
          @name : String,
          @role_arn : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @edition : String? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil,
          @user_context_policy : String? = nil,
          @user_group_resolution_configuration : Types::UserGroupResolutionConfiguration? = nil,
          @user_token_configurations : Array(Types::UserTokenConfiguration)? = nil
        )
        end
      end


      struct CreateIndexResponse
        include JSON::Serializable

        # The identifier of the index. Use this identifier when you query an index, set up a data source, or
        # index a document.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end


      struct CreateQuerySuggestionsBlockListRequest
        include JSON::Serializable

        # The identifier of the index you want to create a query suggestions block list for.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # A name for the block list. For example, the name 'offensive-words', which includes all offensive
        # words that could appear in user queries and need to be blocked from suggestions.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) of an IAM role with permission to access your S3 bucket that contains
        # the block list text file. For more information, see IAM access roles for Amazon Kendra .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The S3 path to your block list text file in your S3 bucket. Each block word or phrase should be on a
        # separate line in a text file. For information on the current quota limits for block lists, see
        # Quotas for Amazon Kendra .

        @[JSON::Field(key: "SourceS3Path")]
        getter source_s3_path : Types::S3Path

        # A token that you provide to identify the request to create a query suggestions block list.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A description for the block list. For example, the description "List of all offensive words that can
        # appear in user queries and need to be blocked from suggestions."

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of key-value pairs that identify or categorize the block list. Tag keys and values can
        # consist of Unicode letters, digits, white space, and any of the following symbols: _ . : / = + - @.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @index_id : String,
          @name : String,
          @role_arn : String,
          @source_s3_path : Types::S3Path,
          @client_token : String? = nil,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateQuerySuggestionsBlockListResponse
        include JSON::Serializable

        # The identifier of the block list.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end


      struct CreateThesaurusRequest
        include JSON::Serializable

        # The identifier of the index for the thesaurus.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # A name for the thesaurus.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) of an IAM role with permission to access your S3 bucket that contains
        # the thesaurus file. For more information, see IAM access roles for Amazon Kendra .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The path to the thesaurus file in S3.

        @[JSON::Field(key: "SourceS3Path")]
        getter source_s3_path : Types::S3Path

        # A token that you provide to identify the request to create a thesaurus. Multiple calls to the
        # CreateThesaurus API with the same client token will create only one thesaurus.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # A description for the thesaurus.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of key-value pairs that identify or categorize the thesaurus. You can also use tags to help
        # control access to the thesaurus. Tag keys and values can consist of Unicode letters, digits, white
        # space, and any of the following symbols: _ . : / = + - @.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @index_id : String,
          @name : String,
          @role_arn : String,
          @source_s3_path : Types::S3Path,
          @client_token : String? = nil,
          @description : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateThesaurusResponse
        include JSON::Serializable

        # The identifier of the thesaurus.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      # Provides the configuration information for altering document metadata and content during the
      # document ingestion process. For more information, see Customizing document metadata during the
      # ingestion process .

      struct CustomDocumentEnrichmentConfiguration
        include JSON::Serializable

        # Configuration information to alter document attributes or metadata fields and content when ingesting
        # documents into Amazon Kendra.

        @[JSON::Field(key: "InlineConfigurations")]
        getter inline_configurations : Array(Types::InlineCustomDocumentEnrichmentConfiguration)?

        # Configuration information for invoking a Lambda function in Lambda on the structured documents with
        # their metadata and text extracted. You can use a Lambda function to apply advanced logic for
        # creating, modifying, or deleting document metadata and content. For more information, see Advanced
        # data manipulation .

        @[JSON::Field(key: "PostExtractionHookConfiguration")]
        getter post_extraction_hook_configuration : Types::HookConfiguration?

        # Configuration information for invoking a Lambda function in Lambda on the original or raw documents
        # before extracting their metadata and text. You can use a Lambda function to apply advanced logic for
        # creating, modifying, or deleting document metadata and content. For more information, see Advanced
        # data manipulation .

        @[JSON::Field(key: "PreExtractionHookConfiguration")]
        getter pre_extraction_hook_configuration : Types::HookConfiguration?

        # The Amazon Resource Name (ARN) of an IAM role with permission to run PreExtractionHookConfiguration
        # and PostExtractionHookConfiguration for altering document metadata and content during the document
        # ingestion process. For more information, see an IAM roles for Amazon Kendra .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @inline_configurations : Array(Types::InlineCustomDocumentEnrichmentConfiguration)? = nil,
          @post_extraction_hook_configuration : Types::HookConfiguration? = nil,
          @pre_extraction_hook_configuration : Types::HookConfiguration? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Provides the configuration information for an Amazon Kendra data source.

      struct DataSourceConfiguration
        include JSON::Serializable

        # Provides the configuration information to connect to Alfresco as your data source. Support for
        # AlfrescoConfiguration ended May 2023. We recommend migrating to or using the Alfresco data source
        # template schema / TemplateConfiguration API.

        @[JSON::Field(key: "AlfrescoConfiguration")]
        getter alfresco_configuration : Types::AlfrescoConfiguration?

        # Provides the configuration information to connect to Box as your data source.

        @[JSON::Field(key: "BoxConfiguration")]
        getter box_configuration : Types::BoxConfiguration?

        # Provides the configuration information to connect to Confluence as your data source.

        @[JSON::Field(key: "ConfluenceConfiguration")]
        getter confluence_configuration : Types::ConfluenceConfiguration?

        # Provides the configuration information to connect to a database as your data source.

        @[JSON::Field(key: "DatabaseConfiguration")]
        getter database_configuration : Types::DatabaseConfiguration?

        # Provides the configuration information to connect to Amazon FSx as your data source. Amazon Kendra
        # now supports an upgraded Amazon FSx Windows connector. You must now use the TemplateConfiguration
        # object instead of the FsxConfiguration object to configure your connector. Connectors configured
        # using the older console and API architecture will continue to function as configured. However, you
        # won't be able to edit or update them. If you want to edit or update your connector configuration,
        # you must create a new connector. We recommended migrating your connector workflow to the upgraded
        # version. Support for connectors configured using the older architecture is scheduled to end by June
        # 2024.

        @[JSON::Field(key: "FsxConfiguration")]
        getter fsx_configuration : Types::FsxConfiguration?

        # Provides the configuration information to connect to GitHub as your data source. Amazon Kendra now
        # supports an upgraded GitHub connector. You must now use the TemplateConfiguration object instead of
        # the GitHubConfiguration object to configure your connector. Connectors configured using the older
        # console and API architecture will continue to function as configured. However, you won’t be able to
        # edit or update them. If you want to edit or update your connector configuration, you must create a
        # new connector. We recommended migrating your connector workflow to the upgraded version. Support for
        # connectors configured using the older architecture is scheduled to end by June 2024.

        @[JSON::Field(key: "GitHubConfiguration")]
        getter git_hub_configuration : Types::GitHubConfiguration?

        # Provides the configuration information to connect to Google Drive as your data source.

        @[JSON::Field(key: "GoogleDriveConfiguration")]
        getter google_drive_configuration : Types::GoogleDriveConfiguration?

        # Provides the configuration information to connect to Jira as your data source.

        @[JSON::Field(key: "JiraConfiguration")]
        getter jira_configuration : Types::JiraConfiguration?

        # Provides the configuration information to connect to Microsoft OneDrive as your data source.

        @[JSON::Field(key: "OneDriveConfiguration")]
        getter one_drive_configuration : Types::OneDriveConfiguration?

        # Provides the configuration information to connect to Quip as your data source.

        @[JSON::Field(key: "QuipConfiguration")]
        getter quip_configuration : Types::QuipConfiguration?

        # Provides the configuration information to connect to an Amazon S3 bucket as your data source. Amazon
        # Kendra now supports an upgraded Amazon S3 connector. You must now use the TemplateConfiguration
        # object instead of the S3DataSourceConfiguration object to configure your connector. Connectors
        # configured using the older console and API architecture will continue to function as configured.
        # However, you won't be able to edit or update them. If you want to edit or update your connector
        # configuration, you must create a new connector. We recommended migrating your connector workflow to
        # the upgraded version. Support for connectors configured using the older architecture is scheduled to
        # end by June 2024.

        @[JSON::Field(key: "S3Configuration")]
        getter s3_configuration : Types::S3DataSourceConfiguration?

        # Provides the configuration information to connect to Salesforce as your data source.

        @[JSON::Field(key: "SalesforceConfiguration")]
        getter salesforce_configuration : Types::SalesforceConfiguration?

        # Provides the configuration information to connect to ServiceNow as your data source.

        @[JSON::Field(key: "ServiceNowConfiguration")]
        getter service_now_configuration : Types::ServiceNowConfiguration?

        # Provides the configuration information to connect to Microsoft SharePoint as your data source.

        @[JSON::Field(key: "SharePointConfiguration")]
        getter share_point_configuration : Types::SharePointConfiguration?

        # Provides the configuration information to connect to Slack as your data source. Amazon Kendra now
        # supports an upgraded Slack connector. You must now use the TemplateConfiguration object instead of
        # the SlackConfiguration object to configure your connector. Connectors configured using the older
        # console and API architecture will continue to function as configured. However, you won't be able to
        # edit or update them. If you want to edit or update your connector configuration, you must create a
        # new connector. We recommended migrating your connector workflow to the upgraded version. Support for
        # connectors configured using the older architecture is scheduled to end by June 2024.

        @[JSON::Field(key: "SlackConfiguration")]
        getter slack_configuration : Types::SlackConfiguration?

        # Provides a template for the configuration information to connect to your data source.

        @[JSON::Field(key: "TemplateConfiguration")]
        getter template_configuration : Types::TemplateConfiguration?


        @[JSON::Field(key: "WebCrawlerConfiguration")]
        getter web_crawler_configuration : Types::WebCrawlerConfiguration?

        # Provides the configuration information to connect to Amazon WorkDocs as your data source.

        @[JSON::Field(key: "WorkDocsConfiguration")]
        getter work_docs_configuration : Types::WorkDocsConfiguration?

        def initialize(
          @alfresco_configuration : Types::AlfrescoConfiguration? = nil,
          @box_configuration : Types::BoxConfiguration? = nil,
          @confluence_configuration : Types::ConfluenceConfiguration? = nil,
          @database_configuration : Types::DatabaseConfiguration? = nil,
          @fsx_configuration : Types::FsxConfiguration? = nil,
          @git_hub_configuration : Types::GitHubConfiguration? = nil,
          @google_drive_configuration : Types::GoogleDriveConfiguration? = nil,
          @jira_configuration : Types::JiraConfiguration? = nil,
          @one_drive_configuration : Types::OneDriveConfiguration? = nil,
          @quip_configuration : Types::QuipConfiguration? = nil,
          @s3_configuration : Types::S3DataSourceConfiguration? = nil,
          @salesforce_configuration : Types::SalesforceConfiguration? = nil,
          @service_now_configuration : Types::ServiceNowConfiguration? = nil,
          @share_point_configuration : Types::SharePointConfiguration? = nil,
          @slack_configuration : Types::SlackConfiguration? = nil,
          @template_configuration : Types::TemplateConfiguration? = nil,
          @web_crawler_configuration : Types::WebCrawlerConfiguration? = nil,
          @work_docs_configuration : Types::WorkDocsConfiguration? = nil
        )
        end
      end

      # Data source information for user context filtering.

      struct DataSourceGroup
        include JSON::Serializable

        # The identifier of the data source group you want to add to your list of data source groups. This is
        # for filtering search results based on the groups' access to documents in that data source.

        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String

        # The identifier of the group you want to add to your list of groups. This is for filtering search
        # results based on the groups' access to documents.

        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        def initialize(
          @data_source_id : String,
          @group_id : String
        )
        end
      end

      # Summary information for a Amazon Kendra data source.

      struct DataSourceSummary
        include JSON::Serializable

        # The Unix timestamp when the data source connector was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The identifier for the data source.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The code for a language. This shows a supported language for all documents in the data source.
        # English is supported by default. For more information on supported languages, including their codes,
        # see Adding documents in languages other than English .

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The name of the data source.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The status of the data source. When the status is ACTIVE the data source is ready to use.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The type of the data source.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The Unix timestamp when the data source connector was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @id : String? = nil,
          @language_code : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Provides information about a data source synchronization job.

      struct DataSourceSyncJob
        include JSON::Serializable

        # If the reason that the synchronization failed is due to an error with the underlying data source,
        # this field contains a code that identifies the error.

        @[JSON::Field(key: "DataSourceErrorCode")]
        getter data_source_error_code : String?

        # The Unix timestamp when the synchronization job completed.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # If the Status field is set to FAILED , the ErrorCode field indicates the reason the synchronization
        # failed.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # If the Status field is set to ERROR , the ErrorMessage field contains a description of the error
        # that caused the synchronization to fail.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # A identifier for the synchronization job.

        @[JSON::Field(key: "ExecutionId")]
        getter execution_id : String?

        # Maps a batch delete document request to a specific data source sync job. This is optional and should
        # only be supplied when documents are deleted by a data source connector.

        @[JSON::Field(key: "Metrics")]
        getter metrics : Types::DataSourceSyncJobMetrics?

        # The Unix timestamp when the synchronization job started.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The execution status of the synchronization job. When the Status field is set to SUCCEEDED , the
        # synchronization job is done. If the status code is set to FAILED , the ErrorCode and ErrorMessage
        # fields give you the reason for the failure.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @data_source_error_code : String? = nil,
          @end_time : Time? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @execution_id : String? = nil,
          @metrics : Types::DataSourceSyncJobMetrics? = nil,
          @start_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Maps a particular data source sync job to a particular data source.

      struct DataSourceSyncJobMetricTarget
        include JSON::Serializable

        # The ID of the data source that is running the sync job.

        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String

        # The ID of the sync job that is running on the data source. If the ID of a sync job is not provided
        # and there is a sync job running, then the ID of this sync job is used and metrics are generated for
        # this sync job. If the ID of a sync job is not provided and there is no sync job running, then no
        # metrics are generated and documents are indexed/deleted at the index level without sync job metrics
        # included.

        @[JSON::Field(key: "DataSourceSyncJobId")]
        getter data_source_sync_job_id : String?

        def initialize(
          @data_source_id : String,
          @data_source_sync_job_id : String? = nil
        )
        end
      end

      # Maps a batch delete document request to a specific data source sync job. This is optional and should
      # only be supplied when documents are deleted by a data source connector.

      struct DataSourceSyncJobMetrics
        include JSON::Serializable

        # The number of documents added from the data source up to now in the data source sync.

        @[JSON::Field(key: "DocumentsAdded")]
        getter documents_added : String?

        # The number of documents deleted from the data source up to now in the data source sync run.

        @[JSON::Field(key: "DocumentsDeleted")]
        getter documents_deleted : String?

        # The number of documents that failed to sync from the data source up to now in the data source sync
        # run.

        @[JSON::Field(key: "DocumentsFailed")]
        getter documents_failed : String?

        # The number of documents modified in the data source up to now in the data source sync run.

        @[JSON::Field(key: "DocumentsModified")]
        getter documents_modified : String?

        # The current number of documents crawled by the current sync job in the data source.

        @[JSON::Field(key: "DocumentsScanned")]
        getter documents_scanned : String?

        def initialize(
          @documents_added : String? = nil,
          @documents_deleted : String? = nil,
          @documents_failed : String? = nil,
          @documents_modified : String? = nil,
          @documents_scanned : String? = nil
        )
        end
      end

      # Maps attributes or field names of the documents synced from the data source to Amazon Kendra index
      # field names. You can set up field mappings for each data source when calling CreateDataSource or
      # UpdateDataSource API. To create custom fields, use the UpdateIndex API to first create an index
      # field and then map to the data source field. For more information, see Mapping data source fields .

      struct DataSourceToIndexFieldMapping
        include JSON::Serializable

        # The name of the field in the data source. You must first create the index field using the
        # UpdateIndex API.

        @[JSON::Field(key: "DataSourceFieldName")]
        getter data_source_field_name : String

        # The name of the index field to map to the data source field. The index field type must match the
        # data source field type.

        @[JSON::Field(key: "IndexFieldName")]
        getter index_field_name : String

        # The format for date fields in the data source. If the field specified in DataSourceFieldName is a
        # date field, you must specify the date format. If the field is not a date field, an exception is
        # thrown.

        @[JSON::Field(key: "DateFieldFormat")]
        getter date_field_format : String?

        def initialize(
          @data_source_field_name : String,
          @index_field_name : String,
          @date_field_format : String? = nil
        )
        end
      end

      # Provides the configuration information to connect to an Amazon VPC.

      struct DataSourceVpcConfiguration
        include JSON::Serializable

        # A list of identifiers of security groups within your Amazon VPC. The security groups should enable
        # Amazon Kendra to connect to the data source.

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)

        # A list of identifiers for subnets within your Amazon VPC. The subnets should be able to connect to
        # each other in the VPC, and they should have outgoing access to the Internet through a NAT device.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)

        def initialize(
          @security_group_ids : Array(String),
          @subnet_ids : Array(String)
        )
        end
      end

      # Provides the configuration information to an Amazon Kendra supported database .

      struct DatabaseConfiguration
        include JSON::Serializable

        # Information about where the index should get the document information from the database.

        @[JSON::Field(key: "ColumnConfiguration")]
        getter column_configuration : Types::ColumnConfiguration

        # Configuration information that's required to connect to a database.

        @[JSON::Field(key: "ConnectionConfiguration")]
        getter connection_configuration : Types::ConnectionConfiguration

        # The type of database engine that runs the database.

        @[JSON::Field(key: "DatabaseEngineType")]
        getter database_engine_type : String

        # Information about the database column that provides information for user context filtering.

        @[JSON::Field(key: "AclConfiguration")]
        getter acl_configuration : Types::AclConfiguration?

        # Provides information about how Amazon Kendra uses quote marks around SQL identifiers when querying a
        # database data source.

        @[JSON::Field(key: "SqlConfiguration")]
        getter sql_configuration : Types::SqlConfiguration?


        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::DataSourceVpcConfiguration?

        def initialize(
          @column_configuration : Types::ColumnConfiguration,
          @connection_configuration : Types::ConnectionConfiguration,
          @database_engine_type : String,
          @acl_configuration : Types::AclConfiguration? = nil,
          @sql_configuration : Types::SqlConfiguration? = nil,
          @vpc_configuration : Types::DataSourceVpcConfiguration? = nil
        )
        end
      end


      struct DeleteAccessControlConfigurationRequest
        include JSON::Serializable

        # The identifier of the access control configuration you want to delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for an access control configuration.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @id : String,
          @index_id : String
        )
        end
      end


      struct DeleteAccessControlConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteDataSourceRequest
        include JSON::Serializable

        # The identifier of the data source connector you want to delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index used with the data source connector.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @id : String,
          @index_id : String
        )
        end
      end


      struct DeleteExperienceRequest
        include JSON::Serializable

        # The identifier of your Amazon Kendra experience you want to delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for your Amazon Kendra experience.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @id : String,
          @index_id : String
        )
        end
      end


      struct DeleteExperienceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteFaqRequest
        include JSON::Serializable

        # The identifier of the FAQ you want to remove.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for the FAQ.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @id : String,
          @index_id : String
        )
        end
      end


      struct DeleteIndexRequest
        include JSON::Serializable

        # The identifier of the index you want to delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DeletePrincipalMappingRequest
        include JSON::Serializable

        # The identifier of the group you want to delete.

        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        # The identifier of the index you want to delete a group from.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # The identifier of the data source you want to delete a group from. A group can be tied to multiple
        # data sources. You can delete a group from accessing documents in a certain data source. For example,
        # the groups "Research", "Engineering", and "Sales and Marketing" are all tied to the company's
        # documents stored in the data sources Confluence and Salesforce. You want to delete "Research" and
        # "Engineering" groups from Salesforce, so that these groups cannot access customer-related documents
        # stored in Salesforce. Only "Sales and Marketing" should access documents in the Salesforce data
        # source.

        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String?

        # The timestamp identifier you specify to ensure Amazon Kendra does not override the latest DELETE
        # action with previous actions. The highest number ID, which is the ordering ID, is the latest action
        # you want to process and apply on top of other actions with lower number IDs. This prevents previous
        # actions with lower number IDs from possibly overriding the latest action. The ordering ID can be the
        # Unix time of the last update you made to a group members list. You would then provide this list when
        # calling PutPrincipalMapping . This ensures your DELETE action for that updated group with the latest
        # members list doesn't get overwritten by earlier DELETE actions for the same group which are yet to
        # be processed. The default ordering ID is the current Unix time in milliseconds that the action was
        # received by Amazon Kendra.

        @[JSON::Field(key: "OrderingId")]
        getter ordering_id : Int64?

        def initialize(
          @group_id : String,
          @index_id : String,
          @data_source_id : String? = nil,
          @ordering_id : Int64? = nil
        )
        end
      end


      struct DeleteQuerySuggestionsBlockListRequest
        include JSON::Serializable

        # The identifier of the block list you want to delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for the block list.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @id : String,
          @index_id : String
        )
        end
      end


      struct DeleteThesaurusRequest
        include JSON::Serializable

        # The identifier of the thesaurus you want to delete.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for the thesaurus.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @id : String,
          @index_id : String
        )
        end
      end


      struct DescribeAccessControlConfigurationRequest
        include JSON::Serializable

        # The identifier of the access control configuration you want to get information on.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for an access control configuration.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @id : String,
          @index_id : String
        )
        end
      end


      struct DescribeAccessControlConfigurationResponse
        include JSON::Serializable

        # The name for the access control configuration.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Information on principals (users and/or groups) and which documents they should have access to. This
        # is useful for user context filtering, where search results are filtered based on the user or their
        # group access to documents.

        @[JSON::Field(key: "AccessControlList")]
        getter access_control_list : Array(Types::Principal)?

        # The description for the access control configuration.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The error message containing details if there are issues processing the access control
        # configuration.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The list of principal lists that define the hierarchy for which documents users should have access
        # to.

        @[JSON::Field(key: "HierarchicalAccessControlList")]
        getter hierarchical_access_control_list : Array(Types::HierarchicalPrincipal)?

        def initialize(
          @name : String,
          @access_control_list : Array(Types::Principal)? = nil,
          @description : String? = nil,
          @error_message : String? = nil,
          @hierarchical_access_control_list : Array(Types::HierarchicalPrincipal)? = nil
        )
        end
      end


      struct DescribeDataSourceRequest
        include JSON::Serializable

        # The identifier of the data source connector.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index used with the data source connector.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @id : String,
          @index_id : String
        )
        end
      end


      struct DescribeDataSourceResponse
        include JSON::Serializable

        # Configuration details for the data source connector. This shows how the data source is configured.
        # The configuration options for a data source depend on the data source provider.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::DataSourceConfiguration?

        # The Unix timestamp when the data source connector was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # Configuration information for altering document metadata and content during the document ingestion
        # process when you describe a data source. For more information on how to create, modify and delete
        # document metadata, or make other content alterations when you ingest documents into Amazon Kendra,
        # see Customizing document metadata during the ingestion process .

        @[JSON::Field(key: "CustomDocumentEnrichmentConfiguration")]
        getter custom_document_enrichment_configuration : Types::CustomDocumentEnrichmentConfiguration?

        # The description for the data source connector.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # When the Status field value is FAILED , the ErrorMessage field contains a description of the error
        # that caused the data source to fail.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The identifier of the data source connector.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The identifier of the index used with the data source connector.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String?

        # The code for a language. This shows a supported language for all documents in the data source.
        # English is supported by default. For more information on supported languages, including their codes,
        # see Adding documents in languages other than English .

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The name for the data source connector.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the IAM role with permission to access the data source and
        # required resources.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The schedule for Amazon Kendra to update the index.

        @[JSON::Field(key: "Schedule")]
        getter schedule : String?

        # The current status of the data source connector. When the status is ACTIVE the data source is ready
        # to use. When the status is FAILED , the ErrorMessage field contains the reason that the data source
        # failed.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The type of the data source. For example, SHAREPOINT .

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The Unix timestamp when the data source connector was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        # Configuration information for an Amazon Virtual Private Cloud to connect to your data source. For
        # more information, see Configuring a VPC .

        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::DataSourceVpcConfiguration?

        def initialize(
          @configuration : Types::DataSourceConfiguration? = nil,
          @created_at : Time? = nil,
          @custom_document_enrichment_configuration : Types::CustomDocumentEnrichmentConfiguration? = nil,
          @description : String? = nil,
          @error_message : String? = nil,
          @id : String? = nil,
          @index_id : String? = nil,
          @language_code : String? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @schedule : String? = nil,
          @status : String? = nil,
          @type : String? = nil,
          @updated_at : Time? = nil,
          @vpc_configuration : Types::DataSourceVpcConfiguration? = nil
        )
        end
      end


      struct DescribeExperienceRequest
        include JSON::Serializable

        # The identifier of your Amazon Kendra experience you want to get information on.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for your Amazon Kendra experience.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @id : String,
          @index_id : String
        )
        end
      end


      struct DescribeExperienceResponse
        include JSON::Serializable

        # Shows the configuration information for your Amazon Kendra experience. This includes
        # ContentSourceConfiguration , which specifies the data source IDs and/or FAQ IDs, and
        # UserIdentityConfiguration , which specifies the user or group information to grant access to your
        # Amazon Kendra experience.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::ExperienceConfiguration?

        # The Unix timestamp when your Amazon Kendra experience was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # Shows the description for your Amazon Kendra experience.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Shows the endpoint URLs for your Amazon Kendra experiences. The URLs are unique and fully hosted by
        # Amazon Web Services.

        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Array(Types::ExperienceEndpoint)?

        # The reason your Amazon Kendra experience could not properly process.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # Shows the identifier of your Amazon Kendra experience.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Shows the identifier of the index for your Amazon Kendra experience.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String?

        # Shows the name of your Amazon Kendra experience.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the IAM role with permission to access the Query API,
        # QuerySuggestions API, SubmitFeedback API, and IAM Identity Center that stores your users and groups
        # information.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The current processing status of your Amazon Kendra experience. When the status is ACTIVE , your
        # Amazon Kendra experience is ready to use. When the status is FAILED , the ErrorMessage field
        # contains the reason that this failed.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Unix timestamp when your Amazon Kendra experience was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @configuration : Types::ExperienceConfiguration? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @endpoints : Array(Types::ExperienceEndpoint)? = nil,
          @error_message : String? = nil,
          @id : String? = nil,
          @index_id : String? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct DescribeFaqRequest
        include JSON::Serializable

        # The identifier of the FAQ you want to get information on.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for the FAQ.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @id : String,
          @index_id : String
        )
        end
      end


      struct DescribeFaqResponse
        include JSON::Serializable

        # The Unix timestamp when the FAQ was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The description of the FAQ that you provided when it was created.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # If the Status field is FAILED , the ErrorMessage field contains the reason why the FAQ failed.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The file format used for the FAQ file.

        @[JSON::Field(key: "FileFormat")]
        getter file_format : String?

        # The identifier of the FAQ.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The identifier of the index for the FAQ.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String?

        # The code for a language. This shows a supported language for the FAQ document. English is supported
        # by default. For more information on supported languages, including their codes, see Adding documents
        # in languages other than English .

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The name that you gave the FAQ when it was created.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the IAM role that provides access to the S3 bucket containing the
        # FAQ file.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?


        @[JSON::Field(key: "S3Path")]
        getter s3_path : Types::S3Path?

        # The status of the FAQ. It is ready to use when the status is ACTIVE .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Unix timestamp when the FAQ was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @error_message : String? = nil,
          @file_format : String? = nil,
          @id : String? = nil,
          @index_id : String? = nil,
          @language_code : String? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @s3_path : Types::S3Path? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct DescribeFeaturedResultsSetRequest
        include JSON::Serializable

        # The identifier of the set of featured results that you want to get information on.

        @[JSON::Field(key: "FeaturedResultsSetId")]
        getter featured_results_set_id : String

        # The identifier of the index used for featuring results.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @featured_results_set_id : String,
          @index_id : String
        )
        end
      end


      struct DescribeFeaturedResultsSetResponse
        include JSON::Serializable

        # The Unix timestamp when the set of the featured results was created.

        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : Int64?

        # The description for the set of featured results.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The list of document IDs that don't exist but you have specified as featured documents. Amazon
        # Kendra cannot feature these documents if they don't exist in the index. You can check the status of
        # a document and its ID or check for documents with status errors using the BatchGetDocumentStatus
        # API.

        @[JSON::Field(key: "FeaturedDocumentsMissing")]
        getter featured_documents_missing : Array(Types::FeaturedDocumentMissing)?

        # The list of document IDs for the documents you want to feature with their metadata information. For
        # more information on the list of featured documents, see FeaturedResultsSet .

        @[JSON::Field(key: "FeaturedDocumentsWithMetadata")]
        getter featured_documents_with_metadata : Array(Types::FeaturedDocumentWithMetadata)?

        # The identifier of the set of featured results.

        @[JSON::Field(key: "FeaturedResultsSetId")]
        getter featured_results_set_id : String?

        # The name for the set of featured results.

        @[JSON::Field(key: "FeaturedResultsSetName")]
        getter featured_results_set_name : String?

        # The timestamp when the set of featured results was last updated.

        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Int64?

        # The list of queries for featuring results. For more information on the list of queries, see
        # FeaturedResultsSet .

        @[JSON::Field(key: "QueryTexts")]
        getter query_texts : Array(String)?

        # The current status of the set of featured results. When the value is ACTIVE , featured results are
        # ready for use. You can still configure your settings before setting the status to ACTIVE . You can
        # set the status to ACTIVE or INACTIVE using the UpdateFeaturedResultsSet API. The queries you specify
        # for featured results must be unique per featured results set for each index, whether the status is
        # ACTIVE or INACTIVE .

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_timestamp : Int64? = nil,
          @description : String? = nil,
          @featured_documents_missing : Array(Types::FeaturedDocumentMissing)? = nil,
          @featured_documents_with_metadata : Array(Types::FeaturedDocumentWithMetadata)? = nil,
          @featured_results_set_id : String? = nil,
          @featured_results_set_name : String? = nil,
          @last_updated_timestamp : Int64? = nil,
          @query_texts : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end


      struct DescribeIndexRequest
        include JSON::Serializable

        # The identifier of the index you want to get information on.

        @[JSON::Field(key: "Id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end


      struct DescribeIndexResponse
        include JSON::Serializable

        # For Enterprise Edition indexes, you can choose to use additional capacity to meet the needs of your
        # application. This contains the capacity units used for the index. A query or document storage
        # capacity of zero indicates that the index is using the default capacity. For more information on the
        # default capacity for an index and adjusting this, see Adjusting capacity .

        @[JSON::Field(key: "CapacityUnits")]
        getter capacity_units : Types::CapacityUnitsConfiguration?

        # The Unix timestamp when the index was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The description for the index.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Configuration information for document metadata or fields. Document metadata are fields or
        # attributes associated with your documents. For example, the company department name associated with
        # each document.

        @[JSON::Field(key: "DocumentMetadataConfigurations")]
        getter document_metadata_configurations : Array(Types::DocumentMetadataConfiguration)?

        # The Amazon Kendra edition used for the index. You decide the edition when you create the index.

        @[JSON::Field(key: "Edition")]
        getter edition : String?

        # When the Status field value is FAILED , the ErrorMessage field contains a message that explains why.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The identifier of the index.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Provides information about the number of FAQ questions and answers and the number of text documents
        # indexed.

        @[JSON::Field(key: "IndexStatistics")]
        getter index_statistics : Types::IndexStatistics?

        # The name of the index.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the IAM role that gives Amazon Kendra permission to write to your
        # Amazon CloudWatch logs.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The identifier of the KMS customer master key (CMK) that is used to encrypt your data. Amazon Kendra
        # doesn't support asymmetric CMKs.

        @[JSON::Field(key: "ServerSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # The current status of the index. When the value is ACTIVE , the index is ready for use. If the
        # Status field value is FAILED , the ErrorMessage field contains a message that explains why.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Unix timestamp when the index was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        # The user context policy for the Amazon Kendra index.

        @[JSON::Field(key: "UserContextPolicy")]
        getter user_context_policy : String?

        # Whether you have enabled IAM Identity Center identity source for your users and groups. This is
        # useful for user context filtering, where search results are filtered based on the user or their
        # group access to documents.

        @[JSON::Field(key: "UserGroupResolutionConfiguration")]
        getter user_group_resolution_configuration : Types::UserGroupResolutionConfiguration?

        # The user token configuration for the Amazon Kendra index.

        @[JSON::Field(key: "UserTokenConfigurations")]
        getter user_token_configurations : Array(Types::UserTokenConfiguration)?

        def initialize(
          @capacity_units : Types::CapacityUnitsConfiguration? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @document_metadata_configurations : Array(Types::DocumentMetadataConfiguration)? = nil,
          @edition : String? = nil,
          @error_message : String? = nil,
          @id : String? = nil,
          @index_statistics : Types::IndexStatistics? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil,
          @user_context_policy : String? = nil,
          @user_group_resolution_configuration : Types::UserGroupResolutionConfiguration? = nil,
          @user_token_configurations : Array(Types::UserTokenConfiguration)? = nil
        )
        end
      end


      struct DescribePrincipalMappingRequest
        include JSON::Serializable

        # The identifier of the group required to check the processing of PUT and DELETE actions for mapping
        # users to their groups.

        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        # The identifier of the index required to check the processing of PUT and DELETE actions for mapping
        # users to their groups.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # The identifier of the data source to check the processing of PUT and DELETE actions for mapping
        # users to their groups.

        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String?

        def initialize(
          @group_id : String,
          @index_id : String,
          @data_source_id : String? = nil
        )
        end
      end


      struct DescribePrincipalMappingResponse
        include JSON::Serializable

        # Shows the identifier of the data source to see information on the processing of PUT and DELETE
        # actions for mapping users to their groups.

        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String?

        # Shows the identifier of the group to see information on the processing of PUT and DELETE actions for
        # mapping users to their groups.

        @[JSON::Field(key: "GroupId")]
        getter group_id : String?

        # Shows the following information on the processing of PUT and DELETE actions for mapping users to
        # their groups: Status—the status can be either PROCESSING , SUCCEEDED , DELETING , DELETED , or
        # FAILED . Last updated—the last date-time an action was updated. Received—the last date-time an
        # action was received or submitted. Ordering ID—the latest action that should process and apply after
        # other actions. Failure reason—the reason an action could not be processed.

        @[JSON::Field(key: "GroupOrderingIdSummaries")]
        getter group_ordering_id_summaries : Array(Types::GroupOrderingIdSummary)?

        # Shows the identifier of the index to see information on the processing of PUT and DELETE actions for
        # mapping users to their groups.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String?

        def initialize(
          @data_source_id : String? = nil,
          @group_id : String? = nil,
          @group_ordering_id_summaries : Array(Types::GroupOrderingIdSummary)? = nil,
          @index_id : String? = nil
        )
        end
      end


      struct DescribeQuerySuggestionsBlockListRequest
        include JSON::Serializable

        # The identifier of the block list you want to get information on.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for the block list.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @id : String,
          @index_id : String
        )
        end
      end


      struct DescribeQuerySuggestionsBlockListResponse
        include JSON::Serializable

        # The Unix timestamp when a block list for query suggestions was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The description for the block list.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The error message containing details if there are issues processing the block list.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The current size of the block list text file in S3.

        @[JSON::Field(key: "FileSizeBytes")]
        getter file_size_bytes : Int64?

        # The identifier of the block list.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The identifier of the index for the block list.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String?

        # The current number of valid, non-empty words or phrases in the block list text file.

        @[JSON::Field(key: "ItemCount")]
        getter item_count : Int32?

        # The name of the block list.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The IAM (Identity and Access Management) role used by Amazon Kendra to access the block list text
        # file in S3. The role needs S3 read permissions to your file in S3 and needs to give STS (Security
        # Token Service) assume role permissions to Amazon Kendra.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Shows the current S3 path to your block list text file in your S3 bucket. Each block word or phrase
        # should be on a separate line in a text file. For information on the current quota limits for block
        # lists, see Quotas for Amazon Kendra .

        @[JSON::Field(key: "SourceS3Path")]
        getter source_s3_path : Types::S3Path?

        # The current status of the block list. When the value is ACTIVE , the block list is ready for use.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Unix timestamp when a block list for query suggestions was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @error_message : String? = nil,
          @file_size_bytes : Int64? = nil,
          @id : String? = nil,
          @index_id : String? = nil,
          @item_count : Int32? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @source_s3_path : Types::S3Path? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct DescribeQuerySuggestionsConfigRequest
        include JSON::Serializable

        # The identifier of the index with query suggestions that you want to get information on.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @index_id : String
        )
        end
      end


      struct DescribeQuerySuggestionsConfigResponse
        include JSON::Serializable

        # Configuration information for the document fields/attributes that you want to base query suggestions
        # on.

        @[JSON::Field(key: "AttributeSuggestionsConfig")]
        getter attribute_suggestions_config : Types::AttributeSuggestionsDescribeConfig?

        # TRUE to use all queries, otherwise use only queries that include user information to generate the
        # query suggestions.

        @[JSON::Field(key: "IncludeQueriesWithoutUserInformation")]
        getter include_queries_without_user_information : Bool?

        # The Unix timestamp when query suggestions for an index was last cleared. After you clear
        # suggestions, Amazon Kendra learns new suggestions based on new queries added to the query log from
        # the time you cleared suggestions. Amazon Kendra only considers re-occurences of a query from the
        # time you cleared suggestions.

        @[JSON::Field(key: "LastClearTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_clear_time : Time?

        # The Unix timestamp when query suggestions for an index was last updated. Amazon Kendra automatically
        # updates suggestions every 24 hours, after you change a setting or after you apply a block list .

        @[JSON::Field(key: "LastSuggestionsBuildTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_suggestions_build_time : Time?

        # The minimum number of unique users who must search a query in order for the query to be eligible to
        # suggest to your users.

        @[JSON::Field(key: "MinimumNumberOfQueryingUsers")]
        getter minimum_number_of_querying_users : Int32?

        # The minimum number of times a query must be searched in order for the query to be eligible to
        # suggest to your users.

        @[JSON::Field(key: "MinimumQueryCount")]
        getter minimum_query_count : Int32?

        # Whether query suggestions are currently in ENABLED mode or LEARN_ONLY mode. By default, Amazon
        # Kendra enables query suggestions. LEARN_ONLY turns off query suggestions for your users. You can
        # change the mode using the UpdateQuerySuggestionsConfig API.

        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # How recent your queries are in your query log time window (in days).

        @[JSON::Field(key: "QueryLogLookBackWindowInDays")]
        getter query_log_look_back_window_in_days : Int32?

        # Whether the status of query suggestions settings is currently ACTIVE or UPDATING . Active means the
        # current settings apply and Updating means your changed settings are in the process of applying.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The current total count of query suggestions for an index. This count can change when you update
        # your query suggestions settings, if you filter out certain queries from suggestions using a block
        # list, and as the query log accumulates more queries for Amazon Kendra to learn from. If the count is
        # much lower than you expected, it could be because Amazon Kendra needs more queries in the query
        # history to learn from or your current query suggestions settings are too strict.

        @[JSON::Field(key: "TotalSuggestionsCount")]
        getter total_suggestions_count : Int32?

        def initialize(
          @attribute_suggestions_config : Types::AttributeSuggestionsDescribeConfig? = nil,
          @include_queries_without_user_information : Bool? = nil,
          @last_clear_time : Time? = nil,
          @last_suggestions_build_time : Time? = nil,
          @minimum_number_of_querying_users : Int32? = nil,
          @minimum_query_count : Int32? = nil,
          @mode : String? = nil,
          @query_log_look_back_window_in_days : Int32? = nil,
          @status : String? = nil,
          @total_suggestions_count : Int32? = nil
        )
        end
      end


      struct DescribeThesaurusRequest
        include JSON::Serializable

        # The identifier of the thesaurus you want to get information on.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for the thesaurus.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @id : String,
          @index_id : String
        )
        end
      end


      struct DescribeThesaurusResponse
        include JSON::Serializable

        # The Unix timestamp when the thesaurus was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The thesaurus description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # When the Status field value is FAILED , the ErrorMessage field provides more information.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The size of the thesaurus file in bytes.

        @[JSON::Field(key: "FileSizeBytes")]
        getter file_size_bytes : Int64?

        # The identifier of the thesaurus.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The identifier of the index for the thesaurus.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String?

        # The thesaurus name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # An IAM role that gives Amazon Kendra permissions to access thesaurus file specified in SourceS3Path
        # .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?


        @[JSON::Field(key: "SourceS3Path")]
        getter source_s3_path : Types::S3Path?

        # The current status of the thesaurus. When the value is ACTIVE , queries are able to use the
        # thesaurus. If the Status field value is FAILED , the ErrorMessage field provides more information.
        # If the status is ACTIVE_BUT_UPDATE_FAILED , it means that Amazon Kendra could not ingest the new
        # thesaurus file. The old thesaurus file is still active.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The number of synonym rules in the thesaurus file.

        @[JSON::Field(key: "SynonymRuleCount")]
        getter synonym_rule_count : Int64?

        # The number of unique terms in the thesaurus file. For example, the synonyms a,b,c and a=&gt;d , the
        # term count would be 4.

        @[JSON::Field(key: "TermCount")]
        getter term_count : Int64?

        # The Unix timestamp when the thesaurus was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @error_message : String? = nil,
          @file_size_bytes : Int64? = nil,
          @id : String? = nil,
          @index_id : String? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @source_s3_path : Types::S3Path? = nil,
          @status : String? = nil,
          @synonym_rule_count : Int64? = nil,
          @term_count : Int64? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct DisassociateEntitiesFromExperienceRequest
        include JSON::Serializable

        # Lists users or groups in your IAM Identity Center identity source.

        @[JSON::Field(key: "EntityList")]
        getter entity_list : Array(Types::EntityConfiguration)

        # The identifier of your Amazon Kendra experience.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for your Amazon Kendra experience.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @entity_list : Array(Types::EntityConfiguration),
          @id : String,
          @index_id : String
        )
        end
      end


      struct DisassociateEntitiesFromExperienceResponse
        include JSON::Serializable

        # Lists the users or groups in your IAM Identity Center identity source that failed to properly remove
        # access to your Amazon Kendra experience.

        @[JSON::Field(key: "FailedEntityList")]
        getter failed_entity_list : Array(Types::FailedEntity)?

        def initialize(
          @failed_entity_list : Array(Types::FailedEntity)? = nil
        )
        end
      end


      struct DisassociatePersonasFromEntitiesRequest
        include JSON::Serializable

        # The identifiers of users or groups in your IAM Identity Center identity source. For example, user
        # IDs could be user emails.

        @[JSON::Field(key: "EntityIds")]
        getter entity_ids : Array(String)

        # The identifier of your Amazon Kendra experience.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for your Amazon Kendra experience.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @entity_ids : Array(String),
          @id : String,
          @index_id : String
        )
        end
      end


      struct DisassociatePersonasFromEntitiesResponse
        include JSON::Serializable

        # Lists the users or groups in your IAM Identity Center identity source that failed to properly remove
        # access to your Amazon Kendra experience.

        @[JSON::Field(key: "FailedEntityList")]
        getter failed_entity_list : Array(Types::FailedEntity)?

        def initialize(
          @failed_entity_list : Array(Types::FailedEntity)? = nil
        )
        end
      end

      # A document in an index.

      struct Document
        include JSON::Serializable

        # A identifier of the document in the index. Note, each document ID must be unique per index. You
        # cannot create a data source to index your documents with their unique IDs and then use the
        # BatchPutDocument API to index the same documents, or vice versa. You can delete a data source and
        # then use the BatchPutDocument API to index the same documents, or vice versa.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the access control configuration that you want to apply to the document.

        @[JSON::Field(key: "AccessControlConfigurationId")]
        getter access_control_configuration_id : String?

        # Information on principals (users and/or groups) and which documents they should have access to. This
        # is useful for user context filtering, where search results are filtered based on the user or their
        # group access to documents.

        @[JSON::Field(key: "AccessControlList")]
        getter access_control_list : Array(Types::Principal)?

        # Custom attributes to apply to the document. Use the custom attributes to provide additional
        # information for searching, to provide facets for refining searches, and to provide additional
        # information in the query response. For example, 'DataSourceId' and 'DataSourceSyncJobId' are custom
        # attributes that provide information on the synchronization of documents running on a data source.
        # Note, 'DataSourceSyncJobId' could be an optional custom attribute as Amazon Kendra will use the ID
        # of a running sync job.

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::DocumentAttribute)?

        # The contents of the document. Documents passed to the Blob parameter must be base64 encoded. Your
        # code might not need to encode the document file bytes if you're using an Amazon Web Services SDK to
        # call Amazon Kendra APIs. If you are calling the Amazon Kendra endpoint directly using REST, you must
        # base64 encode the contents before sending.

        @[JSON::Field(key: "Blob")]
        getter blob : Bytes?

        # The file type of the document in the Blob field. If you want to index snippets or subsets of HTML
        # documents instead of the entirety of the HTML documents, you must add the HTML start and closing
        # tags ( &lt;HTML&gt;content&lt;/HTML&gt; ) around the content.

        @[JSON::Field(key: "ContentType")]
        getter content_type : String?

        # The list of principal lists that define the hierarchy for which documents users should have access
        # to.

        @[JSON::Field(key: "HierarchicalAccessControlList")]
        getter hierarchical_access_control_list : Array(Types::HierarchicalPrincipal)?


        @[JSON::Field(key: "S3Path")]
        getter s3_path : Types::S3Path?

        # The title of the document.

        @[JSON::Field(key: "Title")]
        getter title : String?

        def initialize(
          @id : String,
          @access_control_configuration_id : String? = nil,
          @access_control_list : Array(Types::Principal)? = nil,
          @attributes : Array(Types::DocumentAttribute)? = nil,
          @blob : Bytes? = nil,
          @content_type : String? = nil,
          @hierarchical_access_control_list : Array(Types::HierarchicalPrincipal)? = nil,
          @s3_path : Types::S3Path? = nil,
          @title : String? = nil
        )
        end
      end

      # A document attribute or metadata field. To create custom document attributes, see Custom attributes
      # .

      struct DocumentAttribute
        include JSON::Serializable

        # The identifier for the attribute.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the attribute.

        @[JSON::Field(key: "Value")]
        getter value : Types::DocumentAttributeValue

        def initialize(
          @key : String,
          @value : Types::DocumentAttributeValue
        )
        end
      end

      # The condition used for the target document attribute or metadata field when ingesting documents into
      # Amazon Kendra. You use this with DocumentAttributeTarget to apply the condition . For example, you
      # can create the 'Department' target field and have it prefill department names associated with the
      # documents based on information in the 'Source_URI' field. Set the condition that if the 'Source_URI'
      # field contains 'financial' in its URI value, then prefill the target field 'Department' with the
      # target value 'Finance' for the document. Amazon Kendra cannot create a target field if it has not
      # already been created as an index field. After you create your index field, you can create a document
      # metadata field using DocumentAttributeTarget . Amazon Kendra then will map your newly created
      # metadata field to your index field.

      struct DocumentAttributeCondition
        include JSON::Serializable

        # The identifier of the document attribute used for the condition. For example, 'Source_URI' could be
        # an identifier for the attribute or metadata field that contains source URIs associated with the
        # documents. Amazon Kendra currently does not support _document_body as an attribute key used for the
        # condition.

        @[JSON::Field(key: "ConditionDocumentAttributeKey")]
        getter condition_document_attribute_key : String

        # The condition operator. For example, you can use 'Contains' to partially match a string.

        @[JSON::Field(key: "Operator")]
        getter operator : String

        # The value used by the operator. For example, you can specify the value 'financial' for strings in
        # the 'Source_URI' field that partially match or contain this value.

        @[JSON::Field(key: "ConditionOnValue")]
        getter condition_on_value : Types::DocumentAttributeValue?

        def initialize(
          @condition_document_attribute_key : String,
          @operator : String,
          @condition_on_value : Types::DocumentAttributeValue? = nil
        )
        end
      end

      # The target document attribute or metadata field you want to alter when ingesting documents into
      # Amazon Kendra. For example, you can delete customer identification numbers associated with the
      # documents, stored in the document metadata field called 'Customer_ID'. You set the target key as
      # 'Customer_ID' and the deletion flag to TRUE . This removes all customer ID values in the field
      # 'Customer_ID'. This would scrub personally identifiable information from each document's metadata.
      # Amazon Kendra cannot create a target field if it has not already been created as an index field.
      # After you create your index field, you can create a document metadata field using
      # DocumentAttributeTarget . Amazon Kendra then will map your newly created metadata field to your
      # index field. You can also use this with DocumentAttributeCondition .

      struct DocumentAttributeTarget
        include JSON::Serializable

        # The identifier of the target document attribute or metadata field. For example, 'Department' could
        # be an identifier for the target attribute or metadata field that includes the department names
        # associated with the documents.

        @[JSON::Field(key: "TargetDocumentAttributeKey")]
        getter target_document_attribute_key : String?

        # The target value you want to create for the target attribute. For example, 'Finance' could be the
        # target value for the target attribute key 'Department'.

        @[JSON::Field(key: "TargetDocumentAttributeValue")]
        getter target_document_attribute_value : Types::DocumentAttributeValue?

        # TRUE to delete the existing target value for your specified target attribute key. You cannot create
        # a target value and set this to TRUE . To create a target value ( TargetDocumentAttributeValue ), set
        # this to FALSE .

        @[JSON::Field(key: "TargetDocumentAttributeValueDeletion")]
        getter target_document_attribute_value_deletion : Bool?

        def initialize(
          @target_document_attribute_key : String? = nil,
          @target_document_attribute_value : Types::DocumentAttributeValue? = nil,
          @target_document_attribute_value_deletion : Bool? = nil
        )
        end
      end

      # The value of a document attribute. You can only provide one value for a document attribute.

      struct DocumentAttributeValue
        include JSON::Serializable

        # A date expressed as an ISO 8601 string. It is important for the time zone to be included in the ISO
        # 8601 date-time format. For example, 2012-03-25T12:30:10+01:00 is the ISO 8601 date-time format for
        # March 25th 2012 at 12:30PM (plus 10 seconds) in Central European Time.

        @[JSON::Field(key: "DateValue", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter date_value : Time?

        # A long integer value.

        @[JSON::Field(key: "LongValue")]
        getter long_value : Int64?

        # A list of strings. The default maximum length or number of strings is 10.

        @[JSON::Field(key: "StringListValue")]
        getter string_list_value : Array(String)?

        # A string, such as "department".

        @[JSON::Field(key: "StringValue")]
        getter string_value : String?

        def initialize(
          @date_value : Time? = nil,
          @long_value : Int64? = nil,
          @string_list_value : Array(String)? = nil,
          @string_value : String? = nil
        )
        end
      end

      # Provides the count of documents that match a particular document attribute or field when doing a
      # faceted search.

      struct DocumentAttributeValueCountPair
        include JSON::Serializable

        # The number of documents in the response that have the attribute/field value for the key.

        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # The value of the attribute/field. For example, "HR".

        @[JSON::Field(key: "DocumentAttributeValue")]
        getter document_attribute_value : Types::DocumentAttributeValue?

        # Contains the results of a document attribute/field that is a nested facet. A FacetResult contains
        # the counts for each facet nested within a facet. For example, the document attribute or facet
        # "Department" includes a value called "Engineering". In addition, the document attribute or facet
        # "SubDepartment" includes the values "Frontend" and "Backend" for documents assigned to
        # "Engineering". You can display nested facets in the search results so that documents can be searched
        # not only by department but also by a sub department within a department. The counts for documents
        # that belong to "Frontend" and "Backend" within "Engineering" are returned for a query.

        @[JSON::Field(key: "FacetResults")]
        getter facet_results : Array(Types::FacetResult)?

        def initialize(
          @count : Int32? = nil,
          @document_attribute_value : Types::DocumentAttributeValue? = nil,
          @facet_results : Array(Types::FacetResult)? = nil
        )
        end
      end

      # Identifies a document for which to retrieve status information

      struct DocumentInfo
        include JSON::Serializable

        # The identifier of the document.

        @[JSON::Field(key: "DocumentId")]
        getter document_id : String

        # Attributes that identify a specific version of a document to check. The only valid attributes are:
        # version datasourceId jobExecutionId The attributes follow these rules: dataSourceId and
        # jobExecutionId must be used together. version is ignored if dataSourceId and jobExecutionId are not
        # provided. If dataSourceId and jobExecutionId are provided, but version is not, the version defaults
        # to "0".

        @[JSON::Field(key: "Attributes")]
        getter attributes : Array(Types::DocumentAttribute)?

        def initialize(
          @document_id : String,
          @attributes : Array(Types::DocumentAttribute)? = nil
        )
        end
      end

      # Specifies the properties, such as relevance tuning and searchability, of an index field.

      struct DocumentMetadataConfiguration
        include JSON::Serializable

        # The name of the index field.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The data type of the index field.

        @[JSON::Field(key: "Type")]
        getter type : String

        # Provides tuning parameters to determine how the field affects the search results.

        @[JSON::Field(key: "Relevance")]
        getter relevance : Types::Relevance?

        # Provides information about how the field is used during a search.

        @[JSON::Field(key: "Search")]
        getter search : Types::Search?

        def initialize(
          @name : String,
          @type : String,
          @relevance : Types::Relevance? = nil,
          @search : Types::Search? = nil
        )
        end
      end

      # Overrides the document relevance properties of a custom index field.

      struct DocumentRelevanceConfiguration
        include JSON::Serializable

        # The name of the index field.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Provides information for tuning the relevance of a field in a search. When a query includes terms
        # that match the field, the results are given a boost in the response based on these tuning
        # parameters.

        @[JSON::Field(key: "Relevance")]
        getter relevance : Types::Relevance

        def initialize(
          @name : String,
          @relevance : Types::Relevance
        )
        end
      end

      # Document metadata files that contain information such as the document access control information,
      # source URI, document author, and custom attributes. Each metadata file contains metadata about a
      # single document.

      struct DocumentsMetadataConfiguration
        include JSON::Serializable

        # A prefix used to filter metadata configuration files in the Amazon Web Services S3 bucket. The S3
        # bucket might contain multiple metadata files. Use S3Prefix to include only the desired metadata
        # files.

        @[JSON::Field(key: "S3Prefix")]
        getter s3_prefix : String?

        def initialize(
          @s3_prefix : String? = nil
        )
        end
      end

      # Provides the configuration information for users or groups in your IAM Identity Center identity
      # source to grant access your Amazon Kendra experience.

      struct EntityConfiguration
        include JSON::Serializable

        # The identifier of a user or group in your IAM Identity Center identity source. For example, a user
        # ID could be an email.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String

        # Specifies whether you are configuring a User or a Group .

        @[JSON::Field(key: "EntityType")]
        getter entity_type : String

        def initialize(
          @entity_id : String,
          @entity_type : String
        )
        end
      end

      # Information about the user entity.

      struct EntityDisplayData
        include JSON::Serializable

        # The first name of the user.

        @[JSON::Field(key: "FirstName")]
        getter first_name : String?

        # The name of the group.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # The user name of the user.

        @[JSON::Field(key: "IdentifiedUserName")]
        getter identified_user_name : String?

        # The last name of the user.

        @[JSON::Field(key: "LastName")]
        getter last_name : String?

        # The name of the user.

        @[JSON::Field(key: "UserName")]
        getter user_name : String?

        def initialize(
          @first_name : String? = nil,
          @group_name : String? = nil,
          @identified_user_name : String? = nil,
          @last_name : String? = nil,
          @user_name : String? = nil
        )
        end
      end

      # Provides the configuration information for users or groups in your IAM Identity Center identity
      # source for access to your Amazon Kendra experience. Specific permissions are defined for each user
      # or group once they are granted access to your Amazon Kendra experience.

      struct EntityPersonaConfiguration
        include JSON::Serializable

        # The identifier of a user or group in your IAM Identity Center identity source. For example, a user
        # ID could be an email.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String

        # The persona that defines the specific permissions of the user or group in your IAM Identity Center
        # identity source. The available personas or access roles are Owner and Viewer . For more information
        # on these personas, see Providing access to your search page .

        @[JSON::Field(key: "Persona")]
        getter persona : String

        def initialize(
          @entity_id : String,
          @persona : String
        )
        end
      end

      # Specifies the configuration information needed to customize how collapsed search result groups
      # expand.

      struct ExpandConfiguration
        include JSON::Serializable

        # The number of expanded results to show per collapsed primary document. For instance, if you set this
        # value to 3, then at most 3 results per collapsed group will be displayed.

        @[JSON::Field(key: "MaxExpandedResultsPerItem")]
        getter max_expanded_results_per_item : Int32?

        # The number of collapsed search result groups to expand. If you set this value to 10, for example,
        # only the first 10 out of 100 result groups will have expand functionality.

        @[JSON::Field(key: "MaxResultItemsToExpand")]
        getter max_result_items_to_expand : Int32?

        def initialize(
          @max_expanded_results_per_item : Int32? = nil,
          @max_result_items_to_expand : Int32? = nil
        )
        end
      end

      # A single expanded result in a collapsed group of search results. An expanded result item contains
      # information about an expanded result document within a collapsed group of search results. This
      # includes the original location of the document, a list of attributes assigned to the document, and
      # relevant text from the document that satisfies the query.

      struct ExpandedResultItem
        include JSON::Serializable

        # An array of document attributes assigned to a document in the search results. For example, the
        # document author ("_author") or the source URI ("_source_uri") of the document.

        @[JSON::Field(key: "DocumentAttributes")]
        getter document_attributes : Array(Types::DocumentAttribute)?


        @[JSON::Field(key: "DocumentExcerpt")]
        getter document_excerpt : Types::TextWithHighlights?

        # The idenitifier of the document.

        @[JSON::Field(key: "DocumentId")]
        getter document_id : String?


        @[JSON::Field(key: "DocumentTitle")]
        getter document_title : Types::TextWithHighlights?

        # The URI of the original location of the document.

        @[JSON::Field(key: "DocumentURI")]
        getter document_uri : String?

        # The identifier for the expanded result.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @document_attributes : Array(Types::DocumentAttribute)? = nil,
          @document_excerpt : Types::TextWithHighlights? = nil,
          @document_id : String? = nil,
          @document_title : Types::TextWithHighlights? = nil,
          @document_uri : String? = nil,
          @id : String? = nil
        )
        end
      end

      # Provides the configuration information for your Amazon Kendra experience. This includes the data
      # source IDs and/or FAQ IDs, and user or group information to grant access to your Amazon Kendra
      # experience.

      struct ExperienceConfiguration
        include JSON::Serializable

        # The identifiers of your data sources and FAQs. Or, you can specify that you want to use documents
        # indexed via the BatchPutDocument API. This is the content you want to use for your Amazon Kendra
        # experience.

        @[JSON::Field(key: "ContentSourceConfiguration")]
        getter content_source_configuration : Types::ContentSourceConfiguration?

        # The IAM Identity Center field name that contains the identifiers of your users, such as their
        # emails.

        @[JSON::Field(key: "UserIdentityConfiguration")]
        getter user_identity_configuration : Types::UserIdentityConfiguration?

        def initialize(
          @content_source_configuration : Types::ContentSourceConfiguration? = nil,
          @user_identity_configuration : Types::UserIdentityConfiguration? = nil
        )
        end
      end

      # Provides the configuration information for the endpoint for your Amazon Kendra experience.

      struct ExperienceEndpoint
        include JSON::Serializable

        # The endpoint of your Amazon Kendra experience.

        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        # The type of endpoint for your Amazon Kendra experience. The type currently available is HOME , which
        # is a unique and fully hosted URL to the home page of your Amazon Kendra experience.

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        def initialize(
          @endpoint : String? = nil,
          @endpoint_type : String? = nil
        )
        end
      end

      # Summary information for users or groups in your IAM Identity Center identity source with granted
      # access to your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search
      # application. For more information on creating a search application experience, see Building a search
      # experience with no code .

      struct ExperienceEntitiesSummary
        include JSON::Serializable

        # Information about the user entity.

        @[JSON::Field(key: "DisplayData")]
        getter display_data : Types::EntityDisplayData?

        # The identifier of a user or group in your IAM Identity Center identity source. For example, a user
        # ID could be an email.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String?

        # Shows the type as User or Group .

        @[JSON::Field(key: "EntityType")]
        getter entity_type : String?

        def initialize(
          @display_data : Types::EntityDisplayData? = nil,
          @entity_id : String? = nil,
          @entity_type : String? = nil
        )
        end
      end

      # Summary information for your Amazon Kendra experience. You can create an Amazon Kendra experience
      # such as a search application. For more information on creating a search application experience, see
      # Building a search experience with no code .

      struct ExperiencesSummary
        include JSON::Serializable

        # The Unix timestamp when your Amazon Kendra experience was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The endpoint URLs for your Amazon Kendra experiences. The URLs are unique and fully hosted by Amazon
        # Web Services.

        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Array(Types::ExperienceEndpoint)?

        # The identifier of your Amazon Kendra experience.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of your Amazon Kendra experience.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The processing status of your Amazon Kendra experience.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @created_at : Time? = nil,
          @endpoints : Array(Types::ExperienceEndpoint)? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Information about a document attribute or field. You can use document attributes as facets. For
      # example, the document attribute or facet "Department" includes the values "HR", "Engineering", and
      # "Accounting". You can display these values in the search results so that documents can be searched
      # by department. You can display up to 10 facet values per facet for a query. If you want to increase
      # this limit, contact Support .

      struct Facet
        include JSON::Serializable

        # The unique key for the document attribute.

        @[JSON::Field(key: "DocumentAttributeKey")]
        getter document_attribute_key : String?

        # An array of document attributes that are nested facets within a facet. For example, the document
        # attribute or facet "Department" includes a value called "Engineering". In addition, the document
        # attribute or facet "SubDepartment" includes the values "Frontend" and "Backend" for documents
        # assigned to "Engineering". You can display nested facets in the search results so that documents can
        # be searched not only by department but also by a sub department within a department. This helps your
        # users further narrow their search. You can only have one nested facet within a facet. If you want to
        # increase this limit, contact Support .

        @[JSON::Field(key: "Facets")]
        getter facets : Array(Types::Facet)?

        # Maximum number of facet values per facet. The default is 10. You can use this to limit the number of
        # facet values to less than 10. If you want to increase the default, contact Support .

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        def initialize(
          @document_attribute_key : String? = nil,
          @facets : Array(Types::Facet)? = nil,
          @max_results : Int32? = nil
        )
        end
      end

      # The facet values for the documents in the response.

      struct FacetResult
        include JSON::Serializable

        # The key for the facet values. This is the same as the DocumentAttributeKey provided in the query.

        @[JSON::Field(key: "DocumentAttributeKey")]
        getter document_attribute_key : String?

        # An array of key/value pairs, where the key is the value of the attribute and the count is the number
        # of documents that share the key value.

        @[JSON::Field(key: "DocumentAttributeValueCountPairs")]
        getter document_attribute_value_count_pairs : Array(Types::DocumentAttributeValueCountPair)?

        # The data type of the facet value. This is the same as the type defined for the index field when it
        # was created.

        @[JSON::Field(key: "DocumentAttributeValueType")]
        getter document_attribute_value_type : String?

        def initialize(
          @document_attribute_key : String? = nil,
          @document_attribute_value_count_pairs : Array(Types::DocumentAttributeValueCountPair)? = nil,
          @document_attribute_value_type : String? = nil
        )
        end
      end

      # Information on the users or groups in your IAM Identity Center identity source that failed to
      # properly configure with your Amazon Kendra experience.

      struct FailedEntity
        include JSON::Serializable

        # The identifier of the user or group in your IAM Identity Center identity source. For example, a user
        # ID could be an email.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String?

        # The reason the user or group in your IAM Identity Center identity source failed to properly
        # configure with your Amazon Kendra experience.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        def initialize(
          @entity_id : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # Provides statistical information about the FAQ questions and answers for an index.

      struct FaqStatistics
        include JSON::Serializable

        # The total number of FAQ questions and answers for an index.

        @[JSON::Field(key: "IndexedQuestionAnswersCount")]
        getter indexed_question_answers_count : Int32

        def initialize(
          @indexed_question_answers_count : Int32
        )
        end
      end

      # Summary information for frequently asked questions and answers included in an index.

      struct FaqSummary
        include JSON::Serializable

        # The Unix timestamp when the FAQ was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The file type used to create the FAQ.

        @[JSON::Field(key: "FileFormat")]
        getter file_format : String?

        # The identifier of the FAQ.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The code for a language. This shows a supported language for the FAQ document as part of the summary
        # information for FAQs. English is supported by default. For more information on supported languages,
        # including their codes, see Adding documents in languages other than English .

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # The name that you assigned the FAQ when you created or updated the FAQ.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The current status of the FAQ. When the status is ACTIVE the FAQ is ready for use.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Unix timestamp when the FAQ was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @file_format : String? = nil,
          @id : String? = nil,
          @language_code : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # A featured document. This document is displayed at the top of the search results page, placed above
      # all other results for certain queries. If there's an exact match of a query, then the document is
      # featured in the search results.

      struct FeaturedDocument
        include JSON::Serializable

        # The identifier of the document to feature in the search results. You can use the Query API to search
        # for specific documents with their document IDs included in the result items, or you can use the
        # console.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      # A document ID doesn't exist but you have specified as a featured document. Amazon Kendra cannot
      # feature the document if it doesn't exist in the index. You can check the status of a document and
      # its ID or check for documents with status errors using the BatchGetDocumentStatus API.

      struct FeaturedDocumentMissing
        include JSON::Serializable

        # The identifier of the document that doesn't exist but you have specified as a featured document.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      # A featured document with its metadata information. This document is displayed at the top of the
      # search results page, placed above all other results for certain queries. If there's an exact match
      # of a query, then the document is featured in the search results.

      struct FeaturedDocumentWithMetadata
        include JSON::Serializable

        # The identifier of the featured document with its metadata. You can use the Query API to search for
        # specific documents with their document IDs included in the result items, or you can use the console.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The main title of the featured document.

        @[JSON::Field(key: "Title")]
        getter title : String?

        # The source URI location of the featured document.

        @[JSON::Field(key: "URI")]
        getter uri : String?

        def initialize(
          @id : String? = nil,
          @title : String? = nil,
          @uri : String? = nil
        )
        end
      end

      # An error message with a list of conflicting queries used across different sets of featured results.
      # This occurred with the request for a new featured results set. Check that the queries you specified
      # for featured results are unique per featured results set for each index.

      struct FeaturedResultsConflictException
        include JSON::Serializable

        # A list of the conflicting queries, including the query text, the name for the featured results set,
        # and the identifier of the featured results set.

        @[JSON::Field(key: "ConflictingItems")]
        getter conflicting_items : Array(Types::ConflictingItem)?

        # An explanation for the conflicting queries.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @conflicting_items : Array(Types::ConflictingItem)? = nil,
          @message : String? = nil
        )
        end
      end

      # A single featured result item. A featured result is displayed at the top of the search results page,
      # placed above all other results for certain queries. If there's an exact match of a query, then
      # certain documents are featured in the search results.

      struct FeaturedResultsItem
        include JSON::Serializable

        # One or more additional attributes associated with the featured result.

        @[JSON::Field(key: "AdditionalAttributes")]
        getter additional_attributes : Array(Types::AdditionalResultAttribute)?

        # An array of document attributes assigned to a featured document in the search results. For example,
        # the document author ( _author ) or the source URI ( _source_uri ) of the document.

        @[JSON::Field(key: "DocumentAttributes")]
        getter document_attributes : Array(Types::DocumentAttribute)?


        @[JSON::Field(key: "DocumentExcerpt")]
        getter document_excerpt : Types::TextWithHighlights?

        # The identifier of the featured document.

        @[JSON::Field(key: "DocumentId")]
        getter document_id : String?


        @[JSON::Field(key: "DocumentTitle")]
        getter document_title : Types::TextWithHighlights?

        # The source URI location of the featured document.

        @[JSON::Field(key: "DocumentURI")]
        getter document_uri : String?

        # A token that identifies a particular featured result from a particular query. Use this token to
        # provide click-through feedback for the result. For more information, see Submitting feedback .

        @[JSON::Field(key: "FeedbackToken")]
        getter feedback_token : String?

        # The identifier of the featured result.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The type of document within the featured result response. For example, a response could include a
        # question-answer type that's relevant to the query.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @additional_attributes : Array(Types::AdditionalResultAttribute)? = nil,
          @document_attributes : Array(Types::DocumentAttribute)? = nil,
          @document_excerpt : Types::TextWithHighlights? = nil,
          @document_id : String? = nil,
          @document_title : Types::TextWithHighlights? = nil,
          @document_uri : String? = nil,
          @feedback_token : String? = nil,
          @id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # A set of featured results that are displayed at the top of your search results. Featured results are
      # placed above all other results for certain queries. If there's an exact match of a query, then one
      # or more specific documents are featured in the search results.

      struct FeaturedResultsSet
        include JSON::Serializable

        # The Unix timestamp when the set of featured results was created.

        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : Int64?

        # The description for the set of featured results.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The list of document IDs for the documents you want to feature at the top of the search results
        # page. You can use the Query API to search for specific documents with their document IDs included in
        # the result items, or you can use the console. You can add up to four featured documents. You can
        # request to increase this limit by contacting Support . Specific queries are mapped to specific
        # documents for featuring in the results. If a query contains an exact match, then one or more
        # specific documents are featured in the results. The exact match applies to the full query. For
        # example, if you only specify 'Kendra', queries such as 'How does kendra semantically rank results?'
        # will not render the featured results. Featured results are designed for specific queries, rather
        # than queries that are too broad in scope.

        @[JSON::Field(key: "FeaturedDocuments")]
        getter featured_documents : Array(Types::FeaturedDocument)?

        # The identifier of the set of featured results.

        @[JSON::Field(key: "FeaturedResultsSetId")]
        getter featured_results_set_id : String?

        # The name for the set of featured results.

        @[JSON::Field(key: "FeaturedResultsSetName")]
        getter featured_results_set_name : String?

        # The Unix timestamp when the set of featured results was last updated.

        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Int64?

        # The list of queries for featuring results. Specific queries are mapped to specific documents for
        # featuring in the results. If a query contains an exact match, then one or more specific documents
        # are featured in the results. The exact match applies to the full query. For example, if you only
        # specify 'Kendra', queries such as 'How does kendra semantically rank results?' will not render the
        # featured results. Featured results are designed for specific queries, rather than queries that are
        # too broad in scope.

        @[JSON::Field(key: "QueryTexts")]
        getter query_texts : Array(String)?

        # The current status of the set of featured results. When the value is ACTIVE , featured results are
        # ready for use. You can still configure your settings before setting the status to ACTIVE . You can
        # set the status to ACTIVE or INACTIVE using the UpdateFeaturedResultsSet API. The queries you specify
        # for featured results must be unique per featured results set for each index, whether the status is
        # ACTIVE or INACTIVE .

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_timestamp : Int64? = nil,
          @description : String? = nil,
          @featured_documents : Array(Types::FeaturedDocument)? = nil,
          @featured_results_set_id : String? = nil,
          @featured_results_set_name : String? = nil,
          @last_updated_timestamp : Int64? = nil,
          @query_texts : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end

      # Summary information for a set of featured results. Featured results are placed above all other
      # results for certain queries. If there's an exact match of a query, then one or more specific
      # documents are featured in the search results.

      struct FeaturedResultsSetSummary
        include JSON::Serializable

        # The Unix timestamp when the set of featured results was created.

        @[JSON::Field(key: "CreationTimestamp")]
        getter creation_timestamp : Int64?

        # The identifier of the set of featured results.

        @[JSON::Field(key: "FeaturedResultsSetId")]
        getter featured_results_set_id : String?

        # The name for the set of featured results.

        @[JSON::Field(key: "FeaturedResultsSetName")]
        getter featured_results_set_name : String?

        # The Unix timestamp when the set of featured results was last updated.

        @[JSON::Field(key: "LastUpdatedTimestamp")]
        getter last_updated_timestamp : Int64?

        # The current status of the set of featured results. When the value is ACTIVE , featured results are
        # ready for use. You can still configure your settings before setting the status to ACTIVE . You can
        # set the status to ACTIVE or INACTIVE using the UpdateFeaturedResultsSet API. The queries you specify
        # for featured results must be unique per featured results set for each index, whether the status is
        # ACTIVE or INACTIVE .

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @creation_timestamp : Int64? = nil,
          @featured_results_set_id : String? = nil,
          @featured_results_set_name : String? = nil,
          @last_updated_timestamp : Int64? = nil,
          @status : String? = nil
        )
        end
      end

      # Provides the configuration information to connect to Amazon FSx as your data source. Amazon Kendra
      # now supports an upgraded Amazon FSx Windows connector. You must now use the TemplateConfiguration
      # object instead of the FsxConfiguration object to configure your connector. Connectors configured
      # using the older console and API architecture will continue to function as configured. However, you
      # won't be able to edit or update them. If you want to edit or update your connector configuration,
      # you must create a new connector. We recommended migrating your connector workflow to the upgraded
      # version. Support for connectors configured using the older architecture is scheduled to end by June
      # 2024.

      struct FsxConfiguration
        include JSON::Serializable

        # The identifier of the Amazon FSx file system. You can find your file system ID on the file system
        # dashboard in the Amazon FSx console. For information on how to create a file system in Amazon FSx
        # console, using Windows File Server as an example, see Amazon FSx Getting started guide .

        @[JSON::Field(key: "FileSystemId")]
        getter file_system_id : String

        # The Amazon FSx file system type. Windows is currently the only supported type.

        @[JSON::Field(key: "FileSystemType")]
        getter file_system_type : String

        # Configuration information for an Amazon Virtual Private Cloud to connect to your Amazon FSx. Your
        # Amazon FSx instance must reside inside your VPC.

        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::DataSourceVpcConfiguration

        # A list of regular expression patterns to exclude certain files in your Amazon FSx file system. Files
        # that match the patterns are excluded from the index. Files that don't match the patterns are
        # included in the index. If a file matches both an inclusion and exclusion pattern, the exclusion
        # pattern takes precedence and the file isn't included in the index.

        @[JSON::Field(key: "ExclusionPatterns")]
        getter exclusion_patterns : Array(String)?

        # A list of DataSourceToIndexFieldMapping objects that map Amazon FSx data source attributes or field
        # names to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before
        # you map to Amazon FSx fields. For more information, see Mapping data source fields . The Amazon FSx
        # data source field names must exist in your Amazon FSx custom metadata.

        @[JSON::Field(key: "FieldMappings")]
        getter field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # A list of regular expression patterns to include certain files in your Amazon FSx file system. Files
        # that match the patterns are included in the index. Files that don't match the patterns are excluded
        # from the index. If a file matches both an inclusion and exclusion pattern, the exclusion pattern
        # takes precedence and the file isn't included in the index.

        @[JSON::Field(key: "InclusionPatterns")]
        getter inclusion_patterns : Array(String)?

        # The Amazon Resource Name (ARN) of an Secrets Manager secret that contains the key-value pairs
        # required to connect to your Amazon FSx file system. Windows is currently the only supported type.
        # The secret must contain a JSON structure with the following keys: username—The Active Directory user
        # name, along with the Domain Name System (DNS) domain name. For example, user@corp.example.com . The
        # Active Directory user account must have read and mounting access to the Amazon FSx file system for
        # Windows. password—The password of the Active Directory user account with read and mounting access to
        # the Amazon FSx Windows file system.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String?

        def initialize(
          @file_system_id : String,
          @file_system_type : String,
          @vpc_configuration : Types::DataSourceVpcConfiguration,
          @exclusion_patterns : Array(String)? = nil,
          @field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @inclusion_patterns : Array(String)? = nil,
          @secret_arn : String? = nil
        )
        end
      end


      struct GetQuerySuggestionsRequest
        include JSON::Serializable

        # The identifier of the index you want to get query suggestions from.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # The text of a user's query to generate query suggestions. A query is suggested if the query prefix
        # matches what a user starts to type as their query. Amazon Kendra does not show any suggestions if a
        # user types fewer than two characters or more than 60 characters. A query must also have at least one
        # search result and contain at least one word of more than four characters.

        @[JSON::Field(key: "QueryText")]
        getter query_text : String

        # Configuration information for the document fields/attributes that you want to base query suggestions
        # on.

        @[JSON::Field(key: "AttributeSuggestionsConfig")]
        getter attribute_suggestions_config : Types::AttributeSuggestionsGetConfig?

        # The maximum number of query suggestions you want to show to your users.

        @[JSON::Field(key: "MaxSuggestionsCount")]
        getter max_suggestions_count : Int32?

        # The suggestions type to base query suggestions on. The suggestion types are query history or
        # document fields/attributes. You can set one type or the other. If you set query history as your
        # suggestions type, Amazon Kendra suggests queries relevant to your users based on popular queries in
        # the query history. If you set document fields/attributes as your suggestions type, Amazon Kendra
        # suggests queries relevant to your users based on the contents of document fields.

        @[JSON::Field(key: "SuggestionTypes")]
        getter suggestion_types : Array(String)?

        def initialize(
          @index_id : String,
          @query_text : String,
          @attribute_suggestions_config : Types::AttributeSuggestionsGetConfig? = nil,
          @max_suggestions_count : Int32? = nil,
          @suggestion_types : Array(String)? = nil
        )
        end
      end


      struct GetQuerySuggestionsResponse
        include JSON::Serializable

        # The identifier for a list of query suggestions for an index.

        @[JSON::Field(key: "QuerySuggestionsId")]
        getter query_suggestions_id : String?

        # A list of query suggestions for an index.

        @[JSON::Field(key: "Suggestions")]
        getter suggestions : Array(Types::Suggestion)?

        def initialize(
          @query_suggestions_id : String? = nil,
          @suggestions : Array(Types::Suggestion)? = nil
        )
        end
      end


      struct GetSnapshotsRequest
        include JSON::Serializable

        # The identifier of the index to get search metrics data.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # The time interval or time window to get search metrics data. The time interval uses the time zone of
        # your index. You can view data in the following time windows: THIS_WEEK : The current week, starting
        # on the Sunday and ending on the day before the current date. ONE_WEEK_AGO : The previous week,
        # starting on the Sunday and ending on the following Saturday. TWO_WEEKS_AGO : The week before the
        # previous week, starting on the Sunday and ending on the following Saturday. THIS_MONTH : The current
        # month, starting on the first day of the month and ending on the day before the current date.
        # ONE_MONTH_AGO : The previous month, starting on the first day of the month and ending on the last
        # day of the month. TWO_MONTHS_AGO : The month before the previous month, starting on the first day of
        # the month and ending on last day of the month.

        @[JSON::Field(key: "Interval")]
        getter interval : String

        # The metric you want to retrieve. You can specify only one metric per call. For more information
        # about the metrics you can view, see Gaining insights with search analytics .

        @[JSON::Field(key: "MetricType")]
        getter metric_type : String

        # The maximum number of returned data for the metric.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of search metrics data.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @index_id : String,
          @interval : String,
          @metric_type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetSnapshotsResponse
        include JSON::Serializable

        # If the response is truncated, Amazon Kendra returns this token, which you can use in a later request
        # to retrieve the next set of search metrics data.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The Unix timestamp for the beginning and end of the time window for the search metrics data.

        @[JSON::Field(key: "SnapShotTimeFilter")]
        getter snap_shot_time_filter : Types::TimeRange?

        # The search metrics data. The data returned depends on the metric type you requested.

        @[JSON::Field(key: "SnapshotsData")]
        getter snapshots_data : Array(Array(String))?

        # The column headers for the search metrics data.

        @[JSON::Field(key: "SnapshotsDataHeader")]
        getter snapshots_data_header : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @snap_shot_time_filter : Types::TimeRange? = nil,
          @snapshots_data : Array(Array(String))? = nil,
          @snapshots_data_header : Array(String)? = nil
        )
        end
      end

      # Provides the configuration information to connect to GitHub as your data source. Amazon Kendra now
      # supports an upgraded GitHub connector. You must now use the TemplateConfiguration object instead of
      # the GitHubConfiguration object to configure your connector. Connectors configured using the older
      # console and API architecture will continue to function as configured. However, you won’t be able to
      # edit or update them. If you want to edit or update your connector configuration, you must create a
      # new connector. We recommended migrating your connector workflow to the upgraded version. Support for
      # connectors configured using the older architecture is scheduled to end by June 2024.

      struct GitHubConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Secrets Manager secret that contains the key-value pairs
        # required to connect to your GitHub. The secret must contain a JSON structure with the following
        # keys: personalToken—The access token created in GitHub. For more information on creating a token in
        # GitHub, see Using a GitHub data source .

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String

        # A list of regular expression patterns to exclude certain file names in your GitHub repository or
        # repositories. File names that match the patterns are excluded from the index. File names that don't
        # match the patterns are included in the index. If a file matches both an exclusion and inclusion
        # pattern, the exclusion pattern takes precedence and the file isn't included in the index.

        @[JSON::Field(key: "ExclusionFileNamePatterns")]
        getter exclusion_file_name_patterns : Array(String)?

        # A list of regular expression patterns to exclude certain file types in your GitHub repository or
        # repositories. File types that match the patterns are excluded from the index. File types that don't
        # match the patterns are included in the index. If a file matches both an exclusion and inclusion
        # pattern, the exclusion pattern takes precedence and the file isn't included in the index.

        @[JSON::Field(key: "ExclusionFileTypePatterns")]
        getter exclusion_file_type_patterns : Array(String)?

        # A list of regular expression patterns to exclude certain folder names in your GitHub repository or
        # repositories. Folder names that match the patterns are excluded from the index. Folder names that
        # don't match the patterns are included in the index. If a folder matches both an exclusion and
        # inclusion pattern, the exclusion pattern takes precedence and the folder isn't included in the
        # index.

        @[JSON::Field(key: "ExclusionFolderNamePatterns")]
        getter exclusion_folder_name_patterns : Array(String)?

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of GitHub commits
        # to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before you map
        # to GitHub fields. For more information, see Mapping data source fields . The GitHub data source
        # field names must exist in your GitHub custom metadata.

        @[JSON::Field(key: "GitHubCommitConfigurationFieldMappings")]
        getter git_hub_commit_configuration_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # Configuration information to include certain types of GitHub content. You can configure to index
        # repository files only, or also include issues and pull requests, comments, and comment attachments.

        @[JSON::Field(key: "GitHubDocumentCrawlProperties")]
        getter git_hub_document_crawl_properties : Types::GitHubDocumentCrawlProperties?

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of GitHub issue
        # attachments to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API
        # before you map to GitHub fields. For more information, see Mapping data source fields . The GitHub
        # data source field names must exist in your GitHub custom metadata.

        @[JSON::Field(key: "GitHubIssueAttachmentConfigurationFieldMappings")]
        getter git_hub_issue_attachment_configuration_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of GitHub issue
        # comments to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before
        # you map to GitHub fields. For more information, see Mapping data source fields . The GitHub data
        # source field names must exist in your GitHub custom metadata.

        @[JSON::Field(key: "GitHubIssueCommentConfigurationFieldMappings")]
        getter git_hub_issue_comment_configuration_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of GitHub issues
        # to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before you map
        # to GitHub fields. For more information, see Mapping data source fields . The GitHub data source
        # field names must exist in your GitHub custom metadata.

        @[JSON::Field(key: "GitHubIssueDocumentConfigurationFieldMappings")]
        getter git_hub_issue_document_configuration_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of GitHub pull
        # request comments to Amazon Kendra index field names. To create custom fields, use the UpdateIndex
        # API before you map to GitHub fields. For more information, see Mapping data source fields . The
        # GitHub data source field names must exist in your GitHub custom metadata.

        @[JSON::Field(key: "GitHubPullRequestCommentConfigurationFieldMappings")]
        getter git_hub_pull_request_comment_configuration_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of GitHub pull
        # request attachments to Amazon Kendra index field names. To create custom fields, use the UpdateIndex
        # API before you map to GitHub fields. For more information, see Mapping data source fields . The
        # GitHub data source field names must exist in your GitHub custom metadata.

        @[JSON::Field(key: "GitHubPullRequestDocumentAttachmentConfigurationFieldMappings")]
        getter git_hub_pull_request_document_attachment_configuration_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of GitHub pull
        # requests to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before
        # you map to GitHub fields. For more information, see Mapping data source fields . The GitHub data
        # source field names must exist in your GitHub custom metadata.

        @[JSON::Field(key: "GitHubPullRequestDocumentConfigurationFieldMappings")]
        getter git_hub_pull_request_document_configuration_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # A list of DataSourceToIndexFieldMapping objects that map GitHub repository attributes or field names
        # to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before you map
        # to GitHub fields. For more information, see Mapping data source fields . The GitHub data source
        # field names must exist in your GitHub custom metadata.

        @[JSON::Field(key: "GitHubRepositoryConfigurationFieldMappings")]
        getter git_hub_repository_configuration_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # A list of regular expression patterns to include certain file names in your GitHub repository or
        # repositories. File names that match the patterns are included in the index. File names that don't
        # match the patterns are excluded from the index. If a file matches both an inclusion and exclusion
        # pattern, the exclusion pattern takes precedence and the file isn't included in the index.

        @[JSON::Field(key: "InclusionFileNamePatterns")]
        getter inclusion_file_name_patterns : Array(String)?

        # A list of regular expression patterns to include certain file types in your GitHub repository or
        # repositories. File types that match the patterns are included in the index. File types that don't
        # match the patterns are excluded from the index. If a file matches both an inclusion and exclusion
        # pattern, the exclusion pattern takes precedence and the file isn't included in the index.

        @[JSON::Field(key: "InclusionFileTypePatterns")]
        getter inclusion_file_type_patterns : Array(String)?

        # A list of regular expression patterns to include certain folder names in your GitHub repository or
        # repositories. Folder names that match the patterns are included in the index. Folder names that
        # don't match the patterns are excluded from the index. If a folder matches both an inclusion and
        # exclusion pattern, the exclusion pattern takes precedence and the folder isn't included in the
        # index.

        @[JSON::Field(key: "InclusionFolderNamePatterns")]
        getter inclusion_folder_name_patterns : Array(String)?

        # Configuration information to connect to GitHub Enterprise Server (on premises).

        @[JSON::Field(key: "OnPremiseConfiguration")]
        getter on_premise_configuration : Types::OnPremiseConfiguration?

        # A list of names of the specific repositories you want to index.

        @[JSON::Field(key: "RepositoryFilter")]
        getter repository_filter : Array(String)?

        # Configuration information to connect to GitHub Enterprise Cloud (SaaS).

        @[JSON::Field(key: "SaaSConfiguration")]
        getter saa_s_configuration : Types::SaaSConfiguration?

        # The type of GitHub service you want to connect to—GitHub Enterprise Cloud (SaaS) or GitHub
        # Enterprise Server (on premises).

        @[JSON::Field(key: "Type")]
        getter type : String?

        # TRUE to use the GitHub change log to determine which documents require updating in the index.
        # Depending on the GitHub change log's size, it may take longer for Amazon Kendra to use the change
        # log than to scan all of your documents in GitHub.

        @[JSON::Field(key: "UseChangeLog")]
        getter use_change_log : Bool?

        # Configuration information of an Amazon Virtual Private Cloud to connect to your GitHub. For more
        # information, see Configuring a VPC .

        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::DataSourceVpcConfiguration?

        def initialize(
          @secret_arn : String,
          @exclusion_file_name_patterns : Array(String)? = nil,
          @exclusion_file_type_patterns : Array(String)? = nil,
          @exclusion_folder_name_patterns : Array(String)? = nil,
          @git_hub_commit_configuration_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @git_hub_document_crawl_properties : Types::GitHubDocumentCrawlProperties? = nil,
          @git_hub_issue_attachment_configuration_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @git_hub_issue_comment_configuration_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @git_hub_issue_document_configuration_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @git_hub_pull_request_comment_configuration_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @git_hub_pull_request_document_attachment_configuration_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @git_hub_pull_request_document_configuration_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @git_hub_repository_configuration_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @inclusion_file_name_patterns : Array(String)? = nil,
          @inclusion_file_type_patterns : Array(String)? = nil,
          @inclusion_folder_name_patterns : Array(String)? = nil,
          @on_premise_configuration : Types::OnPremiseConfiguration? = nil,
          @repository_filter : Array(String)? = nil,
          @saa_s_configuration : Types::SaaSConfiguration? = nil,
          @type : String? = nil,
          @use_change_log : Bool? = nil,
          @vpc_configuration : Types::DataSourceVpcConfiguration? = nil
        )
        end
      end

      # Provides the configuration information to include certain types of GitHub content. You can configure
      # to index repository files only, or also include issues and pull requests, comments, and comment
      # attachments.

      struct GitHubDocumentCrawlProperties
        include JSON::Serializable

        # TRUE to index all issues within a repository.

        @[JSON::Field(key: "CrawlIssue")]
        getter crawl_issue : Bool?

        # TRUE to index all comments on issues.

        @[JSON::Field(key: "CrawlIssueComment")]
        getter crawl_issue_comment : Bool?

        # TRUE to include all comment attachments for issues.

        @[JSON::Field(key: "CrawlIssueCommentAttachment")]
        getter crawl_issue_comment_attachment : Bool?

        # TRUE to index all pull requests within a repository.

        @[JSON::Field(key: "CrawlPullRequest")]
        getter crawl_pull_request : Bool?

        # TRUE to index all comments on pull requests.

        @[JSON::Field(key: "CrawlPullRequestComment")]
        getter crawl_pull_request_comment : Bool?

        # TRUE to include all comment attachments for pull requests.

        @[JSON::Field(key: "CrawlPullRequestCommentAttachment")]
        getter crawl_pull_request_comment_attachment : Bool?

        # TRUE to index all files with a repository.

        @[JSON::Field(key: "CrawlRepositoryDocuments")]
        getter crawl_repository_documents : Bool?

        def initialize(
          @crawl_issue : Bool? = nil,
          @crawl_issue_comment : Bool? = nil,
          @crawl_issue_comment_attachment : Bool? = nil,
          @crawl_pull_request : Bool? = nil,
          @crawl_pull_request_comment : Bool? = nil,
          @crawl_pull_request_comment_attachment : Bool? = nil,
          @crawl_repository_documents : Bool? = nil
        )
        end
      end

      # Provides the configuration information to connect to Google Drive as your data source.

      struct GoogleDriveConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a Secrets Managersecret that contains the credentials required to
        # connect to Google Drive. For more information, see Using a Google Workspace Drive data source .

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String

        # A list of MIME types to exclude from the index. All documents matching the specified MIME type are
        # excluded. For a list of MIME types, see Using a Google Workspace Drive data source .

        @[JSON::Field(key: "ExcludeMimeTypes")]
        getter exclude_mime_types : Array(String)?

        # A list of identifiers or shared drives to exclude from the index. All files and folders stored on
        # the shared drive are excluded.

        @[JSON::Field(key: "ExcludeSharedDrives")]
        getter exclude_shared_drives : Array(String)?

        # A list of email addresses of the users. Documents owned by these users are excluded from the index.
        # Documents shared with excluded users are indexed unless they are excluded in another way.

        @[JSON::Field(key: "ExcludeUserAccounts")]
        getter exclude_user_accounts : Array(String)?

        # A list of regular expression patterns to exclude certain items in your Google Drive, including
        # shared drives and users' My Drives. Items that match the patterns are excluded from the index. Items
        # that don't match the patterns are included in the index. If an item matches both an inclusion and
        # exclusion pattern, the exclusion pattern takes precedence and the item isn't included in the index.

        @[JSON::Field(key: "ExclusionPatterns")]
        getter exclusion_patterns : Array(String)?

        # Maps Google Drive data source attributes or field names to Amazon Kendra index field names. To
        # create custom fields, use the UpdateIndex API before you map to Google Drive fields. For more
        # information, see Mapping data source fields . The Google Drive data source field names must exist in
        # your Google Drive custom metadata.

        @[JSON::Field(key: "FieldMappings")]
        getter field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # A list of regular expression patterns to include certain items in your Google Drive, including
        # shared drives and users' My Drives. Items that match the patterns are included in the index. Items
        # that don't match the patterns are excluded from the index. If an item matches both an inclusion and
        # exclusion pattern, the exclusion pattern takes precedence and the item isn't included in the index.

        @[JSON::Field(key: "InclusionPatterns")]
        getter inclusion_patterns : Array(String)?

        def initialize(
          @secret_arn : String,
          @exclude_mime_types : Array(String)? = nil,
          @exclude_shared_drives : Array(String)? = nil,
          @exclude_user_accounts : Array(String)? = nil,
          @exclusion_patterns : Array(String)? = nil,
          @field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @inclusion_patterns : Array(String)? = nil
        )
        end
      end

      # A list of users that belong to a group. This is useful for user context filtering, where search
      # results are filtered based on the user or their group access to documents.

      struct GroupMembers
        include JSON::Serializable

        # A list of users that belong to a group. This can also include sub groups. For example, the sub
        # groups "Research", "Engineering", and "Sales and Marketing" all belong to the group "Company A".

        @[JSON::Field(key: "MemberGroups")]
        getter member_groups : Array(Types::MemberGroup)?

        # A list of users that belong to a group. For example, a list of interns all belong to the "Interns"
        # group.

        @[JSON::Field(key: "MemberUsers")]
        getter member_users : Array(Types::MemberUser)?

        # If you have more than 1000 users and/or sub groups for a single group, you need to provide the path
        # to the S3 file that lists your users and sub groups for a group. Your sub groups can contain more
        # than 1000 users, but the list of sub groups that belong to a group (and/or users) must be no more
        # than 1000. You can download this example S3 file that uses the correct format for listing group
        # members. Note, dataSourceId is optional. The value of type for a group is always GROUP and for a
        # user it is always USER .

        @[JSON::Field(key: "S3PathforGroupMembers")]
        getter s3_pathfor_group_members : Types::S3Path?

        def initialize(
          @member_groups : Array(Types::MemberGroup)? = nil,
          @member_users : Array(Types::MemberUser)? = nil,
          @s3_pathfor_group_members : Types::S3Path? = nil
        )
        end
      end

      # Summary information on the processing of PUT and DELETE actions for mapping users to their groups.

      struct GroupOrderingIdSummary
        include JSON::Serializable

        # The reason an action could not be processed. An action can be a PUT or DELETE action for mapping
        # users to their groups.

        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        # The Unix timestamp when an action was last updated. An action can be a PUT or DELETE action for
        # mapping users to their groups.

        @[JSON::Field(key: "LastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # The order in which actions should complete processing. An action can be a PUT or DELETE action for
        # mapping users to their groups.

        @[JSON::Field(key: "OrderingId")]
        getter ordering_id : Int64?

        # The Unix timestamp when an action was received by Amazon Kendra. An action can be a PUT or DELETE
        # action for mapping users to their groups.

        @[JSON::Field(key: "ReceivedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter received_at : Time?

        # The current processing status of actions for mapping users to their groups. The status can be either
        # PROCESSING , SUCCEEDED , DELETING , DELETED , or FAILED .

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @failure_reason : String? = nil,
          @last_updated_at : Time? = nil,
          @ordering_id : Int64? = nil,
          @received_at : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Summary information for groups.

      struct GroupSummary
        include JSON::Serializable

        # The identifier of the group you want group summary information on.

        @[JSON::Field(key: "GroupId")]
        getter group_id : String?

        # The timestamp identifier used for the latest PUT or DELETE action.

        @[JSON::Field(key: "OrderingId")]
        getter ordering_id : Int64?

        def initialize(
          @group_id : String? = nil,
          @ordering_id : Int64? = nil
        )
        end
      end

      # Information to define the hierarchy for which documents users should have access to.

      struct HierarchicalPrincipal
        include JSON::Serializable

        # A list of principal lists that define the hierarchy for which documents users should have access to.
        # Each hierarchical list specifies which user or group has allow or deny access for each document.

        @[JSON::Field(key: "PrincipalList")]
        getter principal_list : Array(Types::Principal)

        def initialize(
          @principal_list : Array(Types::Principal)
        )
        end
      end

      # Provides information that you can use to highlight a search result so that your users can quickly
      # identify terms in the response.

      struct Highlight
        include JSON::Serializable

        # The zero-based location in the response string where the highlight starts.

        @[JSON::Field(key: "BeginOffset")]
        getter begin_offset : Int32

        # The zero-based location in the response string where the highlight ends.

        @[JSON::Field(key: "EndOffset")]
        getter end_offset : Int32

        # Indicates whether the response is the best response. True if this is the best response; otherwise,
        # false.

        @[JSON::Field(key: "TopAnswer")]
        getter top_answer : Bool?

        # The highlight type.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @begin_offset : Int32,
          @end_offset : Int32,
          @top_answer : Bool? = nil,
          @type : String? = nil
        )
        end
      end

      # Provides the configuration information for invoking a Lambda function in Lambda to alter document
      # metadata and content when ingesting documents into Amazon Kendra. You can configure your Lambda
      # function using PreExtractionHookConfiguration if you want to apply advanced alterations on the
      # original or raw documents. If you want to apply advanced alterations on the Amazon Kendra structured
      # documents, you must configure your Lambda function using PostExtractionHookConfiguration . You can
      # only invoke one Lambda function. However, this function can invoke other functions it requires. For
      # more information, see Customizing document metadata during the ingestion process .

      struct HookConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an IAM role with permission to run a Lambda function during
        # ingestion. For more information, see an IAM roles for Amazon Kendra .

        @[JSON::Field(key: "LambdaArn")]
        getter lambda_arn : String

        # Stores the original, raw documents or the structured, parsed documents before and after altering
        # them. For more information, see Data contracts for Lambda functions .

        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String

        # The condition used for when a Lambda function should be invoked. For example, you can specify a
        # condition that if there are empty date-time values, then Amazon Kendra should invoke a function that
        # inserts the current date-time.

        @[JSON::Field(key: "InvocationCondition")]
        getter invocation_condition : Types::DocumentAttributeCondition?

        def initialize(
          @lambda_arn : String,
          @s3_bucket : String,
          @invocation_condition : Types::DocumentAttributeCondition? = nil
        )
        end
      end

      # Summary information on the configuration of an index.

      struct IndexConfigurationSummary
        include JSON::Serializable

        # The Unix timestamp when the index was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time

        # The current status of the index. When the status is ACTIVE , the index is ready to search.

        @[JSON::Field(key: "Status")]
        getter status : String

        # The Unix timestamp when the index was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # Indicates whether the index is a Enterprise Edition index or a Developer Edition index.

        @[JSON::Field(key: "Edition")]
        getter edition : String?

        # A identifier for the index. Use this to identify the index when you are using APIs such as Query ,
        # DescribeIndex , UpdateIndex , and DeleteIndex .

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the index.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @created_at : Time,
          @status : String,
          @updated_at : Time,
          @edition : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Provides information about the number of documents and the number of questions and answers in an
      # index.

      struct IndexStatistics
        include JSON::Serializable

        # The number of question and answer topics in the index.

        @[JSON::Field(key: "FaqStatistics")]
        getter faq_statistics : Types::FaqStatistics

        # The number of text documents indexed.

        @[JSON::Field(key: "TextDocumentStatistics")]
        getter text_document_statistics : Types::TextDocumentStatistics

        def initialize(
          @faq_statistics : Types::FaqStatistics,
          @text_document_statistics : Types::TextDocumentStatistics
        )
        end
      end

      # Provides the configuration information for applying basic logic to alter document metadata and
      # content when ingesting documents into Amazon Kendra. To apply advanced logic, to go beyond what you
      # can do with basic logic, see HookConfiguration . For more information, see Customizing document
      # metadata during the ingestion process .

      struct InlineCustomDocumentEnrichmentConfiguration
        include JSON::Serializable

        # Configuration of the condition used for the target document attribute or metadata field when
        # ingesting documents into Amazon Kendra.

        @[JSON::Field(key: "Condition")]
        getter condition : Types::DocumentAttributeCondition?

        # TRUE to delete content if the condition used for the target attribute is met.

        @[JSON::Field(key: "DocumentContentDeletion")]
        getter document_content_deletion : Bool?

        # Configuration of the target document attribute or metadata field when ingesting documents into
        # Amazon Kendra. You can also include a value.

        @[JSON::Field(key: "Target")]
        getter target : Types::DocumentAttributeTarget?

        def initialize(
          @condition : Types::DocumentAttributeCondition? = nil,
          @document_content_deletion : Bool? = nil,
          @target : Types::DocumentAttributeTarget? = nil
        )
        end
      end

      # An issue occurred with the internal server used for your Amazon Kendra service. Please wait a few
      # minutes and try again, or contact Support for help.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The input to the request is not valid. Please provide the correct input and try again.

      struct InvalidRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides the configuration information to connect to Jira as your data source.

      struct JiraConfiguration
        include JSON::Serializable

        # The URL of the Jira account. For example, company.atlassian.net .

        @[JSON::Field(key: "JiraAccountUrl")]
        getter jira_account_url : String

        # The Amazon Resource Name (ARN) of a secret in Secrets Manager contains the key-value pairs required
        # to connect to your Jira data source. The secret must contain a JSON structure with the following
        # keys: jiraId—The Jira user name or email. jiraCredentials—The Jira API token. For more information,
        # see Using a Jira data source .

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of Jira
        # attachments to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API
        # before you map to Jira fields. For more information, see Mapping data source fields . The Jira data
        # source field names must exist in your Jira custom metadata.

        @[JSON::Field(key: "AttachmentFieldMappings")]
        getter attachment_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of Jira comments
        # to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before you map
        # to Jira fields. For more information, see Mapping data source fields . The Jira data source field
        # names must exist in your Jira custom metadata.

        @[JSON::Field(key: "CommentFieldMappings")]
        getter comment_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # A list of regular expression patterns to exclude certain file paths, file names, and file types in
        # your Jira data source. Files that match the patterns are excluded from the index. Files that don’t
        # match the patterns are included in the index. If a file matches both an inclusion pattern and an
        # exclusion pattern, the exclusion pattern takes precedence and the file isn't included in the index.

        @[JSON::Field(key: "ExclusionPatterns")]
        getter exclusion_patterns : Array(String)?

        # A list of regular expression patterns to include certain file paths, file names, and file types in
        # your Jira data source. Files that match the patterns are included in the index. Files that don't
        # match the patterns are excluded from the index. If a file matches both an inclusion pattern and an
        # exclusion pattern, the exclusion pattern takes precedence and the file isn't included in the index.

        @[JSON::Field(key: "InclusionPatterns")]
        getter inclusion_patterns : Array(String)?

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of Jira issues to
        # Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before you map to
        # Jira fields. For more information, see Mapping data source fields . The Jira data source field names
        # must exist in your Jira custom metadata.

        @[JSON::Field(key: "IssueFieldMappings")]
        getter issue_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # Specify whether to crawl comments, attachments, and work logs. You can specify one or more of these
        # options.

        @[JSON::Field(key: "IssueSubEntityFilter")]
        getter issue_sub_entity_filter : Array(String)?

        # Specify which issue types to crawl in your Jira data source. You can specify one or more of these
        # options to crawl.

        @[JSON::Field(key: "IssueType")]
        getter issue_type : Array(String)?

        # Specify which projects to crawl in your Jira data source. You can specify one or more Jira project
        # IDs.

        @[JSON::Field(key: "Project")]
        getter project : Array(String)?

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of Jira projects
        # to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before you map
        # to Jira fields. For more information, see Mapping data source fields . The Jira data source field
        # names must exist in your Jira custom metadata.

        @[JSON::Field(key: "ProjectFieldMappings")]
        getter project_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # Specify which statuses to crawl in your Jira data source. You can specify one or more of these
        # options to crawl.

        @[JSON::Field(key: "Status")]
        getter status : Array(String)?

        # TRUE to use the Jira change log to determine which documents require updating in the index.
        # Depending on the change log's size, it may take longer for Amazon Kendra to use the change log than
        # to scan all of your documents in Jira.

        @[JSON::Field(key: "UseChangeLog")]
        getter use_change_log : Bool?

        # Configuration information for an Amazon Virtual Private Cloud to connect to your Jira. For more
        # information, see Configuring a VPC .

        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::DataSourceVpcConfiguration?

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of Jira work logs
        # to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before you map
        # to Jira fields. For more information, see Mapping data source fields . The Jira data source field
        # names must exist in your Jira custom metadata.

        @[JSON::Field(key: "WorkLogFieldMappings")]
        getter work_log_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        def initialize(
          @jira_account_url : String,
          @secret_arn : String,
          @attachment_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @comment_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @exclusion_patterns : Array(String)? = nil,
          @inclusion_patterns : Array(String)? = nil,
          @issue_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @issue_sub_entity_filter : Array(String)? = nil,
          @issue_type : Array(String)? = nil,
          @project : Array(String)? = nil,
          @project_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @status : Array(String)? = nil,
          @use_change_log : Bool? = nil,
          @vpc_configuration : Types::DataSourceVpcConfiguration? = nil,
          @work_log_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil
        )
        end
      end

      # Provides the configuration information for the JSON token type.

      struct JsonTokenTypeConfiguration
        include JSON::Serializable

        # The group attribute field.

        @[JSON::Field(key: "GroupAttributeField")]
        getter group_attribute_field : String

        # The user name attribute field.

        @[JSON::Field(key: "UserNameAttributeField")]
        getter user_name_attribute_field : String

        def initialize(
          @group_attribute_field : String,
          @user_name_attribute_field : String
        )
        end
      end

      # Provides the configuration information for the JWT token type.

      struct JwtTokenTypeConfiguration
        include JSON::Serializable

        # The location of the key.

        @[JSON::Field(key: "KeyLocation")]
        getter key_location : String

        # The regular expression that identifies the claim.

        @[JSON::Field(key: "ClaimRegex")]
        getter claim_regex : String?

        # The group attribute field.

        @[JSON::Field(key: "GroupAttributeField")]
        getter group_attribute_field : String?

        # The issuer of the token.

        @[JSON::Field(key: "Issuer")]
        getter issuer : String?

        # The Amazon Resource Name (arn) of the secret.

        @[JSON::Field(key: "SecretManagerArn")]
        getter secret_manager_arn : String?

        # The signing key URL.

        @[JSON::Field(key: "URL")]
        getter url : String?

        # The user name attribute field.

        @[JSON::Field(key: "UserNameAttributeField")]
        getter user_name_attribute_field : String?

        def initialize(
          @key_location : String,
          @claim_regex : String? = nil,
          @group_attribute_field : String? = nil,
          @issuer : String? = nil,
          @secret_manager_arn : String? = nil,
          @url : String? = nil,
          @user_name_attribute_field : String? = nil
        )
        end
      end


      struct ListAccessControlConfigurationsRequest
        include JSON::Serializable

        # The identifier of the index for the access control configuration.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # The maximum number of access control configurations to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there's more data to retrieve), Amazon Kendra
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of access control configurations.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @index_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAccessControlConfigurationsResponse
        include JSON::Serializable

        # The details of your access control configurations.

        @[JSON::Field(key: "AccessControlConfigurations")]
        getter access_control_configurations : Array(Types::AccessControlConfigurationSummary)

        # If the response is truncated, Amazon Kendra returns this token, which you can use in the subsequent
        # request to retrieve the next set of access control configurations.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @access_control_configurations : Array(Types::AccessControlConfigurationSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListDataSourceSyncJobsRequest
        include JSON::Serializable

        # The identifier of the data source connector.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index used with the data source connector.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # The maximum number of synchronization jobs to return in the response. If there are fewer results in
        # the list, this response contains only the actual results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of jobs.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # When specified, the synchronization jobs returned in the list are limited to jobs between the
        # specified dates.

        @[JSON::Field(key: "StartTimeFilter")]
        getter start_time_filter : Types::TimeRange?

        # Only returns synchronization jobs with the Status field equal to the specified status.

        @[JSON::Field(key: "StatusFilter")]
        getter status_filter : String?

        def initialize(
          @id : String,
          @index_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @start_time_filter : Types::TimeRange? = nil,
          @status_filter : String? = nil
        )
        end
      end


      struct ListDataSourceSyncJobsResponse
        include JSON::Serializable

        # A history of synchronization jobs for the data source connector.

        @[JSON::Field(key: "History")]
        getter history : Array(Types::DataSourceSyncJob)?

        # If the response is truncated, Amazon Kendra returns this token that you can use in the subsequent
        # request to retrieve the next set of jobs.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @history : Array(Types::DataSourceSyncJob)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDataSourcesRequest
        include JSON::Serializable

        # The identifier of the index used with one or more data source connectors.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # The maximum number of data source connectors to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of data source connectors.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @index_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDataSourcesResponse
        include JSON::Serializable

        # If the response is truncated, Amazon Kendra returns this token that you can use in the subsequent
        # request to retrieve the next set of data source connectors.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of summary information for one or more data source connector.

        @[JSON::Field(key: "SummaryItems")]
        getter summary_items : Array(Types::DataSourceSummary)?

        def initialize(
          @next_token : String? = nil,
          @summary_items : Array(Types::DataSourceSummary)? = nil
        )
        end
      end


      struct ListEntityPersonasRequest
        include JSON::Serializable

        # The identifier of your Amazon Kendra experience.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for your Amazon Kendra experience.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # The maximum number of returned users or groups.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of users or groups.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @id : String,
          @index_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEntityPersonasResponse
        include JSON::Serializable

        # If the response is truncated, Amazon Kendra returns this token, which you can use in a later request
        # to retrieve the next set of users or groups.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of summary information for one or more users or groups.

        @[JSON::Field(key: "SummaryItems")]
        getter summary_items : Array(Types::PersonasSummary)?

        def initialize(
          @next_token : String? = nil,
          @summary_items : Array(Types::PersonasSummary)? = nil
        )
        end
      end


      struct ListExperienceEntitiesRequest
        include JSON::Serializable

        # The identifier of your Amazon Kendra experience.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for your Amazon Kendra experience.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of users or groups.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @id : String,
          @index_id : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListExperienceEntitiesResponse
        include JSON::Serializable

        # If the response is truncated, Amazon Kendra returns this token, which you can use in a later request
        # to retrieve the next set of users or groups.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of summary information for one or more users or groups.

        @[JSON::Field(key: "SummaryItems")]
        getter summary_items : Array(Types::ExperienceEntitiesSummary)?

        def initialize(
          @next_token : String? = nil,
          @summary_items : Array(Types::ExperienceEntitiesSummary)? = nil
        )
        end
      end


      struct ListExperiencesRequest
        include JSON::Serializable

        # The identifier of the index for your Amazon Kendra experience.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # The maximum number of returned Amazon Kendra experiences.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of Amazon Kendra experiences.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @index_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListExperiencesResponse
        include JSON::Serializable

        # If the response is truncated, Amazon Kendra returns this token, which you can use in a later request
        # to retrieve the next set of Amazon Kendra experiences.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of summary information for one or more Amazon Kendra experiences.

        @[JSON::Field(key: "SummaryItems")]
        getter summary_items : Array(Types::ExperiencesSummary)?

        def initialize(
          @next_token : String? = nil,
          @summary_items : Array(Types::ExperiencesSummary)? = nil
        )
        end
      end


      struct ListFaqsRequest
        include JSON::Serializable

        # The index for the FAQs.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # The maximum number of FAQs to return in the response. If there are fewer results in the list, this
        # response contains only the actual results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of FAQs.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @index_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFaqsResponse
        include JSON::Serializable

        # Summary information about the FAQs for a specified index.

        @[JSON::Field(key: "FaqSummaryItems")]
        getter faq_summary_items : Array(Types::FaqSummary)?

        # If the response is truncated, Amazon Kendra returns this token that you can use in the subsequent
        # request to retrieve the next set of FAQs.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @faq_summary_items : Array(Types::FaqSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFeaturedResultsSetsRequest
        include JSON::Serializable

        # The identifier of the index used for featuring results.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # The maximum number of featured results sets to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the response is truncated, Amazon Kendra returns a pagination token in the response. You can use
        # this pagination token to retrieve the next set of featured results sets.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @index_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFeaturedResultsSetsResponse
        include JSON::Serializable

        # An array of summary information for one or more featured results sets.

        @[JSON::Field(key: "FeaturedResultsSetSummaryItems")]
        getter featured_results_set_summary_items : Array(Types::FeaturedResultsSetSummary)?

        # If the response is truncated, Amazon Kendra returns a pagination token in the response.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @featured_results_set_summary_items : Array(Types::FeaturedResultsSetSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroupsOlderThanOrderingIdRequest
        include JSON::Serializable

        # The identifier of the index for getting a list of groups mapped to users before a given ordering or
        # timestamp identifier.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # The timestamp identifier used for the latest PUT or DELETE action for mapping users to their groups.

        @[JSON::Field(key: "OrderingId")]
        getter ordering_id : Int64

        # The identifier of the data source for getting a list of groups mapped to users before a given
        # ordering timestamp identifier.

        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String?

        # The maximum number of returned groups that are mapped to users before a given ordering or timestamp
        # identifier.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of groups that are mapped to users before a given ordering or timestamp identifier.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @index_id : String,
          @ordering_id : Int64,
          @data_source_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroupsOlderThanOrderingIdResponse
        include JSON::Serializable

        # Summary information for list of groups that are mapped to users before a given ordering or timestamp
        # identifier.

        @[JSON::Field(key: "GroupsSummaries")]
        getter groups_summaries : Array(Types::GroupSummary)?

        # If the response is truncated, Amazon Kendra returns this token that you can use in the subsequent
        # request to retrieve the next set of groups that are mapped to users before a given ordering or
        # timestamp identifier.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @groups_summaries : Array(Types::GroupSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIndicesRequest
        include JSON::Serializable

        # The maximum number of indices to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of indexes.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIndicesResponse
        include JSON::Serializable

        # An array of summary information on the configuration of one or more indexes.

        @[JSON::Field(key: "IndexConfigurationSummaryItems")]
        getter index_configuration_summary_items : Array(Types::IndexConfigurationSummary)?

        # If the response is truncated, Amazon Kendra returns this token that you can use in the subsequent
        # request to retrieve the next set of indexes.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @index_configuration_summary_items : Array(Types::IndexConfigurationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListQuerySuggestionsBlockListsRequest
        include JSON::Serializable

        # The identifier of the index for a list of all block lists that exist for that index. For information
        # on the current quota limits for block lists, see Quotas for Amazon Kendra .

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # The maximum number of block lists to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of block lists ( BlockListSummaryItems ).

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @index_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListQuerySuggestionsBlockListsResponse
        include JSON::Serializable

        # Summary items for a block list. This includes summary items on the block list ID, block list name,
        # when the block list was created, when the block list was last updated, and the count of block
        # words/phrases in the block list. For information on the current quota limits for block lists, see
        # Quotas for Amazon Kendra .

        @[JSON::Field(key: "BlockListSummaryItems")]
        getter block_list_summary_items : Array(Types::QuerySuggestionsBlockListSummary)?

        # If the response is truncated, Amazon Kendra returns this token that you can use in the subsequent
        # request to retrieve the next set of block lists.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @block_list_summary_items : Array(Types::QuerySuggestionsBlockListSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the index, FAQ, data source, or other resource to get a list of
        # tags for. For example, the ARN of an index is constructed as follows:
        # arn:aws:kendra:your-region:your-account-id:index/index-id For information on how to construct an ARN
        # for all types of Amazon Kendra resources, see Resource types .

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tags associated with the index, FAQ, data source, or other resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListThesauriRequest
        include JSON::Serializable

        # The identifier of the index with one or more thesauri.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # The maximum number of thesauri to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra
        # returns a pagination token in the response. You can use this pagination token to retrieve the next
        # set of thesauri ( ThesaurusSummaryItems ).

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @index_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListThesauriResponse
        include JSON::Serializable

        # If the response is truncated, Amazon Kendra returns this token that you can use in the subsequent
        # request to retrieve the next set of thesauri.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of summary information for a thesaurus or multiple thesauri.

        @[JSON::Field(key: "ThesaurusSummaryItems")]
        getter thesaurus_summary_items : Array(Types::ThesaurusSummary)?

        def initialize(
          @next_token : String? = nil,
          @thesaurus_summary_items : Array(Types::ThesaurusSummary)? = nil
        )
        end
      end

      # The sub groups that belong to a group.

      struct MemberGroup
        include JSON::Serializable

        # The identifier of the sub group you want to map to a group.

        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        # The identifier of the data source for the sub group you want to map to a group.

        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String?

        def initialize(
          @group_id : String,
          @data_source_id : String? = nil
        )
        end
      end

      # The users that belong to a group.

      struct MemberUser
        include JSON::Serializable

        # The identifier of the user you want to map to a group.

        @[JSON::Field(key: "UserId")]
        getter user_id : String

        def initialize(
          @user_id : String
        )
        end
      end

      # Provides the configuration information to connect to GitHub Enterprise Server (on premises).

      struct OnPremiseConfiguration
        include JSON::Serializable

        # The GitHub host URL or API endpoint URL. For example, https://on-prem-host-url/api/v3/

        @[JSON::Field(key: "HostUrl")]
        getter host_url : String

        # The name of the organization of the GitHub Enterprise Server (on-premises) account you want to
        # connect to. You can find your organization name by logging into GitHub desktop and selecting Your
        # organizations under your profile picture dropdown.

        @[JSON::Field(key: "OrganizationName")]
        getter organization_name : String

        # The path to the SSL certificate stored in an Amazon S3 bucket. You use this to connect to GitHub if
        # you require a secure SSL connection. You can simply generate a self-signed X509 certificate on any
        # computer using OpenSSL. For an example of using OpenSSL to create an X509 certificate, see Create
        # and sign an X509 certificate .

        @[JSON::Field(key: "SslCertificateS3Path")]
        getter ssl_certificate_s3_path : Types::S3Path

        def initialize(
          @host_url : String,
          @organization_name : String,
          @ssl_certificate_s3_path : Types::S3Path
        )
        end
      end

      # Provides the configuration information to connect to OneDrive as your data source.

      struct OneDriveConfiguration
        include JSON::Serializable

        # A list of user accounts whose documents should be indexed.

        @[JSON::Field(key: "OneDriveUsers")]
        getter one_drive_users : Types::OneDriveUsers

        # The Amazon Resource Name (ARN) of an Secrets Managersecret that contains the user name and password
        # to connect to OneDrive. The user name should be the application ID for the OneDrive application, and
        # the password is the application key for the OneDrive application.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String

        # The Azure Active Directory domain of the organization.

        @[JSON::Field(key: "TenantDomain")]
        getter tenant_domain : String

        # TRUE to disable local groups information.

        @[JSON::Field(key: "DisableLocalGroups")]
        getter disable_local_groups : Bool?

        # A list of regular expression patterns to exclude certain documents in your OneDrive. Documents that
        # match the patterns are excluded from the index. Documents that don't match the patterns are included
        # in the index. If a document matches both an inclusion and exclusion pattern, the exclusion pattern
        # takes precedence and the document isn't included in the index. The pattern is applied to the file
        # name.

        @[JSON::Field(key: "ExclusionPatterns")]
        getter exclusion_patterns : Array(String)?

        # A list of DataSourceToIndexFieldMapping objects that map OneDrive data source attributes or field
        # names to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before
        # you map to OneDrive fields. For more information, see Mapping data source fields . The OneDrive data
        # source field names must exist in your OneDrive custom metadata.

        @[JSON::Field(key: "FieldMappings")]
        getter field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # A list of regular expression patterns to include certain documents in your OneDrive. Documents that
        # match the patterns are included in the index. Documents that don't match the patterns are excluded
        # from the index. If a document matches both an inclusion and exclusion pattern, the exclusion pattern
        # takes precedence and the document isn't included in the index. The pattern is applied to the file
        # name.

        @[JSON::Field(key: "InclusionPatterns")]
        getter inclusion_patterns : Array(String)?

        def initialize(
          @one_drive_users : Types::OneDriveUsers,
          @secret_arn : String,
          @tenant_domain : String,
          @disable_local_groups : Bool? = nil,
          @exclusion_patterns : Array(String)? = nil,
          @field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @inclusion_patterns : Array(String)? = nil
        )
        end
      end

      # User accounts whose documents should be indexed.

      struct OneDriveUsers
        include JSON::Serializable

        # A list of users whose documents should be indexed. Specify the user names in email format, for
        # example, username@tenantdomain . If you need to index the documents of more than 10 users, use the
        # OneDriveUserS3Path field to specify the location of a file containing a list of users.

        @[JSON::Field(key: "OneDriveUserList")]
        getter one_drive_user_list : Array(String)?

        # The S3 bucket location of a file containing a list of users whose documents should be indexed.

        @[JSON::Field(key: "OneDriveUserS3Path")]
        getter one_drive_user_s3_path : Types::S3Path?

        def initialize(
          @one_drive_user_list : Array(String)? = nil,
          @one_drive_user_s3_path : Types::S3Path? = nil
        )
        end
      end

      # Summary information for users or groups in your IAM Identity Center identity source. This applies to
      # users and groups with specific permissions that define their level of access to your Amazon Kendra
      # experience. You can create an Amazon Kendra experience such as a search application. For more
      # information on creating a search application experience, see Building a search experience with no
      # code .

      struct PersonasSummary
        include JSON::Serializable

        # The Unix timestamp when the summary information was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The identifier of a user or group in your IAM Identity Center identity source. For example, a user
        # ID could be an email.

        @[JSON::Field(key: "EntityId")]
        getter entity_id : String?

        # The persona that defines the specific permissions of the user or group in your IAM Identity Center
        # identity source. The available personas or access roles are Owner and Viewer . For more information
        # on these personas, see Providing access to your search page .

        @[JSON::Field(key: "Persona")]
        getter persona : String?

        # The Unix timestamp when the summary information was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @entity_id : String? = nil,
          @persona : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Provides user and group information for user context filtering .

      struct Principal
        include JSON::Serializable

        # Whether to allow or deny document access to the principal.

        @[JSON::Field(key: "Access")]
        getter access : String

        # The name of the user or group.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The type of principal.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The identifier of the data source the principal should access documents from.

        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String?

        def initialize(
          @access : String,
          @name : String,
          @type : String,
          @data_source_id : String? = nil
        )
        end
      end

      # Provides the configuration information for a web proxy to connect to website hosts.

      struct ProxyConfiguration
        include JSON::Serializable

        # The name of the website host you want to connect to via a web proxy server. For example, the host
        # name of https://a.example.com/page1.html is "a.example.com".

        @[JSON::Field(key: "Host")]
        getter host : String

        # The port number of the website host you want to connect to via a web proxy server. For example, the
        # port for https://a.example.com/page1.html is 443, the standard port for HTTPS.

        @[JSON::Field(key: "Port")]
        getter port : Int32

        # The Amazon Resource Name (ARN) of an Secrets Manager secret. You create a secret to store your
        # credentials in Secrets Manager The credentials are optional. You use a secret if web proxy
        # credentials are required to connect to a website host. Amazon Kendra currently support basic
        # authentication to connect to a web proxy server. The secret stores your credentials.

        @[JSON::Field(key: "Credentials")]
        getter credentials : String?

        def initialize(
          @host : String,
          @port : Int32,
          @credentials : String? = nil
        )
        end
      end


      struct PutPrincipalMappingRequest
        include JSON::Serializable

        # The identifier of the group you want to map its users to.

        @[JSON::Field(key: "GroupId")]
        getter group_id : String

        # The list that contains your users that belong the same group. This can include sub groups that
        # belong to a group. For example, the group "Company A" includes the user "CEO" and the sub groups
        # "Research", "Engineering", and "Sales and Marketing". If you have more than 1000 users and/or sub
        # groups for a single group, you need to provide the path to the S3 file that lists your users and sub
        # groups for a group. Your sub groups can contain more than 1000 users, but the list of sub groups
        # that belong to a group (and/or users) must be no more than 1000.

        @[JSON::Field(key: "GroupMembers")]
        getter group_members : Types::GroupMembers

        # The identifier of the index you want to map users to their groups.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # The identifier of the data source you want to map users to their groups. This is useful if a group
        # is tied to multiple data sources, but you only want the group to access documents of a certain data
        # source. For example, the groups "Research", "Engineering", and "Sales and Marketing" are all tied to
        # the company's documents stored in the data sources Confluence and Salesforce. However, "Sales and
        # Marketing" team only needs access to customer-related documents stored in Salesforce.

        @[JSON::Field(key: "DataSourceId")]
        getter data_source_id : String?

        # The timestamp identifier you specify to ensure Amazon Kendra doesn't override the latest PUT action
        # with previous actions. The highest number ID, which is the ordering ID, is the latest action you
        # want to process and apply on top of other actions with lower number IDs. This prevents previous
        # actions with lower number IDs from possibly overriding the latest action. The ordering ID can be the
        # Unix time of the last update you made to a group members list. You would then provide this list when
        # calling PutPrincipalMapping . This ensures your PUT action for that updated group with the latest
        # members list doesn't get overwritten by earlier PUT actions for the same group which are yet to be
        # processed. The default ordering ID is the current Unix time in milliseconds that the action was
        # received by Amazon Kendra.

        @[JSON::Field(key: "OrderingId")]
        getter ordering_id : Int64?

        # The Amazon Resource Name (ARN) of an IAM role that has access to the S3 file that contains your list
        # of users that belong to a group. For more information, see IAM roles for Amazon Kendra .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @group_id : String,
          @group_members : Types::GroupMembers,
          @index_id : String,
          @data_source_id : String? = nil,
          @ordering_id : Int64? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct QueryRequest
        include JSON::Serializable

        # The identifier of the index for the search.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # Filters search results by document fields/attributes. You can only provide one attribute filter;
        # however, the AndAllFilters , NotFilter , and OrAllFilters parameters contain a list of other
        # filters. The AttributeFilter parameter means you can create a set of filtering rules that a document
        # must satisfy to be included in the query results. For Amazon Kendra Gen AI Enterprise Edition
        # indices use AttributeFilter to enable document filtering for end users using _email_id or include
        # public documents ( _email_id=null ).

        @[JSON::Field(key: "AttributeFilter")]
        getter attribute_filter : Types::AttributeFilter?

        # Provides configuration to determine how to group results by document attribute value, and how to
        # display them (collapsed or expanded) under a designated primary document for each group.

        @[JSON::Field(key: "CollapseConfiguration")]
        getter collapse_configuration : Types::CollapseConfiguration?

        # Overrides relevance tuning configurations of fields/attributes set at the index level. If you use
        # this API to override the relevance tuning configured at the index level, but there is no relevance
        # tuning configured at the index level, then Amazon Kendra does not apply any relevance tuning. If
        # there is relevance tuning configured for fields at the index level, and you use this API to override
        # only some of these fields, then for the fields you did not override, the importance is set to 1.

        @[JSON::Field(key: "DocumentRelevanceOverrideConfigurations")]
        getter document_relevance_override_configurations : Array(Types::DocumentRelevanceConfiguration)?

        # An array of documents fields/attributes for faceted search. Amazon Kendra returns a count for each
        # field key specified. This helps your users narrow their search.

        @[JSON::Field(key: "Facets")]
        getter facets : Array(Types::Facet)?

        # Query results are returned in pages the size of the PageSize parameter. By default, Amazon Kendra
        # returns the first page of results. Use this parameter to get result pages after the first one.

        @[JSON::Field(key: "PageNumber")]
        getter page_number : Int32?

        # Sets the number of results that are returned in each page of results. The default page size is 10.
        # The maximum number of results returned is 100. If you ask for more than 100 results, only 100 are
        # returned.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # Sets the type of query result or response. Only results for the specified type are returned.

        @[JSON::Field(key: "QueryResultTypeFilter")]
        getter query_result_type_filter : String?

        # The input query text for the search. Amazon Kendra truncates queries at 30 token words, which
        # excludes punctuation and stop words. Truncation still applies if you use Boolean or more advanced,
        # complex queries. For example, Timeoff AND October AND Category:HR is counted as 3 tokens: timeoff ,
        # october , hr . For more information, see Searching with advanced query syntax in the Amazon Kendra
        # Developer Guide.

        @[JSON::Field(key: "QueryText")]
        getter query_text : String?

        # An array of document fields/attributes to include in the response. You can limit the response to
        # include certain document fields. By default, all document attributes are included in the response.

        @[JSON::Field(key: "RequestedDocumentAttributes")]
        getter requested_document_attributes : Array(String)?

        # Provides information that determines how the results of the query are sorted. You can set the field
        # that Amazon Kendra should sort the results on, and specify whether the results should be sorted in
        # ascending or descending order. In the case of ties in sorting the results, the results are sorted by
        # relevance. If you don't provide sorting configuration, the results are sorted by the relevance that
        # Amazon Kendra determines for the result.

        @[JSON::Field(key: "SortingConfiguration")]
        getter sorting_configuration : Types::SortingConfiguration?

        # Provides configuration information to determine how the results of a query are sorted. You can set
        # upto 3 fields that Amazon Kendra should sort the results on, and specify whether the results should
        # be sorted in ascending or descending order. The sort field quota can be increased. If you don't
        # provide a sorting configuration, the results are sorted by the relevance that Amazon Kendra
        # determines for the result. In the case of ties in sorting the results, the results are sorted by
        # relevance.

        @[JSON::Field(key: "SortingConfigurations")]
        getter sorting_configurations : Array(Types::SortingConfiguration)?

        # Enables suggested spell corrections for queries.

        @[JSON::Field(key: "SpellCorrectionConfiguration")]
        getter spell_correction_configuration : Types::SpellCorrectionConfiguration?

        # The user context token or user and group information.

        @[JSON::Field(key: "UserContext")]
        getter user_context : Types::UserContext?

        # Provides an identifier for a specific user. The VisitorId should be a unique identifier, such as a
        # GUID. Don't use personally identifiable information, such as the user's email address, as the
        # VisitorId .

        @[JSON::Field(key: "VisitorId")]
        getter visitor_id : String?

        def initialize(
          @index_id : String,
          @attribute_filter : Types::AttributeFilter? = nil,
          @collapse_configuration : Types::CollapseConfiguration? = nil,
          @document_relevance_override_configurations : Array(Types::DocumentRelevanceConfiguration)? = nil,
          @facets : Array(Types::Facet)? = nil,
          @page_number : Int32? = nil,
          @page_size : Int32? = nil,
          @query_result_type_filter : String? = nil,
          @query_text : String? = nil,
          @requested_document_attributes : Array(String)? = nil,
          @sorting_configuration : Types::SortingConfiguration? = nil,
          @sorting_configurations : Array(Types::SortingConfiguration)? = nil,
          @spell_correction_configuration : Types::SpellCorrectionConfiguration? = nil,
          @user_context : Types::UserContext? = nil,
          @visitor_id : String? = nil
        )
        end
      end


      struct QueryResult
        include JSON::Serializable

        # Contains the facet results. A FacetResult contains the counts for each field/attribute key that was
        # specified in the Facets input parameter.

        @[JSON::Field(key: "FacetResults")]
        getter facet_results : Array(Types::FacetResult)?

        # The list of featured result items. Featured results are displayed at the top of the search results
        # page, placed above all other results for certain queries. If there's an exact match of a query, then
        # certain documents are featured in the search results.

        @[JSON::Field(key: "FeaturedResultsItems")]
        getter featured_results_items : Array(Types::FeaturedResultsItem)?

        # The identifier for the search. You also use QueryId to identify the search when using the
        # SubmitFeedback API.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String?

        # The results of the search.

        @[JSON::Field(key: "ResultItems")]
        getter result_items : Array(Types::QueryResultItem)?

        # A list of information related to suggested spell corrections for a query.

        @[JSON::Field(key: "SpellCorrectedQueries")]
        getter spell_corrected_queries : Array(Types::SpellCorrectedQuery)?

        # The total number of items found by the search. However, you can only retrieve up to 100 items. For
        # example, if the search found 192 items, you can only retrieve the first 100 of the items.

        @[JSON::Field(key: "TotalNumberOfResults")]
        getter total_number_of_results : Int32?

        # A list of warning codes and their messages on problems with your query. Amazon Kendra currently only
        # supports one type of warning, which is a warning on invalid syntax used in the query. For examples
        # of invalid query syntax, see Searching with advanced query syntax .

        @[JSON::Field(key: "Warnings")]
        getter warnings : Array(Types::Warning)?

        def initialize(
          @facet_results : Array(Types::FacetResult)? = nil,
          @featured_results_items : Array(Types::FeaturedResultsItem)? = nil,
          @query_id : String? = nil,
          @result_items : Array(Types::QueryResultItem)? = nil,
          @spell_corrected_queries : Array(Types::SpellCorrectedQuery)? = nil,
          @total_number_of_results : Int32? = nil,
          @warnings : Array(Types::Warning)? = nil
        )
        end
      end

      # A single query result. A query result contains information about a document returned by the query.
      # This includes the original location of the document, a list of attributes assigned to the document,
      # and relevant text from the document that satisfies the query.

      struct QueryResultItem
        include JSON::Serializable

        # One or more additional fields/attributes associated with the query result.

        @[JSON::Field(key: "AdditionalAttributes")]
        getter additional_attributes : Array(Types::AdditionalResultAttribute)?

        # Provides details about a collapsed group of search results.

        @[JSON::Field(key: "CollapsedResultDetail")]
        getter collapsed_result_detail : Types::CollapsedResultDetail?

        # An array of document fields/attributes assigned to a document in the search results. For example,
        # the document author ( _author ) or the source URI ( _source_uri ) of the document.

        @[JSON::Field(key: "DocumentAttributes")]
        getter document_attributes : Array(Types::DocumentAttribute)?

        # An extract of the text in the document. Contains information about highlighting the relevant terms
        # in the excerpt.

        @[JSON::Field(key: "DocumentExcerpt")]
        getter document_excerpt : Types::TextWithHighlights?

        # The identifier for the document.

        @[JSON::Field(key: "DocumentId")]
        getter document_id : String?

        # The title of the document. Contains the text of the title and information for highlighting the
        # relevant terms in the title.

        @[JSON::Field(key: "DocumentTitle")]
        getter document_title : Types::TextWithHighlights?

        # The URI of the original location of the document.

        @[JSON::Field(key: "DocumentURI")]
        getter document_uri : String?

        # A token that identifies a particular result from a particular query. Use this token to provide
        # click-through feedback for the result. For more information, see Submitting feedback .

        @[JSON::Field(key: "FeedbackToken")]
        getter feedback_token : String?

        # If the Type of document within the response is ANSWER , then it is either a TABLE answer or TEXT
        # answer. If it's a table answer, a table excerpt is returned in TableExcerpt . If it's a text answer,
        # a text excerpt is returned in DocumentExcerpt .

        @[JSON::Field(key: "Format")]
        getter format : String?

        # The unique identifier for the query result item id ( Id ) and the query result item document id (
        # DocumentId ) combined. The value of this field changes with every request, even when you have the
        # same documents.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Indicates the confidence level of Amazon Kendra providing a relevant result for the query. Each
        # result is placed into a bin that indicates the confidence, VERY_HIGH , HIGH , MEDIUM and LOW . You
        # can use the score to determine if a response meets the confidence needed for your application. The
        # field is only set to LOW when the Type field is set to DOCUMENT and Amazon Kendra is not confident
        # that the result is relevant to the query.

        @[JSON::Field(key: "ScoreAttributes")]
        getter score_attributes : Types::ScoreAttributes?

        # An excerpt from a table within a document.

        @[JSON::Field(key: "TableExcerpt")]
        getter table_excerpt : Types::TableExcerpt?

        # The type of document within the response. For example, a response could include a question-answer
        # that's relevant to the query.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @additional_attributes : Array(Types::AdditionalResultAttribute)? = nil,
          @collapsed_result_detail : Types::CollapsedResultDetail? = nil,
          @document_attributes : Array(Types::DocumentAttribute)? = nil,
          @document_excerpt : Types::TextWithHighlights? = nil,
          @document_id : String? = nil,
          @document_title : Types::TextWithHighlights? = nil,
          @document_uri : String? = nil,
          @feedback_token : String? = nil,
          @format : String? = nil,
          @id : String? = nil,
          @score_attributes : Types::ScoreAttributes? = nil,
          @table_excerpt : Types::TableExcerpt? = nil,
          @type : String? = nil
        )
        end
      end

      # Summary information on a query suggestions block list. This includes information on the block list
      # ID, block list name, when the block list was created, when the block list was last updated, and the
      # count of block words/phrases in the block list. For information on the current quota limits for
      # block lists, see Quotas for Amazon Kendra .

      struct QuerySuggestionsBlockListSummary
        include JSON::Serializable

        # The Unix timestamp when the block list was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The identifier of a block list.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The number of items in the block list file.

        @[JSON::Field(key: "ItemCount")]
        getter item_count : Int32?

        # The name of the block list.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The status of the block list.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Unix timestamp when the block list was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @id : String? = nil,
          @item_count : Int32? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Provides the configuration information to connect to Quip as your data source.

      struct QuipConfiguration
        include JSON::Serializable

        # The Quip site domain. For example, https://quip-company.quipdomain.com/browse . The domain in this
        # example is "quipdomain".

        @[JSON::Field(key: "Domain")]
        getter domain : String

        # The Amazon Resource Name (ARN) of an Secrets Manager secret that contains the key-value pairs that
        # are required to connect to your Quip. The secret must contain a JSON structure with the following
        # keys: accessToken—The token created in Quip. For more information, see Using a Quip data source .

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of Quip
        # attachments to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API
        # before you map to Quip fields. For more information, see Mapping data source fields . The Quip field
        # names must exist in your Quip custom metadata.

        @[JSON::Field(key: "AttachmentFieldMappings")]
        getter attachment_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # TRUE to index attachments.

        @[JSON::Field(key: "CrawlAttachments")]
        getter crawl_attachments : Bool?

        # TRUE to index the contents of chat rooms.

        @[JSON::Field(key: "CrawlChatRooms")]
        getter crawl_chat_rooms : Bool?

        # TRUE to index file comments.

        @[JSON::Field(key: "CrawlFileComments")]
        getter crawl_file_comments : Bool?

        # A list of regular expression patterns to exclude certain files in your Quip file system. Files that
        # match the patterns are excluded from the index. Files that don’t match the patterns are included in
        # the index. If a file matches both an inclusion pattern and an exclusion pattern, the exclusion
        # pattern takes precedence, and the file isn't included in the index.

        @[JSON::Field(key: "ExclusionPatterns")]
        getter exclusion_patterns : Array(String)?

        # The identifiers of the Quip folders you want to index. You can find the folder ID in your browser
        # URL when you access your folder in Quip. For example,
        # https://quip-company.quipdomain.com/zlLuOVNSarTL/folder-name . The folder ID in this example is
        # "zlLuOVNSarTL".

        @[JSON::Field(key: "FolderIds")]
        getter folder_ids : Array(String)?

        # A list of regular expression patterns to include certain files in your Quip file system. Files that
        # match the patterns are included in the index. Files that don't match the patterns are excluded from
        # the index. If a file matches both an inclusion pattern and an exclusion pattern, the exclusion
        # pattern takes precedence, and the file isn't included in the index.

        @[JSON::Field(key: "InclusionPatterns")]
        getter inclusion_patterns : Array(String)?

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of Quip messages
        # to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before you map
        # to Quip fields. For more information, see Mapping data source fields . The Quip field names must
        # exist in your Quip custom metadata.

        @[JSON::Field(key: "MessageFieldMappings")]
        getter message_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # A list of DataSourceToIndexFieldMapping objects that map attributes or field names of Quip threads
        # to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before you map
        # to Quip fields. For more information, see Mapping data source fields . The Quip field names must
        # exist in your Quip custom metadata.

        @[JSON::Field(key: "ThreadFieldMappings")]
        getter thread_field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # Configuration information for an Amazon Virtual Private Cloud (VPC) to connect to your Quip. For
        # more information, see Configuring a VPC .

        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::DataSourceVpcConfiguration?

        def initialize(
          @domain : String,
          @secret_arn : String,
          @attachment_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @crawl_attachments : Bool? = nil,
          @crawl_chat_rooms : Bool? = nil,
          @crawl_file_comments : Bool? = nil,
          @exclusion_patterns : Array(String)? = nil,
          @folder_ids : Array(String)? = nil,
          @inclusion_patterns : Array(String)? = nil,
          @message_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @thread_field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @vpc_configuration : Types::DataSourceVpcConfiguration? = nil
        )
        end
      end

      # Provides information for tuning the relevance of a field in a search. When a query includes terms
      # that match the field, the results are given a boost in the response based on these tuning
      # parameters.

      struct Relevance
        include JSON::Serializable

        # Specifies the time period that the boost applies to. For example, to make the boost apply to
        # documents with the field value within the last month, you would use "2628000s". Once the field value
        # is beyond the specified range, the effect of the boost drops off. The higher the importance, the
        # faster the effect drops off. If you don't specify a value, the default is 3 months. The value of the
        # field is a numeric string followed by the character "s", for example "86400s" for one day, or
        # "604800s" for one week. Only applies to DATE fields.

        @[JSON::Field(key: "Duration")]
        getter duration : String?

        # Indicates that this field determines how "fresh" a document is. For example, if document 1 was
        # created on November 5, and document 2 was created on October 31, document 1 is "fresher" than
        # document 2. Only applies to DATE fields.

        @[JSON::Field(key: "Freshness")]
        getter freshness : Bool?

        # The relative importance of the field in the search. Larger numbers provide more of a boost than
        # smaller numbers.

        @[JSON::Field(key: "Importance")]
        getter importance : Int32?

        # Determines how values should be interpreted. When the RankOrder field is ASCENDING , higher numbers
        # are better. For example, a document with a rating score of 10 is higher ranking than a document with
        # a rating score of 1. When the RankOrder field is DESCENDING , lower numbers are better. For example,
        # in a task tracking application, a priority 1 task is more important than a priority 5 task. Only
        # applies to LONG fields.

        @[JSON::Field(key: "RankOrder")]
        getter rank_order : String?

        # A list of values that should be given a different boost when they appear in the result list. For
        # example, if you are boosting a field called "department", query terms that match the department
        # field are boosted in the result. However, you can add entries from the department field to boost
        # documents with those values higher. For example, you can add entries to the map with names of
        # departments. If you add "HR",5 and "Legal",3 those departments are given special attention when they
        # appear in the metadata of a document. When those terms appear they are given the specified
        # importance instead of the regular importance for the boost.

        @[JSON::Field(key: "ValueImportanceMap")]
        getter value_importance_map : Hash(String, Int32)?

        def initialize(
          @duration : String? = nil,
          @freshness : Bool? = nil,
          @importance : Int32? = nil,
          @rank_order : String? = nil,
          @value_importance_map : Hash(String, Int32)? = nil
        )
        end
      end

      # Provides feedback on how relevant a document is to a search. Your application uses the
      # SubmitFeedback API to provide relevance information.

      struct RelevanceFeedback
        include JSON::Serializable

        # Whether the document was relevant or not relevant to the search.

        @[JSON::Field(key: "RelevanceValue")]
        getter relevance_value : String

        # The identifier of the search result that the user provided relevance feedback for.

        @[JSON::Field(key: "ResultId")]
        getter result_id : String

        def initialize(
          @relevance_value : String,
          @result_id : String
        )
        end
      end

      # The resource you want to use already exists. Please check you have provided the correct resource and
      # try again.

      struct ResourceAlreadyExistException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource you want to use is currently in use. Please check you have provided the correct
      # resource and try again.

      struct ResourceInUseException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource you want to use doesn’t exist. Please check you have provided the correct resource and
      # try again.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource you want to use isn't available. Please check you have provided the correct resource
      # and try again.

      struct ResourceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct RetrieveRequest
        include JSON::Serializable

        # The identifier of the index to retrieve relevant passages for the search.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # The input query text to retrieve relevant passages for the search. Amazon Kendra truncates queries
        # at 30 token words, which excludes punctuation and stop words. Truncation still applies if you use
        # Boolean or more advanced, complex queries. For example, Timeoff AND October AND Category:HR is
        # counted as 3 tokens: timeoff , october , hr . For more information, see Searching with advanced
        # query syntax in the Amazon Kendra Developer Guide.

        @[JSON::Field(key: "QueryText")]
        getter query_text : String

        # Filters search results by document fields/attributes. You can only provide one attribute filter;
        # however, the AndAllFilters , NotFilter , and OrAllFilters parameters contain a list of other
        # filters. The AttributeFilter parameter means you can create a set of filtering rules that a document
        # must satisfy to be included in the query results. For Amazon Kendra Gen AI Enterprise Edition
        # indices use AttributeFilter to enable document filtering for end users using _email_id or include
        # public documents ( _email_id=null ).

        @[JSON::Field(key: "AttributeFilter")]
        getter attribute_filter : Types::AttributeFilter?

        # Overrides relevance tuning configurations of fields/attributes set at the index level. If you use
        # this API to override the relevance tuning configured at the index level, but there is no relevance
        # tuning configured at the index level, then Amazon Kendra does not apply any relevance tuning. If
        # there is relevance tuning configured for fields at the index level, and you use this API to override
        # only some of these fields, then for the fields you did not override, the importance is set to 1.

        @[JSON::Field(key: "DocumentRelevanceOverrideConfigurations")]
        getter document_relevance_override_configurations : Array(Types::DocumentRelevanceConfiguration)?

        # Retrieved relevant passages are returned in pages the size of the PageSize parameter. By default,
        # Amazon Kendra returns the first page of results. Use this parameter to get result pages after the
        # first one.

        @[JSON::Field(key: "PageNumber")]
        getter page_number : Int32?

        # Sets the number of retrieved relevant passages that are returned in each page of results. The
        # default page size is 10. The maximum number of results returned is 100. If you ask for more than 100
        # results, only 100 are returned.

        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # A list of document fields/attributes to include in the response. You can limit the response to
        # include certain document fields. By default, all document fields are included in the response.

        @[JSON::Field(key: "RequestedDocumentAttributes")]
        getter requested_document_attributes : Array(String)?

        # The user context token or user and group information.

        @[JSON::Field(key: "UserContext")]
        getter user_context : Types::UserContext?

        def initialize(
          @index_id : String,
          @query_text : String,
          @attribute_filter : Types::AttributeFilter? = nil,
          @document_relevance_override_configurations : Array(Types::DocumentRelevanceConfiguration)? = nil,
          @page_number : Int32? = nil,
          @page_size : Int32? = nil,
          @requested_document_attributes : Array(String)? = nil,
          @user_context : Types::UserContext? = nil
        )
        end
      end


      struct RetrieveResult
        include JSON::Serializable

        # The identifier of query used for the search. You also use QueryId to identify the search when using
        # the Submitfeedback API.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String?

        # The results of the retrieved relevant passages for the search.

        @[JSON::Field(key: "ResultItems")]
        getter result_items : Array(Types::RetrieveResultItem)?

        def initialize(
          @query_id : String? = nil,
          @result_items : Array(Types::RetrieveResultItem)? = nil
        )
        end
      end

      # A single retrieved relevant passage result.

      struct RetrieveResultItem
        include JSON::Serializable

        # The contents of the relevant passage.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # An array of document fields/attributes assigned to a document in the search results. For example,
        # the document author ( _author ) or the source URI ( _source_uri ) of the document.

        @[JSON::Field(key: "DocumentAttributes")]
        getter document_attributes : Array(Types::DocumentAttribute)?

        # The identifier of the document.

        @[JSON::Field(key: "DocumentId")]
        getter document_id : String?

        # The title of the document.

        @[JSON::Field(key: "DocumentTitle")]
        getter document_title : String?

        # The URI of the original location of the document.

        @[JSON::Field(key: "DocumentURI")]
        getter document_uri : String?

        # The identifier of the relevant passage result.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The confidence score bucket for a retrieved passage result. The confidence bucket provides a
        # relative ranking that indicates how confident Amazon Kendra is that the response is relevant to the
        # query.

        @[JSON::Field(key: "ScoreAttributes")]
        getter score_attributes : Types::ScoreAttributes?

        def initialize(
          @content : String? = nil,
          @document_attributes : Array(Types::DocumentAttribute)? = nil,
          @document_id : String? = nil,
          @document_title : String? = nil,
          @document_uri : String? = nil,
          @id : String? = nil,
          @score_attributes : Types::ScoreAttributes? = nil
        )
        end
      end

      # Provides the configuration information to connect to an Amazon S3 bucket. Amazon Kendra now supports
      # an upgraded Amazon S3 connector. You must now use the TemplateConfiguration object instead of the
      # S3DataSourceConfiguration object to configure your connector. Connectors configured using the older
      # console and API architecture will continue to function as configured. However, you won't be able to
      # edit or update them. If you want to edit or update your connector configuration, you must create a
      # new connector. We recommended migrating your connector workflow to the upgraded version. Support for
      # connectors configured using the older architecture is scheduled to end by June 2024.

      struct S3DataSourceConfiguration
        include JSON::Serializable

        # The name of the bucket that contains the documents.

        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String

        # Provides the path to the S3 bucket that contains the user context filtering files for the data
        # source. For the format of the file, see Access control for S3 data sources .

        @[JSON::Field(key: "AccessControlListConfiguration")]
        getter access_control_list_configuration : Types::AccessControlListConfiguration?


        @[JSON::Field(key: "DocumentsMetadataConfiguration")]
        getter documents_metadata_configuration : Types::DocumentsMetadataConfiguration?

        # A list of glob patterns (patterns that can expand a wildcard pattern into a list of path names that
        # match the given pattern) for certain file names and file types to exclude from your index. If a
        # document matches both an inclusion and exclusion prefix or pattern, the exclusion prefix takes
        # precendence and the document is not indexed. Examples of glob patterns include: /myapp/config/* —All
        # files inside config directory. **/*.png —All .png files in all directories. **/*.{png, ico, md} —All
        # .png, .ico or .md files in all directories. /myapp/src/**/*.ts —All .ts files inside src directory
        # (and all its subdirectories). **/!(*.module).ts —All .ts files but not .module.ts *.png , *.jpg —All
        # PNG and JPEG image files in a directory (files with the extensions .png and .jpg). *internal* —All
        # files in a directory that contain 'internal' in the file name, such as 'internal', 'internal_only',
        # 'company_internal'. **/*internal* —All internal-related files in a directory and its subdirectories.
        # For more examples, see Use of Exclude and Include Filters in the Amazon Web Services CLI Command
        # Reference.

        @[JSON::Field(key: "ExclusionPatterns")]
        getter exclusion_patterns : Array(String)?

        # A list of glob patterns (patterns that can expand a wildcard pattern into a list of path names that
        # match the given pattern) for certain file names and file types to include in your index. If a
        # document matches both an inclusion and exclusion prefix or pattern, the exclusion prefix takes
        # precendence and the document is not indexed. Examples of glob patterns include: /myapp/config/* —All
        # files inside config directory. **/*.png —All .png files in all directories. **/*.{png, ico, md} —All
        # .png, .ico or .md files in all directories. /myapp/src/**/*.ts —All .ts files inside src directory
        # (and all its subdirectories). **/!(*.module).ts —All .ts files but not .module.ts *.png , *.jpg —All
        # PNG and JPEG image files in a directory (files with the extensions .png and .jpg). *internal* —All
        # files in a directory that contain 'internal' in the file name, such as 'internal', 'internal_only',
        # 'company_internal'. **/*internal* —All internal-related files in a directory and its subdirectories.
        # For more examples, see Use of Exclude and Include Filters in the Amazon Web Services CLI Command
        # Reference.

        @[JSON::Field(key: "InclusionPatterns")]
        getter inclusion_patterns : Array(String)?

        # A list of S3 prefixes for the documents that should be included in the index.

        @[JSON::Field(key: "InclusionPrefixes")]
        getter inclusion_prefixes : Array(String)?

        def initialize(
          @bucket_name : String,
          @access_control_list_configuration : Types::AccessControlListConfiguration? = nil,
          @documents_metadata_configuration : Types::DocumentsMetadataConfiguration? = nil,
          @exclusion_patterns : Array(String)? = nil,
          @inclusion_patterns : Array(String)? = nil,
          @inclusion_prefixes : Array(String)? = nil
        )
        end
      end

      # Information required to find a specific file in an Amazon S3 bucket.

      struct S3Path
        include JSON::Serializable

        # The name of the S3 bucket that contains the file.

        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The name of the file.

        @[JSON::Field(key: "Key")]
        getter key : String

        def initialize(
          @bucket : String,
          @key : String
        )
        end
      end

      # Provides the configuration information to connect to GitHub Enterprise Cloud (SaaS).

      struct SaaSConfiguration
        include JSON::Serializable

        # The GitHub host URL or API endpoint URL. For example, https://api.github.com .

        @[JSON::Field(key: "HostUrl")]
        getter host_url : String

        # The name of the organization of the GitHub Enterprise Cloud (SaaS) account you want to connect to.
        # You can find your organization name by logging into GitHub desktop and selecting Your organizations
        # under your profile picture dropdown.

        @[JSON::Field(key: "OrganizationName")]
        getter organization_name : String

        def initialize(
          @host_url : String,
          @organization_name : String
        )
        end
      end

      # The configuration information for syncing a Salesforce chatter feed. The contents of the object
      # comes from the Salesforce FeedItem table.

      struct SalesforceChatterFeedConfiguration
        include JSON::Serializable

        # The name of the column in the Salesforce FeedItem table that contains the content to index.
        # Typically this is the Body column.

        @[JSON::Field(key: "DocumentDataFieldName")]
        getter document_data_field_name : String

        # The name of the column in the Salesforce FeedItem table that contains the title of the document.
        # This is typically the Title column.

        @[JSON::Field(key: "DocumentTitleFieldName")]
        getter document_title_field_name : String?

        # Maps fields from a Salesforce chatter feed into Amazon Kendra index fields.

        @[JSON::Field(key: "FieldMappings")]
        getter field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # Filters the documents in the feed based on status of the user. When you specify ACTIVE_USERS only
        # documents from users who have an active account are indexed. When you specify STANDARD_USER only
        # documents for Salesforce standard users are documented. You can specify both.

        @[JSON::Field(key: "IncludeFilterTypes")]
        getter include_filter_types : Array(String)?

        def initialize(
          @document_data_field_name : String,
          @document_title_field_name : String? = nil,
          @field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @include_filter_types : Array(String)? = nil
        )
        end
      end

      # Provides the configuration information to connect to Salesforce as your data source.

      struct SalesforceConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Secrets Managersecret that contains the key/value pairs
        # required to connect to your Salesforce instance. The secret must contain a JSON structure with the
        # following keys: authenticationUrl - The OAUTH endpoint that Amazon Kendra connects to get an OAUTH
        # token. consumerKey - The application public key generated when you created your Salesforce
        # application. consumerSecret - The application private key generated when you created your Salesforce
        # application. password - The password associated with the user logging in to the Salesforce instance.
        # securityToken - The token associated with the user logging in to the Salesforce instance. username -
        # The user name of the user logging in to the Salesforce instance.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String

        # The instance URL for the Salesforce site that you want to index.

        @[JSON::Field(key: "ServerUrl")]
        getter server_url : String

        # Configuration information for Salesforce chatter feeds.

        @[JSON::Field(key: "ChatterFeedConfiguration")]
        getter chatter_feed_configuration : Types::SalesforceChatterFeedConfiguration?

        # Indicates whether Amazon Kendra should index attachments to Salesforce objects.

        @[JSON::Field(key: "CrawlAttachments")]
        getter crawl_attachments : Bool?

        # A list of regular expression patterns to exclude certain documents in your Salesforce. Documents
        # that match the patterns are excluded from the index. Documents that don't match the patterns are
        # included in the index. If a document matches both an inclusion and exclusion pattern, the exclusion
        # pattern takes precedence and the document isn't included in the index. The pattern is applied to the
        # name of the attached file.

        @[JSON::Field(key: "ExcludeAttachmentFilePatterns")]
        getter exclude_attachment_file_patterns : Array(String)?

        # A list of regular expression patterns to include certain documents in your Salesforce. Documents
        # that match the patterns are included in the index. Documents that don't match the patterns are
        # excluded from the index. If a document matches both an inclusion and exclusion pattern, the
        # exclusion pattern takes precedence and the document isn't included in the index. The pattern is
        # applied to the name of the attached file.

        @[JSON::Field(key: "IncludeAttachmentFilePatterns")]
        getter include_attachment_file_patterns : Array(String)?

        # Configuration information for the knowledge article types that Amazon Kendra indexes. Amazon Kendra
        # indexes standard knowledge articles and the standard fields of knowledge articles, or the custom
        # fields of custom knowledge articles, but not both.

        @[JSON::Field(key: "KnowledgeArticleConfiguration")]
        getter knowledge_article_configuration : Types::SalesforceKnowledgeArticleConfiguration?

        # Configuration information for processing attachments to Salesforce standard objects.

        @[JSON::Field(key: "StandardObjectAttachmentConfiguration")]
        getter standard_object_attachment_configuration : Types::SalesforceStandardObjectAttachmentConfiguration?

        # Configuration of the Salesforce standard objects that Amazon Kendra indexes.

        @[JSON::Field(key: "StandardObjectConfigurations")]
        getter standard_object_configurations : Array(Types::SalesforceStandardObjectConfiguration)?

        def initialize(
          @secret_arn : String,
          @server_url : String,
          @chatter_feed_configuration : Types::SalesforceChatterFeedConfiguration? = nil,
          @crawl_attachments : Bool? = nil,
          @exclude_attachment_file_patterns : Array(String)? = nil,
          @include_attachment_file_patterns : Array(String)? = nil,
          @knowledge_article_configuration : Types::SalesforceKnowledgeArticleConfiguration? = nil,
          @standard_object_attachment_configuration : Types::SalesforceStandardObjectAttachmentConfiguration? = nil,
          @standard_object_configurations : Array(Types::SalesforceStandardObjectConfiguration)? = nil
        )
        end
      end

      # Provides the configuration information for indexing Salesforce custom articles.

      struct SalesforceCustomKnowledgeArticleTypeConfiguration
        include JSON::Serializable

        # The name of the field in the custom knowledge article that contains the document data to index.

        @[JSON::Field(key: "DocumentDataFieldName")]
        getter document_data_field_name : String

        # The name of the configuration.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The name of the field in the custom knowledge article that contains the document title.

        @[JSON::Field(key: "DocumentTitleFieldName")]
        getter document_title_field_name : String?

        # Maps attributes or field names of the custom knowledge article to Amazon Kendra index field names.
        # To create custom fields, use the UpdateIndex API before you map to Salesforce fields. For more
        # information, see Mapping data source fields . The Salesforce data source field names must exist in
        # your Salesforce custom metadata.

        @[JSON::Field(key: "FieldMappings")]
        getter field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        def initialize(
          @document_data_field_name : String,
          @name : String,
          @document_title_field_name : String? = nil,
          @field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil
        )
        end
      end

      # Provides the configuration information for the knowledge article types that Amazon Kendra indexes.
      # Amazon Kendra indexes standard knowledge articles and the standard fields of knowledge articles, or
      # the custom fields of custom knowledge articles, but not both

      struct SalesforceKnowledgeArticleConfiguration
        include JSON::Serializable

        # Specifies the document states that should be included when Amazon Kendra indexes knowledge articles.
        # You must specify at least one state.

        @[JSON::Field(key: "IncludedStates")]
        getter included_states : Array(String)

        # Configuration information for custom Salesforce knowledge articles.

        @[JSON::Field(key: "CustomKnowledgeArticleTypeConfigurations")]
        getter custom_knowledge_article_type_configurations : Array(Types::SalesforceCustomKnowledgeArticleTypeConfiguration)?

        # Configuration information for standard Salesforce knowledge articles.

        @[JSON::Field(key: "StandardKnowledgeArticleTypeConfiguration")]
        getter standard_knowledge_article_type_configuration : Types::SalesforceStandardKnowledgeArticleTypeConfiguration?

        def initialize(
          @included_states : Array(String),
          @custom_knowledge_article_type_configurations : Array(Types::SalesforceCustomKnowledgeArticleTypeConfiguration)? = nil,
          @standard_knowledge_article_type_configuration : Types::SalesforceStandardKnowledgeArticleTypeConfiguration? = nil
        )
        end
      end

      # Provides the configuration information for standard Salesforce knowledge articles.

      struct SalesforceStandardKnowledgeArticleTypeConfiguration
        include JSON::Serializable

        # The name of the field that contains the document data to index.

        @[JSON::Field(key: "DocumentDataFieldName")]
        getter document_data_field_name : String

        # The name of the field that contains the document title.

        @[JSON::Field(key: "DocumentTitleFieldName")]
        getter document_title_field_name : String?

        # Maps attributes or field names of the knowledge article to Amazon Kendra index field names. To
        # create custom fields, use the UpdateIndex API before you map to Salesforce fields. For more
        # information, see Mapping data source fields . The Salesforce data source field names must exist in
        # your Salesforce custom metadata.

        @[JSON::Field(key: "FieldMappings")]
        getter field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        def initialize(
          @document_data_field_name : String,
          @document_title_field_name : String? = nil,
          @field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil
        )
        end
      end

      # Provides the configuration information for processing attachments to Salesforce standard objects.

      struct SalesforceStandardObjectAttachmentConfiguration
        include JSON::Serializable

        # The name of the field used for the document title.

        @[JSON::Field(key: "DocumentTitleFieldName")]
        getter document_title_field_name : String?

        # One or more objects that map fields in attachments to Amazon Kendra index fields.

        @[JSON::Field(key: "FieldMappings")]
        getter field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        def initialize(
          @document_title_field_name : String? = nil,
          @field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil
        )
        end
      end

      # Provides the configuration information for indexing a single standard object.

      struct SalesforceStandardObjectConfiguration
        include JSON::Serializable

        # The name of the field in the standard object table that contains the document contents.

        @[JSON::Field(key: "DocumentDataFieldName")]
        getter document_data_field_name : String

        # The name of the standard object.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The name of the field in the standard object table that contains the document title.

        @[JSON::Field(key: "DocumentTitleFieldName")]
        getter document_title_field_name : String?

        # Maps attributes or field names of the standard object to Amazon Kendra index field names. To create
        # custom fields, use the UpdateIndex API before you map to Salesforce fields. For more information,
        # see Mapping data source fields . The Salesforce data source field names must exist in your
        # Salesforce custom metadata.

        @[JSON::Field(key: "FieldMappings")]
        getter field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        def initialize(
          @document_data_field_name : String,
          @name : String,
          @document_title_field_name : String? = nil,
          @field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil
        )
        end
      end

      # Provides a relative ranking that indicates how confident Amazon Kendra is that the response is
      # relevant to the query.

      struct ScoreAttributes
        include JSON::Serializable

        # A relative ranking for how relevant the response is to the query.

        @[JSON::Field(key: "ScoreConfidence")]
        getter score_confidence : String?

        def initialize(
          @score_confidence : String? = nil
        )
        end
      end

      # Provides information about how a custom index field is used during a search.

      struct Search
        include JSON::Serializable

        # Determines whether the field is returned in the query response. The default is true .

        @[JSON::Field(key: "Displayable")]
        getter displayable : Bool?

        # Indicates that the field can be used to create search facets, a count of results for each value in
        # the field. The default is false .

        @[JSON::Field(key: "Facetable")]
        getter facetable : Bool?

        # Determines whether the field is used in the search. If the Searchable field is true , you can use
        # relevance tuning to manually tune how Amazon Kendra weights the field in the search. The default is
        # true for string fields and false for number and date fields.

        @[JSON::Field(key: "Searchable")]
        getter searchable : Bool?

        # Determines whether the field can be used to sort the results of a query. If you specify sorting on a
        # field that does not have Sortable set to true , Amazon Kendra returns an exception. The default is
        # false .

        @[JSON::Field(key: "Sortable")]
        getter sortable : Bool?

        def initialize(
          @displayable : Bool? = nil,
          @facetable : Bool? = nil,
          @searchable : Bool? = nil,
          @sortable : Bool? = nil
        )
        end
      end

      # Provides the configuration information for the seed or starting point URLs to crawl. When selecting
      # websites to index, you must adhere to the Amazon Acceptable Use Policy and all other Amazon terms.
      # Remember that you must only use Amazon Kendra Web Crawler to index your own web pages, or web pages
      # that you have authorization to index.

      struct SeedUrlConfiguration
        include JSON::Serializable

        # The list of seed or starting point URLs of the websites you want to crawl. The list can include a
        # maximum of 100 seed URLs.

        @[JSON::Field(key: "SeedUrls")]
        getter seed_urls : Array(String)

        # You can choose one of the following modes: HOST_ONLY —crawl only the website host names. For
        # example, if the seed URL is "abc.example.com", then only URLs with host name "abc.example.com" are
        # crawled. SUBDOMAINS —crawl the website host names with subdomains. For example, if the seed URL is
        # "abc.example.com", then "a.abc.example.com" and "b.abc.example.com" are also crawled. EVERYTHING
        # —crawl the website host names with subdomains and other domains that the web pages link to. The
        # default mode is set to HOST_ONLY .

        @[JSON::Field(key: "WebCrawlerMode")]
        getter web_crawler_mode : String?

        def initialize(
          @seed_urls : Array(String),
          @web_crawler_mode : String? = nil
        )
        end
      end

      # Provides the identifier of the KMS key used to encrypt data indexed by Amazon Kendra. Amazon Kendra
      # doesn't support asymmetric keys.

      struct ServerSideEncryptionConfiguration
        include JSON::Serializable

        # The identifier of the KMS key. Amazon Kendra doesn't support asymmetric keys.

        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @kms_key_id : String? = nil
        )
        end
      end

      # Provides the configuration information to connect to ServiceNow as your data source.

      struct ServiceNowConfiguration
        include JSON::Serializable

        # The ServiceNow instance that the data source connects to. The host endpoint should look like the
        # following: {instance}.service-now.com.

        @[JSON::Field(key: "HostUrl")]
        getter host_url : String

        # The Amazon Resource Name (ARN) of the Secrets Manager secret that contains the user name and
        # password required to connect to the ServiceNow instance. You can also provide OAuth authentication
        # credentials of user name, password, client ID, and client secret. For more information, see Using a
        # ServiceNow data source .

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String

        # The identifier of the release that the ServiceNow host is running. If the host is not running the
        # LONDON release, use OTHERS .

        @[JSON::Field(key: "ServiceNowBuildVersion")]
        getter service_now_build_version : String

        # The type of authentication used to connect to the ServiceNow instance. If you choose HTTP_BASIC ,
        # Amazon Kendra is authenticated using the user name and password provided in the Secrets Manager
        # secret in the SecretArn field. If you choose OAUTH2 , Amazon Kendra is authenticated using the
        # credentials of client ID, client secret, user name and password. When you use OAUTH2 authentication,
        # you must generate a token and a client secret using the ServiceNow console. For more information,
        # see Using a ServiceNow data source .

        @[JSON::Field(key: "AuthenticationType")]
        getter authentication_type : String?

        # Configuration information for crawling knowledge articles in the ServiceNow site.

        @[JSON::Field(key: "KnowledgeArticleConfiguration")]
        getter knowledge_article_configuration : Types::ServiceNowKnowledgeArticleConfiguration?

        # Configuration information for crawling service catalogs in the ServiceNow site.

        @[JSON::Field(key: "ServiceCatalogConfiguration")]
        getter service_catalog_configuration : Types::ServiceNowServiceCatalogConfiguration?

        def initialize(
          @host_url : String,
          @secret_arn : String,
          @service_now_build_version : String,
          @authentication_type : String? = nil,
          @knowledge_article_configuration : Types::ServiceNowKnowledgeArticleConfiguration? = nil,
          @service_catalog_configuration : Types::ServiceNowServiceCatalogConfiguration? = nil
        )
        end
      end

      # Provides the configuration information for crawling knowledge articles in the ServiceNow site.

      struct ServiceNowKnowledgeArticleConfiguration
        include JSON::Serializable

        # The name of the ServiceNow field that is mapped to the index document contents field in the Amazon
        # Kendra index.

        @[JSON::Field(key: "DocumentDataFieldName")]
        getter document_data_field_name : String

        # TRUE to index attachments to knowledge articles.

        @[JSON::Field(key: "CrawlAttachments")]
        getter crawl_attachments : Bool?

        # The name of the ServiceNow field that is mapped to the index document title field.

        @[JSON::Field(key: "DocumentTitleFieldName")]
        getter document_title_field_name : String?

        # A list of regular expression patterns applied to exclude certain knowledge article attachments.
        # Attachments that match the patterns are excluded from the index. Items that don't match the patterns
        # are included in the index. If an item matches both an inclusion and exclusion pattern, the exclusion
        # pattern takes precedence and the item isn't included in the index.

        @[JSON::Field(key: "ExcludeAttachmentFilePatterns")]
        getter exclude_attachment_file_patterns : Array(String)?

        # Maps attributes or field names of knoweldge articles to Amazon Kendra index field names. To create
        # custom fields, use the UpdateIndex API before you map to ServiceNow fields. For more information,
        # see Mapping data source fields . The ServiceNow data source field names must exist in your
        # ServiceNow custom metadata.

        @[JSON::Field(key: "FieldMappings")]
        getter field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # A query that selects the knowledge articles to index. The query can return articles from multiple
        # knowledge bases, and the knowledge bases can be public or private. The query string must be one
        # generated by the ServiceNow console. For more information, see Specifying documents to index with a
        # query .

        @[JSON::Field(key: "FilterQuery")]
        getter filter_query : String?

        # A list of regular expression patterns applied to include knowledge article attachments. Attachments
        # that match the patterns are included in the index. Items that don't match the patterns are excluded
        # from the index. If an item matches both an inclusion and exclusion pattern, the exclusion pattern
        # takes precedence and the item isn't included in the index.

        @[JSON::Field(key: "IncludeAttachmentFilePatterns")]
        getter include_attachment_file_patterns : Array(String)?

        def initialize(
          @document_data_field_name : String,
          @crawl_attachments : Bool? = nil,
          @document_title_field_name : String? = nil,
          @exclude_attachment_file_patterns : Array(String)? = nil,
          @field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @filter_query : String? = nil,
          @include_attachment_file_patterns : Array(String)? = nil
        )
        end
      end

      # Provides the configuration information for crawling service catalog items in the ServiceNow site

      struct ServiceNowServiceCatalogConfiguration
        include JSON::Serializable

        # The name of the ServiceNow field that is mapped to the index document contents field in the Amazon
        # Kendra index.

        @[JSON::Field(key: "DocumentDataFieldName")]
        getter document_data_field_name : String

        # TRUE to index attachments to service catalog items.

        @[JSON::Field(key: "CrawlAttachments")]
        getter crawl_attachments : Bool?

        # The name of the ServiceNow field that is mapped to the index document title field.

        @[JSON::Field(key: "DocumentTitleFieldName")]
        getter document_title_field_name : String?

        # A list of regular expression patterns to exclude certain attachments of catalogs in your ServiceNow.
        # Item that match the patterns are excluded from the index. Items that don't match the patterns are
        # included in the index. If an item matches both an inclusion and exclusion pattern, the exclusion
        # pattern takes precedence and the item isn't included in the index. The regex is applied to the file
        # name of the attachment.

        @[JSON::Field(key: "ExcludeAttachmentFilePatterns")]
        getter exclude_attachment_file_patterns : Array(String)?

        # Maps attributes or field names of catalogs to Amazon Kendra index field names. To create custom
        # fields, use the UpdateIndex API before you map to ServiceNow fields. For more information, see
        # Mapping data source fields . The ServiceNow data source field names must exist in your ServiceNow
        # custom metadata.

        @[JSON::Field(key: "FieldMappings")]
        getter field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # A list of regular expression patterns to include certain attachments of catalogs in your ServiceNow.
        # Item that match the patterns are included in the index. Items that don't match the patterns are
        # excluded from the index. If an item matches both an inclusion and exclusion pattern, the exclusion
        # pattern takes precedence and the item isn't included in the index. The regex is applied to the file
        # name of the attachment.

        @[JSON::Field(key: "IncludeAttachmentFilePatterns")]
        getter include_attachment_file_patterns : Array(String)?

        def initialize(
          @document_data_field_name : String,
          @crawl_attachments : Bool? = nil,
          @document_title_field_name : String? = nil,
          @exclude_attachment_file_patterns : Array(String)? = nil,
          @field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @include_attachment_file_patterns : Array(String)? = nil
        )
        end
      end

      # You have exceeded the set limits for your Amazon Kendra service. Please see Quotas for more
      # information, or contact Support to inquire about an increase of limits.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides the configuration information to connect to Microsoft SharePoint as your data source.

      struct SharePointConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Secrets Manager secret that contains the user name and password
        # required to connect to the SharePoint instance. For more information, see Microsoft SharePoint .

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String

        # The version of Microsoft SharePoint that you use.

        @[JSON::Field(key: "SharePointVersion")]
        getter share_point_version : String

        # The Microsoft SharePoint site URLs for the documents you want to index.

        @[JSON::Field(key: "Urls")]
        getter urls : Array(String)

        # Whether you want to connect to SharePoint Online using basic authentication of user name and
        # password, or OAuth authentication of user name, password, client ID, and client secret, or AD
        # App-only authentication of client secret.

        @[JSON::Field(key: "AuthenticationType")]
        getter authentication_type : String?

        # TRUE to index document attachments.

        @[JSON::Field(key: "CrawlAttachments")]
        getter crawl_attachments : Bool?

        # TRUE to disable local groups information.

        @[JSON::Field(key: "DisableLocalGroups")]
        getter disable_local_groups : Bool?

        # The Microsoft SharePoint attribute field that contains the title of the document.

        @[JSON::Field(key: "DocumentTitleFieldName")]
        getter document_title_field_name : String?

        # A list of regular expression patterns to exclude certain documents in your SharePoint. Documents
        # that match the patterns are excluded from the index. Documents that don't match the patterns are
        # included in the index. If a document matches both an inclusion and exclusion pattern, the exclusion
        # pattern takes precedence and the document isn't included in the index. The regex applies to the
        # display URL of the SharePoint document.

        @[JSON::Field(key: "ExclusionPatterns")]
        getter exclusion_patterns : Array(String)?

        # A list of DataSourceToIndexFieldMapping objects that map SharePoint data source attributes or field
        # names to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before
        # you map to SharePoint fields. For more information, see Mapping data source fields . The SharePoint
        # data source field names must exist in your SharePoint custom metadata.

        @[JSON::Field(key: "FieldMappings")]
        getter field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # A list of regular expression patterns to include certain documents in your SharePoint. Documents
        # that match the patterns are included in the index. Documents that don't match the patterns are
        # excluded from the index. If a document matches both an inclusion and exclusion pattern, the
        # exclusion pattern takes precedence and the document isn't included in the index. The regex applies
        # to the display URL of the SharePoint document.

        @[JSON::Field(key: "InclusionPatterns")]
        getter inclusion_patterns : Array(String)?

        # Configuration information to connect to your Microsoft SharePoint site URLs via instance via a web
        # proxy. You can use this option for SharePoint Server. You must provide the website host name and
        # port number. For example, the host name of https://a.example.com/page1.html is "a.example.com" and
        # the port is 443, the standard port for HTTPS. Web proxy credentials are optional and you can use
        # them to connect to a web proxy server that requires basic authentication of user name and password.
        # To store web proxy credentials, you use a secret in Secrets Manager. It is recommended that you
        # follow best security practices when configuring your web proxy. This includes setting up throttling,
        # setting up logging and monitoring, and applying security patches on a regular basis. If you use your
        # web proxy with multiple data sources, sync jobs that occur at the same time could strain the load on
        # your proxy. It is recommended you prepare your proxy beforehand for any security and load
        # requirements.

        @[JSON::Field(key: "ProxyConfiguration")]
        getter proxy_configuration : Types::ProxyConfiguration?

        # The path to the SSL certificate stored in an Amazon S3 bucket. You use this to connect to SharePoint
        # Server if you require a secure SSL connection. You can generate a self-signed X509 certificate on
        # any computer using OpenSSL. For an example of using OpenSSL to create an X509 certificate, see
        # Create and sign an X509 certificate .

        @[JSON::Field(key: "SslCertificateS3Path")]
        getter ssl_certificate_s3_path : Types::S3Path?

        # TRUE to use the SharePoint change log to determine which documents require updating in the index.
        # Depending on the change log's size, it may take longer for Amazon Kendra to use the change log than
        # to scan all of your documents in SharePoint.

        @[JSON::Field(key: "UseChangeLog")]
        getter use_change_log : Bool?

        # Configuration information for an Amazon Virtual Private Cloud to connect to your Microsoft
        # SharePoint. For more information, see Configuring a VPC .

        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::DataSourceVpcConfiguration?

        def initialize(
          @secret_arn : String,
          @share_point_version : String,
          @urls : Array(String),
          @authentication_type : String? = nil,
          @crawl_attachments : Bool? = nil,
          @disable_local_groups : Bool? = nil,
          @document_title_field_name : String? = nil,
          @exclusion_patterns : Array(String)? = nil,
          @field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @inclusion_patterns : Array(String)? = nil,
          @proxy_configuration : Types::ProxyConfiguration? = nil,
          @ssl_certificate_s3_path : Types::S3Path? = nil,
          @use_change_log : Bool? = nil,
          @vpc_configuration : Types::DataSourceVpcConfiguration? = nil
        )
        end
      end

      # Provides the configuration information for the sitemap URLs to crawl. When selecting websites to
      # index, you must adhere to the Amazon Acceptable Use Policy and all other Amazon terms. Remember that
      # you must only use Amazon Kendra Web Crawler to index your own web pages, or web pages that you have
      # authorization to index.

      struct SiteMapsConfiguration
        include JSON::Serializable

        # The list of sitemap URLs of the websites you want to crawl. The list can include a maximum of three
        # sitemap URLs.

        @[JSON::Field(key: "SiteMaps")]
        getter site_maps : Array(String)

        def initialize(
          @site_maps : Array(String)
        )
        end
      end

      # Provides the configuration information to connect to Slack as your data source. Amazon Kendra now
      # supports an upgraded Slack connector. You must now use the TemplateConfiguration object instead of
      # the SlackConfiguration object to configure your connector. Connectors configured using the older
      # console and API architecture will continue to function as configured. However, you won’t be able to
      # edit or update them. If you want to edit or update your connector configuration, you must create a
      # new connector. We recommended migrating your connector workflow to the upgraded version. Support for
      # connectors configured using the older architecture is scheduled to end by June 2024.

      struct SlackConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of an Secrets Manager secret that contains the key-value pairs
        # required to connect to your Slack workspace team. The secret must contain a JSON structure with the
        # following keys: slackToken—The user or bot token created in Slack. For more information on creating
        # a token in Slack, see Authentication for a Slack data source .

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String

        # The date to start crawling your data from your Slack workspace team. The date must follow this
        # format: yyyy-mm-dd .

        @[JSON::Field(key: "SinceCrawlDate")]
        getter since_crawl_date : String

        # Specify whether to index public channels, private channels, group messages, and direct messages. You
        # can specify one or more of these options.

        @[JSON::Field(key: "SlackEntityList")]
        getter slack_entity_list : Array(String)

        # The identifier of the team in the Slack workspace. For example, T0123456789 . You can find your team
        # ID in the URL of the main page of your Slack workspace. When you log in to Slack via a browser, you
        # are directed to the URL of the main page. For example, https://app.slack.com/client/ T0123456789
        # /... .

        @[JSON::Field(key: "TeamId")]
        getter team_id : String

        # TRUE to index bot messages from your Slack workspace team.

        @[JSON::Field(key: "CrawlBotMessage")]
        getter crawl_bot_message : Bool?

        # TRUE to exclude archived messages to index from your Slack workspace team.

        @[JSON::Field(key: "ExcludeArchived")]
        getter exclude_archived : Bool?

        # A list of regular expression patterns to exclude certain attached files in your Slack workspace
        # team. Files that match the patterns are excluded from the index. Files that don’t match the patterns
        # are included in the index. If a file matches both an inclusion and exclusion pattern, the exclusion
        # pattern takes precedence and the file isn't included in the index.

        @[JSON::Field(key: "ExclusionPatterns")]
        getter exclusion_patterns : Array(String)?

        # A list of DataSourceToIndexFieldMapping objects that map Slack data source attributes or field names
        # to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API before you map
        # to Slack fields. For more information, see Mapping data source fields . The Slack data source field
        # names must exist in your Slack custom metadata.

        @[JSON::Field(key: "FieldMappings")]
        getter field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # A list of regular expression patterns to include certain attached files in your Slack workspace
        # team. Files that match the patterns are included in the index. Files that don't match the patterns
        # are excluded from the index. If a file matches both an inclusion and exclusion pattern, the
        # exclusion pattern takes precedence and the file isn't included in the index.

        @[JSON::Field(key: "InclusionPatterns")]
        getter inclusion_patterns : Array(String)?

        # The number of hours for change log to look back from when you last synchronized your data. You can
        # look back up to 7 days or 168 hours. Change log updates your index only if new content was added
        # since you last synced your data. Updated or deleted content from before you last synced does not get
        # updated in your index. To capture updated or deleted content before you last synced, set the
        # LookBackPeriod to the number of hours you want change log to look back.

        @[JSON::Field(key: "LookBackPeriod")]
        getter look_back_period : Int32?

        # The list of private channel names from your Slack workspace team. You use this if you want to index
        # specific private channels, not all private channels. You can also use regular expression patterns to
        # filter private channels.

        @[JSON::Field(key: "PrivateChannelFilter")]
        getter private_channel_filter : Array(String)?

        # The list of public channel names to index from your Slack workspace team. You use this if you want
        # to index specific public channels, not all public channels. You can also use regular expression
        # patterns to filter public channels.

        @[JSON::Field(key: "PublicChannelFilter")]
        getter public_channel_filter : Array(String)?

        # TRUE to use the Slack change log to determine which documents require updating in the index.
        # Depending on the Slack change log's size, it may take longer for Amazon Kendra to use the change log
        # than to scan all of your documents in Slack.

        @[JSON::Field(key: "UseChangeLog")]
        getter use_change_log : Bool?

        # Configuration information for an Amazon Virtual Private Cloud to connect to your Slack. For more
        # information, see Configuring a VPC .

        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::DataSourceVpcConfiguration?

        def initialize(
          @secret_arn : String,
          @since_crawl_date : String,
          @slack_entity_list : Array(String),
          @team_id : String,
          @crawl_bot_message : Bool? = nil,
          @exclude_archived : Bool? = nil,
          @exclusion_patterns : Array(String)? = nil,
          @field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @inclusion_patterns : Array(String)? = nil,
          @look_back_period : Int32? = nil,
          @private_channel_filter : Array(String)? = nil,
          @public_channel_filter : Array(String)? = nil,
          @use_change_log : Bool? = nil,
          @vpc_configuration : Types::DataSourceVpcConfiguration? = nil
        )
        end
      end

      # Specifies the document attribute to use to sort the response to a Amazon Kendra query. You can
      # specify a single attribute for sorting. The attribute must have the Sortable flag set to true ,
      # otherwise Amazon Kendra returns an exception. You can sort attributes of the following types. Date
      # value Long value String value You can't sort attributes of the following type. String list value

      struct SortingConfiguration
        include JSON::Serializable

        # The name of the document attribute used to sort the response. You can use any field that has the
        # Sortable flag set to true. You can also sort by any of the following built-in attributes: _category
        # _created_at _last_updated_at _version _view_count

        @[JSON::Field(key: "DocumentAttributeKey")]
        getter document_attribute_key : String

        # The order that the results should be returned in. In case of ties, the relevance assigned to the
        # result by Amazon Kendra is used as the tie-breaker.

        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String

        def initialize(
          @document_attribute_key : String,
          @sort_order : String
        )
        end
      end

      # The document ID and its fields/attributes that are used for a query suggestion, if document fields
      # set to use for query suggestions.

      struct SourceDocument
        include JSON::Serializable

        # The additional fields/attributes to include in the response. You can use additional fields to
        # provide extra information in the response. Additional fields are not used to based suggestions on.

        @[JSON::Field(key: "AdditionalAttributes")]
        getter additional_attributes : Array(Types::DocumentAttribute)?

        # The identifier of the document used for a query suggestion.

        @[JSON::Field(key: "DocumentId")]
        getter document_id : String?

        # The document fields/attributes used for a query suggestion.

        @[JSON::Field(key: "SuggestionAttributes")]
        getter suggestion_attributes : Array(String)?

        def initialize(
          @additional_attributes : Array(Types::DocumentAttribute)? = nil,
          @document_id : String? = nil,
          @suggestion_attributes : Array(String)? = nil
        )
        end
      end

      # A query with suggested spell corrections.

      struct SpellCorrectedQuery
        include JSON::Serializable

        # The corrected misspelled word or words in a query.

        @[JSON::Field(key: "Corrections")]
        getter corrections : Array(Types::Correction)?

        # The query with the suggested spell corrections.

        @[JSON::Field(key: "SuggestedQueryText")]
        getter suggested_query_text : String?

        def initialize(
          @corrections : Array(Types::Correction)? = nil,
          @suggested_query_text : String? = nil
        )
        end
      end

      # Provides the configuration information for suggested query spell corrections. Suggested spell
      # corrections are based on words that appear in your indexed documents and how closely a corrected
      # word matches a misspelled word. This feature is designed with certain defaults or limits. For
      # information on the current limits and how to request more support for some limits, see the Spell
      # Checker documentation .

      struct SpellCorrectionConfiguration
        include JSON::Serializable

        # TRUE to suggest spell corrections for queries.

        @[JSON::Field(key: "IncludeQuerySpellCheckSuggestions")]
        getter include_query_spell_check_suggestions : Bool

        def initialize(
          @include_query_spell_check_suggestions : Bool
        )
        end
      end

      # Provides the configuration information to use a SQL database.

      struct SqlConfiguration
        include JSON::Serializable

        # Determines whether Amazon Kendra encloses SQL identifiers for tables and column names in double
        # quotes (") when making a database query. By default, Amazon Kendra passes SQL identifiers the way
        # that they are entered into the data source configuration. It does not change the case of identifiers
        # or enclose them in quotes. PostgreSQL internally converts uppercase characters to lower case
        # characters in identifiers unless they are quoted. Choosing this option encloses identifiers in
        # quotes so that PostgreSQL does not convert the character's case. For MySQL databases, you must
        # enable the ansi_quotes option when you set this field to DOUBLE_QUOTES .

        @[JSON::Field(key: "QueryIdentifiersEnclosingOption")]
        getter query_identifiers_enclosing_option : String?

        def initialize(
          @query_identifiers_enclosing_option : String? = nil
        )
        end
      end


      struct StartDataSourceSyncJobRequest
        include JSON::Serializable

        # The identifier of the data source connector to synchronize.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index used with the data source connector.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @id : String,
          @index_id : String
        )
        end
      end


      struct StartDataSourceSyncJobResponse
        include JSON::Serializable

        # Identifies a particular synchronization job.

        @[JSON::Field(key: "ExecutionId")]
        getter execution_id : String?

        def initialize(
          @execution_id : String? = nil
        )
        end
      end

      # Provides information about the status of documents submitted for indexing.

      struct Status
        include JSON::Serializable

        # The identifier of the document.

        @[JSON::Field(key: "DocumentId")]
        getter document_id : String?

        # The current status of a document. If the document was submitted for deletion, the status is
        # NOT_FOUND after the document is deleted.

        @[JSON::Field(key: "DocumentStatus")]
        getter document_status : String?

        # Indicates the source of the error.

        @[JSON::Field(key: "FailureCode")]
        getter failure_code : String?

        # Provides detailed information about why the document couldn't be indexed. Use this information to
        # correct the error before you resubmit the document for indexing.

        @[JSON::Field(key: "FailureReason")]
        getter failure_reason : String?

        def initialize(
          @document_id : String? = nil,
          @document_status : String? = nil,
          @failure_code : String? = nil,
          @failure_reason : String? = nil
        )
        end
      end


      struct StopDataSourceSyncJobRequest
        include JSON::Serializable

        # The identifier of the data source connector for which to stop the synchronization jobs.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index used with the data source connector.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        def initialize(
          @id : String,
          @index_id : String
        )
        end
      end


      struct SubmitFeedbackRequest
        include JSON::Serializable

        # The identifier of the index that was queried.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # The identifier of the specific query for which you are submitting feedback. The query ID is returned
        # in the response to the Query API.

        @[JSON::Field(key: "QueryId")]
        getter query_id : String

        # Tells Amazon Kendra that a particular search result link was chosen by the user.

        @[JSON::Field(key: "ClickFeedbackItems")]
        getter click_feedback_items : Array(Types::ClickFeedback)?

        # Provides Amazon Kendra with relevant or not relevant feedback for whether a particular item was
        # relevant to the search.

        @[JSON::Field(key: "RelevanceFeedbackItems")]
        getter relevance_feedback_items : Array(Types::RelevanceFeedback)?

        def initialize(
          @index_id : String,
          @query_id : String,
          @click_feedback_items : Array(Types::ClickFeedback)? = nil,
          @relevance_feedback_items : Array(Types::RelevanceFeedback)? = nil
        )
        end
      end

      # Provides the configuration information for a document field/attribute that you want to base query
      # suggestions on.

      struct SuggestableConfig
        include JSON::Serializable

        # The name of the document field/attribute.

        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String?

        # TRUE means the document field/attribute is suggestible, so the contents within the field can be used
        # for query suggestions.

        @[JSON::Field(key: "Suggestable")]
        getter suggestable : Bool?

        def initialize(
          @attribute_name : String? = nil,
          @suggestable : Bool? = nil
        )
        end
      end

      # A single query suggestion.

      struct Suggestion
        include JSON::Serializable

        # The UUID (universally unique identifier) of a single query suggestion.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The list of document IDs and their fields/attributes that are used for a single query suggestion, if
        # document fields set to use for query suggestions.

        @[JSON::Field(key: "SourceDocuments")]
        getter source_documents : Array(Types::SourceDocument)?

        # The value for the UUID (universally unique identifier) of a single query suggestion. The value is
        # the text string of a suggestion.

        @[JSON::Field(key: "Value")]
        getter value : Types::SuggestionValue?

        def initialize(
          @id : String? = nil,
          @source_documents : Array(Types::SourceDocument)? = nil,
          @value : Types::SuggestionValue? = nil
        )
        end
      end

      # The text highlights for a single query suggestion.

      struct SuggestionHighlight
        include JSON::Serializable

        # The zero-based location in the response string where the highlight starts.

        @[JSON::Field(key: "BeginOffset")]
        getter begin_offset : Int32?

        # The zero-based location in the response string where the highlight ends.

        @[JSON::Field(key: "EndOffset")]
        getter end_offset : Int32?

        def initialize(
          @begin_offset : Int32? = nil,
          @end_offset : Int32? = nil
        )
        end
      end

      # Provides text and information about where to highlight the query suggestion text.

      struct SuggestionTextWithHighlights
        include JSON::Serializable

        # The beginning and end of the query suggestion text that should be highlighted.

        @[JSON::Field(key: "Highlights")]
        getter highlights : Array(Types::SuggestionHighlight)?

        # The query suggestion text to display to the user.

        @[JSON::Field(key: "Text")]
        getter text : String?

        def initialize(
          @highlights : Array(Types::SuggestionHighlight)? = nil,
          @text : String? = nil
        )
        end
      end

      # The SuggestionTextWithHighlights structure information.

      struct SuggestionValue
        include JSON::Serializable

        # The SuggestionTextWithHighlights structure that contains the query suggestion text and highlights.

        @[JSON::Field(key: "Text")]
        getter text : Types::SuggestionTextWithHighlights?

        def initialize(
          @text : Types::SuggestionTextWithHighlights? = nil
        )
        end
      end

      # Provides information about a table cell in a table excerpt.

      struct TableCell
        include JSON::Serializable

        # TRUE means that the table cell should be treated as a header.

        @[JSON::Field(key: "Header")]
        getter header : Bool?

        # TRUE means that the table cell has a high enough confidence and is relevant to the query, so the
        # value or content should be highlighted.

        @[JSON::Field(key: "Highlighted")]
        getter highlighted : Bool?

        # TRUE if the response of the table cell is the top answer. This is the cell value or content with the
        # highest confidence score or is the most relevant to the query.

        @[JSON::Field(key: "TopAnswer")]
        getter top_answer : Bool?

        # The actual value or content within a table cell. A table cell could contain a date value of a year,
        # or a string value of text, for example.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @header : Bool? = nil,
          @highlighted : Bool? = nil,
          @top_answer : Bool? = nil,
          @value : String? = nil
        )
        end
      end

      # An excerpt from a table within a document. The table excerpt displays up to five columns and three
      # rows, depending on how many table cells are relevant to the query and how many columns are available
      # in the original table. The top most relevant cell is displayed in the table excerpt, along with the
      # next most relevant cells.

      struct TableExcerpt
        include JSON::Serializable

        # A list of rows in the table excerpt.

        @[JSON::Field(key: "Rows")]
        getter rows : Array(Types::TableRow)?

        # A count of the number of rows in the original table within the document.

        @[JSON::Field(key: "TotalNumberOfRows")]
        getter total_number_of_rows : Int32?

        def initialize(
          @rows : Array(Types::TableRow)? = nil,
          @total_number_of_rows : Int32? = nil
        )
        end
      end

      # Information about a row in a table excerpt.

      struct TableRow
        include JSON::Serializable

        # A list of table cells in a row.

        @[JSON::Field(key: "Cells")]
        getter cells : Array(Types::TableCell)?

        def initialize(
          @cells : Array(Types::TableCell)? = nil
        )
        end
      end

      # A key-value pair that identifies or categorizes an index, FAQ, data source, or other resource. TA
      # tag key and value can consist of Unicode letters, digits, white space, and any of the following
      # symbols: _ . : / = + - @.

      struct Tag
        include JSON::Serializable

        # The key for the tag. Keys are not case sensitive and must be unique for the index, FAQ, data source,
        # or other resource.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value associated with the tag. The value may be an empty string but it can't be null.

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

        # The Amazon Resource Name (ARN) of the index, FAQ, data source, or other resource to add a tag. For
        # example, the ARN of an index is constructed as follows:
        # arn:aws:kendra:your-region:your-account-id:index/index-id For information on how to construct an ARN
        # for all types of Amazon Kendra resources, see Resource types .

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of tag keys to add to the index, FAQ, data source, or other resource. If a tag already
        # exists, the existing value is replaced with the new value.

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

      # The template schema used for the data source, where templates schemas are supported. See Data source
      # template schemas .

      struct Template
        include JSON::Serializable

        def initialize
        end
      end

      # Provides a template for the configuration information to connect to your data source.

      struct TemplateConfiguration
        include JSON::Serializable

        # The template schema used for the data source, where templates schemas are supported. See Data source
        # template schemas .

        @[JSON::Field(key: "Template")]
        getter template : Types::Template?

        def initialize(
          @template : Types::Template? = nil
        )
        end
      end

      # Provides information about text documents indexed in an index.

      struct TextDocumentStatistics
        include JSON::Serializable

        # The total size, in bytes, of the indexed documents.

        @[JSON::Field(key: "IndexedTextBytes")]
        getter indexed_text_bytes : Int64

        # The number of text documents indexed.

        @[JSON::Field(key: "IndexedTextDocumentsCount")]
        getter indexed_text_documents_count : Int32

        def initialize(
          @indexed_text_bytes : Int64,
          @indexed_text_documents_count : Int32
        )
        end
      end

      # Provides text and information about where to highlight the text.

      struct TextWithHighlights
        include JSON::Serializable

        # The beginning and end of the text that should be highlighted.

        @[JSON::Field(key: "Highlights")]
        getter highlights : Array(Types::Highlight)?

        # The text to display to the user.

        @[JSON::Field(key: "Text")]
        getter text : String?

        def initialize(
          @highlights : Array(Types::Highlight)? = nil,
          @text : String? = nil
        )
        end
      end

      # An array of summary information for a thesaurus or multiple thesauri.

      struct ThesaurusSummary
        include JSON::Serializable

        # The Unix timestamp when the thesaurus was created.

        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The identifier of the thesaurus.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the thesaurus.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The status of the thesaurus.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Unix timestamp when the thesaurus was last updated.

        @[JSON::Field(key: "UpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The request was denied due to request throttling. Please reduce the number of requests and try
      # again.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides a range of time.

      struct TimeRange
        include JSON::Serializable

        # The Unix timestamp for the end of the time range.

        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The Unix timestamp for the beginning of the time range.

        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @end_time : Time? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the index, FAQ, data source, or other resource to remove a tag.
        # For example, the ARN of an index is constructed as follows:
        # arn:aws:kendra:your-region:your-account-id:index/index-id For information on how to construct an ARN
        # for all types of Amazon Kendra resources, see Resource types .

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of tag keys to remove from the index, FAQ, data source, or other resource. If a tag key
        # doesn't exist for the resource, it is ignored.

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


      struct UpdateAccessControlConfigurationRequest
        include JSON::Serializable

        # The identifier of the access control configuration you want to update.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for an access control configuration.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # Information you want to update on principals (users and/or groups) and which documents they should
        # have access to. This is useful for user context filtering, where search results are filtered based
        # on the user or their group access to documents.

        @[JSON::Field(key: "AccessControlList")]
        getter access_control_list : Array(Types::Principal)?

        # A new description for the access control configuration.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The updated list of principal lists that define the hierarchy for which documents users should have
        # access to.

        @[JSON::Field(key: "HierarchicalAccessControlList")]
        getter hierarchical_access_control_list : Array(Types::HierarchicalPrincipal)?

        # A new name for the access control configuration.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @id : String,
          @index_id : String,
          @access_control_list : Array(Types::Principal)? = nil,
          @description : String? = nil,
          @hierarchical_access_control_list : Array(Types::HierarchicalPrincipal)? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateAccessControlConfigurationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateDataSourceRequest
        include JSON::Serializable

        # The identifier of the data source connector you want to update.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index used with the data source connector.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # Configuration information you want to update for the data source connector.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::DataSourceConfiguration?

        # Configuration information you want to update for altering document metadata and content during the
        # document ingestion process. For more information on how to create, modify and delete document
        # metadata, or make other content alterations when you ingest documents into Amazon Kendra, see
        # Customizing document metadata during the ingestion process .

        @[JSON::Field(key: "CustomDocumentEnrichmentConfiguration")]
        getter custom_document_enrichment_configuration : Types::CustomDocumentEnrichmentConfiguration?

        # A new description for the data source connector.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The code for a language you want to update for the data source connector. This allows you to support
        # a language for all documents when updating the data source. English is supported by default. For
        # more information on supported languages, including their codes, see Adding documents in languages
        # other than English .

        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # A new name for the data source connector.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of an IAM role with permission to access the data source and required
        # resources. For more information, see IAM roles for Amazon Kendra .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The sync schedule you want to update for the data source connector.

        @[JSON::Field(key: "Schedule")]
        getter schedule : String?

        # Configuration information for an Amazon Virtual Private Cloud to connect to your data source. For
        # more information, see Configuring a VPC .

        @[JSON::Field(key: "VpcConfiguration")]
        getter vpc_configuration : Types::DataSourceVpcConfiguration?

        def initialize(
          @id : String,
          @index_id : String,
          @configuration : Types::DataSourceConfiguration? = nil,
          @custom_document_enrichment_configuration : Types::CustomDocumentEnrichmentConfiguration? = nil,
          @description : String? = nil,
          @language_code : String? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @schedule : String? = nil,
          @vpc_configuration : Types::DataSourceVpcConfiguration? = nil
        )
        end
      end


      struct UpdateExperienceRequest
        include JSON::Serializable

        # The identifier of your Amazon Kendra experience you want to update.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for your Amazon Kendra experience.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # Configuration information you want to update for your Amazon Kendra experience.

        @[JSON::Field(key: "Configuration")]
        getter configuration : Types::ExperienceConfiguration?

        # A new description for your Amazon Kendra experience.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A new name for your Amazon Kendra experience.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of an IAM role with permission to access the Query API,
        # QuerySuggestions API, SubmitFeedback API, and IAM Identity Center that stores your users and groups
        # information. For more information, see IAM roles for Amazon Kendra .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @id : String,
          @index_id : String,
          @configuration : Types::ExperienceConfiguration? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct UpdateFeaturedResultsSetRequest
        include JSON::Serializable

        # The identifier of the set of featured results that you want to update.

        @[JSON::Field(key: "FeaturedResultsSetId")]
        getter featured_results_set_id : String

        # The identifier of the index used for featuring results.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # A new description for the set of featured results.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of document IDs for the documents you want to feature at the top of the search results page.
        # For more information on the list of featured documents, see FeaturedResultsSet .

        @[JSON::Field(key: "FeaturedDocuments")]
        getter featured_documents : Array(Types::FeaturedDocument)?

        # A new name for the set of featured results.

        @[JSON::Field(key: "FeaturedResultsSetName")]
        getter featured_results_set_name : String?

        # A list of queries for featuring results. For more information on the list of queries, see
        # FeaturedResultsSet .

        @[JSON::Field(key: "QueryTexts")]
        getter query_texts : Array(String)?

        # You can set the status to ACTIVE or INACTIVE . When the value is ACTIVE , featured results are ready
        # for use. You can still configure your settings before setting the status to ACTIVE . The queries you
        # specify for featured results must be unique per featured results set for each index, whether the
        # status is ACTIVE or INACTIVE .

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @featured_results_set_id : String,
          @index_id : String,
          @description : String? = nil,
          @featured_documents : Array(Types::FeaturedDocument)? = nil,
          @featured_results_set_name : String? = nil,
          @query_texts : Array(String)? = nil,
          @status : String? = nil
        )
        end
      end


      struct UpdateFeaturedResultsSetResponse
        include JSON::Serializable

        # Information on the set of featured results. This includes the identifier of the featured results
        # set, whether the featured results set is active or inactive, when the featured results set was last
        # updated, and more.

        @[JSON::Field(key: "FeaturedResultsSet")]
        getter featured_results_set : Types::FeaturedResultsSet?

        def initialize(
          @featured_results_set : Types::FeaturedResultsSet? = nil
        )
        end
      end


      struct UpdateIndexRequest
        include JSON::Serializable

        # The identifier of the index you want to update.

        @[JSON::Field(key: "Id")]
        getter id : String

        # Sets the number of additional document storage and query capacity units that should be used by the
        # index. You can change the capacity of the index up to 5 times per day, or make 5 API calls. If you
        # are using extra storage units, you can't reduce the storage capacity below what is required to meet
        # the storage needs for your index.

        @[JSON::Field(key: "CapacityUnits")]
        getter capacity_units : Types::CapacityUnitsConfiguration?

        # A new description for the index.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The document metadata configuration you want to update for the index. Document metadata are fields
        # or attributes associated with your documents. For example, the company department name associated
        # with each document.

        @[JSON::Field(key: "DocumentMetadataConfigurationUpdates")]
        getter document_metadata_configuration_updates : Array(Types::DocumentMetadataConfiguration)?

        # A new name for the index.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # An Identity and Access Management (IAM) role that gives Amazon Kendra permission to access Amazon
        # CloudWatch logs and metrics.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The user context policy. If you're using an Amazon Kendra Gen AI Enterprise Edition index, you can
        # only use ATTRIBUTE_FILTER to filter search results by user context. If you're using an Amazon Kendra
        # Gen AI Enterprise Edition index and you try to use USER_TOKEN to configure user context policy,
        # Amazon Kendra returns a ValidationException error.

        @[JSON::Field(key: "UserContextPolicy")]
        getter user_context_policy : String?

        # Gets users and groups from IAM Identity Center identity source. To configure this, see
        # UserGroupResolutionConfiguration . This is useful for user context filtering, where search results
        # are filtered based on the user or their group access to documents. If you're using an Amazon Kendra
        # Gen AI Enterprise Edition index, UserGroupResolutionConfiguration isn't supported.

        @[JSON::Field(key: "UserGroupResolutionConfiguration")]
        getter user_group_resolution_configuration : Types::UserGroupResolutionConfiguration?

        # The user token configuration. If you're using an Amazon Kendra Gen AI Enterprise Edition index and
        # you try to use UserTokenConfigurations to configure user context policy, Amazon Kendra returns a
        # ValidationException error.

        @[JSON::Field(key: "UserTokenConfigurations")]
        getter user_token_configurations : Array(Types::UserTokenConfiguration)?

        def initialize(
          @id : String,
          @capacity_units : Types::CapacityUnitsConfiguration? = nil,
          @description : String? = nil,
          @document_metadata_configuration_updates : Array(Types::DocumentMetadataConfiguration)? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @user_context_policy : String? = nil,
          @user_group_resolution_configuration : Types::UserGroupResolutionConfiguration? = nil,
          @user_token_configurations : Array(Types::UserTokenConfiguration)? = nil
        )
        end
      end


      struct UpdateQuerySuggestionsBlockListRequest
        include JSON::Serializable

        # The identifier of the block list you want to update.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for the block list.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # A new description for the block list.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A new name for the block list.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The IAM (Identity and Access Management) role used to access the block list text file in S3.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The S3 path where your block list text file sits in S3. If you update your block list and provide
        # the same path to the block list text file in S3, then Amazon Kendra reloads the file to refresh the
        # block list. Amazon Kendra does not automatically refresh your block list. You need to call the
        # UpdateQuerySuggestionsBlockList API to refresh you block list. If you update your block list, then
        # Amazon Kendra asynchronously refreshes all query suggestions with the latest content in the S3 file.
        # This means changes might not take effect immediately.

        @[JSON::Field(key: "SourceS3Path")]
        getter source_s3_path : Types::S3Path?

        def initialize(
          @id : String,
          @index_id : String,
          @description : String? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @source_s3_path : Types::S3Path? = nil
        )
        end
      end


      struct UpdateQuerySuggestionsConfigRequest
        include JSON::Serializable

        # The identifier of the index with query suggestions you want to update.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # Configuration information for the document fields/attributes that you want to base query suggestions
        # on.

        @[JSON::Field(key: "AttributeSuggestionsConfig")]
        getter attribute_suggestions_config : Types::AttributeSuggestionsUpdateConfig?

        # TRUE to include queries without user information (i.e. all queries, irrespective of the user),
        # otherwise FALSE to only include queries with user information. If you pass user information to
        # Amazon Kendra along with the queries, you can set this flag to FALSE and instruct Amazon Kendra to
        # only consider queries with user information. If you set to FALSE , Amazon Kendra only considers
        # queries searched at least MinimumQueryCount times across MinimumNumberOfQueryingUsers unique users
        # for suggestions. If you set to TRUE , Amazon Kendra ignores all user information and learns from all
        # queries.

        @[JSON::Field(key: "IncludeQueriesWithoutUserInformation")]
        getter include_queries_without_user_information : Bool?

        # The minimum number of unique users who must search a query in order for the query to be eligible to
        # suggest to your users. Increasing this number might decrease the number of suggestions. However,
        # this ensures a query is searched by many users and is truly popular to suggest to users. How you
        # tune this setting depends on your specific needs.

        @[JSON::Field(key: "MinimumNumberOfQueryingUsers")]
        getter minimum_number_of_querying_users : Int32?

        # The the minimum number of times a query must be searched in order to be eligible to suggest to your
        # users. Decreasing this number increases the number of suggestions. However, this affects the quality
        # of suggestions as it sets a low bar for a query to be considered popular to suggest to users. How
        # you tune this setting depends on your specific needs.

        @[JSON::Field(key: "MinimumQueryCount")]
        getter minimum_query_count : Int32?

        # Set the mode to ENABLED or LEARN_ONLY . By default, Amazon Kendra enables query suggestions.
        # LEARN_ONLY mode allows you to turn off query suggestions. You can to update this at any time. In
        # LEARN_ONLY mode, Amazon Kendra continues to learn from new queries to keep suggestions up to date
        # for when you are ready to switch to ENABLED mode again.

        @[JSON::Field(key: "Mode")]
        getter mode : String?

        # How recent your queries are in your query log time window. The time window is the number of days
        # from current day to past days. By default, Amazon Kendra sets this to 180.

        @[JSON::Field(key: "QueryLogLookBackWindowInDays")]
        getter query_log_look_back_window_in_days : Int32?

        def initialize(
          @index_id : String,
          @attribute_suggestions_config : Types::AttributeSuggestionsUpdateConfig? = nil,
          @include_queries_without_user_information : Bool? = nil,
          @minimum_number_of_querying_users : Int32? = nil,
          @minimum_query_count : Int32? = nil,
          @mode : String? = nil,
          @query_log_look_back_window_in_days : Int32? = nil
        )
        end
      end


      struct UpdateThesaurusRequest
        include JSON::Serializable

        # The identifier of the thesaurus you want to update.

        @[JSON::Field(key: "Id")]
        getter id : String

        # The identifier of the index for the thesaurus.

        @[JSON::Field(key: "IndexId")]
        getter index_id : String

        # A new description for the thesaurus.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A new name for the thesaurus.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # An IAM role that gives Amazon Kendra permissions to access thesaurus file specified in SourceS3Path
        # .

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?


        @[JSON::Field(key: "SourceS3Path")]
        getter source_s3_path : Types::S3Path?

        def initialize(
          @id : String,
          @index_id : String,
          @description : String? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @source_s3_path : Types::S3Path? = nil
        )
        end
      end

      # Provides the configuration information of the URLs to crawl. You can only crawl websites that use
      # the secure communication protocol, Hypertext Transfer Protocol Secure (HTTPS). If you receive an
      # error when crawling a website, it could be that the website is blocked from crawling. When selecting
      # websites to index, you must adhere to the Amazon Acceptable Use Policy and all other Amazon terms.
      # Remember that you must only use Amazon Kendra Web Crawler to index your own web pages, or web pages
      # that you have authorization to index.

      struct Urls
        include JSON::Serializable

        # Configuration of the seed or starting point URLs of the websites you want to crawl. You can choose
        # to crawl only the website host names, or the website host names with subdomains, or the website host
        # names with subdomains and other domains that the web pages link to. You can list up to 100 seed
        # URLs.

        @[JSON::Field(key: "SeedUrlConfiguration")]
        getter seed_url_configuration : Types::SeedUrlConfiguration?

        # Configuration of the sitemap URLs of the websites you want to crawl. Only URLs belonging to the same
        # website host names are crawled. You can list up to three sitemap URLs.

        @[JSON::Field(key: "SiteMapsConfiguration")]
        getter site_maps_configuration : Types::SiteMapsConfiguration?

        def initialize(
          @seed_url_configuration : Types::SeedUrlConfiguration? = nil,
          @site_maps_configuration : Types::SiteMapsConfiguration? = nil
        )
        end
      end

      # Provides information about the user context for an Amazon Kendra index. User context filtering is a
      # kind of personalized search with the benefit of controlling access to documents. For example, not
      # all teams that search the company portal for information should access top-secret company documents,
      # nor are these documents relevant to all users. Only specific users or groups of teams given access
      # to top-secret documents should see these documents in their search results. You provide one of the
      # following: User token User ID, the groups the user belongs to, and any data sources the groups can
      # access. If you provide both, an exception is thrown. If you're using an Amazon Kendra Gen AI
      # Enterprise Edition index, you can use UserId , Groups , and DataSourceGroups to filter content. If
      # you set the UserId to a particular user ID, it also includes all public documents. Amazon Kendra Gen
      # AI Enterprise Edition indices don't support token based document filtering. If you're using an
      # Amazon Kendra Gen AI Enterprise Edition index, Amazon Kendra returns a ValidationException error if
      # the Token field has a non-null value.

      struct UserContext
        include JSON::Serializable

        # The list of data source groups you want to filter search results based on groups' access to
        # documents in that data source.

        @[JSON::Field(key: "DataSourceGroups")]
        getter data_source_groups : Array(Types::DataSourceGroup)?

        # The list of groups you want to filter search results based on the groups' access to documents.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(String)?

        # The user context token for filtering search results for a user. It must be a JWT or a JSON token.

        @[JSON::Field(key: "Token")]
        getter token : String?

        # The identifier of the user you want to filter search results based on their access to documents.

        @[JSON::Field(key: "UserId")]
        getter user_id : String?

        def initialize(
          @data_source_groups : Array(Types::DataSourceGroup)? = nil,
          @groups : Array(String)? = nil,
          @token : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      # Provides the configuration information to get users and groups from an IAM Identity Center identity
      # source. This is useful for user context filtering, where search results are filtered based on the
      # user or their group access to documents. You can also use the PutPrincipalMapping API to map users
      # to their groups so that you only need to provide the user ID when you issue the query. To set up an
      # IAM Identity Center identity source in the console to use with Amazon Kendra, see Getting started
      # with an IAM Identity Center identity source . You must also grant the required permissions to use
      # IAM Identity Center with Amazon Kendra. For more information, see IAM roles for IAM Identity Center
      # . Amazon Kendra currently does not support using UserGroupResolutionConfiguration with an Amazon Web
      # Services organization member account for your IAM Identity Center identify source. You must create
      # your index in the management account for the organization in order to use
      # UserGroupResolutionConfiguration . If you're using an Amazon Kendra Gen AI Enterprise Edition index,
      # UserGroupResolutionConfiguration isn't supported.

      struct UserGroupResolutionConfiguration
        include JSON::Serializable

        # The identity store provider (mode) you want to use to get users and groups. IAM Identity Center is
        # currently the only available mode. Your users and groups must exist in an IAM Identity Center
        # identity source in order to use this mode.

        @[JSON::Field(key: "UserGroupResolutionMode")]
        getter user_group_resolution_mode : String

        def initialize(
          @user_group_resolution_mode : String
        )
        end
      end

      # Provides the configuration information for the identifiers of your users.

      struct UserIdentityConfiguration
        include JSON::Serializable

        # The IAM Identity Center field name that contains the identifiers of your users, such as their
        # emails. This is used for user context filtering and for granting access to your Amazon Kendra
        # experience. You must set up IAM Identity Center with Amazon Kendra. You must include your users and
        # groups in your Access Control List when you ingest documents into your index. For more information,
        # see Getting started with an IAM Identity Center identity source .

        @[JSON::Field(key: "IdentityAttributeName")]
        getter identity_attribute_name : String?

        def initialize(
          @identity_attribute_name : String? = nil
        )
        end
      end

      # Provides the configuration information for a token. If you're using an Amazon Kendra Gen AI
      # Enterprise Edition index and you try to use UserTokenConfigurations to configure user context
      # policy, Amazon Kendra returns a ValidationException error.

      struct UserTokenConfiguration
        include JSON::Serializable

        # Information about the JSON token type configuration.

        @[JSON::Field(key: "JsonTokenTypeConfiguration")]
        getter json_token_type_configuration : Types::JsonTokenTypeConfiguration?

        # Information about the JWT token type configuration.

        @[JSON::Field(key: "JwtTokenTypeConfiguration")]
        getter jwt_token_type_configuration : Types::JwtTokenTypeConfiguration?

        def initialize(
          @json_token_type_configuration : Types::JsonTokenTypeConfiguration? = nil,
          @jwt_token_type_configuration : Types::JwtTokenTypeConfiguration? = nil
        )
        end
      end

      # The input fails to satisfy the constraints set by the Amazon Kendra service. Please provide the
      # correct input and try again.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The warning code and message that explains a problem with a query.

      struct Warning
        include JSON::Serializable

        # The code used to show the type of warning for the query.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # The message that explains the problem with the query.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Provides the configuration information required for Amazon Kendra Web Crawler.

      struct WebCrawlerConfiguration
        include JSON::Serializable

        # Specifies the seed or starting point URLs of the websites or the sitemap URLs of the websites you
        # want to crawl. You can include website subdomains. You can list up to 100 seed URLs and up to three
        # sitemap URLs. You can only crawl websites that use the secure communication protocol, Hypertext
        # Transfer Protocol Secure (HTTPS). If you receive an error when crawling a website, it could be that
        # the website is blocked from crawling. When selecting websites to index, you must adhere to the
        # Amazon Acceptable Use Policy and all other Amazon terms. Remember that you must only use Amazon
        # Kendra Web Crawler to index your own web pages, or web pages that you have authorization to index.

        @[JSON::Field(key: "Urls")]
        getter urls : Types::Urls

        # Configuration information required to connect to websites using authentication. You can connect to
        # websites using basic authentication of user name and password. You use a secret in Secrets Manager
        # to store your authentication credentials. You must provide the website host name and port number.
        # For example, the host name of https://a.example.com/page1.html is "a.example.com" and the port is
        # 443, the standard port for HTTPS.

        @[JSON::Field(key: "AuthenticationConfiguration")]
        getter authentication_configuration : Types::AuthenticationConfiguration?

        # The 'depth' or number of levels from the seed level to crawl. For example, the seed URL page is
        # depth 1 and any hyperlinks on this page that are also crawled are depth 2.

        @[JSON::Field(key: "CrawlDepth")]
        getter crawl_depth : Int32?

        # The maximum size (in MB) of a web page or attachment to crawl. Files larger than this size (in MB)
        # are skipped/not crawled. The default maximum size of a web page or attachment is set to 50 MB.

        @[JSON::Field(key: "MaxContentSizePerPageInMegaBytes")]
        getter max_content_size_per_page_in_mega_bytes : Float64?

        # The maximum number of URLs on a web page to include when crawling a website. This number is per web
        # page. As a website’s web pages are crawled, any URLs the web pages link to are also crawled. URLs on
        # a web page are crawled in order of appearance. The default maximum links per page is 100.

        @[JSON::Field(key: "MaxLinksPerPage")]
        getter max_links_per_page : Int32?

        # The maximum number of URLs crawled per website host per minute. A minimum of one URL is required.
        # The default maximum number of URLs crawled per website host per minute is 300.

        @[JSON::Field(key: "MaxUrlsPerMinuteCrawlRate")]
        getter max_urls_per_minute_crawl_rate : Int32?

        # Configuration information required to connect to your internal websites via a web proxy. You must
        # provide the website host name and port number. For example, the host name of
        # https://a.example.com/page1.html is "a.example.com" and the port is 443, the standard port for
        # HTTPS. Web proxy credentials are optional and you can use them to connect to a web proxy server that
        # requires basic authentication. To store web proxy credentials, you use a secret in Secrets Manager .

        @[JSON::Field(key: "ProxyConfiguration")]
        getter proxy_configuration : Types::ProxyConfiguration?

        # A list of regular expression patterns to exclude certain URLs to crawl. URLs that match the patterns
        # are excluded from the index. URLs that don't match the patterns are included in the index. If a URL
        # matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the URL
        # file isn't included in the index.

        @[JSON::Field(key: "UrlExclusionPatterns")]
        getter url_exclusion_patterns : Array(String)?

        # A list of regular expression patterns to include certain URLs to crawl. URLs that match the patterns
        # are included in the index. URLs that don't match the patterns are excluded from the index. If a URL
        # matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the URL
        # file isn't included in the index.

        @[JSON::Field(key: "UrlInclusionPatterns")]
        getter url_inclusion_patterns : Array(String)?

        def initialize(
          @urls : Types::Urls,
          @authentication_configuration : Types::AuthenticationConfiguration? = nil,
          @crawl_depth : Int32? = nil,
          @max_content_size_per_page_in_mega_bytes : Float64? = nil,
          @max_links_per_page : Int32? = nil,
          @max_urls_per_minute_crawl_rate : Int32? = nil,
          @proxy_configuration : Types::ProxyConfiguration? = nil,
          @url_exclusion_patterns : Array(String)? = nil,
          @url_inclusion_patterns : Array(String)? = nil
        )
        end
      end

      # Provides the configuration information to connect to Amazon WorkDocs as your data source. Amazon
      # WorkDocs connector is available in Oregon, North Virginia, Sydney, Singapore and Ireland regions.

      struct WorkDocsConfiguration
        include JSON::Serializable

        # The identifier of the directory corresponding to your Amazon WorkDocs site repository. You can find
        # the organization ID in the Directory Service by going to Active Directory , then Directories . Your
        # Amazon WorkDocs site directory has an ID, which is the organization ID. You can also set up a new
        # Amazon WorkDocs directory in the Directory Service console and enable a Amazon WorkDocs site for the
        # directory in the Amazon WorkDocs console.

        @[JSON::Field(key: "OrganizationId")]
        getter organization_id : String

        # TRUE to include comments on documents in your index. Including comments in your index means each
        # comment is a document that can be searched on. The default is set to FALSE .

        @[JSON::Field(key: "CrawlComments")]
        getter crawl_comments : Bool?

        # A list of regular expression patterns to exclude certain files in your Amazon WorkDocs site
        # repository. Files that match the patterns are excluded from the index. Files that don’t match the
        # patterns are included in the index. If a file matches both an inclusion and exclusion pattern, the
        # exclusion pattern takes precedence and the file isn't included in the index.

        @[JSON::Field(key: "ExclusionPatterns")]
        getter exclusion_patterns : Array(String)?

        # A list of DataSourceToIndexFieldMapping objects that map Amazon WorkDocs data source attributes or
        # field names to Amazon Kendra index field names. To create custom fields, use the UpdateIndex API
        # before you map to Amazon WorkDocs fields. For more information, see Mapping data source fields . The
        # Amazon WorkDocs data source field names must exist in your Amazon WorkDocs custom metadata.

        @[JSON::Field(key: "FieldMappings")]
        getter field_mappings : Array(Types::DataSourceToIndexFieldMapping)?

        # A list of regular expression patterns to include certain files in your Amazon WorkDocs site
        # repository. Files that match the patterns are included in the index. Files that don't match the
        # patterns are excluded from the index. If a file matches both an inclusion and exclusion pattern, the
        # exclusion pattern takes precedence and the file isn't included in the index.

        @[JSON::Field(key: "InclusionPatterns")]
        getter inclusion_patterns : Array(String)?

        # TRUE to use the Amazon WorkDocs change log to determine which documents require updating in the
        # index. Depending on the change log's size, it may take longer for Amazon Kendra to use the change
        # log than to scan all of your documents in Amazon WorkDocs.

        @[JSON::Field(key: "UseChangeLog")]
        getter use_change_log : Bool?

        def initialize(
          @organization_id : String,
          @crawl_comments : Bool? = nil,
          @exclusion_patterns : Array(String)? = nil,
          @field_mappings : Array(Types::DataSourceToIndexFieldMapping)? = nil,
          @inclusion_patterns : Array(String)? = nil,
          @use_change_log : Bool? = nil
        )
        end
      end
    end
  end
end
