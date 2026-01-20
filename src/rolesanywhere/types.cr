require "json"
require "time"

module Aws
  module RolesAnywhere
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

      # A mapping applied to the authenticating end-entity certificate.

      struct AttributeMapping
        include JSON::Serializable

        # Fields (x509Subject, x509Issuer and x509SAN) within X.509 certificates.

        @[JSON::Field(key: "certificateField")]
        getter certificate_field : String?

        # A list of mapping entries for every supported specifier or sub-field.

        @[JSON::Field(key: "mappingRules")]
        getter mapping_rules : Array(Types::MappingRule)?

        def initialize(
          @certificate_field : String? = nil,
          @mapping_rules : Array(Types::MappingRule)? = nil
        )
        end
      end


      struct CreateProfileRequest
        include JSON::Serializable

        # The name of the profile.

        @[JSON::Field(key: "name")]
        getter name : String

        # A list of IAM roles that this profile can assume in a temporary credential request.

        @[JSON::Field(key: "roleArns")]
        getter role_arns : Array(String)

        # Used to determine if a custom role session name will be accepted in a temporary credential request.

        @[JSON::Field(key: "acceptRoleSessionName")]
        getter accept_role_session_name : Bool?

        # Used to determine how long sessions vended using this profile are valid for. See the Expiration
        # section of the CreateSession API documentation page for more details. In requests, if this value is
        # not provided, the default value will be 3600.

        @[JSON::Field(key: "durationSeconds")]
        getter duration_seconds : Int32?

        # Specifies whether the profile is enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # A list of managed policy ARNs that apply to the vended session credentials.

        @[JSON::Field(key: "managedPolicyArns")]
        getter managed_policy_arns : Array(String)?

        # Unused, saved for future use. Will likely specify whether instance properties are required in
        # temporary credential requests with this profile.

        @[JSON::Field(key: "requireInstanceProperties")]
        getter require_instance_properties : Bool?

        # A session policy that applies to the trust boundary of the vended session credentials.

        @[JSON::Field(key: "sessionPolicy")]
        getter session_policy : String?

        # The tags to attach to the profile.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @role_arns : Array(String),
          @accept_role_session_name : Bool? = nil,
          @duration_seconds : Int32? = nil,
          @enabled : Bool? = nil,
          @managed_policy_arns : Array(String)? = nil,
          @require_instance_properties : Bool? = nil,
          @session_policy : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateTrustAnchorRequest
        include JSON::Serializable

        # The name of the trust anchor.

        @[JSON::Field(key: "name")]
        getter name : String

        # The trust anchor type and its related certificate data.

        @[JSON::Field(key: "source")]
        getter source : Types::Source

        # Specifies whether the trust anchor is enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # A list of notification settings to be associated to the trust anchor.

        @[JSON::Field(key: "notificationSettings")]
        getter notification_settings : Array(Types::NotificationSetting)?

        # The tags to attach to the trust anchor.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @source : Types::Source,
          @enabled : Bool? = nil,
          @notification_settings : Array(Types::NotificationSetting)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A record of a presented X509 credential from a temporary credential request.

      struct CredentialSummary
        include JSON::Serializable

        # Indicates whether the credential is enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # Indicates whether the temporary credential request was successful.

        @[JSON::Field(key: "failed")]
        getter failed : Bool?

        # The fully qualified domain name of the issuing certificate for the presented end-entity certificate.

        @[JSON::Field(key: "issuer")]
        getter issuer : String?

        # The ISO-8601 time stamp of when the certificate was last used in a temporary credential request.

        @[JSON::Field(key: "seenAt")]
        getter seen_at : Time?

        # The serial number of the certificate.

        @[JSON::Field(key: "serialNumber")]
        getter serial_number : String?

        # The PEM-encoded data of the certificate.

        @[JSON::Field(key: "x509CertificateData")]
        getter x509_certificate_data : String?

        def initialize(
          @enabled : Bool? = nil,
          @failed : Bool? = nil,
          @issuer : String? = nil,
          @seen_at : Time? = nil,
          @serial_number : String? = nil,
          @x509_certificate_data : String? = nil
        )
        end
      end

      # The state of the certificate revocation list (CRL) after a read or write operation.

      struct CrlDetail
        include JSON::Serializable

        # The ISO-8601 timestamp when the certificate revocation list (CRL) was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The ARN of the certificate revocation list (CRL).

        @[JSON::Field(key: "crlArn")]
        getter crl_arn : String?

        # The state of the certificate revocation list (CRL) after a read or write operation.

        @[JSON::Field(key: "crlData")]
        getter crl_data : Bytes?

        # The unique identifier of the certificate revocation list (CRL).

        @[JSON::Field(key: "crlId")]
        getter crl_id : String?

        # Indicates whether the certificate revocation list (CRL) is enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The name of the certificate revocation list (CRL).

        @[JSON::Field(key: "name")]
        getter name : String?

        # The ARN of the TrustAnchor the certificate revocation list (CRL) will provide revocation for.

        @[JSON::Field(key: "trustAnchorArn")]
        getter trust_anchor_arn : String?

        # The ISO-8601 timestamp when the certificate revocation list (CRL) was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @crl_arn : String? = nil,
          @crl_data : Bytes? = nil,
          @crl_id : String? = nil,
          @enabled : Bool? = nil,
          @name : String? = nil,
          @trust_anchor_arn : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct CrlDetailResponse
        include JSON::Serializable

        # The state of the certificate revocation list (CRL) after a read or write operation.

        @[JSON::Field(key: "crl")]
        getter crl : Types::CrlDetail

        def initialize(
          @crl : Types::CrlDetail
        )
        end
      end


      struct DeleteAttributeMappingRequest
        include JSON::Serializable

        # Fields (x509Subject, x509Issuer and x509SAN) within X.509 certificates.

        @[JSON::Field(key: "certificateField")]
        getter certificate_field : String

        # The unique identifier of the profile.

        @[JSON::Field(key: "profileId")]
        getter profile_id : String

        # A list of specifiers of a certificate field; for example, CN, OU, UID from a Subject.

        @[JSON::Field(key: "specifiers")]
        getter specifiers : Array(String)?

        def initialize(
          @certificate_field : String,
          @profile_id : String,
          @specifiers : Array(String)? = nil
        )
        end
      end


      struct DeleteAttributeMappingResponse
        include JSON::Serializable

        # The state of the profile after a read or write operation.

        @[JSON::Field(key: "profile")]
        getter profile : Types::ProfileDetail

        def initialize(
          @profile : Types::ProfileDetail
        )
        end
      end


      struct ImportCrlRequest
        include JSON::Serializable

        # The x509 v3 specified certificate revocation list (CRL).

        @[JSON::Field(key: "crlData")]
        getter crl_data : Bytes

        # The name of the certificate revocation list (CRL).

        @[JSON::Field(key: "name")]
        getter name : String

        # The ARN of the TrustAnchor the certificate revocation list (CRL) will provide revocation for.

        @[JSON::Field(key: "trustAnchorArn")]
        getter trust_anchor_arn : String

        # Specifies whether the certificate revocation list (CRL) is enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # A list of tags to attach to the certificate revocation list (CRL).

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @crl_data : Bytes,
          @name : String,
          @trust_anchor_arn : String,
          @enabled : Bool? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A key-value pair you set that identifies a property of the authenticating instance.

      struct InstanceProperty
        include JSON::Serializable

        # Indicates whether the temporary credential request was successful.

        @[JSON::Field(key: "failed")]
        getter failed : Bool?

        # A list of instanceProperty objects.

        @[JSON::Field(key: "properties")]
        getter properties : Hash(String, String)?

        # The ISO-8601 time stamp of when the certificate was last used in a temporary credential request.

        @[JSON::Field(key: "seenAt")]
        getter seen_at : Time?

        def initialize(
          @failed : Bool? = nil,
          @properties : Hash(String, String)? = nil,
          @seen_at : Time? = nil
        )
        end
      end


      struct ListCrlsResponse
        include JSON::Serializable

        # A list of certificate revocation lists (CRL).

        @[JSON::Field(key: "crls")]
        getter crls : Array(Types::CrlDetail)?

        # A token that indicates where the output should continue from, if a previous request did not show all
        # results. To get the next results, make the request again with this value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @crls : Array(Types::CrlDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListProfilesResponse
        include JSON::Serializable

        # A token that indicates where the output should continue from, if a previous request did not show all
        # results. To get the next results, make the request again with this value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of profiles.

        @[JSON::Field(key: "profiles")]
        getter profiles : Array(Types::ProfileDetail)?

        def initialize(
          @next_token : String? = nil,
          @profiles : Array(Types::ProfileDetail)? = nil
        )
        end
      end


      struct ListRequest
        include JSON::Serializable

        # A token that indicates where the output should continue from, if a previous request did not show all
        # results. To get the next results, make the request again with this value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The number of resources in the paginated list.

        @[JSON::Field(key: "pageSize")]
        getter page_size : Int32?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct ListSubjectsResponse
        include JSON::Serializable

        # A token that indicates where the output should continue from, if a previous request did not show all
        # results. To get the next results, make the request again with this value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of subjects.

        @[JSON::Field(key: "subjects")]
        getter subjects : Array(Types::SubjectSummary)?

        def initialize(
          @next_token : String? = nil,
          @subjects : Array(Types::SubjectSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A list of tags attached to the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListTrustAnchorsResponse
        include JSON::Serializable

        # A token that indicates where the output should continue from, if a previous request did not show all
        # results. To get the next results, make the request again with this value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of trust anchors.

        @[JSON::Field(key: "trustAnchors")]
        getter trust_anchors : Array(Types::TrustAnchorDetail)?

        def initialize(
          @next_token : String? = nil,
          @trust_anchors : Array(Types::TrustAnchorDetail)? = nil
        )
        end
      end

      # A single mapping entry for each supported specifier or sub-field.

      struct MappingRule
        include JSON::Serializable

        # Specifier within a certificate field, such as CN, OU, or UID from the Subject field.

        @[JSON::Field(key: "specifier")]
        getter specifier : String

        def initialize(
          @specifier : String
        )
        end
      end

      # Customizable notification settings that will be applied to notification events. IAM Roles Anywhere
      # consumes these settings while notifying across multiple channels - CloudWatch metrics, EventBridge,
      # and Health Dashboard.

      struct NotificationSetting
        include JSON::Serializable

        # Indicates whether the notification setting is enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # The event to which this notification setting is applied.

        @[JSON::Field(key: "event")]
        getter event : String

        # The specified channel of notification. IAM Roles Anywhere uses CloudWatch metrics, EventBridge, and
        # Health Dashboard to notify for an event. In the absence of a specific channel, IAM Roles Anywhere
        # applies this setting to 'ALL' channels.

        @[JSON::Field(key: "channel")]
        getter channel : String?

        # The number of days before a notification event. This value is required for a notification setting
        # that is enabled.

        @[JSON::Field(key: "threshold")]
        getter threshold : Int32?

        def initialize(
          @enabled : Bool,
          @event : String,
          @channel : String? = nil,
          @threshold : Int32? = nil
        )
        end
      end

      # The state of a notification setting. A notification setting includes information such as event name,
      # threshold, status of the notification setting, and the channel to notify.

      struct NotificationSettingDetail
        include JSON::Serializable

        # Indicates whether the notification setting is enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # The event to which this notification setting is applied.

        @[JSON::Field(key: "event")]
        getter event : String

        # The specified channel of notification. IAM Roles Anywhere uses CloudWatch metrics, EventBridge, and
        # Health Dashboard to notify for an event. In the absence of a specific channel, IAM Roles Anywhere
        # applies this setting to 'ALL' channels.

        @[JSON::Field(key: "channel")]
        getter channel : String?

        # The principal that configured the notification setting. For default settings configured by IAM Roles
        # Anywhere, the value is rolesanywhere.amazonaws.com , and for customized notifications settings, it
        # is the respective account ID.

        @[JSON::Field(key: "configuredBy")]
        getter configured_by : String?

        # The number of days before a notification event.

        @[JSON::Field(key: "threshold")]
        getter threshold : Int32?

        def initialize(
          @enabled : Bool,
          @event : String,
          @channel : String? = nil,
          @configured_by : String? = nil,
          @threshold : Int32? = nil
        )
        end
      end

      # A notification setting key to reset. A notification setting key includes the event and the channel.

      struct NotificationSettingKey
        include JSON::Serializable

        # The notification setting event to reset.

        @[JSON::Field(key: "event")]
        getter event : String

        # The specified channel of notification.

        @[JSON::Field(key: "channel")]
        getter channel : String?

        def initialize(
          @event : String,
          @channel : String? = nil
        )
        end
      end

      # The state of the profile after a read or write operation.

      struct ProfileDetail
        include JSON::Serializable

        # Used to determine if a custom role session name will be accepted in a temporary credential request.

        @[JSON::Field(key: "acceptRoleSessionName")]
        getter accept_role_session_name : Bool?

        # A mapping applied to the authenticating end-entity certificate.

        @[JSON::Field(key: "attributeMappings")]
        getter attribute_mappings : Array(Types::AttributeMapping)?

        # The ISO-8601 timestamp when the profile was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The Amazon Web Services account that created the profile.

        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # Used to determine how long sessions vended using this profile are valid for. See the Expiration
        # section of the CreateSession API documentation page for more details. In requests, if this value is
        # not provided, the default value will be 3600.

        @[JSON::Field(key: "durationSeconds")]
        getter duration_seconds : Int32?

        # Indicates whether the profile is enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # A list of managed policy ARNs that apply to the vended session credentials.

        @[JSON::Field(key: "managedPolicyArns")]
        getter managed_policy_arns : Array(String)?

        # The name of the profile.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The ARN of the profile.

        @[JSON::Field(key: "profileArn")]
        getter profile_arn : String?

        # The unique identifier of the profile.

        @[JSON::Field(key: "profileId")]
        getter profile_id : String?

        # Unused, saved for future use. Will likely specify whether instance properties are required in
        # temporary credential requests with this profile.

        @[JSON::Field(key: "requireInstanceProperties")]
        getter require_instance_properties : Bool?

        # A list of IAM roles that this profile can assume in a temporary credential request.

        @[JSON::Field(key: "roleArns")]
        getter role_arns : Array(String)?

        # A session policy that applies to the trust boundary of the vended session credentials.

        @[JSON::Field(key: "sessionPolicy")]
        getter session_policy : String?

        # The ISO-8601 timestamp when the profile was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @accept_role_session_name : Bool? = nil,
          @attribute_mappings : Array(Types::AttributeMapping)? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @duration_seconds : Int32? = nil,
          @enabled : Bool? = nil,
          @managed_policy_arns : Array(String)? = nil,
          @name : String? = nil,
          @profile_arn : String? = nil,
          @profile_id : String? = nil,
          @require_instance_properties : Bool? = nil,
          @role_arns : Array(String)? = nil,
          @session_policy : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct ProfileDetailResponse
        include JSON::Serializable

        # The state of the profile after a read or write operation.

        @[JSON::Field(key: "profile")]
        getter profile : Types::ProfileDetail?

        def initialize(
          @profile : Types::ProfileDetail? = nil
        )
        end
      end


      struct PutAttributeMappingRequest
        include JSON::Serializable

        # Fields (x509Subject, x509Issuer and x509SAN) within X.509 certificates.

        @[JSON::Field(key: "certificateField")]
        getter certificate_field : String

        # A list of mapping entries for every supported specifier or sub-field.

        @[JSON::Field(key: "mappingRules")]
        getter mapping_rules : Array(Types::MappingRule)

        # The unique identifier of the profile.

        @[JSON::Field(key: "profileId")]
        getter profile_id : String

        def initialize(
          @certificate_field : String,
          @mapping_rules : Array(Types::MappingRule),
          @profile_id : String
        )
        end
      end


      struct PutAttributeMappingResponse
        include JSON::Serializable

        # The state of the profile after a read or write operation.

        @[JSON::Field(key: "profile")]
        getter profile : Types::ProfileDetail

        def initialize(
          @profile : Types::ProfileDetail
        )
        end
      end


      struct PutNotificationSettingsRequest
        include JSON::Serializable

        # A list of notification settings to be associated to the trust anchor.

        @[JSON::Field(key: "notificationSettings")]
        getter notification_settings : Array(Types::NotificationSetting)

        # The unique identifier of the trust anchor.

        @[JSON::Field(key: "trustAnchorId")]
        getter trust_anchor_id : String

        def initialize(
          @notification_settings : Array(Types::NotificationSetting),
          @trust_anchor_id : String
        )
        end
      end


      struct PutNotificationSettingsResponse
        include JSON::Serializable


        @[JSON::Field(key: "trustAnchor")]
        getter trust_anchor : Types::TrustAnchorDetail

        def initialize(
          @trust_anchor : Types::TrustAnchorDetail
        )
        end
      end


      struct ResetNotificationSettingsRequest
        include JSON::Serializable

        # A list of notification setting keys to reset. A notification setting key includes the event and the
        # channel.

        @[JSON::Field(key: "notificationSettingKeys")]
        getter notification_setting_keys : Array(Types::NotificationSettingKey)

        # The unique identifier of the trust anchor.

        @[JSON::Field(key: "trustAnchorId")]
        getter trust_anchor_id : String

        def initialize(
          @notification_setting_keys : Array(Types::NotificationSettingKey),
          @trust_anchor_id : String
        )
        end
      end


      struct ResetNotificationSettingsResponse
        include JSON::Serializable


        @[JSON::Field(key: "trustAnchor")]
        getter trust_anchor : Types::TrustAnchorDetail

        def initialize(
          @trust_anchor : Types::TrustAnchorDetail
        )
        end
      end

      # The resource could not be found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ScalarCrlRequest
        include JSON::Serializable

        # The unique identifier of the certificate revocation list (CRL).

        @[JSON::Field(key: "crlId")]
        getter crl_id : String

        def initialize(
          @crl_id : String
        )
        end
      end


      struct ScalarProfileRequest
        include JSON::Serializable

        # The unique identifier of the profile.

        @[JSON::Field(key: "profileId")]
        getter profile_id : String

        def initialize(
          @profile_id : String
        )
        end
      end


      struct ScalarSubjectRequest
        include JSON::Serializable

        # The unique identifier of the subject.

        @[JSON::Field(key: "subjectId")]
        getter subject_id : String

        def initialize(
          @subject_id : String
        )
        end
      end


      struct ScalarTrustAnchorRequest
        include JSON::Serializable

        # The unique identifier of the trust anchor.

        @[JSON::Field(key: "trustAnchorId")]
        getter trust_anchor_id : String

        def initialize(
          @trust_anchor_id : String
        )
        end
      end

      # The trust anchor type and its related certificate data.

      struct Source
        include JSON::Serializable

        # The data field of the trust anchor depending on its type.

        @[JSON::Field(key: "sourceData")]
        getter source_data : Types::SourceData?

        # The type of the trust anchor.

        @[JSON::Field(key: "sourceType")]
        getter source_type : String?

        def initialize(
          @source_data : Types::SourceData? = nil,
          @source_type : String? = nil
        )
        end
      end

      # The data field of the trust anchor depending on its type.

      struct SourceData
        include JSON::Serializable

        # The root certificate of the Private Certificate Authority specified by this ARN is used in trust
        # validation for temporary credential requests. Included for trust anchors of type AWS_ACM_PCA .

        @[JSON::Field(key: "acmPcaArn")]
        getter acm_pca_arn : String?

        # The PEM-encoded data for the certificate anchor. Included for trust anchors of type
        # CERTIFICATE_BUNDLE .

        @[JSON::Field(key: "x509CertificateData")]
        getter x509_certificate_data : String?

        def initialize(
          @acm_pca_arn : String? = nil,
          @x509_certificate_data : String? = nil
        )
        end
      end

      # The state of the subject after a read or write operation.

      struct SubjectDetail
        include JSON::Serializable

        # The ISO-8601 timestamp when the subject was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The temporary session credentials vended at the last authenticating call with this subject.

        @[JSON::Field(key: "credentials")]
        getter credentials : Array(Types::CredentialSummary)?

        # The enabled status of the subject.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The specified instance properties associated with the request.

        @[JSON::Field(key: "instanceProperties")]
        getter instance_properties : Array(Types::InstanceProperty)?

        # The ISO-8601 timestamp of the last time this subject requested temporary session credentials.

        @[JSON::Field(key: "lastSeenAt")]
        getter last_seen_at : Time?

        # The ARN of the resource.

        @[JSON::Field(key: "subjectArn")]
        getter subject_arn : String?

        # The id of the resource

        @[JSON::Field(key: "subjectId")]
        getter subject_id : String?

        # The ISO-8601 timestamp when the subject was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The x509 principal identifier of the authenticating certificate.

        @[JSON::Field(key: "x509Subject")]
        getter x509_subject : String?

        def initialize(
          @created_at : Time? = nil,
          @credentials : Array(Types::CredentialSummary)? = nil,
          @enabled : Bool? = nil,
          @instance_properties : Array(Types::InstanceProperty)? = nil,
          @last_seen_at : Time? = nil,
          @subject_arn : String? = nil,
          @subject_id : String? = nil,
          @updated_at : Time? = nil,
          @x509_subject : String? = nil
        )
        end
      end


      struct SubjectDetailResponse
        include JSON::Serializable

        # The state of the subject after a read or write operation.

        @[JSON::Field(key: "subject")]
        getter subject : Types::SubjectDetail?

        def initialize(
          @subject : Types::SubjectDetail? = nil
        )
        end
      end

      # A summary representation of subjects.

      struct SubjectSummary
        include JSON::Serializable

        # The ISO-8601 time stamp of when the certificate was first used in a temporary credential request.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The enabled status of the subject.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The ISO-8601 time stamp of when the certificate was last used in a temporary credential request.

        @[JSON::Field(key: "lastSeenAt")]
        getter last_seen_at : Time?

        # The ARN of the resource.

        @[JSON::Field(key: "subjectArn")]
        getter subject_arn : String?

        # The id of the resource.

        @[JSON::Field(key: "subjectId")]
        getter subject_id : String?

        # The ISO-8601 timestamp when the subject was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The x509 principal identifier of the authenticating certificate.

        @[JSON::Field(key: "x509Subject")]
        getter x509_subject : String?

        def initialize(
          @created_at : Time? = nil,
          @enabled : Bool? = nil,
          @last_seen_at : Time? = nil,
          @subject_arn : String? = nil,
          @subject_id : String? = nil,
          @updated_at : Time? = nil,
          @x509_subject : String? = nil
        )
        end
      end

      # A label that consists of a key and value you define.

      struct Tag
        include JSON::Serializable

        # The tag key.

        @[JSON::Field(key: "key")]
        getter key : String

        # The tag value.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags to attach to the resource.

        @[JSON::Field(key: "tags")]
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

      # Too many tags.

      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The state of the trust anchor after a read or write operation.

      struct TrustAnchorDetail
        include JSON::Serializable

        # The ISO-8601 timestamp when the trust anchor was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # Indicates whether the trust anchor is enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The name of the trust anchor.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A list of notification settings to be associated to the trust anchor.

        @[JSON::Field(key: "notificationSettings")]
        getter notification_settings : Array(Types::NotificationSettingDetail)?

        # The trust anchor type and its related certificate data.

        @[JSON::Field(key: "source")]
        getter source : Types::Source?

        # The ARN of the trust anchor.

        @[JSON::Field(key: "trustAnchorArn")]
        getter trust_anchor_arn : String?

        # The unique identifier of the trust anchor.

        @[JSON::Field(key: "trustAnchorId")]
        getter trust_anchor_id : String?

        # The ISO-8601 timestamp when the trust anchor was last updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @created_at : Time? = nil,
          @enabled : Bool? = nil,
          @name : String? = nil,
          @notification_settings : Array(Types::NotificationSettingDetail)? = nil,
          @source : Types::Source? = nil,
          @trust_anchor_arn : String? = nil,
          @trust_anchor_id : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct TrustAnchorDetailResponse
        include JSON::Serializable

        # The state of the trust anchor after a read or write operation.

        @[JSON::Field(key: "trustAnchor")]
        getter trust_anchor : Types::TrustAnchorDetail

        def initialize(
          @trust_anchor : Types::TrustAnchorDetail
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A list of keys. Tag keys are the unique identifiers of tags.

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


      struct UpdateCrlRequest
        include JSON::Serializable

        # The unique identifier of the certificate revocation list (CRL).

        @[JSON::Field(key: "crlId")]
        getter crl_id : String

        # The x509 v3 specified certificate revocation list (CRL).

        @[JSON::Field(key: "crlData")]
        getter crl_data : Bytes?

        # The name of the Crl.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @crl_id : String,
          @crl_data : Bytes? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateProfileRequest
        include JSON::Serializable

        # The unique identifier of the profile.

        @[JSON::Field(key: "profileId")]
        getter profile_id : String

        # Used to determine if a custom role session name will be accepted in a temporary credential request.

        @[JSON::Field(key: "acceptRoleSessionName")]
        getter accept_role_session_name : Bool?

        # Used to determine how long sessions vended using this profile are valid for. See the Expiration
        # section of the CreateSession API documentation page for more details. In requests, if this value is
        # not provided, the default value will be 3600.

        @[JSON::Field(key: "durationSeconds")]
        getter duration_seconds : Int32?

        # A list of managed policy ARNs that apply to the vended session credentials.

        @[JSON::Field(key: "managedPolicyArns")]
        getter managed_policy_arns : Array(String)?

        # The name of the profile.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A list of IAM roles that this profile can assume in a temporary credential request.

        @[JSON::Field(key: "roleArns")]
        getter role_arns : Array(String)?

        # A session policy that applies to the trust boundary of the vended session credentials.

        @[JSON::Field(key: "sessionPolicy")]
        getter session_policy : String?

        def initialize(
          @profile_id : String,
          @accept_role_session_name : Bool? = nil,
          @duration_seconds : Int32? = nil,
          @managed_policy_arns : Array(String)? = nil,
          @name : String? = nil,
          @role_arns : Array(String)? = nil,
          @session_policy : String? = nil
        )
        end
      end


      struct UpdateTrustAnchorRequest
        include JSON::Serializable

        # The unique identifier of the trust anchor.

        @[JSON::Field(key: "trustAnchorId")]
        getter trust_anchor_id : String

        # The name of the trust anchor.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The trust anchor type and its related certificate data.

        @[JSON::Field(key: "source")]
        getter source : Types::Source?

        def initialize(
          @trust_anchor_id : String,
          @name : String? = nil,
          @source : Types::Source? = nil
        )
        end
      end

      # Validation exception error.

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
