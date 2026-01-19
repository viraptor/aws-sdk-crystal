require "json"
require "time"

module AwsSdk
  module DynamoDB
    module Types

      # Contains details of a table archival operation.
      struct ArchivalSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the backup the table was archived to, when applicable in the
        # archival reason. If you wish to restore this backup to the same table name, you will need to delete
        # the original table.
        @[JSON::Field(key: "ArchivalBackupArn")]
        getter archival_backup_arn : String?

        # The date and time when table archival was initiated by DynamoDB, in UNIX epoch time format.
        @[JSON::Field(key: "ArchivalDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter archival_date_time : Time?

        # The reason DynamoDB archived the table. Currently, the only possible value is:
        # INACCESSIBLE_ENCRYPTION_CREDENTIALS - The table was archived due to the table's KMS key being
        # inaccessible for more than seven days. An On-Demand backup was created at the archival time.
        @[JSON::Field(key: "ArchivalReason")]
        getter archival_reason : String?

        def initialize(
          @archival_backup_arn : String? = nil,
          @archival_date_time : Time? = nil,
          @archival_reason : String? = nil
        )
        end
      end

      # Represents an attribute for describing the schema for the table and indexes.
      struct AttributeDefinition
        include JSON::Serializable

        # A name for the attribute.
        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # The data type for the attribute, where: S - the attribute is of type String N - the attribute is of
        # type Number B - the attribute is of type Binary
        @[JSON::Field(key: "AttributeType")]
        getter attribute_type : String

        def initialize(
          @attribute_name : String,
          @attribute_type : String
        )
        end
      end

      # Represents the data for an attribute. Each attribute value is described as a name-value pair. The
      # name is the data type, and the value is the data itself. For more information, see Data Types in the
      # Amazon DynamoDB Developer Guide .
      struct AttributeValue
        include JSON::Serializable

        # An attribute of type Binary. For example: "B": "dGhpcyB0ZXh0IGlzIGJhc2U2NC1lbmNvZGVk"
        @[JSON::Field(key: "B")]
        getter b : Bytes?

        # An attribute of type Boolean. For example: "BOOL": true
        @[JSON::Field(key: "BOOL")]
        getter bool : Bool?

        # An attribute of type Binary Set. For example: "BS": ["U3Vubnk=", "UmFpbnk=", "U25vd3k="]
        @[JSON::Field(key: "BS")]
        getter bs : Array(Bytes)?

        # An attribute of type List. For example: "L": [ {"S": "Cookies"} , {"S": "Coffee"}, {"N": "3.14159"}]
        @[JSON::Field(key: "L")]
        getter l : Array(Types::AttributeValue)?

        # An attribute of type Map. For example: "M": {"Name": {"S": "Joe"}, "Age": {"N": "35"}}
        @[JSON::Field(key: "M")]
        getter m : Hash(String, Types::AttributeValue)?

        # An attribute of type Number. For example: "N": "123.45" Numbers are sent across the network to
        # DynamoDB as strings, to maximize compatibility across languages and libraries. However, DynamoDB
        # treats them as number type attributes for mathematical operations.
        @[JSON::Field(key: "N")]
        getter n : String?

        # An attribute of type Number Set. For example: "NS": ["42.2", "-19", "7.5", "3.14"] Numbers are sent
        # across the network to DynamoDB as strings, to maximize compatibility across languages and libraries.
        # However, DynamoDB treats them as number type attributes for mathematical operations.
        @[JSON::Field(key: "NS")]
        getter ns : Array(String)?

        # An attribute of type Null. For example: "NULL": true
        @[JSON::Field(key: "NULL")]
        getter null : Bool?

        # An attribute of type String. For example: "S": "Hello"
        @[JSON::Field(key: "S")]
        getter s : String?

        # An attribute of type String Set. For example: "SS": ["Giraffe", "Hippo" ,"Zebra"]
        @[JSON::Field(key: "SS")]
        getter ss : Array(String)?

        def initialize(
          @b : Bytes? = nil,
          @bool : Bool? = nil,
          @bs : Array(Bytes)? = nil,
          @l : Array(Types::AttributeValue)? = nil,
          @m : Hash(String, Types::AttributeValue)? = nil,
          @n : String? = nil,
          @ns : Array(String)? = nil,
          @null : Bool? = nil,
          @s : String? = nil,
          @ss : Array(String)? = nil
        )
        end
      end

      # For the UpdateItem operation, represents the attributes to be modified, the action to perform on
      # each, and the new value for each. You cannot use UpdateItem to update any primary key attributes.
      # Instead, you will need to delete the item, and then use PutItem to create a new item with new
      # attributes. Attribute values cannot be null; string and binary type attributes must have lengths
      # greater than zero; and set type attributes must not be empty. Requests with empty values will be
      # rejected with a ValidationException exception.
      struct AttributeValueUpdate
        include JSON::Serializable

        # Specifies how to perform the update. Valid values are PUT (default), DELETE , and ADD . The behavior
        # depends on whether the specified primary key already exists in the table. If an item with the
        # specified Key is found in the table: PUT - Adds the specified attribute to the item. If the
        # attribute already exists, it is replaced by the new value. DELETE - If no value is specified, the
        # attribute and its value are removed from the item. The data type of the specified value must match
        # the existing value's data type. If a set of values is specified, then those values are subtracted
        # from the old set. For example, if the attribute value was the set [a,b,c] and the DELETE action
        # specified [a,c] , then the final attribute value would be [b] . Specifying an empty set is an error.
        # ADD - If the attribute does not already exist, then the attribute and its values are added to the
        # item. If the attribute does exist, then the behavior of ADD depends on the data type of the
        # attribute: If the existing attribute is a number, and if Value is also a number, then the Value is
        # mathematically added to the existing attribute. If Value is a negative number, then it is subtracted
        # from the existing attribute. If you use ADD to increment or decrement a number value for an item
        # that doesn't exist before the update, DynamoDB uses 0 as the initial value. In addition, if you use
        # ADD to update an existing item, and intend to increment or decrement an attribute value which does
        # not yet exist, DynamoDB uses 0 as the initial value. For example, suppose that the item you want to
        # update does not yet have an attribute named itemcount , but you decide to ADD the number 3 to this
        # attribute anyway, even though it currently does not exist. DynamoDB will create the itemcount
        # attribute, set its initial value to 0 , and finally add 3 to it. The result will be a new itemcount
        # attribute in the item, with a value of 3 . If the existing data type is a set, and if the Value is
        # also a set, then the Value is added to the existing set. (This is a set operation, not mathematical
        # addition.) For example, if the attribute value was the set [1,2] , and the ADD action specified [3]
        # , then the final attribute value would be [1,2,3] . An error occurs if an Add action is specified
        # for a set attribute and the attribute type specified does not match the existing set type. Both sets
        # must have the same primitive data type. For example, if the existing data type is a set of strings,
        # the Value must also be a set of strings. The same holds true for number sets and binary sets. This
        # action is only valid for an existing attribute whose data type is number or is a set. Do not use ADD
        # for any other data types. If no item with the specified Key is found: PUT - DynamoDB creates a new
        # item with the specified primary key, and then adds the attribute. DELETE - Nothing happens; there is
        # no attribute to delete. ADD - DynamoDB creates a new item with the supplied primary key and number
        # (or set) for the attribute value. The only data types allowed are number, number set, string set or
        # binary set.
        @[JSON::Field(key: "Action")]
        getter action : String?

        # Represents the data for an attribute. Each attribute value is described as a name-value pair. The
        # name is the data type, and the value is the data itself. For more information, see Data Types in the
        # Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "Value")]
        getter value : Types::AttributeValue?

        def initialize(
          @action : String? = nil,
          @value : Types::AttributeValue? = nil
        )
        end
      end

      # Represents the properties of the scaling policy.
      struct AutoScalingPolicyDescription
        include JSON::Serializable

        # The name of the scaling policy.
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String?

        # Represents a target tracking scaling policy configuration.
        @[JSON::Field(key: "TargetTrackingScalingPolicyConfiguration")]
        getter target_tracking_scaling_policy_configuration : Types::AutoScalingTargetTrackingScalingPolicyConfigurationDescription?

        def initialize(
          @policy_name : String? = nil,
          @target_tracking_scaling_policy_configuration : Types::AutoScalingTargetTrackingScalingPolicyConfigurationDescription? = nil
        )
        end
      end

      # Represents the auto scaling policy to be modified.
      struct AutoScalingPolicyUpdate
        include JSON::Serializable

        # Represents a target tracking scaling policy configuration.
        @[JSON::Field(key: "TargetTrackingScalingPolicyConfiguration")]
        getter target_tracking_scaling_policy_configuration : Types::AutoScalingTargetTrackingScalingPolicyConfigurationUpdate

        # The name of the scaling policy.
        @[JSON::Field(key: "PolicyName")]
        getter policy_name : String?

        def initialize(
          @target_tracking_scaling_policy_configuration : Types::AutoScalingTargetTrackingScalingPolicyConfigurationUpdate,
          @policy_name : String? = nil
        )
        end
      end

      # Represents the auto scaling settings for a global table or global secondary index.
      struct AutoScalingSettingsDescription
        include JSON::Serializable

        # Disabled auto scaling for this global table or global secondary index.
        @[JSON::Field(key: "AutoScalingDisabled")]
        getter auto_scaling_disabled : Bool?

        # Role ARN used for configuring the auto scaling policy.
        @[JSON::Field(key: "AutoScalingRoleArn")]
        getter auto_scaling_role_arn : String?

        # The maximum capacity units that a global table or global secondary index should be scaled up to.
        @[JSON::Field(key: "MaximumUnits")]
        getter maximum_units : Int64?

        # The minimum capacity units that a global table or global secondary index should be scaled down to.
        @[JSON::Field(key: "MinimumUnits")]
        getter minimum_units : Int64?

        # Information about the scaling policies.
        @[JSON::Field(key: "ScalingPolicies")]
        getter scaling_policies : Array(Types::AutoScalingPolicyDescription)?

        def initialize(
          @auto_scaling_disabled : Bool? = nil,
          @auto_scaling_role_arn : String? = nil,
          @maximum_units : Int64? = nil,
          @minimum_units : Int64? = nil,
          @scaling_policies : Array(Types::AutoScalingPolicyDescription)? = nil
        )
        end
      end

      # Represents the auto scaling settings to be modified for a global table or global secondary index.
      struct AutoScalingSettingsUpdate
        include JSON::Serializable

        # Disabled auto scaling for this global table or global secondary index.
        @[JSON::Field(key: "AutoScalingDisabled")]
        getter auto_scaling_disabled : Bool?

        # Role ARN used for configuring auto scaling policy.
        @[JSON::Field(key: "AutoScalingRoleArn")]
        getter auto_scaling_role_arn : String?

        # The maximum capacity units that a global table or global secondary index should be scaled up to.
        @[JSON::Field(key: "MaximumUnits")]
        getter maximum_units : Int64?

        # The minimum capacity units that a global table or global secondary index should be scaled down to.
        @[JSON::Field(key: "MinimumUnits")]
        getter minimum_units : Int64?

        # The scaling policy to apply for scaling target global table or global secondary index capacity
        # units.
        @[JSON::Field(key: "ScalingPolicyUpdate")]
        getter scaling_policy_update : Types::AutoScalingPolicyUpdate?

        def initialize(
          @auto_scaling_disabled : Bool? = nil,
          @auto_scaling_role_arn : String? = nil,
          @maximum_units : Int64? = nil,
          @minimum_units : Int64? = nil,
          @scaling_policy_update : Types::AutoScalingPolicyUpdate? = nil
        )
        end
      end

      # Represents the properties of a target tracking scaling policy.
      struct AutoScalingTargetTrackingScalingPolicyConfigurationDescription
        include JSON::Serializable

        # The target value for the metric. The range is 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to
        # 2e360 (Base 2).
        @[JSON::Field(key: "TargetValue")]
        getter target_value : Float64

        # Indicates whether scale in by the target tracking policy is disabled. If the value is true, scale in
        # is disabled and the target tracking policy won't remove capacity from the scalable resource.
        # Otherwise, scale in is enabled and the target tracking policy can remove capacity from the scalable
        # resource. The default value is false.
        @[JSON::Field(key: "DisableScaleIn")]
        getter disable_scale_in : Bool?

        # The amount of time, in seconds, after a scale in activity completes before another scale in activity
        # can start. The cooldown period is used to block subsequent scale in requests until it has expired.
        # You should scale in conservatively to protect your application's availability. However, if another
        # alarm triggers a scale out policy during the cooldown period after a scale-in, application auto
        # scaling scales out your scalable target immediately.
        @[JSON::Field(key: "ScaleInCooldown")]
        getter scale_in_cooldown : Int32?

        # The amount of time, in seconds, after a scale out activity completes before another scale out
        # activity can start. While the cooldown period is in effect, the capacity that has been added by the
        # previous scale out event that initiated the cooldown is calculated as part of the desired capacity
        # for the next scale out. You should continuously (but not excessively) scale out.
        @[JSON::Field(key: "ScaleOutCooldown")]
        getter scale_out_cooldown : Int32?

        def initialize(
          @target_value : Float64,
          @disable_scale_in : Bool? = nil,
          @scale_in_cooldown : Int32? = nil,
          @scale_out_cooldown : Int32? = nil
        )
        end
      end

      # Represents the settings of a target tracking scaling policy that will be modified.
      struct AutoScalingTargetTrackingScalingPolicyConfigurationUpdate
        include JSON::Serializable

        # The target value for the metric. The range is 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to
        # 2e360 (Base 2).
        @[JSON::Field(key: "TargetValue")]
        getter target_value : Float64

        # Indicates whether scale in by the target tracking policy is disabled. If the value is true, scale in
        # is disabled and the target tracking policy won't remove capacity from the scalable resource.
        # Otherwise, scale in is enabled and the target tracking policy can remove capacity from the scalable
        # resource. The default value is false.
        @[JSON::Field(key: "DisableScaleIn")]
        getter disable_scale_in : Bool?

        # The amount of time, in seconds, after a scale in activity completes before another scale in activity
        # can start. The cooldown period is used to block subsequent scale in requests until it has expired.
        # You should scale in conservatively to protect your application's availability. However, if another
        # alarm triggers a scale out policy during the cooldown period after a scale-in, application auto
        # scaling scales out your scalable target immediately.
        @[JSON::Field(key: "ScaleInCooldown")]
        getter scale_in_cooldown : Int32?

        # The amount of time, in seconds, after a scale out activity completes before another scale out
        # activity can start. While the cooldown period is in effect, the capacity that has been added by the
        # previous scale out event that initiated the cooldown is calculated as part of the desired capacity
        # for the next scale out. You should continuously (but not excessively) scale out.
        @[JSON::Field(key: "ScaleOutCooldown")]
        getter scale_out_cooldown : Int32?

        def initialize(
          @target_value : Float64,
          @disable_scale_in : Bool? = nil,
          @scale_in_cooldown : Int32? = nil,
          @scale_out_cooldown : Int32? = nil
        )
        end
      end

      # Contains the description of the backup created for the table.
      struct BackupDescription
        include JSON::Serializable

        # Contains the details of the backup created for the table.
        @[JSON::Field(key: "BackupDetails")]
        getter backup_details : Types::BackupDetails?

        # Contains the details of the table when the backup was created.
        @[JSON::Field(key: "SourceTableDetails")]
        getter source_table_details : Types::SourceTableDetails?

        # Contains the details of the features enabled on the table when the backup was created. For example,
        # LSIs, GSIs, streams, TTL.
        @[JSON::Field(key: "SourceTableFeatureDetails")]
        getter source_table_feature_details : Types::SourceTableFeatureDetails?

        def initialize(
          @backup_details : Types::BackupDetails? = nil,
          @source_table_details : Types::SourceTableDetails? = nil,
          @source_table_feature_details : Types::SourceTableFeatureDetails? = nil
        )
        end
      end

      # Contains the details of the backup created for the table.
      struct BackupDetails
        include JSON::Serializable

        # ARN associated with the backup.
        @[JSON::Field(key: "BackupArn")]
        getter backup_arn : String

        # Time at which the backup was created. This is the request time of the backup.
        @[JSON::Field(key: "BackupCreationDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter backup_creation_date_time : Time

        # Name of the requested backup.
        @[JSON::Field(key: "BackupName")]
        getter backup_name : String

        # Backup can be in one of the following states: CREATING, ACTIVE, DELETED.
        @[JSON::Field(key: "BackupStatus")]
        getter backup_status : String

        # BackupType: USER - You create and manage these using the on-demand backup feature. SYSTEM - If you
        # delete a table with point-in-time recovery enabled, a SYSTEM backup is automatically created and is
        # retained for 35 days (at no additional cost). System backups allow you to restore the deleted table
        # to the state it was in just before the point of deletion. AWS_BACKUP - On-demand backup created by
        # you from Backup service.
        @[JSON::Field(key: "BackupType")]
        getter backup_type : String

        # Time at which the automatic on-demand backup created by DynamoDB will expire. This SYSTEM on-demand
        # backup expires automatically 35 days after its creation.
        @[JSON::Field(key: "BackupExpiryDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter backup_expiry_date_time : Time?

        # Size of the backup in bytes. DynamoDB updates this value approximately every six hours. Recent
        # changes might not be reflected in this value.
        @[JSON::Field(key: "BackupSizeBytes")]
        getter backup_size_bytes : Int64?

        def initialize(
          @backup_arn : String,
          @backup_creation_date_time : Time,
          @backup_name : String,
          @backup_status : String,
          @backup_type : String,
          @backup_expiry_date_time : Time? = nil,
          @backup_size_bytes : Int64? = nil
        )
        end
      end

      # There is another ongoing conflicting backup control plane operation on the table. The backup is
      # either being created, deleted or restored to a table.
      struct BackupInUseException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Backup not found for the given BackupARN.
      struct BackupNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details for the backup.
      struct BackupSummary
        include JSON::Serializable

        # ARN associated with the backup.
        @[JSON::Field(key: "BackupArn")]
        getter backup_arn : String?

        # Time at which the backup was created.
        @[JSON::Field(key: "BackupCreationDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter backup_creation_date_time : Time?

        # Time at which the automatic on-demand backup created by DynamoDB will expire. This SYSTEM on-demand
        # backup expires automatically 35 days after its creation.
        @[JSON::Field(key: "BackupExpiryDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter backup_expiry_date_time : Time?

        # Name of the specified backup.
        @[JSON::Field(key: "BackupName")]
        getter backup_name : String?

        # Size of the backup in bytes.
        @[JSON::Field(key: "BackupSizeBytes")]
        getter backup_size_bytes : Int64?

        # Backup can be in one of the following states: CREATING, ACTIVE, DELETED.
        @[JSON::Field(key: "BackupStatus")]
        getter backup_status : String?

        # BackupType: USER - You create and manage these using the on-demand backup feature. SYSTEM - If you
        # delete a table with point-in-time recovery enabled, a SYSTEM backup is automatically created and is
        # retained for 35 days (at no additional cost). System backups allow you to restore the deleted table
        # to the state it was in just before the point of deletion. AWS_BACKUP - On-demand backup created by
        # you from Backup service.
        @[JSON::Field(key: "BackupType")]
        getter backup_type : String?

        # ARN associated with the table.
        @[JSON::Field(key: "TableArn")]
        getter table_arn : String?

        # Unique identifier for the table.
        @[JSON::Field(key: "TableId")]
        getter table_id : String?

        # Name of the table.
        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        def initialize(
          @backup_arn : String? = nil,
          @backup_creation_date_time : Time? = nil,
          @backup_expiry_date_time : Time? = nil,
          @backup_name : String? = nil,
          @backup_size_bytes : Int64? = nil,
          @backup_status : String? = nil,
          @backup_type : String? = nil,
          @table_arn : String? = nil,
          @table_id : String? = nil,
          @table_name : String? = nil
        )
        end
      end

      struct BatchExecuteStatementInput
        include JSON::Serializable

        # The list of PartiQL statements representing the batch to run.
        @[JSON::Field(key: "Statements")]
        getter statements : Array(Types::BatchStatementRequest)

        @[JSON::Field(key: "ReturnConsumedCapacity")]
        getter return_consumed_capacity : String?

        def initialize(
          @statements : Array(Types::BatchStatementRequest),
          @return_consumed_capacity : String? = nil
        )
        end
      end

      struct BatchExecuteStatementOutput
        include JSON::Serializable

        # The capacity units consumed by the entire operation. The values of the list are ordered according to
        # the ordering of the statements.
        @[JSON::Field(key: "ConsumedCapacity")]
        getter consumed_capacity : Array(Types::ConsumedCapacity)?

        # The response to each PartiQL statement in the batch. The values of the list are ordered according to
        # the ordering of the request statements.
        @[JSON::Field(key: "Responses")]
        getter responses : Array(Types::BatchStatementResponse)?

        def initialize(
          @consumed_capacity : Array(Types::ConsumedCapacity)? = nil,
          @responses : Array(Types::BatchStatementResponse)? = nil
        )
        end
      end

      # Represents the input of a BatchGetItem operation.
      struct BatchGetItemInput
        include JSON::Serializable

        # A map of one or more table names or table ARNs and, for each table, a map that describes one or more
        # items to retrieve from that table. Each table name or ARN can be used only once per BatchGetItem
        # request. Each element in the map of items to retrieve consists of the following: ConsistentRead - If
        # true , a strongly consistent read is used; if false (the default), an eventually consistent read is
        # used. ExpressionAttributeNames - One or more substitution tokens for attribute names in the
        # ProjectionExpression parameter. The following are some use cases for using ExpressionAttributeNames
        # : To access an attribute whose name conflicts with a DynamoDB reserved word. To create a placeholder
        # for repeating occurrences of an attribute name in an expression. To prevent special characters in an
        # attribute name from being misinterpreted in an expression. Use the # character in an expression to
        # dereference an attribute name. For example, consider the following attribute name: Percentile The
        # name of this attribute conflicts with a reserved word, so it cannot be used directly in an
        # expression. (For the complete list of reserved words, see Reserved Words in the Amazon DynamoDB
        # Developer Guide ). To work around this, you could specify the following for ExpressionAttributeNames
        # : {"#P":"Percentile"} You could then use this substitution in an expression, as in this example: #P
        # = :val Tokens that begin with the : character are expression attribute values , which are
        # placeholders for the actual value at runtime. For more information about expression attribute names,
        # see Accessing Item Attributes in the Amazon DynamoDB Developer Guide . Keys - An array of primary
        # key attribute values that define specific items in the table. For each primary key, you must provide
        # all of the key attributes. For example, with a simple primary key, you only need to provide the
        # partition key value. For a composite key, you must provide both the partition key value and the sort
        # key value. ProjectionExpression - A string that identifies one or more attributes to retrieve from
        # the table. These attributes can include scalars, sets, or elements of a JSON document. The
        # attributes in the expression must be separated by commas. If no attribute names are specified, then
        # all attributes are returned. If any of the requested attributes are not found, they do not appear in
        # the result. For more information, see Accessing Item Attributes in the Amazon DynamoDB Developer
        # Guide . AttributesToGet - This is a legacy parameter. Use ProjectionExpression instead. For more
        # information, see AttributesToGet in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "RequestItems")]
        getter request_items : Hash(String, Types::KeysAndAttributes)

        @[JSON::Field(key: "ReturnConsumedCapacity")]
        getter return_consumed_capacity : String?

        def initialize(
          @request_items : Hash(String, Types::KeysAndAttributes),
          @return_consumed_capacity : String? = nil
        )
        end
      end

      # Represents the output of a BatchGetItem operation.
      struct BatchGetItemOutput
        include JSON::Serializable

        # The read capacity units consumed by the entire BatchGetItem operation. Each element consists of:
        # TableName - The table that consumed the provisioned throughput. CapacityUnits - The total number of
        # capacity units consumed.
        @[JSON::Field(key: "ConsumedCapacity")]
        getter consumed_capacity : Array(Types::ConsumedCapacity)?

        # A map of table name or table ARN to a list of items. Each object in Responses consists of a table
        # name or ARN, along with a map of attribute data consisting of the data type and attribute value.
        @[JSON::Field(key: "Responses")]
        getter responses : Hash(String, Array(Hash(String, Types::AttributeValue)))?

        # A map of tables and their respective keys that were not processed with the current response. The
        # UnprocessedKeys value is in the same form as RequestItems , so the value can be provided directly to
        # a subsequent BatchGetItem operation. For more information, see RequestItems in the Request
        # Parameters section. Each element consists of: Keys - An array of primary key attribute values that
        # define specific items in the table. ProjectionExpression - One or more attributes to be retrieved
        # from the table or index. By default, all attributes are returned. If a requested attribute is not
        # found, it does not appear in the result. ConsistentRead - The consistency of a read operation. If
        # set to true , then a strongly consistent read is used; otherwise, an eventually consistent read is
        # used. If there are no unprocessed keys remaining, the response contains an empty UnprocessedKeys
        # map.
        @[JSON::Field(key: "UnprocessedKeys")]
        getter unprocessed_keys : Hash(String, Types::KeysAndAttributes)?

        def initialize(
          @consumed_capacity : Array(Types::ConsumedCapacity)? = nil,
          @responses : Hash(String, Array(Hash(String, Types::AttributeValue)))? = nil,
          @unprocessed_keys : Hash(String, Types::KeysAndAttributes)? = nil
        )
        end
      end

      # An error associated with a statement in a PartiQL batch that was run.
      struct BatchStatementError
        include JSON::Serializable

        # The error code associated with the failed PartiQL batch statement.
        @[JSON::Field(key: "Code")]
        getter code : String?

        # The item which caused the condition check to fail. This will be set if
        # ReturnValuesOnConditionCheckFailure is specified as ALL_OLD .
        @[JSON::Field(key: "Item")]
        getter item : Hash(String, Types::AttributeValue)?

        # The error message associated with the PartiQL batch response.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @item : Hash(String, Types::AttributeValue)? = nil,
          @message : String? = nil
        )
        end
      end

      # A PartiQL batch statement request.
      struct BatchStatementRequest
        include JSON::Serializable

        # A valid PartiQL statement.
        @[JSON::Field(key: "Statement")]
        getter statement : String

        # The read consistency of the PartiQL batch request.
        @[JSON::Field(key: "ConsistentRead")]
        getter consistent_read : Bool?

        # The parameters associated with a PartiQL statement in the batch request.
        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::AttributeValue)?

        # An optional parameter that returns the item attributes for a PartiQL batch request operation that
        # failed a condition check. There is no additional cost associated with requesting a return value
        # aside from the small network and processing overhead of receiving a larger response. No read
        # capacity units are consumed.
        @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure")]
        getter return_values_on_condition_check_failure : String?

        def initialize(
          @statement : String,
          @consistent_read : Bool? = nil,
          @parameters : Array(Types::AttributeValue)? = nil,
          @return_values_on_condition_check_failure : String? = nil
        )
        end
      end

      # A PartiQL batch statement response..
      struct BatchStatementResponse
        include JSON::Serializable

        # The error associated with a failed PartiQL batch statement.
        @[JSON::Field(key: "Error")]
        getter error : Types::BatchStatementError?

        # A DynamoDB item associated with a BatchStatementResponse
        @[JSON::Field(key: "Item")]
        getter item : Hash(String, Types::AttributeValue)?

        # The table name associated with a failed PartiQL batch statement.
        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        def initialize(
          @error : Types::BatchStatementError? = nil,
          @item : Hash(String, Types::AttributeValue)? = nil,
          @table_name : String? = nil
        )
        end
      end

      # Represents the input of a BatchWriteItem operation.
      struct BatchWriteItemInput
        include JSON::Serializable

        # A map of one or more table names or table ARNs and, for each table, a list of operations to be
        # performed ( DeleteRequest or PutRequest ). Each element in the map consists of the following:
        # DeleteRequest - Perform a DeleteItem operation on the specified item. The item to be deleted is
        # identified by a Key subelement: Key - A map of primary key attribute values that uniquely identify
        # the item. Each entry in this map consists of an attribute name and an attribute value. For each
        # primary key, you must provide all of the key attributes. For example, with a simple primary key, you
        # only need to provide a value for the partition key. For a composite primary key, you must provide
        # values for both the partition key and the sort key. PutRequest - Perform a PutItem operation on the
        # specified item. The item to be put is identified by an Item subelement: Item - A map of attributes
        # and their values. Each entry in this map consists of an attribute name and an attribute value.
        # Attribute values must not be null; string and binary type attributes must have lengths greater than
        # zero; and set type attributes must not be empty. Requests that contain empty values are rejected
        # with a ValidationException exception. If you specify any attributes that are part of an index key,
        # then the data types for those attributes must match those of the schema in the table's attribute
        # definition.
        @[JSON::Field(key: "RequestItems")]
        getter request_items : Hash(String, Array(Types::WriteRequest))

        @[JSON::Field(key: "ReturnConsumedCapacity")]
        getter return_consumed_capacity : String?

        # Determines whether item collection metrics are returned. If set to SIZE , the response includes
        # statistics about item collections, if any, that were modified during the operation are returned in
        # the response. If set to NONE (the default), no statistics are returned.
        @[JSON::Field(key: "ReturnItemCollectionMetrics")]
        getter return_item_collection_metrics : String?

        def initialize(
          @request_items : Hash(String, Array(Types::WriteRequest)),
          @return_consumed_capacity : String? = nil,
          @return_item_collection_metrics : String? = nil
        )
        end
      end

      # Represents the output of a BatchWriteItem operation.
      struct BatchWriteItemOutput
        include JSON::Serializable

        # The capacity units consumed by the entire BatchWriteItem operation. Each element consists of:
        # TableName - The table that consumed the provisioned throughput. CapacityUnits - The total number of
        # capacity units consumed.
        @[JSON::Field(key: "ConsumedCapacity")]
        getter consumed_capacity : Array(Types::ConsumedCapacity)?

        # A list of tables that were processed by BatchWriteItem and, for each table, information about any
        # item collections that were affected by individual DeleteItem or PutItem operations. Each entry
        # consists of the following subelements: ItemCollectionKey - The partition key value of the item
        # collection. This is the same as the partition key value of the item. SizeEstimateRangeGB - An
        # estimate of item collection size, expressed in GB. This is a two-element array containing a lower
        # bound and an upper bound for the estimate. The estimate includes the size of all the items in the
        # table, plus the size of all attributes projected into all of the local secondary indexes on the
        # table. Use this estimate to measure whether a local secondary index is approaching its size limit.
        # The estimate is subject to change over time; therefore, do not rely on the precision or accuracy of
        # the estimate.
        @[JSON::Field(key: "ItemCollectionMetrics")]
        getter item_collection_metrics : Hash(String, Array(Types::ItemCollectionMetrics))?

        # A map of tables and requests against those tables that were not processed. The UnprocessedItems
        # value is in the same form as RequestItems , so you can provide this value directly to a subsequent
        # BatchWriteItem operation. For more information, see RequestItems in the Request Parameters section.
        # Each UnprocessedItems entry consists of a table name or table ARN and, for that table, a list of
        # operations to perform ( DeleteRequest or PutRequest ). DeleteRequest - Perform a DeleteItem
        # operation on the specified item. The item to be deleted is identified by a Key subelement: Key - A
        # map of primary key attribute values that uniquely identify the item. Each entry in this map consists
        # of an attribute name and an attribute value. PutRequest - Perform a PutItem operation on the
        # specified item. The item to be put is identified by an Item subelement: Item - A map of attributes
        # and their values. Each entry in this map consists of an attribute name and an attribute value.
        # Attribute values must not be null; string and binary type attributes must have lengths greater than
        # zero; and set type attributes must not be empty. Requests that contain empty values will be rejected
        # with a ValidationException exception. If you specify any attributes that are part of an index key,
        # then the data types for those attributes must match those of the schema in the table's attribute
        # definition. If there are no unprocessed items remaining, the response contains an empty
        # UnprocessedItems map.
        @[JSON::Field(key: "UnprocessedItems")]
        getter unprocessed_items : Hash(String, Array(Types::WriteRequest))?

        def initialize(
          @consumed_capacity : Array(Types::ConsumedCapacity)? = nil,
          @item_collection_metrics : Hash(String, Array(Types::ItemCollectionMetrics))? = nil,
          @unprocessed_items : Hash(String, Array(Types::WriteRequest))? = nil
        )
        end
      end

      # Contains the details for the read/write capacity mode. This page talks about PROVISIONED and
      # PAY_PER_REQUEST billing modes. For more information about these modes, see Read/write capacity mode
      # . You may need to switch to on-demand mode at least once in order to return a BillingModeSummary
      # response.
      struct BillingModeSummary
        include JSON::Serializable

        # Controls how you are charged for read and write throughput and how you manage capacity. This setting
        # can be changed later. PROVISIONED - Sets the read/write capacity mode to PROVISIONED . We recommend
        # using PROVISIONED for predictable workloads. PAY_PER_REQUEST - Sets the read/write capacity mode to
        # PAY_PER_REQUEST . We recommend using PAY_PER_REQUEST for unpredictable workloads.
        @[JSON::Field(key: "BillingMode")]
        getter billing_mode : String?

        # Represents the time when PAY_PER_REQUEST was last set as the read/write capacity mode.
        @[JSON::Field(key: "LastUpdateToPayPerRequestDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_to_pay_per_request_date_time : Time?

        def initialize(
          @billing_mode : String? = nil,
          @last_update_to_pay_per_request_date_time : Time? = nil
        )
        end
      end

      # An ordered list of errors for each item in the request which caused the transaction to get
      # cancelled. The values of the list are ordered according to the ordering of the TransactWriteItems
      # request parameter. If no error occurred for the associated item an error with a Null code and Null
      # message will be present.
      struct CancellationReason
        include JSON::Serializable

        # Status code for the result of the cancelled transaction.
        @[JSON::Field(key: "Code")]
        getter code : String?

        # Item in the request which caused the transaction to get cancelled.
        @[JSON::Field(key: "Item")]
        getter item : Hash(String, Types::AttributeValue)?

        # Cancellation reason message description.
        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @item : Hash(String, Types::AttributeValue)? = nil,
          @message : String? = nil
        )
        end
      end

      # Represents the amount of provisioned throughput capacity consumed on a table or an index.
      struct Capacity
        include JSON::Serializable

        # The total number of capacity units consumed on a table or an index.
        @[JSON::Field(key: "CapacityUnits")]
        getter capacity_units : Float64?

        # The total number of read capacity units consumed on a table or an index.
        @[JSON::Field(key: "ReadCapacityUnits")]
        getter read_capacity_units : Float64?

        # The total number of write capacity units consumed on a table or an index.
        @[JSON::Field(key: "WriteCapacityUnits")]
        getter write_capacity_units : Float64?

        def initialize(
          @capacity_units : Float64? = nil,
          @read_capacity_units : Float64? = nil,
          @write_capacity_units : Float64? = nil
        )
        end
      end

      # Represents the selection criteria for a Query or Scan operation: For a Query operation, Condition is
      # used for specifying the KeyConditions to use when querying a table or an index. For KeyConditions ,
      # only the following comparison operators are supported: EQ | LE | LT | GE | GT | BEGINS_WITH |
      # BETWEEN Condition is also used in a QueryFilter , which evaluates the query results and returns only
      # the desired values. For a Scan operation, Condition is used in a ScanFilter , which evaluates the
      # scan results and returns only the desired values.
      struct Condition
        include JSON::Serializable

        # A comparator for evaluating attributes. For example, equals, greater than, less than, etc. The
        # following comparison operators are available: EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL |
        # CONTAINS | NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN The following are descriptions of each
        # comparison operator. EQ : Equal. EQ is supported for all data types, including lists and maps.
        # AttributeValueList can contain only one AttributeValue element of type String, Number, Binary,
        # String Set, Number Set, or Binary Set. If an item contains an AttributeValue element of a different
        # type than the one provided in the request, the value does not match. For example, {"S":"6"} does not
        # equal {"N":"6"} . Also, {"N":"6"} does not equal {"NS":["6", "2", "1"]} . NE : Not equal. NE is
        # supported for all data types, including lists and maps. AttributeValueList can contain only one
        # AttributeValue of type String, Number, Binary, String Set, Number Set, or Binary Set. If an item
        # contains an AttributeValue of a different type than the one provided in the request, the value does
        # not match. For example, {"S":"6"} does not equal {"N":"6"} . Also, {"N":"6"} does not equal
        # {"NS":["6", "2", "1"]} . LE : Less than or equal. AttributeValueList can contain only one
        # AttributeValue element of type String, Number, or Binary (not a set type). If an item contains an
        # AttributeValue element of a different type than the one provided in the request, the value does not
        # match. For example, {"S":"6"} does not equal {"N":"6"} . Also, {"N":"6"} does not compare to
        # {"NS":["6", "2", "1"]} . LT : Less than. AttributeValueList can contain only one AttributeValue of
        # type String, Number, or Binary (not a set type). If an item contains an AttributeValue element of a
        # different type than the one provided in the request, the value does not match. For example,
        # {"S":"6"} does not equal {"N":"6"} . Also, {"N":"6"} does not compare to {"NS":["6", "2", "1"]} . GE
        # : Greater than or equal. AttributeValueList can contain only one AttributeValue element of type
        # String, Number, or Binary (not a set type). If an item contains an AttributeValue element of a
        # different type than the one provided in the request, the value does not match. For example,
        # {"S":"6"} does not equal {"N":"6"} . Also, {"N":"6"} does not compare to {"NS":["6", "2", "1"]} . GT
        # : Greater than. AttributeValueList can contain only one AttributeValue element of type String,
        # Number, or Binary (not a set type). If an item contains an AttributeValue element of a different
        # type than the one provided in the request, the value does not match. For example, {"S":"6"} does not
        # equal {"N":"6"} . Also, {"N":"6"} does not compare to {"NS":["6", "2", "1"]} . NOT_NULL : The
        # attribute exists. NOT_NULL is supported for all data types, including lists and maps. This operator
        # tests for the existence of an attribute, not its data type. If the data type of attribute " a " is
        # null, and you evaluate it using NOT_NULL , the result is a Boolean true . This result is because the
        # attribute " a " exists; its data type is not relevant to the NOT_NULL comparison operator. NULL :
        # The attribute does not exist. NULL is supported for all data types, including lists and maps. This
        # operator tests for the nonexistence of an attribute, not its data type. If the data type of
        # attribute " a " is null, and you evaluate it using NULL , the result is a Boolean false . This is
        # because the attribute " a " exists; its data type is not relevant to the NULL comparison operator.
        # CONTAINS : Checks for a subsequence, or value in a set. AttributeValueList can contain only one
        # AttributeValue element of type String, Number, or Binary (not a set type). If the target attribute
        # of the comparison is of type String, then the operator checks for a substring match. If the target
        # attribute of the comparison is of type Binary, then the operator looks for a subsequence of the
        # target that matches the input. If the target attribute of the comparison is a set (" SS ", " NS ",
        # or " BS "), then the operator evaluates to true if it finds an exact match with any member of the
        # set. CONTAINS is supported for lists: When evaluating " a CONTAINS b ", " a " can be a list;
        # however, " b " cannot be a set, a map, or a list. NOT_CONTAINS : Checks for absence of a
        # subsequence, or absence of a value in a set. AttributeValueList can contain only one AttributeValue
        # element of type String, Number, or Binary (not a set type). If the target attribute of the
        # comparison is a String, then the operator checks for the absence of a substring match. If the target
        # attribute of the comparison is Binary, then the operator checks for the absence of a subsequence of
        # the target that matches the input. If the target attribute of the comparison is a set (" SS ", " NS
        # ", or " BS "), then the operator evaluates to true if it does not find an exact match with any
        # member of the set. NOT_CONTAINS is supported for lists: When evaluating " a NOT CONTAINS b ", " a "
        # can be a list; however, " b " cannot be a set, a map, or a list. BEGINS_WITH : Checks for a prefix.
        # AttributeValueList can contain only one AttributeValue of type String or Binary (not a Number or a
        # set type). The target attribute of the comparison must be of type String or Binary (not a Number or
        # a set type). IN : Checks for matching elements in a list. AttributeValueList can contain one or more
        # AttributeValue elements of type String, Number, or Binary. These attributes are compared against an
        # existing attribute of an item. If any elements of the input are equal to the item attribute, the
        # expression evaluates to true. BETWEEN : Greater than or equal to the first value, and less than or
        # equal to the second value. AttributeValueList must contain two AttributeValue elements of the same
        # type, either String, Number, or Binary (not a set type). A target attribute matches if the target
        # value is greater than, or equal to, the first element and less than, or equal to, the second
        # element. If an item contains an AttributeValue element of a different type than the one provided in
        # the request, the value does not match. For example, {"S":"6"} does not compare to {"N":"6"} . Also,
        # {"N":"6"} does not compare to {"NS":["6", "2", "1"]} For usage examples of AttributeValueList and
        # ComparisonOperator , see Legacy Conditional Parameters in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "ComparisonOperator")]
        getter comparison_operator : String

        # One or more values to evaluate against the supplied attribute. The number of values in the list
        # depends on the ComparisonOperator being used. For type Number, value comparisons are numeric. String
        # value comparisons for greater than, equals, or less than are based on ASCII character code values.
        # For example, a is greater than A , and a is greater than B . For a list of code values, see
        # http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters . For Binary, DynamoDB treats each
        # byte of the binary data as unsigned when it compares binary values.
        @[JSON::Field(key: "AttributeValueList")]
        getter attribute_value_list : Array(Types::AttributeValue)?

        def initialize(
          @comparison_operator : String,
          @attribute_value_list : Array(Types::AttributeValue)? = nil
        )
        end
      end

      # Represents a request to perform a check that an item exists or to check the condition of specific
      # attributes of the item.
      struct ConditionCheck
        include JSON::Serializable

        # A condition that must be satisfied in order for a conditional update to succeed. For more
        # information, see Condition expressions in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "ConditionExpression")]
        getter condition_expression : String

        # The primary key of the item to be checked. Each element consists of an attribute name and a value
        # for that attribute.
        @[JSON::Field(key: "Key")]
        getter key : Hash(String, Types::AttributeValue)

        # Name of the table for the check item request. You can also provide the Amazon Resource Name (ARN) of
        # the table in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # One or more substitution tokens for attribute names in an expression. For more information, see
        # Expression attribute names in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "ExpressionAttributeNames")]
        getter expression_attribute_names : Hash(String, String)?

        # One or more values that can be substituted in an expression. For more information, see Condition
        # expressions in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "ExpressionAttributeValues")]
        getter expression_attribute_values : Hash(String, Types::AttributeValue)?

        # Use ReturnValuesOnConditionCheckFailure to get the item attributes if the ConditionCheck condition
        # fails. For ReturnValuesOnConditionCheckFailure , the valid values are: NONE and ALL_OLD.
        @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure")]
        getter return_values_on_condition_check_failure : String?

        def initialize(
          @condition_expression : String,
          @key : Hash(String, Types::AttributeValue),
          @table_name : String,
          @expression_attribute_names : Hash(String, String)? = nil,
          @expression_attribute_values : Hash(String, Types::AttributeValue)? = nil,
          @return_values_on_condition_check_failure : String? = nil
        )
        end
      end

      # A condition specified in the operation failed to be evaluated.
      struct ConditionalCheckFailedException
        include JSON::Serializable

        # Item which caused the ConditionalCheckFailedException .
        @[JSON::Field(key: "Item")]
        getter item : Hash(String, Types::AttributeValue)?

        # The conditional request failed.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @item : Hash(String, Types::AttributeValue)? = nil,
          @message : String? = nil
        )
        end
      end

      # The capacity units consumed by an operation. The data returned includes the total provisioned
      # throughput consumed, along with statistics for the table and any indexes involved in the operation.
      # ConsumedCapacity is only returned if the request asked for it. For more information, see Provisioned
      # capacity mode in the Amazon DynamoDB Developer Guide .
      struct ConsumedCapacity
        include JSON::Serializable

        # The total number of capacity units consumed by the operation.
        @[JSON::Field(key: "CapacityUnits")]
        getter capacity_units : Float64?

        # The amount of throughput consumed on each global index affected by the operation.
        @[JSON::Field(key: "GlobalSecondaryIndexes")]
        getter global_secondary_indexes : Hash(String, Types::Capacity)?

        # The amount of throughput consumed on each local index affected by the operation.
        @[JSON::Field(key: "LocalSecondaryIndexes")]
        getter local_secondary_indexes : Hash(String, Types::Capacity)?

        # The total number of read capacity units consumed by the operation.
        @[JSON::Field(key: "ReadCapacityUnits")]
        getter read_capacity_units : Float64?

        # The amount of throughput consumed on the table affected by the operation.
        @[JSON::Field(key: "Table")]
        getter table : Types::Capacity?

        # The name of the table that was affected by the operation. If you had specified the Amazon Resource
        # Name (ARN) of a table in the input, you'll see the table ARN in the response.
        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        # The total number of write capacity units consumed by the operation.
        @[JSON::Field(key: "WriteCapacityUnits")]
        getter write_capacity_units : Float64?

        def initialize(
          @capacity_units : Float64? = nil,
          @global_secondary_indexes : Hash(String, Types::Capacity)? = nil,
          @local_secondary_indexes : Hash(String, Types::Capacity)? = nil,
          @read_capacity_units : Float64? = nil,
          @table : Types::Capacity? = nil,
          @table_name : String? = nil,
          @write_capacity_units : Float64? = nil
        )
        end
      end

      # Represents the continuous backups and point in time recovery settings on the table.
      struct ContinuousBackupsDescription
        include JSON::Serializable

        # ContinuousBackupsStatus can be one of the following states: ENABLED, DISABLED
        @[JSON::Field(key: "ContinuousBackupsStatus")]
        getter continuous_backups_status : String

        # The description of the point in time recovery settings applied to the table.
        @[JSON::Field(key: "PointInTimeRecoveryDescription")]
        getter point_in_time_recovery_description : Types::PointInTimeRecoveryDescription?

        def initialize(
          @continuous_backups_status : String,
          @point_in_time_recovery_description : Types::PointInTimeRecoveryDescription? = nil
        )
        end
      end

      # Backups have not yet been enabled for this table.
      struct ContinuousBackupsUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents a Contributor Insights summary entry.
      struct ContributorInsightsSummary
        include JSON::Serializable

        # Indicates the current mode of CloudWatch Contributor Insights, specifying whether it tracks all
        # access and throttled events or throttled events only for the DynamoDB table or index.
        @[JSON::Field(key: "ContributorInsightsMode")]
        getter contributor_insights_mode : String?

        # Describes the current status for contributor insights for the given table and index, if applicable.
        @[JSON::Field(key: "ContributorInsightsStatus")]
        getter contributor_insights_status : String?

        # Name of the index associated with the summary, if any.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        # Name of the table associated with the summary.
        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        def initialize(
          @contributor_insights_mode : String? = nil,
          @contributor_insights_status : String? = nil,
          @index_name : String? = nil,
          @table_name : String? = nil
        )
        end
      end

      struct CreateBackupInput
        include JSON::Serializable

        # Specified name for the backup.
        @[JSON::Field(key: "BackupName")]
        getter backup_name : String

        # The name of the table. You can also provide the Amazon Resource Name (ARN) of the table in this
        # parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        def initialize(
          @backup_name : String,
          @table_name : String
        )
        end
      end

      struct CreateBackupOutput
        include JSON::Serializable

        # Contains the details of the backup created for the table.
        @[JSON::Field(key: "BackupDetails")]
        getter backup_details : Types::BackupDetails?

        def initialize(
          @backup_details : Types::BackupDetails? = nil
        )
        end
      end

      # Represents a new global secondary index to be added to an existing table.
      struct CreateGlobalSecondaryIndexAction
        include JSON::Serializable

        # The name of the global secondary index to be created.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # The key schema for the global secondary index.
        @[JSON::Field(key: "KeySchema")]
        getter key_schema : Array(Types::KeySchemaElement)

        # Represents attributes that are copied (projected) from the table into an index. These are in
        # addition to the primary key attributes and index key attributes, which are automatically projected.
        @[JSON::Field(key: "Projection")]
        getter projection : Types::Projection

        # The maximum number of read and write units for the global secondary index being created. If you use
        # this parameter, you must specify MaxReadRequestUnits , MaxWriteRequestUnits , or both. You must use
        # either OnDemand Throughput or ProvisionedThroughput based on your table's capacity mode.
        @[JSON::Field(key: "OnDemandThroughput")]
        getter on_demand_throughput : Types::OnDemandThroughput?

        # Represents the provisioned throughput settings for the specified global secondary index. For current
        # minimum and maximum provisioned throughput values, see Service, Account, and Table Quotas in the
        # Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "ProvisionedThroughput")]
        getter provisioned_throughput : Types::ProvisionedThroughput?

        # Represents the warm throughput value (in read units per second and write units per second) when
        # creating a secondary index.
        @[JSON::Field(key: "WarmThroughput")]
        getter warm_throughput : Types::WarmThroughput?

        def initialize(
          @index_name : String,
          @key_schema : Array(Types::KeySchemaElement),
          @projection : Types::Projection,
          @on_demand_throughput : Types::OnDemandThroughput? = nil,
          @provisioned_throughput : Types::ProvisionedThroughput? = nil,
          @warm_throughput : Types::WarmThroughput? = nil
        )
        end
      end

      struct CreateGlobalTableInput
        include JSON::Serializable

        # The global table name.
        @[JSON::Field(key: "GlobalTableName")]
        getter global_table_name : String

        # The Regions where the global table needs to be created.
        @[JSON::Field(key: "ReplicationGroup")]
        getter replication_group : Array(Types::Replica)

        def initialize(
          @global_table_name : String,
          @replication_group : Array(Types::Replica)
        )
        end
      end

      struct CreateGlobalTableOutput
        include JSON::Serializable

        # Contains the details of the global table.
        @[JSON::Field(key: "GlobalTableDescription")]
        getter global_table_description : Types::GlobalTableDescription?

        def initialize(
          @global_table_description : Types::GlobalTableDescription? = nil
        )
        end
      end

      # Specifies the action to add a new witness Region to a MRSC global table. A MRSC global table can be
      # configured with either three replicas, or with two replicas and one witness.
      struct CreateGlobalTableWitnessGroupMemberAction
        include JSON::Serializable

        # The Amazon Web Services Region name to be added as a witness Region for the MRSC global table. The
        # witness must be in a different Region than the replicas and within the same Region set: US Region
        # set: US East (N. Virginia), US East (Ohio), US West (Oregon) EU Region set: Europe (Ireland), Europe
        # (London), Europe (Paris), Europe (Frankfurt) AP Region set: Asia Pacific (Tokyo), Asia Pacific
        # (Seoul), Asia Pacific (Osaka)
        @[JSON::Field(key: "RegionName")]
        getter region_name : String

        def initialize(
          @region_name : String
        )
        end
      end

      # Represents a replica to be added.
      struct CreateReplicaAction
        include JSON::Serializable

        # The Region of the replica to be added.
        @[JSON::Field(key: "RegionName")]
        getter region_name : String

        def initialize(
          @region_name : String
        )
        end
      end

      # Represents a replica to be created.
      struct CreateReplicationGroupMemberAction
        include JSON::Serializable

        # The Region where the new replica will be created.
        @[JSON::Field(key: "RegionName")]
        getter region_name : String

        # Replica-specific global secondary index settings.
        @[JSON::Field(key: "GlobalSecondaryIndexes")]
        getter global_secondary_indexes : Array(Types::ReplicaGlobalSecondaryIndex)?

        # The KMS key that should be used for KMS encryption in the new replica. To specify a key, use its key
        # ID, Amazon Resource Name (ARN), alias name, or alias ARN. Note that you should only provide this
        # parameter if the key is different from the default DynamoDB KMS key alias/aws/dynamodb .
        @[JSON::Field(key: "KMSMasterKeyId")]
        getter kms_master_key_id : String?

        # The maximum on-demand throughput settings for the specified replica table being created. You can
        # only modify MaxReadRequestUnits , because you can't modify MaxWriteRequestUnits for individual
        # replica tables.
        @[JSON::Field(key: "OnDemandThroughputOverride")]
        getter on_demand_throughput_override : Types::OnDemandThroughputOverride?

        # Replica-specific provisioned throughput. If not specified, uses the source table's provisioned
        # throughput settings.
        @[JSON::Field(key: "ProvisionedThroughputOverride")]
        getter provisioned_throughput_override : Types::ProvisionedThroughputOverride?

        # Replica-specific table class. If not specified, uses the source table's table class.
        @[JSON::Field(key: "TableClassOverride")]
        getter table_class_override : String?

        def initialize(
          @region_name : String,
          @global_secondary_indexes : Array(Types::ReplicaGlobalSecondaryIndex)? = nil,
          @kms_master_key_id : String? = nil,
          @on_demand_throughput_override : Types::OnDemandThroughputOverride? = nil,
          @provisioned_throughput_override : Types::ProvisionedThroughputOverride? = nil,
          @table_class_override : String? = nil
        )
        end
      end

      # Represents the input of a CreateTable operation.
      struct CreateTableInput
        include JSON::Serializable

        # An array of attributes that describe the key schema for the table and indexes.
        @[JSON::Field(key: "AttributeDefinitions")]
        getter attribute_definitions : Array(Types::AttributeDefinition)

        # Specifies the attributes that make up the primary key for a table or an index. The attributes in
        # KeySchema must also be defined in the AttributeDefinitions array. For more information, see Data
        # Model in the Amazon DynamoDB Developer Guide . Each KeySchemaElement in the array is composed of:
        # AttributeName - The name of this key attribute. KeyType - The role that the key attribute will
        # assume: HASH - partition key RANGE - sort key The partition key of an item is also known as its hash
        # attribute . The term "hash attribute" derives from the DynamoDB usage of an internal hash function
        # to evenly distribute data items across partitions, based on their partition key values. The sort key
        # of an item is also known as its range attribute . The term "range attribute" derives from the way
        # DynamoDB stores items with the same partition key physically close together, in sorted order by the
        # sort key value. For a simple primary key (partition key), you must provide exactly one element with
        # a KeyType of HASH . For a composite primary key (partition key and sort key), you must provide
        # exactly two elements, in this order: The first element must have a KeyType of HASH , and the second
        # element must have a KeyType of RANGE . For more information, see Working with Tables in the Amazon
        # DynamoDB Developer Guide .
        @[JSON::Field(key: "KeySchema")]
        getter key_schema : Array(Types::KeySchemaElement)

        # The name of the table to create. You can also provide the Amazon Resource Name (ARN) of the table in
        # this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # Controls how you are charged for read and write throughput and how you manage capacity. This setting
        # can be changed later. PAY_PER_REQUEST - We recommend using PAY_PER_REQUEST for most DynamoDB
        # workloads. PAY_PER_REQUEST sets the billing mode to On-demand capacity mode . PROVISIONED - We
        # recommend using PROVISIONED for steady workloads with predictable growth where capacity requirements
        # can be reliably forecasted. PROVISIONED sets the billing mode to Provisioned capacity mode .
        @[JSON::Field(key: "BillingMode")]
        getter billing_mode : String?

        # Indicates whether deletion protection is to be enabled (true) or disabled (false) on the table.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool?

        # One or more global secondary indexes (the maximum is 20) to be created on the table. Each global
        # secondary index in the array includes the following: IndexName - The name of the global secondary
        # index. Must be unique only for this table. KeySchema - Specifies the key schema for the global
        # secondary index. Projection - Specifies attributes that are copied (projected) from the table into
        # the index. These are in addition to the primary key attributes and index key attributes, which are
        # automatically projected. Each attribute specification is composed of: ProjectionType - One of the
        # following: KEYS_ONLY - Only the index and primary keys are projected into the index. INCLUDE - Only
        # the specified table attributes are projected into the index. The list of projected attributes is in
        # NonKeyAttributes . ALL - All of the table attributes are projected into the index. NonKeyAttributes
        # - A list of one or more non-key attribute names that are projected into the secondary index. The
        # total count of attributes provided in NonKeyAttributes , summed across all of the secondary indexes,
        # must not exceed 100. If you project the same attribute into two different indexes, this counts as
        # two distinct attributes when determining the total. This limit only applies when you specify the
        # ProjectionType of INCLUDE . You still can specify the ProjectionType of ALL to project all
        # attributes from the source table, even if the table has more than 100 attributes.
        # ProvisionedThroughput - The provisioned throughput settings for the global secondary index,
        # consisting of read and write capacity units.
        @[JSON::Field(key: "GlobalSecondaryIndexes")]
        getter global_secondary_indexes : Array(Types::GlobalSecondaryIndex)?

        # One or more local secondary indexes (the maximum is 5) to be created on the table. Each index is
        # scoped to a given partition key value. There is a 10 GB size limit per partition key value;
        # otherwise, the size of a local secondary index is unconstrained. Each local secondary index in the
        # array includes the following: IndexName - The name of the local secondary index. Must be unique only
        # for this table. KeySchema - Specifies the key schema for the local secondary index. The key schema
        # must begin with the same partition key as the table. Projection - Specifies attributes that are
        # copied (projected) from the table into the index. These are in addition to the primary key
        # attributes and index key attributes, which are automatically projected. Each attribute specification
        # is composed of: ProjectionType - One of the following: KEYS_ONLY - Only the index and primary keys
        # are projected into the index. INCLUDE - Only the specified table attributes are projected into the
        # index. The list of projected attributes is in NonKeyAttributes . ALL - All of the table attributes
        # are projected into the index. NonKeyAttributes - A list of one or more non-key attribute names that
        # are projected into the secondary index. The total count of attributes provided in NonKeyAttributes ,
        # summed across all of the secondary indexes, must not exceed 100. If you project the same attribute
        # into two different indexes, this counts as two distinct attributes when determining the total. This
        # limit only applies when you specify the ProjectionType of INCLUDE . You still can specify the
        # ProjectionType of ALL to project all attributes from the source table, even if the table has more
        # than 100 attributes.
        @[JSON::Field(key: "LocalSecondaryIndexes")]
        getter local_secondary_indexes : Array(Types::LocalSecondaryIndex)?

        # Sets the maximum number of read and write units for the specified table in on-demand capacity mode.
        # If you use this parameter, you must specify MaxReadRequestUnits , MaxWriteRequestUnits , or both.
        @[JSON::Field(key: "OnDemandThroughput")]
        getter on_demand_throughput : Types::OnDemandThroughput?

        # Represents the provisioned throughput settings for a specified table or index. The settings can be
        # modified using the UpdateTable operation. If you set BillingMode as PROVISIONED , you must specify
        # this property. If you set BillingMode as PAY_PER_REQUEST , you cannot specify this property. For
        # current minimum and maximum provisioned throughput values, see Service, Account, and Table Quotas in
        # the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "ProvisionedThroughput")]
        getter provisioned_throughput : Types::ProvisionedThroughput?

        # An Amazon Web Services resource-based policy document in JSON format that will be attached to the
        # table. When you attach a resource-based policy while creating a table, the policy application is
        # strongly consistent . The maximum size supported for a resource-based policy document is 20 KB.
        # DynamoDB counts whitespaces when calculating the size of a policy against this limit. For a full
        # list of all considerations that apply for resource-based policies, see Resource-based policy
        # considerations . You need to specify the CreateTable and PutResourcePolicy IAM actions for
        # authorizing a user to create a table with a resource-based policy.
        @[JSON::Field(key: "ResourcePolicy")]
        getter resource_policy : String?

        # Represents the settings used to enable server-side encryption.
        @[JSON::Field(key: "SSESpecification")]
        getter sse_specification : Types::SSESpecification?

        # The settings for DynamoDB Streams on the table. These settings consist of: StreamEnabled - Indicates
        # whether DynamoDB Streams is to be enabled (true) or disabled (false). StreamViewType - When an item
        # in the table is modified, StreamViewType determines what information is written to the table's
        # stream. Valid values for StreamViewType are: KEYS_ONLY - Only the key attributes of the modified
        # item are written to the stream. NEW_IMAGE - The entire item, as it appears after it was modified, is
        # written to the stream. OLD_IMAGE - The entire item, as it appeared before it was modified, is
        # written to the stream. NEW_AND_OLD_IMAGES - Both the new and the old item images of the item are
        # written to the stream.
        @[JSON::Field(key: "StreamSpecification")]
        getter stream_specification : Types::StreamSpecification?

        # The table class of the new table. Valid values are STANDARD and STANDARD_INFREQUENT_ACCESS .
        @[JSON::Field(key: "TableClass")]
        getter table_class : String?

        # A list of key-value pairs to label the table. For more information, see Tagging for DynamoDB .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # Represents the warm throughput (in read units per second and write units per second) for creating a
        # table.
        @[JSON::Field(key: "WarmThroughput")]
        getter warm_throughput : Types::WarmThroughput?

        def initialize(
          @attribute_definitions : Array(Types::AttributeDefinition),
          @key_schema : Array(Types::KeySchemaElement),
          @table_name : String,
          @billing_mode : String? = nil,
          @deletion_protection_enabled : Bool? = nil,
          @global_secondary_indexes : Array(Types::GlobalSecondaryIndex)? = nil,
          @local_secondary_indexes : Array(Types::LocalSecondaryIndex)? = nil,
          @on_demand_throughput : Types::OnDemandThroughput? = nil,
          @provisioned_throughput : Types::ProvisionedThroughput? = nil,
          @resource_policy : String? = nil,
          @sse_specification : Types::SSESpecification? = nil,
          @stream_specification : Types::StreamSpecification? = nil,
          @table_class : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @warm_throughput : Types::WarmThroughput? = nil
        )
        end
      end

      # Represents the output of a CreateTable operation.
      struct CreateTableOutput
        include JSON::Serializable

        # Represents the properties of the table.
        @[JSON::Field(key: "TableDescription")]
        getter table_description : Types::TableDescription?

        def initialize(
          @table_description : Types::TableDescription? = nil
        )
        end
      end

      # Processing options for the CSV file being imported.
      struct CsvOptions
        include JSON::Serializable

        # The delimiter used for separating items in the CSV file being imported.
        @[JSON::Field(key: "Delimiter")]
        getter delimiter : String?

        # List of the headers used to specify a common header for all source CSV files being imported. If this
        # field is specified then the first line of each CSV file is treated as data instead of the header. If
        # this field is not specified the the first line of each CSV file is treated as the header.
        @[JSON::Field(key: "HeaderList")]
        getter header_list : Array(String)?

        def initialize(
          @delimiter : String? = nil,
          @header_list : Array(String)? = nil
        )
        end
      end

      # Represents a request to perform a DeleteItem operation.
      struct Delete
        include JSON::Serializable

        # The primary key of the item to be deleted. Each element consists of an attribute name and a value
        # for that attribute.
        @[JSON::Field(key: "Key")]
        getter key : Hash(String, Types::AttributeValue)

        # Name of the table in which the item to be deleted resides. You can also provide the Amazon Resource
        # Name (ARN) of the table in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # A condition that must be satisfied in order for a conditional delete to succeed.
        @[JSON::Field(key: "ConditionExpression")]
        getter condition_expression : String?

        # One or more substitution tokens for attribute names in an expression.
        @[JSON::Field(key: "ExpressionAttributeNames")]
        getter expression_attribute_names : Hash(String, String)?

        # One or more values that can be substituted in an expression.
        @[JSON::Field(key: "ExpressionAttributeValues")]
        getter expression_attribute_values : Hash(String, Types::AttributeValue)?

        # Use ReturnValuesOnConditionCheckFailure to get the item attributes if the Delete condition fails.
        # For ReturnValuesOnConditionCheckFailure , the valid values are: NONE and ALL_OLD.
        @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure")]
        getter return_values_on_condition_check_failure : String?

        def initialize(
          @key : Hash(String, Types::AttributeValue),
          @table_name : String,
          @condition_expression : String? = nil,
          @expression_attribute_names : Hash(String, String)? = nil,
          @expression_attribute_values : Hash(String, Types::AttributeValue)? = nil,
          @return_values_on_condition_check_failure : String? = nil
        )
        end
      end

      struct DeleteBackupInput
        include JSON::Serializable

        # The ARN associated with the backup.
        @[JSON::Field(key: "BackupArn")]
        getter backup_arn : String

        def initialize(
          @backup_arn : String
        )
        end
      end

      struct DeleteBackupOutput
        include JSON::Serializable

        # Contains the description of the backup created for the table.
        @[JSON::Field(key: "BackupDescription")]
        getter backup_description : Types::BackupDescription?

        def initialize(
          @backup_description : Types::BackupDescription? = nil
        )
        end
      end

      # Represents a global secondary index to be deleted from an existing table.
      struct DeleteGlobalSecondaryIndexAction
        include JSON::Serializable

        # The name of the global secondary index to be deleted.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        def initialize(
          @index_name : String
        )
        end
      end

      # Specifies the action to remove a witness Region from a MRSC global table. You cannot delete a single
      # witness from a MRSC global table - you must delete both a replica and the witness together. The
      # deletion of both a witness and replica converts the remaining replica to a single-Region DynamoDB
      # table.
      struct DeleteGlobalTableWitnessGroupMemberAction
        include JSON::Serializable

        # The witness Region name to be removed from the MRSC global table.
        @[JSON::Field(key: "RegionName")]
        getter region_name : String

        def initialize(
          @region_name : String
        )
        end
      end

      # Represents the input of a DeleteItem operation.
      struct DeleteItemInput
        include JSON::Serializable

        # A map of attribute names to AttributeValue objects, representing the primary key of the item to
        # delete. For the primary key, you must provide all of the key attributes. For example, with a simple
        # primary key, you only need to provide a value for the partition key. For a composite primary key,
        # you must provide values for both the partition key and the sort key.
        @[JSON::Field(key: "Key")]
        getter key : Hash(String, Types::AttributeValue)

        # The name of the table from which to delete the item. You can also provide the Amazon Resource Name
        # (ARN) of the table in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # A condition that must be satisfied in order for a conditional DeleteItem to succeed. An expression
        # can contain any of the following: Functions: attribute_exists | attribute_not_exists |
        # attribute_type | contains | begins_with | size These function names are case-sensitive. Comparison
        # operators: = | &lt;&gt; | &lt; | &gt; | &lt;= | &gt;= | BETWEEN | IN Logical operators: AND | OR |
        # NOT For more information about condition expressions, see Condition Expressions in the Amazon
        # DynamoDB Developer Guide .
        @[JSON::Field(key: "ConditionExpression")]
        getter condition_expression : String?

        # This is a legacy parameter. Use ConditionExpression instead. For more information, see
        # ConditionalOperator in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "ConditionalOperator")]
        getter conditional_operator : String?

        # This is a legacy parameter. Use ConditionExpression instead. For more information, see Expected in
        # the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "Expected")]
        getter expected : Hash(String, Types::ExpectedAttributeValue)?

        # One or more substitution tokens for attribute names in an expression. The following are some use
        # cases for using ExpressionAttributeNames : To access an attribute whose name conflicts with a
        # DynamoDB reserved word. To create a placeholder for repeating occurrences of an attribute name in an
        # expression. To prevent special characters in an attribute name from being misinterpreted in an
        # expression. Use the # character in an expression to dereference an attribute name. For example,
        # consider the following attribute name: Percentile The name of this attribute conflicts with a
        # reserved word, so it cannot be used directly in an expression. (For the complete list of reserved
        # words, see Reserved Words in the Amazon DynamoDB Developer Guide ). To work around this, you could
        # specify the following for ExpressionAttributeNames : {"#P":"Percentile"} You could then use this
        # substitution in an expression, as in this example: #P = :val Tokens that begin with the : character
        # are expression attribute values , which are placeholders for the actual value at runtime. For more
        # information on expression attribute names, see Specifying Item Attributes in the Amazon DynamoDB
        # Developer Guide .
        @[JSON::Field(key: "ExpressionAttributeNames")]
        getter expression_attribute_names : Hash(String, String)?

        # One or more values that can be substituted in an expression. Use the : (colon) character in an
        # expression to dereference an attribute value. For example, suppose that you wanted to check whether
        # the value of the ProductStatus attribute was one of the following: Available | Backordered |
        # Discontinued You would first need to specify ExpressionAttributeValues as follows: {
        # ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"} } You could
        # then use these values in an expression, such as this: ProductStatus IN (:avail, :back, :disc) For
        # more information on expression attribute values, see Condition Expressions in the Amazon DynamoDB
        # Developer Guide .
        @[JSON::Field(key: "ExpressionAttributeValues")]
        getter expression_attribute_values : Hash(String, Types::AttributeValue)?

        @[JSON::Field(key: "ReturnConsumedCapacity")]
        getter return_consumed_capacity : String?

        # Determines whether item collection metrics are returned. If set to SIZE , the response includes
        # statistics about item collections, if any, that were modified during the operation are returned in
        # the response. If set to NONE (the default), no statistics are returned.
        @[JSON::Field(key: "ReturnItemCollectionMetrics")]
        getter return_item_collection_metrics : String?

        # Use ReturnValues if you want to get the item attributes as they appeared before they were deleted.
        # For DeleteItem , the valid values are: NONE - If ReturnValues is not specified, or if its value is
        # NONE , then nothing is returned. (This setting is the default for ReturnValues .) ALL_OLD - The
        # content of the old item is returned. There is no additional cost associated with requesting a return
        # value aside from the small network and processing overhead of receiving a larger response. No read
        # capacity units are consumed. The ReturnValues parameter is used by several DynamoDB operations;
        # however, DeleteItem does not recognize any values other than NONE or ALL_OLD .
        @[JSON::Field(key: "ReturnValues")]
        getter return_values : String?

        # An optional parameter that returns the item attributes for a DeleteItem operation that failed a
        # condition check. There is no additional cost associated with requesting a return value aside from
        # the small network and processing overhead of receiving a larger response. No read capacity units are
        # consumed.
        @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure")]
        getter return_values_on_condition_check_failure : String?

        def initialize(
          @key : Hash(String, Types::AttributeValue),
          @table_name : String,
          @condition_expression : String? = nil,
          @conditional_operator : String? = nil,
          @expected : Hash(String, Types::ExpectedAttributeValue)? = nil,
          @expression_attribute_names : Hash(String, String)? = nil,
          @expression_attribute_values : Hash(String, Types::AttributeValue)? = nil,
          @return_consumed_capacity : String? = nil,
          @return_item_collection_metrics : String? = nil,
          @return_values : String? = nil,
          @return_values_on_condition_check_failure : String? = nil
        )
        end
      end

      # Represents the output of a DeleteItem operation.
      struct DeleteItemOutput
        include JSON::Serializable

        # A map of attribute names to AttributeValue objects, representing the item as it appeared before the
        # DeleteItem operation. This map appears in the response only if ReturnValues was specified as ALL_OLD
        # in the request.
        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, Types::AttributeValue)?

        # The capacity units consumed by the DeleteItem operation. The data returned includes the total
        # provisioned throughput consumed, along with statistics for the table and any indexes involved in the
        # operation. ConsumedCapacity is only returned if the ReturnConsumedCapacity parameter was specified.
        # For more information, see Provisioned capacity mode in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "ConsumedCapacity")]
        getter consumed_capacity : Types::ConsumedCapacity?

        # Information about item collections, if any, that were affected by the DeleteItem operation.
        # ItemCollectionMetrics is only returned if the ReturnItemCollectionMetrics parameter was specified.
        # If the table does not have any local secondary indexes, this information is not returned in the
        # response. Each ItemCollectionMetrics element consists of: ItemCollectionKey - The partition key
        # value of the item collection. This is the same as the partition key value of the item itself.
        # SizeEstimateRangeGB - An estimate of item collection size, in gigabytes. This value is a two-element
        # array containing a lower bound and an upper bound for the estimate. The estimate includes the size
        # of all the items in the table, plus the size of all attributes projected into all of the local
        # secondary indexes on that table. Use this estimate to measure whether a local secondary index is
        # approaching its size limit. The estimate is subject to change over time; therefore, do not rely on
        # the precision or accuracy of the estimate.
        @[JSON::Field(key: "ItemCollectionMetrics")]
        getter item_collection_metrics : Types::ItemCollectionMetrics?

        def initialize(
          @attributes : Hash(String, Types::AttributeValue)? = nil,
          @consumed_capacity : Types::ConsumedCapacity? = nil,
          @item_collection_metrics : Types::ItemCollectionMetrics? = nil
        )
        end
      end

      # Represents a replica to be removed.
      struct DeleteReplicaAction
        include JSON::Serializable

        # The Region of the replica to be removed.
        @[JSON::Field(key: "RegionName")]
        getter region_name : String

        def initialize(
          @region_name : String
        )
        end
      end

      # Represents a replica to be deleted.
      struct DeleteReplicationGroupMemberAction
        include JSON::Serializable

        # The Region where the replica exists.
        @[JSON::Field(key: "RegionName")]
        getter region_name : String

        def initialize(
          @region_name : String
        )
        end
      end

      # Represents a request to perform a DeleteItem operation on an item.
      struct DeleteRequest
        include JSON::Serializable

        # A map of attribute name to attribute values, representing the primary key of the item to delete. All
        # of the table's primary key attributes must be specified, and their data types must match those of
        # the table's key schema.
        @[JSON::Field(key: "Key")]
        getter key : Hash(String, Types::AttributeValue)

        def initialize(
          @key : Hash(String, Types::AttributeValue)
        )
        end
      end

      struct DeleteResourcePolicyInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the DynamoDB resource from which the policy will be removed. The
        # resources you can specify include tables and streams. If you remove the policy of a table, it will
        # also remove the permissions for the table's indexes defined in that policy document. This is because
        # index permissions are defined in the table's policy.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A string value that you can use to conditionally delete your policy. When you provide an expected
        # revision ID, if the revision ID of the existing policy on the resource doesn't match or if there's
        # no policy attached to the resource, the request will fail and return a PolicyNotFoundException .
        @[JSON::Field(key: "ExpectedRevisionId")]
        getter expected_revision_id : String?

        def initialize(
          @resource_arn : String,
          @expected_revision_id : String? = nil
        )
        end
      end

      struct DeleteResourcePolicyOutput
        include JSON::Serializable

        # A unique string that represents the revision ID of the policy. If you're comparing revision IDs,
        # make sure to always use string comparison logic. This value will be empty if you make a request
        # against a resource without a policy.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        def initialize(
          @revision_id : String? = nil
        )
        end
      end

      # Represents the input of a DeleteTable operation.
      struct DeleteTableInput
        include JSON::Serializable

        # The name of the table to delete. You can also provide the Amazon Resource Name (ARN) of the table in
        # this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        def initialize(
          @table_name : String
        )
        end
      end

      # Represents the output of a DeleteTable operation.
      struct DeleteTableOutput
        include JSON::Serializable

        # Represents the properties of a table.
        @[JSON::Field(key: "TableDescription")]
        getter table_description : Types::TableDescription?

        def initialize(
          @table_description : Types::TableDescription? = nil
        )
        end
      end

      struct DescribeBackupInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the backup.
        @[JSON::Field(key: "BackupArn")]
        getter backup_arn : String

        def initialize(
          @backup_arn : String
        )
        end
      end

      struct DescribeBackupOutput
        include JSON::Serializable

        # Contains the description of the backup created for the table.
        @[JSON::Field(key: "BackupDescription")]
        getter backup_description : Types::BackupDescription?

        def initialize(
          @backup_description : Types::BackupDescription? = nil
        )
        end
      end

      struct DescribeContinuousBackupsInput
        include JSON::Serializable

        # Name of the table for which the customer wants to check the continuous backups and point in time
        # recovery settings. You can also provide the Amazon Resource Name (ARN) of the table in this
        # parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        def initialize(
          @table_name : String
        )
        end
      end

      struct DescribeContinuousBackupsOutput
        include JSON::Serializable

        # Represents the continuous backups and point in time recovery settings on the table.
        @[JSON::Field(key: "ContinuousBackupsDescription")]
        getter continuous_backups_description : Types::ContinuousBackupsDescription?

        def initialize(
          @continuous_backups_description : Types::ContinuousBackupsDescription? = nil
        )
        end
      end

      struct DescribeContributorInsightsInput
        include JSON::Serializable

        # The name of the table to describe. You can also provide the Amazon Resource Name (ARN) of the table
        # in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # The name of the global secondary index to describe, if applicable.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        def initialize(
          @table_name : String,
          @index_name : String? = nil
        )
        end
      end

      struct DescribeContributorInsightsOutput
        include JSON::Serializable

        # The mode of CloudWatch Contributor Insights for DynamoDB that determines which events are emitted.
        # Can be set to track all access and throttled events or throttled events only.
        @[JSON::Field(key: "ContributorInsightsMode")]
        getter contributor_insights_mode : String?

        # List of names of the associated contributor insights rules.
        @[JSON::Field(key: "ContributorInsightsRuleList")]
        getter contributor_insights_rule_list : Array(String)?

        # Current status of contributor insights.
        @[JSON::Field(key: "ContributorInsightsStatus")]
        getter contributor_insights_status : String?

        # Returns information about the last failure that was encountered. The most common exceptions for a
        # FAILED status are: LimitExceededException - Per-account Amazon CloudWatch Contributor Insights rule
        # limit reached. Please disable Contributor Insights for other tables/indexes OR disable Contributor
        # Insights rules before retrying. AccessDeniedException - Amazon CloudWatch Contributor Insights rules
        # cannot be modified due to insufficient permissions. AccessDeniedException - Failed to create
        # service-linked role for Contributor Insights due to insufficient permissions. InternalServerError -
        # Failed to create Amazon CloudWatch Contributor Insights rules. Please retry request.
        @[JSON::Field(key: "FailureException")]
        getter failure_exception : Types::FailureException?

        # The name of the global secondary index being described.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        # Timestamp of the last time the status was changed.
        @[JSON::Field(key: "LastUpdateDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_date_time : Time?

        # The name of the table being described.
        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        def initialize(
          @contributor_insights_mode : String? = nil,
          @contributor_insights_rule_list : Array(String)? = nil,
          @contributor_insights_status : String? = nil,
          @failure_exception : Types::FailureException? = nil,
          @index_name : String? = nil,
          @last_update_date_time : Time? = nil,
          @table_name : String? = nil
        )
        end
      end

      struct DescribeEndpointsRequest
        include JSON::Serializable

        def initialize
        end
      end

      struct DescribeEndpointsResponse
        include JSON::Serializable

        # List of endpoints.
        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Array(Types::Endpoint)

        def initialize(
          @endpoints : Array(Types::Endpoint)
        )
        end
      end

      struct DescribeExportInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the export.
        @[JSON::Field(key: "ExportArn")]
        getter export_arn : String

        def initialize(
          @export_arn : String
        )
        end
      end

      struct DescribeExportOutput
        include JSON::Serializable

        # Represents the properties of the export.
        @[JSON::Field(key: "ExportDescription")]
        getter export_description : Types::ExportDescription?

        def initialize(
          @export_description : Types::ExportDescription? = nil
        )
        end
      end

      struct DescribeGlobalTableInput
        include JSON::Serializable

        # The name of the global table.
        @[JSON::Field(key: "GlobalTableName")]
        getter global_table_name : String

        def initialize(
          @global_table_name : String
        )
        end
      end

      struct DescribeGlobalTableOutput
        include JSON::Serializable

        # Contains the details of the global table.
        @[JSON::Field(key: "GlobalTableDescription")]
        getter global_table_description : Types::GlobalTableDescription?

        def initialize(
          @global_table_description : Types::GlobalTableDescription? = nil
        )
        end
      end

      struct DescribeGlobalTableSettingsInput
        include JSON::Serializable

        # The name of the global table to describe.
        @[JSON::Field(key: "GlobalTableName")]
        getter global_table_name : String

        def initialize(
          @global_table_name : String
        )
        end
      end

      struct DescribeGlobalTableSettingsOutput
        include JSON::Serializable

        # The name of the global table.
        @[JSON::Field(key: "GlobalTableName")]
        getter global_table_name : String?

        # The Region-specific settings for the global table.
        @[JSON::Field(key: "ReplicaSettings")]
        getter replica_settings : Array(Types::ReplicaSettingsDescription)?

        def initialize(
          @global_table_name : String? = nil,
          @replica_settings : Array(Types::ReplicaSettingsDescription)? = nil
        )
        end
      end

      struct DescribeImportInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the table you're importing to.
        @[JSON::Field(key: "ImportArn")]
        getter import_arn : String

        def initialize(
          @import_arn : String
        )
        end
      end

      struct DescribeImportOutput
        include JSON::Serializable

        # Represents the properties of the table created for the import, and parameters of the import. The
        # import parameters include import status, how many items were processed, and how many errors were
        # encountered.
        @[JSON::Field(key: "ImportTableDescription")]
        getter import_table_description : Types::ImportTableDescription

        def initialize(
          @import_table_description : Types::ImportTableDescription
        )
        end
      end

      struct DescribeKinesisStreamingDestinationInput
        include JSON::Serializable

        # The name of the table being described. You can also provide the Amazon Resource Name (ARN) of the
        # table in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        def initialize(
          @table_name : String
        )
        end
      end

      struct DescribeKinesisStreamingDestinationOutput
        include JSON::Serializable

        # The list of replica structures for the table being described.
        @[JSON::Field(key: "KinesisDataStreamDestinations")]
        getter kinesis_data_stream_destinations : Array(Types::KinesisDataStreamDestination)?

        # The name of the table being described.
        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        def initialize(
          @kinesis_data_stream_destinations : Array(Types::KinesisDataStreamDestination)? = nil,
          @table_name : String? = nil
        )
        end
      end

      # Represents the input of a DescribeLimits operation. Has no content.
      struct DescribeLimitsInput
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the output of a DescribeLimits operation.
      struct DescribeLimitsOutput
        include JSON::Serializable

        # The maximum total read capacity units that your account allows you to provision across all of your
        # tables in this Region.
        @[JSON::Field(key: "AccountMaxReadCapacityUnits")]
        getter account_max_read_capacity_units : Int64?

        # The maximum total write capacity units that your account allows you to provision across all of your
        # tables in this Region.
        @[JSON::Field(key: "AccountMaxWriteCapacityUnits")]
        getter account_max_write_capacity_units : Int64?

        # The maximum read capacity units that your account allows you to provision for a new table that you
        # are creating in this Region, including the read capacity units provisioned for its global secondary
        # indexes (GSIs).
        @[JSON::Field(key: "TableMaxReadCapacityUnits")]
        getter table_max_read_capacity_units : Int64?

        # The maximum write capacity units that your account allows you to provision for a new table that you
        # are creating in this Region, including the write capacity units provisioned for its global secondary
        # indexes (GSIs).
        @[JSON::Field(key: "TableMaxWriteCapacityUnits")]
        getter table_max_write_capacity_units : Int64?

        def initialize(
          @account_max_read_capacity_units : Int64? = nil,
          @account_max_write_capacity_units : Int64? = nil,
          @table_max_read_capacity_units : Int64? = nil,
          @table_max_write_capacity_units : Int64? = nil
        )
        end
      end

      # Represents the input of a DescribeTable operation.
      struct DescribeTableInput
        include JSON::Serializable

        # The name of the table to describe. You can also provide the Amazon Resource Name (ARN) of the table
        # in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        def initialize(
          @table_name : String
        )
        end
      end

      # Represents the output of a DescribeTable operation.
      struct DescribeTableOutput
        include JSON::Serializable

        # The properties of the table.
        @[JSON::Field(key: "Table")]
        getter table : Types::TableDescription?

        def initialize(
          @table : Types::TableDescription? = nil
        )
        end
      end

      struct DescribeTableReplicaAutoScalingInput
        include JSON::Serializable

        # The name of the table. You can also provide the Amazon Resource Name (ARN) of the table in this
        # parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        def initialize(
          @table_name : String
        )
        end
      end

      struct DescribeTableReplicaAutoScalingOutput
        include JSON::Serializable

        # Represents the auto scaling properties of the table.
        @[JSON::Field(key: "TableAutoScalingDescription")]
        getter table_auto_scaling_description : Types::TableAutoScalingDescription?

        def initialize(
          @table_auto_scaling_description : Types::TableAutoScalingDescription? = nil
        )
        end
      end

      struct DescribeTimeToLiveInput
        include JSON::Serializable

        # The name of the table to be described. You can also provide the Amazon Resource Name (ARN) of the
        # table in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        def initialize(
          @table_name : String
        )
        end
      end

      struct DescribeTimeToLiveOutput
        include JSON::Serializable

        @[JSON::Field(key: "TimeToLiveDescription")]
        getter time_to_live_description : Types::TimeToLiveDescription?

        def initialize(
          @time_to_live_description : Types::TimeToLiveDescription? = nil
        )
        end
      end

      # There was an attempt to insert an item with the same primary key as an item that already exists in
      # the DynamoDB table.
      struct DuplicateItemException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Enables setting the configuration for Kinesis Streaming.
      struct EnableKinesisStreamingConfiguration
        include JSON::Serializable

        # Toggle for the precision of Kinesis data stream timestamp. The values are either MILLISECOND or
        # MICROSECOND .
        @[JSON::Field(key: "ApproximateCreationDateTimePrecision")]
        getter approximate_creation_date_time_precision : String?

        def initialize(
          @approximate_creation_date_time_precision : String? = nil
        )
        end
      end

      # An endpoint information details.
      struct Endpoint
        include JSON::Serializable

        # IP address of the endpoint.
        @[JSON::Field(key: "Address")]
        getter address : String

        # Endpoint cache time to live (TTL) value.
        @[JSON::Field(key: "CachePeriodInMinutes")]
        getter cache_period_in_minutes : Int64

        def initialize(
          @address : String,
          @cache_period_in_minutes : Int64
        )
        end
      end

      struct ExecuteStatementInput
        include JSON::Serializable

        # The PartiQL statement representing the operation to run.
        @[JSON::Field(key: "Statement")]
        getter statement : String

        # The consistency of a read operation. If set to true , then a strongly consistent read is used;
        # otherwise, an eventually consistent read is used.
        @[JSON::Field(key: "ConsistentRead")]
        getter consistent_read : Bool?

        # The maximum number of items to evaluate (not necessarily the number of matching items). If DynamoDB
        # processes the number of items up to the limit while processing the results, it stops the operation
        # and returns the matching values up to that point, along with a key in LastEvaluatedKey to apply in a
        # subsequent operation so you can pick up where you left off. Also, if the processed dataset size
        # exceeds 1 MB before DynamoDB reaches this limit, it stops the operation and returns the matching
        # values up to the limit, and a key in LastEvaluatedKey to apply in a subsequent operation to continue
        # the operation.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # Set this value to get remaining results, if NextToken was returned in the statement response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The parameters for the PartiQL statement, if any.
        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::AttributeValue)?

        @[JSON::Field(key: "ReturnConsumedCapacity")]
        getter return_consumed_capacity : String?

        # An optional parameter that returns the item attributes for an ExecuteStatement operation that failed
        # a condition check. There is no additional cost associated with requesting a return value aside from
        # the small network and processing overhead of receiving a larger response. No read capacity units are
        # consumed.
        @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure")]
        getter return_values_on_condition_check_failure : String?

        def initialize(
          @statement : String,
          @consistent_read : Bool? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil,
          @parameters : Array(Types::AttributeValue)? = nil,
          @return_consumed_capacity : String? = nil,
          @return_values_on_condition_check_failure : String? = nil
        )
        end
      end

      struct ExecuteStatementOutput
        include JSON::Serializable

        @[JSON::Field(key: "ConsumedCapacity")]
        getter consumed_capacity : Types::ConsumedCapacity?

        # If a read operation was used, this property will contain the result of the read operation; a map of
        # attribute names and their values. For the write operations this value will be empty.
        @[JSON::Field(key: "Items")]
        getter items : Array(Hash(String, Types::AttributeValue))?

        # The primary key of the item where the operation stopped, inclusive of the previous result set. Use
        # this value to start a new operation, excluding this value in the new request. If LastEvaluatedKey is
        # empty, then the "last page" of results has been processed and there is no more data to be retrieved.
        # If LastEvaluatedKey is not empty, it does not necessarily mean that there is more data in the result
        # set. The only way to know when you have reached the end of the result set is when LastEvaluatedKey
        # is empty.
        @[JSON::Field(key: "LastEvaluatedKey")]
        getter last_evaluated_key : Hash(String, Types::AttributeValue)?

        # If the response of a read request exceeds the response payload limit DynamoDB will set this value in
        # the response. If set, you can use that this value in the subsequent request to get the remaining
        # results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @consumed_capacity : Types::ConsumedCapacity? = nil,
          @items : Array(Hash(String, Types::AttributeValue))? = nil,
          @last_evaluated_key : Hash(String, Types::AttributeValue)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ExecuteTransactionInput
        include JSON::Serializable

        # The list of PartiQL statements representing the transaction to run.
        @[JSON::Field(key: "TransactStatements")]
        getter transact_statements : Array(Types::ParameterizedStatement)

        # Set this value to get remaining results, if NextToken was returned in the statement response.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        # Determines the level of detail about either provisioned or on-demand throughput consumption that is
        # returned in the response. For more information, see TransactGetItems and TransactWriteItems .
        @[JSON::Field(key: "ReturnConsumedCapacity")]
        getter return_consumed_capacity : String?

        def initialize(
          @transact_statements : Array(Types::ParameterizedStatement),
          @client_request_token : String? = nil,
          @return_consumed_capacity : String? = nil
        )
        end
      end

      struct ExecuteTransactionOutput
        include JSON::Serializable

        # The capacity units consumed by the entire operation. The values of the list are ordered according to
        # the ordering of the statements.
        @[JSON::Field(key: "ConsumedCapacity")]
        getter consumed_capacity : Array(Types::ConsumedCapacity)?

        # The response to a PartiQL transaction.
        @[JSON::Field(key: "Responses")]
        getter responses : Array(Types::ItemResponse)?

        def initialize(
          @consumed_capacity : Array(Types::ConsumedCapacity)? = nil,
          @responses : Array(Types::ItemResponse)? = nil
        )
        end
      end

      # Represents a condition to be compared with an attribute value. This condition can be used with
      # DeleteItem , PutItem , or UpdateItem operations; if the comparison evaluates to true, the operation
      # succeeds; if not, the operation fails. You can use ExpectedAttributeValue in one of two different
      # ways: Use AttributeValueList to specify one or more values to compare against an attribute. Use
      # ComparisonOperator to specify how you want to perform the comparison. If the comparison evaluates to
      # true, then the conditional operation succeeds. Use Value to specify a value that DynamoDB will
      # compare against an attribute. If the values match, then ExpectedAttributeValue evaluates to true and
      # the conditional operation succeeds. Optionally, you can also set Exists to false, indicating that
      # you do not expect to find the attribute value in the table. In this case, the conditional operation
      # succeeds only if the comparison evaluates to false. Value and Exists are incompatible with
      # AttributeValueList and ComparisonOperator . Note that if you use both sets of parameters at once,
      # DynamoDB will return a ValidationException exception.
      struct ExpectedAttributeValue
        include JSON::Serializable

        # One or more values to evaluate against the supplied attribute. The number of values in the list
        # depends on the ComparisonOperator being used. For type Number, value comparisons are numeric. String
        # value comparisons for greater than, equals, or less than are based on ASCII character code values.
        # For example, a is greater than A , and a is greater than B . For a list of code values, see
        # http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters . For Binary, DynamoDB treats each
        # byte of the binary data as unsigned when it compares binary values. For information on specifying
        # data types in JSON, see JSON Data Format in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "AttributeValueList")]
        getter attribute_value_list : Array(Types::AttributeValue)?

        # A comparator for evaluating attributes in the AttributeValueList . For example, equals, greater
        # than, less than, etc. The following comparison operators are available: EQ | NE | LE | LT | GE | GT
        # | NOT_NULL | NULL | CONTAINS | NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN The following are
        # descriptions of each comparison operator. EQ : Equal. EQ is supported for all data types, including
        # lists and maps. AttributeValueList can contain only one AttributeValue element of type String,
        # Number, Binary, String Set, Number Set, or Binary Set. If an item contains an AttributeValue element
        # of a different type than the one provided in the request, the value does not match. For example,
        # {"S":"6"} does not equal {"N":"6"} . Also, {"N":"6"} does not equal {"NS":["6", "2", "1"]} . NE :
        # Not equal. NE is supported for all data types, including lists and maps. AttributeValueList can
        # contain only one AttributeValue of type String, Number, Binary, String Set, Number Set, or Binary
        # Set. If an item contains an AttributeValue of a different type than the one provided in the request,
        # the value does not match. For example, {"S":"6"} does not equal {"N":"6"} . Also, {"N":"6"} does not
        # equal {"NS":["6", "2", "1"]} . LE : Less than or equal. AttributeValueList can contain only one
        # AttributeValue element of type String, Number, or Binary (not a set type). If an item contains an
        # AttributeValue element of a different type than the one provided in the request, the value does not
        # match. For example, {"S":"6"} does not equal {"N":"6"} . Also, {"N":"6"} does not compare to
        # {"NS":["6", "2", "1"]} . LT : Less than. AttributeValueList can contain only one AttributeValue of
        # type String, Number, or Binary (not a set type). If an item contains an AttributeValue element of a
        # different type than the one provided in the request, the value does not match. For example,
        # {"S":"6"} does not equal {"N":"6"} . Also, {"N":"6"} does not compare to {"NS":["6", "2", "1"]} . GE
        # : Greater than or equal. AttributeValueList can contain only one AttributeValue element of type
        # String, Number, or Binary (not a set type). If an item contains an AttributeValue element of a
        # different type than the one provided in the request, the value does not match. For example,
        # {"S":"6"} does not equal {"N":"6"} . Also, {"N":"6"} does not compare to {"NS":["6", "2", "1"]} . GT
        # : Greater than. AttributeValueList can contain only one AttributeValue element of type String,
        # Number, or Binary (not a set type). If an item contains an AttributeValue element of a different
        # type than the one provided in the request, the value does not match. For example, {"S":"6"} does not
        # equal {"N":"6"} . Also, {"N":"6"} does not compare to {"NS":["6", "2", "1"]} . NOT_NULL : The
        # attribute exists. NOT_NULL is supported for all data types, including lists and maps. This operator
        # tests for the existence of an attribute, not its data type. If the data type of attribute " a " is
        # null, and you evaluate it using NOT_NULL , the result is a Boolean true . This result is because the
        # attribute " a " exists; its data type is not relevant to the NOT_NULL comparison operator. NULL :
        # The attribute does not exist. NULL is supported for all data types, including lists and maps. This
        # operator tests for the nonexistence of an attribute, not its data type. If the data type of
        # attribute " a " is null, and you evaluate it using NULL , the result is a Boolean false . This is
        # because the attribute " a " exists; its data type is not relevant to the NULL comparison operator.
        # CONTAINS : Checks for a subsequence, or value in a set. AttributeValueList can contain only one
        # AttributeValue element of type String, Number, or Binary (not a set type). If the target attribute
        # of the comparison is of type String, then the operator checks for a substring match. If the target
        # attribute of the comparison is of type Binary, then the operator looks for a subsequence of the
        # target that matches the input. If the target attribute of the comparison is a set (" SS ", " NS ",
        # or " BS "), then the operator evaluates to true if it finds an exact match with any member of the
        # set. CONTAINS is supported for lists: When evaluating " a CONTAINS b ", " a " can be a list;
        # however, " b " cannot be a set, a map, or a list. NOT_CONTAINS : Checks for absence of a
        # subsequence, or absence of a value in a set. AttributeValueList can contain only one AttributeValue
        # element of type String, Number, or Binary (not a set type). If the target attribute of the
        # comparison is a String, then the operator checks for the absence of a substring match. If the target
        # attribute of the comparison is Binary, then the operator checks for the absence of a subsequence of
        # the target that matches the input. If the target attribute of the comparison is a set (" SS ", " NS
        # ", or " BS "), then the operator evaluates to true if it does not find an exact match with any
        # member of the set. NOT_CONTAINS is supported for lists: When evaluating " a NOT CONTAINS b ", " a "
        # can be a list; however, " b " cannot be a set, a map, or a list. BEGINS_WITH : Checks for a prefix.
        # AttributeValueList can contain only one AttributeValue of type String or Binary (not a Number or a
        # set type). The target attribute of the comparison must be of type String or Binary (not a Number or
        # a set type). IN : Checks for matching elements in a list. AttributeValueList can contain one or more
        # AttributeValue elements of type String, Number, or Binary. These attributes are compared against an
        # existing attribute of an item. If any elements of the input are equal to the item attribute, the
        # expression evaluates to true. BETWEEN : Greater than or equal to the first value, and less than or
        # equal to the second value. AttributeValueList must contain two AttributeValue elements of the same
        # type, either String, Number, or Binary (not a set type). A target attribute matches if the target
        # value is greater than, or equal to, the first element and less than, or equal to, the second
        # element. If an item contains an AttributeValue element of a different type than the one provided in
        # the request, the value does not match. For example, {"S":"6"} does not compare to {"N":"6"} . Also,
        # {"N":"6"} does not compare to {"NS":["6", "2", "1"]}
        @[JSON::Field(key: "ComparisonOperator")]
        getter comparison_operator : String?

        # Causes DynamoDB to evaluate the value before attempting a conditional operation: If Exists is true ,
        # DynamoDB will check to see if that attribute value already exists in the table. If it is found, then
        # the operation succeeds. If it is not found, the operation fails with a ConditionCheckFailedException
        # . If Exists is false , DynamoDB assumes that the attribute value does not exist in the table. If in
        # fact the value does not exist, then the assumption is valid and the operation succeeds. If the value
        # is found, despite the assumption that it does not exist, the operation fails with a
        # ConditionCheckFailedException . The default setting for Exists is true . If you supply a Value all
        # by itself, DynamoDB assumes the attribute exists: You don't have to set Exists to true , because it
        # is implied. DynamoDB returns a ValidationException if: Exists is true but there is no Value to
        # check. (You expect a value to exist, but don't specify what that value is.) Exists is false but you
        # also provide a Value . (You cannot expect an attribute to have a value, while also expecting it not
        # to exist.)
        @[JSON::Field(key: "Exists")]
        getter exists : Bool?

        # Represents the data for the expected attribute. Each attribute value is described as a name-value
        # pair. The name is the data type, and the value is the data itself. For more information, see Data
        # Types in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "Value")]
        getter value : Types::AttributeValue?

        def initialize(
          @attribute_value_list : Array(Types::AttributeValue)? = nil,
          @comparison_operator : String? = nil,
          @exists : Bool? = nil,
          @value : Types::AttributeValue? = nil
        )
        end
      end

      # There was a conflict when writing to the specified S3 bucket.
      struct ExportConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the properties of the exported table.
      struct ExportDescription
        include JSON::Serializable

        # The billable size of the table export.
        @[JSON::Field(key: "BilledSizeBytes")]
        getter billed_size_bytes : Int64?

        # The client token that was provided for the export task. A client token makes calls to
        # ExportTableToPointInTimeInput idempotent, meaning that multiple identical calls have the same effect
        # as one single call.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The time at which the export task completed.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The Amazon Resource Name (ARN) of the table export.
        @[JSON::Field(key: "ExportArn")]
        getter export_arn : String?

        # The format of the exported data. Valid values for ExportFormat are DYNAMODB_JSON or ION .
        @[JSON::Field(key: "ExportFormat")]
        getter export_format : String?

        # The name of the manifest file for the export task.
        @[JSON::Field(key: "ExportManifest")]
        getter export_manifest : String?

        # Export can be in one of the following states: IN_PROGRESS, COMPLETED, or FAILED.
        @[JSON::Field(key: "ExportStatus")]
        getter export_status : String?

        # Point in time from which table data was exported.
        @[JSON::Field(key: "ExportTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter export_time : Time?

        # The type of export that was performed. Valid values are FULL_EXPORT or INCREMENTAL_EXPORT .
        @[JSON::Field(key: "ExportType")]
        getter export_type : String?

        # Status code for the result of the failed export.
        @[JSON::Field(key: "FailureCode")]
        getter failure_code : String?

        # Export failure reason description.
        @[JSON::Field(key: "FailureMessage")]
        getter failure_message : String?

        # Optional object containing the parameters specific to an incremental export.
        @[JSON::Field(key: "IncrementalExportSpecification")]
        getter incremental_export_specification : Types::IncrementalExportSpecification?

        # The number of items exported.
        @[JSON::Field(key: "ItemCount")]
        getter item_count : Int64?

        # The name of the Amazon S3 bucket containing the export.
        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String?

        # The ID of the Amazon Web Services account that owns the bucket containing the export.
        @[JSON::Field(key: "S3BucketOwner")]
        getter s3_bucket_owner : String?

        # The Amazon S3 bucket prefix used as the file name and path of the exported snapshot.
        @[JSON::Field(key: "S3Prefix")]
        getter s3_prefix : String?

        # Type of encryption used on the bucket where export data is stored. Valid values for S3SseAlgorithm
        # are: AES256 - server-side encryption with Amazon S3 managed keys KMS - server-side encryption with
        # KMS managed keys
        @[JSON::Field(key: "S3SseAlgorithm")]
        getter s3_sse_algorithm : String?

        # The ID of the KMS managed key used to encrypt the S3 bucket where export data is stored (if
        # applicable).
        @[JSON::Field(key: "S3SseKmsKeyId")]
        getter s3_sse_kms_key_id : String?

        # The time at which the export task began.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The Amazon Resource Name (ARN) of the table that was exported.
        @[JSON::Field(key: "TableArn")]
        getter table_arn : String?

        # Unique ID of the table that was exported.
        @[JSON::Field(key: "TableId")]
        getter table_id : String?

        def initialize(
          @billed_size_bytes : Int64? = nil,
          @client_token : String? = nil,
          @end_time : Time? = nil,
          @export_arn : String? = nil,
          @export_format : String? = nil,
          @export_manifest : String? = nil,
          @export_status : String? = nil,
          @export_time : Time? = nil,
          @export_type : String? = nil,
          @failure_code : String? = nil,
          @failure_message : String? = nil,
          @incremental_export_specification : Types::IncrementalExportSpecification? = nil,
          @item_count : Int64? = nil,
          @s3_bucket : String? = nil,
          @s3_bucket_owner : String? = nil,
          @s3_prefix : String? = nil,
          @s3_sse_algorithm : String? = nil,
          @s3_sse_kms_key_id : String? = nil,
          @start_time : Time? = nil,
          @table_arn : String? = nil,
          @table_id : String? = nil
        )
        end
      end

      # The specified export was not found.
      struct ExportNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Summary information about an export task.
      struct ExportSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the export.
        @[JSON::Field(key: "ExportArn")]
        getter export_arn : String?

        # Export can be in one of the following states: IN_PROGRESS, COMPLETED, or FAILED.
        @[JSON::Field(key: "ExportStatus")]
        getter export_status : String?

        # The type of export that was performed. Valid values are FULL_EXPORT or INCREMENTAL_EXPORT .
        @[JSON::Field(key: "ExportType")]
        getter export_type : String?

        def initialize(
          @export_arn : String? = nil,
          @export_status : String? = nil,
          @export_type : String? = nil
        )
        end
      end

      struct ExportTableToPointInTimeInput
        include JSON::Serializable

        # The name of the Amazon S3 bucket to export the snapshot to.
        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String

        # The Amazon Resource Name (ARN) associated with the table to export.
        @[JSON::Field(key: "TableArn")]
        getter table_arn : String

        # Providing a ClientToken makes the call to ExportTableToPointInTimeInput idempotent, meaning that
        # multiple identical calls have the same effect as one single call. A client token is valid for 8
        # hours after the first request that uses it is completed. After 8 hours, any request with the same
        # client token is treated as a new request. Do not resubmit the same request with the same client
        # token for more than 8 hours, or the result might not be idempotent. If you submit a request with the
        # same client token but a change in other parameters within the 8-hour idempotency window, DynamoDB
        # returns an ImportConflictException .
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The format for the exported data. Valid values for ExportFormat are DYNAMODB_JSON or ION .
        @[JSON::Field(key: "ExportFormat")]
        getter export_format : String?

        # Time in the past from which to export table data, counted in seconds from the start of the Unix
        # epoch. The table export will be a snapshot of the table's state at this point in time.
        @[JSON::Field(key: "ExportTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter export_time : Time?

        # Choice of whether to execute as a full export or incremental export. Valid values are FULL_EXPORT or
        # INCREMENTAL_EXPORT. The default value is FULL_EXPORT. If INCREMENTAL_EXPORT is provided, the
        # IncrementalExportSpecification must also be used.
        @[JSON::Field(key: "ExportType")]
        getter export_type : String?

        # Optional object containing the parameters specific to an incremental export.
        @[JSON::Field(key: "IncrementalExportSpecification")]
        getter incremental_export_specification : Types::IncrementalExportSpecification?

        # The ID of the Amazon Web Services account that owns the bucket the export will be stored in.
        # S3BucketOwner is a required parameter when exporting to a S3 bucket in another account.
        @[JSON::Field(key: "S3BucketOwner")]
        getter s3_bucket_owner : String?

        # The Amazon S3 bucket prefix to use as the file name and path of the exported snapshot.
        @[JSON::Field(key: "S3Prefix")]
        getter s3_prefix : String?

        # Type of encryption used on the bucket where export data will be stored. Valid values for
        # S3SseAlgorithm are: AES256 - server-side encryption with Amazon S3 managed keys KMS - server-side
        # encryption with KMS managed keys
        @[JSON::Field(key: "S3SseAlgorithm")]
        getter s3_sse_algorithm : String?

        # The ID of the KMS managed key used to encrypt the S3 bucket where export data will be stored (if
        # applicable).
        @[JSON::Field(key: "S3SseKmsKeyId")]
        getter s3_sse_kms_key_id : String?

        def initialize(
          @s3_bucket : String,
          @table_arn : String,
          @client_token : String? = nil,
          @export_format : String? = nil,
          @export_time : Time? = nil,
          @export_type : String? = nil,
          @incremental_export_specification : Types::IncrementalExportSpecification? = nil,
          @s3_bucket_owner : String? = nil,
          @s3_prefix : String? = nil,
          @s3_sse_algorithm : String? = nil,
          @s3_sse_kms_key_id : String? = nil
        )
        end
      end

      struct ExportTableToPointInTimeOutput
        include JSON::Serializable

        # Contains a description of the table export.
        @[JSON::Field(key: "ExportDescription")]
        getter export_description : Types::ExportDescription?

        def initialize(
          @export_description : Types::ExportDescription? = nil
        )
        end
      end

      # Represents a failure a contributor insights operation.
      struct FailureException
        include JSON::Serializable

        # Description of the failure.
        @[JSON::Field(key: "ExceptionDescription")]
        getter exception_description : String?

        # Exception name.
        @[JSON::Field(key: "ExceptionName")]
        getter exception_name : String?

        def initialize(
          @exception_description : String? = nil,
          @exception_name : String? = nil
        )
        end
      end

      # Specifies an item and related attribute values to retrieve in a TransactGetItem object.
      struct Get
        include JSON::Serializable

        # A map of attribute names to AttributeValue objects that specifies the primary key of the item to
        # retrieve.
        @[JSON::Field(key: "Key")]
        getter key : Hash(String, Types::AttributeValue)

        # The name of the table from which to retrieve the specified item. You can also provide the Amazon
        # Resource Name (ARN) of the table in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # One or more substitution tokens for attribute names in the ProjectionExpression parameter.
        @[JSON::Field(key: "ExpressionAttributeNames")]
        getter expression_attribute_names : Hash(String, String)?

        # A string that identifies one or more attributes of the specified item to retrieve from the table.
        # The attributes in the expression must be separated by commas. If no attribute names are specified,
        # then all attributes of the specified item are returned. If any of the requested attributes are not
        # found, they do not appear in the result.
        @[JSON::Field(key: "ProjectionExpression")]
        getter projection_expression : String?

        def initialize(
          @key : Hash(String, Types::AttributeValue),
          @table_name : String,
          @expression_attribute_names : Hash(String, String)? = nil,
          @projection_expression : String? = nil
        )
        end
      end

      # Represents the input of a GetItem operation.
      struct GetItemInput
        include JSON::Serializable

        # A map of attribute names to AttributeValue objects, representing the primary key of the item to
        # retrieve. For the primary key, you must provide all of the attributes. For example, with a simple
        # primary key, you only need to provide a value for the partition key. For a composite primary key,
        # you must provide values for both the partition key and the sort key.
        @[JSON::Field(key: "Key")]
        getter key : Hash(String, Types::AttributeValue)

        # The name of the table containing the requested item. You can also provide the Amazon Resource Name
        # (ARN) of the table in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # This is a legacy parameter. Use ProjectionExpression instead. For more information, see
        # AttributesToGet in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "AttributesToGet")]
        getter attributes_to_get : Array(String)?

        # Determines the read consistency model: If set to true , then the operation uses strongly consistent
        # reads; otherwise, the operation uses eventually consistent reads.
        @[JSON::Field(key: "ConsistentRead")]
        getter consistent_read : Bool?

        # One or more substitution tokens for attribute names in an expression. The following are some use
        # cases for using ExpressionAttributeNames : To access an attribute whose name conflicts with a
        # DynamoDB reserved word. To create a placeholder for repeating occurrences of an attribute name in an
        # expression. To prevent special characters in an attribute name from being misinterpreted in an
        # expression. Use the # character in an expression to dereference an attribute name. For example,
        # consider the following attribute name: Percentile The name of this attribute conflicts with a
        # reserved word, so it cannot be used directly in an expression. (For the complete list of reserved
        # words, see Reserved Words in the Amazon DynamoDB Developer Guide ). To work around this, you could
        # specify the following for ExpressionAttributeNames : {"#P":"Percentile"} You could then use this
        # substitution in an expression, as in this example: #P = :val Tokens that begin with the : character
        # are expression attribute values , which are placeholders for the actual value at runtime. For more
        # information on expression attribute names, see Specifying Item Attributes in the Amazon DynamoDB
        # Developer Guide .
        @[JSON::Field(key: "ExpressionAttributeNames")]
        getter expression_attribute_names : Hash(String, String)?

        # A string that identifies one or more attributes to retrieve from the table. These attributes can
        # include scalars, sets, or elements of a JSON document. The attributes in the expression must be
        # separated by commas. If no attribute names are specified, then all attributes are returned. If any
        # of the requested attributes are not found, they do not appear in the result. For more information,
        # see Specifying Item Attributes in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "ProjectionExpression")]
        getter projection_expression : String?

        @[JSON::Field(key: "ReturnConsumedCapacity")]
        getter return_consumed_capacity : String?

        def initialize(
          @key : Hash(String, Types::AttributeValue),
          @table_name : String,
          @attributes_to_get : Array(String)? = nil,
          @consistent_read : Bool? = nil,
          @expression_attribute_names : Hash(String, String)? = nil,
          @projection_expression : String? = nil,
          @return_consumed_capacity : String? = nil
        )
        end
      end

      # Represents the output of a GetItem operation.
      struct GetItemOutput
        include JSON::Serializable

        # The capacity units consumed by the GetItem operation. The data returned includes the total
        # provisioned throughput consumed, along with statistics for the table and any indexes involved in the
        # operation. ConsumedCapacity is only returned if the ReturnConsumedCapacity parameter was specified.
        # For more information, see Capacity unit consumption for read operations in the Amazon DynamoDB
        # Developer Guide .
        @[JSON::Field(key: "ConsumedCapacity")]
        getter consumed_capacity : Types::ConsumedCapacity?

        # A map of attribute names to AttributeValue objects, as specified by ProjectionExpression .
        @[JSON::Field(key: "Item")]
        getter item : Hash(String, Types::AttributeValue)?

        def initialize(
          @consumed_capacity : Types::ConsumedCapacity? = nil,
          @item : Hash(String, Types::AttributeValue)? = nil
        )
        end
      end

      struct GetResourcePolicyInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the DynamoDB resource to which the policy is attached. The
        # resources you can specify include tables and streams.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct GetResourcePolicyOutput
        include JSON::Serializable

        # The resource-based policy document attached to the resource, which can be a table or stream, in JSON
        # format.
        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # A unique string that represents the revision ID of the policy. If you're comparing revision IDs,
        # make sure to always use string comparison logic.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        def initialize(
          @policy : String? = nil,
          @revision_id : String? = nil
        )
        end
      end

      # Represents the properties of a global secondary index.
      struct GlobalSecondaryIndex
        include JSON::Serializable

        # The name of the global secondary index. The name must be unique among all other indexes on this
        # table.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # The complete key schema for a global secondary index, which consists of one or more pairs of
        # attribute names and key types: HASH - partition key RANGE - sort key The partition key of an item is
        # also known as its hash attribute . The term "hash attribute" derives from DynamoDB's usage of an
        # internal hash function to evenly distribute data items across partitions, based on their partition
        # key values. The sort key of an item is also known as its range attribute . The term "range
        # attribute" derives from the way DynamoDB stores items with the same partition key physically close
        # together, in sorted order by the sort key value.
        @[JSON::Field(key: "KeySchema")]
        getter key_schema : Array(Types::KeySchemaElement)

        # Represents attributes that are copied (projected) from the table into the global secondary index.
        # These are in addition to the primary key attributes and index key attributes, which are
        # automatically projected.
        @[JSON::Field(key: "Projection")]
        getter projection : Types::Projection

        # The maximum number of read and write units for the specified global secondary index. If you use this
        # parameter, you must specify MaxReadRequestUnits , MaxWriteRequestUnits , or both. You must use
        # either OnDemandThroughput or ProvisionedThroughput based on your table's capacity mode.
        @[JSON::Field(key: "OnDemandThroughput")]
        getter on_demand_throughput : Types::OnDemandThroughput?

        # Represents the provisioned throughput settings for the specified global secondary index. You must
        # use either OnDemandThroughput or ProvisionedThroughput based on your table's capacity mode. For
        # current minimum and maximum provisioned throughput values, see Service, Account, and Table Quotas in
        # the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "ProvisionedThroughput")]
        getter provisioned_throughput : Types::ProvisionedThroughput?

        # Represents the warm throughput value (in read units per second and write units per second) for the
        # specified secondary index. If you use this parameter, you must specify ReadUnitsPerSecond ,
        # WriteUnitsPerSecond , or both.
        @[JSON::Field(key: "WarmThroughput")]
        getter warm_throughput : Types::WarmThroughput?

        def initialize(
          @index_name : String,
          @key_schema : Array(Types::KeySchemaElement),
          @projection : Types::Projection,
          @on_demand_throughput : Types::OnDemandThroughput? = nil,
          @provisioned_throughput : Types::ProvisionedThroughput? = nil,
          @warm_throughput : Types::WarmThroughput? = nil
        )
        end
      end

      # Represents the auto scaling settings of a global secondary index for a global table that will be
      # modified.
      struct GlobalSecondaryIndexAutoScalingUpdate
        include JSON::Serializable

        # The name of the global secondary index.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        @[JSON::Field(key: "ProvisionedWriteCapacityAutoScalingUpdate")]
        getter provisioned_write_capacity_auto_scaling_update : Types::AutoScalingSettingsUpdate?

        def initialize(
          @index_name : String? = nil,
          @provisioned_write_capacity_auto_scaling_update : Types::AutoScalingSettingsUpdate? = nil
        )
        end
      end

      # Represents the properties of a global secondary index.
      struct GlobalSecondaryIndexDescription
        include JSON::Serializable

        # Indicates whether the index is currently backfilling. Backfilling is the process of reading items
        # from the table and determining whether they can be added to the index. (Not all items will qualify:
        # For example, a partition key cannot have any duplicate values.) If an item can be added to the
        # index, DynamoDB will do so. After all items have been processed, the backfilling operation is
        # complete and Backfilling is false. You can delete an index that is being created during the
        # Backfilling phase when IndexStatus is set to CREATING and Backfilling is true. You can't delete the
        # index that is being created when IndexStatus is set to CREATING and Backfilling is false. For
        # indexes that were created during a CreateTable operation, the Backfilling attribute does not appear
        # in the DescribeTable output.
        @[JSON::Field(key: "Backfilling")]
        getter backfilling : Bool?

        # The Amazon Resource Name (ARN) that uniquely identifies the index.
        @[JSON::Field(key: "IndexArn")]
        getter index_arn : String?

        # The name of the global secondary index.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        # The total size of the specified index, in bytes. DynamoDB updates this value approximately every six
        # hours. Recent changes might not be reflected in this value.
        @[JSON::Field(key: "IndexSizeBytes")]
        getter index_size_bytes : Int64?

        # The current state of the global secondary index: CREATING - The index is being created. UPDATING -
        # The index is being updated. DELETING - The index is being deleted. ACTIVE - The index is ready for
        # use.
        @[JSON::Field(key: "IndexStatus")]
        getter index_status : String?

        # The number of items in the specified index. DynamoDB updates this value approximately every six
        # hours. Recent changes might not be reflected in this value.
        @[JSON::Field(key: "ItemCount")]
        getter item_count : Int64?

        # The complete key schema for a global secondary index, which consists of one or more pairs of
        # attribute names and key types: HASH - partition key RANGE - sort key The partition key of an item is
        # also known as its hash attribute . The term "hash attribute" derives from DynamoDB's usage of an
        # internal hash function to evenly distribute data items across partitions, based on their partition
        # key values. The sort key of an item is also known as its range attribute . The term "range
        # attribute" derives from the way DynamoDB stores items with the same partition key physically close
        # together, in sorted order by the sort key value.
        @[JSON::Field(key: "KeySchema")]
        getter key_schema : Array(Types::KeySchemaElement)?

        # The maximum number of read and write units for the specified global secondary index. If you use this
        # parameter, you must specify MaxReadRequestUnits , MaxWriteRequestUnits , or both.
        @[JSON::Field(key: "OnDemandThroughput")]
        getter on_demand_throughput : Types::OnDemandThroughput?

        # Represents attributes that are copied (projected) from the table into the global secondary index.
        # These are in addition to the primary key attributes and index key attributes, which are
        # automatically projected.
        @[JSON::Field(key: "Projection")]
        getter projection : Types::Projection?

        # Represents the provisioned throughput settings for the specified global secondary index. For current
        # minimum and maximum provisioned throughput values, see Service, Account, and Table Quotas in the
        # Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "ProvisionedThroughput")]
        getter provisioned_throughput : Types::ProvisionedThroughputDescription?

        # Represents the warm throughput value (in read units per second and write units per second) for the
        # specified secondary index.
        @[JSON::Field(key: "WarmThroughput")]
        getter warm_throughput : Types::GlobalSecondaryIndexWarmThroughputDescription?

        def initialize(
          @backfilling : Bool? = nil,
          @index_arn : String? = nil,
          @index_name : String? = nil,
          @index_size_bytes : Int64? = nil,
          @index_status : String? = nil,
          @item_count : Int64? = nil,
          @key_schema : Array(Types::KeySchemaElement)? = nil,
          @on_demand_throughput : Types::OnDemandThroughput? = nil,
          @projection : Types::Projection? = nil,
          @provisioned_throughput : Types::ProvisionedThroughputDescription? = nil,
          @warm_throughput : Types::GlobalSecondaryIndexWarmThroughputDescription? = nil
        )
        end
      end

      # Represents the properties of a global secondary index for the table when the backup was created.
      struct GlobalSecondaryIndexInfo
        include JSON::Serializable

        # The name of the global secondary index.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        # The complete key schema for a global secondary index, which consists of one or more pairs of
        # attribute names and key types: HASH - partition key RANGE - sort key The partition key of an item is
        # also known as its hash attribute . The term "hash attribute" derives from DynamoDB's usage of an
        # internal hash function to evenly distribute data items across partitions, based on their partition
        # key values. The sort key of an item is also known as its range attribute . The term "range
        # attribute" derives from the way DynamoDB stores items with the same partition key physically close
        # together, in sorted order by the sort key value.
        @[JSON::Field(key: "KeySchema")]
        getter key_schema : Array(Types::KeySchemaElement)?

        @[JSON::Field(key: "OnDemandThroughput")]
        getter on_demand_throughput : Types::OnDemandThroughput?

        # Represents attributes that are copied (projected) from the table into the global secondary index.
        # These are in addition to the primary key attributes and index key attributes, which are
        # automatically projected.
        @[JSON::Field(key: "Projection")]
        getter projection : Types::Projection?

        # Represents the provisioned throughput settings for the specified global secondary index.
        @[JSON::Field(key: "ProvisionedThroughput")]
        getter provisioned_throughput : Types::ProvisionedThroughput?

        def initialize(
          @index_name : String? = nil,
          @key_schema : Array(Types::KeySchemaElement)? = nil,
          @on_demand_throughput : Types::OnDemandThroughput? = nil,
          @projection : Types::Projection? = nil,
          @provisioned_throughput : Types::ProvisionedThroughput? = nil
        )
        end
      end

      # Represents one of the following: A new global secondary index to be added to an existing table. New
      # provisioned throughput parameters for an existing global secondary index. An existing global
      # secondary index to be removed from an existing table.
      struct GlobalSecondaryIndexUpdate
        include JSON::Serializable

        # The parameters required for creating a global secondary index on an existing table: IndexName
        # KeySchema AttributeDefinitions Projection ProvisionedThroughput
        @[JSON::Field(key: "Create")]
        getter create : Types::CreateGlobalSecondaryIndexAction?

        # The name of an existing global secondary index to be removed.
        @[JSON::Field(key: "Delete")]
        getter delete : Types::DeleteGlobalSecondaryIndexAction?

        # The name of an existing global secondary index, along with new provisioned throughput settings to be
        # applied to that index.
        @[JSON::Field(key: "Update")]
        getter update : Types::UpdateGlobalSecondaryIndexAction?

        def initialize(
          @create : Types::CreateGlobalSecondaryIndexAction? = nil,
          @delete : Types::DeleteGlobalSecondaryIndexAction? = nil,
          @update : Types::UpdateGlobalSecondaryIndexAction? = nil
        )
        end
      end

      # The description of the warm throughput value on a global secondary index.
      struct GlobalSecondaryIndexWarmThroughputDescription
        include JSON::Serializable

        # Represents warm throughput read units per second value for a global secondary index.
        @[JSON::Field(key: "ReadUnitsPerSecond")]
        getter read_units_per_second : Int64?

        # Represents the warm throughput status being created or updated on a global secondary index. The
        # status can only be UPDATING or ACTIVE .
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Represents warm throughput write units per second value for a global secondary index.
        @[JSON::Field(key: "WriteUnitsPerSecond")]
        getter write_units_per_second : Int64?

        def initialize(
          @read_units_per_second : Int64? = nil,
          @status : String? = nil,
          @write_units_per_second : Int64? = nil
        )
        end
      end

      # Represents the properties of a global table.
      struct GlobalTable
        include JSON::Serializable

        # The global table name.
        @[JSON::Field(key: "GlobalTableName")]
        getter global_table_name : String?

        # The Regions where the global table has replicas.
        @[JSON::Field(key: "ReplicationGroup")]
        getter replication_group : Array(Types::Replica)?

        def initialize(
          @global_table_name : String? = nil,
          @replication_group : Array(Types::Replica)? = nil
        )
        end
      end

      # The specified global table already exists.
      struct GlobalTableAlreadyExistsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about the global table.
      struct GlobalTableDescription
        include JSON::Serializable

        # The creation time of the global table.
        @[JSON::Field(key: "CreationDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # The unique identifier of the global table.
        @[JSON::Field(key: "GlobalTableArn")]
        getter global_table_arn : String?

        # The global table name.
        @[JSON::Field(key: "GlobalTableName")]
        getter global_table_name : String?

        # The current state of the global table: CREATING - The global table is being created. UPDATING - The
        # global table is being updated. DELETING - The global table is being deleted. ACTIVE - The global
        # table is ready for use.
        @[JSON::Field(key: "GlobalTableStatus")]
        getter global_table_status : String?

        # The Regions where the global table has replicas.
        @[JSON::Field(key: "ReplicationGroup")]
        getter replication_group : Array(Types::ReplicaDescription)?

        def initialize(
          @creation_date_time : Time? = nil,
          @global_table_arn : String? = nil,
          @global_table_name : String? = nil,
          @global_table_status : String? = nil,
          @replication_group : Array(Types::ReplicaDescription)? = nil
        )
        end
      end

      # Represents the settings of a global secondary index for a global table that will be modified.
      struct GlobalTableGlobalSecondaryIndexSettingsUpdate
        include JSON::Serializable

        # The name of the global secondary index. The name must be unique among all other indexes on this
        # table.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # Auto scaling settings for managing a global secondary index's write capacity units.
        @[JSON::Field(key: "ProvisionedWriteCapacityAutoScalingSettingsUpdate")]
        getter provisioned_write_capacity_auto_scaling_settings_update : Types::AutoScalingSettingsUpdate?

        # The maximum number of writes consumed per second before DynamoDB returns a ThrottlingException.
        @[JSON::Field(key: "ProvisionedWriteCapacityUnits")]
        getter provisioned_write_capacity_units : Int64?

        def initialize(
          @index_name : String,
          @provisioned_write_capacity_auto_scaling_settings_update : Types::AutoScalingSettingsUpdate? = nil,
          @provisioned_write_capacity_units : Int64? = nil
        )
        end
      end

      # The specified global table does not exist.
      struct GlobalTableNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the properties of a witness Region in a MRSC global table.
      struct GlobalTableWitnessDescription
        include JSON::Serializable

        # The name of the Amazon Web Services Region that serves as a witness for the MRSC global table.
        @[JSON::Field(key: "RegionName")]
        getter region_name : String?

        # The current status of the witness Region in the MRSC global table.
        @[JSON::Field(key: "WitnessStatus")]
        getter witness_status : String?

        def initialize(
          @region_name : String? = nil,
          @witness_status : String? = nil
        )
        end
      end

      # Represents one of the following: A new witness to be added to a new global table. An existing
      # witness to be removed from an existing global table. You can configure one witness per MRSC global
      # table.
      struct GlobalTableWitnessGroupUpdate
        include JSON::Serializable

        # Specifies a witness Region to be added to a new MRSC global table. The witness must be added when
        # creating the MRSC global table.
        @[JSON::Field(key: "Create")]
        getter create : Types::CreateGlobalTableWitnessGroupMemberAction?

        # Specifies a witness Region to be removed from an existing global table. Must be done in conjunction
        # with removing a replica. The deletion of both a witness and replica converts the remaining replica
        # to a single-Region DynamoDB table.
        @[JSON::Field(key: "Delete")]
        getter delete : Types::DeleteGlobalTableWitnessGroupMemberAction?

        def initialize(
          @create : Types::CreateGlobalTableWitnessGroupMemberAction? = nil,
          @delete : Types::DeleteGlobalTableWitnessGroupMemberAction? = nil
        )
        end
      end

      # DynamoDB rejected the request because you retried a request with a different payload but with an
      # idempotent token that was already used.
      struct IdempotentParameterMismatchException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # There was a conflict when importing from the specified S3 source. This can occur when the current
      # import conflicts with a previous import request that had the same client token.
      struct ImportConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified import was not found.
      struct ImportNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Summary information about the source file for the import.
      struct ImportSummary
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the Cloudwatch Log Group associated with this import task.
        @[JSON::Field(key: "CloudWatchLogGroupArn")]
        getter cloud_watch_log_group_arn : String?

        # The time at which this import task ended. (Does this include the successful complete creation of the
        # table it was imported to?)
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The Amazon Resource Number (ARN) corresponding to the import request.
        @[JSON::Field(key: "ImportArn")]
        getter import_arn : String?

        # The status of the import operation.
        @[JSON::Field(key: "ImportStatus")]
        getter import_status : String?

        # The format of the source data. Valid values are CSV , DYNAMODB_JSON or ION .
        @[JSON::Field(key: "InputFormat")]
        getter input_format : String?

        # The path and S3 bucket of the source file that is being imported. This includes the S3Bucket
        # (required), S3KeyPrefix (optional) and S3BucketOwner (optional if the bucket is owned by the
        # requester).
        @[JSON::Field(key: "S3BucketSource")]
        getter s3_bucket_source : Types::S3BucketSource?

        # The time at which this import task began.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The Amazon Resource Number (ARN) of the table being imported into.
        @[JSON::Field(key: "TableArn")]
        getter table_arn : String?

        def initialize(
          @cloud_watch_log_group_arn : String? = nil,
          @end_time : Time? = nil,
          @import_arn : String? = nil,
          @import_status : String? = nil,
          @input_format : String? = nil,
          @s3_bucket_source : Types::S3BucketSource? = nil,
          @start_time : Time? = nil,
          @table_arn : String? = nil
        )
        end
      end

      # Represents the properties of the table being imported into.
      struct ImportTableDescription
        include JSON::Serializable

        # The client token that was provided for the import task. Reusing the client token on retry makes a
        # call to ImportTable idempotent.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The Amazon Resource Number (ARN) of the Cloudwatch Log Group associated with the target table.
        @[JSON::Field(key: "CloudWatchLogGroupArn")]
        getter cloud_watch_log_group_arn : String?

        # The time at which the creation of the table associated with this import task completed.
        @[JSON::Field(key: "EndTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The number of errors occurred on importing the source file into the target table.
        @[JSON::Field(key: "ErrorCount")]
        getter error_count : Int64?

        # The error code corresponding to the failure that the import job ran into during execution.
        @[JSON::Field(key: "FailureCode")]
        getter failure_code : String?

        # The error message corresponding to the failure that the import job ran into during execution.
        @[JSON::Field(key: "FailureMessage")]
        getter failure_message : String?

        # The Amazon Resource Number (ARN) corresponding to the import request.
        @[JSON::Field(key: "ImportArn")]
        getter import_arn : String?

        # The status of the import.
        @[JSON::Field(key: "ImportStatus")]
        getter import_status : String?

        # The number of items successfully imported into the new table.
        @[JSON::Field(key: "ImportedItemCount")]
        getter imported_item_count : Int64?

        # The compression options for the data that has been imported into the target table. The values are
        # NONE, GZIP, or ZSTD.
        @[JSON::Field(key: "InputCompressionType")]
        getter input_compression_type : String?

        # The format of the source data going into the target table.
        @[JSON::Field(key: "InputFormat")]
        getter input_format : String?

        # The format options for the data that was imported into the target table. There is one value,
        # CsvOption.
        @[JSON::Field(key: "InputFormatOptions")]
        getter input_format_options : Types::InputFormatOptions?

        # The total number of items processed from the source file.
        @[JSON::Field(key: "ProcessedItemCount")]
        getter processed_item_count : Int64?

        # The total size of data processed from the source file, in Bytes.
        @[JSON::Field(key: "ProcessedSizeBytes")]
        getter processed_size_bytes : Int64?

        # Values for the S3 bucket the source file is imported from. Includes bucket name (required), key
        # prefix (optional) and bucket account owner ID (optional).
        @[JSON::Field(key: "S3BucketSource")]
        getter s3_bucket_source : Types::S3BucketSource?

        # The time when this import task started.
        @[JSON::Field(key: "StartTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The Amazon Resource Number (ARN) of the table being imported into.
        @[JSON::Field(key: "TableArn")]
        getter table_arn : String?

        # The parameters for the new table that is being imported into.
        @[JSON::Field(key: "TableCreationParameters")]
        getter table_creation_parameters : Types::TableCreationParameters?

        # The table id corresponding to the table created by import table process.
        @[JSON::Field(key: "TableId")]
        getter table_id : String?

        def initialize(
          @client_token : String? = nil,
          @cloud_watch_log_group_arn : String? = nil,
          @end_time : Time? = nil,
          @error_count : Int64? = nil,
          @failure_code : String? = nil,
          @failure_message : String? = nil,
          @import_arn : String? = nil,
          @import_status : String? = nil,
          @imported_item_count : Int64? = nil,
          @input_compression_type : String? = nil,
          @input_format : String? = nil,
          @input_format_options : Types::InputFormatOptions? = nil,
          @processed_item_count : Int64? = nil,
          @processed_size_bytes : Int64? = nil,
          @s3_bucket_source : Types::S3BucketSource? = nil,
          @start_time : Time? = nil,
          @table_arn : String? = nil,
          @table_creation_parameters : Types::TableCreationParameters? = nil,
          @table_id : String? = nil
        )
        end
      end

      struct ImportTableInput
        include JSON::Serializable

        # The format of the source data. Valid values for ImportFormat are CSV , DYNAMODB_JSON or ION .
        @[JSON::Field(key: "InputFormat")]
        getter input_format : String

        # The S3 bucket that provides the source for the import.
        @[JSON::Field(key: "S3BucketSource")]
        getter s3_bucket_source : Types::S3BucketSource

        # Parameters for the table to import the data into.
        @[JSON::Field(key: "TableCreationParameters")]
        getter table_creation_parameters : Types::TableCreationParameters

        # Providing a ClientToken makes the call to ImportTableInput idempotent, meaning that multiple
        # identical calls have the same effect as one single call. A client token is valid for 8 hours after
        # the first request that uses it is completed. After 8 hours, any request with the same client token
        # is treated as a new request. Do not resubmit the same request with the same client token for more
        # than 8 hours, or the result might not be idempotent. If you submit a request with the same client
        # token but a change in other parameters within the 8-hour idempotency window, DynamoDB returns an
        # IdempotentParameterMismatch exception.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Type of compression to be used on the input coming from the imported table.
        @[JSON::Field(key: "InputCompressionType")]
        getter input_compression_type : String?

        # Additional properties that specify how the input is formatted,
        @[JSON::Field(key: "InputFormatOptions")]
        getter input_format_options : Types::InputFormatOptions?

        def initialize(
          @input_format : String,
          @s3_bucket_source : Types::S3BucketSource,
          @table_creation_parameters : Types::TableCreationParameters,
          @client_token : String? = nil,
          @input_compression_type : String? = nil,
          @input_format_options : Types::InputFormatOptions? = nil
        )
        end
      end

      struct ImportTableOutput
        include JSON::Serializable

        # Represents the properties of the table created for the import, and parameters of the import. The
        # import parameters include import status, how many items were processed, and how many errors were
        # encountered.
        @[JSON::Field(key: "ImportTableDescription")]
        getter import_table_description : Types::ImportTableDescription

        def initialize(
          @import_table_description : Types::ImportTableDescription
        )
        end
      end

      # Optional object containing the parameters specific to an incremental export.
      struct IncrementalExportSpecification
        include JSON::Serializable

        # Time in the past which provides the inclusive start range for the export table's data, counted in
        # seconds from the start of the Unix epoch. The incremental export will reflect the table's state
        # including and after this point in time.
        @[JSON::Field(key: "ExportFromTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter export_from_time : Time?

        # Time in the past which provides the exclusive end range for the export table's data, counted in
        # seconds from the start of the Unix epoch. The incremental export will reflect the table's state just
        # prior to this point in time. If this is not provided, the latest time with data available will be
        # used.
        @[JSON::Field(key: "ExportToTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter export_to_time : Time?

        # The view type that was chosen for the export. Valid values are NEW_AND_OLD_IMAGES and NEW_IMAGES .
        # The default value is NEW_AND_OLD_IMAGES .
        @[JSON::Field(key: "ExportViewType")]
        getter export_view_type : String?

        def initialize(
          @export_from_time : Time? = nil,
          @export_to_time : Time? = nil,
          @export_view_type : String? = nil
        )
        end
      end

      # The operation tried to access a nonexistent index.
      struct IndexNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The format options for the data that was imported into the target table. There is one value,
      # CsvOption.
      struct InputFormatOptions
        include JSON::Serializable

        # The options for imported source files in CSV format. The values are Delimiter and HeaderList.
        @[JSON::Field(key: "Csv")]
        getter csv : Types::CsvOptions?

        def initialize(
          @csv : Types::CsvOptions? = nil
        )
        end
      end

      # An error occurred on the server side.
      struct InternalServerError
        include JSON::Serializable

        # The server encountered an internal error trying to fulfill the request.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified ExportTime is outside of the point in time recovery window.
      struct InvalidExportTimeException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An invalid restore time was specified. RestoreDateTime must be between EarliestRestorableDateTime
      # and LatestRestorableDateTime.
      struct InvalidRestoreTimeException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about item collections, if any, that were affected by the operation.
      # ItemCollectionMetrics is only returned if the request asked for it. If the table does not have any
      # local secondary indexes, this information is not returned in the response.
      struct ItemCollectionMetrics
        include JSON::Serializable

        # The partition key value of the item collection. This value is the same as the partition key value of
        # the item.
        @[JSON::Field(key: "ItemCollectionKey")]
        getter item_collection_key : Hash(String, Types::AttributeValue)?

        # An estimate of item collection size, in gigabytes. This value is a two-element array containing a
        # lower bound and an upper bound for the estimate. The estimate includes the size of all the items in
        # the table, plus the size of all attributes projected into all of the local secondary indexes on that
        # table. Use this estimate to measure whether a local secondary index is approaching its size limit.
        # The estimate is subject to change over time; therefore, do not rely on the precision or accuracy of
        # the estimate.
        @[JSON::Field(key: "SizeEstimateRangeGB")]
        getter size_estimate_range_gb : Array(Float64)?

        def initialize(
          @item_collection_key : Hash(String, Types::AttributeValue)? = nil,
          @size_estimate_range_gb : Array(Float64)? = nil
        )
        end
      end

      # An item collection is too large. This exception is only returned for tables that have one or more
      # local secondary indexes.
      struct ItemCollectionSizeLimitExceededException
        include JSON::Serializable

        # The total size of an item collection has exceeded the maximum limit of 10 gigabytes.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Details for the requested item.
      struct ItemResponse
        include JSON::Serializable

        # Map of attribute data consisting of the data type and attribute value.
        @[JSON::Field(key: "Item")]
        getter item : Hash(String, Types::AttributeValue)?

        def initialize(
          @item : Hash(String, Types::AttributeValue)? = nil
        )
        end
      end

      # Represents a single element of a key schema. A key schema specifies the attributes that make up the
      # primary key of a table, or the key attributes of an index. A KeySchemaElement represents exactly one
      # attribute of the primary key. For example, a simple primary key would be represented by one
      # KeySchemaElement (for the partition key). A composite primary key would require one KeySchemaElement
      # for the partition key, and another KeySchemaElement for the sort key. A KeySchemaElement must be a
      # scalar, top-level attribute (not a nested attribute). The data type must be one of String, Number,
      # or Binary. The attribute cannot be nested within a List or a Map.
      struct KeySchemaElement
        include JSON::Serializable

        # The name of a key attribute.
        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # The role that this key attribute will assume: HASH - partition key RANGE - sort key The partition
        # key of an item is also known as its hash attribute . The term "hash attribute" derives from
        # DynamoDB's usage of an internal hash function to evenly distribute data items across partitions,
        # based on their partition key values. The sort key of an item is also known as its range attribute .
        # The term "range attribute" derives from the way DynamoDB stores items with the same partition key
        # physically close together, in sorted order by the sort key value.
        @[JSON::Field(key: "KeyType")]
        getter key_type : String

        def initialize(
          @attribute_name : String,
          @key_type : String
        )
        end
      end

      # Represents a set of primary keys and, for each key, the attributes to retrieve from the table. For
      # each primary key, you must provide all of the key attributes. For example, with a simple primary
      # key, you only need to provide the partition key. For a composite primary key, you must provide both
      # the partition key and the sort key.
      struct KeysAndAttributes
        include JSON::Serializable

        # The primary key attribute values that define the items and the attributes associated with the items.
        @[JSON::Field(key: "Keys")]
        getter keys : Array(Hash(String, Types::AttributeValue))

        # This is a legacy parameter. Use ProjectionExpression instead. For more information, see Legacy
        # Conditional Parameters in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "AttributesToGet")]
        getter attributes_to_get : Array(String)?

        # The consistency of a read operation. If set to true , then a strongly consistent read is used;
        # otherwise, an eventually consistent read is used.
        @[JSON::Field(key: "ConsistentRead")]
        getter consistent_read : Bool?

        # One or more substitution tokens for attribute names in an expression. The following are some use
        # cases for using ExpressionAttributeNames : To access an attribute whose name conflicts with a
        # DynamoDB reserved word. To create a placeholder for repeating occurrences of an attribute name in an
        # expression. To prevent special characters in an attribute name from being misinterpreted in an
        # expression. Use the # character in an expression to dereference an attribute name. For example,
        # consider the following attribute name: Percentile The name of this attribute conflicts with a
        # reserved word, so it cannot be used directly in an expression. (For the complete list of reserved
        # words, see Reserved Words in the Amazon DynamoDB Developer Guide ). To work around this, you could
        # specify the following for ExpressionAttributeNames : {"#P":"Percentile"} You could then use this
        # substitution in an expression, as in this example: #P = :val Tokens that begin with the : character
        # are expression attribute values , which are placeholders for the actual value at runtime. For more
        # information on expression attribute names, see Accessing Item Attributes in the Amazon DynamoDB
        # Developer Guide .
        @[JSON::Field(key: "ExpressionAttributeNames")]
        getter expression_attribute_names : Hash(String, String)?

        # A string that identifies one or more attributes to retrieve from the table. These attributes can
        # include scalars, sets, or elements of a JSON document. The attributes in the ProjectionExpression
        # must be separated by commas. If no attribute names are specified, then all attributes will be
        # returned. If any of the requested attributes are not found, they will not appear in the result. For
        # more information, see Accessing Item Attributes in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "ProjectionExpression")]
        getter projection_expression : String?

        def initialize(
          @keys : Array(Hash(String, Types::AttributeValue)),
          @attributes_to_get : Array(String)? = nil,
          @consistent_read : Bool? = nil,
          @expression_attribute_names : Hash(String, String)? = nil,
          @projection_expression : String? = nil
        )
        end
      end

      # Describes a Kinesis data stream destination.
      struct KinesisDataStreamDestination
        include JSON::Serializable

        # The precision of the Kinesis data stream timestamp. The values are either MILLISECOND or MICROSECOND
        # .
        @[JSON::Field(key: "ApproximateCreationDateTimePrecision")]
        getter approximate_creation_date_time_precision : String?

        # The current status of replication.
        @[JSON::Field(key: "DestinationStatus")]
        getter destination_status : String?

        # The human-readable string that corresponds to the replica status.
        @[JSON::Field(key: "DestinationStatusDescription")]
        getter destination_status_description : String?

        # The ARN for a specific Kinesis data stream.
        @[JSON::Field(key: "StreamArn")]
        getter stream_arn : String?

        def initialize(
          @approximate_creation_date_time_precision : String? = nil,
          @destination_status : String? = nil,
          @destination_status_description : String? = nil,
          @stream_arn : String? = nil
        )
        end
      end

      struct KinesisStreamingDestinationInput
        include JSON::Serializable

        # The ARN for a Kinesis data stream.
        @[JSON::Field(key: "StreamArn")]
        getter stream_arn : String

        # The name of the DynamoDB table. You can also provide the Amazon Resource Name (ARN) of the table in
        # this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # The source for the Kinesis streaming information that is being enabled.
        @[JSON::Field(key: "EnableKinesisStreamingConfiguration")]
        getter enable_kinesis_streaming_configuration : Types::EnableKinesisStreamingConfiguration?

        def initialize(
          @stream_arn : String,
          @table_name : String,
          @enable_kinesis_streaming_configuration : Types::EnableKinesisStreamingConfiguration? = nil
        )
        end
      end

      struct KinesisStreamingDestinationOutput
        include JSON::Serializable

        # The current status of the replication.
        @[JSON::Field(key: "DestinationStatus")]
        getter destination_status : String?

        # The destination for the Kinesis streaming information that is being enabled.
        @[JSON::Field(key: "EnableKinesisStreamingConfiguration")]
        getter enable_kinesis_streaming_configuration : Types::EnableKinesisStreamingConfiguration?

        # The ARN for the specific Kinesis data stream.
        @[JSON::Field(key: "StreamArn")]
        getter stream_arn : String?

        # The name of the table being modified.
        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        def initialize(
          @destination_status : String? = nil,
          @enable_kinesis_streaming_configuration : Types::EnableKinesisStreamingConfiguration? = nil,
          @stream_arn : String? = nil,
          @table_name : String? = nil
        )
        end
      end

      # There is no limit to the number of daily on-demand backups that can be taken. For most purposes, up
      # to 500 simultaneous table operations are allowed per account. These operations include CreateTable ,
      # UpdateTable , DeleteTable , UpdateTimeToLive , RestoreTableFromBackup , and
      # RestoreTableToPointInTime . When you are creating a table with one or more secondary indexes, you
      # can have up to 250 such requests running at a time. However, if the table or index specifications
      # are complex, then DynamoDB might temporarily reduce the number of concurrent operations. When
      # importing into DynamoDB, up to 50 simultaneous import table operations are allowed per account.
      # There is a soft account quota of 2,500 tables. GetRecords was called with a value of more than 1000
      # for the limit request parameter. More than 2 processes are reading from the same streams shard at
      # the same time. Exceeding this limit may result in request throttling.
      struct LimitExceededException
        include JSON::Serializable

        # Too many operations for a given subscriber.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListBackupsInput
        include JSON::Serializable

        # The backups from the table specified by BackupType are listed. Where BackupType can be: USER -
        # On-demand backup created by you. (The default setting if no other backup types are specified.)
        # SYSTEM - On-demand backup automatically created by DynamoDB. ALL - All types of on-demand backups
        # (USER and SYSTEM).
        @[JSON::Field(key: "BackupType")]
        getter backup_type : String?

        # LastEvaluatedBackupArn is the Amazon Resource Name (ARN) of the backup last evaluated when the
        # current page of results was returned, inclusive of the current page of results. This value may be
        # specified as the ExclusiveStartBackupArn of a new ListBackups operation in order to fetch the next
        # page of results.
        @[JSON::Field(key: "ExclusiveStartBackupArn")]
        getter exclusive_start_backup_arn : String?

        # Maximum number of backups to return at once.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # Lists the backups from the table specified in TableName . You can also provide the Amazon Resource
        # Name (ARN) of the table in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        # Only backups created after this time are listed. TimeRangeLowerBound is inclusive.
        @[JSON::Field(key: "TimeRangeLowerBound", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter time_range_lower_bound : Time?

        # Only backups created before this time are listed. TimeRangeUpperBound is exclusive.
        @[JSON::Field(key: "TimeRangeUpperBound", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter time_range_upper_bound : Time?

        def initialize(
          @backup_type : String? = nil,
          @exclusive_start_backup_arn : String? = nil,
          @limit : Int32? = nil,
          @table_name : String? = nil,
          @time_range_lower_bound : Time? = nil,
          @time_range_upper_bound : Time? = nil
        )
        end
      end

      struct ListBackupsOutput
        include JSON::Serializable

        # List of BackupSummary objects.
        @[JSON::Field(key: "BackupSummaries")]
        getter backup_summaries : Array(Types::BackupSummary)?

        # The ARN of the backup last evaluated when the current page of results was returned, inclusive of the
        # current page of results. This value may be specified as the ExclusiveStartBackupArn of a new
        # ListBackups operation in order to fetch the next page of results. If LastEvaluatedBackupArn is
        # empty, then the last page of results has been processed and there are no more results to be
        # retrieved. If LastEvaluatedBackupArn is not empty, this may or may not indicate that there is more
        # data to be returned. All results are guaranteed to have been returned if and only if no value for
        # LastEvaluatedBackupArn is returned.
        @[JSON::Field(key: "LastEvaluatedBackupArn")]
        getter last_evaluated_backup_arn : String?

        def initialize(
          @backup_summaries : Array(Types::BackupSummary)? = nil,
          @last_evaluated_backup_arn : String? = nil
        )
        end
      end

      struct ListContributorInsightsInput
        include JSON::Serializable

        # Maximum number of results to return per page.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token to for the desired page, if there is one.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The name of the table. You can also provide the Amazon Resource Name (ARN) of the table in this
        # parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @table_name : String? = nil
        )
        end
      end

      struct ListContributorInsightsOutput
        include JSON::Serializable

        # A list of ContributorInsightsSummary.
        @[JSON::Field(key: "ContributorInsightsSummaries")]
        getter contributor_insights_summaries : Array(Types::ContributorInsightsSummary)?

        # A token to go to the next page if there is one.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @contributor_insights_summaries : Array(Types::ContributorInsightsSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListExportsInput
        include JSON::Serializable

        # Maximum number of results to return per page.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An optional string that, if supplied, must be copied from the output of a previous call to
        # ListExports . When provided in this manner, the API fetches the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) associated with the exported table.
        @[JSON::Field(key: "TableArn")]
        getter table_arn : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @table_arn : String? = nil
        )
        end
      end

      struct ListExportsOutput
        include JSON::Serializable

        # A list of ExportSummary objects.
        @[JSON::Field(key: "ExportSummaries")]
        getter export_summaries : Array(Types::ExportSummary)?

        # If this value is returned, there are additional results to be displayed. To retrieve them, call
        # ListExports again, with NextToken set to this value.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @export_summaries : Array(Types::ExportSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListGlobalTablesInput
        include JSON::Serializable

        # The first global table name that this operation will evaluate.
        @[JSON::Field(key: "ExclusiveStartGlobalTableName")]
        getter exclusive_start_global_table_name : String?

        # The maximum number of table names to return, if the parameter is not specified DynamoDB defaults to
        # 100. If the number of global tables DynamoDB finds reaches this limit, it stops the operation and
        # returns the table names collected up to that point, with a table name in the
        # LastEvaluatedGlobalTableName to apply in a subsequent operation to the ExclusiveStartGlobalTableName
        # parameter.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # Lists the global tables in a specific Region.
        @[JSON::Field(key: "RegionName")]
        getter region_name : String?

        def initialize(
          @exclusive_start_global_table_name : String? = nil,
          @limit : Int32? = nil,
          @region_name : String? = nil
        )
        end
      end

      struct ListGlobalTablesOutput
        include JSON::Serializable

        # List of global table names.
        @[JSON::Field(key: "GlobalTables")]
        getter global_tables : Array(Types::GlobalTable)?

        # Last evaluated global table name.
        @[JSON::Field(key: "LastEvaluatedGlobalTableName")]
        getter last_evaluated_global_table_name : String?

        def initialize(
          @global_tables : Array(Types::GlobalTable)? = nil,
          @last_evaluated_global_table_name : String? = nil
        )
        end
      end

      struct ListImportsInput
        include JSON::Serializable

        # An optional string that, if supplied, must be copied from the output of a previous call to
        # ListImports . When provided in this manner, the API fetches the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The number of ImportSummary objects returned in a single page.
        @[JSON::Field(key: "PageSize")]
        getter page_size : Int32?

        # The Amazon Resource Name (ARN) associated with the table that was imported to.
        @[JSON::Field(key: "TableArn")]
        getter table_arn : String?

        def initialize(
          @next_token : String? = nil,
          @page_size : Int32? = nil,
          @table_arn : String? = nil
        )
        end
      end

      struct ListImportsOutput
        include JSON::Serializable

        # A list of ImportSummary objects.
        @[JSON::Field(key: "ImportSummaryList")]
        getter import_summary_list : Array(Types::ImportSummary)?

        # If this value is returned, there are additional results to be displayed. To retrieve them, call
        # ListImports again, with NextToken set to this value.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @import_summary_list : Array(Types::ImportSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the input of a ListTables operation.
      struct ListTablesInput
        include JSON::Serializable

        # The first table name that this operation will evaluate. Use the value that was returned for
        # LastEvaluatedTableName in a previous operation, so that you can obtain the next page of results.
        @[JSON::Field(key: "ExclusiveStartTableName")]
        getter exclusive_start_table_name : String?

        # A maximum number of table names to return. If this parameter is not specified, the limit is 100.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        def initialize(
          @exclusive_start_table_name : String? = nil,
          @limit : Int32? = nil
        )
        end
      end

      # Represents the output of a ListTables operation.
      struct ListTablesOutput
        include JSON::Serializable

        # The name of the last table in the current page of results. Use this value as the
        # ExclusiveStartTableName in a new request to obtain the next page of results, until all the table
        # names are returned. If you do not receive a LastEvaluatedTableName value in the response, this means
        # that there are no more table names to be retrieved.
        @[JSON::Field(key: "LastEvaluatedTableName")]
        getter last_evaluated_table_name : String?

        # The names of the tables associated with the current account at the current endpoint. The maximum
        # size of this array is 100. If LastEvaluatedTableName also appears in the output, you can use this
        # value as the ExclusiveStartTableName parameter in a subsequent ListTables request and obtain the
        # next page of results.
        @[JSON::Field(key: "TableNames")]
        getter table_names : Array(String)?

        def initialize(
          @last_evaluated_table_name : String? = nil,
          @table_names : Array(String)? = nil
        )
        end
      end

      struct ListTagsOfResourceInput
        include JSON::Serializable

        # The Amazon DynamoDB resource with tags to be listed. This value is an Amazon Resource Name (ARN).
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # An optional string that, if supplied, must be copied from the output of a previous call to
        # ListTagOfResource. When provided in this manner, this API fetches the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsOfResourceOutput
        include JSON::Serializable

        # If this value is returned, there are additional results to be displayed. To retrieve them, call
        # ListTagsOfResource again, with NextToken set to this value.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The tags currently associated with the Amazon DynamoDB resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Represents the properties of a local secondary index.
      struct LocalSecondaryIndex
        include JSON::Serializable

        # The name of the local secondary index. The name must be unique among all other indexes on this
        # table.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # The complete key schema for the local secondary index, consisting of one or more pairs of attribute
        # names and key types: HASH - partition key RANGE - sort key The partition key of an item is also
        # known as its hash attribute . The term "hash attribute" derives from DynamoDB's usage of an internal
        # hash function to evenly distribute data items across partitions, based on their partition key
        # values. The sort key of an item is also known as its range attribute . The term "range attribute"
        # derives from the way DynamoDB stores items with the same partition key physically close together, in
        # sorted order by the sort key value.
        @[JSON::Field(key: "KeySchema")]
        getter key_schema : Array(Types::KeySchemaElement)

        # Represents attributes that are copied (projected) from the table into the local secondary index.
        # These are in addition to the primary key attributes and index key attributes, which are
        # automatically projected.
        @[JSON::Field(key: "Projection")]
        getter projection : Types::Projection

        def initialize(
          @index_name : String,
          @key_schema : Array(Types::KeySchemaElement),
          @projection : Types::Projection
        )
        end
      end

      # Represents the properties of a local secondary index.
      struct LocalSecondaryIndexDescription
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that uniquely identifies the index.
        @[JSON::Field(key: "IndexArn")]
        getter index_arn : String?

        # Represents the name of the local secondary index.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        # The total size of the specified index, in bytes. DynamoDB updates this value approximately every six
        # hours. Recent changes might not be reflected in this value.
        @[JSON::Field(key: "IndexSizeBytes")]
        getter index_size_bytes : Int64?

        # The number of items in the specified index. DynamoDB updates this value approximately every six
        # hours. Recent changes might not be reflected in this value.
        @[JSON::Field(key: "ItemCount")]
        getter item_count : Int64?

        # The complete key schema for the local secondary index, consisting of one or more pairs of attribute
        # names and key types: HASH - partition key RANGE - sort key The partition key of an item is also
        # known as its hash attribute . The term "hash attribute" derives from DynamoDB's usage of an internal
        # hash function to evenly distribute data items across partitions, based on their partition key
        # values. The sort key of an item is also known as its range attribute . The term "range attribute"
        # derives from the way DynamoDB stores items with the same partition key physically close together, in
        # sorted order by the sort key value.
        @[JSON::Field(key: "KeySchema")]
        getter key_schema : Array(Types::KeySchemaElement)?

        # Represents attributes that are copied (projected) from the table into the global secondary index.
        # These are in addition to the primary key attributes and index key attributes, which are
        # automatically projected.
        @[JSON::Field(key: "Projection")]
        getter projection : Types::Projection?

        def initialize(
          @index_arn : String? = nil,
          @index_name : String? = nil,
          @index_size_bytes : Int64? = nil,
          @item_count : Int64? = nil,
          @key_schema : Array(Types::KeySchemaElement)? = nil,
          @projection : Types::Projection? = nil
        )
        end
      end

      # Represents the properties of a local secondary index for the table when the backup was created.
      struct LocalSecondaryIndexInfo
        include JSON::Serializable

        # Represents the name of the local secondary index.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        # The complete key schema for a local secondary index, which consists of one or more pairs of
        # attribute names and key types: HASH - partition key RANGE - sort key The partition key of an item is
        # also known as its hash attribute . The term "hash attribute" derives from DynamoDB's usage of an
        # internal hash function to evenly distribute data items across partitions, based on their partition
        # key values. The sort key of an item is also known as its range attribute . The term "range
        # attribute" derives from the way DynamoDB stores items with the same partition key physically close
        # together, in sorted order by the sort key value.
        @[JSON::Field(key: "KeySchema")]
        getter key_schema : Array(Types::KeySchemaElement)?

        # Represents attributes that are copied (projected) from the table into the global secondary index.
        # These are in addition to the primary key attributes and index key attributes, which are
        # automatically projected.
        @[JSON::Field(key: "Projection")]
        getter projection : Types::Projection?

        def initialize(
          @index_name : String? = nil,
          @key_schema : Array(Types::KeySchemaElement)? = nil,
          @projection : Types::Projection? = nil
        )
        end
      end

      # Sets the maximum number of read and write units for the specified on-demand table. If you use this
      # parameter, you must specify MaxReadRequestUnits , MaxWriteRequestUnits , or both.
      struct OnDemandThroughput
        include JSON::Serializable

        # Maximum number of read request units for the specified table. To specify a maximum
        # OnDemandThroughput on your table, set the value of MaxReadRequestUnits as greater than or equal to
        # 1. To remove the maximum OnDemandThroughput that is currently set on your table, set the value of
        # MaxReadRequestUnits to -1.
        @[JSON::Field(key: "MaxReadRequestUnits")]
        getter max_read_request_units : Int64?

        # Maximum number of write request units for the specified table. To specify a maximum
        # OnDemandThroughput on your table, set the value of MaxWriteRequestUnits as greater than or equal to
        # 1. To remove the maximum OnDemandThroughput that is currently set on your table, set the value of
        # MaxWriteRequestUnits to -1.
        @[JSON::Field(key: "MaxWriteRequestUnits")]
        getter max_write_request_units : Int64?

        def initialize(
          @max_read_request_units : Int64? = nil,
          @max_write_request_units : Int64? = nil
        )
        end
      end

      # Overrides the on-demand throughput settings for this replica table. If you don't specify a value for
      # this parameter, it uses the source table's on-demand throughput settings.
      struct OnDemandThroughputOverride
        include JSON::Serializable

        # Maximum number of read request units for the specified replica table.
        @[JSON::Field(key: "MaxReadRequestUnits")]
        getter max_read_request_units : Int64?

        def initialize(
          @max_read_request_units : Int64? = nil
        )
        end
      end

      # Represents a PartiQL statement that uses parameters.
      struct ParameterizedStatement
        include JSON::Serializable

        # A PartiQL statement that uses parameters.
        @[JSON::Field(key: "Statement")]
        getter statement : String

        # The parameter values.
        @[JSON::Field(key: "Parameters")]
        getter parameters : Array(Types::AttributeValue)?

        # An optional parameter that returns the item attributes for a PartiQL ParameterizedStatement
        # operation that failed a condition check. There is no additional cost associated with requesting a
        # return value aside from the small network and processing overhead of receiving a larger response. No
        # read capacity units are consumed.
        @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure")]
        getter return_values_on_condition_check_failure : String?

        def initialize(
          @statement : String,
          @parameters : Array(Types::AttributeValue)? = nil,
          @return_values_on_condition_check_failure : String? = nil
        )
        end
      end

      # The description of the point in time settings applied to the table.
      struct PointInTimeRecoveryDescription
        include JSON::Serializable

        # Specifies the earliest point in time you can restore your table to. You can restore your table to
        # any point in time during the last 35 days.
        @[JSON::Field(key: "EarliestRestorableDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter earliest_restorable_date_time : Time?

        # LatestRestorableDateTime is typically 5 minutes before the current time.
        @[JSON::Field(key: "LatestRestorableDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter latest_restorable_date_time : Time?

        # The current state of point in time recovery: ENABLED - Point in time recovery is enabled. DISABLED -
        # Point in time recovery is disabled.
        @[JSON::Field(key: "PointInTimeRecoveryStatus")]
        getter point_in_time_recovery_status : String?

        # The number of preceding days for which continuous backups are taken and maintained. Your table data
        # is only recoverable to any point-in-time from within the configured recovery period. This parameter
        # is optional.
        @[JSON::Field(key: "RecoveryPeriodInDays")]
        getter recovery_period_in_days : Int32?

        def initialize(
          @earliest_restorable_date_time : Time? = nil,
          @latest_restorable_date_time : Time? = nil,
          @point_in_time_recovery_status : String? = nil,
          @recovery_period_in_days : Int32? = nil
        )
        end
      end

      # Represents the settings used to enable point in time recovery.
      struct PointInTimeRecoverySpecification
        include JSON::Serializable

        # Indicates whether point in time recovery is enabled (true) or disabled (false) on the table.
        @[JSON::Field(key: "PointInTimeRecoveryEnabled")]
        getter point_in_time_recovery_enabled : Bool

        # The number of preceding days for which continuous backups are taken and maintained. Your table data
        # is only recoverable to any point-in-time from within the configured recovery period. This parameter
        # is optional. If no value is provided, the value will default to 35.
        @[JSON::Field(key: "RecoveryPeriodInDays")]
        getter recovery_period_in_days : Int32?

        def initialize(
          @point_in_time_recovery_enabled : Bool,
          @recovery_period_in_days : Int32? = nil
        )
        end
      end

      # Point in time recovery has not yet been enabled for this source table.
      struct PointInTimeRecoveryUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation tried to access a nonexistent resource-based policy. If you specified an
      # ExpectedRevisionId , it's possible that a policy is present for the resource but its revision ID
      # didn't match the expected value.
      struct PolicyNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents attributes that are copied (projected) from the table into an index. These are in
      # addition to the primary key attributes and index key attributes, which are automatically projected.
      struct Projection
        include JSON::Serializable

        # Represents the non-key attribute names which will be projected into the index. For global and local
        # secondary indexes, the total count of NonKeyAttributes summed across all of the secondary indexes,
        # must not exceed 100. If you project the same attribute into two different indexes, this counts as
        # two distinct attributes when determining the total. This limit only applies when you specify the
        # ProjectionType of INCLUDE . You still can specify the ProjectionType of ALL to project all
        # attributes from the source table, even if the table has more than 100 attributes.
        @[JSON::Field(key: "NonKeyAttributes")]
        getter non_key_attributes : Array(String)?

        # The set of attributes that are projected into the index: KEYS_ONLY - Only the index and primary keys
        # are projected into the index. INCLUDE - In addition to the attributes described in KEYS_ONLY , the
        # secondary index will include other non-key attributes that you specify. ALL - All of the table
        # attributes are projected into the index. When using the DynamoDB console, ALL is selected by
        # default.
        @[JSON::Field(key: "ProjectionType")]
        getter projection_type : String?

        def initialize(
          @non_key_attributes : Array(String)? = nil,
          @projection_type : String? = nil
        )
        end
      end

      # Represents the provisioned throughput settings for the specified global secondary index. You must
      # use ProvisionedThroughput or OnDemandThroughput based on your table’s capacity mode. For current
      # minimum and maximum provisioned throughput values, see Service, Account, and Table Quotas in the
      # Amazon DynamoDB Developer Guide .
      struct ProvisionedThroughput
        include JSON::Serializable

        # The maximum number of strongly consistent reads consumed per second before DynamoDB returns a
        # ThrottlingException . For more information, see Specifying Read and Write Requirements in the Amazon
        # DynamoDB Developer Guide . If read/write capacity mode is PAY_PER_REQUEST the value is set to 0.
        @[JSON::Field(key: "ReadCapacityUnits")]
        getter read_capacity_units : Int64

        # The maximum number of writes consumed per second before DynamoDB returns a ThrottlingException . For
        # more information, see Specifying Read and Write Requirements in the Amazon DynamoDB Developer Guide
        # . If read/write capacity mode is PAY_PER_REQUEST the value is set to 0.
        @[JSON::Field(key: "WriteCapacityUnits")]
        getter write_capacity_units : Int64

        def initialize(
          @read_capacity_units : Int64,
          @write_capacity_units : Int64
        )
        end
      end

      # Represents the provisioned throughput settings for the table, consisting of read and write capacity
      # units, along with data about increases and decreases.
      struct ProvisionedThroughputDescription
        include JSON::Serializable

        # The date and time of the last provisioned throughput decrease for this table.
        @[JSON::Field(key: "LastDecreaseDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_decrease_date_time : Time?

        # The date and time of the last provisioned throughput increase for this table.
        @[JSON::Field(key: "LastIncreaseDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_increase_date_time : Time?

        # The number of provisioned throughput decreases for this table during this UTC calendar day. For
        # current maximums on provisioned throughput decreases, see Service, Account, and Table Quotas in the
        # Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "NumberOfDecreasesToday")]
        getter number_of_decreases_today : Int64?

        # The maximum number of strongly consistent reads consumed per second before DynamoDB returns a
        # ThrottlingException . Eventually consistent reads require less effort than strongly consistent
        # reads, so a setting of 50 ReadCapacityUnits per second provides 100 eventually consistent
        # ReadCapacityUnits per second.
        @[JSON::Field(key: "ReadCapacityUnits")]
        getter read_capacity_units : Int64?

        # The maximum number of writes consumed per second before DynamoDB returns a ThrottlingException .
        @[JSON::Field(key: "WriteCapacityUnits")]
        getter write_capacity_units : Int64?

        def initialize(
          @last_decrease_date_time : Time? = nil,
          @last_increase_date_time : Time? = nil,
          @number_of_decreases_today : Int64? = nil,
          @read_capacity_units : Int64? = nil,
          @write_capacity_units : Int64? = nil
        )
        end
      end

      # The request was denied due to request throttling. For detailed information about why the request was
      # throttled and the ARN of the impacted resource, find the ThrottlingReason field in the returned
      # exception. The Amazon Web Services SDKs for DynamoDB automatically retry requests that receive this
      # exception. Your request is eventually successful, unless your retry queue is too large to finish.
      # Reduce the frequency of requests and use exponential backoff. For more information, go to Error
      # Retries and Exponential Backoff in the Amazon DynamoDB Developer Guide .
      struct ProvisionedThroughputExceededException
        include JSON::Serializable

        # A list of ThrottlingReason that provide detailed diagnostic information about why the request was
        # throttled.
        @[JSON::Field(key: "ThrottlingReasons")]
        getter throttling_reasons : Array(Types::ThrottlingReason)?

        # You exceeded your maximum allowed provisioned throughput.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @throttling_reasons : Array(Types::ThrottlingReason)? = nil,
          @message : String? = nil
        )
        end
      end

      # Replica-specific provisioned throughput settings. If not specified, uses the source table's
      # provisioned throughput settings.
      struct ProvisionedThroughputOverride
        include JSON::Serializable

        # Replica-specific read capacity units. If not specified, uses the source table's read capacity
        # settings.
        @[JSON::Field(key: "ReadCapacityUnits")]
        getter read_capacity_units : Int64?

        def initialize(
          @read_capacity_units : Int64? = nil
        )
        end
      end

      # Represents a request to perform a PutItem operation.
      struct Put
        include JSON::Serializable

        # A map of attribute name to attribute values, representing the primary key of the item to be written
        # by PutItem . All of the table's primary key attributes must be specified, and their data types must
        # match those of the table's key schema. If any attributes are present in the item that are part of an
        # index key schema for the table, their types must match the index key schema.
        @[JSON::Field(key: "Item")]
        getter item : Hash(String, Types::AttributeValue)

        # Name of the table in which to write the item. You can also provide the Amazon Resource Name (ARN) of
        # the table in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # A condition that must be satisfied in order for a conditional update to succeed.
        @[JSON::Field(key: "ConditionExpression")]
        getter condition_expression : String?

        # One or more substitution tokens for attribute names in an expression.
        @[JSON::Field(key: "ExpressionAttributeNames")]
        getter expression_attribute_names : Hash(String, String)?

        # One or more values that can be substituted in an expression.
        @[JSON::Field(key: "ExpressionAttributeValues")]
        getter expression_attribute_values : Hash(String, Types::AttributeValue)?

        # Use ReturnValuesOnConditionCheckFailure to get the item attributes if the Put condition fails. For
        # ReturnValuesOnConditionCheckFailure , the valid values are: NONE and ALL_OLD.
        @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure")]
        getter return_values_on_condition_check_failure : String?

        def initialize(
          @item : Hash(String, Types::AttributeValue),
          @table_name : String,
          @condition_expression : String? = nil,
          @expression_attribute_names : Hash(String, String)? = nil,
          @expression_attribute_values : Hash(String, Types::AttributeValue)? = nil,
          @return_values_on_condition_check_failure : String? = nil
        )
        end
      end

      # Represents the input of a PutItem operation.
      struct PutItemInput
        include JSON::Serializable

        # A map of attribute name/value pairs, one for each attribute. Only the primary key attributes are
        # required; you can optionally provide other attribute name-value pairs for the item. You must provide
        # all of the attributes for the primary key. For example, with a simple primary key, you only need to
        # provide a value for the partition key. For a composite primary key, you must provide both values for
        # both the partition key and the sort key. If you specify any attributes that are part of an index
        # key, then the data types for those attributes must match those of the schema in the table's
        # attribute definition. Empty String and Binary attribute values are allowed. Attribute values of type
        # String and Binary must have a length greater than zero if the attribute is used as a key attribute
        # for a table or index. For more information about primary keys, see Primary Key in the Amazon
        # DynamoDB Developer Guide . Each element in the Item map is an AttributeValue object.
        @[JSON::Field(key: "Item")]
        getter item : Hash(String, Types::AttributeValue)

        # The name of the table to contain the item. You can also provide the Amazon Resource Name (ARN) of
        # the table in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # A condition that must be satisfied in order for a conditional PutItem operation to succeed. An
        # expression can contain any of the following: Functions: attribute_exists | attribute_not_exists |
        # attribute_type | contains | begins_with | size These function names are case-sensitive. Comparison
        # operators: = | &lt;&gt; | &lt; | &gt; | &lt;= | &gt;= | BETWEEN | IN Logical operators: AND | OR |
        # NOT For more information on condition expressions, see Condition Expressions in the Amazon DynamoDB
        # Developer Guide .
        @[JSON::Field(key: "ConditionExpression")]
        getter condition_expression : String?

        # This is a legacy parameter. Use ConditionExpression instead. For more information, see
        # ConditionalOperator in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "ConditionalOperator")]
        getter conditional_operator : String?

        # This is a legacy parameter. Use ConditionExpression instead. For more information, see Expected in
        # the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "Expected")]
        getter expected : Hash(String, Types::ExpectedAttributeValue)?

        # One or more substitution tokens for attribute names in an expression. The following are some use
        # cases for using ExpressionAttributeNames : To access an attribute whose name conflicts with a
        # DynamoDB reserved word. To create a placeholder for repeating occurrences of an attribute name in an
        # expression. To prevent special characters in an attribute name from being misinterpreted in an
        # expression. Use the # character in an expression to dereference an attribute name. For example,
        # consider the following attribute name: Percentile The name of this attribute conflicts with a
        # reserved word, so it cannot be used directly in an expression. (For the complete list of reserved
        # words, see Reserved Words in the Amazon DynamoDB Developer Guide ). To work around this, you could
        # specify the following for ExpressionAttributeNames : {"#P":"Percentile"} You could then use this
        # substitution in an expression, as in this example: #P = :val Tokens that begin with the : character
        # are expression attribute values , which are placeholders for the actual value at runtime. For more
        # information on expression attribute names, see Specifying Item Attributes in the Amazon DynamoDB
        # Developer Guide .
        @[JSON::Field(key: "ExpressionAttributeNames")]
        getter expression_attribute_names : Hash(String, String)?

        # One or more values that can be substituted in an expression. Use the : (colon) character in an
        # expression to dereference an attribute value. For example, suppose that you wanted to check whether
        # the value of the ProductStatus attribute was one of the following: Available | Backordered |
        # Discontinued You would first need to specify ExpressionAttributeValues as follows: {
        # ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"} } You could
        # then use these values in an expression, such as this: ProductStatus IN (:avail, :back, :disc) For
        # more information on expression attribute values, see Condition Expressions in the Amazon DynamoDB
        # Developer Guide .
        @[JSON::Field(key: "ExpressionAttributeValues")]
        getter expression_attribute_values : Hash(String, Types::AttributeValue)?

        @[JSON::Field(key: "ReturnConsumedCapacity")]
        getter return_consumed_capacity : String?

        # Determines whether item collection metrics are returned. If set to SIZE , the response includes
        # statistics about item collections, if any, that were modified during the operation are returned in
        # the response. If set to NONE (the default), no statistics are returned.
        @[JSON::Field(key: "ReturnItemCollectionMetrics")]
        getter return_item_collection_metrics : String?

        # Use ReturnValues if you want to get the item attributes as they appeared before they were updated
        # with the PutItem request. For PutItem , the valid values are: NONE - If ReturnValues is not
        # specified, or if its value is NONE , then nothing is returned. (This setting is the default for
        # ReturnValues .) ALL_OLD - If PutItem overwrote an attribute name-value pair, then the content of the
        # old item is returned. The values returned are strongly consistent. There is no additional cost
        # associated with requesting a return value aside from the small network and processing overhead of
        # receiving a larger response. No read capacity units are consumed. The ReturnValues parameter is used
        # by several DynamoDB operations; however, PutItem does not recognize any values other than NONE or
        # ALL_OLD .
        @[JSON::Field(key: "ReturnValues")]
        getter return_values : String?

        # An optional parameter that returns the item attributes for a PutItem operation that failed a
        # condition check. There is no additional cost associated with requesting a return value aside from
        # the small network and processing overhead of receiving a larger response. No read capacity units are
        # consumed.
        @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure")]
        getter return_values_on_condition_check_failure : String?

        def initialize(
          @item : Hash(String, Types::AttributeValue),
          @table_name : String,
          @condition_expression : String? = nil,
          @conditional_operator : String? = nil,
          @expected : Hash(String, Types::ExpectedAttributeValue)? = nil,
          @expression_attribute_names : Hash(String, String)? = nil,
          @expression_attribute_values : Hash(String, Types::AttributeValue)? = nil,
          @return_consumed_capacity : String? = nil,
          @return_item_collection_metrics : String? = nil,
          @return_values : String? = nil,
          @return_values_on_condition_check_failure : String? = nil
        )
        end
      end

      # Represents the output of a PutItem operation.
      struct PutItemOutput
        include JSON::Serializable

        # The attribute values as they appeared before the PutItem operation, but only if ReturnValues is
        # specified as ALL_OLD in the request. Each element consists of an attribute name and an attribute
        # value.
        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, Types::AttributeValue)?

        # The capacity units consumed by the PutItem operation. The data returned includes the total
        # provisioned throughput consumed, along with statistics for the table and any indexes involved in the
        # operation. ConsumedCapacity is only returned if the ReturnConsumedCapacity parameter was specified.
        # For more information, see Capacity unity consumption for write operations in the Amazon DynamoDB
        # Developer Guide .
        @[JSON::Field(key: "ConsumedCapacity")]
        getter consumed_capacity : Types::ConsumedCapacity?

        # Information about item collections, if any, that were affected by the PutItem operation.
        # ItemCollectionMetrics is only returned if the ReturnItemCollectionMetrics parameter was specified.
        # If the table does not have any local secondary indexes, this information is not returned in the
        # response. Each ItemCollectionMetrics element consists of: ItemCollectionKey - The partition key
        # value of the item collection. This is the same as the partition key value of the item itself.
        # SizeEstimateRangeGB - An estimate of item collection size, in gigabytes. This value is a two-element
        # array containing a lower bound and an upper bound for the estimate. The estimate includes the size
        # of all the items in the table, plus the size of all attributes projected into all of the local
        # secondary indexes on that table. Use this estimate to measure whether a local secondary index is
        # approaching its size limit. The estimate is subject to change over time; therefore, do not rely on
        # the precision or accuracy of the estimate.
        @[JSON::Field(key: "ItemCollectionMetrics")]
        getter item_collection_metrics : Types::ItemCollectionMetrics?

        def initialize(
          @attributes : Hash(String, Types::AttributeValue)? = nil,
          @consumed_capacity : Types::ConsumedCapacity? = nil,
          @item_collection_metrics : Types::ItemCollectionMetrics? = nil
        )
        end
      end

      # Represents a request to perform a PutItem operation on an item.
      struct PutRequest
        include JSON::Serializable

        # A map of attribute name to attribute values, representing the primary key of an item to be processed
        # by PutItem . All of the table's primary key attributes must be specified, and their data types must
        # match those of the table's key schema. If any attributes are present in the item that are part of an
        # index key schema for the table, their types must match the index key schema.
        @[JSON::Field(key: "Item")]
        getter item : Hash(String, Types::AttributeValue)

        def initialize(
          @item : Hash(String, Types::AttributeValue)
        )
        end
      end

      struct PutResourcePolicyInput
        include JSON::Serializable

        # An Amazon Web Services resource-based policy document in JSON format. The maximum size supported for
        # a resource-based policy document is 20 KB. DynamoDB counts whitespaces when calculating the size of
        # a policy against this limit. Within a resource-based policy, if the action for a DynamoDB
        # service-linked role (SLR) to replicate data for a global table is denied, adding or deleting a
        # replica will fail with an error. For a full list of all considerations that apply while attaching a
        # resource-based policy, see Resource-based policy considerations .
        @[JSON::Field(key: "Policy")]
        getter policy : String

        # The Amazon Resource Name (ARN) of the DynamoDB resource to which the policy will be attached. The
        # resources you can specify include tables and streams. You can control index permissions using the
        # base table's policy. To specify the same permission level for your table and its indexes, you can
        # provide both the table and index Amazon Resource Name (ARN)s in the Resource field of a given
        # Statement in your policy document. Alternatively, to specify different permissions for your table,
        # indexes, or both, you can define multiple Statement fields in your policy document.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # Set this parameter to true to confirm that you want to remove your permissions to change the policy
        # of this resource in the future.
        @[JSON::Field(key: "ConfirmRemoveSelfResourceAccess")]
        getter confirm_remove_self_resource_access : Bool?

        # A string value that you can use to conditionally update your policy. You can provide the revision ID
        # of your existing policy to make mutating requests against that policy. When you provide an expected
        # revision ID, if the revision ID of the existing policy on the resource doesn't match or if there's
        # no policy attached to the resource, your request will be rejected with a PolicyNotFoundException .
        # To conditionally attach a policy when no policy exists for the resource, specify NO_POLICY for the
        # revision ID.
        @[JSON::Field(key: "ExpectedRevisionId")]
        getter expected_revision_id : String?

        def initialize(
          @policy : String,
          @resource_arn : String,
          @confirm_remove_self_resource_access : Bool? = nil,
          @expected_revision_id : String? = nil
        )
        end
      end

      struct PutResourcePolicyOutput
        include JSON::Serializable

        # A unique string that represents the revision ID of the policy. If you're comparing revision IDs,
        # make sure to always use string comparison logic.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        def initialize(
          @revision_id : String? = nil
        )
        end
      end

      # Represents the input of a Query operation.
      struct QueryInput
        include JSON::Serializable

        # The name of the table containing the requested items. You can also provide the Amazon Resource Name
        # (ARN) of the table in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # This is a legacy parameter. Use ProjectionExpression instead. For more information, see
        # AttributesToGet in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "AttributesToGet")]
        getter attributes_to_get : Array(String)?

        # This is a legacy parameter. Use FilterExpression instead. For more information, see
        # ConditionalOperator in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "ConditionalOperator")]
        getter conditional_operator : String?

        # Determines the read consistency model: If set to true , then the operation uses strongly consistent
        # reads; otherwise, the operation uses eventually consistent reads. Strongly consistent reads are not
        # supported on global secondary indexes. If you query a global secondary index with ConsistentRead set
        # to true , you will receive a ValidationException .
        @[JSON::Field(key: "ConsistentRead")]
        getter consistent_read : Bool?

        # The primary key of the first item that this operation will evaluate. Use the value that was returned
        # for LastEvaluatedKey in the previous operation. The data type for ExclusiveStartKey must be String,
        # Number, or Binary. No set data types are allowed.
        @[JSON::Field(key: "ExclusiveStartKey")]
        getter exclusive_start_key : Hash(String, Types::AttributeValue)?

        # One or more substitution tokens for attribute names in an expression. The following are some use
        # cases for using ExpressionAttributeNames : To access an attribute whose name conflicts with a
        # DynamoDB reserved word. To create a placeholder for repeating occurrences of an attribute name in an
        # expression. To prevent special characters in an attribute name from being misinterpreted in an
        # expression. Use the # character in an expression to dereference an attribute name. For example,
        # consider the following attribute name: Percentile The name of this attribute conflicts with a
        # reserved word, so it cannot be used directly in an expression. (For the complete list of reserved
        # words, see Reserved Words in the Amazon DynamoDB Developer Guide ). To work around this, you could
        # specify the following for ExpressionAttributeNames : {"#P":"Percentile"} You could then use this
        # substitution in an expression, as in this example: #P = :val Tokens that begin with the : character
        # are expression attribute values , which are placeholders for the actual value at runtime. For more
        # information on expression attribute names, see Specifying Item Attributes in the Amazon DynamoDB
        # Developer Guide .
        @[JSON::Field(key: "ExpressionAttributeNames")]
        getter expression_attribute_names : Hash(String, String)?

        # One or more values that can be substituted in an expression. Use the : (colon) character in an
        # expression to dereference an attribute value. For example, suppose that you wanted to check whether
        # the value of the ProductStatus attribute was one of the following: Available | Backordered |
        # Discontinued You would first need to specify ExpressionAttributeValues as follows: {
        # ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"} } You could
        # then use these values in an expression, such as this: ProductStatus IN (:avail, :back, :disc) For
        # more information on expression attribute values, see Specifying Conditions in the Amazon DynamoDB
        # Developer Guide .
        @[JSON::Field(key: "ExpressionAttributeValues")]
        getter expression_attribute_values : Hash(String, Types::AttributeValue)?

        # A string that contains conditions that DynamoDB applies after the Query operation, but before the
        # data is returned to you. Items that do not satisfy the FilterExpression criteria are not returned. A
        # FilterExpression does not allow key attributes. You cannot define a filter expression based on a
        # partition key or a sort key. A FilterExpression is applied after the items have already been read;
        # the process of filtering does not consume any additional read capacity units. For more information,
        # see Filter Expressions in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "FilterExpression")]
        getter filter_expression : String?

        # The name of an index to query. This index can be any local secondary index or global secondary index
        # on the table. Note that if you use the IndexName parameter, you must also provide TableName.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        # The condition that specifies the key values for items to be retrieved by the Query action. The
        # condition must perform an equality test on a single partition key value. The condition can
        # optionally perform one of several comparison tests on a single sort key value. This allows Query to
        # retrieve one item with a given partition key value and sort key value, or several items that have
        # the same partition key value but different sort key values. The partition key equality test is
        # required, and must be specified in the following format: partitionKeyName = :partitionkeyval If you
        # also want to provide a condition for the sort key, it must be combined using AND with the condition
        # for the sort key. Following is an example, using the = comparison operator for the sort key:
        # partitionKeyName = :partitionkeyval AND sortKeyName = :sortkeyval Valid comparisons for the sort key
        # condition are as follows: sortKeyName = :sortkeyval - true if the sort key value is equal to
        # :sortkeyval . sortKeyName &lt; :sortkeyval - true if the sort key value is less than :sortkeyval .
        # sortKeyName &lt;= :sortkeyval - true if the sort key value is less than or equal to :sortkeyval .
        # sortKeyName &gt; :sortkeyval - true if the sort key value is greater than :sortkeyval . sortKeyName
        # &gt;= :sortkeyval - true if the sort key value is greater than or equal to :sortkeyval . sortKeyName
        # BETWEEN :sortkeyval1 AND :sortkeyval2 - true if the sort key value is greater than or equal to
        # :sortkeyval1 , and less than or equal to :sortkeyval2 . begins_with ( sortKeyName , :sortkeyval ) -
        # true if the sort key value begins with a particular operand. (You cannot use this function with a
        # sort key that is of type Number.) Note that the function name begins_with is case-sensitive. Use the
        # ExpressionAttributeValues parameter to replace tokens such as :partitionval and :sortval with actual
        # values at runtime. You can optionally use the ExpressionAttributeNames parameter to replace the
        # names of the partition key and sort key with placeholder tokens. This option might be necessary if
        # an attribute name conflicts with a DynamoDB reserved word. For example, the following
        # KeyConditionExpression parameter causes an error because Size is a reserved word: Size = :myval To
        # work around this, define a placeholder (such a #S ) to represent the attribute name Size .
        # KeyConditionExpression then is as follows: #S = :myval For a list of reserved words, see Reserved
        # Words in the Amazon DynamoDB Developer Guide . For more information on ExpressionAttributeNames and
        # ExpressionAttributeValues , see Using Placeholders for Attribute Names and Values in the Amazon
        # DynamoDB Developer Guide .
        @[JSON::Field(key: "KeyConditionExpression")]
        getter key_condition_expression : String?

        # This is a legacy parameter. Use KeyConditionExpression instead. For more information, see
        # KeyConditions in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "KeyConditions")]
        getter key_conditions : Hash(String, Types::Condition)?

        # The maximum number of items to evaluate (not necessarily the number of matching items). If DynamoDB
        # processes the number of items up to the limit while processing the results, it stops the operation
        # and returns the matching values up to that point, and a key in LastEvaluatedKey to apply in a
        # subsequent operation, so that you can pick up where you left off. Also, if the processed dataset
        # size exceeds 1 MB before DynamoDB reaches this limit, it stops the operation and returns the
        # matching values up to the limit, and a key in LastEvaluatedKey to apply in a subsequent operation to
        # continue the operation. For more information, see Query and Scan in the Amazon DynamoDB Developer
        # Guide .
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A string that identifies one or more attributes to retrieve from the table. These attributes can
        # include scalars, sets, or elements of a JSON document. The attributes in the expression must be
        # separated by commas. If no attribute names are specified, then all attributes will be returned. If
        # any of the requested attributes are not found, they will not appear in the result. For more
        # information, see Accessing Item Attributes in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "ProjectionExpression")]
        getter projection_expression : String?

        # This is a legacy parameter. Use FilterExpression instead. For more information, see QueryFilter in
        # the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "QueryFilter")]
        getter query_filter : Hash(String, Types::Condition)?

        @[JSON::Field(key: "ReturnConsumedCapacity")]
        getter return_consumed_capacity : String?

        # Specifies the order for index traversal: If true (default), the traversal is performed in ascending
        # order; if false , the traversal is performed in descending order. Items with the same partition key
        # value are stored in sorted order by sort key. If the sort key data type is Number, the results are
        # stored in numeric order. For type String, the results are stored in order of UTF-8 bytes. For type
        # Binary, DynamoDB treats each byte of the binary data as unsigned. If ScanIndexForward is true ,
        # DynamoDB returns the results in the order in which they are stored (by sort key value). This is the
        # default behavior. If ScanIndexForward is false , DynamoDB reads the results in reverse order by sort
        # key value, and then returns the results to the client.
        @[JSON::Field(key: "ScanIndexForward")]
        getter scan_index_forward : Bool?

        # The attributes to be returned in the result. You can retrieve all item attributes, specific item
        # attributes, the count of matching items, or in the case of an index, some or all of the attributes
        # projected into the index. ALL_ATTRIBUTES - Returns all of the item attributes from the specified
        # table or index. If you query a local secondary index, then for each matching item in the index,
        # DynamoDB fetches the entire item from the parent table. If the index is configured to project all
        # item attributes, then all of the data can be obtained from the local secondary index, and no
        # fetching is required. ALL_PROJECTED_ATTRIBUTES - Allowed only when querying an index. Retrieves all
        # attributes that have been projected into the index. If the index is configured to project all
        # attributes, this return value is equivalent to specifying ALL_ATTRIBUTES . COUNT - Returns the
        # number of matching items, rather than the matching items themselves. Note that this uses the same
        # quantity of read capacity units as getting the items, and is subject to the same item size
        # calculations. SPECIFIC_ATTRIBUTES - Returns only the attributes listed in ProjectionExpression .
        # This return value is equivalent to specifying ProjectionExpression without specifying any value for
        # Select . If you query or scan a local secondary index and request only attributes that are projected
        # into that index, the operation will read only the index and not the table. If any of the requested
        # attributes are not projected into the local secondary index, DynamoDB fetches each of these
        # attributes from the parent table. This extra fetching incurs additional throughput cost and latency.
        # If you query or scan a global secondary index, you can only request attributes that are projected
        # into the index. Global secondary index queries cannot fetch attributes from the parent table. If
        # neither Select nor ProjectionExpression are specified, DynamoDB defaults to ALL_ATTRIBUTES when
        # accessing a table, and ALL_PROJECTED_ATTRIBUTES when accessing an index. You cannot use both Select
        # and ProjectionExpression together in a single request, unless the value for Select is
        # SPECIFIC_ATTRIBUTES . (This usage is equivalent to specifying ProjectionExpression without any value
        # for Select .) If you use the ProjectionExpression parameter, then the value for Select can only be
        # SPECIFIC_ATTRIBUTES . Any other value for Select will return an error.
        @[JSON::Field(key: "Select")]
        getter select : String?

        def initialize(
          @table_name : String,
          @attributes_to_get : Array(String)? = nil,
          @conditional_operator : String? = nil,
          @consistent_read : Bool? = nil,
          @exclusive_start_key : Hash(String, Types::AttributeValue)? = nil,
          @expression_attribute_names : Hash(String, String)? = nil,
          @expression_attribute_values : Hash(String, Types::AttributeValue)? = nil,
          @filter_expression : String? = nil,
          @index_name : String? = nil,
          @key_condition_expression : String? = nil,
          @key_conditions : Hash(String, Types::Condition)? = nil,
          @limit : Int32? = nil,
          @projection_expression : String? = nil,
          @query_filter : Hash(String, Types::Condition)? = nil,
          @return_consumed_capacity : String? = nil,
          @scan_index_forward : Bool? = nil,
          @select : String? = nil
        )
        end
      end

      # Represents the output of a Query operation.
      struct QueryOutput
        include JSON::Serializable

        # The capacity units consumed by the Query operation. The data returned includes the total provisioned
        # throughput consumed, along with statistics for the table and any indexes involved in the operation.
        # ConsumedCapacity is only returned if the ReturnConsumedCapacity parameter was specified. For more
        # information, see Capacity unit consumption for read operations in the Amazon DynamoDB Developer
        # Guide .
        @[JSON::Field(key: "ConsumedCapacity")]
        getter consumed_capacity : Types::ConsumedCapacity?

        # The number of items in the response. If you used a QueryFilter in the request, then Count is the
        # number of items returned after the filter was applied, and ScannedCount is the number of matching
        # items before the filter was applied. If you did not use a filter in the request, then Count and
        # ScannedCount are the same.
        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # An array of item attributes that match the query criteria. Each element in this array consists of an
        # attribute name and the value for that attribute.
        @[JSON::Field(key: "Items")]
        getter items : Array(Hash(String, Types::AttributeValue))?

        # The primary key of the item where the operation stopped, inclusive of the previous result set. Use
        # this value to start a new operation, excluding this value in the new request. If LastEvaluatedKey is
        # empty, then the "last page" of results has been processed and there is no more data to be retrieved.
        # If LastEvaluatedKey is not empty, it does not necessarily mean that there is more data in the result
        # set. The only way to know when you have reached the end of the result set is when LastEvaluatedKey
        # is empty.
        @[JSON::Field(key: "LastEvaluatedKey")]
        getter last_evaluated_key : Hash(String, Types::AttributeValue)?

        # The number of items evaluated, before any QueryFilter is applied. A high ScannedCount value with
        # few, or no, Count results indicates an inefficient Query operation. For more information, see Count
        # and ScannedCount in the Amazon DynamoDB Developer Guide . If you did not use a filter in the
        # request, then ScannedCount is the same as Count .
        @[JSON::Field(key: "ScannedCount")]
        getter scanned_count : Int32?

        def initialize(
          @consumed_capacity : Types::ConsumedCapacity? = nil,
          @count : Int32? = nil,
          @items : Array(Hash(String, Types::AttributeValue))? = nil,
          @last_evaluated_key : Hash(String, Types::AttributeValue)? = nil,
          @scanned_count : Int32? = nil
        )
        end
      end

      # Represents the properties of a replica.
      struct Replica
        include JSON::Serializable

        # The Region where the replica needs to be created.
        @[JSON::Field(key: "RegionName")]
        getter region_name : String?

        def initialize(
          @region_name : String? = nil
        )
        end
      end

      # The specified replica is already part of the global table.
      struct ReplicaAlreadyExistsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the auto scaling settings of the replica.
      struct ReplicaAutoScalingDescription
        include JSON::Serializable

        # Replica-specific global secondary index auto scaling settings.
        @[JSON::Field(key: "GlobalSecondaryIndexes")]
        getter global_secondary_indexes : Array(Types::ReplicaGlobalSecondaryIndexAutoScalingDescription)?

        # The Region where the replica exists.
        @[JSON::Field(key: "RegionName")]
        getter region_name : String?

        @[JSON::Field(key: "ReplicaProvisionedReadCapacityAutoScalingSettings")]
        getter replica_provisioned_read_capacity_auto_scaling_settings : Types::AutoScalingSettingsDescription?

        @[JSON::Field(key: "ReplicaProvisionedWriteCapacityAutoScalingSettings")]
        getter replica_provisioned_write_capacity_auto_scaling_settings : Types::AutoScalingSettingsDescription?

        # The current state of the replica: CREATING - The replica is being created. UPDATING - The replica is
        # being updated. DELETING - The replica is being deleted. ACTIVE - The replica is ready for use.
        @[JSON::Field(key: "ReplicaStatus")]
        getter replica_status : String?

        def initialize(
          @global_secondary_indexes : Array(Types::ReplicaGlobalSecondaryIndexAutoScalingDescription)? = nil,
          @region_name : String? = nil,
          @replica_provisioned_read_capacity_auto_scaling_settings : Types::AutoScalingSettingsDescription? = nil,
          @replica_provisioned_write_capacity_auto_scaling_settings : Types::AutoScalingSettingsDescription? = nil,
          @replica_status : String? = nil
        )
        end
      end

      # Represents the auto scaling settings of a replica that will be modified.
      struct ReplicaAutoScalingUpdate
        include JSON::Serializable

        # The Region where the replica exists.
        @[JSON::Field(key: "RegionName")]
        getter region_name : String

        # Represents the auto scaling settings of global secondary indexes that will be modified.
        @[JSON::Field(key: "ReplicaGlobalSecondaryIndexUpdates")]
        getter replica_global_secondary_index_updates : Array(Types::ReplicaGlobalSecondaryIndexAutoScalingUpdate)?

        @[JSON::Field(key: "ReplicaProvisionedReadCapacityAutoScalingUpdate")]
        getter replica_provisioned_read_capacity_auto_scaling_update : Types::AutoScalingSettingsUpdate?

        def initialize(
          @region_name : String,
          @replica_global_secondary_index_updates : Array(Types::ReplicaGlobalSecondaryIndexAutoScalingUpdate)? = nil,
          @replica_provisioned_read_capacity_auto_scaling_update : Types::AutoScalingSettingsUpdate? = nil
        )
        end
      end

      # Contains the details of the replica.
      struct ReplicaDescription
        include JSON::Serializable

        # Replica-specific global secondary index settings.
        @[JSON::Field(key: "GlobalSecondaryIndexes")]
        getter global_secondary_indexes : Array(Types::ReplicaGlobalSecondaryIndexDescription)?

        # The KMS key of the replica that will be used for KMS encryption.
        @[JSON::Field(key: "KMSMasterKeyId")]
        getter kms_master_key_id : String?

        # Overrides the maximum on-demand throughput settings for the specified replica table.
        @[JSON::Field(key: "OnDemandThroughputOverride")]
        getter on_demand_throughput_override : Types::OnDemandThroughputOverride?

        # Replica-specific provisioned throughput. If not described, uses the source table's provisioned
        # throughput settings.
        @[JSON::Field(key: "ProvisionedThroughputOverride")]
        getter provisioned_throughput_override : Types::ProvisionedThroughputOverride?

        # The name of the Region.
        @[JSON::Field(key: "RegionName")]
        getter region_name : String?

        # The time at which the replica was first detected as inaccessible. To determine cause of
        # inaccessibility check the ReplicaStatus property.
        @[JSON::Field(key: "ReplicaInaccessibleDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter replica_inaccessible_date_time : Time?

        # The current state of the replica: CREATING - The replica is being created. UPDATING - The replica is
        # being updated. DELETING - The replica is being deleted. ACTIVE - The replica is ready for use.
        # REGION_DISABLED - The replica is inaccessible because the Amazon Web Services Region has been
        # disabled. If the Amazon Web Services Region remains inaccessible for more than 20 hours, DynamoDB
        # will remove this replica from the replication group. The replica will not be deleted and replication
        # will stop from and to this region. INACCESSIBLE_ENCRYPTION_CREDENTIALS - The KMS key used to encrypt
        # the table is inaccessible. If the KMS key remains inaccessible for more than 20 hours, DynamoDB will
        # remove this replica from the replication group. The replica will not be deleted and replication will
        # stop from and to this region.
        @[JSON::Field(key: "ReplicaStatus")]
        getter replica_status : String?

        # Detailed information about the replica status.
        @[JSON::Field(key: "ReplicaStatusDescription")]
        getter replica_status_description : String?

        # Specifies the progress of a Create, Update, or Delete action on the replica as a percentage.
        @[JSON::Field(key: "ReplicaStatusPercentProgress")]
        getter replica_status_percent_progress : String?

        @[JSON::Field(key: "ReplicaTableClassSummary")]
        getter replica_table_class_summary : Types::TableClassSummary?

        # Represents the warm throughput value for this replica.
        @[JSON::Field(key: "WarmThroughput")]
        getter warm_throughput : Types::TableWarmThroughputDescription?

        def initialize(
          @global_secondary_indexes : Array(Types::ReplicaGlobalSecondaryIndexDescription)? = nil,
          @kms_master_key_id : String? = nil,
          @on_demand_throughput_override : Types::OnDemandThroughputOverride? = nil,
          @provisioned_throughput_override : Types::ProvisionedThroughputOverride? = nil,
          @region_name : String? = nil,
          @replica_inaccessible_date_time : Time? = nil,
          @replica_status : String? = nil,
          @replica_status_description : String? = nil,
          @replica_status_percent_progress : String? = nil,
          @replica_table_class_summary : Types::TableClassSummary? = nil,
          @warm_throughput : Types::TableWarmThroughputDescription? = nil
        )
        end
      end

      # Represents the properties of a replica global secondary index.
      struct ReplicaGlobalSecondaryIndex
        include JSON::Serializable

        # The name of the global secondary index.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # Overrides the maximum on-demand throughput settings for the specified global secondary index in the
        # specified replica table.
        @[JSON::Field(key: "OnDemandThroughputOverride")]
        getter on_demand_throughput_override : Types::OnDemandThroughputOverride?

        # Replica table GSI-specific provisioned throughput. If not specified, uses the source table GSI's
        # read capacity settings.
        @[JSON::Field(key: "ProvisionedThroughputOverride")]
        getter provisioned_throughput_override : Types::ProvisionedThroughputOverride?

        def initialize(
          @index_name : String,
          @on_demand_throughput_override : Types::OnDemandThroughputOverride? = nil,
          @provisioned_throughput_override : Types::ProvisionedThroughputOverride? = nil
        )
        end
      end

      # Represents the auto scaling configuration for a replica global secondary index.
      struct ReplicaGlobalSecondaryIndexAutoScalingDescription
        include JSON::Serializable

        # The name of the global secondary index.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        # The current state of the replica global secondary index: CREATING - The index is being created.
        # UPDATING - The table/index configuration is being updated. The table/index remains available for
        # data operations when UPDATING DELETING - The index is being deleted. ACTIVE - The index is ready for
        # use.
        @[JSON::Field(key: "IndexStatus")]
        getter index_status : String?

        @[JSON::Field(key: "ProvisionedReadCapacityAutoScalingSettings")]
        getter provisioned_read_capacity_auto_scaling_settings : Types::AutoScalingSettingsDescription?

        @[JSON::Field(key: "ProvisionedWriteCapacityAutoScalingSettings")]
        getter provisioned_write_capacity_auto_scaling_settings : Types::AutoScalingSettingsDescription?

        def initialize(
          @index_name : String? = nil,
          @index_status : String? = nil,
          @provisioned_read_capacity_auto_scaling_settings : Types::AutoScalingSettingsDescription? = nil,
          @provisioned_write_capacity_auto_scaling_settings : Types::AutoScalingSettingsDescription? = nil
        )
        end
      end

      # Represents the auto scaling settings of a global secondary index for a replica that will be
      # modified.
      struct ReplicaGlobalSecondaryIndexAutoScalingUpdate
        include JSON::Serializable

        # The name of the global secondary index.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        @[JSON::Field(key: "ProvisionedReadCapacityAutoScalingUpdate")]
        getter provisioned_read_capacity_auto_scaling_update : Types::AutoScalingSettingsUpdate?

        def initialize(
          @index_name : String? = nil,
          @provisioned_read_capacity_auto_scaling_update : Types::AutoScalingSettingsUpdate? = nil
        )
        end
      end

      # Represents the properties of a replica global secondary index.
      struct ReplicaGlobalSecondaryIndexDescription
        include JSON::Serializable

        # The name of the global secondary index.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        # Overrides the maximum on-demand throughput for the specified global secondary index in the specified
        # replica table.
        @[JSON::Field(key: "OnDemandThroughputOverride")]
        getter on_demand_throughput_override : Types::OnDemandThroughputOverride?

        # If not described, uses the source table GSI's read capacity settings.
        @[JSON::Field(key: "ProvisionedThroughputOverride")]
        getter provisioned_throughput_override : Types::ProvisionedThroughputOverride?

        # Represents the warm throughput of the global secondary index for this replica.
        @[JSON::Field(key: "WarmThroughput")]
        getter warm_throughput : Types::GlobalSecondaryIndexWarmThroughputDescription?

        def initialize(
          @index_name : String? = nil,
          @on_demand_throughput_override : Types::OnDemandThroughputOverride? = nil,
          @provisioned_throughput_override : Types::ProvisionedThroughputOverride? = nil,
          @warm_throughput : Types::GlobalSecondaryIndexWarmThroughputDescription? = nil
        )
        end
      end

      # Represents the properties of a global secondary index.
      struct ReplicaGlobalSecondaryIndexSettingsDescription
        include JSON::Serializable

        # The name of the global secondary index. The name must be unique among all other indexes on this
        # table.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # The current status of the global secondary index: CREATING - The global secondary index is being
        # created. UPDATING - The global secondary index is being updated. DELETING - The global secondary
        # index is being deleted. ACTIVE - The global secondary index is ready for use.
        @[JSON::Field(key: "IndexStatus")]
        getter index_status : String?

        # Auto scaling settings for a global secondary index replica's read capacity units.
        @[JSON::Field(key: "ProvisionedReadCapacityAutoScalingSettings")]
        getter provisioned_read_capacity_auto_scaling_settings : Types::AutoScalingSettingsDescription?

        # The maximum number of strongly consistent reads consumed per second before DynamoDB returns a
        # ThrottlingException .
        @[JSON::Field(key: "ProvisionedReadCapacityUnits")]
        getter provisioned_read_capacity_units : Int64?

        # Auto scaling settings for a global secondary index replica's write capacity units.
        @[JSON::Field(key: "ProvisionedWriteCapacityAutoScalingSettings")]
        getter provisioned_write_capacity_auto_scaling_settings : Types::AutoScalingSettingsDescription?

        # The maximum number of writes consumed per second before DynamoDB returns a ThrottlingException .
        @[JSON::Field(key: "ProvisionedWriteCapacityUnits")]
        getter provisioned_write_capacity_units : Int64?

        def initialize(
          @index_name : String,
          @index_status : String? = nil,
          @provisioned_read_capacity_auto_scaling_settings : Types::AutoScalingSettingsDescription? = nil,
          @provisioned_read_capacity_units : Int64? = nil,
          @provisioned_write_capacity_auto_scaling_settings : Types::AutoScalingSettingsDescription? = nil,
          @provisioned_write_capacity_units : Int64? = nil
        )
        end
      end

      # Represents the settings of a global secondary index for a global table that will be modified.
      struct ReplicaGlobalSecondaryIndexSettingsUpdate
        include JSON::Serializable

        # The name of the global secondary index. The name must be unique among all other indexes on this
        # table.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # Auto scaling settings for managing a global secondary index replica's read capacity units.
        @[JSON::Field(key: "ProvisionedReadCapacityAutoScalingSettingsUpdate")]
        getter provisioned_read_capacity_auto_scaling_settings_update : Types::AutoScalingSettingsUpdate?

        # The maximum number of strongly consistent reads consumed per second before DynamoDB returns a
        # ThrottlingException .
        @[JSON::Field(key: "ProvisionedReadCapacityUnits")]
        getter provisioned_read_capacity_units : Int64?

        def initialize(
          @index_name : String,
          @provisioned_read_capacity_auto_scaling_settings_update : Types::AutoScalingSettingsUpdate? = nil,
          @provisioned_read_capacity_units : Int64? = nil
        )
        end
      end

      # The specified replica is no longer part of the global table.
      struct ReplicaNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the properties of a replica.
      struct ReplicaSettingsDescription
        include JSON::Serializable

        # The Region name of the replica.
        @[JSON::Field(key: "RegionName")]
        getter region_name : String

        # The read/write capacity mode of the replica.
        @[JSON::Field(key: "ReplicaBillingModeSummary")]
        getter replica_billing_mode_summary : Types::BillingModeSummary?

        # Replica global secondary index settings for the global table.
        @[JSON::Field(key: "ReplicaGlobalSecondaryIndexSettings")]
        getter replica_global_secondary_index_settings : Array(Types::ReplicaGlobalSecondaryIndexSettingsDescription)?

        # Auto scaling settings for a global table replica's read capacity units.
        @[JSON::Field(key: "ReplicaProvisionedReadCapacityAutoScalingSettings")]
        getter replica_provisioned_read_capacity_auto_scaling_settings : Types::AutoScalingSettingsDescription?

        # The maximum number of strongly consistent reads consumed per second before DynamoDB returns a
        # ThrottlingException . For more information, see Specifying Read and Write Requirements in the Amazon
        # DynamoDB Developer Guide .
        @[JSON::Field(key: "ReplicaProvisionedReadCapacityUnits")]
        getter replica_provisioned_read_capacity_units : Int64?

        # Auto scaling settings for a global table replica's write capacity units.
        @[JSON::Field(key: "ReplicaProvisionedWriteCapacityAutoScalingSettings")]
        getter replica_provisioned_write_capacity_auto_scaling_settings : Types::AutoScalingSettingsDescription?

        # The maximum number of writes consumed per second before DynamoDB returns a ThrottlingException . For
        # more information, see Specifying Read and Write Requirements in the Amazon DynamoDB Developer Guide
        # .
        @[JSON::Field(key: "ReplicaProvisionedWriteCapacityUnits")]
        getter replica_provisioned_write_capacity_units : Int64?

        # The current state of the Region: CREATING - The Region is being created. UPDATING - The Region is
        # being updated. DELETING - The Region is being deleted. ACTIVE - The Region is ready for use.
        @[JSON::Field(key: "ReplicaStatus")]
        getter replica_status : String?

        @[JSON::Field(key: "ReplicaTableClassSummary")]
        getter replica_table_class_summary : Types::TableClassSummary?

        def initialize(
          @region_name : String,
          @replica_billing_mode_summary : Types::BillingModeSummary? = nil,
          @replica_global_secondary_index_settings : Array(Types::ReplicaGlobalSecondaryIndexSettingsDescription)? = nil,
          @replica_provisioned_read_capacity_auto_scaling_settings : Types::AutoScalingSettingsDescription? = nil,
          @replica_provisioned_read_capacity_units : Int64? = nil,
          @replica_provisioned_write_capacity_auto_scaling_settings : Types::AutoScalingSettingsDescription? = nil,
          @replica_provisioned_write_capacity_units : Int64? = nil,
          @replica_status : String? = nil,
          @replica_table_class_summary : Types::TableClassSummary? = nil
        )
        end
      end

      # Represents the settings for a global table in a Region that will be modified.
      struct ReplicaSettingsUpdate
        include JSON::Serializable

        # The Region of the replica to be added.
        @[JSON::Field(key: "RegionName")]
        getter region_name : String

        # Represents the settings of a global secondary index for a global table that will be modified.
        @[JSON::Field(key: "ReplicaGlobalSecondaryIndexSettingsUpdate")]
        getter replica_global_secondary_index_settings_update : Array(Types::ReplicaGlobalSecondaryIndexSettingsUpdate)?

        # Auto scaling settings for managing a global table replica's read capacity units.
        @[JSON::Field(key: "ReplicaProvisionedReadCapacityAutoScalingSettingsUpdate")]
        getter replica_provisioned_read_capacity_auto_scaling_settings_update : Types::AutoScalingSettingsUpdate?

        # The maximum number of strongly consistent reads consumed per second before DynamoDB returns a
        # ThrottlingException . For more information, see Specifying Read and Write Requirements in the Amazon
        # DynamoDB Developer Guide .
        @[JSON::Field(key: "ReplicaProvisionedReadCapacityUnits")]
        getter replica_provisioned_read_capacity_units : Int64?

        # Replica-specific table class. If not specified, uses the source table's table class.
        @[JSON::Field(key: "ReplicaTableClass")]
        getter replica_table_class : String?

        def initialize(
          @region_name : String,
          @replica_global_secondary_index_settings_update : Array(Types::ReplicaGlobalSecondaryIndexSettingsUpdate)? = nil,
          @replica_provisioned_read_capacity_auto_scaling_settings_update : Types::AutoScalingSettingsUpdate? = nil,
          @replica_provisioned_read_capacity_units : Int64? = nil,
          @replica_table_class : String? = nil
        )
        end
      end

      # Represents one of the following: A new replica to be added to an existing global table. New
      # parameters for an existing replica. An existing replica to be removed from an existing global table.
      struct ReplicaUpdate
        include JSON::Serializable

        # The parameters required for creating a replica on an existing global table.
        @[JSON::Field(key: "Create")]
        getter create : Types::CreateReplicaAction?

        # The name of the existing replica to be removed.
        @[JSON::Field(key: "Delete")]
        getter delete : Types::DeleteReplicaAction?

        def initialize(
          @create : Types::CreateReplicaAction? = nil,
          @delete : Types::DeleteReplicaAction? = nil
        )
        end
      end

      # The request was rejected because one or more items in the request are being modified by a request in
      # another Region.
      struct ReplicatedWriteConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents one of the following: A new replica to be added to an existing regional table or global
      # table. This request invokes the CreateTableReplica action in the destination Region. New parameters
      # for an existing replica. This request invokes the UpdateTable action in the destination Region. An
      # existing replica to be deleted. The request invokes the DeleteTableReplica action in the destination
      # Region, deleting the replica and all if its items in the destination Region. When you manually
      # remove a table or global table replica, you do not automatically remove any associated scalable
      # targets, scaling policies, or CloudWatch alarms.
      struct ReplicationGroupUpdate
        include JSON::Serializable

        # The parameters required for creating a replica for the table.
        @[JSON::Field(key: "Create")]
        getter create : Types::CreateReplicationGroupMemberAction?

        # The parameters required for deleting a replica for the table.
        @[JSON::Field(key: "Delete")]
        getter delete : Types::DeleteReplicationGroupMemberAction?

        # The parameters required for updating a replica for the table.
        @[JSON::Field(key: "Update")]
        getter update : Types::UpdateReplicationGroupMemberAction?

        def initialize(
          @create : Types::CreateReplicationGroupMemberAction? = nil,
          @delete : Types::DeleteReplicationGroupMemberAction? = nil,
          @update : Types::UpdateReplicationGroupMemberAction? = nil
        )
        end
      end

      # Throughput exceeds the current throughput quota for your account. For detailed information about why
      # the request was throttled and the ARN of the impacted resource, find the ThrottlingReason field in
      # the returned exception. Contact Amazon Web Services Support to request a quota increase.
      struct RequestLimitExceeded
        include JSON::Serializable

        # A list of ThrottlingReason that provide detailed diagnostic information about why the request was
        # throttled.
        @[JSON::Field(key: "ThrottlingReasons")]
        getter throttling_reasons : Array(Types::ThrottlingReason)?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @throttling_reasons : Array(Types::ThrottlingReason)? = nil,
          @message : String? = nil
        )
        end
      end

      # The operation conflicts with the resource's availability. For example: You attempted to recreate an
      # existing table. You tried to delete a table currently in the CREATING state. You tried to update a
      # resource that was already being updated. When appropriate, wait for the ongoing update to complete
      # and attempt the request again.
      struct ResourceInUseException
        include JSON::Serializable

        # The resource which is being attempted to be changed is in use.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The operation tried to access a nonexistent table or index. The resource might not be specified
      # correctly, or its status might not be ACTIVE .
      struct ResourceNotFoundException
        include JSON::Serializable

        # The resource which is being requested does not exist.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details for the restore.
      struct RestoreSummary
        include JSON::Serializable

        # Point in time or source backup time.
        @[JSON::Field(key: "RestoreDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter restore_date_time : Time

        # Indicates if a restore is in progress or not.
        @[JSON::Field(key: "RestoreInProgress")]
        getter restore_in_progress : Bool

        # The Amazon Resource Name (ARN) of the backup from which the table was restored.
        @[JSON::Field(key: "SourceBackupArn")]
        getter source_backup_arn : String?

        # The ARN of the source table of the backup that is being restored.
        @[JSON::Field(key: "SourceTableArn")]
        getter source_table_arn : String?

        def initialize(
          @restore_date_time : Time,
          @restore_in_progress : Bool,
          @source_backup_arn : String? = nil,
          @source_table_arn : String? = nil
        )
        end
      end

      struct RestoreTableFromBackupInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the backup.
        @[JSON::Field(key: "BackupArn")]
        getter backup_arn : String

        # The name of the new table to which the backup must be restored.
        @[JSON::Field(key: "TargetTableName")]
        getter target_table_name : String

        # The billing mode of the restored table.
        @[JSON::Field(key: "BillingModeOverride")]
        getter billing_mode_override : String?

        # List of global secondary indexes for the restored table. The indexes provided should match existing
        # secondary indexes. You can choose to exclude some or all of the indexes at the time of restore.
        @[JSON::Field(key: "GlobalSecondaryIndexOverride")]
        getter global_secondary_index_override : Array(Types::GlobalSecondaryIndex)?

        # List of local secondary indexes for the restored table. The indexes provided should match existing
        # secondary indexes. You can choose to exclude some or all of the indexes at the time of restore.
        @[JSON::Field(key: "LocalSecondaryIndexOverride")]
        getter local_secondary_index_override : Array(Types::LocalSecondaryIndex)?

        @[JSON::Field(key: "OnDemandThroughputOverride")]
        getter on_demand_throughput_override : Types::OnDemandThroughput?

        # Provisioned throughput settings for the restored table.
        @[JSON::Field(key: "ProvisionedThroughputOverride")]
        getter provisioned_throughput_override : Types::ProvisionedThroughput?

        # The new server-side encryption settings for the restored table.
        @[JSON::Field(key: "SSESpecificationOverride")]
        getter sse_specification_override : Types::SSESpecification?

        def initialize(
          @backup_arn : String,
          @target_table_name : String,
          @billing_mode_override : String? = nil,
          @global_secondary_index_override : Array(Types::GlobalSecondaryIndex)? = nil,
          @local_secondary_index_override : Array(Types::LocalSecondaryIndex)? = nil,
          @on_demand_throughput_override : Types::OnDemandThroughput? = nil,
          @provisioned_throughput_override : Types::ProvisionedThroughput? = nil,
          @sse_specification_override : Types::SSESpecification? = nil
        )
        end
      end

      struct RestoreTableFromBackupOutput
        include JSON::Serializable

        # The description of the table created from an existing backup.
        @[JSON::Field(key: "TableDescription")]
        getter table_description : Types::TableDescription?

        def initialize(
          @table_description : Types::TableDescription? = nil
        )
        end
      end

      struct RestoreTableToPointInTimeInput
        include JSON::Serializable

        # The name of the new table to which it must be restored to.
        @[JSON::Field(key: "TargetTableName")]
        getter target_table_name : String

        # The billing mode of the restored table.
        @[JSON::Field(key: "BillingModeOverride")]
        getter billing_mode_override : String?

        # List of global secondary indexes for the restored table. The indexes provided should match existing
        # secondary indexes. You can choose to exclude some or all of the indexes at the time of restore.
        @[JSON::Field(key: "GlobalSecondaryIndexOverride")]
        getter global_secondary_index_override : Array(Types::GlobalSecondaryIndex)?

        # List of local secondary indexes for the restored table. The indexes provided should match existing
        # secondary indexes. You can choose to exclude some or all of the indexes at the time of restore.
        @[JSON::Field(key: "LocalSecondaryIndexOverride")]
        getter local_secondary_index_override : Array(Types::LocalSecondaryIndex)?

        @[JSON::Field(key: "OnDemandThroughputOverride")]
        getter on_demand_throughput_override : Types::OnDemandThroughput?

        # Provisioned throughput settings for the restored table.
        @[JSON::Field(key: "ProvisionedThroughputOverride")]
        getter provisioned_throughput_override : Types::ProvisionedThroughput?

        # Time in the past to restore the table to.
        @[JSON::Field(key: "RestoreDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter restore_date_time : Time?

        # The new server-side encryption settings for the restored table.
        @[JSON::Field(key: "SSESpecificationOverride")]
        getter sse_specification_override : Types::SSESpecification?

        # The DynamoDB table that will be restored. This value is an Amazon Resource Name (ARN).
        @[JSON::Field(key: "SourceTableArn")]
        getter source_table_arn : String?

        # Name of the source table that is being restored.
        @[JSON::Field(key: "SourceTableName")]
        getter source_table_name : String?

        # Restore the table to the latest possible time. LatestRestorableDateTime is typically 5 minutes
        # before the current time.
        @[JSON::Field(key: "UseLatestRestorableTime")]
        getter use_latest_restorable_time : Bool?

        def initialize(
          @target_table_name : String,
          @billing_mode_override : String? = nil,
          @global_secondary_index_override : Array(Types::GlobalSecondaryIndex)? = nil,
          @local_secondary_index_override : Array(Types::LocalSecondaryIndex)? = nil,
          @on_demand_throughput_override : Types::OnDemandThroughput? = nil,
          @provisioned_throughput_override : Types::ProvisionedThroughput? = nil,
          @restore_date_time : Time? = nil,
          @sse_specification_override : Types::SSESpecification? = nil,
          @source_table_arn : String? = nil,
          @source_table_name : String? = nil,
          @use_latest_restorable_time : Bool? = nil
        )
        end
      end

      struct RestoreTableToPointInTimeOutput
        include JSON::Serializable

        # Represents the properties of a table.
        @[JSON::Field(key: "TableDescription")]
        getter table_description : Types::TableDescription?

        def initialize(
          @table_description : Types::TableDescription? = nil
        )
        end
      end

      # The S3 bucket that is being imported from.
      struct S3BucketSource
        include JSON::Serializable

        # The S3 bucket that is being imported from.
        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String

        # The account number of the S3 bucket that is being imported from. If the bucket is owned by the
        # requester this is optional.
        @[JSON::Field(key: "S3BucketOwner")]
        getter s3_bucket_owner : String?

        # The key prefix shared by all S3 Objects that are being imported.
        @[JSON::Field(key: "S3KeyPrefix")]
        getter s3_key_prefix : String?

        def initialize(
          @s3_bucket : String,
          @s3_bucket_owner : String? = nil,
          @s3_key_prefix : String? = nil
        )
        end
      end

      # The description of the server-side encryption status on the specified table.
      struct SSEDescription
        include JSON::Serializable

        # Indicates the time, in UNIX epoch date format, when DynamoDB detected that the table's KMS key was
        # inaccessible. This attribute will automatically be cleared when DynamoDB detects that the table's
        # KMS key is accessible again. DynamoDB will initiate the table archival process when table's KMS key
        # remains inaccessible for more than seven days from this date.
        @[JSON::Field(key: "InaccessibleEncryptionDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter inaccessible_encryption_date_time : Time?

        # The KMS key ARN used for the KMS encryption.
        @[JSON::Field(key: "KMSMasterKeyArn")]
        getter kms_master_key_arn : String?

        # Server-side encryption type. The only supported value is: KMS - Server-side encryption that uses Key
        # Management Service. The key is stored in your account and is managed by KMS (KMS charges apply).
        @[JSON::Field(key: "SSEType")]
        getter sse_type : String?

        # Represents the current state of server-side encryption. The only supported values are: ENABLED -
        # Server-side encryption is enabled. UPDATING - Server-side encryption is being updated.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @inaccessible_encryption_date_time : Time? = nil,
          @kms_master_key_arn : String? = nil,
          @sse_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Represents the settings used to enable server-side encryption.
      struct SSESpecification
        include JSON::Serializable

        # Indicates whether server-side encryption is done using an Amazon Web Services managed key or an
        # Amazon Web Services owned key. If enabled (true), server-side encryption type is set to KMS and an
        # Amazon Web Services managed key is used (KMS charges apply). If disabled (false) or not specified,
        # server-side encryption is set to Amazon Web Services owned key.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool?

        # The KMS key that should be used for the KMS encryption. To specify a key, use its key ID, Amazon
        # Resource Name (ARN), alias name, or alias ARN. Note that you should only provide this parameter if
        # the key is different from the default DynamoDB key alias/aws/dynamodb .
        @[JSON::Field(key: "KMSMasterKeyId")]
        getter kms_master_key_id : String?

        # Server-side encryption type. The only supported value is: KMS - Server-side encryption that uses Key
        # Management Service. The key is stored in your account and is managed by KMS (KMS charges apply).
        @[JSON::Field(key: "SSEType")]
        getter sse_type : String?

        def initialize(
          @enabled : Bool? = nil,
          @kms_master_key_id : String? = nil,
          @sse_type : String? = nil
        )
        end
      end

      # Represents the input of a Scan operation.
      struct ScanInput
        include JSON::Serializable

        # The name of the table containing the requested items or if you provide IndexName , the name of the
        # table to which that index belongs. You can also provide the Amazon Resource Name (ARN) of the table
        # in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # This is a legacy parameter. Use ProjectionExpression instead. For more information, see
        # AttributesToGet in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "AttributesToGet")]
        getter attributes_to_get : Array(String)?

        # This is a legacy parameter. Use FilterExpression instead. For more information, see
        # ConditionalOperator in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "ConditionalOperator")]
        getter conditional_operator : String?

        # A Boolean value that determines the read consistency model during the scan: If ConsistentRead is
        # false , then the data returned from Scan might not contain the results from other recently completed
        # write operations ( PutItem , UpdateItem , or DeleteItem ). If ConsistentRead is true , then all of
        # the write operations that completed before the Scan began are guaranteed to be contained in the Scan
        # response. The default setting for ConsistentRead is false . The ConsistentRead parameter is not
        # supported on global secondary indexes. If you scan a global secondary index with ConsistentRead set
        # to true, you will receive a ValidationException .
        @[JSON::Field(key: "ConsistentRead")]
        getter consistent_read : Bool?

        # The primary key of the first item that this operation will evaluate. Use the value that was returned
        # for LastEvaluatedKey in the previous operation. The data type for ExclusiveStartKey must be String,
        # Number or Binary. No set data types are allowed. In a parallel scan, a Scan request that includes
        # ExclusiveStartKey must specify the same segment whose previous Scan returned the corresponding value
        # of LastEvaluatedKey .
        @[JSON::Field(key: "ExclusiveStartKey")]
        getter exclusive_start_key : Hash(String, Types::AttributeValue)?

        # One or more substitution tokens for attribute names in an expression. The following are some use
        # cases for using ExpressionAttributeNames : To access an attribute whose name conflicts with a
        # DynamoDB reserved word. To create a placeholder for repeating occurrences of an attribute name in an
        # expression. To prevent special characters in an attribute name from being misinterpreted in an
        # expression. Use the # character in an expression to dereference an attribute name. For example,
        # consider the following attribute name: Percentile The name of this attribute conflicts with a
        # reserved word, so it cannot be used directly in an expression. (For the complete list of reserved
        # words, see Reserved Words in the Amazon DynamoDB Developer Guide ). To work around this, you could
        # specify the following for ExpressionAttributeNames : {"#P":"Percentile"} You could then use this
        # substitution in an expression, as in this example: #P = :val Tokens that begin with the : character
        # are expression attribute values , which are placeholders for the actual value at runtime. For more
        # information on expression attribute names, see Specifying Item Attributes in the Amazon DynamoDB
        # Developer Guide .
        @[JSON::Field(key: "ExpressionAttributeNames")]
        getter expression_attribute_names : Hash(String, String)?

        # One or more values that can be substituted in an expression. Use the : (colon) character in an
        # expression to dereference an attribute value. For example, suppose that you wanted to check whether
        # the value of the ProductStatus attribute was one of the following: Available | Backordered |
        # Discontinued You would first need to specify ExpressionAttributeValues as follows: {
        # ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"} } You could
        # then use these values in an expression, such as this: ProductStatus IN (:avail, :back, :disc) For
        # more information on expression attribute values, see Condition Expressions in the Amazon DynamoDB
        # Developer Guide .
        @[JSON::Field(key: "ExpressionAttributeValues")]
        getter expression_attribute_values : Hash(String, Types::AttributeValue)?

        # A string that contains conditions that DynamoDB applies after the Scan operation, but before the
        # data is returned to you. Items that do not satisfy the FilterExpression criteria are not returned. A
        # FilterExpression is applied after the items have already been read; the process of filtering does
        # not consume any additional read capacity units. For more information, see Filter Expressions in the
        # Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "FilterExpression")]
        getter filter_expression : String?

        # The name of a secondary index to scan. This index can be any local secondary index or global
        # secondary index. Note that if you use the IndexName parameter, you must also provide TableName .
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        # The maximum number of items to evaluate (not necessarily the number of matching items). If DynamoDB
        # processes the number of items up to the limit while processing the results, it stops the operation
        # and returns the matching values up to that point, and a key in LastEvaluatedKey to apply in a
        # subsequent operation, so that you can pick up where you left off. Also, if the processed dataset
        # size exceeds 1 MB before DynamoDB reaches this limit, it stops the operation and returns the
        # matching values up to the limit, and a key in LastEvaluatedKey to apply in a subsequent operation to
        # continue the operation. For more information, see Working with Queries in the Amazon DynamoDB
        # Developer Guide .
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A string that identifies one or more attributes to retrieve from the specified table or index. These
        # attributes can include scalars, sets, or elements of a JSON document. The attributes in the
        # expression must be separated by commas. If no attribute names are specified, then all attributes
        # will be returned. If any of the requested attributes are not found, they will not appear in the
        # result. For more information, see Specifying Item Attributes in the Amazon DynamoDB Developer Guide
        # .
        @[JSON::Field(key: "ProjectionExpression")]
        getter projection_expression : String?

        @[JSON::Field(key: "ReturnConsumedCapacity")]
        getter return_consumed_capacity : String?

        # This is a legacy parameter. Use FilterExpression instead. For more information, see ScanFilter in
        # the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "ScanFilter")]
        getter scan_filter : Hash(String, Types::Condition)?

        # For a parallel Scan request, Segment identifies an individual segment to be scanned by an
        # application worker. Segment IDs are zero-based, so the first segment is always 0. For example, if
        # you want to use four application threads to scan a table or an index, then the first thread
        # specifies a Segment value of 0, the second thread specifies 1, and so on. The value of
        # LastEvaluatedKey returned from a parallel Scan request must be used as ExclusiveStartKey with the
        # same segment ID in a subsequent Scan operation. The value for Segment must be greater than or equal
        # to 0, and less than the value provided for TotalSegments . If you provide Segment , you must also
        # provide TotalSegments .
        @[JSON::Field(key: "Segment")]
        getter segment : Int32?

        # The attributes to be returned in the result. You can retrieve all item attributes, specific item
        # attributes, the count of matching items, or in the case of an index, some or all of the attributes
        # projected into the index. ALL_ATTRIBUTES - Returns all of the item attributes from the specified
        # table or index. If you query a local secondary index, then for each matching item in the index,
        # DynamoDB fetches the entire item from the parent table. If the index is configured to project all
        # item attributes, then all of the data can be obtained from the local secondary index, and no
        # fetching is required. ALL_PROJECTED_ATTRIBUTES - Allowed only when querying an index. Retrieves all
        # attributes that have been projected into the index. If the index is configured to project all
        # attributes, this return value is equivalent to specifying ALL_ATTRIBUTES . COUNT - Returns the
        # number of matching items, rather than the matching items themselves. Note that this uses the same
        # quantity of read capacity units as getting the items, and is subject to the same item size
        # calculations. SPECIFIC_ATTRIBUTES - Returns only the attributes listed in ProjectionExpression .
        # This return value is equivalent to specifying ProjectionExpression without specifying any value for
        # Select . If you query or scan a local secondary index and request only attributes that are projected
        # into that index, the operation reads only the index and not the table. If any of the requested
        # attributes are not projected into the local secondary index, DynamoDB fetches each of these
        # attributes from the parent table. This extra fetching incurs additional throughput cost and latency.
        # If you query or scan a global secondary index, you can only request attributes that are projected
        # into the index. Global secondary index queries cannot fetch attributes from the parent table. If
        # neither Select nor ProjectionExpression are specified, DynamoDB defaults to ALL_ATTRIBUTES when
        # accessing a table, and ALL_PROJECTED_ATTRIBUTES when accessing an index. You cannot use both Select
        # and ProjectionExpression together in a single request, unless the value for Select is
        # SPECIFIC_ATTRIBUTES . (This usage is equivalent to specifying ProjectionExpression without any value
        # for Select .) If you use the ProjectionExpression parameter, then the value for Select can only be
        # SPECIFIC_ATTRIBUTES . Any other value for Select will return an error.
        @[JSON::Field(key: "Select")]
        getter select : String?

        # For a parallel Scan request, TotalSegments represents the total number of segments into which the
        # Scan operation will be divided. The value of TotalSegments corresponds to the number of application
        # workers that will perform the parallel scan. For example, if you want to use four application
        # threads to scan a table or an index, specify a TotalSegments value of 4. The value for TotalSegments
        # must be greater than or equal to 1, and less than or equal to 1000000. If you specify a
        # TotalSegments value of 1, the Scan operation will be sequential rather than parallel. If you specify
        # TotalSegments , you must also specify Segment .
        @[JSON::Field(key: "TotalSegments")]
        getter total_segments : Int32?

        def initialize(
          @table_name : String,
          @attributes_to_get : Array(String)? = nil,
          @conditional_operator : String? = nil,
          @consistent_read : Bool? = nil,
          @exclusive_start_key : Hash(String, Types::AttributeValue)? = nil,
          @expression_attribute_names : Hash(String, String)? = nil,
          @expression_attribute_values : Hash(String, Types::AttributeValue)? = nil,
          @filter_expression : String? = nil,
          @index_name : String? = nil,
          @limit : Int32? = nil,
          @projection_expression : String? = nil,
          @return_consumed_capacity : String? = nil,
          @scan_filter : Hash(String, Types::Condition)? = nil,
          @segment : Int32? = nil,
          @select : String? = nil,
          @total_segments : Int32? = nil
        )
        end
      end

      # Represents the output of a Scan operation.
      struct ScanOutput
        include JSON::Serializable

        # The capacity units consumed by the Scan operation. The data returned includes the total provisioned
        # throughput consumed, along with statistics for the table and any indexes involved in the operation.
        # ConsumedCapacity is only returned if the ReturnConsumedCapacity parameter was specified. For more
        # information, see Capacity unit consumption for read operations in the Amazon DynamoDB Developer
        # Guide .
        @[JSON::Field(key: "ConsumedCapacity")]
        getter consumed_capacity : Types::ConsumedCapacity?

        # The number of items in the response. If you set ScanFilter in the request, then Count is the number
        # of items returned after the filter was applied, and ScannedCount is the number of matching items
        # before the filter was applied. If you did not use a filter in the request, then Count is the same as
        # ScannedCount .
        @[JSON::Field(key: "Count")]
        getter count : Int32?

        # An array of item attributes that match the scan criteria. Each element in this array consists of an
        # attribute name and the value for that attribute.
        @[JSON::Field(key: "Items")]
        getter items : Array(Hash(String, Types::AttributeValue))?

        # The primary key of the item where the operation stopped, inclusive of the previous result set. Use
        # this value to start a new operation, excluding this value in the new request. If LastEvaluatedKey is
        # empty, then the "last page" of results has been processed and there is no more data to be retrieved.
        # If LastEvaluatedKey is not empty, it does not necessarily mean that there is more data in the result
        # set. The only way to know when you have reached the end of the result set is when LastEvaluatedKey
        # is empty.
        @[JSON::Field(key: "LastEvaluatedKey")]
        getter last_evaluated_key : Hash(String, Types::AttributeValue)?

        # The number of items evaluated, before any ScanFilter is applied. A high ScannedCount value with few,
        # or no, Count results indicates an inefficient Scan operation. For more information, see Count and
        # ScannedCount in the Amazon DynamoDB Developer Guide . If you did not use a filter in the request,
        # then ScannedCount is the same as Count .
        @[JSON::Field(key: "ScannedCount")]
        getter scanned_count : Int32?

        def initialize(
          @consumed_capacity : Types::ConsumedCapacity? = nil,
          @count : Int32? = nil,
          @items : Array(Hash(String, Types::AttributeValue))? = nil,
          @last_evaluated_key : Hash(String, Types::AttributeValue)? = nil,
          @scanned_count : Int32? = nil
        )
        end
      end

      # Contains the details of the table when the backup was created.
      struct SourceTableDetails
        include JSON::Serializable

        # Schema of the table.
        @[JSON::Field(key: "KeySchema")]
        getter key_schema : Array(Types::KeySchemaElement)

        # Read IOPs and Write IOPS on the table when the backup was created.
        @[JSON::Field(key: "ProvisionedThroughput")]
        getter provisioned_throughput : Types::ProvisionedThroughput

        # Time when the source table was created.
        @[JSON::Field(key: "TableCreationDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter table_creation_date_time : Time

        # Unique identifier for the table for which the backup was created.
        @[JSON::Field(key: "TableId")]
        getter table_id : String

        # The name of the table for which the backup was created.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # Controls how you are charged for read and write throughput and how you manage capacity. This setting
        # can be changed later. PROVISIONED - Sets the read/write capacity mode to PROVISIONED . We recommend
        # using PROVISIONED for predictable workloads. PAY_PER_REQUEST - Sets the read/write capacity mode to
        # PAY_PER_REQUEST . We recommend using PAY_PER_REQUEST for unpredictable workloads.
        @[JSON::Field(key: "BillingMode")]
        getter billing_mode : String?

        # Number of items in the table. Note that this is an approximate value.
        @[JSON::Field(key: "ItemCount")]
        getter item_count : Int64?

        @[JSON::Field(key: "OnDemandThroughput")]
        getter on_demand_throughput : Types::OnDemandThroughput?

        # ARN of the table for which backup was created.
        @[JSON::Field(key: "TableArn")]
        getter table_arn : String?

        # Size of the table in bytes. Note that this is an approximate value.
        @[JSON::Field(key: "TableSizeBytes")]
        getter table_size_bytes : Int64?

        def initialize(
          @key_schema : Array(Types::KeySchemaElement),
          @provisioned_throughput : Types::ProvisionedThroughput,
          @table_creation_date_time : Time,
          @table_id : String,
          @table_name : String,
          @billing_mode : String? = nil,
          @item_count : Int64? = nil,
          @on_demand_throughput : Types::OnDemandThroughput? = nil,
          @table_arn : String? = nil,
          @table_size_bytes : Int64? = nil
        )
        end
      end

      # Contains the details of the features enabled on the table when the backup was created. For example,
      # LSIs, GSIs, streams, TTL.
      struct SourceTableFeatureDetails
        include JSON::Serializable

        # Represents the GSI properties for the table when the backup was created. It includes the IndexName,
        # KeySchema, Projection, and ProvisionedThroughput for the GSIs on the table at the time of backup.
        @[JSON::Field(key: "GlobalSecondaryIndexes")]
        getter global_secondary_indexes : Array(Types::GlobalSecondaryIndexInfo)?

        # Represents the LSI properties for the table when the backup was created. It includes the IndexName,
        # KeySchema and Projection for the LSIs on the table at the time of backup.
        @[JSON::Field(key: "LocalSecondaryIndexes")]
        getter local_secondary_indexes : Array(Types::LocalSecondaryIndexInfo)?

        # The description of the server-side encryption status on the table when the backup was created.
        @[JSON::Field(key: "SSEDescription")]
        getter sse_description : Types::SSEDescription?

        # Stream settings on the table when the backup was created.
        @[JSON::Field(key: "StreamDescription")]
        getter stream_description : Types::StreamSpecification?

        # Time to Live settings on the table when the backup was created.
        @[JSON::Field(key: "TimeToLiveDescription")]
        getter time_to_live_description : Types::TimeToLiveDescription?

        def initialize(
          @global_secondary_indexes : Array(Types::GlobalSecondaryIndexInfo)? = nil,
          @local_secondary_indexes : Array(Types::LocalSecondaryIndexInfo)? = nil,
          @sse_description : Types::SSEDescription? = nil,
          @stream_description : Types::StreamSpecification? = nil,
          @time_to_live_description : Types::TimeToLiveDescription? = nil
        )
        end
      end

      # Represents the DynamoDB Streams configuration for a table in DynamoDB.
      struct StreamSpecification
        include JSON::Serializable

        # Indicates whether DynamoDB Streams is enabled (true) or disabled (false) on the table.
        @[JSON::Field(key: "StreamEnabled")]
        getter stream_enabled : Bool

        # When an item in the table is modified, StreamViewType determines what information is written to the
        # stream for this table. Valid values for StreamViewType are: KEYS_ONLY - Only the key attributes of
        # the modified item are written to the stream. NEW_IMAGE - The entire item, as it appears after it was
        # modified, is written to the stream. OLD_IMAGE - The entire item, as it appeared before it was
        # modified, is written to the stream. NEW_AND_OLD_IMAGES - Both the new and the old item images of the
        # item are written to the stream.
        @[JSON::Field(key: "StreamViewType")]
        getter stream_view_type : String?

        def initialize(
          @stream_enabled : Bool,
          @stream_view_type : String? = nil
        )
        end
      end

      # A target table with the specified name already exists.
      struct TableAlreadyExistsException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the auto scaling configuration for a global table.
      struct TableAutoScalingDescription
        include JSON::Serializable

        # Represents replicas of the global table.
        @[JSON::Field(key: "Replicas")]
        getter replicas : Array(Types::ReplicaAutoScalingDescription)?

        # The name of the table.
        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        # The current state of the table: CREATING - The table is being created. UPDATING - The table is being
        # updated. DELETING - The table is being deleted. ACTIVE - The table is ready for use.
        @[JSON::Field(key: "TableStatus")]
        getter table_status : String?

        def initialize(
          @replicas : Array(Types::ReplicaAutoScalingDescription)? = nil,
          @table_name : String? = nil,
          @table_status : String? = nil
        )
        end
      end

      # Contains details of the table class.
      struct TableClassSummary
        include JSON::Serializable

        # The date and time at which the table class was last updated.
        @[JSON::Field(key: "LastUpdateDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_update_date_time : Time?

        # The table class of the specified table. Valid values are STANDARD and STANDARD_INFREQUENT_ACCESS .
        @[JSON::Field(key: "TableClass")]
        getter table_class : String?

        def initialize(
          @last_update_date_time : Time? = nil,
          @table_class : String? = nil
        )
        end
      end

      # The parameters for the table created as part of the import operation.
      struct TableCreationParameters
        include JSON::Serializable

        # The attributes of the table created as part of the import operation.
        @[JSON::Field(key: "AttributeDefinitions")]
        getter attribute_definitions : Array(Types::AttributeDefinition)

        # The primary key and option sort key of the table created as part of the import operation.
        @[JSON::Field(key: "KeySchema")]
        getter key_schema : Array(Types::KeySchemaElement)

        # The name of the table created as part of the import operation.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # The billing mode for provisioning the table created as part of the import operation.
        @[JSON::Field(key: "BillingMode")]
        getter billing_mode : String?

        # The Global Secondary Indexes (GSI) of the table to be created as part of the import operation.
        @[JSON::Field(key: "GlobalSecondaryIndexes")]
        getter global_secondary_indexes : Array(Types::GlobalSecondaryIndex)?

        @[JSON::Field(key: "OnDemandThroughput")]
        getter on_demand_throughput : Types::OnDemandThroughput?

        @[JSON::Field(key: "ProvisionedThroughput")]
        getter provisioned_throughput : Types::ProvisionedThroughput?

        @[JSON::Field(key: "SSESpecification")]
        getter sse_specification : Types::SSESpecification?

        def initialize(
          @attribute_definitions : Array(Types::AttributeDefinition),
          @key_schema : Array(Types::KeySchemaElement),
          @table_name : String,
          @billing_mode : String? = nil,
          @global_secondary_indexes : Array(Types::GlobalSecondaryIndex)? = nil,
          @on_demand_throughput : Types::OnDemandThroughput? = nil,
          @provisioned_throughput : Types::ProvisionedThroughput? = nil,
          @sse_specification : Types::SSESpecification? = nil
        )
        end
      end

      # Represents the properties of a table.
      struct TableDescription
        include JSON::Serializable

        # Contains information about the table archive.
        @[JSON::Field(key: "ArchivalSummary")]
        getter archival_summary : Types::ArchivalSummary?

        # An array of AttributeDefinition objects. Each of these objects describes one attribute in the table
        # and index key schema. Each AttributeDefinition object in this array is composed of: AttributeName -
        # The name of the attribute. AttributeType - The data type for the attribute.
        @[JSON::Field(key: "AttributeDefinitions")]
        getter attribute_definitions : Array(Types::AttributeDefinition)?

        # Contains the details for the read/write capacity mode.
        @[JSON::Field(key: "BillingModeSummary")]
        getter billing_mode_summary : Types::BillingModeSummary?

        # The date and time when the table was created, in UNIX epoch time format.
        @[JSON::Field(key: "CreationDateTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date_time : Time?

        # Indicates whether deletion protection is enabled (true) or disabled (false) on the table.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool?

        # The global secondary indexes, if any, on the table. Each index is scoped to a given partition key
        # value. Each element is composed of: Backfilling - If true, then the index is currently in the
        # backfilling phase. Backfilling occurs only when a new global secondary index is added to the table.
        # It is the process by which DynamoDB populates the new index with data from the table. (This
        # attribute does not appear for indexes that were created during a CreateTable operation.) You can
        # delete an index that is being created during the Backfilling phase when IndexStatus is set to
        # CREATING and Backfilling is true. You can't delete the index that is being created when IndexStatus
        # is set to CREATING and Backfilling is false. (This attribute does not appear for indexes that were
        # created during a CreateTable operation.) IndexName - The name of the global secondary index.
        # IndexSizeBytes - The total size of the global secondary index, in bytes. DynamoDB updates this value
        # approximately every six hours. Recent changes might not be reflected in this value. IndexStatus -
        # The current status of the global secondary index: CREATING - The index is being created. UPDATING -
        # The index is being updated. DELETING - The index is being deleted. ACTIVE - The index is ready for
        # use. ItemCount - The number of items in the global secondary index. DynamoDB updates this value
        # approximately every six hours. Recent changes might not be reflected in this value. KeySchema -
        # Specifies the complete index key schema. The attribute names in the key schema must be between 1 and
        # 255 characters (inclusive). The key schema must begin with the same partition key as the table.
        # Projection - Specifies attributes that are copied (projected) from the table into the index. These
        # are in addition to the primary key attributes and index key attributes, which are automatically
        # projected. Each attribute specification is composed of: ProjectionType - One of the following:
        # KEYS_ONLY - Only the index and primary keys are projected into the index. INCLUDE - In addition to
        # the attributes described in KEYS_ONLY , the secondary index will include other non-key attributes
        # that you specify. ALL - All of the table attributes are projected into the index. NonKeyAttributes -
        # A list of one or more non-key attribute names that are projected into the secondary index. The total
        # count of attributes provided in NonKeyAttributes , summed across all of the secondary indexes, must
        # not exceed 100. If you project the same attribute into two different indexes, this counts as two
        # distinct attributes when determining the total. This limit only applies when you specify the
        # ProjectionType of INCLUDE . You still can specify the ProjectionType of ALL to project all
        # attributes from the source table, even if the table has more than 100 attributes.
        # ProvisionedThroughput - The provisioned throughput settings for the global secondary index,
        # consisting of read and write capacity units, along with data about increases and decreases. If the
        # table is in the DELETING state, no information about indexes will be returned.
        @[JSON::Field(key: "GlobalSecondaryIndexes")]
        getter global_secondary_indexes : Array(Types::GlobalSecondaryIndexDescription)?

        # Represents the version of global tables in use, if the table is replicated across Amazon Web
        # Services Regions.
        @[JSON::Field(key: "GlobalTableVersion")]
        getter global_table_version : String?

        # The witness Region and its current status in the MRSC global table. Only one witness Region can be
        # configured per MRSC global table.
        @[JSON::Field(key: "GlobalTableWitnesses")]
        getter global_table_witnesses : Array(Types::GlobalTableWitnessDescription)?

        # The number of items in the specified table. DynamoDB updates this value approximately every six
        # hours. Recent changes might not be reflected in this value.
        @[JSON::Field(key: "ItemCount")]
        getter item_count : Int64?

        # The primary key structure for the table. Each KeySchemaElement consists of: AttributeName - The name
        # of the attribute. KeyType - The role of the attribute: HASH - partition key RANGE - sort key The
        # partition key of an item is also known as its hash attribute . The term "hash attribute" derives
        # from DynamoDB's usage of an internal hash function to evenly distribute data items across
        # partitions, based on their partition key values. The sort key of an item is also known as its range
        # attribute . The term "range attribute" derives from the way DynamoDB stores items with the same
        # partition key physically close together, in sorted order by the sort key value. For more information
        # about primary keys, see Primary Key in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "KeySchema")]
        getter key_schema : Array(Types::KeySchemaElement)?

        # The Amazon Resource Name (ARN) that uniquely identifies the latest stream for this table.
        @[JSON::Field(key: "LatestStreamArn")]
        getter latest_stream_arn : String?

        # A timestamp, in ISO 8601 format, for this stream. Note that LatestStreamLabel is not a unique
        # identifier for the stream, because it is possible that a stream from another table might have the
        # same timestamp. However, the combination of the following three elements is guaranteed to be unique:
        # Amazon Web Services customer ID Table name StreamLabel
        @[JSON::Field(key: "LatestStreamLabel")]
        getter latest_stream_label : String?

        # Represents one or more local secondary indexes on the table. Each index is scoped to a given
        # partition key value. Tables with one or more local secondary indexes are subject to an item
        # collection size limit, where the amount of data within a given item collection cannot exceed 10 GB.
        # Each element is composed of: IndexName - The name of the local secondary index. KeySchema -
        # Specifies the complete index key schema. The attribute names in the key schema must be between 1 and
        # 255 characters (inclusive). The key schema must begin with the same partition key as the table.
        # Projection - Specifies attributes that are copied (projected) from the table into the index. These
        # are in addition to the primary key attributes and index key attributes, which are automatically
        # projected. Each attribute specification is composed of: ProjectionType - One of the following:
        # KEYS_ONLY - Only the index and primary keys are projected into the index. INCLUDE - Only the
        # specified table attributes are projected into the index. The list of projected attributes is in
        # NonKeyAttributes . ALL - All of the table attributes are projected into the index. NonKeyAttributes
        # - A list of one or more non-key attribute names that are projected into the secondary index. The
        # total count of attributes provided in NonKeyAttributes , summed across all of the secondary indexes,
        # must not exceed 100. If you project the same attribute into two different indexes, this counts as
        # two distinct attributes when determining the total. This limit only applies when you specify the
        # ProjectionType of INCLUDE . You still can specify the ProjectionType of ALL to project all
        # attributes from the source table, even if the table has more than 100 attributes. IndexSizeBytes -
        # Represents the total size of the index, in bytes. DynamoDB updates this value approximately every
        # six hours. Recent changes might not be reflected in this value. ItemCount - Represents the number of
        # items in the index. DynamoDB updates this value approximately every six hours. Recent changes might
        # not be reflected in this value. If the table is in the DELETING state, no information about indexes
        # will be returned.
        @[JSON::Field(key: "LocalSecondaryIndexes")]
        getter local_secondary_indexes : Array(Types::LocalSecondaryIndexDescription)?

        # Indicates one of the following consistency modes for a global table: EVENTUAL : Indicates that the
        # global table is configured for multi-Region eventual consistency (MREC). STRONG : Indicates that the
        # global table is configured for multi-Region strong consistency (MRSC). If you don't specify this
        # field, the global table consistency mode defaults to EVENTUAL . For more information about global
        # tables consistency modes, see Consistency modes in DynamoDB developer guide.
        @[JSON::Field(key: "MultiRegionConsistency")]
        getter multi_region_consistency : String?

        # The maximum number of read and write units for the specified on-demand table. If you use this
        # parameter, you must specify MaxReadRequestUnits , MaxWriteRequestUnits , or both.
        @[JSON::Field(key: "OnDemandThroughput")]
        getter on_demand_throughput : Types::OnDemandThroughput?

        # The provisioned throughput settings for the table, consisting of read and write capacity units,
        # along with data about increases and decreases.
        @[JSON::Field(key: "ProvisionedThroughput")]
        getter provisioned_throughput : Types::ProvisionedThroughputDescription?

        # Represents replicas of the table.
        @[JSON::Field(key: "Replicas")]
        getter replicas : Array(Types::ReplicaDescription)?

        # Contains details for the restore.
        @[JSON::Field(key: "RestoreSummary")]
        getter restore_summary : Types::RestoreSummary?

        # The description of the server-side encryption status on the specified table.
        @[JSON::Field(key: "SSEDescription")]
        getter sse_description : Types::SSEDescription?

        # The current DynamoDB Streams configuration for the table.
        @[JSON::Field(key: "StreamSpecification")]
        getter stream_specification : Types::StreamSpecification?

        # The Amazon Resource Name (ARN) that uniquely identifies the table.
        @[JSON::Field(key: "TableArn")]
        getter table_arn : String?

        # Contains details of the table class.
        @[JSON::Field(key: "TableClassSummary")]
        getter table_class_summary : Types::TableClassSummary?

        # Unique identifier for the table for which the backup was created.
        @[JSON::Field(key: "TableId")]
        getter table_id : String?

        # The name of the table.
        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        # The total size of the specified table, in bytes. DynamoDB updates this value approximately every six
        # hours. Recent changes might not be reflected in this value.
        @[JSON::Field(key: "TableSizeBytes")]
        getter table_size_bytes : Int64?

        # The current state of the table: CREATING - The table is being created. UPDATING - The table/index
        # configuration is being updated. The table/index remains available for data operations when UPDATING
        # . DELETING - The table is being deleted. ACTIVE - The table is ready for use.
        # INACCESSIBLE_ENCRYPTION_CREDENTIALS - The KMS key used to encrypt the table in inaccessible. Table
        # operations may fail due to failure to use the KMS key. DynamoDB will initiate the table archival
        # process when a table's KMS key remains inaccessible for more than seven days. ARCHIVING - The table
        # is being archived. Operations are not allowed until archival is complete. ARCHIVED - The table has
        # been archived. See the ArchivalReason for more information.
        @[JSON::Field(key: "TableStatus")]
        getter table_status : String?

        # Describes the warm throughput value of the base table.
        @[JSON::Field(key: "WarmThroughput")]
        getter warm_throughput : Types::TableWarmThroughputDescription?

        def initialize(
          @archival_summary : Types::ArchivalSummary? = nil,
          @attribute_definitions : Array(Types::AttributeDefinition)? = nil,
          @billing_mode_summary : Types::BillingModeSummary? = nil,
          @creation_date_time : Time? = nil,
          @deletion_protection_enabled : Bool? = nil,
          @global_secondary_indexes : Array(Types::GlobalSecondaryIndexDescription)? = nil,
          @global_table_version : String? = nil,
          @global_table_witnesses : Array(Types::GlobalTableWitnessDescription)? = nil,
          @item_count : Int64? = nil,
          @key_schema : Array(Types::KeySchemaElement)? = nil,
          @latest_stream_arn : String? = nil,
          @latest_stream_label : String? = nil,
          @local_secondary_indexes : Array(Types::LocalSecondaryIndexDescription)? = nil,
          @multi_region_consistency : String? = nil,
          @on_demand_throughput : Types::OnDemandThroughput? = nil,
          @provisioned_throughput : Types::ProvisionedThroughputDescription? = nil,
          @replicas : Array(Types::ReplicaDescription)? = nil,
          @restore_summary : Types::RestoreSummary? = nil,
          @sse_description : Types::SSEDescription? = nil,
          @stream_specification : Types::StreamSpecification? = nil,
          @table_arn : String? = nil,
          @table_class_summary : Types::TableClassSummary? = nil,
          @table_id : String? = nil,
          @table_name : String? = nil,
          @table_size_bytes : Int64? = nil,
          @table_status : String? = nil,
          @warm_throughput : Types::TableWarmThroughputDescription? = nil
        )
        end
      end

      # A target table with the specified name is either being created or deleted.
      struct TableInUseException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A source table with the name TableName does not currently exist within the subscriber's account or
      # the subscriber is operating in the wrong Amazon Web Services Region.
      struct TableNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the warm throughput value (in read units per second and write units per second) of the
      # table. Warm throughput is applicable for DynamoDB Standard-IA tables and specifies the minimum
      # provisioned capacity maintained for immediate data access.
      struct TableWarmThroughputDescription
        include JSON::Serializable

        # Represents the base table's warm throughput value in read units per second.
        @[JSON::Field(key: "ReadUnitsPerSecond")]
        getter read_units_per_second : Int64?

        # Represents warm throughput value of the base table.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Represents the base table's warm throughput value in write units per second.
        @[JSON::Field(key: "WriteUnitsPerSecond")]
        getter write_units_per_second : Int64?

        def initialize(
          @read_units_per_second : Int64? = nil,
          @status : String? = nil,
          @write_units_per_second : Int64? = nil
        )
        end
      end

      # Describes a tag. A tag is a key-value pair. You can add up to 50 tags to a single DynamoDB table.
      # Amazon Web Services-assigned tag names and values are automatically assigned the aws: prefix, which
      # the user cannot assign. Amazon Web Services-assigned tag names do not count towards the tag limit of
      # 50. User-assigned tag names have the prefix user: in the Cost Allocation Report. You cannot backdate
      # the application of a tag. For an overview on tagging DynamoDB resources, see Tagging for DynamoDB in
      # the Amazon DynamoDB Developer Guide .
      struct Tag
        include JSON::Serializable

        # The key of the tag. Tag keys are case sensitive. Each DynamoDB table can only have up to one tag
        # with the same key. If you try to add an existing tag (same key), the existing tag value will be
        # updated to the new value.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value of the tag. Tag values are case-sensitive and can be null.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceInput
        include JSON::Serializable

        # Identifies the Amazon DynamoDB resource to which tags should be added. This value is an Amazon
        # Resource Name (ARN).
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags to be assigned to the Amazon DynamoDB resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      # The request was denied due to request throttling. For detailed information about why the request was
      # throttled and the ARN of the impacted resource, find the ThrottlingReason field in the returned
      # exception.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # A list of ThrottlingReason that provide detailed diagnostic information about why the request was
        # throttled.
        @[JSON::Field(key: "throttlingReasons")]
        getter throttling_reasons : Array(Types::ThrottlingReason)?

        def initialize(
          @message : String? = nil,
          @throttling_reasons : Array(Types::ThrottlingReason)? = nil
        )
        end
      end

      # Represents the specific reason why a DynamoDB request was throttled and the ARN of the impacted
      # resource. This helps identify exactly what resource is being throttled, what type of operation
      # caused it, and why the throttling occurred.
      struct ThrottlingReason
        include JSON::Serializable

        # The reason for throttling. The throttling reason follows a specific format:
        # ResourceType+OperationType+LimitType : Resource Type (What is being throttled): Table or Index
        # Operation Type (What kind of operation): Read or Write Limit Type (Why the throttling occurred):
        # ProvisionedThroughputExceeded : The request rate is exceeding the provisioned throughput capacity
        # (read or write capacity units) configured for a table or a global secondary index (GSI) in
        # provisioned capacity mode. AccountLimitExceeded : The request rate has caused a table or global
        # secondary index (GSI) in on-demand mode to exceed the per-table account-level service quotas for
        # read/write throughput in the current Amazon Web Services Region. KeyRangeThroughputExceeded : The
        # request rate directed at a specific partition key value has exceeded the internal partition-level
        # throughput limits , indicating uneven access patterns across the table's or GSI's key space.
        # MaxOnDemandThroughputExceeded : The request rate has exceeded the configured maximum throughput
        # limits set for a table or index in on-demand capacity mode. Examples of complete throttling reasons:
        # TableReadProvisionedThroughputExceeded IndexWriteAccountLimitExceeded This helps identify exactly
        # what resource is being throttled, what type of operation caused it, and why the throttling occurred.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The Amazon Resource Name (ARN) of the DynamoDB table or index that experienced the throttling event.
        @[JSON::Field(key: "resource")]
        getter resource : String?

        def initialize(
          @reason : String? = nil,
          @resource : String? = nil
        )
        end
      end

      # The description of the Time to Live (TTL) status on the specified table.
      struct TimeToLiveDescription
        include JSON::Serializable

        # The name of the TTL attribute for items in the table.
        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String?

        # The TTL status for the table.
        @[JSON::Field(key: "TimeToLiveStatus")]
        getter time_to_live_status : String?

        def initialize(
          @attribute_name : String? = nil,
          @time_to_live_status : String? = nil
        )
        end
      end

      # Represents the settings used to enable or disable Time to Live (TTL) for the specified table.
      struct TimeToLiveSpecification
        include JSON::Serializable

        # The name of the TTL attribute used to store the expiration time for items in the table.
        @[JSON::Field(key: "AttributeName")]
        getter attribute_name : String

        # Indicates whether TTL is to be enabled (true) or disabled (false) on the table.
        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        def initialize(
          @attribute_name : String,
          @enabled : Bool
        )
        end
      end

      # Specifies an item to be retrieved as part of the transaction.
      struct TransactGetItem
        include JSON::Serializable

        # Contains the primary key that identifies the item to get, together with the name of the table that
        # contains the item, and optionally the specific attributes of the item to retrieve.
        @[JSON::Field(key: "Get")]
        getter get : Types::Get

        def initialize(
          @get : Types::Get
        )
        end
      end

      struct TransactGetItemsInput
        include JSON::Serializable

        # An ordered array of up to 100 TransactGetItem objects, each of which contains a Get structure.
        @[JSON::Field(key: "TransactItems")]
        getter transact_items : Array(Types::TransactGetItem)

        # A value of TOTAL causes consumed capacity information to be returned, and a value of NONE prevents
        # that information from being returned. No other value is valid.
        @[JSON::Field(key: "ReturnConsumedCapacity")]
        getter return_consumed_capacity : String?

        def initialize(
          @transact_items : Array(Types::TransactGetItem),
          @return_consumed_capacity : String? = nil
        )
        end
      end

      struct TransactGetItemsOutput
        include JSON::Serializable

        # If the ReturnConsumedCapacity value was TOTAL , this is an array of ConsumedCapacity objects, one
        # for each table addressed by TransactGetItem objects in the TransactItems parameter. These
        # ConsumedCapacity objects report the read-capacity units consumed by the TransactGetItems call in
        # that table.
        @[JSON::Field(key: "ConsumedCapacity")]
        getter consumed_capacity : Array(Types::ConsumedCapacity)?

        # An ordered array of up to 100 ItemResponse objects, each of which corresponds to the TransactGetItem
        # object in the same position in the TransactItems array. Each ItemResponse object contains a Map of
        # the name-value pairs that are the projected attributes of the requested item. If a requested item
        # could not be retrieved, the corresponding ItemResponse object is Null, or if the requested item has
        # no projected attributes, the corresponding ItemResponse object is an empty Map.
        @[JSON::Field(key: "Responses")]
        getter responses : Array(Types::ItemResponse)?

        def initialize(
          @consumed_capacity : Array(Types::ConsumedCapacity)? = nil,
          @responses : Array(Types::ItemResponse)? = nil
        )
        end
      end

      # A list of requests that can perform update, put, delete, or check operations on multiple items in
      # one or more tables atomically.
      struct TransactWriteItem
        include JSON::Serializable

        # A request to perform a check item operation.
        @[JSON::Field(key: "ConditionCheck")]
        getter condition_check : Types::ConditionCheck?

        # A request to perform a DeleteItem operation.
        @[JSON::Field(key: "Delete")]
        getter delete : Types::Delete?

        # A request to perform a PutItem operation.
        @[JSON::Field(key: "Put")]
        getter put : Types::Put?

        # A request to perform an UpdateItem operation.
        @[JSON::Field(key: "Update")]
        getter update : Types::Update?

        def initialize(
          @condition_check : Types::ConditionCheck? = nil,
          @delete : Types::Delete? = nil,
          @put : Types::Put? = nil,
          @update : Types::Update? = nil
        )
        end
      end

      struct TransactWriteItemsInput
        include JSON::Serializable

        # An ordered array of up to 100 TransactWriteItem objects, each of which contains a ConditionCheck ,
        # Put , Update , or Delete object. These can operate on items in different tables, but the tables must
        # reside in the same Amazon Web Services account and Region, and no two of them can operate on the
        # same item.
        @[JSON::Field(key: "TransactItems")]
        getter transact_items : Array(Types::TransactWriteItem)

        # Providing a ClientRequestToken makes the call to TransactWriteItems idempotent, meaning that
        # multiple identical calls have the same effect as one single call. Although multiple identical calls
        # using the same client request token produce the same result on the server (no side effects), the
        # responses to the calls might not be the same. If the ReturnConsumedCapacity parameter is set, then
        # the initial TransactWriteItems call returns the amount of write capacity units consumed in making
        # the changes. Subsequent TransactWriteItems calls with the same client token return the number of
        # read capacity units consumed in reading the item. A client request token is valid for 10 minutes
        # after the first request that uses it is completed. After 10 minutes, any request with the same
        # client token is treated as a new request. Do not resubmit the same request with the same client
        # token for more than 10 minutes, or the result might not be idempotent. If you submit a request with
        # the same client token but a change in other parameters within the 10-minute idempotency window,
        # DynamoDB returns an IdempotentParameterMismatch exception.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String?

        @[JSON::Field(key: "ReturnConsumedCapacity")]
        getter return_consumed_capacity : String?

        # Determines whether item collection metrics are returned. If set to SIZE , the response includes
        # statistics about item collections (if any), that were modified during the operation and are returned
        # in the response. If set to NONE (the default), no statistics are returned.
        @[JSON::Field(key: "ReturnItemCollectionMetrics")]
        getter return_item_collection_metrics : String?

        def initialize(
          @transact_items : Array(Types::TransactWriteItem),
          @client_request_token : String? = nil,
          @return_consumed_capacity : String? = nil,
          @return_item_collection_metrics : String? = nil
        )
        end
      end

      struct TransactWriteItemsOutput
        include JSON::Serializable

        # The capacity units consumed by the entire TransactWriteItems operation. The values of the list are
        # ordered according to the ordering of the TransactItems request parameter.
        @[JSON::Field(key: "ConsumedCapacity")]
        getter consumed_capacity : Array(Types::ConsumedCapacity)?

        # A list of tables that were processed by TransactWriteItems and, for each table, information about
        # any item collections that were affected by individual UpdateItem , PutItem , or DeleteItem
        # operations.
        @[JSON::Field(key: "ItemCollectionMetrics")]
        getter item_collection_metrics : Hash(String, Array(Types::ItemCollectionMetrics))?

        def initialize(
          @consumed_capacity : Array(Types::ConsumedCapacity)? = nil,
          @item_collection_metrics : Hash(String, Array(Types::ItemCollectionMetrics))? = nil
        )
        end
      end

      # The entire transaction request was canceled. DynamoDB cancels a TransactWriteItems request under the
      # following circumstances: A condition in one of the condition expressions is not met. A table in the
      # TransactWriteItems request is in a different account or region. More than one action in the
      # TransactWriteItems operation targets the same item. There is insufficient provisioned capacity for
      # the transaction to be completed. An item size becomes too large (larger than 400 KB), or a local
      # secondary index (LSI) becomes too large, or a similar validation error occurs because of changes
      # made by the transaction. There is a user error, such as an invalid data format. There is an ongoing
      # TransactWriteItems operation that conflicts with a concurrent TransactWriteItems request. In this
      # case the TransactWriteItems operation fails with a TransactionCanceledException . DynamoDB cancels a
      # TransactGetItems request under the following circumstances: There is an ongoing TransactGetItems
      # operation that conflicts with a concurrent PutItem , UpdateItem , DeleteItem or TransactWriteItems
      # request. In this case the TransactGetItems operation fails with a TransactionCanceledException . A
      # table in the TransactGetItems request is in a different account or region. There is insufficient
      # provisioned capacity for the transaction to be completed. There is a user error, such as an invalid
      # data format. If using Java, DynamoDB lists the cancellation reasons on the CancellationReasons
      # property. This property is not set for other languages. Transaction cancellation reasons are ordered
      # in the order of requested items, if an item has no error it will have None code and Null message.
      # Cancellation reason codes and possible error messages: No Errors: Code: None Message: null
      # Conditional Check Failed: Code: ConditionalCheckFailed Message: The conditional request failed. Item
      # Collection Size Limit Exceeded: Code: ItemCollectionSizeLimitExceeded Message: Collection size
      # exceeded. Transaction Conflict: Code: TransactionConflict Message: Transaction is ongoing for the
      # item. Provisioned Throughput Exceeded: Code: ProvisionedThroughputExceeded Messages: The level of
      # configured provisioned throughput for the table was exceeded. Consider increasing your provisioning
      # level with the UpdateTable API. This Message is received when provisioned throughput is exceeded is
      # on a provisioned DynamoDB table. The level of configured provisioned throughput for one or more
      # global secondary indexes of the table was exceeded. Consider increasing your provisioning level for
      # the under-provisioned global secondary indexes with the UpdateTable API. This message is returned
      # when provisioned throughput is exceeded is on a provisioned GSI. Throttling Error: Code:
      # ThrottlingError Messages: Throughput exceeds the current capacity of your table or index. DynamoDB
      # is automatically scaling your table or index so please try again shortly. If exceptions persist,
      # check if you have a hot key:
      # https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/bp-partition-key-design.html. This
      # message is returned when writes get throttled on an On-Demand table as DynamoDB is automatically
      # scaling the table. Throughput exceeds the current capacity for one or more global secondary indexes.
      # DynamoDB is automatically scaling your index so please try again shortly. This message is returned
      # when writes get throttled on an On-Demand GSI as DynamoDB is automatically scaling the GSI.
      # Validation Error: Code: ValidationError Messages: One or more parameter values were invalid. The
      # update expression attempted to update the secondary index key beyond allowed size limits. The update
      # expression attempted to update the secondary index key to unsupported type. An operand in the update
      # expression has an incorrect data type. Item size to update has exceeded the maximum allowed size.
      # Number overflow. Attempting to store a number with magnitude larger than supported range. Type
      # mismatch for attribute to update. Nesting Levels have exceeded supported limits. The document path
      # provided in the update expression is invalid for update. The provided expression refers to an
      # attribute that does not exist in the item.
      struct TransactionCanceledException
        include JSON::Serializable

        # A list of cancellation reasons.
        @[JSON::Field(key: "CancellationReasons")]
        getter cancellation_reasons : Array(Types::CancellationReason)?

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @cancellation_reasons : Array(Types::CancellationReason)? = nil,
          @message : String? = nil
        )
        end
      end

      # Operation was rejected because there is an ongoing transaction for the item.
      struct TransactionConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The transaction with the given request token is already in progress. Recommended Settings This is a
      # general recommendation for handling the TransactionInProgressException . These settings help ensure
      # that the client retries will trigger completion of the ongoing TransactWriteItems request. Set
      # clientExecutionTimeout to a value that allows at least one retry to be processed after 5 seconds
      # have elapsed since the first attempt for the TransactWriteItems operation. Set socketTimeout to a
      # value a little lower than the requestTimeout setting. requestTimeout should be set based on the time
      # taken for the individual retries of a single HTTP request for your use case, but setting it to 1
      # second or higher should work well to reduce chances of retries and TransactionInProgressException
      # errors. Use exponential backoff when retrying and tune backoff if needed. Assuming default retry
      # policy , example timeout settings based on the guidelines above are as follows: Example timeline:
      # 0-1000 first attempt 1000-1500 first sleep/delay (default retry policy uses 500 ms as base delay for
      # 4xx errors) 1500-2500 second attempt 2500-3500 second sleep/delay (500 * 2, exponential backoff)
      # 3500-4500 third attempt 4500-6500 third sleep/delay (500 * 2^2) 6500-7500 fourth attempt (this can
      # trigger inline recovery since 5 seconds have elapsed since the first attempt reached TC)
      struct TransactionInProgressException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UntagResourceInput
        include JSON::Serializable

        # The DynamoDB resource that the tags will be removed from. This value is an Amazon Resource Name
        # (ARN).
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of tag keys. Existing tags of the resource whose keys are members of this list will be
        # removed from the DynamoDB resource.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # Represents a request to perform an UpdateItem operation.
      struct Update
        include JSON::Serializable

        # The primary key of the item to be updated. Each element consists of an attribute name and a value
        # for that attribute.
        @[JSON::Field(key: "Key")]
        getter key : Hash(String, Types::AttributeValue)

        # Name of the table for the UpdateItem request. You can also provide the Amazon Resource Name (ARN) of
        # the table in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # An expression that defines one or more attributes to be updated, the action to be performed on them,
        # and new value(s) for them.
        @[JSON::Field(key: "UpdateExpression")]
        getter update_expression : String

        # A condition that must be satisfied in order for a conditional update to succeed.
        @[JSON::Field(key: "ConditionExpression")]
        getter condition_expression : String?

        # One or more substitution tokens for attribute names in an expression.
        @[JSON::Field(key: "ExpressionAttributeNames")]
        getter expression_attribute_names : Hash(String, String)?

        # One or more values that can be substituted in an expression.
        @[JSON::Field(key: "ExpressionAttributeValues")]
        getter expression_attribute_values : Hash(String, Types::AttributeValue)?

        # Use ReturnValuesOnConditionCheckFailure to get the item attributes if the Update condition fails.
        # For ReturnValuesOnConditionCheckFailure , the valid values are: NONE and ALL_OLD.
        @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure")]
        getter return_values_on_condition_check_failure : String?

        def initialize(
          @key : Hash(String, Types::AttributeValue),
          @table_name : String,
          @update_expression : String,
          @condition_expression : String? = nil,
          @expression_attribute_names : Hash(String, String)? = nil,
          @expression_attribute_values : Hash(String, Types::AttributeValue)? = nil,
          @return_values_on_condition_check_failure : String? = nil
        )
        end
      end

      struct UpdateContinuousBackupsInput
        include JSON::Serializable

        # Represents the settings used to enable point in time recovery.
        @[JSON::Field(key: "PointInTimeRecoverySpecification")]
        getter point_in_time_recovery_specification : Types::PointInTimeRecoverySpecification

        # The name of the table. You can also provide the Amazon Resource Name (ARN) of the table in this
        # parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        def initialize(
          @point_in_time_recovery_specification : Types::PointInTimeRecoverySpecification,
          @table_name : String
        )
        end
      end

      struct UpdateContinuousBackupsOutput
        include JSON::Serializable

        # Represents the continuous backups and point in time recovery settings on the table.
        @[JSON::Field(key: "ContinuousBackupsDescription")]
        getter continuous_backups_description : Types::ContinuousBackupsDescription?

        def initialize(
          @continuous_backups_description : Types::ContinuousBackupsDescription? = nil
        )
        end
      end

      struct UpdateContributorInsightsInput
        include JSON::Serializable

        # Represents the contributor insights action.
        @[JSON::Field(key: "ContributorInsightsAction")]
        getter contributor_insights_action : String

        # The name of the table. You can also provide the Amazon Resource Name (ARN) of the table in this
        # parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # Specifies whether to track all access and throttled events or throttled events only for the DynamoDB
        # table or index.
        @[JSON::Field(key: "ContributorInsightsMode")]
        getter contributor_insights_mode : String?

        # The global secondary index name, if applicable.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        def initialize(
          @contributor_insights_action : String,
          @table_name : String,
          @contributor_insights_mode : String? = nil,
          @index_name : String? = nil
        )
        end
      end

      struct UpdateContributorInsightsOutput
        include JSON::Serializable

        # The updated mode of CloudWatch Contributor Insights that determines whether to monitor all access
        # and throttled events or to track throttled events exclusively.
        @[JSON::Field(key: "ContributorInsightsMode")]
        getter contributor_insights_mode : String?

        # The status of contributor insights
        @[JSON::Field(key: "ContributorInsightsStatus")]
        getter contributor_insights_status : String?

        # The name of the global secondary index, if applicable.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String?

        # The name of the table.
        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        def initialize(
          @contributor_insights_mode : String? = nil,
          @contributor_insights_status : String? = nil,
          @index_name : String? = nil,
          @table_name : String? = nil
        )
        end
      end

      # Represents the new provisioned throughput settings to be applied to a global secondary index.
      struct UpdateGlobalSecondaryIndexAction
        include JSON::Serializable

        # The name of the global secondary index to be updated.
        @[JSON::Field(key: "IndexName")]
        getter index_name : String

        # Updates the maximum number of read and write units for the specified global secondary index. If you
        # use this parameter, you must specify MaxReadRequestUnits , MaxWriteRequestUnits , or both.
        @[JSON::Field(key: "OnDemandThroughput")]
        getter on_demand_throughput : Types::OnDemandThroughput?

        # Represents the provisioned throughput settings for the specified global secondary index. For current
        # minimum and maximum provisioned throughput values, see Service, Account, and Table Quotas in the
        # Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "ProvisionedThroughput")]
        getter provisioned_throughput : Types::ProvisionedThroughput?

        # Represents the warm throughput value of the new provisioned throughput settings to be applied to a
        # global secondary index.
        @[JSON::Field(key: "WarmThroughput")]
        getter warm_throughput : Types::WarmThroughput?

        def initialize(
          @index_name : String,
          @on_demand_throughput : Types::OnDemandThroughput? = nil,
          @provisioned_throughput : Types::ProvisionedThroughput? = nil,
          @warm_throughput : Types::WarmThroughput? = nil
        )
        end
      end

      struct UpdateGlobalTableInput
        include JSON::Serializable

        # The global table name.
        @[JSON::Field(key: "GlobalTableName")]
        getter global_table_name : String

        # A list of Regions that should be added or removed from the global table.
        @[JSON::Field(key: "ReplicaUpdates")]
        getter replica_updates : Array(Types::ReplicaUpdate)

        def initialize(
          @global_table_name : String,
          @replica_updates : Array(Types::ReplicaUpdate)
        )
        end
      end

      struct UpdateGlobalTableOutput
        include JSON::Serializable

        # Contains the details of the global table.
        @[JSON::Field(key: "GlobalTableDescription")]
        getter global_table_description : Types::GlobalTableDescription?

        def initialize(
          @global_table_description : Types::GlobalTableDescription? = nil
        )
        end
      end

      struct UpdateGlobalTableSettingsInput
        include JSON::Serializable

        # The name of the global table
        @[JSON::Field(key: "GlobalTableName")]
        getter global_table_name : String

        # The billing mode of the global table. If GlobalTableBillingMode is not specified, the global table
        # defaults to PROVISIONED capacity billing mode. PROVISIONED - We recommend using PROVISIONED for
        # predictable workloads. PROVISIONED sets the billing mode to Provisioned capacity mode .
        # PAY_PER_REQUEST - We recommend using PAY_PER_REQUEST for unpredictable workloads. PAY_PER_REQUEST
        # sets the billing mode to On-demand capacity mode .
        @[JSON::Field(key: "GlobalTableBillingMode")]
        getter global_table_billing_mode : String?

        # Represents the settings of a global secondary index for a global table that will be modified.
        @[JSON::Field(key: "GlobalTableGlobalSecondaryIndexSettingsUpdate")]
        getter global_table_global_secondary_index_settings_update : Array(Types::GlobalTableGlobalSecondaryIndexSettingsUpdate)?

        # Auto scaling settings for managing provisioned write capacity for the global table.
        @[JSON::Field(key: "GlobalTableProvisionedWriteCapacityAutoScalingSettingsUpdate")]
        getter global_table_provisioned_write_capacity_auto_scaling_settings_update : Types::AutoScalingSettingsUpdate?

        # The maximum number of writes consumed per second before DynamoDB returns a ThrottlingException.
        @[JSON::Field(key: "GlobalTableProvisionedWriteCapacityUnits")]
        getter global_table_provisioned_write_capacity_units : Int64?

        # Represents the settings for a global table in a Region that will be modified.
        @[JSON::Field(key: "ReplicaSettingsUpdate")]
        getter replica_settings_update : Array(Types::ReplicaSettingsUpdate)?

        def initialize(
          @global_table_name : String,
          @global_table_billing_mode : String? = nil,
          @global_table_global_secondary_index_settings_update : Array(Types::GlobalTableGlobalSecondaryIndexSettingsUpdate)? = nil,
          @global_table_provisioned_write_capacity_auto_scaling_settings_update : Types::AutoScalingSettingsUpdate? = nil,
          @global_table_provisioned_write_capacity_units : Int64? = nil,
          @replica_settings_update : Array(Types::ReplicaSettingsUpdate)? = nil
        )
        end
      end

      struct UpdateGlobalTableSettingsOutput
        include JSON::Serializable

        # The name of the global table.
        @[JSON::Field(key: "GlobalTableName")]
        getter global_table_name : String?

        # The Region-specific settings for the global table.
        @[JSON::Field(key: "ReplicaSettings")]
        getter replica_settings : Array(Types::ReplicaSettingsDescription)?

        def initialize(
          @global_table_name : String? = nil,
          @replica_settings : Array(Types::ReplicaSettingsDescription)? = nil
        )
        end
      end

      # Represents the input of an UpdateItem operation.
      struct UpdateItemInput
        include JSON::Serializable

        # The primary key of the item to be updated. Each element consists of an attribute name and a value
        # for that attribute. For the primary key, you must provide all of the attributes. For example, with a
        # simple primary key, you only need to provide a value for the partition key. For a composite primary
        # key, you must provide values for both the partition key and the sort key.
        @[JSON::Field(key: "Key")]
        getter key : Hash(String, Types::AttributeValue)

        # The name of the table containing the item to update. You can also provide the Amazon Resource Name
        # (ARN) of the table in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # This is a legacy parameter. Use UpdateExpression instead. For more information, see AttributeUpdates
        # in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "AttributeUpdates")]
        getter attribute_updates : Hash(String, Types::AttributeValueUpdate)?

        # A condition that must be satisfied in order for a conditional update to succeed. An expression can
        # contain any of the following: Functions: attribute_exists | attribute_not_exists | attribute_type |
        # contains | begins_with | size These function names are case-sensitive. Comparison operators: = |
        # &lt;&gt; | &lt; | &gt; | &lt;= | &gt;= | BETWEEN | IN Logical operators: AND | OR | NOT For more
        # information about condition expressions, see Specifying Conditions in the Amazon DynamoDB Developer
        # Guide .
        @[JSON::Field(key: "ConditionExpression")]
        getter condition_expression : String?

        # This is a legacy parameter. Use ConditionExpression instead. For more information, see
        # ConditionalOperator in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "ConditionalOperator")]
        getter conditional_operator : String?

        # This is a legacy parameter. Use ConditionExpression instead. For more information, see Expected in
        # the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "Expected")]
        getter expected : Hash(String, Types::ExpectedAttributeValue)?

        # One or more substitution tokens for attribute names in an expression. The following are some use
        # cases for using ExpressionAttributeNames : To access an attribute whose name conflicts with a
        # DynamoDB reserved word. To create a placeholder for repeating occurrences of an attribute name in an
        # expression. To prevent special characters in an attribute name from being misinterpreted in an
        # expression. Use the # character in an expression to dereference an attribute name. For example,
        # consider the following attribute name: Percentile The name of this attribute conflicts with a
        # reserved word, so it cannot be used directly in an expression. (For the complete list of reserved
        # words, see Reserved Words in the Amazon DynamoDB Developer Guide .) To work around this, you could
        # specify the following for ExpressionAttributeNames : {"#P":"Percentile"} You could then use this
        # substitution in an expression, as in this example: #P = :val Tokens that begin with the : character
        # are expression attribute values , which are placeholders for the actual value at runtime. For more
        # information about expression attribute names, see Specifying Item Attributes in the Amazon DynamoDB
        # Developer Guide .
        @[JSON::Field(key: "ExpressionAttributeNames")]
        getter expression_attribute_names : Hash(String, String)?

        # One or more values that can be substituted in an expression. Use the : (colon) character in an
        # expression to dereference an attribute value. For example, suppose that you wanted to check whether
        # the value of the ProductStatus attribute was one of the following: Available | Backordered |
        # Discontinued You would first need to specify ExpressionAttributeValues as follows: {
        # ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"} } You could
        # then use these values in an expression, such as this: ProductStatus IN (:avail, :back, :disc) For
        # more information on expression attribute values, see Condition Expressions in the Amazon DynamoDB
        # Developer Guide .
        @[JSON::Field(key: "ExpressionAttributeValues")]
        getter expression_attribute_values : Hash(String, Types::AttributeValue)?

        @[JSON::Field(key: "ReturnConsumedCapacity")]
        getter return_consumed_capacity : String?

        # Determines whether item collection metrics are returned. If set to SIZE , the response includes
        # statistics about item collections, if any, that were modified during the operation are returned in
        # the response. If set to NONE (the default), no statistics are returned.
        @[JSON::Field(key: "ReturnItemCollectionMetrics")]
        getter return_item_collection_metrics : String?

        # Use ReturnValues if you want to get the item attributes as they appear before or after they are
        # successfully updated. For UpdateItem , the valid values are: NONE - If ReturnValues is not
        # specified, or if its value is NONE , then nothing is returned. (This setting is the default for
        # ReturnValues .) ALL_OLD - Returns all of the attributes of the item, as they appeared before the
        # UpdateItem operation. UPDATED_OLD - Returns only the updated attributes, as they appeared before the
        # UpdateItem operation. ALL_NEW - Returns all of the attributes of the item, as they appear after the
        # UpdateItem operation. UPDATED_NEW - Returns only the updated attributes, as they appear after the
        # UpdateItem operation. There is no additional cost associated with requesting a return value aside
        # from the small network and processing overhead of receiving a larger response. No read capacity
        # units are consumed. The values returned are strongly consistent.
        @[JSON::Field(key: "ReturnValues")]
        getter return_values : String?

        # An optional parameter that returns the item attributes for an UpdateItem operation that failed a
        # condition check. There is no additional cost associated with requesting a return value aside from
        # the small network and processing overhead of receiving a larger response. No read capacity units are
        # consumed.
        @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure")]
        getter return_values_on_condition_check_failure : String?

        # An expression that defines one or more attributes to be updated, the action to be performed on them,
        # and new values for them. The following action values are available for UpdateExpression . SET - Adds
        # one or more attributes and values to an item. If any of these attributes already exist, they are
        # replaced by the new values. You can also use SET to add or subtract from an attribute that is of
        # type Number. For example: SET myNum = myNum + :val SET supports the following functions:
        # if_not_exists (path, operand) - if the item does not contain an attribute at the specified path,
        # then if_not_exists evaluates to operand; otherwise, it evaluates to path. You can use this function
        # to avoid overwriting an attribute that may already be present in the item. list_append (operand,
        # operand) - evaluates to a list with a new element added to it. You can append the new element to the
        # start or the end of the list by reversing the order of the operands. These function names are
        # case-sensitive. REMOVE - Removes one or more attributes from an item. ADD - Adds the specified value
        # to the item, if the attribute does not already exist. If the attribute does exist, then the behavior
        # of ADD depends on the data type of the attribute: If the existing attribute is a number, and if
        # Value is also a number, then Value is mathematically added to the existing attribute. If Value is a
        # negative number, then it is subtracted from the existing attribute. If you use ADD to increment or
        # decrement a number value for an item that doesn't exist before the update, DynamoDB uses 0 as the
        # initial value. Similarly, if you use ADD for an existing item to increment or decrement an attribute
        # value that doesn't exist before the update, DynamoDB uses 0 as the initial value. For example,
        # suppose that the item you want to update doesn't have an attribute named itemcount , but you decide
        # to ADD the number 3 to this attribute anyway. DynamoDB will create the itemcount attribute, set its
        # initial value to 0 , and finally add 3 to it. The result will be a new itemcount attribute in the
        # item, with a value of 3 . If the existing data type is a set and if Value is also a set, then Value
        # is added to the existing set. For example, if the attribute value is the set [1,2] , and the ADD
        # action specified [3] , then the final attribute value is [1,2,3] . An error occurs if an ADD action
        # is specified for a set attribute and the attribute type specified does not match the existing set
        # type. Both sets must have the same primitive data type. For example, if the existing data type is a
        # set of strings, the Value must also be a set of strings. The ADD action only supports Number and set
        # data types. In addition, ADD can only be used on top-level attributes, not nested attributes. DELETE
        # - Deletes an element from a set. If a set of values is specified, then those values are subtracted
        # from the old set. For example, if the attribute value was the set [a,b,c] and the DELETE action
        # specifies [a,c] , then the final attribute value is [b] . Specifying an empty set is an error. The
        # DELETE action only supports set data types. In addition, DELETE can only be used on top-level
        # attributes, not nested attributes. You can have many actions in a single expression, such as the
        # following: SET a=:value1, b=:value2 DELETE :value3, :value4, :value5 For more information on update
        # expressions, see Modifying Items and Attributes in the Amazon DynamoDB Developer Guide .
        @[JSON::Field(key: "UpdateExpression")]
        getter update_expression : String?

        def initialize(
          @key : Hash(String, Types::AttributeValue),
          @table_name : String,
          @attribute_updates : Hash(String, Types::AttributeValueUpdate)? = nil,
          @condition_expression : String? = nil,
          @conditional_operator : String? = nil,
          @expected : Hash(String, Types::ExpectedAttributeValue)? = nil,
          @expression_attribute_names : Hash(String, String)? = nil,
          @expression_attribute_values : Hash(String, Types::AttributeValue)? = nil,
          @return_consumed_capacity : String? = nil,
          @return_item_collection_metrics : String? = nil,
          @return_values : String? = nil,
          @return_values_on_condition_check_failure : String? = nil,
          @update_expression : String? = nil
        )
        end
      end

      # Represents the output of an UpdateItem operation.
      struct UpdateItemOutput
        include JSON::Serializable

        # A map of attribute values as they appear before or after the UpdateItem operation, as determined by
        # the ReturnValues parameter. The Attributes map is only present if the update was successful and
        # ReturnValues was specified as something other than NONE in the request. Each element represents one
        # attribute.
        @[JSON::Field(key: "Attributes")]
        getter attributes : Hash(String, Types::AttributeValue)?

        # The capacity units consumed by the UpdateItem operation. The data returned includes the total
        # provisioned throughput consumed, along with statistics for the table and any indexes involved in the
        # operation. ConsumedCapacity is only returned if the ReturnConsumedCapacity parameter was specified.
        # For more information, see Capacity unity consumption for write operations in the Amazon DynamoDB
        # Developer Guide .
        @[JSON::Field(key: "ConsumedCapacity")]
        getter consumed_capacity : Types::ConsumedCapacity?

        # Information about item collections, if any, that were affected by the UpdateItem operation.
        # ItemCollectionMetrics is only returned if the ReturnItemCollectionMetrics parameter was specified.
        # If the table does not have any local secondary indexes, this information is not returned in the
        # response. Each ItemCollectionMetrics element consists of: ItemCollectionKey - The partition key
        # value of the item collection. This is the same as the partition key value of the item itself.
        # SizeEstimateRangeGB - An estimate of item collection size, in gigabytes. This value is a two-element
        # array containing a lower bound and an upper bound for the estimate. The estimate includes the size
        # of all the items in the table, plus the size of all attributes projected into all of the local
        # secondary indexes on that table. Use this estimate to measure whether a local secondary index is
        # approaching its size limit. The estimate is subject to change over time; therefore, do not rely on
        # the precision or accuracy of the estimate.
        @[JSON::Field(key: "ItemCollectionMetrics")]
        getter item_collection_metrics : Types::ItemCollectionMetrics?

        def initialize(
          @attributes : Hash(String, Types::AttributeValue)? = nil,
          @consumed_capacity : Types::ConsumedCapacity? = nil,
          @item_collection_metrics : Types::ItemCollectionMetrics? = nil
        )
        end
      end

      # Enables updating the configuration for Kinesis Streaming.
      struct UpdateKinesisStreamingConfiguration
        include JSON::Serializable

        # Enables updating the precision of Kinesis data stream timestamp.
        @[JSON::Field(key: "ApproximateCreationDateTimePrecision")]
        getter approximate_creation_date_time_precision : String?

        def initialize(
          @approximate_creation_date_time_precision : String? = nil
        )
        end
      end

      struct UpdateKinesisStreamingDestinationInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the Kinesis stream input.
        @[JSON::Field(key: "StreamArn")]
        getter stream_arn : String

        # The table name for the Kinesis streaming destination input. You can also provide the ARN of the
        # table in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # The command to update the Kinesis stream configuration.
        @[JSON::Field(key: "UpdateKinesisStreamingConfiguration")]
        getter update_kinesis_streaming_configuration : Types::UpdateKinesisStreamingConfiguration?

        def initialize(
          @stream_arn : String,
          @table_name : String,
          @update_kinesis_streaming_configuration : Types::UpdateKinesisStreamingConfiguration? = nil
        )
        end
      end

      struct UpdateKinesisStreamingDestinationOutput
        include JSON::Serializable

        # The status of the attempt to update the Kinesis streaming destination output.
        @[JSON::Field(key: "DestinationStatus")]
        getter destination_status : String?

        # The ARN for the Kinesis stream input.
        @[JSON::Field(key: "StreamArn")]
        getter stream_arn : String?

        # The table name for the Kinesis streaming destination output.
        @[JSON::Field(key: "TableName")]
        getter table_name : String?

        # The command to update the Kinesis streaming destination configuration.
        @[JSON::Field(key: "UpdateKinesisStreamingConfiguration")]
        getter update_kinesis_streaming_configuration : Types::UpdateKinesisStreamingConfiguration?

        def initialize(
          @destination_status : String? = nil,
          @stream_arn : String? = nil,
          @table_name : String? = nil,
          @update_kinesis_streaming_configuration : Types::UpdateKinesisStreamingConfiguration? = nil
        )
        end
      end

      # Represents a replica to be modified.
      struct UpdateReplicationGroupMemberAction
        include JSON::Serializable

        # The Region where the replica exists.
        @[JSON::Field(key: "RegionName")]
        getter region_name : String

        # Replica-specific global secondary index settings.
        @[JSON::Field(key: "GlobalSecondaryIndexes")]
        getter global_secondary_indexes : Array(Types::ReplicaGlobalSecondaryIndex)?

        # The KMS key of the replica that should be used for KMS encryption. To specify a key, use its key ID,
        # Amazon Resource Name (ARN), alias name, or alias ARN. Note that you should only provide this
        # parameter if the key is different from the default DynamoDB KMS key alias/aws/dynamodb .
        @[JSON::Field(key: "KMSMasterKeyId")]
        getter kms_master_key_id : String?

        # Overrides the maximum on-demand throughput for the replica table.
        @[JSON::Field(key: "OnDemandThroughputOverride")]
        getter on_demand_throughput_override : Types::OnDemandThroughputOverride?

        # Replica-specific provisioned throughput. If not specified, uses the source table's provisioned
        # throughput settings.
        @[JSON::Field(key: "ProvisionedThroughputOverride")]
        getter provisioned_throughput_override : Types::ProvisionedThroughputOverride?

        # Replica-specific table class. If not specified, uses the source table's table class.
        @[JSON::Field(key: "TableClassOverride")]
        getter table_class_override : String?

        def initialize(
          @region_name : String,
          @global_secondary_indexes : Array(Types::ReplicaGlobalSecondaryIndex)? = nil,
          @kms_master_key_id : String? = nil,
          @on_demand_throughput_override : Types::OnDemandThroughputOverride? = nil,
          @provisioned_throughput_override : Types::ProvisionedThroughputOverride? = nil,
          @table_class_override : String? = nil
        )
        end
      end

      # Represents the input of an UpdateTable operation.
      struct UpdateTableInput
        include JSON::Serializable

        # The name of the table to be updated. You can also provide the Amazon Resource Name (ARN) of the
        # table in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # An array of attributes that describe the key schema for the table and indexes. If you are adding a
        # new global secondary index to the table, AttributeDefinitions must include the key element(s) of the
        # new index.
        @[JSON::Field(key: "AttributeDefinitions")]
        getter attribute_definitions : Array(Types::AttributeDefinition)?

        # Controls how you are charged for read and write throughput and how you manage capacity. When
        # switching from pay-per-request to provisioned capacity, initial provisioned capacity values must be
        # set. The initial provisioned capacity values are estimated based on the consumed read and write
        # capacity of your table and global secondary indexes over the past 30 minutes. PAY_PER_REQUEST - We
        # recommend using PAY_PER_REQUEST for most DynamoDB workloads. PAY_PER_REQUEST sets the billing mode
        # to On-demand capacity mode . PROVISIONED - We recommend using PROVISIONED for steady workloads with
        # predictable growth where capacity requirements can be reliably forecasted. PROVISIONED sets the
        # billing mode to Provisioned capacity mode .
        @[JSON::Field(key: "BillingMode")]
        getter billing_mode : String?

        # Indicates whether deletion protection is to be enabled (true) or disabled (false) on the table.
        @[JSON::Field(key: "DeletionProtectionEnabled")]
        getter deletion_protection_enabled : Bool?

        # An array of one or more global secondary indexes for the table. For each index in the array, you can
        # request one action: Create - add a new global secondary index to the table. Update - modify the
        # provisioned throughput settings of an existing global secondary index. Delete - remove a global
        # secondary index from the table. You can create or delete only one global secondary index per
        # UpdateTable operation. For more information, see Managing Global Secondary Indexes in the Amazon
        # DynamoDB Developer Guide .
        @[JSON::Field(key: "GlobalSecondaryIndexUpdates")]
        getter global_secondary_index_updates : Array(Types::GlobalSecondaryIndexUpdate)?

        # A list of witness updates for a MRSC global table. A witness provides a cost-effective alternative
        # to a full replica in a MRSC global table by maintaining replicated change data written to global
        # table replicas. You cannot perform read or write operations on a witness. For each witness, you can
        # request one action: Create - add a new witness to the global table. Delete - remove a witness from
        # the global table. You can create or delete only one witness per UpdateTable operation. For more
        # information, see Multi-Region strong consistency (MRSC) in the Amazon DynamoDB Developer Guide
        @[JSON::Field(key: "GlobalTableWitnessUpdates")]
        getter global_table_witness_updates : Array(Types::GlobalTableWitnessGroupUpdate)?

        # Specifies the consistency mode for a new global table. This parameter is only valid when you create
        # a global table by specifying one or more Create actions in the ReplicaUpdates action list. You can
        # specify one of the following consistency modes: EVENTUAL : Configures a new global table for
        # multi-Region eventual consistency (MREC). This is the default consistency mode for global tables.
        # STRONG : Configures a new global table for multi-Region strong consistency (MRSC). If you don't
        # specify this field, the global table consistency mode defaults to EVENTUAL . For more information
        # about global tables consistency modes, see Consistency modes in DynamoDB developer guide.
        @[JSON::Field(key: "MultiRegionConsistency")]
        getter multi_region_consistency : String?

        # Updates the maximum number of read and write units for the specified table in on-demand capacity
        # mode. If you use this parameter, you must specify MaxReadRequestUnits , MaxWriteRequestUnits , or
        # both.
        @[JSON::Field(key: "OnDemandThroughput")]
        getter on_demand_throughput : Types::OnDemandThroughput?

        # The new provisioned throughput settings for the specified table or index.
        @[JSON::Field(key: "ProvisionedThroughput")]
        getter provisioned_throughput : Types::ProvisionedThroughput?

        # A list of replica update actions (create, delete, or update) for the table.
        @[JSON::Field(key: "ReplicaUpdates")]
        getter replica_updates : Array(Types::ReplicationGroupUpdate)?

        # The new server-side encryption settings for the specified table.
        @[JSON::Field(key: "SSESpecification")]
        getter sse_specification : Types::SSESpecification?

        # Represents the DynamoDB Streams configuration for the table. You receive a ValidationException if
        # you try to enable a stream on a table that already has a stream, or if you try to disable a stream
        # on a table that doesn't have a stream.
        @[JSON::Field(key: "StreamSpecification")]
        getter stream_specification : Types::StreamSpecification?

        # The table class of the table to be updated. Valid values are STANDARD and STANDARD_INFREQUENT_ACCESS
        # .
        @[JSON::Field(key: "TableClass")]
        getter table_class : String?

        # Represents the warm throughput (in read units per second and write units per second) for updating a
        # table.
        @[JSON::Field(key: "WarmThroughput")]
        getter warm_throughput : Types::WarmThroughput?

        def initialize(
          @table_name : String,
          @attribute_definitions : Array(Types::AttributeDefinition)? = nil,
          @billing_mode : String? = nil,
          @deletion_protection_enabled : Bool? = nil,
          @global_secondary_index_updates : Array(Types::GlobalSecondaryIndexUpdate)? = nil,
          @global_table_witness_updates : Array(Types::GlobalTableWitnessGroupUpdate)? = nil,
          @multi_region_consistency : String? = nil,
          @on_demand_throughput : Types::OnDemandThroughput? = nil,
          @provisioned_throughput : Types::ProvisionedThroughput? = nil,
          @replica_updates : Array(Types::ReplicationGroupUpdate)? = nil,
          @sse_specification : Types::SSESpecification? = nil,
          @stream_specification : Types::StreamSpecification? = nil,
          @table_class : String? = nil,
          @warm_throughput : Types::WarmThroughput? = nil
        )
        end
      end

      # Represents the output of an UpdateTable operation.
      struct UpdateTableOutput
        include JSON::Serializable

        # Represents the properties of the table.
        @[JSON::Field(key: "TableDescription")]
        getter table_description : Types::TableDescription?

        def initialize(
          @table_description : Types::TableDescription? = nil
        )
        end
      end

      struct UpdateTableReplicaAutoScalingInput
        include JSON::Serializable

        # The name of the global table to be updated. You can also provide the Amazon Resource Name (ARN) of
        # the table in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # Represents the auto scaling settings of the global secondary indexes of the replica to be updated.
        @[JSON::Field(key: "GlobalSecondaryIndexUpdates")]
        getter global_secondary_index_updates : Array(Types::GlobalSecondaryIndexAutoScalingUpdate)?

        @[JSON::Field(key: "ProvisionedWriteCapacityAutoScalingUpdate")]
        getter provisioned_write_capacity_auto_scaling_update : Types::AutoScalingSettingsUpdate?

        # Represents the auto scaling settings of replicas of the table that will be modified.
        @[JSON::Field(key: "ReplicaUpdates")]
        getter replica_updates : Array(Types::ReplicaAutoScalingUpdate)?

        def initialize(
          @table_name : String,
          @global_secondary_index_updates : Array(Types::GlobalSecondaryIndexAutoScalingUpdate)? = nil,
          @provisioned_write_capacity_auto_scaling_update : Types::AutoScalingSettingsUpdate? = nil,
          @replica_updates : Array(Types::ReplicaAutoScalingUpdate)? = nil
        )
        end
      end

      struct UpdateTableReplicaAutoScalingOutput
        include JSON::Serializable

        # Returns information about the auto scaling settings of a table with replicas.
        @[JSON::Field(key: "TableAutoScalingDescription")]
        getter table_auto_scaling_description : Types::TableAutoScalingDescription?

        def initialize(
          @table_auto_scaling_description : Types::TableAutoScalingDescription? = nil
        )
        end
      end

      # Represents the input of an UpdateTimeToLive operation.
      struct UpdateTimeToLiveInput
        include JSON::Serializable

        # The name of the table to be configured. You can also provide the Amazon Resource Name (ARN) of the
        # table in this parameter.
        @[JSON::Field(key: "TableName")]
        getter table_name : String

        # Represents the settings used to enable or disable Time to Live for the specified table.
        @[JSON::Field(key: "TimeToLiveSpecification")]
        getter time_to_live_specification : Types::TimeToLiveSpecification

        def initialize(
          @table_name : String,
          @time_to_live_specification : Types::TimeToLiveSpecification
        )
        end
      end

      struct UpdateTimeToLiveOutput
        include JSON::Serializable

        # Represents the output of an UpdateTimeToLive operation.
        @[JSON::Field(key: "TimeToLiveSpecification")]
        getter time_to_live_specification : Types::TimeToLiveSpecification?

        def initialize(
          @time_to_live_specification : Types::TimeToLiveSpecification? = nil
        )
        end
      end

      # Provides visibility into the number of read and write operations your table or secondary index can
      # instantaneously support. The settings can be modified using the UpdateTable operation to meet the
      # throughput requirements of an upcoming peak event.
      struct WarmThroughput
        include JSON::Serializable

        # Represents the number of read operations your base table can instantaneously support.
        @[JSON::Field(key: "ReadUnitsPerSecond")]
        getter read_units_per_second : Int64?

        # Represents the number of write operations your base table can instantaneously support.
        @[JSON::Field(key: "WriteUnitsPerSecond")]
        getter write_units_per_second : Int64?

        def initialize(
          @read_units_per_second : Int64? = nil,
          @write_units_per_second : Int64? = nil
        )
        end
      end

      # Represents an operation to perform - either DeleteItem or PutItem . You can only request one of
      # these operations, not both, in a single WriteRequest . If you do need to perform both of these
      # operations, you need to provide two separate WriteRequest objects.
      struct WriteRequest
        include JSON::Serializable

        # A request to perform a DeleteItem operation.
        @[JSON::Field(key: "DeleteRequest")]
        getter delete_request : Types::DeleteRequest?

        # A request to perform a PutItem operation.
        @[JSON::Field(key: "PutRequest")]
        getter put_request : Types::PutRequest?

        def initialize(
          @delete_request : Types::DeleteRequest? = nil,
          @put_request : Types::PutRequest? = nil
        )
        end
      end
    end
  end
end
