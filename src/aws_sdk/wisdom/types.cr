require "json"
require "time"

module AwsSdk
  module Wisdom
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

      # Configuration information for Amazon AppIntegrations to automatically ingest content.
      struct AppIntegrationsConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AppIntegrations DataIntegration to use for ingesting content.
        # For Salesforce , your AppIntegrations DataIntegration must have an ObjectConfiguration if
        # objectFields is not provided, including at least Id , ArticleNumber , VersionNumber , Title ,
        # PublishStatus , and IsDeleted as source fields. For ServiceNow , your AppIntegrations
        # DataIntegration must have an ObjectConfiguration if objectFields is not provided, including at least
        # number , short_description , sys_mod_count , workflow_state , and active as source fields. For
        # Zendesk , your AppIntegrations DataIntegration must have an ObjectConfiguration if objectFields is
        # not provided, including at least id , title , updated_at , and draft as source fields. For
        # SharePoint , your AppIntegrations DataIntegration must have a FileConfiguration, including only file
        # extensions that are among docx , pdf , html , htm , and txt . For Amazon S3 , the
        # ObjectConfiguration and FileConfiguration of your AppIntegrations DataIntegration must be null. The
        # SourceURI of your DataIntegration must use the following format: s3://your_s3_bucket_name . The
        # bucket policy of the corresponding S3 bucket must allow the Amazon Web Services principal
        # app-integrations.amazonaws.com to perform s3:ListBucket , s3:GetObject , and s3:GetBucketLocation
        # against the bucket.
        @[JSON::Field(key: "appIntegrationArn")]
        getter app_integration_arn : String

        # The fields from the source that are made available to your agents in Wisdom. Optional if
        # ObjectConfiguration is included in the provided DataIntegration. For Salesforce , you must include
        # at least Id , ArticleNumber , VersionNumber , Title , PublishStatus , and IsDeleted . For ServiceNow
        # , you must include at least number , short_description , sys_mod_count , workflow_state , and active
        # . For Zendesk , you must include at least id , title , updated_at , and draft . Make sure to include
        # additional fields. These fields are indexed and used to source recommendations.
        @[JSON::Field(key: "objectFields")]
        getter object_fields : Array(String)?

        def initialize(
          @app_integration_arn : String,
          @object_fields : Array(String)? = nil
        )
        end
      end

      # Information about the assistant association.
      struct AssistantAssociationData
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Wisdom assistant.
        @[JSON::Field(key: "assistantArn")]
        getter assistant_arn : String

        # The Amazon Resource Name (ARN) of the assistant association.
        @[JSON::Field(key: "assistantAssociationArn")]
        getter assistant_association_arn : String

        # The identifier of the assistant association.
        @[JSON::Field(key: "assistantAssociationId")]
        getter assistant_association_id : String

        # The identifier of the Wisdom assistant.
        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # A union type that currently has a single argument, the knowledge base ID.
        @[JSON::Field(key: "associationData")]
        getter association_data : Types::AssistantAssociationOutputData

        # The type of association.
        @[JSON::Field(key: "associationType")]
        getter association_type : String

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @assistant_arn : String,
          @assistant_association_arn : String,
          @assistant_association_id : String,
          @assistant_id : String,
          @association_data : Types::AssistantAssociationOutputData,
          @association_type : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The data that is input into Wisdom as a result of the assistant association.
      struct AssistantAssociationInputData
        include JSON::Serializable

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String?

        def initialize(
          @knowledge_base_id : String? = nil
        )
        end
      end

      # The data that is output as a result of the assistant association.
      struct AssistantAssociationOutputData
        include JSON::Serializable

        # The knowledge base where output data is sent.
        @[JSON::Field(key: "knowledgeBaseAssociation")]
        getter knowledge_base_association : Types::KnowledgeBaseAssociationData?

        def initialize(
          @knowledge_base_association : Types::KnowledgeBaseAssociationData? = nil
        )
        end
      end

      # Summary information about the assistant association.
      struct AssistantAssociationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Wisdom assistant.
        @[JSON::Field(key: "assistantArn")]
        getter assistant_arn : String

        # The Amazon Resource Name (ARN) of the assistant association.
        @[JSON::Field(key: "assistantAssociationArn")]
        getter assistant_association_arn : String

        # The identifier of the assistant association.
        @[JSON::Field(key: "assistantAssociationId")]
        getter assistant_association_id : String

        # The identifier of the Wisdom assistant.
        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The association data.
        @[JSON::Field(key: "associationData")]
        getter association_data : Types::AssistantAssociationOutputData

        # The type of association.
        @[JSON::Field(key: "associationType")]
        getter association_type : String

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @assistant_arn : String,
          @assistant_association_arn : String,
          @assistant_association_id : String,
          @assistant_id : String,
          @association_data : Types::AssistantAssociationOutputData,
          @association_type : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The assistant data.
      struct AssistantData
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Wisdom assistant.
        @[JSON::Field(key: "assistantArn")]
        getter assistant_arn : String

        # The identifier of the Wisdom assistant.
        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The name.
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the assistant.
        @[JSON::Field(key: "status")]
        getter status : String

        # The type of assistant.
        @[JSON::Field(key: "type")]
        getter type : String

        # The description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration information for the Wisdom assistant integration.
        @[JSON::Field(key: "integrationConfiguration")]
        getter integration_configuration : Types::AssistantIntegrationConfiguration?

        # The configuration information for the customer managed key used for encryption. This KMS key must
        # have a policy that allows kms:CreateGrant , kms:DescribeKey , and kms:Decrypt/kms:GenerateDataKey
        # permissions to the IAM identity using the key to invoke Wisdom. To use Wisdom with chat, the key
        # policy must also allow kms:Decrypt , kms:GenerateDataKey* , and kms:DescribeKey permissions to the
        # connect.amazonaws.com service principal. For more information about setting up a customer managed
        # key for Wisdom, see Enable Amazon Connect Wisdom for your instance .
        @[JSON::Field(key: "serverSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @assistant_arn : String,
          @assistant_id : String,
          @name : String,
          @status : String,
          @type : String,
          @description : String? = nil,
          @integration_configuration : Types::AssistantIntegrationConfiguration? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The configuration information for the Wisdom assistant integration.
      struct AssistantIntegrationConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the integrated Amazon SNS topic used for streaming chat messages.
        @[JSON::Field(key: "topicIntegrationArn")]
        getter topic_integration_arn : String?

        def initialize(
          @topic_integration_arn : String? = nil
        )
        end
      end

      # Summary information about the assistant.
      struct AssistantSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Wisdom assistant.
        @[JSON::Field(key: "assistantArn")]
        getter assistant_arn : String

        # The identifier of the Wisdom assistant.
        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The name of the assistant.
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the assistant.
        @[JSON::Field(key: "status")]
        getter status : String

        # The type of the assistant.
        @[JSON::Field(key: "type")]
        getter type : String

        # The description of the assistant.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration information for the Wisdom assistant integration.
        @[JSON::Field(key: "integrationConfiguration")]
        getter integration_configuration : Types::AssistantIntegrationConfiguration?

        # The configuration information for the customer managed key used for encryption. This KMS key must
        # have a policy that allows kms:CreateGrant , kms:DescribeKey , and kms:Decrypt/kms:GenerateDataKey
        # permissions to the IAM identity using the key to invoke Wisdom. To use Wisdom with chat, the key
        # policy must also allow kms:Decrypt , kms:GenerateDataKey* , and kms:DescribeKey permissions to the
        # connect.amazonaws.com service principal. For more information about setting up a customer managed
        # key for Wisdom, see Enable Amazon Connect Wisdom for your instance .
        @[JSON::Field(key: "serverSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @assistant_arn : String,
          @assistant_id : String,
          @name : String,
          @status : String,
          @type : String,
          @description : String? = nil,
          @integration_configuration : Types::AssistantIntegrationConfiguration? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The configuration information of the external data source.
      struct Configuration
        include JSON::Serializable

        # The configuration information of the Amazon Connect data source.
        @[JSON::Field(key: "connectConfiguration")]
        getter connect_configuration : Types::ConnectConfiguration?

        def initialize(
          @connect_configuration : Types::ConnectConfiguration? = nil
        )
        end
      end

      # The request could not be processed because of conflict in the current state of the resource. For
      # example, if you're using a Create API (such as CreateAssistant ) that accepts name, a conflicting
      # resource (usually with the same name) is being created or mutated.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration information of the Amazon Connect data source.
      struct ConnectConfiguration
        include JSON::Serializable

        # The identifier of the Amazon Connect instance. You can find the instanceId in the ARN of the
        # instance.
        @[JSON::Field(key: "instanceId")]
        getter instance_id : String?

        def initialize(
          @instance_id : String? = nil
        )
        end
      end

      # Information about the content.
      struct ContentData
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the content.
        @[JSON::Field(key: "contentArn")]
        getter content_arn : String

        # The identifier of the content.
        @[JSON::Field(key: "contentId")]
        getter content_id : String

        # The media type of the content.
        @[JSON::Field(key: "contentType")]
        getter content_type : String

        # The Amazon Resource Name (ARN) of the knowledge base.
        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # A key/value map to store attributes without affecting tagging or recommendations. For example, when
        # synchronizing data between an external system and Wisdom, you can store an external version
        # identifier as metadata to utilize for determining drift.
        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)

        # The name of the content.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the content revision.
        @[JSON::Field(key: "revisionId")]
        getter revision_id : String

        # The status of the content.
        @[JSON::Field(key: "status")]
        getter status : String

        # The title of the content.
        @[JSON::Field(key: "title")]
        getter title : String

        # The URL of the content.
        @[JSON::Field(key: "url")]
        getter url : String

        # The expiration time of the URL as an epoch timestamp.
        @[JSON::Field(key: "urlExpiry")]
        getter url_expiry : Time

        # The URI of the content.
        @[JSON::Field(key: "linkOutUri")]
        getter link_out_uri : String?

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @content_arn : String,
          @content_id : String,
          @content_type : String,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @metadata : Hash(String, String),
          @name : String,
          @revision_id : String,
          @status : String,
          @title : String,
          @url : String,
          @url_expiry : Time,
          @link_out_uri : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Reference information about the content.
      struct ContentReference
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the content.
        @[JSON::Field(key: "contentArn")]
        getter content_arn : String?

        # The identifier of the content.
        @[JSON::Field(key: "contentId")]
        getter content_id : String?

        # The Amazon Resource Name (ARN) of the knowledge base.
        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String?

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String?

        def initialize(
          @content_arn : String? = nil,
          @content_id : String? = nil,
          @knowledge_base_arn : String? = nil,
          @knowledge_base_id : String? = nil
        )
        end
      end

      # Summary information about the content.
      struct ContentSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the content.
        @[JSON::Field(key: "contentArn")]
        getter content_arn : String

        # The identifier of the content.
        @[JSON::Field(key: "contentId")]
        getter content_id : String

        # The media type of the content.
        @[JSON::Field(key: "contentType")]
        getter content_type : String

        # The Amazon Resource Name (ARN) of the knowledge base.
        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # A key/value map to store attributes without affecting tagging or recommendations. For example, when
        # synchronizing data between an external system and Wisdom, you can store an external version
        # identifier as metadata to utilize for determining drift.
        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)

        # The name of the content.
        @[JSON::Field(key: "name")]
        getter name : String

        # The identifier of the revision of the content.
        @[JSON::Field(key: "revisionId")]
        getter revision_id : String

        # The status of the content.
        @[JSON::Field(key: "status")]
        getter status : String

        # The title of the content.
        @[JSON::Field(key: "title")]
        getter title : String

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @content_arn : String,
          @content_id : String,
          @content_type : String,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @metadata : Hash(String, String),
          @name : String,
          @revision_id : String,
          @status : String,
          @title : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateAssistantAssociationRequest
        include JSON::Serializable

        # The identifier of the Wisdom assistant. Can be either the ID or the ARN. URLs cannot contain the
        # ARN.
        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The identifier of the associated resource.
        @[JSON::Field(key: "association")]
        getter association : Types::AssistantAssociationInputData

        # The type of association.
        @[JSON::Field(key: "associationType")]
        getter association_type : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @assistant_id : String,
          @association : Types::AssistantAssociationInputData,
          @association_type : String,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateAssistantAssociationResponse
        include JSON::Serializable

        # The assistant association.
        @[JSON::Field(key: "assistantAssociation")]
        getter assistant_association : Types::AssistantAssociationData?

        def initialize(
          @assistant_association : Types::AssistantAssociationData? = nil
        )
        end
      end

      struct CreateAssistantRequest
        include JSON::Serializable

        # The name of the assistant.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of assistant.
        @[JSON::Field(key: "type")]
        getter type : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the assistant.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration information for the customer managed key used for encryption. The customer managed
        # key must have a policy that allows kms:CreateGrant , kms:DescribeKey , and
        # kms:Decrypt/kms:GenerateDataKey permissions to the IAM identity using the key to invoke Wisdom. To
        # use Wisdom with chat, the key policy must also allow kms:Decrypt , kms:GenerateDataKey* , and
        # kms:DescribeKey permissions to the connect.amazonaws.com service principal. For more information
        # about setting up a customer managed key for Wisdom, see Enable Amazon Connect Wisdom for your
        # instance .
        @[JSON::Field(key: "serverSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @type : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateAssistantResponse
        include JSON::Serializable

        # Information about the assistant.
        @[JSON::Field(key: "assistant")]
        getter assistant : Types::AssistantData?

        def initialize(
          @assistant : Types::AssistantData? = nil
        )
        end
      end

      struct CreateContentRequest
        include JSON::Serializable

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The name of the content. Each piece of content in a knowledge base must have a unique name. You can
        # retrieve a piece of content using only its knowledge base and its name with the SearchContent API.
        @[JSON::Field(key: "name")]
        getter name : String

        # A pointer to the uploaded asset. This value is returned by StartContentUpload .
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A key/value map to store attributes without affecting tagging or recommendations. For example, when
        # synchronizing data between an external system and Wisdom, you can store an external version
        # identifier as metadata to utilize for determining drift.
        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)?

        # The URI you want to use for the article. If the knowledge base has a templateUri, setting this
        # argument overrides it for this piece of content.
        @[JSON::Field(key: "overrideLinkOutUri")]
        getter override_link_out_uri : String?

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The title of the content. If not set, the title is equal to the name.
        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @knowledge_base_id : String,
          @name : String,
          @upload_id : String,
          @client_token : String? = nil,
          @metadata : Hash(String, String)? = nil,
          @override_link_out_uri : String? = nil,
          @tags : Hash(String, String)? = nil,
          @title : String? = nil
        )
        end
      end

      struct CreateContentResponse
        include JSON::Serializable

        # The content.
        @[JSON::Field(key: "content")]
        getter content : Types::ContentData?

        def initialize(
          @content : Types::ContentData? = nil
        )
        end
      end

      struct CreateKnowledgeBaseRequest
        include JSON::Serializable

        # The type of knowledge base. Only CUSTOM knowledge bases allow you to upload your own content.
        # EXTERNAL knowledge bases support integrations with third-party systems whose content is synchronized
        # automatically.
        @[JSON::Field(key: "knowledgeBaseType")]
        getter knowledge_base_type : String

        # The name of the knowledge base.
        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Information about how to render the content.
        @[JSON::Field(key: "renderingConfiguration")]
        getter rendering_configuration : Types::RenderingConfiguration?

        # The configuration information for the customer managed key used for encryption. This KMS key must
        # have a policy that allows kms:CreateGrant , kms:DescribeKey , and kms:Decrypt/kms:GenerateDataKey
        # permissions to the IAM identity using the key to invoke Wisdom. For more information about setting
        # up a customer managed key for Wisdom, see Enable Amazon Connect Wisdom for your instance .
        @[JSON::Field(key: "serverSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # The source of the knowledge base content. Only set this argument for EXTERNAL knowledge bases.
        @[JSON::Field(key: "sourceConfiguration")]
        getter source_configuration : Types::SourceConfiguration?

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @knowledge_base_type : String,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @rendering_configuration : Types::RenderingConfiguration? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @source_configuration : Types::SourceConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateKnowledgeBaseResponse
        include JSON::Serializable

        # The knowledge base.
        @[JSON::Field(key: "knowledgeBase")]
        getter knowledge_base : Types::KnowledgeBaseData?

        def initialize(
          @knowledge_base : Types::KnowledgeBaseData? = nil
        )
        end
      end

      struct CreateQuickResponseRequest
        include JSON::Serializable

        # The content of the quick response.
        @[JSON::Field(key: "content")]
        getter content : Types::QuickResponseDataProvider

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The name of the quick response.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Connect channels this quick response applies to.
        @[JSON::Field(key: "channels")]
        getter channels : Array(String)?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The media type of the quick response content. Use application/x.quickresponse;format=plain for a
        # quick response written in plain text. Use application/x.quickresponse;format=markdown for a quick
        # response written in richtext.
        @[JSON::Field(key: "contentType")]
        getter content_type : String?

        # The description of the quick response.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration information of the user groups that the quick response is accessible to.
        @[JSON::Field(key: "groupingConfiguration")]
        getter grouping_configuration : Types::GroupingConfiguration?

        # Whether the quick response is active.
        @[JSON::Field(key: "isActive")]
        getter is_active : Bool?

        # The language code value for the language in which the quick response is written. The supported
        # language codes include de_DE , en_US , es_ES , fr_FR , id_ID , it_IT , ja_JP , ko_KR , pt_BR , zh_CN
        # , zh_TW
        @[JSON::Field(key: "language")]
        getter language : String?

        # The shortcut key of the quick response. The value should be unique across the knowledge base.
        @[JSON::Field(key: "shortcutKey")]
        getter shortcut_key : String?

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @content : Types::QuickResponseDataProvider,
          @knowledge_base_id : String,
          @name : String,
          @channels : Array(String)? = nil,
          @client_token : String? = nil,
          @content_type : String? = nil,
          @description : String? = nil,
          @grouping_configuration : Types::GroupingConfiguration? = nil,
          @is_active : Bool? = nil,
          @language : String? = nil,
          @shortcut_key : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateQuickResponseResponse
        include JSON::Serializable

        # The quick response.
        @[JSON::Field(key: "quickResponse")]
        getter quick_response : Types::QuickResponseData?

        def initialize(
          @quick_response : Types::QuickResponseData? = nil
        )
        end
      end

      struct CreateSessionRequest
        include JSON::Serializable

        # The identifier of the Wisdom assistant. Can be either the ID or the ARN. URLs cannot contain the
        # ARN.
        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The name of the session.
        @[JSON::Field(key: "name")]
        getter name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @assistant_id : String,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateSessionResponse
        include JSON::Serializable

        # The session.
        @[JSON::Field(key: "session")]
        getter session : Types::SessionData?

        def initialize(
          @session : Types::SessionData? = nil
        )
        end
      end

      struct DeleteAssistantAssociationRequest
        include JSON::Serializable

        # The identifier of the assistant association. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.
        @[JSON::Field(key: "assistantAssociationId")]
        getter assistant_association_id : String

        # The identifier of the Wisdom assistant. Can be either the ID or the ARN. URLs cannot contain the
        # ARN.
        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        def initialize(
          @assistant_association_id : String,
          @assistant_id : String
        )
        end
      end

      struct DeleteAssistantAssociationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteAssistantRequest
        include JSON::Serializable

        # The identifier of the Wisdom assistant. Can be either the ID or the ARN. URLs cannot contain the
        # ARN.
        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        def initialize(
          @assistant_id : String
        )
        end
      end

      struct DeleteAssistantResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteContentRequest
        include JSON::Serializable

        # The identifier of the content. Can be either the ID or the ARN. URLs cannot contain the ARN.
        @[JSON::Field(key: "contentId")]
        getter content_id : String

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @content_id : String,
          @knowledge_base_id : String
        )
        end
      end

      struct DeleteContentResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteImportJobRequest
        include JSON::Serializable

        # The identifier of the import job to be deleted.
        @[JSON::Field(key: "importJobId")]
        getter import_job_id : String

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @import_job_id : String,
          @knowledge_base_id : String
        )
        end
      end

      struct DeleteImportJobResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteKnowledgeBaseRequest
        include JSON::Serializable

        # The knowledge base to delete content from. Can be either the ID or the ARN. URLs cannot contain the
        # ARN.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @knowledge_base_id : String
        )
        end
      end

      struct DeleteKnowledgeBaseResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteQuickResponseRequest
        include JSON::Serializable

        # The knowledge base from which the quick response is deleted. The identifier of the knowledge base.
        # This should not be a QUICK_RESPONSES type knowledge base if you're storing Wisdom Content resource
        # to it.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The identifier of the quick response to delete.
        @[JSON::Field(key: "quickResponseId")]
        getter quick_response_id : String

        def initialize(
          @knowledge_base_id : String,
          @quick_response_id : String
        )
        end
      end

      struct DeleteQuickResponseResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The document.
      struct Document
        include JSON::Serializable

        # A reference to the content resource.
        @[JSON::Field(key: "contentReference")]
        getter content_reference : Types::ContentReference

        # The excerpt from the document.
        @[JSON::Field(key: "excerpt")]
        getter excerpt : Types::DocumentText?

        # The title of the document.
        @[JSON::Field(key: "title")]
        getter title : Types::DocumentText?

        def initialize(
          @content_reference : Types::ContentReference,
          @excerpt : Types::DocumentText? = nil,
          @title : Types::DocumentText? = nil
        )
        end
      end

      # The text of the document.
      struct DocumentText
        include JSON::Serializable

        # Highlights in the document text.
        @[JSON::Field(key: "highlights")]
        getter highlights : Array(Types::Highlight)?

        # Text in the document.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @highlights : Array(Types::Highlight)? = nil,
          @text : String? = nil
        )
        end
      end

      # The configuration information of the external data source.
      struct ExternalSourceConfiguration
        include JSON::Serializable

        # The configuration information of the external data source.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::Configuration

        # The type of the external data source.
        @[JSON::Field(key: "source")]
        getter source : String

        def initialize(
          @configuration : Types::Configuration,
          @source : String
        )
        end
      end

      # A search filter.
      struct Filter
        include JSON::Serializable

        # The field on which to filter.
        @[JSON::Field(key: "field")]
        getter field : String

        # The operator to use for comparing the field’s value with the provided value.
        @[JSON::Field(key: "operator")]
        getter operator : String

        # The desired field value on which to filter.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @field : String,
          @operator : String,
          @value : String
        )
        end
      end

      struct GetAssistantAssociationRequest
        include JSON::Serializable

        # The identifier of the assistant association. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.
        @[JSON::Field(key: "assistantAssociationId")]
        getter assistant_association_id : String

        # The identifier of the Wisdom assistant. Can be either the ID or the ARN. URLs cannot contain the
        # ARN.
        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        def initialize(
          @assistant_association_id : String,
          @assistant_id : String
        )
        end
      end

      struct GetAssistantAssociationResponse
        include JSON::Serializable

        # The assistant association.
        @[JSON::Field(key: "assistantAssociation")]
        getter assistant_association : Types::AssistantAssociationData?

        def initialize(
          @assistant_association : Types::AssistantAssociationData? = nil
        )
        end
      end

      struct GetAssistantRequest
        include JSON::Serializable

        # The identifier of the Wisdom assistant. Can be either the ID or the ARN. URLs cannot contain the
        # ARN.
        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        def initialize(
          @assistant_id : String
        )
        end
      end

      struct GetAssistantResponse
        include JSON::Serializable

        # Information about the assistant.
        @[JSON::Field(key: "assistant")]
        getter assistant : Types::AssistantData?

        def initialize(
          @assistant : Types::AssistantData? = nil
        )
        end
      end

      struct GetContentRequest
        include JSON::Serializable

        # The identifier of the content. Can be either the ID or the ARN. URLs cannot contain the ARN.
        @[JSON::Field(key: "contentId")]
        getter content_id : String

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @content_id : String,
          @knowledge_base_id : String
        )
        end
      end

      struct GetContentResponse
        include JSON::Serializable

        # The content.
        @[JSON::Field(key: "content")]
        getter content : Types::ContentData?

        def initialize(
          @content : Types::ContentData? = nil
        )
        end
      end

      struct GetContentSummaryRequest
        include JSON::Serializable

        # The identifier of the content. Can be either the ID or the ARN. URLs cannot contain the ARN.
        @[JSON::Field(key: "contentId")]
        getter content_id : String

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @content_id : String,
          @knowledge_base_id : String
        )
        end
      end

      struct GetContentSummaryResponse
        include JSON::Serializable

        # The content summary.
        @[JSON::Field(key: "contentSummary")]
        getter content_summary : Types::ContentSummary?

        def initialize(
          @content_summary : Types::ContentSummary? = nil
        )
        end
      end

      struct GetImportJobRequest
        include JSON::Serializable

        # The identifier of the import job to retrieve.
        @[JSON::Field(key: "importJobId")]
        getter import_job_id : String

        # The identifier of the knowledge base that the import job belongs to.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @import_job_id : String,
          @knowledge_base_id : String
        )
        end
      end

      struct GetImportJobResponse
        include JSON::Serializable

        # The import job.
        @[JSON::Field(key: "importJob")]
        getter import_job : Types::ImportJobData?

        def initialize(
          @import_job : Types::ImportJobData? = nil
        )
        end
      end

      struct GetKnowledgeBaseRequest
        include JSON::Serializable

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @knowledge_base_id : String
        )
        end
      end

      struct GetKnowledgeBaseResponse
        include JSON::Serializable

        # The knowledge base.
        @[JSON::Field(key: "knowledgeBase")]
        getter knowledge_base : Types::KnowledgeBaseData?

        def initialize(
          @knowledge_base : Types::KnowledgeBaseData? = nil
        )
        end
      end

      struct GetQuickResponseRequest
        include JSON::Serializable

        # The identifier of the knowledge base. This should be a QUICK_RESPONSES type knowledge base.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The identifier of the quick response.
        @[JSON::Field(key: "quickResponseId")]
        getter quick_response_id : String

        def initialize(
          @knowledge_base_id : String,
          @quick_response_id : String
        )
        end
      end

      struct GetQuickResponseResponse
        include JSON::Serializable

        # The quick response.
        @[JSON::Field(key: "quickResponse")]
        getter quick_response : Types::QuickResponseData?

        def initialize(
          @quick_response : Types::QuickResponseData? = nil
        )
        end
      end

      struct GetRecommendationsRequest
        include JSON::Serializable

        # The identifier of the Wisdom assistant. Can be either the ID or the ARN. URLs cannot contain the
        # ARN.
        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The identifier of the session. Can be either the ID or the ARN. URLs cannot contain the ARN.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The duration (in seconds) for which the call waits for a recommendation to be made available before
        # returning. If a recommendation is available, the call returns sooner than WaitTimeSeconds . If no
        # messages are available and the wait time expires, the call returns successfully with an empty list.
        @[JSON::Field(key: "waitTimeSeconds")]
        getter wait_time_seconds : Int32?

        def initialize(
          @assistant_id : String,
          @session_id : String,
          @max_results : Int32? = nil,
          @wait_time_seconds : Int32? = nil
        )
        end
      end

      struct GetRecommendationsResponse
        include JSON::Serializable

        # The recommendations.
        @[JSON::Field(key: "recommendations")]
        getter recommendations : Array(Types::RecommendationData)

        # The triggers corresponding to recommendations.
        @[JSON::Field(key: "triggers")]
        getter triggers : Array(Types::RecommendationTrigger)?

        def initialize(
          @recommendations : Array(Types::RecommendationData),
          @triggers : Array(Types::RecommendationTrigger)? = nil
        )
        end
      end

      struct GetSessionRequest
        include JSON::Serializable

        # The identifier of the Wisdom assistant. Can be either the ID or the ARN. URLs cannot contain the
        # ARN.
        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The identifier of the session. Can be either the ID or the ARN. URLs cannot contain the ARN.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @assistant_id : String,
          @session_id : String
        )
        end
      end

      struct GetSessionResponse
        include JSON::Serializable

        # The session.
        @[JSON::Field(key: "session")]
        getter session : Types::SessionData?

        def initialize(
          @session : Types::SessionData? = nil
        )
        end
      end

      # The configuration information of the grouping of Wisdom users.
      struct GroupingConfiguration
        include JSON::Serializable

        # The criteria used for grouping Wisdom users. The following is the list of supported criteria values.
        # RoutingProfileArn : Grouping the users by their Amazon Connect routing profile ARN . User should
        # have SearchRoutingProfile and DescribeRoutingProfile permissions when setting criteria to this
        # value.
        @[JSON::Field(key: "criteria")]
        getter criteria : String?

        # The list of values that define different groups of Wisdom users. When setting criteria to
        # RoutingProfileArn , you need to provide a list of ARNs of Amazon Connect routing profiles as values
        # of this parameter.
        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @criteria : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Offset specification to describe highlighting of document excerpts for rendering search results and
      # recommendations.
      struct Highlight
        include JSON::Serializable

        # The offset for the start of the highlight.
        @[JSON::Field(key: "beginOffsetInclusive")]
        getter begin_offset_inclusive : Int32?

        # The offset for the end of the highlight.
        @[JSON::Field(key: "endOffsetExclusive")]
        getter end_offset_exclusive : Int32?

        def initialize(
          @begin_offset_inclusive : Int32? = nil,
          @end_offset_exclusive : Int32? = nil
        )
        end
      end

      # Summary information about the import job.
      struct ImportJobData
        include JSON::Serializable

        # The timestamp when the import job was created.
        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The identifier of the import job.
        @[JSON::Field(key: "importJobId")]
        getter import_job_id : String

        # The type of the import job.
        @[JSON::Field(key: "importJobType")]
        getter import_job_type : String

        # The Amazon Resource Name (ARN) of the knowledge base.
        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The timestamp when the import job data was last modified.
        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The status of the import job.
        @[JSON::Field(key: "status")]
        getter status : String

        # A pointer to the uploaded asset. This value is returned by StartContentUpload .
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The download link to the resource file that is uploaded to the import job.
        @[JSON::Field(key: "url")]
        getter url : String

        # The expiration time of the URL as an epoch timestamp.
        @[JSON::Field(key: "urlExpiry")]
        getter url_expiry : Time

        @[JSON::Field(key: "externalSourceConfiguration")]
        getter external_source_configuration : Types::ExternalSourceConfiguration?

        # The link to donwload the information of resource data that failed to be imported.
        @[JSON::Field(key: "failedRecordReport")]
        getter failed_record_report : String?

        # The metadata fields of the imported Wisdom resources.
        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)?

        def initialize(
          @created_time : Time,
          @import_job_id : String,
          @import_job_type : String,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @last_modified_time : Time,
          @status : String,
          @upload_id : String,
          @url : String,
          @url_expiry : Time,
          @external_source_configuration : Types::ExternalSourceConfiguration? = nil,
          @failed_record_report : String? = nil,
          @metadata : Hash(String, String)? = nil
        )
        end
      end

      # Summary information about the import job.
      struct ImportJobSummary
        include JSON::Serializable

        # The timestamp when the import job was created.
        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The identifier of the import job.
        @[JSON::Field(key: "importJobId")]
        getter import_job_id : String

        # The type of import job.
        @[JSON::Field(key: "importJobType")]
        getter import_job_type : String

        # The Amazon Resource Name (ARN) of the knowledge base.
        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The timestamp when the import job was last modified.
        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The status of the import job.
        @[JSON::Field(key: "status")]
        getter status : String

        # A pointer to the uploaded asset. This value is returned by StartContentUpload .
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The configuration information of the external source that the resource data are imported from.
        @[JSON::Field(key: "externalSourceConfiguration")]
        getter external_source_configuration : Types::ExternalSourceConfiguration?

        # The metadata fields of the imported Wisdom resources.
        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)?

        def initialize(
          @created_time : Time,
          @import_job_id : String,
          @import_job_type : String,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @last_modified_time : Time,
          @status : String,
          @upload_id : String,
          @external_source_configuration : Types::ExternalSourceConfiguration? = nil,
          @metadata : Hash(String, String)? = nil
        )
        end
      end

      # Association information about the knowledge base.
      struct KnowledgeBaseAssociationData
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the knowledge base.
        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String?

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String?

        def initialize(
          @knowledge_base_arn : String? = nil,
          @knowledge_base_id : String? = nil
        )
        end
      end

      # Information about the knowledge base.
      struct KnowledgeBaseData
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the knowledge base.
        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The type of knowledge base.
        @[JSON::Field(key: "knowledgeBaseType")]
        getter knowledge_base_type : String

        # The name of the knowledge base.
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the knowledge base.
        @[JSON::Field(key: "status")]
        getter status : String

        # The description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # An epoch timestamp indicating the most recent content modification inside the knowledge base. If no
        # content exists in a knowledge base, this value is unset.
        @[JSON::Field(key: "lastContentModificationTime")]
        getter last_content_modification_time : Time?

        # Information about how to render the content.
        @[JSON::Field(key: "renderingConfiguration")]
        getter rendering_configuration : Types::RenderingConfiguration?

        # The configuration information for the customer managed key used for encryption. This KMS key must
        # have a policy that allows kms:CreateGrant , kms:DescribeKey , and kms:Decrypt/kms:GenerateDataKey
        # permissions to the IAM identity using the key to invoke Wisdom. For more information about setting
        # up a customer managed key for Wisdom, see Enable Amazon Connect Wisdom for your instance .
        @[JSON::Field(key: "serverSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # Source configuration information about the knowledge base.
        @[JSON::Field(key: "sourceConfiguration")]
        getter source_configuration : Types::SourceConfiguration?

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @knowledge_base_type : String,
          @name : String,
          @status : String,
          @description : String? = nil,
          @last_content_modification_time : Time? = nil,
          @rendering_configuration : Types::RenderingConfiguration? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @source_configuration : Types::SourceConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Summary information about the knowledge base.
      struct KnowledgeBaseSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the knowledge base.
        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The type of knowledge base.
        @[JSON::Field(key: "knowledgeBaseType")]
        getter knowledge_base_type : String

        # The name of the knowledge base.
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the knowledge base summary.
        @[JSON::Field(key: "status")]
        getter status : String

        # The description of the knowledge base.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Information about how to render the content.
        @[JSON::Field(key: "renderingConfiguration")]
        getter rendering_configuration : Types::RenderingConfiguration?

        # The configuration information for the customer managed key used for encryption. This KMS key must
        # have a policy that allows kms:CreateGrant , kms:DescribeKey , kms:Decrypt/kms:GenerateDataKey
        # permissions to the IAM identity using the key to invoke Wisdom. For more information about setting
        # up a customer managed key for Wisdom, see Enable Amazon Connect Wisdom for your instance .
        @[JSON::Field(key: "serverSideEncryptionConfiguration")]
        getter server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration?

        # Configuration information about the external data source.
        @[JSON::Field(key: "sourceConfiguration")]
        getter source_configuration : Types::SourceConfiguration?

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @knowledge_base_type : String,
          @name : String,
          @status : String,
          @description : String? = nil,
          @rendering_configuration : Types::RenderingConfiguration? = nil,
          @server_side_encryption_configuration : Types::ServerSideEncryptionConfiguration? = nil,
          @source_configuration : Types::SourceConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ListAssistantAssociationsRequest
        include JSON::Serializable

        # The identifier of the Wisdom assistant. Can be either the ID or the ARN. URLs cannot contain the
        # ARN.
        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assistant_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAssistantAssociationsResponse
        include JSON::Serializable

        # Summary information about assistant associations.
        @[JSON::Field(key: "assistantAssociationSummaries")]
        getter assistant_association_summaries : Array(Types::AssistantAssociationSummary)

        # If there are additional results, this is the token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assistant_association_summaries : Array(Types::AssistantAssociationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListAssistantsRequest
        include JSON::Serializable

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAssistantsResponse
        include JSON::Serializable

        # Information about the assistants.
        @[JSON::Field(key: "assistantSummaries")]
        getter assistant_summaries : Array(Types::AssistantSummary)

        # If there are additional results, this is the token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assistant_summaries : Array(Types::AssistantSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListContentsRequest
        include JSON::Serializable

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @knowledge_base_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListContentsResponse
        include JSON::Serializable

        # Information about the content.
        @[JSON::Field(key: "contentSummaries")]
        getter content_summaries : Array(Types::ContentSummary)

        # If there are additional results, this is the token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @content_summaries : Array(Types::ContentSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListImportJobsRequest
        include JSON::Serializable

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @knowledge_base_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListImportJobsResponse
        include JSON::Serializable

        # Summary information about the import jobs.
        @[JSON::Field(key: "importJobSummaries")]
        getter import_job_summaries : Array(Types::ImportJobSummary)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @import_job_summaries : Array(Types::ImportJobSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListKnowledgeBasesRequest
        include JSON::Serializable

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListKnowledgeBasesResponse
        include JSON::Serializable

        # Information about the knowledge bases.
        @[JSON::Field(key: "knowledgeBaseSummaries")]
        getter knowledge_base_summaries : Array(Types::KnowledgeBaseSummary)

        # If there are additional results, this is the token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @knowledge_base_summaries : Array(Types::KnowledgeBaseSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListQuickResponsesRequest
        include JSON::Serializable

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @knowledge_base_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListQuickResponsesResponse
        include JSON::Serializable

        # Summary information about the quick responses.
        @[JSON::Field(key: "quickResponseSummaries")]
        getter quick_response_summaries : Array(Types::QuickResponseSummary)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @quick_response_summaries : Array(Types::QuickResponseSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # An error occurred when creating a recommendation.
      struct NotifyRecommendationsReceivedError
        include JSON::Serializable

        # A recommendation is causing an error.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The identifier of the recommendation that is in error.
        @[JSON::Field(key: "recommendationId")]
        getter recommendation_id : String?

        def initialize(
          @message : String? = nil,
          @recommendation_id : String? = nil
        )
        end
      end

      struct NotifyRecommendationsReceivedRequest
        include JSON::Serializable

        # The identifier of the Wisdom assistant. Can be either the ID or the ARN. URLs cannot contain the
        # ARN.
        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The identifiers of the recommendations.
        @[JSON::Field(key: "recommendationIds")]
        getter recommendation_ids : Array(String)

        # The identifier of the session. Can be either the ID or the ARN. URLs cannot contain the ARN.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @assistant_id : String,
          @recommendation_ids : Array(String),
          @session_id : String
        )
        end
      end

      struct NotifyRecommendationsReceivedResponse
        include JSON::Serializable

        # The identifiers of recommendations that are causing errors.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::NotifyRecommendationsReceivedError)?

        # The identifiers of the recommendations.
        @[JSON::Field(key: "recommendationIds")]
        getter recommendation_ids : Array(String)?

        def initialize(
          @errors : Array(Types::NotifyRecommendationsReceivedError)? = nil,
          @recommendation_ids : Array(String)? = nil
        )
        end
      end

      # The provided revisionId does not match, indicating the content has been modified since it was last
      # read.
      struct PreconditionFailedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct QueryAssistantRequest
        include JSON::Serializable

        # The identifier of the Wisdom assistant. Can be either the ID or the ARN. URLs cannot contain the
        # ARN.
        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The text to search for.
        @[JSON::Field(key: "queryText")]
        getter query_text : String

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assistant_id : String,
          @query_text : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct QueryAssistantResponse
        include JSON::Serializable

        # The results of the query.
        @[JSON::Field(key: "results")]
        getter results : Array(Types::ResultData)

        # If there are additional results, this is the token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @results : Array(Types::ResultData),
          @next_token : String? = nil
        )
        end
      end

      # Data associated with the QUERY RecommendationTriggerType.
      struct QueryRecommendationTriggerData
        include JSON::Serializable

        # The text associated with the recommendation trigger.
        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @text : String? = nil
        )
        end
      end

      # The container quick response content.
      struct QuickResponseContentProvider
        include JSON::Serializable

        # The content of the quick response.
        @[JSON::Field(key: "content")]
        getter content : String?

        def initialize(
          @content : String? = nil
        )
        end
      end

      # The content of the quick response stored in different media types.
      struct QuickResponseContents
        include JSON::Serializable

        @[JSON::Field(key: "markdown")]
        getter markdown : Types::QuickResponseContentProvider?

        @[JSON::Field(key: "plainText")]
        getter plain_text : Types::QuickResponseContentProvider?

        def initialize(
          @markdown : Types::QuickResponseContentProvider? = nil,
          @plain_text : Types::QuickResponseContentProvider? = nil
        )
        end
      end

      # Information about the quick response.
      struct QuickResponseData
        include JSON::Serializable

        # The media type of the quick response content. Use application/x.quickresponse;format=plain for quick
        # response written in plain text. Use application/x.quickresponse;format=markdown for quick response
        # written in richtext.
        @[JSON::Field(key: "contentType")]
        getter content_type : String

        # The timestamp when the quick response was created.
        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The Amazon Resource Name (ARN) of the knowledge base.
        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The timestamp when the quick response data was last modified.
        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The name of the quick response.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the quick response.
        @[JSON::Field(key: "quickResponseArn")]
        getter quick_response_arn : String

        # The identifier of the quick response.
        @[JSON::Field(key: "quickResponseId")]
        getter quick_response_id : String

        # The status of the quick response data.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Connect contact channels this quick response applies to. The supported contact channel
        # types include Chat .
        @[JSON::Field(key: "channels")]
        getter channels : Array(String)?

        # The contents of the quick response.
        @[JSON::Field(key: "contents")]
        getter contents : Types::QuickResponseContents?

        # The description of the quick response.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration information of the user groups that the quick response is accessible to.
        @[JSON::Field(key: "groupingConfiguration")]
        getter grouping_configuration : Types::GroupingConfiguration?

        # Whether the quick response is active.
        @[JSON::Field(key: "isActive")]
        getter is_active : Bool?

        # The language code value for the language in which the quick response is written.
        @[JSON::Field(key: "language")]
        getter language : String?

        # The Amazon Resource Name (ARN) of the user who last updated the quick response data.
        @[JSON::Field(key: "lastModifiedBy")]
        getter last_modified_by : String?

        # The shortcut key of the quick response. The value should be unique across the knowledge base.
        @[JSON::Field(key: "shortcutKey")]
        getter shortcut_key : String?

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @content_type : String,
          @created_time : Time,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @last_modified_time : Time,
          @name : String,
          @quick_response_arn : String,
          @quick_response_id : String,
          @status : String,
          @channels : Array(String)? = nil,
          @contents : Types::QuickResponseContents? = nil,
          @description : String? = nil,
          @grouping_configuration : Types::GroupingConfiguration? = nil,
          @is_active : Bool? = nil,
          @language : String? = nil,
          @last_modified_by : String? = nil,
          @shortcut_key : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The container of quick response data.
      struct QuickResponseDataProvider
        include JSON::Serializable

        # The content of the quick response.
        @[JSON::Field(key: "content")]
        getter content : String?

        def initialize(
          @content : String? = nil
        )
        end
      end

      # The quick response fields to filter the quick response query results by. The following is the list
      # of supported field names. name description shortcutKey isActive channels language contentType
      # createdTime lastModifiedTime lastModifiedBy groupingConfiguration.criteria
      # groupingConfiguration.values
      struct QuickResponseFilterField
        include JSON::Serializable

        # The name of the attribute field to filter the quick responses by.
        @[JSON::Field(key: "name")]
        getter name : String

        # The operator to use for filtering.
        @[JSON::Field(key: "operator")]
        getter operator : String

        # Whether to treat null value as a match for the attribute field.
        @[JSON::Field(key: "includeNoExistence")]
        getter include_no_existence : Bool?

        # The values of attribute field to filter the quick response by.
        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String,
          @operator : String,
          @include_no_existence : Bool? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # The quick response fields to order the quick response query results by. The following is the list of
      # supported field names. name description shortcutKey isActive channels language contentType
      # createdTime lastModifiedTime lastModifiedBy groupingConfiguration.criteria
      # groupingConfiguration.values
      struct QuickResponseOrderField
        include JSON::Serializable

        # The name of the attribute to order the quick response query results by.
        @[JSON::Field(key: "name")]
        getter name : String

        # The order at which the quick responses are sorted by.
        @[JSON::Field(key: "order")]
        getter order : String?

        def initialize(
          @name : String,
          @order : String? = nil
        )
        end
      end

      # The quick response fields to query quick responses by. The following is the list of supported field
      # names. content name description shortcutKey
      struct QuickResponseQueryField
        include JSON::Serializable

        # The name of the attribute to query the quick responses by.
        @[JSON::Field(key: "name")]
        getter name : String

        # The operator to use for matching attribute field values in the query.
        @[JSON::Field(key: "operator")]
        getter operator : String

        # The values of the attribute to query the quick responses by.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        # Whether the query expects only exact matches on the attribute field values. The results of the query
        # will only include exact matches if this parameter is set to false.
        @[JSON::Field(key: "allowFuzziness")]
        getter allow_fuzziness : Bool?

        # The importance of the attribute field when calculating query result relevancy scores. The value set
        # for this parameter affects the ordering of search results.
        @[JSON::Field(key: "priority")]
        getter priority : String?

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String),
          @allow_fuzziness : Bool? = nil,
          @priority : String? = nil
        )
        end
      end

      # Information about the import job.
      struct QuickResponseSearchExpression
        include JSON::Serializable

        # The configuration of filtering rules applied to quick response query results.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::QuickResponseFilterField)?

        # The quick response attribute fields on which the query results are ordered.
        @[JSON::Field(key: "orderOnField")]
        getter order_on_field : Types::QuickResponseOrderField?

        # The quick response query expressions.
        @[JSON::Field(key: "queries")]
        getter queries : Array(Types::QuickResponseQueryField)?

        def initialize(
          @filters : Array(Types::QuickResponseFilterField)? = nil,
          @order_on_field : Types::QuickResponseOrderField? = nil,
          @queries : Array(Types::QuickResponseQueryField)? = nil
        )
        end
      end

      # The result of quick response search.
      struct QuickResponseSearchResultData
        include JSON::Serializable

        # The media type of the quick response content. Use application/x.quickresponse;format=plain for quick
        # response written in plain text. Use application/x.quickresponse;format=markdown for quick response
        # written in richtext.
        @[JSON::Field(key: "contentType")]
        getter content_type : String

        # The contents of the quick response.
        @[JSON::Field(key: "contents")]
        getter contents : Types::QuickResponseContents

        # The timestamp when the quick response was created.
        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # Whether the quick response is active.
        @[JSON::Field(key: "isActive")]
        getter is_active : Bool

        # The Amazon Resource Name (ARN) of the knowledge base.
        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The timestamp when the quick response search result data was last modified.
        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The name of the quick response.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the quick response.
        @[JSON::Field(key: "quickResponseArn")]
        getter quick_response_arn : String

        # The identifier of the quick response.
        @[JSON::Field(key: "quickResponseId")]
        getter quick_response_id : String

        # The resource status of the quick response.
        @[JSON::Field(key: "status")]
        getter status : String

        # The user defined contact attributes that are resolved when the search result is returned.
        @[JSON::Field(key: "attributesInterpolated")]
        getter attributes_interpolated : Array(String)?

        # The user defined contact attributes that are not resolved when the search result is returned.
        @[JSON::Field(key: "attributesNotInterpolated")]
        getter attributes_not_interpolated : Array(String)?

        # The Amazon Connect contact channels this quick response applies to. The supported contact channel
        # types include Chat .
        @[JSON::Field(key: "channels")]
        getter channels : Array(String)?

        # The description of the quick response.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration information of the user groups that the quick response is accessible to.
        @[JSON::Field(key: "groupingConfiguration")]
        getter grouping_configuration : Types::GroupingConfiguration?

        # The language code value for the language in which the quick response is written.
        @[JSON::Field(key: "language")]
        getter language : String?

        # The Amazon Resource Name (ARN) of the user who last updated the quick response search result data.
        @[JSON::Field(key: "lastModifiedBy")]
        getter last_modified_by : String?

        # The shortcut key of the quick response. The value should be unique across the knowledge base.
        @[JSON::Field(key: "shortcutKey")]
        getter shortcut_key : String?

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @content_type : String,
          @contents : Types::QuickResponseContents,
          @created_time : Time,
          @is_active : Bool,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @last_modified_time : Time,
          @name : String,
          @quick_response_arn : String,
          @quick_response_id : String,
          @status : String,
          @attributes_interpolated : Array(String)? = nil,
          @attributes_not_interpolated : Array(String)? = nil,
          @channels : Array(String)? = nil,
          @description : String? = nil,
          @grouping_configuration : Types::GroupingConfiguration? = nil,
          @language : String? = nil,
          @last_modified_by : String? = nil,
          @shortcut_key : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The summary information about the quick response.
      struct QuickResponseSummary
        include JSON::Serializable

        # The media type of the quick response content. Use application/x.quickresponse;format=plain for quick
        # response written in plain text. Use application/x.quickresponse;format=markdown for quick response
        # written in richtext.
        @[JSON::Field(key: "contentType")]
        getter content_type : String

        # The timestamp when the quick response was created.
        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The Amazon Resource Name (ARN) of the knowledge base.
        @[JSON::Field(key: "knowledgeBaseArn")]
        getter knowledge_base_arn : String

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The timestamp when the quick response summary was last modified.
        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Time

        # The name of the quick response.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the quick response.
        @[JSON::Field(key: "quickResponseArn")]
        getter quick_response_arn : String

        # The identifier of the quick response.
        @[JSON::Field(key: "quickResponseId")]
        getter quick_response_id : String

        # The resource status of the quick response.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Connect contact channels this quick response applies to. The supported contact channel
        # types include Chat .
        @[JSON::Field(key: "channels")]
        getter channels : Array(String)?

        # The description of the quick response.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Whether the quick response is active.
        @[JSON::Field(key: "isActive")]
        getter is_active : Bool?

        # The Amazon Resource Name (ARN) of the user who last updated the quick response data.
        @[JSON::Field(key: "lastModifiedBy")]
        getter last_modified_by : String?

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @content_type : String,
          @created_time : Time,
          @knowledge_base_arn : String,
          @knowledge_base_id : String,
          @last_modified_time : Time,
          @name : String,
          @quick_response_arn : String,
          @quick_response_id : String,
          @status : String,
          @channels : Array(String)? = nil,
          @description : String? = nil,
          @is_active : Bool? = nil,
          @last_modified_by : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Information about the recommendation.
      struct RecommendationData
        include JSON::Serializable

        # The recommended document.
        @[JSON::Field(key: "document")]
        getter document : Types::Document

        # The identifier of the recommendation.
        @[JSON::Field(key: "recommendationId")]
        getter recommendation_id : String

        # The relevance level of the recommendation.
        @[JSON::Field(key: "relevanceLevel")]
        getter relevance_level : String?

        # The relevance score of the recommendation.
        @[JSON::Field(key: "relevanceScore")]
        getter relevance_score : Float64?

        # The type of recommendation.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @document : Types::Document,
          @recommendation_id : String,
          @relevance_level : String? = nil,
          @relevance_score : Float64? = nil,
          @type : String? = nil
        )
        end
      end

      # A recommendation trigger provides context on the event that produced the referenced recommendations.
      # Recommendations are only referenced in recommendationIds by a single RecommendationTrigger.
      struct RecommendationTrigger
        include JSON::Serializable

        # A union type containing information related to the trigger.
        @[JSON::Field(key: "data")]
        getter data : Types::RecommendationTriggerData

        # The identifier of the recommendation trigger.
        @[JSON::Field(key: "id")]
        getter id : String

        # The identifiers of the recommendations.
        @[JSON::Field(key: "recommendationIds")]
        getter recommendation_ids : Array(String)

        # The source of the recommendation trigger. ISSUE_DETECTION: The corresponding recommendations were
        # triggered by a Contact Lens issue. RULE_EVALUATION: The corresponding recommendations were triggered
        # by a Contact Lens rule.
        @[JSON::Field(key: "source")]
        getter source : String

        # The type of recommendation trigger.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @data : Types::RecommendationTriggerData,
          @id : String,
          @recommendation_ids : Array(String),
          @source : String,
          @type : String
        )
        end
      end

      # A union type containing information related to the trigger.
      struct RecommendationTriggerData
        include JSON::Serializable

        # Data associated with the QUERY RecommendationTriggerType.
        @[JSON::Field(key: "query")]
        getter query : Types::QueryRecommendationTriggerData?

        def initialize(
          @query : Types::QueryRecommendationTriggerData? = nil
        )
        end
      end

      struct RemoveKnowledgeBaseTemplateUriRequest
        include JSON::Serializable

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        def initialize(
          @knowledge_base_id : String
        )
        end
      end

      struct RemoveKnowledgeBaseTemplateUriResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Information about how to render the content.
      struct RenderingConfiguration
        include JSON::Serializable

        # A URI template containing exactly one variable in ${variableName} format. This can only be set for
        # EXTERNAL knowledge bases. For Salesforce, ServiceNow, and Zendesk, the variable must be one of the
        # following: Salesforce: Id , ArticleNumber , VersionNumber , Title , PublishStatus , or IsDeleted
        # ServiceNow: number , short_description , sys_mod_count , workflow_state , or active Zendesk: id ,
        # title , updated_at , or draft The variable is replaced with the actual value for a piece of content
        # when calling GetContent .
        @[JSON::Field(key: "templateUri")]
        getter template_uri : String?

        def initialize(
          @template_uri : String? = nil
        )
        end
      end

      # The request reached the service more than 15 minutes after the date stamp on the request or more
      # than 15 minutes after the request expiration date (such as for pre-signed URLs), or the date stamp
      # on the request is more than 15 minutes in the future.
      struct RequestTimeoutException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource does not exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The specified resource name.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # Information about the result.
      struct ResultData
        include JSON::Serializable

        # The document.
        @[JSON::Field(key: "document")]
        getter document : Types::Document

        # The identifier of the result data.
        @[JSON::Field(key: "resultId")]
        getter result_id : String

        # The relevance score of the results.
        @[JSON::Field(key: "relevanceScore")]
        getter relevance_score : Float64?

        def initialize(
          @document : Types::Document,
          @result_id : String,
          @relevance_score : Float64? = nil
        )
        end
      end

      struct SearchContentRequest
        include JSON::Serializable

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The search expression to filter results.
        @[JSON::Field(key: "searchExpression")]
        getter search_expression : Types::SearchExpression

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @knowledge_base_id : String,
          @search_expression : Types::SearchExpression,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct SearchContentResponse
        include JSON::Serializable

        # Summary information about the content.
        @[JSON::Field(key: "contentSummaries")]
        getter content_summaries : Array(Types::ContentSummary)

        # If there are additional results, this is the token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @content_summaries : Array(Types::ContentSummary),
          @next_token : String? = nil
        )
        end
      end

      # The search expression.
      struct SearchExpression
        include JSON::Serializable

        # The search expression filters.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::Filter)

        def initialize(
          @filters : Array(Types::Filter)
        )
        end
      end

      struct SearchQuickResponsesRequest
        include JSON::Serializable

        # The identifier of the knowledge base. This should be a QUICK_RESPONSES type knowledge base. Can be
        # either the ID or the ARN. URLs cannot contain the ARN.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The search expression for querying the quick response.
        @[JSON::Field(key: "searchExpression")]
        getter search_expression : Types::QuickResponseSearchExpression

        # The user-defined Amazon Connect contact attributes to be resolved when search results are returned.
        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @knowledge_base_id : String,
          @search_expression : Types::QuickResponseSearchExpression,
          @attributes : Hash(String, String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct SearchQuickResponsesResponse
        include JSON::Serializable

        # The results of the quick response search.
        @[JSON::Field(key: "results")]
        getter results : Array(Types::QuickResponseSearchResultData)

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @results : Array(Types::QuickResponseSearchResultData),
          @next_token : String? = nil
        )
        end
      end

      struct SearchSessionsRequest
        include JSON::Serializable

        # The identifier of the Wisdom assistant. Can be either the ID or the ARN. URLs cannot contain the
        # ARN.
        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The search expression to filter results.
        @[JSON::Field(key: "searchExpression")]
        getter search_expression : Types::SearchExpression

        # The maximum number of results to return per page.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results. Use the value returned in the previous response in the next
        # request to retrieve the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @assistant_id : String,
          @search_expression : Types::SearchExpression,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct SearchSessionsResponse
        include JSON::Serializable

        # Summary information about the sessions.
        @[JSON::Field(key: "sessionSummaries")]
        getter session_summaries : Array(Types::SessionSummary)

        # If there are additional results, this is the token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @session_summaries : Array(Types::SessionSummary),
          @next_token : String? = nil
        )
        end
      end

      # The configuration information for the customer managed key used for encryption.
      struct ServerSideEncryptionConfiguration
        include JSON::Serializable

        # The customer managed key used for encryption. For more information about setting up a customer
        # managed key for Wisdom, see Enable Amazon Connect Wisdom for your instance . For information about
        # valid ID values, see Key identifiers (KeyId) .
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @kms_key_id : String? = nil
        )
        end
      end

      # You've exceeded your service quota. To perform the requested action, remove some of the relevant
      # resources, or use service quotas to request a service quota increase.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about the session.
      struct SessionData
        include JSON::Serializable

        # The name of the session.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the session.
        @[JSON::Field(key: "sessionArn")]
        getter session_arn : String

        # The identifier of the session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The description of the session.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The configuration information for the session integration.
        @[JSON::Field(key: "integrationConfiguration")]
        getter integration_configuration : Types::SessionIntegrationConfiguration?

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @session_arn : String,
          @session_id : String,
          @description : String? = nil,
          @integration_configuration : Types::SessionIntegrationConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The configuration information for the session integration.
      struct SessionIntegrationConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the integrated Amazon SNS topic used for streaming chat messages.
        @[JSON::Field(key: "topicIntegrationArn")]
        getter topic_integration_arn : String?

        def initialize(
          @topic_integration_arn : String? = nil
        )
        end
      end

      # Summary information about the session.
      struct SessionSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Wisdom assistant.
        @[JSON::Field(key: "assistantArn")]
        getter assistant_arn : String

        # The identifier of the Wisdom assistant.
        @[JSON::Field(key: "assistantId")]
        getter assistant_id : String

        # The Amazon Resource Name (ARN) of the session.
        @[JSON::Field(key: "sessionArn")]
        getter session_arn : String

        # The identifier of the session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @assistant_arn : String,
          @assistant_id : String,
          @session_arn : String,
          @session_id : String
        )
        end
      end

      # Configuration information about the external data source.
      struct SourceConfiguration
        include JSON::Serializable

        # Configuration information for Amazon AppIntegrations to automatically ingest content.
        @[JSON::Field(key: "appIntegrations")]
        getter app_integrations : Types::AppIntegrationsConfiguration?

        def initialize(
          @app_integrations : Types::AppIntegrationsConfiguration? = nil
        )
        end
      end

      struct StartContentUploadRequest
        include JSON::Serializable

        # The type of content to upload.
        @[JSON::Field(key: "contentType")]
        getter content_type : String

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The expected expiration time of the generated presigned URL, specified in minutes.
        @[JSON::Field(key: "presignedUrlTimeToLive")]
        getter presigned_url_time_to_live : Int32?

        def initialize(
          @content_type : String,
          @knowledge_base_id : String,
          @presigned_url_time_to_live : Int32? = nil
        )
        end
      end

      struct StartContentUploadResponse
        include JSON::Serializable

        # The headers to include in the upload.
        @[JSON::Field(key: "headersToInclude")]
        getter headers_to_include : Hash(String, String)

        # The identifier of the upload.
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The URL of the upload.
        @[JSON::Field(key: "url")]
        getter url : String

        # The expiration time of the URL as an epoch timestamp.
        @[JSON::Field(key: "urlExpiry")]
        getter url_expiry : Time

        def initialize(
          @headers_to_include : Hash(String, String),
          @upload_id : String,
          @url : String,
          @url_expiry : Time
        )
        end
      end

      struct StartImportJobRequest
        include JSON::Serializable

        # The type of the import job. For importing quick response resource, set the value to QUICK_RESPONSES
        # .
        @[JSON::Field(key: "importJobType")]
        getter import_job_type : String

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it. Can be either the ID or the ARN. URLs cannot contain
        # the ARN. For importing Wisdom quick responses, this should be a QUICK_RESPONSES type knowledge base.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # A pointer to the uploaded asset. This value is returned by StartContentUpload .
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The configuration information of the external source that the resource data are imported from.
        @[JSON::Field(key: "externalSourceConfiguration")]
        getter external_source_configuration : Types::ExternalSourceConfiguration?

        # The metadata fields of the imported Wisdom resources.
        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)?

        def initialize(
          @import_job_type : String,
          @knowledge_base_id : String,
          @upload_id : String,
          @client_token : String? = nil,
          @external_source_configuration : Types::ExternalSourceConfiguration? = nil,
          @metadata : Hash(String, String)? = nil
        )
        end
      end

      struct StartImportJobResponse
        include JSON::Serializable

        # The import job.
        @[JSON::Field(key: "importJob")]
        getter import_job : Types::ImportJobData?

        def initialize(
          @import_job : Types::ImportJobData? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags used to organize, track, or control access for this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Amazon Connect Wisdom throws this exception if you have too many tags in your tag set.
      struct TooManyTagsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The specified resource name.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys.
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

      struct UpdateContentRequest
        include JSON::Serializable

        # The identifier of the content. Can be either the ID or the ARN. URLs cannot contain the ARN.
        @[JSON::Field(key: "contentId")]
        getter content_id : String

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it. Can be either the ID or the ARN
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # A key/value map to store attributes without affecting tagging or recommendations. For example, when
        # synchronizing data between an external system and Wisdom, you can store an external version
        # identifier as metadata to utilize for determining drift.
        @[JSON::Field(key: "metadata")]
        getter metadata : Hash(String, String)?

        # The URI for the article. If the knowledge base has a templateUri, setting this argument overrides it
        # for this piece of content. To remove an existing overrideLinkOurUri , exclude this argument and set
        # removeOverrideLinkOutUri to true.
        @[JSON::Field(key: "overrideLinkOutUri")]
        getter override_link_out_uri : String?

        # Unset the existing overrideLinkOutUri if it exists.
        @[JSON::Field(key: "removeOverrideLinkOutUri")]
        getter remove_override_link_out_uri : Bool?

        # The revisionId of the content resource to update, taken from an earlier call to GetContent ,
        # GetContentSummary , SearchContent , or ListContents . If included, this argument acts as an
        # optimistic lock to ensure content was not modified since it was last read. If it has been modified,
        # this API throws a PreconditionFailedException .
        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        # The title of the content.
        @[JSON::Field(key: "title")]
        getter title : String?

        # A pointer to the uploaded asset. This value is returned by StartContentUpload .
        @[JSON::Field(key: "uploadId")]
        getter upload_id : String?

        def initialize(
          @content_id : String,
          @knowledge_base_id : String,
          @metadata : Hash(String, String)? = nil,
          @override_link_out_uri : String? = nil,
          @remove_override_link_out_uri : Bool? = nil,
          @revision_id : String? = nil,
          @title : String? = nil,
          @upload_id : String? = nil
        )
        end
      end

      struct UpdateContentResponse
        include JSON::Serializable

        # The content.
        @[JSON::Field(key: "content")]
        getter content : Types::ContentData?

        def initialize(
          @content : Types::ContentData? = nil
        )
        end
      end

      struct UpdateKnowledgeBaseTemplateUriRequest
        include JSON::Serializable

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The template URI to update.
        @[JSON::Field(key: "templateUri")]
        getter template_uri : String

        def initialize(
          @knowledge_base_id : String,
          @template_uri : String
        )
        end
      end

      struct UpdateKnowledgeBaseTemplateUriResponse
        include JSON::Serializable

        # The knowledge base to update.
        @[JSON::Field(key: "knowledgeBase")]
        getter knowledge_base : Types::KnowledgeBaseData?

        def initialize(
          @knowledge_base : Types::KnowledgeBaseData? = nil
        )
        end
      end

      struct UpdateQuickResponseRequest
        include JSON::Serializable

        # The identifier of the knowledge base. This should not be a QUICK_RESPONSES type knowledge base if
        # you're storing Wisdom Content resource to it. Can be either the ID or the ARN. URLs cannot contain
        # the ARN.
        @[JSON::Field(key: "knowledgeBaseId")]
        getter knowledge_base_id : String

        # The identifier of the quick response.
        @[JSON::Field(key: "quickResponseId")]
        getter quick_response_id : String

        # The Amazon Connect contact channels this quick response applies to. The supported contact channel
        # types include Chat .
        @[JSON::Field(key: "channels")]
        getter channels : Array(String)?

        # The updated content of the quick response.
        @[JSON::Field(key: "content")]
        getter content : Types::QuickResponseDataProvider?

        # The media type of the quick response content. Use application/x.quickresponse;format=plain for quick
        # response written in plain text. Use application/x.quickresponse;format=markdown for quick response
        # written in richtext.
        @[JSON::Field(key: "contentType")]
        getter content_type : String?

        # The updated description of the quick response.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The updated grouping configuration of the quick response.
        @[JSON::Field(key: "groupingConfiguration")]
        getter grouping_configuration : Types::GroupingConfiguration?

        # Whether the quick response is active.
        @[JSON::Field(key: "isActive")]
        getter is_active : Bool?

        # The language code value for the language in which the quick response is written. The supported
        # language codes include de_DE , en_US , es_ES , fr_FR , id_ID , it_IT , ja_JP , ko_KR , pt_BR , zh_CN
        # , zh_TW
        @[JSON::Field(key: "language")]
        getter language : String?

        # The name of the quick response.
        @[JSON::Field(key: "name")]
        getter name : String?

        # Whether to remove the description from the quick response.
        @[JSON::Field(key: "removeDescription")]
        getter remove_description : Bool?

        # Whether to remove the grouping configuration of the quick response.
        @[JSON::Field(key: "removeGroupingConfiguration")]
        getter remove_grouping_configuration : Bool?

        # Whether to remove the shortcut key of the quick response.
        @[JSON::Field(key: "removeShortcutKey")]
        getter remove_shortcut_key : Bool?

        # The shortcut key of the quick response. The value should be unique across the knowledge base.
        @[JSON::Field(key: "shortcutKey")]
        getter shortcut_key : String?

        def initialize(
          @knowledge_base_id : String,
          @quick_response_id : String,
          @channels : Array(String)? = nil,
          @content : Types::QuickResponseDataProvider? = nil,
          @content_type : String? = nil,
          @description : String? = nil,
          @grouping_configuration : Types::GroupingConfiguration? = nil,
          @is_active : Bool? = nil,
          @language : String? = nil,
          @name : String? = nil,
          @remove_description : Bool? = nil,
          @remove_grouping_configuration : Bool? = nil,
          @remove_shortcut_key : Bool? = nil,
          @shortcut_key : String? = nil
        )
        end
      end

      struct UpdateQuickResponseResponse
        include JSON::Serializable

        # The quick response.
        @[JSON::Field(key: "quickResponse")]
        getter quick_response : Types::QuickResponseData?

        def initialize(
          @quick_response : Types::QuickResponseData? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by a service.
      struct ValidationException
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
