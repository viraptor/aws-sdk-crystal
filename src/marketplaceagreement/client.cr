module Aws
  module MarketplaceAgreement
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : Aws::Runtime::Credentials
      getter transport : Aws::Runtime::Transport
      getter runtime : Aws::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : Aws::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : Aws::Runtime::Transport = Aws::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || Aws::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || Aws::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = Aws::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Provides details about an agreement, such as the proposer, acceptor, start date, and end date.

      def describe_agreement(
        agreement_id : String
      ) : Types::DescribeAgreementOutput

        input = Types::DescribeAgreementInput.new(agreement_id: agreement_id)
        describe_agreement(input)
      end

      def describe_agreement(input : Types::DescribeAgreementInput) : Types::DescribeAgreementOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AGREEMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeAgreementOutput, "DescribeAgreement")
      end

      # Obtains details about the terms in an agreement that you participated in as proposer or acceptor.
      # The details include: TermType – The type of term, such as LegalTerm , RenewalTerm , or
      # ConfigurableUpfrontPricingTerm . TermID – The ID of the particular term, which is common between
      # offer and agreement. TermPayload – The key information contained in the term, such as the EULA for
      # LegalTerm or pricing and dimensions for various pricing terms, such as
      # ConfigurableUpfrontPricingTerm or UsageBasedPricingTerm . Configuration – The buyer/acceptor's
      # selection at the time of agreement creation, such as the number of units purchased for a dimension
      # or setting the EnableAutoRenew flag.

      def get_agreement_terms(
        agreement_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetAgreementTermsOutput

        input = Types::GetAgreementTermsInput.new(agreement_id: agreement_id, max_results: max_results, next_token: next_token)
        get_agreement_terms(input)
      end

      def get_agreement_terms(input : Types::GetAgreementTermsInput) : Types::GetAgreementTermsOutput
        request = Protocol::JsonRpc.build_request(Model::GET_AGREEMENT_TERMS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAgreementTermsOutput, "GetAgreementTerms")
      end

      # Searches across all agreements that a proposer has in AWS Marketplace. The search returns a list of
      # agreements with basic agreement information. The following filter combinations are supported when
      # the PartyType is Proposer : AgreementType AgreementType + EndTime AgreementType + ResourceType
      # AgreementType + ResourceType + EndTime AgreementType + ResourceType + Status AgreementType +
      # ResourceType + Status + EndTime AgreementType + ResourceId AgreementType + ResourceId + EndTime
      # AgreementType + ResourceId + Status AgreementType + ResourceId + Status + EndTime AgreementType +
      # AcceptorAccountId AgreementType + AcceptorAccountId + EndTime AgreementType + AcceptorAccountId +
      # Status AgreementType + AcceptorAccountId + Status + EndTime AgreementType + AcceptorAccountId +
      # OfferId AgreementType + AcceptorAccountId + OfferId + Status AgreementType + AcceptorAccountId +
      # OfferId + EndTime AgreementType + AcceptorAccountId + OfferId + Status + EndTime AgreementType +
      # AcceptorAccountId + ResourceId AgreementType + AcceptorAccountId + ResourceId + Status AgreementType
      # + AcceptorAccountId + ResourceId + EndTime AgreementType + AcceptorAccountId + ResourceId + Status +
      # EndTime AgreementType + AcceptorAccountId + ResourceType AgreementType + AcceptorAccountId +
      # ResourceType + EndTime AgreementType + AcceptorAccountId + ResourceType + Status AgreementType +
      # AcceptorAccountId + ResourceType + Status + EndTime AgreementType + Status AgreementType + Status +
      # EndTime AgreementType + OfferId AgreementType + OfferId + EndTime AgreementType + OfferId + Status
      # AgreementType + OfferId + Status + EndTime AgreementType + OfferSetId AgreementType + OfferSetId +
      # EndTime AgreementType + OfferSetId + Status AgreementType + OfferSetId + Status + EndTime To filter
      # by EndTime , you can use either BeforeEndTime or AfterEndTime . Only EndTime is supported for
      # sorting.

      def search_agreements(
        catalog : String? = nil,
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort : Types::Sort? = nil
      ) : Types::SearchAgreementsOutput

        input = Types::SearchAgreementsInput.new(catalog: catalog, filters: filters, max_results: max_results, next_token: next_token, sort: sort)
        search_agreements(input)
      end

      def search_agreements(input : Types::SearchAgreementsInput) : Types::SearchAgreementsOutput
        request = Protocol::JsonRpc.build_request(Model::SEARCH_AGREEMENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SearchAgreementsOutput, "SearchAgreements")
      end
    end
  end
end
