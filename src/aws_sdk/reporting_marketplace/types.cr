require "json"

module AwsSdk
  module MarketplaceReporting
    module Types

      # You do not have sufficient access to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request is malformed, or it contains an error such as an invalid parameter. Ensure the request
      # has all required parameters.
      struct BadRequestException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct GetBuyerDashboardInput
        include JSON::Serializable

        # The ARN of the requested dashboard.
        @[JSON::Field(key: "dashboardIdentifier")]
        getter dashboard_identifier : String

        # Fully qualified domains that you add to the allow list for access to the generated URL that is then
        # embedded. You can list up to two domains or subdomains in each API call. To include all subdomains
        # under a specific domain, use * . For example, https://*.amazon.com includes all subdomains under
        # https://aws.amazon.com .
        @[JSON::Field(key: "embeddingDomains")]
        getter embedding_domains : Array(String)

        def initialize(
          @dashboard_identifier : String,
          @embedding_domains : Array(String)
        )
        end
      end

      struct GetBuyerDashboardOutput
        include JSON::Serializable

        # The ARN of the returned dashboard.
        @[JSON::Field(key: "dashboardIdentifier")]
        getter dashboard_identifier : String

        # The dashboard's embedding URL.
        @[JSON::Field(key: "embedUrl")]
        getter embed_url : String

        # The fully qualified domains specified in the request. The domains enable access to the generated URL
        # that is then embedded. You can list up to two domains or subdomains in each API call. To include all
        # subdomains under a specific domain, use * . For example, https://*.amazon.com includes all
        # subdomains under https://aws.amazon.com .
        @[JSON::Field(key: "embeddingDomains")]
        getter embedding_domains : Array(String)

        def initialize(
          @dashboard_identifier : String,
          @embed_url : String,
          @embedding_domains : Array(String)
        )
        end
      end

      # The operation failed due to a server error.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You do not have permission to perform this action.
      struct UnauthorizedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
