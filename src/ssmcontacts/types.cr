require "json"
require "time"

module Aws
  module SSMContacts
    module Types


      struct AcceptPageRequest
        include JSON::Serializable

        # A 6-digit code used to acknowledge the page.

        @[JSON::Field(key: "AcceptCode")]
        getter accept_code : String

        # The type indicates if the page was DELIVERED or READ .

        @[JSON::Field(key: "AcceptType")]
        getter accept_type : String

        # The Amazon Resource Name (ARN) of the engagement to a contact channel.

        @[JSON::Field(key: "PageId")]
        getter page_id : String

        # An optional field that Incident Manager uses to ENFORCE AcceptCode validation when acknowledging an
        # page. Acknowledgement can occur by replying to a page, or when entering the AcceptCode in the
        # console. Enforcing AcceptCode validation causes Incident Manager to verify that the code entered by
        # the user matches the code sent by Incident Manager with the page. Incident Manager can also IGNORE
        # AcceptCode validation. Ignoring AcceptCode validation causes Incident Manager to accept any value
        # entered for the AcceptCode .

        @[JSON::Field(key: "AcceptCodeValidation")]
        getter accept_code_validation : String?

        # The ARN of the contact channel.

        @[JSON::Field(key: "ContactChannelId")]
        getter contact_channel_id : String?

        # Information provided by the user when the user acknowledges the page.

        @[JSON::Field(key: "Note")]
        getter note : String?

        def initialize(
          @accept_code : String,
          @accept_type : String,
          @page_id : String,
          @accept_code_validation : String? = nil,
          @contact_channel_id : String? = nil,
          @note : String? = nil
        )
        end
      end


      struct AcceptPageResult
        include JSON::Serializable

        def initialize
        end
      end

      # You don't have sufficient access to perform this operation.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ActivateContactChannelRequest
        include JSON::Serializable

        # The code sent to the contact channel when it was created in the contact.

        @[JSON::Field(key: "ActivationCode")]
        getter activation_code : String

        # The Amazon Resource Name (ARN) of the contact channel.

        @[JSON::Field(key: "ContactChannelId")]
        getter contact_channel_id : String

        def initialize(
          @activation_code : String,
          @contact_channel_id : String
        )
        end
      end


      struct ActivateContactChannelResult
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the contact channel that Incident Manager uses to engage the contact.

      struct ChannelTargetInfo
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact channel.

        @[JSON::Field(key: "ContactChannelId")]
        getter contact_channel_id : String

        # The number of minutes to wait before retrying to send engagement if the engagement initially failed.

        @[JSON::Field(key: "RetryIntervalInMinutes")]
        getter retry_interval_in_minutes : Int32?

        def initialize(
          @contact_channel_id : String,
          @retry_interval_in_minutes : Int32? = nil
        )
        end
      end

      # Updating or deleting a resource causes an inconsistent state.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # Identifier of the resource in use

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Type of the resource in use

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # List of dependent entities containing information on relation type and resourceArns linked to the
        # resource in use

        @[JSON::Field(key: "DependentEntities")]
        getter dependent_entities : Array(Types::DependentEntity)?

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String,
          @dependent_entities : Array(Types::DependentEntity)? = nil
        )
        end
      end

      # A personal contact or escalation plan that Incident Manager engages during an incident.

      struct Contact
        include JSON::Serializable

        # The unique and identifiable alias of the contact or escalation plan.

        @[JSON::Field(key: "Alias")]
        getter alias : String

        # The Amazon Resource Name (ARN) of the contact or escalation plan.

        @[JSON::Field(key: "ContactArn")]
        getter contact_arn : String

        # The type of contact. PERSONAL : A single, individual contact. ESCALATION : An escalation plan.
        # ONCALL_SCHEDULE : An on-call schedule.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The full name of the contact or escalation plan.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        def initialize(
          @alias : String,
          @contact_arn : String,
          @type : String,
          @display_name : String? = nil
        )
        end
      end

      # The method that Incident Manager uses to engage a contact.

      struct ContactChannel
        include JSON::Serializable

        # A Boolean value describing if the contact channel has been activated or not. If the contact channel
        # isn't activated, Incident Manager can't engage the contact through it.

        @[JSON::Field(key: "ActivationStatus")]
        getter activation_status : String

        # The ARN of the contact that contains the contact channel.

        @[JSON::Field(key: "ContactArn")]
        getter contact_arn : String

        # The Amazon Resource Name (ARN) of the contact channel.

        @[JSON::Field(key: "ContactChannelArn")]
        getter contact_channel_arn : String

        # The details that Incident Manager uses when trying to engage the contact channel.

        @[JSON::Field(key: "DeliveryAddress")]
        getter delivery_address : Types::ContactChannelAddress

        # The name of the contact channel.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The type of the contact channel. Incident Manager supports three contact methods: SMS VOICE EMAIL

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @activation_status : String,
          @contact_arn : String,
          @contact_channel_arn : String,
          @delivery_address : Types::ContactChannelAddress,
          @name : String,
          @type : String? = nil
        )
        end
      end

      # The details that Incident Manager uses when trying to engage the contact channel.

      struct ContactChannelAddress
        include JSON::Serializable

        # The format is dependent on the type of the contact channel. The following are the expected formats:
        # SMS - '+' followed by the country code and phone number VOICE - '+' followed by the country code and
        # phone number EMAIL - any standard email format

        @[JSON::Field(key: "SimpleAddress")]
        getter simple_address : String?

        def initialize(
          @simple_address : String? = nil
        )
        end
      end

      # The contact that Incident Manager is engaging during an incident.

      struct ContactTargetInfo
        include JSON::Serializable

        # A Boolean value determining if the contact's acknowledgement stops the progress of stages in the
        # plan.

        @[JSON::Field(key: "IsEssential")]
        getter is_essential : Bool

        # The Amazon Resource Name (ARN) of the contact.

        @[JSON::Field(key: "ContactId")]
        getter contact_id : String?

        def initialize(
          @is_essential : Bool,
          @contact_id : String? = nil
        )
        end
      end

      # Information about when an on-call shift begins and ends.

      struct CoverageTime
        include JSON::Serializable

        # Information about when the on-call rotation shift ends.

        @[JSON::Field(key: "End")]
        getter end : Types::HandOffTime?

        # Information about when the on-call rotation shift begins.

        @[JSON::Field(key: "Start")]
        getter start : Types::HandOffTime?

        def initialize(
          @end : Types::HandOffTime? = nil,
          @start : Types::HandOffTime? = nil
        )
        end
      end


      struct CreateContactChannelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact you are adding the contact channel to.

        @[JSON::Field(key: "ContactId")]
        getter contact_id : String

        # The details that Incident Manager uses when trying to engage the contact channel. The format is
        # dependent on the type of the contact channel. The following are the expected formats: SMS - '+'
        # followed by the country code and phone number VOICE - '+' followed by the country code and phone
        # number EMAIL - any standard email format

        @[JSON::Field(key: "DeliveryAddress")]
        getter delivery_address : Types::ContactChannelAddress

        # The name of the contact channel.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Incident Manager supports three types of contact channels: SMS VOICE EMAIL

        @[JSON::Field(key: "Type")]
        getter type : String

        # If you want to activate the channel at a later time, you can choose to defer activation. Incident
        # Manager can't engage your contact channel until it has been activated.

        @[JSON::Field(key: "DeferActivation")]
        getter defer_activation : Bool?

        # A token ensuring that the operation is called only once with the specified details.

        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        def initialize(
          @contact_id : String,
          @delivery_address : Types::ContactChannelAddress,
          @name : String,
          @type : String,
          @defer_activation : Bool? = nil,
          @idempotency_token : String? = nil
        )
        end
      end


      struct CreateContactChannelResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact channel.

        @[JSON::Field(key: "ContactChannelArn")]
        getter contact_channel_arn : String

        def initialize(
          @contact_channel_arn : String
        )
        end
      end


      struct CreateContactRequest
        include JSON::Serializable

        # The short name to quickly identify a contact or escalation plan. The contact alias must be unique
        # and identifiable.

        @[JSON::Field(key: "Alias")]
        getter alias : String

        # A list of stages. A contact has an engagement plan with stages that contact specified contact
        # channels. An escalation plan uses stages that contact specified contacts.

        @[JSON::Field(key: "Plan")]
        getter plan : Types::Plan

        # The type of contact to create. PERSONAL : A single, individual contact. ESCALATION : An escalation
        # plan. ONCALL_SCHEDULE : An on-call schedule.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The full name of the contact or escalation plan.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # A token ensuring that the operation is called only once with the specified details.

        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        # Adds a tag to the target. You can only tag resources created in the first Region of your replication
        # set.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @alias : String,
          @plan : Types::Plan,
          @type : String,
          @display_name : String? = nil,
          @idempotency_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateContactResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created contact or escalation plan.

        @[JSON::Field(key: "ContactArn")]
        getter contact_arn : String

        def initialize(
          @contact_arn : String
        )
        end
      end


      struct CreateRotationOverrideRequest
        include JSON::Serializable

        # The date and time when the override ends.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The Amazon Resource Names (ARNs) of the contacts to replace those in the current on-call rotation
        # with. If you want to include any current team members in the override shift, you must include their
        # ARNs in the new contact ID list.

        @[JSON::Field(key: "NewContactIds")]
        getter new_contact_ids : Array(String)

        # The Amazon Resource Name (ARN) of the rotation to create an override for.

        @[JSON::Field(key: "RotationId")]
        getter rotation_id : String

        # The date and time when the override goes into effect.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        # A token that ensures that the operation is called only once with the specified details.

        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        def initialize(
          @end_time : Time,
          @new_contact_ids : Array(String),
          @rotation_id : String,
          @start_time : Time,
          @idempotency_token : String? = nil
        )
        end
      end


      struct CreateRotationOverrideResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created rotation override.

        @[JSON::Field(key: "RotationOverrideId")]
        getter rotation_override_id : String

        def initialize(
          @rotation_override_id : String
        )
        end
      end


      struct CreateRotationRequest
        include JSON::Serializable

        # The Amazon Resource Names (ARNs) of the contacts to add to the rotation. Only the PERSONAL contact
        # type is supported. The contact types ESCALATION and ONCALL_SCHEDULE are not supported for this
        # operation. The order that you list the contacts in is their shift order in the rotation schedule. To
        # change the order of the contact's shifts, use the UpdateRotation operation.

        @[JSON::Field(key: "ContactIds")]
        getter contact_ids : Array(String)

        # The name of the rotation.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Information about the rule that specifies when a shift's team members rotate.

        @[JSON::Field(key: "Recurrence")]
        getter recurrence : Types::RecurrenceSettings

        # The time zone to base the rotation’s activity on in Internet Assigned Numbers Authority (IANA)
        # format. For example: "America/Los_Angeles", "UTC", or "Asia/Seoul". For more information, see the
        # Time Zone Database on the IANA website. Designators for time zones that don’t support Daylight
        # Savings Time rules, such as Pacific Standard Time (PST), are not supported.

        @[JSON::Field(key: "TimeZoneId")]
        getter time_zone_id : String

        # A token that ensures that the operation is called only once with the specified details.

        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        # The date and time that the rotation goes into effect.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # Optional metadata to assign to the rotation. Tags enable you to categorize a resource in different
        # ways, such as by purpose, owner, or environment. For more information, see Tagging Incident Manager
        # resources in the Incident Manager User Guide .

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @contact_ids : Array(String),
          @name : String,
          @recurrence : Types::RecurrenceSettings,
          @time_zone_id : String,
          @idempotency_token : String? = nil,
          @start_time : Time? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateRotationResult
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created rotation.

        @[JSON::Field(key: "RotationArn")]
        getter rotation_arn : String

        def initialize(
          @rotation_arn : String
        )
        end
      end

      # The operation failed to due an encryption key error.

      struct DataEncryptionException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct DeactivateContactChannelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact channel you're deactivating.

        @[JSON::Field(key: "ContactChannelId")]
        getter contact_channel_id : String

        def initialize(
          @contact_channel_id : String
        )
        end
      end


      struct DeactivateContactChannelResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteContactChannelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact channel.

        @[JSON::Field(key: "ContactChannelId")]
        getter contact_channel_id : String

        def initialize(
          @contact_channel_id : String
        )
        end
      end


      struct DeleteContactChannelResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteContactRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact that you're deleting.

        @[JSON::Field(key: "ContactId")]
        getter contact_id : String

        def initialize(
          @contact_id : String
        )
        end
      end


      struct DeleteContactResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteRotationOverrideRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rotation that was overridden.

        @[JSON::Field(key: "RotationId")]
        getter rotation_id : String

        # The Amazon Resource Name (ARN) of the on-call rotation override to delete.

        @[JSON::Field(key: "RotationOverrideId")]
        getter rotation_override_id : String

        def initialize(
          @rotation_id : String,
          @rotation_override_id : String
        )
        end
      end


      struct DeleteRotationOverrideResult
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteRotationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the on-call rotation to delete.

        @[JSON::Field(key: "RotationId")]
        getter rotation_id : String

        def initialize(
          @rotation_id : String
        )
        end
      end


      struct DeleteRotationResult
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a resource that another resource is related to or depends on. For example, if a
      # contact is a member of a rotation, the rotation is a dependent entity of the contact.

      struct DependentEntity
        include JSON::Serializable

        # The Amazon Resource Names (ARNs) of the dependent resources.

        @[JSON::Field(key: "DependentResourceIds")]
        getter dependent_resource_ids : Array(String)

        # The type of relationship between one resource and the other resource that it is related to or
        # depends on.

        @[JSON::Field(key: "RelationType")]
        getter relation_type : String

        def initialize(
          @dependent_resource_ids : Array(String),
          @relation_type : String
        )
        end
      end


      struct DescribeEngagementRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the engagement you want the details of.

        @[JSON::Field(key: "EngagementId")]
        getter engagement_id : String

        def initialize(
          @engagement_id : String
        )
        end
      end


      struct DescribeEngagementResult
        include JSON::Serializable

        # The ARN of the escalation plan or contacts involved in the engagement.

        @[JSON::Field(key: "ContactArn")]
        getter contact_arn : String

        # The secure content of the message that was sent to the contact. Use this field for engagements to
        # VOICE and EMAIL .

        @[JSON::Field(key: "Content")]
        getter content : String

        # The ARN of the engagement.

        @[JSON::Field(key: "EngagementArn")]
        getter engagement_arn : String

        # The user that started the engagement.

        @[JSON::Field(key: "Sender")]
        getter sender : String

        # The secure subject of the message that was sent to the contact. Use this field for engagements to
        # VOICE and EMAIL .

        @[JSON::Field(key: "Subject")]
        getter subject : String

        # The ARN of the incident in which the engagement occurred.

        @[JSON::Field(key: "IncidentId")]
        getter incident_id : String?

        # The insecure content of the message that was sent to the contact. Use this field for engagements to
        # SMS .

        @[JSON::Field(key: "PublicContent")]
        getter public_content : String?

        # The insecure subject of the message that was sent to the contact. Use this field for engagements to
        # SMS .

        @[JSON::Field(key: "PublicSubject")]
        getter public_subject : String?

        # The time that the engagement started.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The time that the engagement ended.

        @[JSON::Field(key: "StopTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter stop_time : Time?

        def initialize(
          @contact_arn : String,
          @content : String,
          @engagement_arn : String,
          @sender : String,
          @subject : String,
          @incident_id : String? = nil,
          @public_content : String? = nil,
          @public_subject : String? = nil,
          @start_time : Time? = nil,
          @stop_time : Time? = nil
        )
        end
      end


      struct DescribePageRequest
        include JSON::Serializable

        # The ID of the engagement to a contact channel.

        @[JSON::Field(key: "PageId")]
        getter page_id : String

        def initialize(
          @page_id : String
        )
        end
      end


      struct DescribePageResult
        include JSON::Serializable

        # The ARN of the contact that was engaged.

        @[JSON::Field(key: "ContactArn")]
        getter contact_arn : String

        # The secure content of the message that was sent to the contact. Use this field for engagements to
        # VOICE and EMAIL .

        @[JSON::Field(key: "Content")]
        getter content : String

        # The ARN of the engagement that engaged the contact channel.

        @[JSON::Field(key: "EngagementArn")]
        getter engagement_arn : String

        # The Amazon Resource Name (ARN) of the engagement to a contact channel.

        @[JSON::Field(key: "PageArn")]
        getter page_arn : String

        # The user that started the engagement.

        @[JSON::Field(key: "Sender")]
        getter sender : String

        # The secure subject of the message that was sent to the contact. Use this field for engagements to
        # VOICE and EMAIL .

        @[JSON::Field(key: "Subject")]
        getter subject : String

        # The time that the contact channel received the engagement.

        @[JSON::Field(key: "DeliveryTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter delivery_time : Time?

        # The ARN of the incident that engaged the contact channel.

        @[JSON::Field(key: "IncidentId")]
        getter incident_id : String?

        # The insecure content of the message that was sent to the contact. Use this field for engagements to
        # SMS .

        @[JSON::Field(key: "PublicContent")]
        getter public_content : String?

        # The insecure subject of the message that was sent to the contact. Use this field for engagements to
        # SMS .

        @[JSON::Field(key: "PublicSubject")]
        getter public_subject : String?

        # The time that the contact channel acknowledged the engagement.

        @[JSON::Field(key: "ReadTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter read_time : Time?

        # The time the engagement was sent to the contact channel.

        @[JSON::Field(key: "SentTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter sent_time : Time?

        def initialize(
          @contact_arn : String,
          @content : String,
          @engagement_arn : String,
          @page_arn : String,
          @sender : String,
          @subject : String,
          @delivery_time : Time? = nil,
          @incident_id : String? = nil,
          @public_content : String? = nil,
          @public_subject : String? = nil,
          @read_time : Time? = nil,
          @sent_time : Time? = nil
        )
        end
      end

      # Incident Manager reaching out to a contact or escalation plan to engage contact during an incident.

      struct Engagement
        include JSON::Serializable

        # The ARN of the escalation plan or contact that Incident Manager is engaging.

        @[JSON::Field(key: "ContactArn")]
        getter contact_arn : String

        # The Amazon Resource Name (ARN) of the engagement.

        @[JSON::Field(key: "EngagementArn")]
        getter engagement_arn : String

        # The user that started the engagement.

        @[JSON::Field(key: "Sender")]
        getter sender : String

        # The ARN of the incident that's engaging the contact.

        @[JSON::Field(key: "IncidentId")]
        getter incident_id : String?

        # The time that the engagement began.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The time that the engagement ended.

        @[JSON::Field(key: "StopTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter stop_time : Time?

        def initialize(
          @contact_arn : String,
          @engagement_arn : String,
          @sender : String,
          @incident_id : String? = nil,
          @start_time : Time? = nil,
          @stop_time : Time? = nil
        )
        end
      end


      struct GetContactChannelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact channel you want information about.

        @[JSON::Field(key: "ContactChannelId")]
        getter contact_channel_id : String

        def initialize(
          @contact_channel_id : String
        )
        end
      end


      struct GetContactChannelResult
        include JSON::Serializable

        # The ARN of the contact that the channel belongs to.

        @[JSON::Field(key: "ContactArn")]
        getter contact_arn : String

        # The ARN of the contact channel.

        @[JSON::Field(key: "ContactChannelArn")]
        getter contact_channel_arn : String

        # The details that Incident Manager uses when trying to engage the contact channel.

        @[JSON::Field(key: "DeliveryAddress")]
        getter delivery_address : Types::ContactChannelAddress

        # The name of the contact channel

        @[JSON::Field(key: "Name")]
        getter name : String

        # The type of contact channel. The type is SMS , VOICE , or EMAIL .

        @[JSON::Field(key: "Type")]
        getter type : String

        # A Boolean value indicating if the contact channel has been activated or not.

        @[JSON::Field(key: "ActivationStatus")]
        getter activation_status : String?

        def initialize(
          @contact_arn : String,
          @contact_channel_arn : String,
          @delivery_address : Types::ContactChannelAddress,
          @name : String,
          @type : String,
          @activation_status : String? = nil
        )
        end
      end


      struct GetContactPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact or escalation plan.

        @[JSON::Field(key: "ContactArn")]
        getter contact_arn : String

        def initialize(
          @contact_arn : String
        )
        end
      end


      struct GetContactPolicyResult
        include JSON::Serializable

        # The ARN of the contact or escalation plan.

        @[JSON::Field(key: "ContactArn")]
        getter contact_arn : String?

        # Details about the resource policy attached to the contact or escalation plan.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @contact_arn : String? = nil,
          @policy : String? = nil
        )
        end
      end


      struct GetContactRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact or escalation plan.

        @[JSON::Field(key: "ContactId")]
        getter contact_id : String

        def initialize(
          @contact_id : String
        )
        end
      end


      struct GetContactResult
        include JSON::Serializable

        # The alias of the contact or escalation plan. The alias is unique and identifiable.

        @[JSON::Field(key: "Alias")]
        getter alias : String

        # The ARN of the contact or escalation plan.

        @[JSON::Field(key: "ContactArn")]
        getter contact_arn : String

        # Details about the specific timing or stages and targets of the escalation plan or engagement plan.

        @[JSON::Field(key: "Plan")]
        getter plan : Types::Plan

        # The type of contact.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The full name of the contact or escalation plan.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        def initialize(
          @alias : String,
          @contact_arn : String,
          @plan : Types::Plan,
          @type : String,
          @display_name : String? = nil
        )
        end
      end


      struct GetRotationOverrideRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the overridden rotation to retrieve information about.

        @[JSON::Field(key: "RotationId")]
        getter rotation_id : String

        # The Amazon Resource Name (ARN) of the on-call rotation override to retrieve information about.

        @[JSON::Field(key: "RotationOverrideId")]
        getter rotation_override_id : String

        def initialize(
          @rotation_id : String,
          @rotation_override_id : String
        )
        end
      end


      struct GetRotationOverrideResult
        include JSON::Serializable

        # The date and time when the override was created.

        @[JSON::Field(key: "CreateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # The date and time when the override ends.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The Amazon Resource Names (ARNs) of the contacts assigned to the override of the on-call rotation.

        @[JSON::Field(key: "NewContactIds")]
        getter new_contact_ids : Array(String)?

        # The Amazon Resource Name (ARN) of the on-call rotation that was overridden.

        @[JSON::Field(key: "RotationArn")]
        getter rotation_arn : String?

        # The Amazon Resource Name (ARN) of the override to an on-call rotation.

        @[JSON::Field(key: "RotationOverrideId")]
        getter rotation_override_id : String?

        # The date and time when the override goes into effect.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @create_time : Time? = nil,
          @end_time : Time? = nil,
          @new_contact_ids : Array(String)? = nil,
          @rotation_arn : String? = nil,
          @rotation_override_id : String? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct GetRotationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the on-call rotation to retrieve information about.

        @[JSON::Field(key: "RotationId")]
        getter rotation_id : String

        def initialize(
          @rotation_id : String
        )
        end
      end


      struct GetRotationResult
        include JSON::Serializable

        # The Amazon Resource Names (ARNs) of the contacts assigned to the on-call rotation team.

        @[JSON::Field(key: "ContactIds")]
        getter contact_ids : Array(String)

        # The name of the on-call rotation.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies how long a rotation lasts before restarting at the beginning of the shift order.

        @[JSON::Field(key: "Recurrence")]
        getter recurrence : Types::RecurrenceSettings

        # The Amazon Resource Name (ARN) of the on-call rotation.

        @[JSON::Field(key: "RotationArn")]
        getter rotation_arn : String

        # The specified start time for the on-call rotation.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        # The time zone that the rotation’s activity is based on, in Internet Assigned Numbers Authority
        # (IANA) format.

        @[JSON::Field(key: "TimeZoneId")]
        getter time_zone_id : String

        def initialize(
          @contact_ids : Array(String),
          @name : String,
          @recurrence : Types::RecurrenceSettings,
          @rotation_arn : String,
          @start_time : Time,
          @time_zone_id : String
        )
        end
      end

      # Details about when an on-call rotation shift begins or ends.

      struct HandOffTime
        include JSON::Serializable

        # The hour when an on-call rotation shift begins or ends.

        @[JSON::Field(key: "HourOfDay")]
        getter hour_of_day : Int32

        # The minute when an on-call rotation shift begins or ends.

        @[JSON::Field(key: "MinuteOfHour")]
        getter minute_of_hour : Int32

        def initialize(
          @hour_of_day : Int32,
          @minute_of_hour : Int32
        )
        end
      end

      # Unexpected error occurred while processing the request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # Advice to clients on when the call can be safely retried

        @[JSON::Field(key: "RetryAfterSeconds")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end


      struct ListContactChannelsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact.

        @[JSON::Field(key: "ContactId")]
        getter contact_id : String

        # The maximum number of contact channels per page.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to continue to the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @contact_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListContactChannelsResult
        include JSON::Serializable

        # A list of contact channels related to the specified contact.

        @[JSON::Field(key: "ContactChannels")]
        getter contact_channels : Array(Types::ContactChannel)

        # The pagination token to continue to the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @contact_channels : Array(Types::ContactChannel),
          @next_token : String? = nil
        )
        end
      end


      struct ListContactsRequest
        include JSON::Serializable

        # Used to list only contacts who's aliases start with the specified prefix.

        @[JSON::Field(key: "AliasPrefix")]
        getter alias_prefix : String?

        # The maximum number of contacts and escalation plans per page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to continue to the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The type of contact.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @alias_prefix : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct ListContactsResult
        include JSON::Serializable

        # A list of the contacts and escalation plans in your Incident Manager account.

        @[JSON::Field(key: "Contacts")]
        getter contacts : Array(Types::Contact)?

        # The pagination token to continue to the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @contacts : Array(Types::Contact)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEngagementsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the incident you're listing engagements for.

        @[JSON::Field(key: "IncidentId")]
        getter incident_id : String?

        # The maximum number of engagements per page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to continue to the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The time range to lists engagements for an incident.

        @[JSON::Field(key: "TimeRangeValue")]
        getter time_range_value : Types::TimeRange?

        def initialize(
          @incident_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @time_range_value : Types::TimeRange? = nil
        )
        end
      end


      struct ListEngagementsResult
        include JSON::Serializable

        # A list of each engagement that occurred during the specified time range of an incident.

        @[JSON::Field(key: "Engagements")]
        getter engagements : Array(Types::Engagement)

        # The pagination token to continue to the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @engagements : Array(Types::Engagement),
          @next_token : String? = nil
        )
        end
      end


      struct ListPageReceiptsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the engagement to a specific contact channel.

        @[JSON::Field(key: "PageId")]
        getter page_id : String

        # The maximum number of acknowledgements per page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to continue to the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @page_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPageReceiptsResult
        include JSON::Serializable

        # The pagination token to continue to the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of each acknowledgement.

        @[JSON::Field(key: "Receipts")]
        getter receipts : Array(Types::Receipt)?

        def initialize(
          @next_token : String? = nil,
          @receipts : Array(Types::Receipt)? = nil
        )
        end
      end


      struct ListPageResolutionsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact engaged for the incident.

        @[JSON::Field(key: "PageId")]
        getter page_id : String

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @page_id : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListPageResolutionsResult
        include JSON::Serializable

        # Information about the resolution for an engagement.

        @[JSON::Field(key: "PageResolutions")]
        getter page_resolutions : Array(Types::ResolutionContact)

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @page_resolutions : Array(Types::ResolutionContact),
          @next_token : String? = nil
        )
        end
      end


      struct ListPagesByContactRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact you are retrieving engagements for.

        @[JSON::Field(key: "ContactId")]
        getter contact_id : String

        # The maximum number of engagements to contact channels to list per page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to continue to the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @contact_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPagesByContactResult
        include JSON::Serializable

        # The list of engagements to a contact's contact channel.

        @[JSON::Field(key: "Pages")]
        getter pages : Array(Types::Page)

        # The pagination token to continue to the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @pages : Array(Types::Page),
          @next_token : String? = nil
        )
        end
      end


      struct ListPagesByEngagementRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the engagement.

        @[JSON::Field(key: "EngagementId")]
        getter engagement_id : String

        # The maximum number of engagements to contact channels to list per page of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token to continue to the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @engagement_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPagesByEngagementResult
        include JSON::Serializable

        # The list of engagements to contact channels.

        @[JSON::Field(key: "Pages")]
        getter pages : Array(Types::Page)

        # The pagination token to continue to the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @pages : Array(Types::Page),
          @next_token : String? = nil
        )
        end
      end


      struct ListPreviewRotationShiftsRequest
        include JSON::Serializable

        # The date and time a rotation shift would end.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The contacts that would be assigned to a rotation.

        @[JSON::Field(key: "Members")]
        getter members : Array(String)

        # Information about how long a rotation would last before restarting at the beginning of the shift
        # order.

        @[JSON::Field(key: "Recurrence")]
        getter recurrence : Types::RecurrenceSettings

        # The time zone the rotation’s activity would be based on, in Internet Assigned Numbers Authority
        # (IANA) format. For example: "America/Los_Angeles", "UTC", or "Asia/Seoul".

        @[JSON::Field(key: "TimeZoneId")]
        getter time_zone_id : String

        # The maximum number of items to return for this call. The call also returns a token that can be
        # specified in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. This token is used to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about changes that would be made in a rotation override.

        @[JSON::Field(key: "Overrides")]
        getter overrides : Array(Types::PreviewOverride)?

        # The date and time a rotation would begin. The first shift is calculated from this date and time.

        @[JSON::Field(key: "RotationStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter rotation_start_time : Time?

        # Used to filter the range of calculated shifts before sending the response back to the user.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @end_time : Time,
          @members : Array(String),
          @recurrence : Types::RecurrenceSettings,
          @time_zone_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @overrides : Array(Types::PreviewOverride)? = nil,
          @rotation_start_time : Time? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct ListPreviewRotationShiftsResult
        include JSON::Serializable

        # The token for the next set of items to return. This token is used to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Details about a rotation shift, including times, types, and contacts.

        @[JSON::Field(key: "RotationShifts")]
        getter rotation_shifts : Array(Types::RotationShift)?

        def initialize(
          @next_token : String? = nil,
          @rotation_shifts : Array(Types::RotationShift)? = nil
        )
        end
      end


      struct ListRotationOverridesRequest
        include JSON::Serializable

        # The date and time for the end of a time range for listing overrides.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The Amazon Resource Name (ARN) of the rotation to retrieve information about.

        @[JSON::Field(key: "RotationId")]
        getter rotation_id : String

        # The date and time for the beginning of a time range for listing overrides.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @end_time : Time,
          @rotation_id : String,
          @start_time : Time,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRotationOverridesResult
        include JSON::Serializable

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of rotation overrides in the specified time range.

        @[JSON::Field(key: "RotationOverrides")]
        getter rotation_overrides : Array(Types::RotationOverride)?

        def initialize(
          @next_token : String? = nil,
          @rotation_overrides : Array(Types::RotationOverride)? = nil
        )
        end
      end


      struct ListRotationShiftsRequest
        include JSON::Serializable

        # The date and time for the end of the time range to list shifts for.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The Amazon Resource Name (ARN) of the rotation to retrieve shift information about.

        @[JSON::Field(key: "RotationId")]
        getter rotation_id : String

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The date and time for the beginning of the time range to list shifts for.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @end_time : Time,
          @rotation_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct ListRotationShiftsResult
        include JSON::Serializable

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about shifts that meet the filter criteria.

        @[JSON::Field(key: "RotationShifts")]
        getter rotation_shifts : Array(Types::RotationShift)?

        def initialize(
          @next_token : String? = nil,
          @rotation_shifts : Array(Types::RotationShift)? = nil
        )
        end
      end


      struct ListRotationsRequest
        include JSON::Serializable

        # The maximum number of items to return for this call. The call also returns a token that you can
        # specify in a subsequent call to get the next set of results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to start the list. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A filter to include rotations in list results based on their common prefix. For example, entering
        # prod returns a list of all rotation names that begin with prod , such as production and prod-1 .

        @[JSON::Field(key: "RotationNamePrefix")]
        getter rotation_name_prefix : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @rotation_name_prefix : String? = nil
        )
        end
      end


      struct ListRotationsResult
        include JSON::Serializable

        # Information about rotations that meet the filter criteria.

        @[JSON::Field(key: "Rotations")]
        getter rotations : Array(Types::Rotation)

        # The token for the next set of items to return. Use this token to get the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @rotations : Array(Types::Rotation),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact, escalation plan, rotation, or on-call schedule.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResult
        include JSON::Serializable

        # The tags related to the contact or escalation plan.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Information about on-call rotations that recur monthly.

      struct MonthlySetting
        include JSON::Serializable

        # The day of the month when monthly recurring on-call rotations begin.

        @[JSON::Field(key: "DayOfMonth")]
        getter day_of_month : Int32

        # The time of day when a monthly recurring on-call shift rotation begins.

        @[JSON::Field(key: "HandOffTime")]
        getter hand_off_time : Types::HandOffTime

        def initialize(
          @day_of_month : Int32,
          @hand_off_time : Types::HandOffTime
        )
        end
      end

      # Incident Manager engaging a contact's contact channel.

      struct Page
        include JSON::Serializable

        # The ARN of the contact that Incident Manager is engaging.

        @[JSON::Field(key: "ContactArn")]
        getter contact_arn : String

        # The ARN of the engagement that this page is part of.

        @[JSON::Field(key: "EngagementArn")]
        getter engagement_arn : String

        # The Amazon Resource Name (ARN) of the page to the contact channel.

        @[JSON::Field(key: "PageArn")]
        getter page_arn : String

        # The user that started the engagement.

        @[JSON::Field(key: "Sender")]
        getter sender : String

        # The time the message was delivered to the contact channel.

        @[JSON::Field(key: "DeliveryTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter delivery_time : Time?

        # The ARN of the incident that's engaging the contact channel.

        @[JSON::Field(key: "IncidentId")]
        getter incident_id : String?

        # The time that the contact channel acknowledged engagement.

        @[JSON::Field(key: "ReadTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter read_time : Time?

        # The time that Incident Manager engaged the contact channel.

        @[JSON::Field(key: "SentTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter sent_time : Time?

        def initialize(
          @contact_arn : String,
          @engagement_arn : String,
          @page_arn : String,
          @sender : String,
          @delivery_time : Time? = nil,
          @incident_id : String? = nil,
          @read_time : Time? = nil,
          @sent_time : Time? = nil
        )
        end
      end

      # Information about the stages and on-call rotation teams associated with an escalation plan or
      # engagement plan.

      struct Plan
        include JSON::Serializable

        # The Amazon Resource Names (ARNs) of the on-call rotations associated with the plan.

        @[JSON::Field(key: "RotationIds")]
        getter rotation_ids : Array(String)?

        # A list of stages that the escalation plan or engagement plan uses to engage contacts and contact
        # methods.

        @[JSON::Field(key: "Stages")]
        getter stages : Array(Types::Stage)?

        def initialize(
          @rotation_ids : Array(String)? = nil,
          @stages : Array(Types::Stage)? = nil
        )
        end
      end

      # Information about contacts and times that an on-call override replaces.

      struct PreviewOverride
        include JSON::Serializable

        # Information about the time a rotation override would end.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # Information about contacts to add to an on-call rotation override.

        @[JSON::Field(key: "NewMembers")]
        getter new_members : Array(String)?

        # Information about the time a rotation override would begin.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @end_time : Time? = nil,
          @new_members : Array(String)? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct PutContactPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact or escalation plan.

        @[JSON::Field(key: "ContactArn")]
        getter contact_arn : String

        # Details of the resource policy.

        @[JSON::Field(key: "Policy")]
        getter policy : String

        def initialize(
          @contact_arn : String,
          @policy : String
        )
        end
      end


      struct PutContactPolicyResult
        include JSON::Serializable

        def initialize
        end
      end

      # Records events during an engagement.

      struct Receipt
        include JSON::Serializable

        # The time receipt was SENT , DELIVERED , or READ .

        @[JSON::Field(key: "ReceiptTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter receipt_time : Time

        # The type follows the engagement cycle, SENT , DELIVERED , and READ .

        @[JSON::Field(key: "ReceiptType")]
        getter receipt_type : String

        # The Amazon Resource Name (ARN) of the contact channel Incident Manager engaged.

        @[JSON::Field(key: "ContactChannelArn")]
        getter contact_channel_arn : String?

        # Information provided during the page acknowledgement.

        @[JSON::Field(key: "ReceiptInfo")]
        getter receipt_info : String?

        def initialize(
          @receipt_time : Time,
          @receipt_type : String,
          @contact_channel_arn : String? = nil,
          @receipt_info : String? = nil
        )
        end
      end

      # Information about when an on-call rotation is in effect and how long the rotation period lasts.

      struct RecurrenceSettings
        include JSON::Serializable

        # The number of contacts, or shift team members designated to be on call concurrently during a shift.
        # For example, in an on-call schedule that contains ten contacts, a value of 2 designates that two of
        # them are on call at any given time.

        @[JSON::Field(key: "NumberOfOnCalls")]
        getter number_of_on_calls : Int32

        # The number of days, weeks, or months a single rotation lasts.

        @[JSON::Field(key: "RecurrenceMultiplier")]
        getter recurrence_multiplier : Int32

        # Information about on-call rotations that recur daily.

        @[JSON::Field(key: "DailySettings")]
        getter daily_settings : Array(Types::HandOffTime)?

        # Information about on-call rotations that recur monthly.

        @[JSON::Field(key: "MonthlySettings")]
        getter monthly_settings : Array(Types::MonthlySetting)?

        # Information about the days of the week that the on-call rotation coverage includes.

        @[JSON::Field(key: "ShiftCoverages")]
        getter shift_coverages : Hash(String, Array(Types::CoverageTime))?

        # Information about on-call rotations that recur weekly.

        @[JSON::Field(key: "WeeklySettings")]
        getter weekly_settings : Array(Types::WeeklySetting)?

        def initialize(
          @number_of_on_calls : Int32,
          @recurrence_multiplier : Int32,
          @daily_settings : Array(Types::HandOffTime)? = nil,
          @monthly_settings : Array(Types::MonthlySetting)? = nil,
          @shift_coverages : Hash(String, Array(Types::CoverageTime))? = nil,
          @weekly_settings : Array(Types::WeeklySetting)? = nil
        )
        end
      end

      # Information about the engagement resolution steps. The resolution starts from the first contact,
      # which can be an escalation plan, then resolves to an on-call rotation, and finally to a personal
      # contact. The ResolutionContact structure describes the information for each node or step in that
      # process. It contains information about different contact types, such as the escalation, rotation,
      # and personal contacts.

      struct ResolutionContact
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a contact in the engagement resolution process.

        @[JSON::Field(key: "ContactArn")]
        getter contact_arn : String

        # The type of contact for a resolution step.

        @[JSON::Field(key: "Type")]
        getter type : String

        # The stage in the escalation plan that resolves to this contact.

        @[JSON::Field(key: "StageIndex")]
        getter stage_index : Int32?

        def initialize(
          @contact_arn : String,
          @type : String,
          @stage_index : Int32? = nil
        )
        end
      end

      # Request references a resource that doesn't exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # Hypothetical resource identifier that was not found

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # Hypothetical resource type that was not found

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Information about a rotation in an on-call schedule.

      struct Rotation
        include JSON::Serializable

        # The name of the rotation.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the rotation.

        @[JSON::Field(key: "RotationArn")]
        getter rotation_arn : String

        # The Amazon Resource Names (ARNs) of the contacts assigned to the rotation team.

        @[JSON::Field(key: "ContactIds")]
        getter contact_ids : Array(String)?

        # Information about when an on-call rotation is in effect and how long the rotation period lasts.

        @[JSON::Field(key: "Recurrence")]
        getter recurrence : Types::RecurrenceSettings?

        # The date and time the rotation becomes active.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The time zone the rotation’s activity is based on, in Internet Assigned Numbers Authority (IANA)
        # format. For example: "America/Los_Angeles", "UTC", or "Asia/Seoul".

        @[JSON::Field(key: "TimeZoneId")]
        getter time_zone_id : String?

        def initialize(
          @name : String,
          @rotation_arn : String,
          @contact_ids : Array(String)? = nil,
          @recurrence : Types::RecurrenceSettings? = nil,
          @start_time : Time? = nil,
          @time_zone_id : String? = nil
        )
        end
      end

      # Information about an override specified for an on-call rotation.

      struct RotationOverride
        include JSON::Serializable

        # The time a rotation override was created.

        @[JSON::Field(key: "CreateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter create_time : Time

        # The time a rotation override ends.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The Amazon Resource Names (ARNs) of the contacts assigned to the override of the on-call rotation.

        @[JSON::Field(key: "NewContactIds")]
        getter new_contact_ids : Array(String)

        # The Amazon Resource Name (ARN) of the override to an on-call rotation.

        @[JSON::Field(key: "RotationOverrideId")]
        getter rotation_override_id : String

        # The time a rotation override begins.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        def initialize(
          @create_time : Time,
          @end_time : Time,
          @new_contact_ids : Array(String),
          @rotation_override_id : String,
          @start_time : Time
        )
        end
      end

      # Information about a shift that belongs to an on-call rotation.

      struct RotationShift
        include JSON::Serializable

        # The time a shift rotation ends.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time

        # The time a shift rotation begins.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time

        # The Amazon Resource Names (ARNs) of the contacts who are part of the shift rotation.

        @[JSON::Field(key: "ContactIds")]
        getter contact_ids : Array(String)?

        # Additional information about an on-call rotation shift.

        @[JSON::Field(key: "ShiftDetails")]
        getter shift_details : Types::ShiftDetails?

        # The type of shift rotation.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @end_time : Time,
          @start_time : Time,
          @contact_ids : Array(String)? = nil,
          @shift_details : Types::ShiftDetails? = nil,
          @type : String? = nil
        )
        end
      end


      struct SendActivationCodeRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact channel.

        @[JSON::Field(key: "ContactChannelId")]
        getter contact_channel_id : String

        def initialize(
          @contact_channel_id : String
        )
        end
      end


      struct SendActivationCodeResult
        include JSON::Serializable

        def initialize
        end
      end

      # Request would cause a service quota to be exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # Service Quotas requirement to identify originating service

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String

        # Service Quotas requirement to identify originating quota

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        # Identifier of the resource affected

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # Type of the resource affected

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @quota_code : String,
          @service_code : String,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Information about overrides to an on-call rotation shift.

      struct ShiftDetails
        include JSON::Serializable

        # The Amazon Resources Names (ARNs) of the contacts who were replaced in a shift when an override was
        # created. If the override is deleted, these contacts are restored to the shift.

        @[JSON::Field(key: "OverriddenContactIds")]
        getter overridden_contact_ids : Array(String)

        def initialize(
          @overridden_contact_ids : Array(String)
        )
        end
      end

      # A set amount of time that an escalation plan or engagement plan engages the specified contacts or
      # contact methods.

      struct Stage
        include JSON::Serializable

        # The time to wait until beginning the next stage. The duration can only be set to 0 if a target is
        # specified.

        @[JSON::Field(key: "DurationInMinutes")]
        getter duration_in_minutes : Int32

        # The contacts or contact methods that the escalation plan or engagement plan is engaging.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)

        def initialize(
          @duration_in_minutes : Int32,
          @targets : Array(Types::Target)
        )
        end
      end


      struct StartEngagementRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact being engaged.

        @[JSON::Field(key: "ContactId")]
        getter contact_id : String

        # The secure content of the message that was sent to the contact. Use this field for engagements to
        # VOICE or EMAIL .

        @[JSON::Field(key: "Content")]
        getter content : String

        # The user that started the engagement.

        @[JSON::Field(key: "Sender")]
        getter sender : String

        # The secure subject of the message that was sent to the contact. Use this field for engagements to
        # VOICE or EMAIL .

        @[JSON::Field(key: "Subject")]
        getter subject : String

        # A token ensuring that the operation is called only once with the specified details.

        @[JSON::Field(key: "IdempotencyToken")]
        getter idempotency_token : String?

        # The ARN of the incident that the engagement is part of.

        @[JSON::Field(key: "IncidentId")]
        getter incident_id : String?

        # The insecure content of the message that was sent to the contact. Use this field for engagements to
        # SMS .

        @[JSON::Field(key: "PublicContent")]
        getter public_content : String?

        # The insecure subject of the message that was sent to the contact. Use this field for engagements to
        # SMS .

        @[JSON::Field(key: "PublicSubject")]
        getter public_subject : String?

        def initialize(
          @contact_id : String,
          @content : String,
          @sender : String,
          @subject : String,
          @idempotency_token : String? = nil,
          @incident_id : String? = nil,
          @public_content : String? = nil,
          @public_subject : String? = nil
        )
        end
      end


      struct StartEngagementResult
        include JSON::Serializable

        # The ARN of the engagement.

        @[JSON::Field(key: "EngagementArn")]
        getter engagement_arn : String

        def initialize(
          @engagement_arn : String
        )
        end
      end


      struct StopEngagementRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the engagement.

        @[JSON::Field(key: "EngagementId")]
        getter engagement_id : String

        # The reason that you're stopping the engagement.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @engagement_id : String,
          @reason : String? = nil
        )
        end
      end


      struct StopEngagementResult
        include JSON::Serializable

        def initialize
        end
      end

      # A container of a key-value name pair.

      struct Tag
        include JSON::Serializable

        # Name of the object key.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # Value of the tag.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact or escalation plan.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # A list of tags that you are adding to the contact or escalation plan.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceResult
        include JSON::Serializable

        def initialize
        end
      end

      # The contact or contact channel that's being engaged.

      struct Target
        include JSON::Serializable

        # Information about the contact channel that Incident Manager engages.

        @[JSON::Field(key: "ChannelTargetInfo")]
        getter channel_target_info : Types::ChannelTargetInfo?

        # Information about the contact that Incident Manager engages.

        @[JSON::Field(key: "ContactTargetInfo")]
        getter contact_target_info : Types::ContactTargetInfo?

        def initialize(
          @channel_target_info : Types::ChannelTargetInfo? = nil,
          @contact_target_info : Types::ContactTargetInfo? = nil
        )
        end
      end

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # Service Quotas requirement to identify originating service

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String?

        # Advice to clients on when the call can be safely retried

        @[JSON::Field(key: "RetryAfterSeconds")]
        getter retry_after_seconds : Int32?

        # Service Quotas requirement to identify originating quota

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end

      # A range of between two set times

      struct TimeRange
        include JSON::Serializable

        # The end of the time range.

        @[JSON::Field(key: "EndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The start of the time range.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        def initialize(
          @end_time : Time? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact or escalation plan.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The key of the tag that you want to remove.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateContactChannelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact channel you want to update.

        @[JSON::Field(key: "ContactChannelId")]
        getter contact_channel_id : String

        # The details that Incident Manager uses when trying to engage the contact channel.

        @[JSON::Field(key: "DeliveryAddress")]
        getter delivery_address : Types::ContactChannelAddress?

        # The name of the contact channel.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @contact_channel_id : String,
          @delivery_address : Types::ContactChannelAddress? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateContactChannelResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateContactRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the contact or escalation plan you're updating.

        @[JSON::Field(key: "ContactId")]
        getter contact_id : String

        # The full name of the contact or escalation plan.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # A list of stages. A contact has an engagement plan with stages for specified contact channels. An
        # escalation plan uses these stages to contact specified contacts.

        @[JSON::Field(key: "Plan")]
        getter plan : Types::Plan?

        def initialize(
          @contact_id : String,
          @display_name : String? = nil,
          @plan : Types::Plan? = nil
        )
        end
      end


      struct UpdateContactResult
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateRotationRequest
        include JSON::Serializable

        # Information about how long the updated rotation lasts before restarting at the beginning of the
        # shift order.

        @[JSON::Field(key: "Recurrence")]
        getter recurrence : Types::RecurrenceSettings

        # The Amazon Resource Name (ARN) of the rotation to update.

        @[JSON::Field(key: "RotationId")]
        getter rotation_id : String

        # The Amazon Resource Names (ARNs) of the contacts to include in the updated rotation. Only the
        # PERSONAL contact type is supported. The contact types ESCALATION and ONCALL_SCHEDULE are not
        # supported for this operation. The order in which you list the contacts is their shift order in the
        # rotation schedule.

        @[JSON::Field(key: "ContactIds")]
        getter contact_ids : Array(String)?

        # The date and time the rotation goes into effect.

        @[JSON::Field(key: "StartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The time zone to base the updated rotation’s activity on, in Internet Assigned Numbers Authority
        # (IANA) format. For example: "America/Los_Angeles", "UTC", or "Asia/Seoul". For more information, see
        # the Time Zone Database on the IANA website. Designators for time zones that don’t support Daylight
        # Savings Time Rules, such as Pacific Standard Time (PST), aren't supported.

        @[JSON::Field(key: "TimeZoneId")]
        getter time_zone_id : String?

        def initialize(
          @recurrence : Types::RecurrenceSettings,
          @rotation_id : String,
          @contact_ids : Array(String)? = nil,
          @start_time : Time? = nil,
          @time_zone_id : String? = nil
        )
        end
      end


      struct UpdateRotationResult
        include JSON::Serializable

        def initialize
        end
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The fields that caused the error

        @[JSON::Field(key: "Fields")]
        getter fields : Array(Types::ValidationExceptionField)?

        # Reason the request failed validation

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @fields : Array(Types::ValidationExceptionField)? = nil,
          @reason : String? = nil
        )
        end
      end

      # Provides information about which field caused the exception.

      struct ValidationExceptionField
        include JSON::Serializable

        # Information about what caused the field to cause an exception.

        @[JSON::Field(key: "Message")]
        getter message : String

        # The name of the field that caused the exception.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # Information about rotations that recur weekly.

      struct WeeklySetting
        include JSON::Serializable

        # The day of the week when weekly recurring on-call shift rotations begins.

        @[JSON::Field(key: "DayOfWeek")]
        getter day_of_week : String

        # The time of day when a weekly recurring on-call shift rotation begins.

        @[JSON::Field(key: "HandOffTime")]
        getter hand_off_time : Types::HandOffTime

        def initialize(
          @day_of_week : String,
          @hand_off_time : Types::HandOffTime
        )
        end
      end
    end
  end
end
