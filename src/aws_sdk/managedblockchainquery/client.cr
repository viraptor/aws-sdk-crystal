module AwsSdk
  module ManagedBlockchainQuery
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Gets the token balance for a batch of tokens by using the BatchGetTokenBalance action for every
      # token in the request. Only the native tokens BTC and ETH, and the ERC-20, ERC-721, and ERC 1155
      # token standards are supported.

      def batch_get_token_balance(
        get_token_balance_inputs : Array(Types::BatchGetTokenBalanceInputItem)? = nil
      ) : Protocol::Request
        input = Types::BatchGetTokenBalanceInput.new(get_token_balance_inputs: get_token_balance_inputs)
        batch_get_token_balance(input)
      end

      def batch_get_token_balance(input : Types::BatchGetTokenBalanceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_GET_TOKEN_BALANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the information about a specific contract deployed on the blockchain. The Bitcoin blockchain
      # networks do not support this operation. Metadata is currently only available for some ERC-20
      # contracts. Metadata will be available for additional contracts in the future.

      def get_asset_contract(
        contract_identifier : Types::ContractIdentifier
      ) : Protocol::Request
        input = Types::GetAssetContractInput.new(contract_identifier: contract_identifier)
        get_asset_contract(input)
      end

      def get_asset_contract(input : Types::GetAssetContractInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ASSET_CONTRACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the balance of a specific token, including native tokens, for a given address (wallet or
      # contract) on the blockchain. Only the native tokens BTC and ETH, and the ERC-20, ERC-721, and ERC
      # 1155 token standards are supported.

      def get_token_balance(
        owner_identifier : Types::OwnerIdentifier,
        token_identifier : Types::TokenIdentifier,
        at_blockchain_instant : Types::BlockchainInstant? = nil
      ) : Protocol::Request
        input = Types::GetTokenBalanceInput.new(owner_identifier: owner_identifier, token_identifier: token_identifier, at_blockchain_instant: at_blockchain_instant)
        get_token_balance(input)
      end

      def get_token_balance(input : Types::GetTokenBalanceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TOKEN_BALANCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the details of a transaction. This action will return transaction details for all transactions
      # that are confirmed on the blockchain, even if they have not reached finality .

      def get_transaction(
        network : String,
        transaction_hash : String? = nil,
        transaction_id : String? = nil
      ) : Protocol::Request
        input = Types::GetTransactionInput.new(network: network, transaction_hash: transaction_hash, transaction_id: transaction_id)
        get_transaction(input)
      end

      def get_transaction(input : Types::GetTransactionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TRANSACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the contracts for a given contract type deployed by an address (either a contract address
      # or a wallet address). The Bitcoin blockchain networks do not support this operation.

      def list_asset_contracts(
        contract_filter : Types::ContractFilter,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAssetContractsInput.new(contract_filter: contract_filter, max_results: max_results, next_token: next_token)
        list_asset_contracts(input)
      end

      def list_asset_contracts(input : Types::ListAssetContractsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ASSET_CONTRACTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the transaction events for an address on the blockchain. This operation is only supported
      # on the Bitcoin networks.

      def list_filtered_transaction_events(
        address_identifier_filter : Types::AddressIdentifierFilter,
        network : String,
        confirmation_status_filter : Types::ConfirmationStatusFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort : Types::ListFilteredTransactionEventsSort? = nil,
        time_filter : Types::TimeFilter? = nil,
        vout_filter : Types::VoutFilter? = nil
      ) : Protocol::Request
        input = Types::ListFilteredTransactionEventsInput.new(address_identifier_filter: address_identifier_filter, network: network, confirmation_status_filter: confirmation_status_filter, max_results: max_results, next_token: next_token, sort: sort, time_filter: time_filter, vout_filter: vout_filter)
        list_filtered_transaction_events(input)
      end

      def list_filtered_transaction_events(input : Types::ListFilteredTransactionEventsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FILTERED_TRANSACTION_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This action returns the following for a given blockchain network: Lists all token balances owned by
      # an address (either a contract address or a wallet address). Lists all token balances for all tokens
      # created by a contract. Lists all token balances for a given token. You must always specify the
      # network property of the tokenFilter when using this operation.

      def list_token_balances(
        token_filter : Types::TokenFilter,
        max_results : Int32? = nil,
        next_token : String? = nil,
        owner_filter : Types::OwnerFilter? = nil
      ) : Protocol::Request
        input = Types::ListTokenBalancesInput.new(token_filter: token_filter, max_results: max_results, next_token: next_token, owner_filter: owner_filter)
        list_token_balances(input)
      end

      def list_token_balances(input : Types::ListTokenBalancesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TOKEN_BALANCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the transaction events for a transaction This action will return transaction details for
      # all transactions that are confirmed on the blockchain, even if they have not reached finality .

      def list_transaction_events(
        network : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        transaction_hash : String? = nil,
        transaction_id : String? = nil
      ) : Protocol::Request
        input = Types::ListTransactionEventsInput.new(network: network, max_results: max_results, next_token: next_token, transaction_hash: transaction_hash, transaction_id: transaction_id)
        list_transaction_events(input)
      end

      def list_transaction_events(input : Types::ListTransactionEventsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TRANSACTION_EVENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the transaction events for a transaction.

      def list_transactions(
        address : String,
        network : String,
        confirmation_status_filter : Types::ConfirmationStatusFilter? = nil,
        from_blockchain_instant : Types::BlockchainInstant? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort : Types::ListTransactionsSort? = nil,
        to_blockchain_instant : Types::BlockchainInstant? = nil
      ) : Protocol::Request
        input = Types::ListTransactionsInput.new(address: address, network: network, confirmation_status_filter: confirmation_status_filter, from_blockchain_instant: from_blockchain_instant, max_results: max_results, next_token: next_token, sort: sort, to_blockchain_instant: to_blockchain_instant)
        list_transactions(input)
      end

      def list_transactions(input : Types::ListTransactionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TRANSACTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
