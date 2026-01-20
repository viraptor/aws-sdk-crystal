require "json"
require "time"

module AwsSdk
  module MarketplaceDeployment
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

      # The request configuration has conflicts. For details, see the accompanying error message.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The unique identifier for the resource associated with the error.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        def initialize(
          @message : String,
          @resource_id : String
        )
        end
      end

      # The shape containing the requested deployment parameter name and secretString. To support AWS
      # CloudFormation dynamic references to this resource using Quick Launch, this value must match a
      # parameter defined in the CloudFormation templated provided to buyers.

      struct DeploymentParameterInput
        include JSON::Serializable

        # The desired name of the deployment parameter. This is the identifier on which deployment parameters
        # are keyed for a given buyer and product. If this name matches an existing deployment parameter, this
        # request will update the existing resource.

        @[JSON::Field(key: "name")]
        getter name : String

        # The text to encrypt and store in the secret.

        @[JSON::Field(key: "secretString")]
        getter secret_string : String

        def initialize(
          @name : String,
          @secret_string : String
        )
        end
      end

      # There was an internal service exception.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the deployment parameter resource you want to list
        # tags on.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A map of key-value pairs, where each pair represents a tag present on the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct PutDeploymentParameterRequest
        include JSON::Serializable

        # The unique identifier of the agreement.

        @[JSON::Field(key: "agreementId")]
        getter agreement_id : String

        # The catalog related to the request. Fixed value: AWSMarketplace

        @[JSON::Field(key: "catalog")]
        getter catalog : String

        # The deployment parameter targeted to the acceptor of an agreement for which to create the AWS Secret
        # Manager resource.

        @[JSON::Field(key: "deploymentParameter")]
        getter deployment_parameter : Types::DeploymentParameterInput

        # The product for which AWS Marketplace will save secrets for the buyer’s account.

        @[JSON::Field(key: "productId")]
        getter product_id : String

        # The idempotency token for deployment parameters. A unique identifier for the new version. This field
        # is not required if you're calling using an AWS SDK. Otherwise, a clientToken must be provided with
        # the request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The date when deployment parameters expire and are scheduled for deletion.

        @[JSON::Field(key: "expirationDate")]
        getter expiration_date : Time?

        # A map of key-value pairs, where each pair represents a tag saved to the resource. Tags will only be
        # applied for create operations, and they'll be ignored if the resource already exists.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @agreement_id : String,
          @catalog : String,
          @deployment_parameter : Types::DeploymentParameterInput,
          @product_id : String,
          @client_token : String? = nil,
          @expiration_date : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct PutDeploymentParameterResponse
        include JSON::Serializable

        # The unique identifier of the agreement.

        @[JSON::Field(key: "agreementId")]
        getter agreement_id : String

        # The unique identifier of the deployment parameter.

        @[JSON::Field(key: "deploymentParameterId")]
        getter deployment_parameter_id : String

        # The Amazon Resource Name (ARN) associated with the deployment parameter resource you want to create
        # or update.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A map of key-value pairs, where each pair represents a tag saved to the resource. Tags will only be
        # applied for create operations, and they'll be ignored if the resource already exists.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @agreement_id : String,
          @deployment_parameter_id : String,
          @resource_arn : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The specified resource wasn't found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The maximum number of requests per account has been exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the resource you want to tag.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A map of key-value pairs, where each pair represents a tag present on the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Too many requests.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the resource you want to remove the tag from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of key names of tags to be removed.

        @[JSON::Field(key: "tagKeys")]
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

      # An error occurred during validation.

      struct ValidationException
        include JSON::Serializable

        # The field name associated with the error.

        @[JSON::Field(key: "fieldName")]
        getter field_name : String


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @field_name : String,
          @message : String
        )
        end
      end
    end
  end
end
