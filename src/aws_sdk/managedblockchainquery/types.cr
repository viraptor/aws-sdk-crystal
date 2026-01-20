require "json"
require "time"

module AwsSdk
  module ManagedBlockchainQuery
    module Types

      # The Amazon Web Services account doesn’t have access to this resource.

      struct AccessDeniedException
        include JSON::Serializable

        # The container for the exception message.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # This is the container for the unique public address on the blockchain.

      struct AddressIdentifierFilter
        include JSON::Serializable

        # The container for the recipient address of the transaction.

        @[JSON::Field(key: "transactionEventToAddress")]
        getter transaction_event_to_address : Array(String)

        def initialize(
          @transaction_event_to_address : Array(String)
        )
        end
      end

      # This container contains information about an contract.

      struct AssetContract
        include JSON::Serializable

        # The container for the contract identifier containing its blockchain network and address.

        @[JSON::Field(key: "contractIdentifier")]
        getter contract_identifier : Types::ContractIdentifier

        # The address of the contract deployer.

        @[JSON::Field(key: "deployerAddress")]
        getter deployer_address : String

        # The token standard of the contract.

        @[JSON::Field(key: "tokenStandard")]
        getter token_standard : String

        def initialize(
          @contract_identifier : Types::ContractIdentifier,
          @deployer_address : String,
          @token_standard : String
        )
        end
      end

      # Error generated from a failed BatchGetTokenBalance request.

      struct BatchGetTokenBalanceErrorItem
        include JSON::Serializable

        # The error code associated with the error.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # The message associated with the error.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        # The type of error.

        @[JSON::Field(key: "errorType")]
        getter error_type : String


        @[JSON::Field(key: "atBlockchainInstant")]
        getter at_blockchain_instant : Types::BlockchainInstant?


        @[JSON::Field(key: "ownerIdentifier")]
        getter owner_identifier : Types::OwnerIdentifier?


        @[JSON::Field(key: "tokenIdentifier")]
        getter token_identifier : Types::TokenIdentifier?

        def initialize(
          @error_code : String,
          @error_message : String,
          @error_type : String,
          @at_blockchain_instant : Types::BlockchainInstant? = nil,
          @owner_identifier : Types::OwnerIdentifier? = nil,
          @token_identifier : Types::TokenIdentifier? = nil
        )
        end
      end


      struct BatchGetTokenBalanceInput
        include JSON::Serializable

        # An array of BatchGetTokenBalanceInputItem objects whose balance is being requested.

        @[JSON::Field(key: "getTokenBalanceInputs")]
        getter get_token_balance_inputs : Array(Types::BatchGetTokenBalanceInputItem)?

        def initialize(
          @get_token_balance_inputs : Array(Types::BatchGetTokenBalanceInputItem)? = nil
        )
        end
      end

      # The container for the input for getting a token balance.

      struct BatchGetTokenBalanceInputItem
        include JSON::Serializable


        @[JSON::Field(key: "ownerIdentifier")]
        getter owner_identifier : Types::OwnerIdentifier


        @[JSON::Field(key: "tokenIdentifier")]
        getter token_identifier : Types::TokenIdentifier


        @[JSON::Field(key: "atBlockchainInstant")]
        getter at_blockchain_instant : Types::BlockchainInstant?

        def initialize(
          @owner_identifier : Types::OwnerIdentifier,
          @token_identifier : Types::TokenIdentifier,
          @at_blockchain_instant : Types::BlockchainInstant? = nil
        )
        end
      end


      struct BatchGetTokenBalanceOutput
        include JSON::Serializable

        # An array of BatchGetTokenBalanceErrorItem objects returned from the request.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchGetTokenBalanceErrorItem)

        # An array of BatchGetTokenBalanceOutputItem objects returned by the response.

        @[JSON::Field(key: "tokenBalances")]
        getter token_balances : Array(Types::BatchGetTokenBalanceOutputItem)

        def initialize(
          @errors : Array(Types::BatchGetTokenBalanceErrorItem),
          @token_balances : Array(Types::BatchGetTokenBalanceOutputItem)
        )
        end
      end

      # The container for the properties of a token balance output.

      struct BatchGetTokenBalanceOutputItem
        include JSON::Serializable


        @[JSON::Field(key: "atBlockchainInstant")]
        getter at_blockchain_instant : Types::BlockchainInstant

        # The container for the token balance.

        @[JSON::Field(key: "balance")]
        getter balance : String


        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Types::BlockchainInstant?


        @[JSON::Field(key: "ownerIdentifier")]
        getter owner_identifier : Types::OwnerIdentifier?


        @[JSON::Field(key: "tokenIdentifier")]
        getter token_identifier : Types::TokenIdentifier?

        def initialize(
          @at_blockchain_instant : Types::BlockchainInstant,
          @balance : String,
          @last_updated_time : Types::BlockchainInstant? = nil,
          @owner_identifier : Types::OwnerIdentifier? = nil,
          @token_identifier : Types::TokenIdentifier? = nil
        )
        end
      end

      # The container for time.

      struct BlockchainInstant
        include JSON::Serializable

        # The container of the Timestamp of the blockchain instant. This timestamp will only be recorded up to
        # the second.

        @[JSON::Field(key: "time")]
        getter time : Time?

        def initialize(
          @time : Time? = nil
        )
        end
      end

      # The container for the ConfirmationStatusFilter that filters for the finality of the results.

      struct ConfirmationStatusFilter
        include JSON::Serializable

        # The container to determine whether to list results that have only reached finality . Transactions
        # that have reached finality are always part of the response.

        @[JSON::Field(key: "include")]
        getter include : Array(String)

        def initialize(
          @include : Array(String)
        )
        end
      end

      # The contract or wallet address by which to filter the request.

      struct ContractFilter
        include JSON::Serializable

        # The network address of the deployer.

        @[JSON::Field(key: "deployerAddress")]
        getter deployer_address : String

        # The blockchain network of the contract.

        @[JSON::Field(key: "network")]
        getter network : String

        # The container for the token standard.

        @[JSON::Field(key: "tokenStandard")]
        getter token_standard : String

        def initialize(
          @deployer_address : String,
          @network : String,
          @token_standard : String
        )
        end
      end

      # Container for the blockchain address and network information about a contract.

      struct ContractIdentifier
        include JSON::Serializable

        # Container for the blockchain address about a contract.

        @[JSON::Field(key: "contractAddress")]
        getter contract_address : String

        # The blockchain network of the contract.

        @[JSON::Field(key: "network")]
        getter network : String

        def initialize(
          @contract_address : String,
          @network : String
        )
        end
      end

      # The metadata of the contract.

      struct ContractMetadata
        include JSON::Serializable

        # The decimals used by the token contract.

        @[JSON::Field(key: "decimals")]
        getter decimals : Int32?

        # The name of the token contract.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The symbol of the token contract.

        @[JSON::Field(key: "symbol")]
        getter symbol : String?

        def initialize(
          @decimals : Int32? = nil,
          @name : String? = nil,
          @symbol : String? = nil
        )
        end
      end


      struct GetAssetContractInput
        include JSON::Serializable

        # Contains the blockchain address and network information about the contract.

        @[JSON::Field(key: "contractIdentifier")]
        getter contract_identifier : Types::ContractIdentifier

        def initialize(
          @contract_identifier : Types::ContractIdentifier
        )
        end
      end


      struct GetAssetContractOutput
        include JSON::Serializable

        # Contains the blockchain address and network information about the contract.

        @[JSON::Field(key: "contractIdentifier")]
        getter contract_identifier : Types::ContractIdentifier

        # The address of the deployer of contract.

        @[JSON::Field(key: "deployerAddress")]
        getter deployer_address : String

        # The token standard of the contract requested.

        @[JSON::Field(key: "tokenStandard")]
        getter token_standard : String


        @[JSON::Field(key: "metadata")]
        getter metadata : Types::ContractMetadata?

        def initialize(
          @contract_identifier : Types::ContractIdentifier,
          @deployer_address : String,
          @token_standard : String,
          @metadata : Types::ContractMetadata? = nil
        )
        end
      end


      struct GetTokenBalanceInput
        include JSON::Serializable

        # The container for the identifier for the owner.

        @[JSON::Field(key: "ownerIdentifier")]
        getter owner_identifier : Types::OwnerIdentifier

        # The container for the identifier for the token, including the unique token ID and its blockchain
        # network.

        @[JSON::Field(key: "tokenIdentifier")]
        getter token_identifier : Types::TokenIdentifier

        # The time for when the TokenBalance is requested or the current time if a time is not provided in the
        # request. This time will only be recorded up to the second.

        @[JSON::Field(key: "atBlockchainInstant")]
        getter at_blockchain_instant : Types::BlockchainInstant?

        def initialize(
          @owner_identifier : Types::OwnerIdentifier,
          @token_identifier : Types::TokenIdentifier,
          @at_blockchain_instant : Types::BlockchainInstant? = nil
        )
        end
      end


      struct GetTokenBalanceOutput
        include JSON::Serializable


        @[JSON::Field(key: "atBlockchainInstant")]
        getter at_blockchain_instant : Types::BlockchainInstant

        # The container for the token balance.

        @[JSON::Field(key: "balance")]
        getter balance : String


        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Types::BlockchainInstant?


        @[JSON::Field(key: "ownerIdentifier")]
        getter owner_identifier : Types::OwnerIdentifier?


        @[JSON::Field(key: "tokenIdentifier")]
        getter token_identifier : Types::TokenIdentifier?

        def initialize(
          @at_blockchain_instant : Types::BlockchainInstant,
          @balance : String,
          @last_updated_time : Types::BlockchainInstant? = nil,
          @owner_identifier : Types::OwnerIdentifier? = nil,
          @token_identifier : Types::TokenIdentifier? = nil
        )
        end
      end


      struct GetTransactionInput
        include JSON::Serializable

        # The blockchain network where the transaction occurred.

        @[JSON::Field(key: "network")]
        getter network : String

        # The hash of a transaction. It is generated when a transaction is created.

        @[JSON::Field(key: "transactionHash")]
        getter transaction_hash : String?

        # The identifier of a Bitcoin transaction. It is generated when a transaction is created.
        # transactionId is only supported on the Bitcoin networks.

        @[JSON::Field(key: "transactionId")]
        getter transaction_id : String?

        def initialize(
          @network : String,
          @transaction_hash : String? = nil,
          @transaction_id : String? = nil
        )
        end
      end


      struct GetTransactionOutput
        include JSON::Serializable

        # Contains the details of the transaction.

        @[JSON::Field(key: "transaction")]
        getter transaction : Types::Transaction

        def initialize(
          @transaction : Types::Transaction
        )
        end
      end

      # The request processing has failed because of an internal error in the service.

      struct InternalServerException
        include JSON::Serializable

        # The container for the exception message.

        @[JSON::Field(key: "message")]
        getter message : String

        # Specifies the retryAfterSeconds value.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end


      struct ListAssetContractsInput
        include JSON::Serializable

        # Contains the filter parameter for the request.

        @[JSON::Field(key: "contractFilter")]
        getter contract_filter : Types::ContractFilter

        # The maximum number of contracts to list. Default: 100 Even if additional results can be retrieved,
        # the request can return less results than maxResults or an empty array of results. To retrieve the
        # next set of results, make another request with the returned nextToken value. The value of nextToken
        # is null when there are no more results to return

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @contract_filter : Types::ContractFilter,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssetContractsOutput
        include JSON::Serializable

        # An array of contract objects that contain the properties for each contract.

        @[JSON::Field(key: "contracts")]
        getter contracts : Array(Types::AssetContract)

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @contracts : Array(Types::AssetContract),
          @next_token : String? = nil
        )
        end
      end


      struct ListFilteredTransactionEventsInput
        include JSON::Serializable

        # This is the unique public address on the blockchain for which the transaction events are being
        # requested.

        @[JSON::Field(key: "addressIdentifierFilter")]
        getter address_identifier_filter : Types::AddressIdentifierFilter

        # The blockchain network where the transaction occurred. Valid Values: BITCOIN_MAINNET |
        # BITCOIN_TESTNET

        @[JSON::Field(key: "network")]
        getter network : String


        @[JSON::Field(key: "confirmationStatusFilter")]
        getter confirmation_status_filter : Types::ConfirmationStatusFilter?

        # The maximum number of transaction events to list. Default: 100 Even if additional results can be
        # retrieved, the request can return less results than maxResults or an empty array of results. To
        # retrieve the next set of results, make another request with the returned nextToken value. The value
        # of nextToken is null when there are no more results to return

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The order by which the results will be sorted.

        @[JSON::Field(key: "sort")]
        getter sort : Types::ListFilteredTransactionEventsSort?

        # This container specifies the time frame for the transaction events returned in the response.

        @[JSON::Field(key: "timeFilter")]
        getter time_filter : Types::TimeFilter?

        # This container specifies filtering attributes related to BITCOIN_VOUT event types

        @[JSON::Field(key: "voutFilter")]
        getter vout_filter : Types::VoutFilter?

        def initialize(
          @address_identifier_filter : Types::AddressIdentifierFilter,
          @network : String,
          @confirmation_status_filter : Types::ConfirmationStatusFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort : Types::ListFilteredTransactionEventsSort? = nil,
          @time_filter : Types::TimeFilter? = nil,
          @vout_filter : Types::VoutFilter? = nil
        )
        end
      end


      struct ListFilteredTransactionEventsOutput
        include JSON::Serializable

        # The transaction events returned by the request.

        @[JSON::Field(key: "events")]
        getter events : Array(Types::TransactionEvent)

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @events : Array(Types::TransactionEvent),
          @next_token : String? = nil
        )
        end
      end

      # Lists all the transaction events for an address on the blockchain. This operation is only supported
      # on the Bitcoin blockchain networks.

      struct ListFilteredTransactionEventsSort
        include JSON::Serializable

        # Container on how the results will be sorted by?

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The container for the sort order for ListFilteredTransactionEvents . The SortOrder field only
        # accepts the values ASCENDING and DESCENDING . Not providing SortOrder will default to ASCENDING .

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct ListTokenBalancesInput
        include JSON::Serializable

        # The contract address or a token identifier on the blockchain network by which to filter the request.
        # You must specify the contractAddress property of this container when listing tokens minted by a
        # contract. You must always specify the network property of this container when using this operation.

        @[JSON::Field(key: "tokenFilter")]
        getter token_filter : Types::TokenFilter

        # The maximum number of token balances to return. Default: 100 Even if additional results can be
        # retrieved, the request can return less results than maxResults or an empty array of results. To
        # retrieve the next set of results, make another request with the returned nextToken value. The value
        # of nextToken is null when there are no more results to return

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The contract or wallet address on the blockchain network by which to filter the request. You must
        # specify the address property of the ownerFilter when listing balances of tokens owned by the
        # address.

        @[JSON::Field(key: "ownerFilter")]
        getter owner_filter : Types::OwnerFilter?

        def initialize(
          @token_filter : Types::TokenFilter,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @owner_filter : Types::OwnerFilter? = nil
        )
        end
      end


      struct ListTokenBalancesOutput
        include JSON::Serializable

        # An array of TokenBalance objects. Each object contains details about the token balance.

        @[JSON::Field(key: "tokenBalances")]
        getter token_balances : Array(Types::TokenBalance)

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @token_balances : Array(Types::TokenBalance),
          @next_token : String? = nil
        )
        end
      end


      struct ListTransactionEventsInput
        include JSON::Serializable

        # The blockchain network where the transaction events occurred.

        @[JSON::Field(key: "network")]
        getter network : String

        # The maximum number of transaction events to list. Default: 100 Even if additional results can be
        # retrieved, the request can return less results than maxResults or an empty array of results. To
        # retrieve the next set of results, make another request with the returned nextToken value. The value
        # of nextToken is null when there are no more results to return

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The hash of a transaction. It is generated when a transaction is created.

        @[JSON::Field(key: "transactionHash")]
        getter transaction_hash : String?

        # The identifier of a Bitcoin transaction. It is generated when a transaction is created.
        # transactionId is only supported on the Bitcoin networks.

        @[JSON::Field(key: "transactionId")]
        getter transaction_id : String?

        def initialize(
          @network : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @transaction_hash : String? = nil,
          @transaction_id : String? = nil
        )
        end
      end


      struct ListTransactionEventsOutput
        include JSON::Serializable

        # An array of TransactionEvent objects. Each object contains details about the transaction events.

        @[JSON::Field(key: "events")]
        getter events : Array(Types::TransactionEvent)

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @events : Array(Types::TransactionEvent),
          @next_token : String? = nil
        )
        end
      end


      struct ListTransactionsInput
        include JSON::Serializable

        # The address (either a contract or wallet), whose transactions are being requested.

        @[JSON::Field(key: "address")]
        getter address : String

        # The blockchain network where the transactions occurred.

        @[JSON::Field(key: "network")]
        getter network : String

        # This filter is used to include transactions in the response that haven't reached finality .
        # Transactions that have reached finality are always part of the response.

        @[JSON::Field(key: "confirmationStatusFilter")]
        getter confirmation_status_filter : Types::ConfirmationStatusFilter?


        @[JSON::Field(key: "fromBlockchainInstant")]
        getter from_blockchain_instant : Types::BlockchainInstant?

        # The maximum number of transactions to list. Default: 100 Even if additional results can be
        # retrieved, the request can return less results than maxResults or an empty array of results. To
        # retrieve the next set of results, make another request with the returned nextToken value. The value
        # of nextToken is null when there are no more results to return

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The order by which the results will be sorted.

        @[JSON::Field(key: "sort")]
        getter sort : Types::ListTransactionsSort?


        @[JSON::Field(key: "toBlockchainInstant")]
        getter to_blockchain_instant : Types::BlockchainInstant?

        def initialize(
          @address : String,
          @network : String,
          @confirmation_status_filter : Types::ConfirmationStatusFilter? = nil,
          @from_blockchain_instant : Types::BlockchainInstant? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort : Types::ListTransactionsSort? = nil,
          @to_blockchain_instant : Types::BlockchainInstant? = nil
        )
        end
      end


      struct ListTransactionsOutput
        include JSON::Serializable

        # The array of transactions returned by the request.

        @[JSON::Field(key: "transactions")]
        getter transactions : Array(Types::TransactionOutputItem)

        # The pagination token that indicates the next set of results to retrieve.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @transactions : Array(Types::TransactionOutputItem),
          @next_token : String? = nil
        )
        end
      end

      # The container for determining how the list transaction result will be sorted.

      struct ListTransactionsSort
        include JSON::Serializable

        # Defaults to the value TRANSACTION_TIMESTAMP .

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The container for the sort order for ListTransactions . The SortOrder field only accepts the values
        # ASCENDING and DESCENDING . Not providing SortOrder will default to ASCENDING .

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # The container for the owner information to filter by.

      struct OwnerFilter
        include JSON::Serializable

        # The contract or wallet address.

        @[JSON::Field(key: "address")]
        getter address : String

        def initialize(
          @address : String
        )
        end
      end

      # The container for the owner identifier.

      struct OwnerIdentifier
        include JSON::Serializable

        # The contract or wallet address for the owner.

        @[JSON::Field(key: "address")]
        getter address : String

        def initialize(
          @address : String
        )
        end
      end

      # The resource was not found.

      struct ResourceNotFoundException
        include JSON::Serializable

        # The container for the exception message.

        @[JSON::Field(key: "message")]
        getter message : String

        # The resourceId of the resource that caused the exception.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The resourceType of the resource that caused the exception.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # The service quota has been exceeded for this resource.

      struct ServiceQuotaExceededException
        include JSON::Serializable

        # The container for the exception message.

        @[JSON::Field(key: "message")]
        getter message : String

        # The container for the quotaCode .

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # The resourceId of the resource that caused the exception.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The resourceType of the resource that caused the exception.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The container for the serviceCode .

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

      # The request or operation couldn't be performed because a service is throttling requests. The most
      # common source of throttling errors is when you create resources that exceed your service limit for
      # this resource type. Request a limit increase or delete unused resources, if possible.

      struct ThrottlingException
        include JSON::Serializable

        # The container for the exception message.

        @[JSON::Field(key: "message")]
        getter message : String

        # The container for the quotaCode .

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # The container for the serviceCode .

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        # The container of the retryAfterSeconds value.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @quota_code : String,
          @service_code : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # This container is used to specify a time frame.

      struct TimeFilter
        include JSON::Serializable


        @[JSON::Field(key: "from")]
        getter from : Types::BlockchainInstant?


        @[JSON::Field(key: "to")]
        getter to : Types::BlockchainInstant?

        def initialize(
          @from : Types::BlockchainInstant? = nil,
          @to : Types::BlockchainInstant? = nil
        )
        end
      end

      # The balance of the token.

      struct TokenBalance
        include JSON::Serializable

        # The time for when the TokenBalance is requested or the current time if a time is not provided in the
        # request. This time will only be recorded up to the second.

        @[JSON::Field(key: "atBlockchainInstant")]
        getter at_blockchain_instant : Types::BlockchainInstant

        # The container of the token balance.

        @[JSON::Field(key: "balance")]
        getter balance : String

        # The Timestamp of the last transaction at which the balance for the token in the wallet was updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Types::BlockchainInstant?

        # The container for the identifier of the owner.

        @[JSON::Field(key: "ownerIdentifier")]
        getter owner_identifier : Types::OwnerIdentifier?

        # The identifier for the token, including the unique token ID and its blockchain network.

        @[JSON::Field(key: "tokenIdentifier")]
        getter token_identifier : Types::TokenIdentifier?

        def initialize(
          @at_blockchain_instant : Types::BlockchainInstant,
          @balance : String,
          @last_updated_time : Types::BlockchainInstant? = nil,
          @owner_identifier : Types::OwnerIdentifier? = nil,
          @token_identifier : Types::TokenIdentifier? = nil
        )
        end
      end

      # The container of the token filter like the contract address on a given blockchain network or a
      # unique token identifier on a given blockchain network. You must always specify the network property
      # of this container when using this operation.

      struct TokenFilter
        include JSON::Serializable

        # The blockchain network of the token.

        @[JSON::Field(key: "network")]
        getter network : String

        # This is the address of the contract.

        @[JSON::Field(key: "contractAddress")]
        getter contract_address : String?

        # The unique identifier of the token.

        @[JSON::Field(key: "tokenId")]
        getter token_id : String?

        def initialize(
          @network : String,
          @contract_address : String? = nil,
          @token_id : String? = nil
        )
        end
      end

      # The container for the identifier for the token including the unique token ID and its blockchain
      # network. Only the native tokens BTC and ETH, and the ERC-20, ERC-721, and ERC 1155 token standards
      # are supported.

      struct TokenIdentifier
        include JSON::Serializable

        # The blockchain network of the token.

        @[JSON::Field(key: "network")]
        getter network : String

        # This is the token's contract address.

        @[JSON::Field(key: "contractAddress")]
        getter contract_address : String?

        # The unique identifier of the token. For native tokens, use the 3 character abbreviation that best
        # matches your token. For example, btc for Bitcoin, eth for Ether, etc. For all other token types you
        # must specify the tokenId in the 64 character hexadecimal tokenid format.

        @[JSON::Field(key: "tokenId")]
        getter token_id : String?

        def initialize(
          @network : String,
          @contract_address : String? = nil,
          @token_id : String? = nil
        )
        end
      end

      # There are two possible types of transactions used for this data type: A Bitcoin transaction is a
      # movement of BTC from one address to another. An Ethereum transaction refers to an action initiated
      # by an externally owned account, which is an account managed by a human, not a contract. For example,
      # if Bob sends Alice 1 ETH, Bob's account must be debited and Alice's must be credited. This
      # state-changing action occurs within a transaction.

      struct Transaction
        include JSON::Serializable

        # The blockchain network where the transaction occurred.

        @[JSON::Field(key: "network")]
        getter network : String

        # The number of transactions in the block.

        @[JSON::Field(key: "numberOfTransactions")]
        getter number_of_transactions : Int64

        # The identifier of the transaction. It is generated whenever a transaction is verified and added to
        # the blockchain.

        @[JSON::Field(key: "to")]
        getter to : String

        # The hash of a transaction. It is generated when a transaction is created.

        @[JSON::Field(key: "transactionHash")]
        getter transaction_hash : String

        # The index of the transaction within a blockchain.

        @[JSON::Field(key: "transactionIndex")]
        getter transaction_index : Int64

        # The Timestamp of the transaction.

        @[JSON::Field(key: "transactionTimestamp")]
        getter transaction_timestamp : Time

        # The block hash is a unique identifier for a block. It is a fixed-size string that is calculated by
        # using the information in the block. The block hash is used to verify the integrity of the data in
        # the block.

        @[JSON::Field(key: "blockHash")]
        getter block_hash : String?

        # The block number in which the transaction is recorded.

        @[JSON::Field(key: "blockNumber")]
        getter block_number : String?

        # Specifies whether the transaction has reached Finality.

        @[JSON::Field(key: "confirmationStatus")]
        getter confirmation_status : String?

        # The blockchain address for the contract.

        @[JSON::Field(key: "contractAddress")]
        getter contract_address : String?

        # The amount of gas used up to the specified point in the block.

        @[JSON::Field(key: "cumulativeGasUsed")]
        getter cumulative_gas_used : String?

        # The effective gas price.

        @[JSON::Field(key: "effectiveGasPrice")]
        getter effective_gas_price : String?

        # Identifies whether the transaction has succeeded or failed.

        @[JSON::Field(key: "executionStatus")]
        getter execution_status : String?

        # The initiator of the transaction. It is either in the form a public key or a contract address.

        @[JSON::Field(key: "from")]
        getter from : String?

        # The amount of gas used for the transaction.

        @[JSON::Field(key: "gasUsed")]
        getter gas_used : String?

        # The signature of the transaction. The X coordinate of a point R.

        @[JSON::Field(key: "signatureR")]
        getter signature_r : String?

        # The signature of the transaction. The Y coordinate of a point S.

        @[JSON::Field(key: "signatureS")]
        getter signature_s : String?

        # The signature of the transaction. The Z coordinate of a point V.

        @[JSON::Field(key: "signatureV")]
        getter signature_v : Int32?

        # The transaction fee.

        @[JSON::Field(key: "transactionFee")]
        getter transaction_fee : String?

        # The identifier of a Bitcoin transaction. It is generated when a transaction is created.

        @[JSON::Field(key: "transactionId")]
        getter transaction_id : String?

        def initialize(
          @network : String,
          @number_of_transactions : Int64,
          @to : String,
          @transaction_hash : String,
          @transaction_index : Int64,
          @transaction_timestamp : Time,
          @block_hash : String? = nil,
          @block_number : String? = nil,
          @confirmation_status : String? = nil,
          @contract_address : String? = nil,
          @cumulative_gas_used : String? = nil,
          @effective_gas_price : String? = nil,
          @execution_status : String? = nil,
          @from : String? = nil,
          @gas_used : String? = nil,
          @signature_r : String? = nil,
          @signature_s : String? = nil,
          @signature_v : Int32? = nil,
          @transaction_fee : String? = nil,
          @transaction_id : String? = nil
        )
        end
      end

      # The container for the properties of a transaction event.

      struct TransactionEvent
        include JSON::Serializable

        # The type of transaction event.

        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # The blockchain network where the transaction occurred.

        @[JSON::Field(key: "network")]
        getter network : String

        # The hash of a transaction. It is generated when a transaction is created.

        @[JSON::Field(key: "transactionHash")]
        getter transaction_hash : String


        @[JSON::Field(key: "blockchainInstant")]
        getter blockchain_instant : Types::BlockchainInstant?

        # This container specifies whether the transaction has reached Finality.

        @[JSON::Field(key: "confirmationStatus")]
        getter confirmation_status : String?

        # The blockchain address for the contract

        @[JSON::Field(key: "contractAddress")]
        getter contract_address : String?

        # The wallet address initiating the transaction. It can either be a public key or a contract.

        @[JSON::Field(key: "from")]
        getter from : String?

        # The position of the spent transaction output in the output list of the creating transaction . This
        # is only returned for BITCOIN_VIN event types.

        @[JSON::Field(key: "spentVoutIndex")]
        getter spent_vout_index : Int32?

        # The transactionHash that created the spent transaction output. This is only returned for BITCOIN_VIN
        # event types.

        @[JSON::Field(key: "spentVoutTransactionHash")]
        getter spent_vout_transaction_hash : String?

        # The transactionId that created the spent transaction output. This is only returned for BITCOIN_VIN
        # event types.

        @[JSON::Field(key: "spentVoutTransactionId")]
        getter spent_vout_transaction_id : String?

        # The wallet address receiving the transaction. It can either be a public key or a contract.

        @[JSON::Field(key: "to")]
        getter to : String?

        # The unique identifier for the token involved in the transaction.

        @[JSON::Field(key: "tokenId")]
        getter token_id : String?

        # The identifier of a Bitcoin transaction. It is generated when a transaction is created.

        @[JSON::Field(key: "transactionId")]
        getter transaction_id : String?

        # The value that was transacted.

        @[JSON::Field(key: "value")]
        getter value : String?

        # The position of the transaction output in the transaction output list.

        @[JSON::Field(key: "voutIndex")]
        getter vout_index : Int32?

        # Specifies if the transaction output is spent or unspent. This is only returned for BITCOIN_VOUT
        # event types. This is only returned for BITCOIN_VOUT event types.

        @[JSON::Field(key: "voutSpent")]
        getter vout_spent : Bool?

        def initialize(
          @event_type : String,
          @network : String,
          @transaction_hash : String,
          @blockchain_instant : Types::BlockchainInstant? = nil,
          @confirmation_status : String? = nil,
          @contract_address : String? = nil,
          @from : String? = nil,
          @spent_vout_index : Int32? = nil,
          @spent_vout_transaction_hash : String? = nil,
          @spent_vout_transaction_id : String? = nil,
          @to : String? = nil,
          @token_id : String? = nil,
          @transaction_id : String? = nil,
          @value : String? = nil,
          @vout_index : Int32? = nil,
          @vout_spent : Bool? = nil
        )
        end
      end

      # The container of the transaction output.

      struct TransactionOutputItem
        include JSON::Serializable

        # The blockchain network where the transaction occurred.

        @[JSON::Field(key: "network")]
        getter network : String

        # The hash of a transaction. It is generated when a transaction is created.

        @[JSON::Field(key: "transactionHash")]
        getter transaction_hash : String

        # The time when the transaction occurred.

        @[JSON::Field(key: "transactionTimestamp")]
        getter transaction_timestamp : Time

        # Specifies whether to list transactions that have not reached Finality.

        @[JSON::Field(key: "confirmationStatus")]
        getter confirmation_status : String?

        # The identifier of a Bitcoin transaction. It is generated when a transaction is created.

        @[JSON::Field(key: "transactionId")]
        getter transaction_id : String?

        def initialize(
          @network : String,
          @transaction_hash : String,
          @transaction_timestamp : Time,
          @confirmation_status : String? = nil,
          @transaction_id : String? = nil
        )
        end
      end

      # The resource passed is invalid.

      struct ValidationException
        include JSON::Serializable

        # The container for the exception message.

        @[JSON::Field(key: "message")]
        getter message : String

        # The container for the reason for the exception

        @[JSON::Field(key: "reason")]
        getter reason : String

        # The container for the fieldList of the exception.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # The resource passed is invalid.

      struct ValidationExceptionField
        include JSON::Serializable

        # The ValidationException message.

        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the field that triggered the ValidationException .

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # This container specifies filtering attributes related to BITCOIN_VOUT event types

      struct VoutFilter
        include JSON::Serializable

        # Specifies if the transaction output is spent or unspent.

        @[JSON::Field(key: "voutSpent")]
        getter vout_spent : Bool

        def initialize(
          @vout_spent : Bool
        )
        end
      end
    end
  end
end
