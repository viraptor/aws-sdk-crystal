require "json"
require "time"

module Aws
  module CloudSearch
    module Types

      # The configured access rules for the domain's document and search endpoints, and the current status
      # of those rules.

      struct AccessPoliciesStatus
        include JSON::Serializable


        @[JSON::Field(key: "Options")]
        getter options : String


        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : String,
          @status : Types::OptionStatus
        )
        end
      end

      # Synonyms, stopwords, and stemming options for an analysis scheme. Includes tokenization dictionary
      # for Japanese.

      struct AnalysisOptions
        include JSON::Serializable

        # The level of algorithmic stemming to perform: none , minimal , light , or full . The available
        # levels vary depending on the language. For more information, see Language Specific Text Processing
        # Settings in the Amazon CloudSearch Developer Guide

        @[JSON::Field(key: "AlgorithmicStemming")]
        getter algorithmic_stemming : String?

        # A JSON array that contains a collection of terms, tokens, readings and part of speech for Japanese
        # Tokenizaiton. The Japanese tokenization dictionary enables you to override the default tokenization
        # for selected terms. This is only valid for Japanese language fields.

        @[JSON::Field(key: "JapaneseTokenizationDictionary")]
        getter japanese_tokenization_dictionary : String?

        # A JSON object that contains a collection of string:value pairs that each map a term to its stem. For
        # example, {"term1": "stem1", "term2": "stem2", "term3": "stem3"} . The stemming dictionary is applied
        # in addition to any algorithmic stemming. This enables you to override the results of the algorithmic
        # stemming to correct specific cases of overstemming or understemming. The maximum size of a stemming
        # dictionary is 500 KB.

        @[JSON::Field(key: "StemmingDictionary")]
        getter stemming_dictionary : String?

        # A JSON array of terms to ignore during indexing and searching. For example, ["a", "an", "the", "of"]
        # . The stopwords dictionary must explicitly list each word you want to ignore. Wildcards and regular
        # expressions are not supported.

        @[JSON::Field(key: "Stopwords")]
        getter stopwords : String?

        # A JSON object that defines synonym groups and aliases. A synonym group is an array of arrays, where
        # each sub-array is a group of terms where each term in the group is considered a synonym of every
        # other term in the group. The aliases value is an object that contains a collection of string:value
        # pairs where the string specifies a term and the array of values specifies each of the aliases for
        # that term. An alias is considered a synonym of the specified term, but the term is not considered a
        # synonym of the alias. For more information about specifying synonyms, see Synonyms in the Amazon
        # CloudSearch Developer Guide .

        @[JSON::Field(key: "Synonyms")]
        getter synonyms : String?

        def initialize(
          @algorithmic_stemming : String? = nil,
          @japanese_tokenization_dictionary : String? = nil,
          @stemming_dictionary : String? = nil,
          @stopwords : String? = nil,
          @synonyms : String? = nil
        )
        end
      end

      # Configuration information for an analysis scheme. Each analysis scheme has a unique name and
      # specifies the language of the text to be processed. The following options can be configured for an
      # analysis scheme: Synonyms , Stopwords , StemmingDictionary , JapaneseTokenizationDictionary and
      # AlgorithmicStemming .

      struct AnalysisScheme
        include JSON::Serializable


        @[JSON::Field(key: "AnalysisSchemeLanguage")]
        getter analysis_scheme_language : String


        @[JSON::Field(key: "AnalysisSchemeName")]
        getter analysis_scheme_name : String


        @[JSON::Field(key: "AnalysisOptions")]
        getter analysis_options : Types::AnalysisOptions?

        def initialize(
          @analysis_scheme_language : String,
          @analysis_scheme_name : String,
          @analysis_options : Types::AnalysisOptions? = nil
        )
        end
      end

      # The status and configuration of an AnalysisScheme .

      struct AnalysisSchemeStatus
        include JSON::Serializable


        @[JSON::Field(key: "Options")]
        getter options : Types::AnalysisScheme


        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::AnalysisScheme,
          @status : Types::OptionStatus
        )
        end
      end

      # The status and configuration of the domain's availability options.

      struct AvailabilityOptionsStatus
        include JSON::Serializable

        # The availability options configured for the domain.

        @[JSON::Field(key: "Options")]
        getter options : Bool


        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Bool,
          @status : Types::OptionStatus
        )
        end
      end

      # An error occurred while processing the request.

      struct BaseException
        include JSON::Serializable


        @[JSON::Field(key: "Code")]
        getter code : String?


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Container for the parameters to the BuildSuggester operation. Specifies the name of the domain you
      # want to update.

      struct BuildSuggestersRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The result of a BuildSuggester request. Contains a list of the fields used for suggestions.

      struct BuildSuggestersResponse
        include JSON::Serializable


        @[JSON::Field(key: "FieldNames")]
        getter field_names : Array(String)?

        def initialize(
          @field_names : Array(String)? = nil
        )
        end
      end

      # Container for the parameters to the CreateDomain operation. Specifies a name for the new search
      # domain.

      struct CreateDomainRequest
        include JSON::Serializable

        # A name for the domain you are creating. Allowed characters are a-z (lower-case letters), 0-9, and
        # hyphen (-). Domain names must start with a letter or number and be at least 3 and no more than 28
        # characters long.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The result of a CreateDomainRequest . Contains the status of a newly created domain.

      struct CreateDomainResponse
        include JSON::Serializable


        @[JSON::Field(key: "DomainStatus")]
        getter domain_status : Types::DomainStatus?

        def initialize(
          @domain_status : Types::DomainStatus? = nil
        )
        end
      end

      # Options for a field that contains an array of dates. Present if IndexFieldType specifies the field
      # is of type date-array . All options are enabled by default.

      struct DateArrayOptions
        include JSON::Serializable

        # A value to use for the field if the field isn't specified for a document.

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # Whether facet information can be returned for the field.

        @[JSON::Field(key: "FacetEnabled")]
        getter facet_enabled : Bool?

        # Whether the contents of the field can be returned in the search results.

        @[JSON::Field(key: "ReturnEnabled")]
        getter return_enabled : Bool?

        # Whether the contents of the field are searchable.

        @[JSON::Field(key: "SearchEnabled")]
        getter search_enabled : Bool?

        # A list of source fields to map to the field.

        @[JSON::Field(key: "SourceFields")]
        getter source_fields : String?

        def initialize(
          @default_value : String? = nil,
          @facet_enabled : Bool? = nil,
          @return_enabled : Bool? = nil,
          @search_enabled : Bool? = nil,
          @source_fields : String? = nil
        )
        end
      end

      # Options for a date field. Dates and times are specified in UTC (Coordinated Universal Time)
      # according to IETF RFC3339: yyyy-mm-ddT00:00:00Z. Present if IndexFieldType specifies the field is of
      # type date . All options are enabled by default.

      struct DateOptions
        include JSON::Serializable

        # A value to use for the field if the field isn't specified for a document.

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # Whether facet information can be returned for the field.

        @[JSON::Field(key: "FacetEnabled")]
        getter facet_enabled : Bool?

        # Whether the contents of the field can be returned in the search results.

        @[JSON::Field(key: "ReturnEnabled")]
        getter return_enabled : Bool?

        # Whether the contents of the field are searchable.

        @[JSON::Field(key: "SearchEnabled")]
        getter search_enabled : Bool?

        # Whether the field can be used to sort the search results.

        @[JSON::Field(key: "SortEnabled")]
        getter sort_enabled : Bool?


        @[JSON::Field(key: "SourceField")]
        getter source_field : String?

        def initialize(
          @default_value : String? = nil,
          @facet_enabled : Bool? = nil,
          @return_enabled : Bool? = nil,
          @search_enabled : Bool? = nil,
          @sort_enabled : Bool? = nil,
          @source_field : String? = nil
        )
        end
      end

      # Container for the parameters to the DefineAnalysisScheme operation. Specifies the name of the domain
      # you want to update and the analysis scheme configuration.

      struct DefineAnalysisSchemeRequest
        include JSON::Serializable


        @[JSON::Field(key: "AnalysisScheme")]
        getter analysis_scheme : Types::AnalysisScheme


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @analysis_scheme : Types::AnalysisScheme,
          @domain_name : String
        )
        end
      end

      # The result of a DefineAnalysisScheme request. Contains the status of the newly-configured analysis
      # scheme.

      struct DefineAnalysisSchemeResponse
        include JSON::Serializable


        @[JSON::Field(key: "AnalysisScheme")]
        getter analysis_scheme : Types::AnalysisSchemeStatus

        def initialize(
          @analysis_scheme : Types::AnalysisSchemeStatus
        )
        end
      end

      # Container for the parameters to the DefineExpression operation. Specifies the name of the domain you
      # want to update and the expression you want to configure.

      struct DefineExpressionRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String


        @[JSON::Field(key: "Expression")]
        getter expression : Types::Expression

        def initialize(
          @domain_name : String,
          @expression : Types::Expression
        )
        end
      end

      # The result of a DefineExpression request. Contains the status of the newly-configured expression.

      struct DefineExpressionResponse
        include JSON::Serializable


        @[JSON::Field(key: "Expression")]
        getter expression : Types::ExpressionStatus

        def initialize(
          @expression : Types::ExpressionStatus
        )
        end
      end

      # Container for the parameters to the DefineIndexField operation. Specifies the name of the domain you
      # want to update and the index field configuration.

      struct DefineIndexFieldRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The index field and field options you want to configure.

        @[JSON::Field(key: "IndexField")]
        getter index_field : Types::IndexField

        def initialize(
          @domain_name : String,
          @index_field : Types::IndexField
        )
        end
      end

      # The result of a DefineIndexField request. Contains the status of the newly-configured index field.

      struct DefineIndexFieldResponse
        include JSON::Serializable


        @[JSON::Field(key: "IndexField")]
        getter index_field : Types::IndexFieldStatus

        def initialize(
          @index_field : Types::IndexFieldStatus
        )
        end
      end

      # Container for the parameters to the DefineSuggester operation. Specifies the name of the domain you
      # want to update and the suggester configuration.

      struct DefineSuggesterRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String


        @[JSON::Field(key: "Suggester")]
        getter suggester : Types::Suggester

        def initialize(
          @domain_name : String,
          @suggester : Types::Suggester
        )
        end
      end

      # The result of a DefineSuggester request. Contains the status of the newly-configured suggester.

      struct DefineSuggesterResponse
        include JSON::Serializable


        @[JSON::Field(key: "Suggester")]
        getter suggester : Types::SuggesterStatus

        def initialize(
          @suggester : Types::SuggesterStatus
        )
        end
      end

      # Container for the parameters to the DeleteAnalysisScheme operation. Specifies the name of the domain
      # you want to update and the analysis scheme you want to delete.

      struct DeleteAnalysisSchemeRequest
        include JSON::Serializable

        # The name of the analysis scheme you want to delete.

        @[JSON::Field(key: "AnalysisSchemeName")]
        getter analysis_scheme_name : String


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @analysis_scheme_name : String,
          @domain_name : String
        )
        end
      end

      # The result of a DeleteAnalysisScheme request. Contains the status of the deleted analysis scheme.

      struct DeleteAnalysisSchemeResponse
        include JSON::Serializable

        # The status of the analysis scheme being deleted.

        @[JSON::Field(key: "AnalysisScheme")]
        getter analysis_scheme : Types::AnalysisSchemeStatus

        def initialize(
          @analysis_scheme : Types::AnalysisSchemeStatus
        )
        end
      end

      # Container for the parameters to the DeleteDomain operation. Specifies the name of the domain you
      # want to delete.

      struct DeleteDomainRequest
        include JSON::Serializable

        # The name of the domain you want to permanently delete.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The result of a DeleteDomain request. Contains the status of a newly deleted domain, or no status if
      # the domain has already been completely deleted.

      struct DeleteDomainResponse
        include JSON::Serializable


        @[JSON::Field(key: "DomainStatus")]
        getter domain_status : Types::DomainStatus?

        def initialize(
          @domain_status : Types::DomainStatus? = nil
        )
        end
      end

      # Container for the parameters to the DeleteExpression operation. Specifies the name of the domain you
      # want to update and the name of the expression you want to delete.

      struct DeleteExpressionRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the Expression to delete.

        @[JSON::Field(key: "ExpressionName")]
        getter expression_name : String

        def initialize(
          @domain_name : String,
          @expression_name : String
        )
        end
      end

      # The result of a DeleteExpression request. Specifies the expression being deleted.

      struct DeleteExpressionResponse
        include JSON::Serializable

        # The status of the expression being deleted.

        @[JSON::Field(key: "Expression")]
        getter expression : Types::ExpressionStatus

        def initialize(
          @expression : Types::ExpressionStatus
        )
        end
      end

      # Container for the parameters to the DeleteIndexField operation. Specifies the name of the domain you
      # want to update and the name of the index field you want to delete.

      struct DeleteIndexFieldRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The name of the index field your want to remove from the domain's indexing options.

        @[JSON::Field(key: "IndexFieldName")]
        getter index_field_name : String

        def initialize(
          @domain_name : String,
          @index_field_name : String
        )
        end
      end

      # The result of a DeleteIndexField request.

      struct DeleteIndexFieldResponse
        include JSON::Serializable

        # The status of the index field being deleted.

        @[JSON::Field(key: "IndexField")]
        getter index_field : Types::IndexFieldStatus

        def initialize(
          @index_field : Types::IndexFieldStatus
        )
        end
      end

      # Container for the parameters to the DeleteSuggester operation. Specifies the name of the domain you
      # want to update and name of the suggester you want to delete.

      struct DeleteSuggesterRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Specifies the name of the suggester you want to delete.

        @[JSON::Field(key: "SuggesterName")]
        getter suggester_name : String

        def initialize(
          @domain_name : String,
          @suggester_name : String
        )
        end
      end

      # The result of a DeleteSuggester request. Contains the status of the deleted suggester.

      struct DeleteSuggesterResponse
        include JSON::Serializable

        # The status of the suggester being deleted.

        @[JSON::Field(key: "Suggester")]
        getter suggester : Types::SuggesterStatus

        def initialize(
          @suggester : Types::SuggesterStatus
        )
        end
      end

      # Container for the parameters to the DescribeAnalysisSchemes operation. Specifies the name of the
      # domain you want to describe. To limit the response to particular analysis schemes, specify the names
      # of the analysis schemes you want to describe. To show the active configuration and exclude any
      # pending changes, set the Deployed option to true .

      struct DescribeAnalysisSchemesRequest
        include JSON::Serializable

        # The name of the domain you want to describe.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # The analysis schemes you want to describe.

        @[JSON::Field(key: "AnalysisSchemeNames")]
        getter analysis_scheme_names : Array(String)?

        # Whether to display the deployed configuration ( true ) or include any pending changes ( false ).
        # Defaults to false .

        @[JSON::Field(key: "Deployed")]
        getter deployed : Bool?

        def initialize(
          @domain_name : String,
          @analysis_scheme_names : Array(String)? = nil,
          @deployed : Bool? = nil
        )
        end
      end

      # The result of a DescribeAnalysisSchemes request. Contains the analysis schemes configured for the
      # domain specified in the request.

      struct DescribeAnalysisSchemesResponse
        include JSON::Serializable

        # The analysis scheme descriptions.

        @[JSON::Field(key: "AnalysisSchemes")]
        getter analysis_schemes : Array(Types::AnalysisSchemeStatus)

        def initialize(
          @analysis_schemes : Array(Types::AnalysisSchemeStatus)
        )
        end
      end

      # Container for the parameters to the DescribeAvailabilityOptions operation. Specifies the name of the
      # domain you want to describe. To show the active configuration and exclude any pending changes, set
      # the Deployed option to true .

      struct DescribeAvailabilityOptionsRequest
        include JSON::Serializable

        # The name of the domain you want to describe.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Whether to display the deployed configuration ( true ) or include any pending changes ( false ).
        # Defaults to false .

        @[JSON::Field(key: "Deployed")]
        getter deployed : Bool?

        def initialize(
          @domain_name : String,
          @deployed : Bool? = nil
        )
        end
      end

      # The result of a DescribeAvailabilityOptions request. Indicates whether or not the Multi-AZ option is
      # enabled for the domain specified in the request.

      struct DescribeAvailabilityOptionsResponse
        include JSON::Serializable

        # The availability options configured for the domain. Indicates whether Multi-AZ is enabled for the
        # domain.

        @[JSON::Field(key: "AvailabilityOptions")]
        getter availability_options : Types::AvailabilityOptionsStatus?

        def initialize(
          @availability_options : Types::AvailabilityOptionsStatus? = nil
        )
        end
      end

      # Container for the parameters to the DescribeDomainEndpointOptions operation. Specify the name of the
      # domain you want to describe. To show the active configuration and exclude any pending changes, set
      # the Deployed option to true .

      struct DescribeDomainEndpointOptionsRequest
        include JSON::Serializable

        # A string that represents the name of a domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Whether to retrieve the latest configuration (which might be in a Processing state) or the current,
        # active configuration. Defaults to false .

        @[JSON::Field(key: "Deployed")]
        getter deployed : Bool?

        def initialize(
          @domain_name : String,
          @deployed : Bool? = nil
        )
        end
      end

      # The result of a DescribeDomainEndpointOptions request. Contains the status and configuration of a
      # search domain's endpoint options.

      struct DescribeDomainEndpointOptionsResponse
        include JSON::Serializable

        # The status and configuration of a search domain's endpoint options.

        @[JSON::Field(key: "DomainEndpointOptions")]
        getter domain_endpoint_options : Types::DomainEndpointOptionsStatus?

        def initialize(
          @domain_endpoint_options : Types::DomainEndpointOptionsStatus? = nil
        )
        end
      end

      # Container for the parameters to the DescribeDomains operation. By default shows the status of all
      # domains. To restrict the response to particular domains, specify the names of the domains you want
      # to describe.

      struct DescribeDomainsRequest
        include JSON::Serializable

        # The names of the domains you want to include in the response.

        @[JSON::Field(key: "DomainNames")]
        getter domain_names : Array(String)?

        def initialize(
          @domain_names : Array(String)? = nil
        )
        end
      end

      # The result of a DescribeDomains request. Contains the status of the domains specified in the request
      # or all domains owned by the account.

      struct DescribeDomainsResponse
        include JSON::Serializable


        @[JSON::Field(key: "DomainStatusList")]
        getter domain_status_list : Array(Types::DomainStatus)

        def initialize(
          @domain_status_list : Array(Types::DomainStatus)
        )
        end
      end

      # Container for the parameters to the DescribeDomains operation. Specifies the name of the domain you
      # want to describe. To restrict the response to particular expressions, specify the names of the
      # expressions you want to describe. To show the active configuration and exclude any pending changes,
      # set the Deployed option to true .

      struct DescribeExpressionsRequest
        include JSON::Serializable

        # The name of the domain you want to describe.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Whether to display the deployed configuration ( true ) or include any pending changes ( false ).
        # Defaults to false .

        @[JSON::Field(key: "Deployed")]
        getter deployed : Bool?

        # Limits the DescribeExpressions response to the specified expressions. If not specified, all
        # expressions are shown.

        @[JSON::Field(key: "ExpressionNames")]
        getter expression_names : Array(String)?

        def initialize(
          @domain_name : String,
          @deployed : Bool? = nil,
          @expression_names : Array(String)? = nil
        )
        end
      end

      # The result of a DescribeExpressions request. Contains the expressions configured for the domain
      # specified in the request.

      struct DescribeExpressionsResponse
        include JSON::Serializable

        # The expressions configured for the domain.

        @[JSON::Field(key: "Expressions")]
        getter expressions : Array(Types::ExpressionStatus)

        def initialize(
          @expressions : Array(Types::ExpressionStatus)
        )
        end
      end

      # Container for the parameters to the DescribeIndexFields operation. Specifies the name of the domain
      # you want to describe. To restrict the response to particular index fields, specify the names of the
      # index fields you want to describe. To show the active configuration and exclude any pending changes,
      # set the Deployed option to true .

      struct DescribeIndexFieldsRequest
        include JSON::Serializable

        # The name of the domain you want to describe.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Whether to display the deployed configuration ( true ) or include any pending changes ( false ).
        # Defaults to false .

        @[JSON::Field(key: "Deployed")]
        getter deployed : Bool?

        # A list of the index fields you want to describe. If not specified, information is returned for all
        # configured index fields.

        @[JSON::Field(key: "FieldNames")]
        getter field_names : Array(String)?

        def initialize(
          @domain_name : String,
          @deployed : Bool? = nil,
          @field_names : Array(String)? = nil
        )
        end
      end

      # The result of a DescribeIndexFields request. Contains the index fields configured for the domain
      # specified in the request.

      struct DescribeIndexFieldsResponse
        include JSON::Serializable

        # The index fields configured for the domain.

        @[JSON::Field(key: "IndexFields")]
        getter index_fields : Array(Types::IndexFieldStatus)

        def initialize(
          @index_fields : Array(Types::IndexFieldStatus)
        )
        end
      end

      # Container for the parameters to the DescribeScalingParameters operation. Specifies the name of the
      # domain you want to describe.

      struct DescribeScalingParametersRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The result of a DescribeScalingParameters request. Contains the scaling parameters configured for
      # the domain specified in the request.

      struct DescribeScalingParametersResponse
        include JSON::Serializable


        @[JSON::Field(key: "ScalingParameters")]
        getter scaling_parameters : Types::ScalingParametersStatus

        def initialize(
          @scaling_parameters : Types::ScalingParametersStatus
        )
        end
      end

      # Container for the parameters to the DescribeServiceAccessPolicies operation. Specifies the name of
      # the domain you want to describe. To show the active configuration and exclude any pending changes,
      # set the Deployed option to true .

      struct DescribeServiceAccessPoliciesRequest
        include JSON::Serializable

        # The name of the domain you want to describe.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Whether to display the deployed configuration ( true ) or include any pending changes ( false ).
        # Defaults to false .

        @[JSON::Field(key: "Deployed")]
        getter deployed : Bool?

        def initialize(
          @domain_name : String,
          @deployed : Bool? = nil
        )
        end
      end

      # The result of a DescribeServiceAccessPolicies request.

      struct DescribeServiceAccessPoliciesResponse
        include JSON::Serializable

        # The access rules configured for the domain specified in the request.

        @[JSON::Field(key: "AccessPolicies")]
        getter access_policies : Types::AccessPoliciesStatus

        def initialize(
          @access_policies : Types::AccessPoliciesStatus
        )
        end
      end

      # Container for the parameters to the DescribeSuggester operation. Specifies the name of the domain
      # you want to describe. To restrict the response to particular suggesters, specify the names of the
      # suggesters you want to describe. To show the active configuration and exclude any pending changes,
      # set the Deployed option to true .

      struct DescribeSuggestersRequest
        include JSON::Serializable

        # The name of the domain you want to describe.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # Whether to display the deployed configuration ( true ) or include any pending changes ( false ).
        # Defaults to false .

        @[JSON::Field(key: "Deployed")]
        getter deployed : Bool?

        # The suggesters you want to describe.

        @[JSON::Field(key: "SuggesterNames")]
        getter suggester_names : Array(String)?

        def initialize(
          @domain_name : String,
          @deployed : Bool? = nil,
          @suggester_names : Array(String)? = nil
        )
        end
      end

      # The result of a DescribeSuggesters request.

      struct DescribeSuggestersResponse
        include JSON::Serializable

        # The suggesters configured for the domain specified in the request.

        @[JSON::Field(key: "Suggesters")]
        getter suggesters : Array(Types::SuggesterStatus)

        def initialize(
          @suggesters : Array(Types::SuggesterStatus)
        )
        end
      end

      # The request was rejected because it attempted an operation which is not enabled.

      struct DisabledOperationException
        include JSON::Serializable

        def initialize
        end
      end

      # Options for a search suggester.

      struct DocumentSuggesterOptions
        include JSON::Serializable

        # The name of the index field you want to use for suggestions.

        @[JSON::Field(key: "SourceField")]
        getter source_field : String

        # The level of fuzziness allowed when suggesting matches for a string: none , low , or high . With
        # none, the specified string is treated as an exact prefix. With low, suggestions must differ from the
        # specified string by no more than one character. With high, suggestions can differ by up to two
        # characters. The default is none.

        @[JSON::Field(key: "FuzzyMatching")]
        getter fuzzy_matching : String?

        # An expression that computes a score for each suggestion to control how they are sorted. The scores
        # are rounded to the nearest integer, with a floor of 0 and a ceiling of 2^31-1. A document's
        # relevance score is not computed for suggestions, so sort expressions cannot reference the _score
        # value. To sort suggestions using a numeric field or existing expression, simply specify the name of
        # the field or expression. If no expression is configured for the suggester, the suggestions are
        # sorted with the closest matches listed first.

        @[JSON::Field(key: "SortExpression")]
        getter sort_expression : String?

        def initialize(
          @source_field : String,
          @fuzzy_matching : String? = nil,
          @sort_expression : String? = nil
        )
        end
      end

      # The domain's endpoint options.

      struct DomainEndpointOptions
        include JSON::Serializable

        # Whether the domain is HTTPS only enabled.

        @[JSON::Field(key: "EnforceHTTPS")]
        getter enforce_https : Bool?

        # The minimum required TLS version

        @[JSON::Field(key: "TLSSecurityPolicy")]
        getter tls_security_policy : String?

        def initialize(
          @enforce_https : Bool? = nil,
          @tls_security_policy : String? = nil
        )
        end
      end

      # The configuration and status of the domain's endpoint options.

      struct DomainEndpointOptionsStatus
        include JSON::Serializable

        # The domain endpoint options configured for the domain.

        @[JSON::Field(key: "Options")]
        getter options : Types::DomainEndpointOptions

        # The status of the configured domain endpoint options.

        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::DomainEndpointOptions,
          @status : Types::OptionStatus
        )
        end
      end

      # The current status of the search domain.

      struct DomainStatus
        include JSON::Serializable


        @[JSON::Field(key: "DomainId")]
        getter domain_id : String


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # True if IndexDocuments needs to be called to activate the current domain configuration.

        @[JSON::Field(key: "RequiresIndexDocuments")]
        getter requires_index_documents : Bool


        @[JSON::Field(key: "ARN")]
        getter arn : String?

        # True if the search domain is created. It can take several minutes to initialize a domain when
        # CreateDomain is called. Newly created search domains are returned from DescribeDomains with a false
        # value for Created until domain creation is complete.

        @[JSON::Field(key: "Created")]
        getter created : Bool?

        # True if the search domain has been deleted. The system must clean up resources dedicated to the
        # search domain when DeleteDomain is called. Newly deleted search domains are returned from
        # DescribeDomains with a true value for IsDeleted for several minutes until resource cleanup is
        # complete.

        @[JSON::Field(key: "Deleted")]
        getter deleted : Bool?

        # The service endpoint for updating documents in a search domain.

        @[JSON::Field(key: "DocService")]
        getter doc_service : Types::ServiceEndpoint?


        @[JSON::Field(key: "Limits")]
        getter limits : Types::Limits?

        # True if processing is being done to activate the current domain configuration.

        @[JSON::Field(key: "Processing")]
        getter processing : Bool?

        # The number of search instances that are available to process search requests.

        @[JSON::Field(key: "SearchInstanceCount")]
        getter search_instance_count : Int32?

        # The instance type that is being used to process search requests.

        @[JSON::Field(key: "SearchInstanceType")]
        getter search_instance_type : String?

        # The number of partitions across which the search index is spread.

        @[JSON::Field(key: "SearchPartitionCount")]
        getter search_partition_count : Int32?

        # The service endpoint for requesting search results from a search domain.

        @[JSON::Field(key: "SearchService")]
        getter search_service : Types::ServiceEndpoint?

        def initialize(
          @domain_id : String,
          @domain_name : String,
          @requires_index_documents : Bool,
          @arn : String? = nil,
          @created : Bool? = nil,
          @deleted : Bool? = nil,
          @doc_service : Types::ServiceEndpoint? = nil,
          @limits : Types::Limits? = nil,
          @processing : Bool? = nil,
          @search_instance_count : Int32? = nil,
          @search_instance_type : String? = nil,
          @search_partition_count : Int32? = nil,
          @search_service : Types::ServiceEndpoint? = nil
        )
        end
      end

      # Options for a field that contains an array of double-precision 64-bit floating point values. Present
      # if IndexFieldType specifies the field is of type double-array . All options are enabled by default.

      struct DoubleArrayOptions
        include JSON::Serializable

        # A value to use for the field if the field isn't specified for a document.

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : Float64?

        # Whether facet information can be returned for the field.

        @[JSON::Field(key: "FacetEnabled")]
        getter facet_enabled : Bool?

        # Whether the contents of the field can be returned in the search results.

        @[JSON::Field(key: "ReturnEnabled")]
        getter return_enabled : Bool?

        # Whether the contents of the field are searchable.

        @[JSON::Field(key: "SearchEnabled")]
        getter search_enabled : Bool?

        # A list of source fields to map to the field.

        @[JSON::Field(key: "SourceFields")]
        getter source_fields : String?

        def initialize(
          @default_value : Float64? = nil,
          @facet_enabled : Bool? = nil,
          @return_enabled : Bool? = nil,
          @search_enabled : Bool? = nil,
          @source_fields : String? = nil
        )
        end
      end

      # Options for a double-precision 64-bit floating point field. Present if IndexFieldType specifies the
      # field is of type double . All options are enabled by default.

      struct DoubleOptions
        include JSON::Serializable

        # A value to use for the field if the field isn't specified for a document. This can be important if
        # you are using the field in an expression and that field is not present in every document.

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : Float64?

        # Whether facet information can be returned for the field.

        @[JSON::Field(key: "FacetEnabled")]
        getter facet_enabled : Bool?

        # Whether the contents of the field can be returned in the search results.

        @[JSON::Field(key: "ReturnEnabled")]
        getter return_enabled : Bool?

        # Whether the contents of the field are searchable.

        @[JSON::Field(key: "SearchEnabled")]
        getter search_enabled : Bool?

        # Whether the field can be used to sort the search results.

        @[JSON::Field(key: "SortEnabled")]
        getter sort_enabled : Bool?

        # The name of the source field to map to the field.

        @[JSON::Field(key: "SourceField")]
        getter source_field : String?

        def initialize(
          @default_value : Float64? = nil,
          @facet_enabled : Bool? = nil,
          @return_enabled : Bool? = nil,
          @search_enabled : Bool? = nil,
          @sort_enabled : Bool? = nil,
          @source_field : String? = nil
        )
        end
      end

      # A named expression that can be evaluated at search time. Can be used to sort the search results,
      # define other expressions, or return computed information in the search results.

      struct Expression
        include JSON::Serializable


        @[JSON::Field(key: "ExpressionName")]
        getter expression_name : String


        @[JSON::Field(key: "ExpressionValue")]
        getter expression_value : String

        def initialize(
          @expression_name : String,
          @expression_value : String
        )
        end
      end

      # The value of an Expression and its current status.

      struct ExpressionStatus
        include JSON::Serializable

        # The expression that is evaluated for sorting while processing a search request.

        @[JSON::Field(key: "Options")]
        getter options : Types::Expression


        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::Expression,
          @status : Types::OptionStatus
        )
        end
      end

      # Container for the parameters to the IndexDocuments operation. Specifies the name of the domain you
      # want to re-index.

      struct IndexDocumentsRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end

      # The result of an IndexDocuments request. Contains the status of the indexing operation, including
      # the fields being indexed.

      struct IndexDocumentsResponse
        include JSON::Serializable

        # The names of the fields that are currently being indexed.

        @[JSON::Field(key: "FieldNames")]
        getter field_names : Array(String)?

        def initialize(
          @field_names : Array(String)? = nil
        )
        end
      end

      # Configuration information for a field in the index, including its name, type, and options. The
      # supported options depend on the IndexFieldType .

      struct IndexField
        include JSON::Serializable

        # A string that represents the name of an index field. CloudSearch supports regular index fields as
        # well as dynamic fields. A dynamic field's name defines a pattern that begins or ends with a
        # wildcard. Any document fields that don't map to a regular index field but do match a dynamic field's
        # pattern are configured with the dynamic field's indexing options. Regular field names begin with a
        # letter and can contain the following characters: a-z (lowercase), 0-9, and _ (underscore). Dynamic
        # field names must begin or end with a wildcard (*). The wildcard can also be the only character in a
        # dynamic field name. Multiple wildcards, and wildcards embedded within a string are not supported.
        # The name score is reserved and cannot be used as a field name. To reference a document's ID, you can
        # use the name _id .

        @[JSON::Field(key: "IndexFieldName")]
        getter index_field_name : String


        @[JSON::Field(key: "IndexFieldType")]
        getter index_field_type : String


        @[JSON::Field(key: "DateArrayOptions")]
        getter date_array_options : Types::DateArrayOptions?


        @[JSON::Field(key: "DateOptions")]
        getter date_options : Types::DateOptions?


        @[JSON::Field(key: "DoubleArrayOptions")]
        getter double_array_options : Types::DoubleArrayOptions?


        @[JSON::Field(key: "DoubleOptions")]
        getter double_options : Types::DoubleOptions?


        @[JSON::Field(key: "IntArrayOptions")]
        getter int_array_options : Types::IntArrayOptions?


        @[JSON::Field(key: "IntOptions")]
        getter int_options : Types::IntOptions?


        @[JSON::Field(key: "LatLonOptions")]
        getter lat_lon_options : Types::LatLonOptions?


        @[JSON::Field(key: "LiteralArrayOptions")]
        getter literal_array_options : Types::LiteralArrayOptions?


        @[JSON::Field(key: "LiteralOptions")]
        getter literal_options : Types::LiteralOptions?


        @[JSON::Field(key: "TextArrayOptions")]
        getter text_array_options : Types::TextArrayOptions?


        @[JSON::Field(key: "TextOptions")]
        getter text_options : Types::TextOptions?

        def initialize(
          @index_field_name : String,
          @index_field_type : String,
          @date_array_options : Types::DateArrayOptions? = nil,
          @date_options : Types::DateOptions? = nil,
          @double_array_options : Types::DoubleArrayOptions? = nil,
          @double_options : Types::DoubleOptions? = nil,
          @int_array_options : Types::IntArrayOptions? = nil,
          @int_options : Types::IntOptions? = nil,
          @lat_lon_options : Types::LatLonOptions? = nil,
          @literal_array_options : Types::LiteralArrayOptions? = nil,
          @literal_options : Types::LiteralOptions? = nil,
          @text_array_options : Types::TextArrayOptions? = nil,
          @text_options : Types::TextOptions? = nil
        )
        end
      end

      # The value of an IndexField and its current status.

      struct IndexFieldStatus
        include JSON::Serializable


        @[JSON::Field(key: "Options")]
        getter options : Types::IndexField


        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::IndexField,
          @status : Types::OptionStatus
        )
        end
      end

      # Options for a field that contains an array of 64-bit signed integers. Present if IndexFieldType
      # specifies the field is of type int-array . All options are enabled by default.

      struct IntArrayOptions
        include JSON::Serializable

        # A value to use for the field if the field isn't specified for a document.

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : Int64?

        # Whether facet information can be returned for the field.

        @[JSON::Field(key: "FacetEnabled")]
        getter facet_enabled : Bool?

        # Whether the contents of the field can be returned in the search results.

        @[JSON::Field(key: "ReturnEnabled")]
        getter return_enabled : Bool?

        # Whether the contents of the field are searchable.

        @[JSON::Field(key: "SearchEnabled")]
        getter search_enabled : Bool?

        # A list of source fields to map to the field.

        @[JSON::Field(key: "SourceFields")]
        getter source_fields : String?

        def initialize(
          @default_value : Int64? = nil,
          @facet_enabled : Bool? = nil,
          @return_enabled : Bool? = nil,
          @search_enabled : Bool? = nil,
          @source_fields : String? = nil
        )
        end
      end

      # Options for a 64-bit signed integer field. Present if IndexFieldType specifies the field is of type
      # int . All options are enabled by default.

      struct IntOptions
        include JSON::Serializable

        # A value to use for the field if the field isn't specified for a document. This can be important if
        # you are using the field in an expression and that field is not present in every document.

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : Int64?

        # Whether facet information can be returned for the field.

        @[JSON::Field(key: "FacetEnabled")]
        getter facet_enabled : Bool?

        # Whether the contents of the field can be returned in the search results.

        @[JSON::Field(key: "ReturnEnabled")]
        getter return_enabled : Bool?

        # Whether the contents of the field are searchable.

        @[JSON::Field(key: "SearchEnabled")]
        getter search_enabled : Bool?

        # Whether the field can be used to sort the search results.

        @[JSON::Field(key: "SortEnabled")]
        getter sort_enabled : Bool?

        # The name of the source field to map to the field.

        @[JSON::Field(key: "SourceField")]
        getter source_field : String?

        def initialize(
          @default_value : Int64? = nil,
          @facet_enabled : Bool? = nil,
          @return_enabled : Bool? = nil,
          @search_enabled : Bool? = nil,
          @sort_enabled : Bool? = nil,
          @source_field : String? = nil
        )
        end
      end

      # An internal error occurred while processing the request. If this problem persists, report an issue
      # from the Service Health Dashboard .

      struct InternalException
        include JSON::Serializable

        def initialize
        end
      end

      # The request was rejected because it specified an invalid type definition.

      struct InvalidTypeException
        include JSON::Serializable

        def initialize
        end
      end

      # Options for a latlon field. A latlon field contains a location stored as a latitude and longitude
      # value pair. Present if IndexFieldType specifies the field is of type latlon . All options are
      # enabled by default.

      struct LatLonOptions
        include JSON::Serializable

        # A value to use for the field if the field isn't specified for a document.

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # Whether facet information can be returned for the field.

        @[JSON::Field(key: "FacetEnabled")]
        getter facet_enabled : Bool?

        # Whether the contents of the field can be returned in the search results.

        @[JSON::Field(key: "ReturnEnabled")]
        getter return_enabled : Bool?

        # Whether the contents of the field are searchable.

        @[JSON::Field(key: "SearchEnabled")]
        getter search_enabled : Bool?

        # Whether the field can be used to sort the search results.

        @[JSON::Field(key: "SortEnabled")]
        getter sort_enabled : Bool?


        @[JSON::Field(key: "SourceField")]
        getter source_field : String?

        def initialize(
          @default_value : String? = nil,
          @facet_enabled : Bool? = nil,
          @return_enabled : Bool? = nil,
          @search_enabled : Bool? = nil,
          @sort_enabled : Bool? = nil,
          @source_field : String? = nil
        )
        end
      end

      # The request was rejected because a resource limit has already been met.

      struct LimitExceededException
        include JSON::Serializable

        def initialize
        end
      end


      struct Limits
        include JSON::Serializable


        @[JSON::Field(key: "MaximumPartitionCount")]
        getter maximum_partition_count : Int32


        @[JSON::Field(key: "MaximumReplicationCount")]
        getter maximum_replication_count : Int32

        def initialize(
          @maximum_partition_count : Int32,
          @maximum_replication_count : Int32
        )
        end
      end

      # The result of a ListDomainNames request. Contains a list of the domains owned by an account.

      struct ListDomainNamesResponse
        include JSON::Serializable

        # The names of the search domains owned by an account.

        @[JSON::Field(key: "DomainNames")]
        getter domain_names : Hash(String, String)?

        def initialize(
          @domain_names : Hash(String, String)? = nil
        )
        end
      end

      # Options for a field that contains an array of literal strings. Present if IndexFieldType specifies
      # the field is of type literal-array . All options are enabled by default.

      struct LiteralArrayOptions
        include JSON::Serializable

        # A value to use for the field if the field isn't specified for a document.

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # Whether facet information can be returned for the field.

        @[JSON::Field(key: "FacetEnabled")]
        getter facet_enabled : Bool?

        # Whether the contents of the field can be returned in the search results.

        @[JSON::Field(key: "ReturnEnabled")]
        getter return_enabled : Bool?

        # Whether the contents of the field are searchable.

        @[JSON::Field(key: "SearchEnabled")]
        getter search_enabled : Bool?

        # A list of source fields to map to the field.

        @[JSON::Field(key: "SourceFields")]
        getter source_fields : String?

        def initialize(
          @default_value : String? = nil,
          @facet_enabled : Bool? = nil,
          @return_enabled : Bool? = nil,
          @search_enabled : Bool? = nil,
          @source_fields : String? = nil
        )
        end
      end

      # Options for literal field. Present if IndexFieldType specifies the field is of type literal . All
      # options are enabled by default.

      struct LiteralOptions
        include JSON::Serializable

        # A value to use for the field if the field isn't specified for a document.

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # Whether facet information can be returned for the field.

        @[JSON::Field(key: "FacetEnabled")]
        getter facet_enabled : Bool?

        # Whether the contents of the field can be returned in the search results.

        @[JSON::Field(key: "ReturnEnabled")]
        getter return_enabled : Bool?

        # Whether the contents of the field are searchable.

        @[JSON::Field(key: "SearchEnabled")]
        getter search_enabled : Bool?

        # Whether the field can be used to sort the search results.

        @[JSON::Field(key: "SortEnabled")]
        getter sort_enabled : Bool?


        @[JSON::Field(key: "SourceField")]
        getter source_field : String?

        def initialize(
          @default_value : String? = nil,
          @facet_enabled : Bool? = nil,
          @return_enabled : Bool? = nil,
          @search_enabled : Bool? = nil,
          @sort_enabled : Bool? = nil,
          @source_field : String? = nil
        )
        end
      end

      # The status of domain configuration option.

      struct OptionStatus
        include JSON::Serializable

        # A timestamp for when this option was created.

        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time

        # The state of processing a change to an option. Possible values: RequiresIndexDocuments : the
        # option's latest value will not be deployed until IndexDocuments has been called and indexing is
        # complete. Processing : the option's latest value is in the process of being activated. Active : the
        # option's latest value is completely deployed. FailedToValidate : the option value is not compatible
        # with the domain's data and cannot be used to index the data. You must either modify the option value
        # or update or remove the incompatible documents.

        @[JSON::Field(key: "State")]
        getter state : String

        # A timestamp for when this option was last updated.

        @[JSON::Field(key: "UpdateDate")]
        getter update_date : Time

        # Indicates that the option will be deleted once processing is complete.

        @[JSON::Field(key: "PendingDeletion")]
        getter pending_deletion : Bool?

        # A unique integer that indicates when this option was last updated.

        @[JSON::Field(key: "UpdateVersion")]
        getter update_version : Int32?

        def initialize(
          @creation_date : Time,
          @state : String,
          @update_date : Time,
          @pending_deletion : Bool? = nil,
          @update_version : Int32? = nil
        )
        end
      end

      # The request was rejected because it attempted to create a resource that already exists.

      struct ResourceAlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # The request was rejected because it attempted to reference a resource that does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The desired instance type and desired number of replicas of each index partition.

      struct ScalingParameters
        include JSON::Serializable

        # The instance type that you want to preconfigure for your domain. For example, search.m1.small .

        @[JSON::Field(key: "DesiredInstanceType")]
        getter desired_instance_type : String?

        # The number of partitions you want to preconfigure for your domain. Only valid when you select
        # m2.2xlarge as the desired instance type.

        @[JSON::Field(key: "DesiredPartitionCount")]
        getter desired_partition_count : Int32?

        # The number of replicas you want to preconfigure for each index partition.

        @[JSON::Field(key: "DesiredReplicationCount")]
        getter desired_replication_count : Int32?

        def initialize(
          @desired_instance_type : String? = nil,
          @desired_partition_count : Int32? = nil,
          @desired_replication_count : Int32? = nil
        )
        end
      end

      # The status and configuration of a search domain's scaling parameters.

      struct ScalingParametersStatus
        include JSON::Serializable


        @[JSON::Field(key: "Options")]
        getter options : Types::ScalingParameters


        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::ScalingParameters,
          @status : Types::OptionStatus
        )
        end
      end

      # The endpoint to which service requests can be submitted.

      struct ServiceEndpoint
        include JSON::Serializable


        @[JSON::Field(key: "Endpoint")]
        getter endpoint : String?

        def initialize(
          @endpoint : String? = nil
        )
        end
      end

      # Configuration information for a search suggester. Each suggester has a unique name and specifies the
      # text field you want to use for suggestions. The following options can be configured for a suggester:
      # FuzzyMatching , SortExpression .

      struct Suggester
        include JSON::Serializable


        @[JSON::Field(key: "DocumentSuggesterOptions")]
        getter document_suggester_options : Types::DocumentSuggesterOptions


        @[JSON::Field(key: "SuggesterName")]
        getter suggester_name : String

        def initialize(
          @document_suggester_options : Types::DocumentSuggesterOptions,
          @suggester_name : String
        )
        end
      end

      # The value of a Suggester and its current status.

      struct SuggesterStatus
        include JSON::Serializable


        @[JSON::Field(key: "Options")]
        getter options : Types::Suggester


        @[JSON::Field(key: "Status")]
        getter status : Types::OptionStatus

        def initialize(
          @options : Types::Suggester,
          @status : Types::OptionStatus
        )
        end
      end

      # Options for a field that contains an array of text strings. Present if IndexFieldType specifies the
      # field is of type text-array . A text-array field is always searchable. All options are enabled by
      # default.

      struct TextArrayOptions
        include JSON::Serializable

        # The name of an analysis scheme for a text-array field.

        @[JSON::Field(key: "AnalysisScheme")]
        getter analysis_scheme : String?

        # A value to use for the field if the field isn't specified for a document.

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # Whether highlights can be returned for the field.

        @[JSON::Field(key: "HighlightEnabled")]
        getter highlight_enabled : Bool?

        # Whether the contents of the field can be returned in the search results.

        @[JSON::Field(key: "ReturnEnabled")]
        getter return_enabled : Bool?

        # A list of source fields to map to the field.

        @[JSON::Field(key: "SourceFields")]
        getter source_fields : String?

        def initialize(
          @analysis_scheme : String? = nil,
          @default_value : String? = nil,
          @highlight_enabled : Bool? = nil,
          @return_enabled : Bool? = nil,
          @source_fields : String? = nil
        )
        end
      end

      # Options for text field. Present if IndexFieldType specifies the field is of type text . A text field
      # is always searchable. All options are enabled by default.

      struct TextOptions
        include JSON::Serializable

        # The name of an analysis scheme for a text field.

        @[JSON::Field(key: "AnalysisScheme")]
        getter analysis_scheme : String?

        # A value to use for the field if the field isn't specified for a document.

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # Whether highlights can be returned for the field.

        @[JSON::Field(key: "HighlightEnabled")]
        getter highlight_enabled : Bool?

        # Whether the contents of the field can be returned in the search results.

        @[JSON::Field(key: "ReturnEnabled")]
        getter return_enabled : Bool?

        # Whether the field can be used to sort the search results.

        @[JSON::Field(key: "SortEnabled")]
        getter sort_enabled : Bool?


        @[JSON::Field(key: "SourceField")]
        getter source_field : String?

        def initialize(
          @analysis_scheme : String? = nil,
          @default_value : String? = nil,
          @highlight_enabled : Bool? = nil,
          @return_enabled : Bool? = nil,
          @sort_enabled : Bool? = nil,
          @source_field : String? = nil
        )
        end
      end

      # Container for the parameters to the UpdateAvailabilityOptions operation. Specifies the name of the
      # domain you want to update and the Multi-AZ availability option.

      struct UpdateAvailabilityOptionsRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        # You expand an existing search domain to a second Availability Zone by setting the Multi-AZ option to
        # true. Similarly, you can turn off the Multi-AZ option to downgrade the domain to a single
        # Availability Zone by setting the Multi-AZ option to false .

        @[JSON::Field(key: "MultiAZ")]
        getter multi_az : Bool

        def initialize(
          @domain_name : String,
          @multi_az : Bool
        )
        end
      end

      # The result of a UpdateAvailabilityOptions request. Contains the status of the domain's availability
      # options.

      struct UpdateAvailabilityOptionsResponse
        include JSON::Serializable

        # The newly-configured availability options. Indicates whether Multi-AZ is enabled for the domain.

        @[JSON::Field(key: "AvailabilityOptions")]
        getter availability_options : Types::AvailabilityOptionsStatus?

        def initialize(
          @availability_options : Types::AvailabilityOptionsStatus? = nil
        )
        end
      end

      # Container for the parameters to the UpdateDomainEndpointOptions operation. Specifies the name of the
      # domain you want to update and the domain endpoint options.

      struct UpdateDomainEndpointOptionsRequest
        include JSON::Serializable

        # Whether to require that all requests to the domain arrive over HTTPS. We recommend
        # Policy-Min-TLS-1-2-2019-07 for TLSSecurityPolicy. For compatibility with older clients, the default
        # is Policy-Min-TLS-1-0-2019-07.

        @[JSON::Field(key: "DomainEndpointOptions")]
        getter domain_endpoint_options : Types::DomainEndpointOptions

        # A string that represents the name of a domain.

        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @domain_endpoint_options : Types::DomainEndpointOptions,
          @domain_name : String
        )
        end
      end

      # The result of a UpdateDomainEndpointOptions request. Contains the configuration and status of the
      # domain's endpoint options.

      struct UpdateDomainEndpointOptionsResponse
        include JSON::Serializable

        # The newly-configured domain endpoint options.

        @[JSON::Field(key: "DomainEndpointOptions")]
        getter domain_endpoint_options : Types::DomainEndpointOptionsStatus?

        def initialize(
          @domain_endpoint_options : Types::DomainEndpointOptionsStatus? = nil
        )
        end
      end

      # Container for the parameters to the UpdateScalingParameters operation. Specifies the name of the
      # domain you want to update and the scaling parameters you want to configure.

      struct UpdateScalingParametersRequest
        include JSON::Serializable


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String


        @[JSON::Field(key: "ScalingParameters")]
        getter scaling_parameters : Types::ScalingParameters

        def initialize(
          @domain_name : String,
          @scaling_parameters : Types::ScalingParameters
        )
        end
      end

      # The result of a UpdateScalingParameters request. Contains the status of the newly-configured scaling
      # parameters.

      struct UpdateScalingParametersResponse
        include JSON::Serializable


        @[JSON::Field(key: "ScalingParameters")]
        getter scaling_parameters : Types::ScalingParametersStatus

        def initialize(
          @scaling_parameters : Types::ScalingParametersStatus
        )
        end
      end

      # Container for the parameters to the UpdateServiceAccessPolicies operation. Specifies the name of the
      # domain you want to update and the access rules you want to configure.

      struct UpdateServiceAccessPoliciesRequest
        include JSON::Serializable

        # The access rules you want to configure. These rules replace any existing rules.

        @[JSON::Field(key: "AccessPolicies")]
        getter access_policies : String


        @[JSON::Field(key: "DomainName")]
        getter domain_name : String

        def initialize(
          @access_policies : String,
          @domain_name : String
        )
        end
      end

      # The result of an UpdateServiceAccessPolicies request. Contains the new access policies.

      struct UpdateServiceAccessPoliciesResponse
        include JSON::Serializable

        # The access rules configured for the domain.

        @[JSON::Field(key: "AccessPolicies")]
        getter access_policies : Types::AccessPoliciesStatus

        def initialize(
          @access_policies : Types::AccessPoliciesStatus
        )
        end
      end

      # The request was rejected because it has invalid parameters.

      struct ValidationException
        include JSON::Serializable

        def initialize
        end
      end
    end
  end
end
