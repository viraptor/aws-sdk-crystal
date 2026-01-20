require "json"
require "time"

module AwsSdk
  module Detective
    module Types


      struct AcceptInvitationRequest
        include JSON::Serializable

        # The ARN of the behavior graph that the member account is accepting the invitation for. The member
        # account status in the behavior graph must be INVITED .

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String

        def initialize(
          @graph_arn : String
        )
        end
      end

      # The request issuer does not have permission to access this resource or perform this operation.

      struct AccessDeniedException
        include JSON::Serializable

        # The SDK default error code associated with the access denied exception.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The SDK default explanation of why access was denied.

        @[JSON::Field(key: "ErrorCodeReason")]
        getter error_code_reason : String?


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The error code associated with the access denied exception.

        @[JSON::Field(key: "SubErrorCode")]
        getter sub_error_code : String?

        # An explanation of why access was denied.

        @[JSON::Field(key: "SubErrorCodeReason")]
        getter sub_error_code_reason : String?

        def initialize(
          @error_code : String? = nil,
          @error_code_reason : String? = nil,
          @message : String? = nil,
          @sub_error_code : String? = nil,
          @sub_error_code_reason : String? = nil
        )
        end
      end

      # An Amazon Web Services account that is the administrator account of or a member of a behavior graph.

      struct Account
        include JSON::Serializable

        # The account identifier of the Amazon Web Services account.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The Amazon Web Services account root user email address for the Amazon Web Services account.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String

        def initialize(
          @account_id : String,
          @email_address : String
        )
        end
      end

      # Information about the Detective administrator account for an organization.

      struct Administrator
        include JSON::Serializable

        # The Amazon Web Services account identifier of the Detective administrator account for the
        # organization.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The date and time when the Detective administrator account was enabled. The value is an ISO8601
        # formatted string. For example, 2021-08-18T16:35:56.284Z .

        @[JSON::Field(key: "DelegationTime")]
        getter delegation_time : Time?

        # The ARN of the organization behavior graph.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String?

        def initialize(
          @account_id : String? = nil,
          @delegation_time : Time? = nil,
          @graph_arn : String? = nil
        )
        end
      end


      struct BatchGetGraphMemberDatasourcesRequest
        include JSON::Serializable

        # The list of Amazon Web Services accounts to get data source package information on.

        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)

        # The ARN of the behavior graph.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String

        def initialize(
          @account_ids : Array(String),
          @graph_arn : String
        )
        end
      end


      struct BatchGetGraphMemberDatasourcesResponse
        include JSON::Serializable

        # Details on the status of data source packages for members of the behavior graph.

        @[JSON::Field(key: "MemberDatasources")]
        getter member_datasources : Array(Types::MembershipDatasources)?

        # Accounts that data source package information could not be retrieved for.

        @[JSON::Field(key: "UnprocessedAccounts")]
        getter unprocessed_accounts : Array(Types::UnprocessedAccount)?

        def initialize(
          @member_datasources : Array(Types::MembershipDatasources)? = nil,
          @unprocessed_accounts : Array(Types::UnprocessedAccount)? = nil
        )
        end
      end


      struct BatchGetMembershipDatasourcesRequest
        include JSON::Serializable

        # The ARN of the behavior graph.

        @[JSON::Field(key: "GraphArns")]
        getter graph_arns : Array(String)

        def initialize(
          @graph_arns : Array(String)
        )
        end
      end


      struct BatchGetMembershipDatasourcesResponse
        include JSON::Serializable

        # Details on the data source package history for an member of the behavior graph.

        @[JSON::Field(key: "MembershipDatasources")]
        getter membership_datasources : Array(Types::MembershipDatasources)?

        # Graphs that data source package information could not be retrieved for.

        @[JSON::Field(key: "UnprocessedGraphs")]
        getter unprocessed_graphs : Array(Types::UnprocessedGraph)?

        def initialize(
          @membership_datasources : Array(Types::MembershipDatasources)? = nil,
          @unprocessed_graphs : Array(Types::UnprocessedGraph)? = nil
        )
        end
      end

      # The request attempted an invalid action.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateGraphRequest
        include JSON::Serializable

        # The tags to assign to the new behavior graph. You can add up to 50 tags. For each tag, you provide
        # the tag key and the tag value. Each tag key can contain up to 128 characters. Each tag value can
        # contain up to 256 characters.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateGraphResponse
        include JSON::Serializable

        # The ARN of the new behavior graph.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String?

        def initialize(
          @graph_arn : String? = nil
        )
        end
      end


      struct CreateMembersRequest
        include JSON::Serializable

        # The list of Amazon Web Services accounts to invite or to enable. You can invite or enable up to 50
        # accounts at a time. For each invited account, the account list contains the account identifier and
        # the Amazon Web Services account root user email address. For organization accounts in the
        # organization behavior graph, the email address is not required.

        @[JSON::Field(key: "Accounts")]
        getter accounts : Array(Types::Account)

        # The ARN of the behavior graph.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String

        # if set to true , then the invited accounts do not receive email notifications. By default, this is
        # set to false , and the invited accounts receive email notifications. Organization accounts in the
        # organization behavior graph do not receive email notifications.

        @[JSON::Field(key: "DisableEmailNotification")]
        getter disable_email_notification : Bool?

        # Customized message text to include in the invitation email message to the invited member accounts.

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @accounts : Array(Types::Account),
          @graph_arn : String,
          @disable_email_notification : Bool? = nil,
          @message : String? = nil
        )
        end
      end


      struct CreateMembersResponse
        include JSON::Serializable

        # The set of member account invitation or enablement requests that Detective was able to process. This
        # includes accounts that are being verified, that failed verification, and that passed verification
        # and are being sent an invitation or are being enabled.

        @[JSON::Field(key: "Members")]
        getter members : Array(Types::MemberDetail)?

        # The list of accounts for which Detective was unable to process the invitation or enablement request.
        # For each account, the list provides the reason why the request could not be processed. The list
        # includes accounts that are already member accounts in the behavior graph.

        @[JSON::Field(key: "UnprocessedAccounts")]
        getter unprocessed_accounts : Array(Types::UnprocessedAccount)?

        def initialize(
          @members : Array(Types::MemberDetail)? = nil,
          @unprocessed_accounts : Array(Types::UnprocessedAccount)? = nil
        )
        end
      end

      # Details about the data source packages ingested by your behavior graph.

      struct DatasourcePackageIngestDetail
        include JSON::Serializable

        # Details on which data source packages are ingested for a member account.

        @[JSON::Field(key: "DatasourcePackageIngestState")]
        getter datasource_package_ingest_state : String?

        # The date a data source package was enabled for this account

        @[JSON::Field(key: "LastIngestStateChange")]
        getter last_ingest_state_change : Hash(String, Types::TimestampForCollection)?

        def initialize(
          @datasource_package_ingest_state : String? = nil,
          @last_ingest_state_change : Hash(String, Types::TimestampForCollection)? = nil
        )
        end
      end

      # Information on the usage of a data source package in the behavior graph.

      struct DatasourcePackageUsageInfo
        include JSON::Serializable

        # Total volume of data in bytes per day ingested for a given data source package.

        @[JSON::Field(key: "VolumeUsageInBytes")]
        getter volume_usage_in_bytes : Int64?

        # The data and time when the member account data volume was last updated. The value is an ISO8601
        # formatted string. For example, 2021-08-18T16:35:56.284Z .

        @[JSON::Field(key: "VolumeUsageUpdateTime")]
        getter volume_usage_update_time : Time?

        def initialize(
          @volume_usage_in_bytes : Int64? = nil,
          @volume_usage_update_time : Time? = nil
        )
        end
      end

      # Contains details on the time range used to filter data.

      struct DateFilter
        include JSON::Serializable

        # A timestamp representing the end date of the time period until when data is filtered, including the
        # end date.

        @[JSON::Field(key: "EndInclusive")]
        getter end_inclusive : Time

        # A timestamp representing the start of the time period from when data is filtered, including the
        # start date.

        @[JSON::Field(key: "StartInclusive")]
        getter start_inclusive : Time

        def initialize(
          @end_inclusive : Time,
          @start_inclusive : Time
        )
        end
      end


      struct DeleteGraphRequest
        include JSON::Serializable

        # The ARN of the behavior graph to disable.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String

        def initialize(
          @graph_arn : String
        )
        end
      end


      struct DeleteMembersRequest
        include JSON::Serializable

        # The list of Amazon Web Services account identifiers for the member accounts to remove from the
        # behavior graph. You can remove up to 50 member accounts at a time.

        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)

        # The ARN of the behavior graph to remove members from.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String

        def initialize(
          @account_ids : Array(String),
          @graph_arn : String
        )
        end
      end


      struct DeleteMembersResponse
        include JSON::Serializable

        # The list of Amazon Web Services account identifiers for the member accounts that Detective
        # successfully removed from the behavior graph.

        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)?

        # The list of member accounts that Detective was not able to remove from the behavior graph. For each
        # member account, provides the reason that the deletion could not be processed.

        @[JSON::Field(key: "UnprocessedAccounts")]
        getter unprocessed_accounts : Array(Types::UnprocessedAccount)?

        def initialize(
          @account_ids : Array(String)? = nil,
          @unprocessed_accounts : Array(Types::UnprocessedAccount)? = nil
        )
        end
      end


      struct DescribeOrganizationConfigurationRequest
        include JSON::Serializable

        # The ARN of the organization behavior graph.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String

        def initialize(
          @graph_arn : String
        )
        end
      end


      struct DescribeOrganizationConfigurationResponse
        include JSON::Serializable

        # Indicates whether to automatically enable new organization accounts as member accounts in the
        # organization behavior graph.

        @[JSON::Field(key: "AutoEnable")]
        getter auto_enable : Bool?

        def initialize(
          @auto_enable : Bool? = nil
        )
        end
      end


      struct DisassociateMembershipRequest
        include JSON::Serializable

        # The ARN of the behavior graph to remove the member account from. The member account's member status
        # in the behavior graph must be ENABLED .

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String

        def initialize(
          @graph_arn : String
        )
        end
      end


      struct EnableOrganizationAdminAccountRequest
        include JSON::Serializable

        # The Amazon Web Services account identifier of the account to designate as the Detective
        # administrator account for the organization.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end

      # Details on the criteria used to define the filter for investigation results.

      struct FilterCriteria
        include JSON::Serializable

        # Filter the investigation results based on when the investigation was created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Types::DateFilter?

        # Filter the investigation results based on the Amazon Resource Name (ARN) of the entity.

        @[JSON::Field(key: "EntityArn")]
        getter entity_arn : Types::StringFilter?

        # Filter the investigation results based on the severity.

        @[JSON::Field(key: "Severity")]
        getter severity : Types::StringFilter?

        # Filter the investigation results based on the state.

        @[JSON::Field(key: "State")]
        getter state : Types::StringFilter?

        # Filter the investigation results based on the status.

        @[JSON::Field(key: "Status")]
        getter status : Types::StringFilter?

        def initialize(
          @created_time : Types::DateFilter? = nil,
          @entity_arn : Types::StringFilter? = nil,
          @severity : Types::StringFilter? = nil,
          @state : Types::StringFilter? = nil,
          @status : Types::StringFilter? = nil
        )
        end
      end

      # Contains information on suspicious IP addresses identified as indicators of compromise. This
      # indicator is derived from Amazon Web Services threat intelligence.

      struct FlaggedIpAddressDetail
        include JSON::Serializable

        # IP address of the suspicious entity.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # Details the reason the IP address was flagged as suspicious.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @ip_address : String? = nil,
          @reason : String? = nil
        )
        end
      end


      struct GetInvestigationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the behavior graph.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String

        # The investigation ID of the investigation report.

        @[JSON::Field(key: "InvestigationId")]
        getter investigation_id : String

        def initialize(
          @graph_arn : String,
          @investigation_id : String
        )
        end
      end


      struct GetInvestigationResponse
        include JSON::Serializable

        # The creation time of the investigation report in UTC time stamp format.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The unique Amazon Resource Name (ARN). Detective supports IAM user ARNs and IAM role ARNs.

        @[JSON::Field(key: "EntityArn")]
        getter entity_arn : String?

        # Type of entity. For example, Amazon Web Services accounts, such as an IAM user and/or IAM role.

        @[JSON::Field(key: "EntityType")]
        getter entity_type : String?

        # The Amazon Resource Name (ARN) of the behavior graph.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String?

        # The investigation ID of the investigation report.

        @[JSON::Field(key: "InvestigationId")]
        getter investigation_id : String?

        # The data and time when the investigation began. The value is an UTC ISO8601 formatted string. For
        # example, 2021-08-18T16:35:56.284Z .

        @[JSON::Field(key: "ScopeEndTime")]
        getter scope_end_time : Time?

        # The start date and time used to set the scope time within which you want to generate the
        # investigation report. The value is an UTC ISO8601 formatted string. For example,
        # 2021-08-18T16:35:56.284Z .

        @[JSON::Field(key: "ScopeStartTime")]
        getter scope_start_time : Time?

        # The severity assigned is based on the likelihood and impact of the indicators of compromise
        # discovered in the investigation.

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # The current state of the investigation. An archived investigation indicates that you have completed
        # reviewing the investigation.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The status based on the completion status of the investigation.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @created_time : Time? = nil,
          @entity_arn : String? = nil,
          @entity_type : String? = nil,
          @graph_arn : String? = nil,
          @investigation_id : String? = nil,
          @scope_end_time : Time? = nil,
          @scope_start_time : Time? = nil,
          @severity : String? = nil,
          @state : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct GetMembersRequest
        include JSON::Serializable

        # The list of Amazon Web Services account identifiers for the member account for which to return
        # member details. You can request details for up to 50 member accounts at a time. You cannot use
        # GetMembers to retrieve information about member accounts that were removed from the behavior graph.

        @[JSON::Field(key: "AccountIds")]
        getter account_ids : Array(String)

        # The ARN of the behavior graph for which to request the member details.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String

        def initialize(
          @account_ids : Array(String),
          @graph_arn : String
        )
        end
      end


      struct GetMembersResponse
        include JSON::Serializable

        # The member account details that Detective is returning in response to the request.

        @[JSON::Field(key: "MemberDetails")]
        getter member_details : Array(Types::MemberDetail)?

        # The requested member accounts for which Detective was unable to return member details. For each
        # account, provides the reason why the request could not be processed.

        @[JSON::Field(key: "UnprocessedAccounts")]
        getter unprocessed_accounts : Array(Types::UnprocessedAccount)?

        def initialize(
          @member_details : Array(Types::MemberDetail)? = nil,
          @unprocessed_accounts : Array(Types::UnprocessedAccount)? = nil
        )
        end
      end

      # A behavior graph in Detective.

      struct Graph
        include JSON::Serializable

        # The ARN of the behavior graph.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the behavior graph was created. The value is an ISO8601 formatted string. For
        # example, 2021-08-18T16:35:56.284Z .

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        def initialize(
          @arn : String? = nil,
          @created_time : Time? = nil
        )
        end
      end

      # Contains information on unusual and impossible travel in an account.

      struct ImpossibleTravelDetail
        include JSON::Serializable

        # IP address where the resource was last used in the impossible travel.

        @[JSON::Field(key: "EndingIpAddress")]
        getter ending_ip_address : String?

        # Location where the resource was last used in the impossible travel.

        @[JSON::Field(key: "EndingLocation")]
        getter ending_location : String?

        # Returns the time difference between the first and last timestamp the resource was used.

        @[JSON::Field(key: "HourlyTimeDelta")]
        getter hourly_time_delta : Int32?

        # IP address where the resource was first used in the impossible travel.

        @[JSON::Field(key: "StartingIpAddress")]
        getter starting_ip_address : String?

        # Location where the resource was first used in the impossible travel.

        @[JSON::Field(key: "StartingLocation")]
        getter starting_location : String?

        def initialize(
          @ending_ip_address : String? = nil,
          @ending_location : String? = nil,
          @hourly_time_delta : Int32? = nil,
          @starting_ip_address : String? = nil,
          @starting_location : String? = nil
        )
        end
      end

      # Detective investigations triages indicators of compromises such as a finding and surfaces only the
      # most critical and suspicious issues, so you can focus on high-level investigations. An Indicator
      # lets you determine if an Amazon Web Services resource is involved in unusual activity that could
      # indicate malicious behavior and its impact.

      struct Indicator
        include JSON::Serializable

        # Details about the indicators of compromise that are used to determine if a resource is involved in a
        # security incident. An indicator of compromise (IOC) is an artifact observed in or on a network,
        # system, or environment that can (with a high level of confidence) identify malicious activity or a
        # security incident.

        @[JSON::Field(key: "IndicatorDetail")]
        getter indicator_detail : Types::IndicatorDetail?

        # The type of indicator.

        @[JSON::Field(key: "IndicatorType")]
        getter indicator_type : String?

        def initialize(
          @indicator_detail : Types::IndicatorDetail? = nil,
          @indicator_type : String? = nil
        )
        end
      end

      # Details about the indicators of compromise which are used to determine if a resource is involved in
      # a security incident. An indicator of compromise (IOC) is an artifact observed in or on a network,
      # system, or environment that can (with a high level of confidence) identify malicious activity or a
      # security incident. For the list of indicators of compromise that are generated by Detective
      # investigations, see Detective investigations .

      struct IndicatorDetail
        include JSON::Serializable

        # Suspicious IP addresses that are flagged, which indicates critical or severe threats based on threat
        # intelligence by Detective. This indicator is derived from Amazon Web Services threat intelligence.

        @[JSON::Field(key: "FlaggedIpAddressDetail")]
        getter flagged_ip_address_detail : Types::FlaggedIpAddressDetail?

        # Identifies unusual and impossible user activity for an account.

        @[JSON::Field(key: "ImpossibleTravelDetail")]
        getter impossible_travel_detail : Types::ImpossibleTravelDetail?

        # Contains details about the new Autonomous System Organization (ASO).

        @[JSON::Field(key: "NewAsoDetail")]
        getter new_aso_detail : Types::NewAsoDetail?

        # Contains details about the new geographic location.

        @[JSON::Field(key: "NewGeolocationDetail")]
        getter new_geolocation_detail : Types::NewGeolocationDetail?

        # Contains details about the new user agent.

        @[JSON::Field(key: "NewUserAgentDetail")]
        getter new_user_agent_detail : Types::NewUserAgentDetail?

        # Contains details about related findings.

        @[JSON::Field(key: "RelatedFindingDetail")]
        getter related_finding_detail : Types::RelatedFindingDetail?

        # Contains details about related finding groups.

        @[JSON::Field(key: "RelatedFindingGroupDetail")]
        getter related_finding_group_detail : Types::RelatedFindingGroupDetail?

        # Details about the indicator of compromise.

        @[JSON::Field(key: "TTPsObservedDetail")]
        getter tt_ps_observed_detail : Types::TTPsObservedDetail?

        def initialize(
          @flagged_ip_address_detail : Types::FlaggedIpAddressDetail? = nil,
          @impossible_travel_detail : Types::ImpossibleTravelDetail? = nil,
          @new_aso_detail : Types::NewAsoDetail? = nil,
          @new_geolocation_detail : Types::NewGeolocationDetail? = nil,
          @new_user_agent_detail : Types::NewUserAgentDetail? = nil,
          @related_finding_detail : Types::RelatedFindingDetail? = nil,
          @related_finding_group_detail : Types::RelatedFindingGroupDetail? = nil,
          @tt_ps_observed_detail : Types::TTPsObservedDetail? = nil
        )
        end
      end

      # The request was valid but failed because of a problem with the service.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Details about the investigation related to a potential security event identified by Detective.

      struct InvestigationDetail
        include JSON::Serializable

        # The time stamp of the creation time of the investigation report. The value is an UTC ISO8601
        # formatted string. For example, 2021-08-18T16:35:56.284Z .

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The unique Amazon Resource Name (ARN) of the IAM user and IAM role.

        @[JSON::Field(key: "EntityArn")]
        getter entity_arn : String?

        # Type of entity. For example, Amazon Web Services accounts, such as IAM user and role.

        @[JSON::Field(key: "EntityType")]
        getter entity_type : String?

        # The investigation ID of the investigation report.

        @[JSON::Field(key: "InvestigationId")]
        getter investigation_id : String?

        # Severity based on the likelihood and impact of the indicators of compromise discovered in the
        # investigation.

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # The current state of the investigation. An archived investigation indicates you have completed
        # reviewing the investigation.

        @[JSON::Field(key: "State")]
        getter state : String?

        # Status based on the completion status of the investigation.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @created_time : Time? = nil,
          @entity_arn : String? = nil,
          @entity_type : String? = nil,
          @investigation_id : String? = nil,
          @severity : String? = nil,
          @state : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListDatasourcePackagesRequest
        include JSON::Serializable

        # The ARN of the behavior graph.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String

        # The maximum number of results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For requests to get the next page of results, the pagination token that was returned with the
        # previous set of results. The initial request does not include a pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @graph_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDatasourcePackagesResponse
        include JSON::Serializable

        # Details on the data source packages active in the behavior graph.

        @[JSON::Field(key: "DatasourcePackages")]
        getter datasource_packages : Hash(String, Types::DatasourcePackageIngestDetail)?

        # For requests to get the next page of results, the pagination token that was returned with the
        # previous set of results. The initial request does not include a pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @datasource_packages : Hash(String, Types::DatasourcePackageIngestDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGraphsRequest
        include JSON::Serializable

        # The maximum number of graphs to return at a time. The total must be less than the overall limit on
        # the number of results to return, which is currently 200.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For requests to get the next page of results, the pagination token that was returned with the
        # previous set of results. The initial request does not include a pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGraphsResponse
        include JSON::Serializable

        # A list of behavior graphs that the account is an administrator account for.

        @[JSON::Field(key: "GraphList")]
        getter graph_list : Array(Types::Graph)?

        # If there are more behavior graphs remaining in the results, then this is the pagination token to use
        # to request the next page of behavior graphs.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @graph_list : Array(Types::Graph)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIndicatorsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the behavior graph.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String

        # The investigation ID of the investigation report.

        @[JSON::Field(key: "InvestigationId")]
        getter investigation_id : String

        # For the list of indicators of compromise that are generated by Detective investigations, see
        # Detective investigations .

        @[JSON::Field(key: "IndicatorType")]
        getter indicator_type : String?

        # Lists the maximum number of indicators in a page.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Lists if there are more results available. The value of nextToken is a unique pagination token for
        # each page. Repeat the call using the returned token to retrieve the next page. Keep all other
        # arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token
        # will return a Validation Exception error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @graph_arn : String,
          @investigation_id : String,
          @indicator_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListIndicatorsResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the behavior graph.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String?

        # Lists the indicators of compromise.

        @[JSON::Field(key: "Indicators")]
        getter indicators : Array(Types::Indicator)?

        # The investigation ID of the investigation report.

        @[JSON::Field(key: "InvestigationId")]
        getter investigation_id : String?

        # Lists if there are more results available. The value of nextToken is a unique pagination token for
        # each page. Repeat the call using the returned token to retrieve the next page. Keep all other
        # arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token
        # will return a Validation Exception error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @graph_arn : String? = nil,
          @indicators : Array(Types::Indicator)? = nil,
          @investigation_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInvestigationsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the behavior graph.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String

        # Filters the investigation results based on a criteria.

        @[JSON::Field(key: "FilterCriteria")]
        getter filter_criteria : Types::FilterCriteria?

        # Lists the maximum number of investigations in a page.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Lists if there are more results available. The value of nextToken is a unique pagination token for
        # each page. Repeat the call using the returned token to retrieve the next page. Keep all other
        # arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token
        # will return a Validation Exception error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Sorts the investigation results based on a criteria.

        @[JSON::Field(key: "SortCriteria")]
        getter sort_criteria : Types::SortCriteria?

        def initialize(
          @graph_arn : String,
          @filter_criteria : Types::FilterCriteria? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort_criteria : Types::SortCriteria? = nil
        )
        end
      end


      struct ListInvestigationsResponse
        include JSON::Serializable

        # Lists the summary of uncommon behavior or malicious activity which indicates a compromise.

        @[JSON::Field(key: "InvestigationDetails")]
        getter investigation_details : Array(Types::InvestigationDetail)?

        # Lists if there are more results available. The value of nextToken is a unique pagination token for
        # each page. Repeat the call using the returned token to retrieve the next page. Keep all other
        # arguments unchanged. Each pagination token expires after 24 hours.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @investigation_details : Array(Types::InvestigationDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInvitationsRequest
        include JSON::Serializable

        # The maximum number of behavior graph invitations to return in the response. The total must be less
        # than the overall limit on the number of results to return, which is currently 200.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For requests to retrieve the next page of results, the pagination token that was returned with the
        # previous page of results. The initial request does not include a pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListInvitationsResponse
        include JSON::Serializable

        # The list of behavior graphs for which the member account has open or accepted invitations.

        @[JSON::Field(key: "Invitations")]
        getter invitations : Array(Types::MemberDetail)?

        # If there are more behavior graphs remaining in the results, then this is the pagination token to use
        # to request the next page of behavior graphs.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @invitations : Array(Types::MemberDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMembersRequest
        include JSON::Serializable

        # The ARN of the behavior graph for which to retrieve the list of member accounts.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String

        # The maximum number of member accounts to include in the response. The total must be less than the
        # overall limit on the number of results to return, which is currently 200.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For requests to retrieve the next page of member account results, the pagination token that was
        # returned with the previous page of results. The initial request does not include a pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @graph_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMembersResponse
        include JSON::Serializable

        # The list of member accounts in the behavior graph. For invited accounts, the results include member
        # accounts that did not pass verification and member accounts that have not yet accepted the
        # invitation to the behavior graph. The results do not include member accounts that were removed from
        # the behavior graph. For the organization behavior graph, the results do not include organization
        # accounts that the Detective administrator account has not enabled as member accounts.

        @[JSON::Field(key: "MemberDetails")]
        getter member_details : Array(Types::MemberDetail)?

        # If there are more member accounts remaining in the results, then use this pagination token to
        # request the next page of member accounts.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @member_details : Array(Types::MemberDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOrganizationAdminAccountsRequest
        include JSON::Serializable

        # The maximum number of results to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # For requests to get the next page of results, the pagination token that was returned with the
        # previous set of results. The initial request does not include a pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListOrganizationAdminAccountsResponse
        include JSON::Serializable

        # The list of Detective administrator accounts.

        @[JSON::Field(key: "Administrators")]
        getter administrators : Array(Types::Administrator)?

        # If there are more accounts remaining in the results, then this is the pagination token to use to
        # request the next page of accounts.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @administrators : Array(Types::Administrator)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the behavior graph for which to retrieve the tag values.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tag values that are assigned to the behavior graph. The request returns up to 50 tag values.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Details about a member account in a behavior graph.

      struct MemberDetail
        include JSON::Serializable

        # The Amazon Web Services account identifier for the member account.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The Amazon Web Services account identifier of the administrator account for the behavior graph.

        @[JSON::Field(key: "AdministratorId")]
        getter administrator_id : String?

        # The state of a data source package for the behavior graph.

        @[JSON::Field(key: "DatasourcePackageIngestStates")]
        getter datasource_package_ingest_states : Hash(String, String)?

        # For member accounts with a status of ACCEPTED_BUT_DISABLED , the reason that the member account is
        # not enabled. The reason can have one of the following values: VOLUME_TOO_HIGH - Indicates that
        # adding the member account would cause the data volume for the behavior graph to be too high.
        # VOLUME_UNKNOWN - Indicates that Detective is unable to verify the data volume for the member
        # account. This is usually because the member account is not enrolled in Amazon GuardDuty.

        @[JSON::Field(key: "DisabledReason")]
        getter disabled_reason : String?

        # The Amazon Web Services account root user email address for the member account.

        @[JSON::Field(key: "EmailAddress")]
        getter email_address : String?

        # The ARN of the behavior graph.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String?

        # The type of behavior graph membership. For an organization account in the organization behavior
        # graph, the type is ORGANIZATION . For an account that was invited to a behavior graph, the type is
        # INVITATION .

        @[JSON::Field(key: "InvitationType")]
        getter invitation_type : String?

        # For invited accounts, the date and time that Detective sent the invitation to the account. The value
        # is an ISO8601 formatted string. For example, 2021-08-18T16:35:56.284Z .

        @[JSON::Field(key: "InvitedTime")]
        getter invited_time : Time?

        # The Amazon Web Services account identifier of the administrator account for the behavior graph.

        @[JSON::Field(key: "MasterId")]
        getter master_id : String?

        # The member account data volume as a percentage of the maximum allowed data volume. 0 indicates 0
        # percent, and 100 indicates 100 percent. Note that this is not the percentage of the behavior graph
        # data volume. For example, the data volume for the behavior graph is 80 GB per day. The maximum data
        # volume is 160 GB per day. If the data volume for the member account is 40 GB per day, then
        # PercentOfGraphUtilization is 25. It represents 25% of the maximum allowed data volume.

        @[JSON::Field(key: "PercentOfGraphUtilization")]
        getter percent_of_graph_utilization : Float64?

        # The date and time when the graph utilization percentage was last updated. The value is an ISO8601
        # formatted string. For example, 2021-08-18T16:35:56.284Z .

        @[JSON::Field(key: "PercentOfGraphUtilizationUpdatedTime")]
        getter percent_of_graph_utilization_updated_time : Time?

        # The current membership status of the member account. The status can have one of the following
        # values: INVITED - For invited accounts only. Indicates that the member was sent an invitation but
        # has not yet responded. VERIFICATION_IN_PROGRESS - For invited accounts only, indicates that
        # Detective is verifying that the account identifier and email address provided for the member account
        # match. If they do match, then Detective sends the invitation. If the email address and account
        # identifier don't match, then the member cannot be added to the behavior graph. For organization
        # accounts in the organization behavior graph, indicates that Detective is verifying that the account
        # belongs to the organization. VERIFICATION_FAILED - For invited accounts only. Indicates that the
        # account and email address provided for the member account do not match, and Detective did not send
        # an invitation to the account. ENABLED - Indicates that the member account currently contributes data
        # to the behavior graph. For invited accounts, the member account accepted the invitation. For
        # organization accounts in the organization behavior graph, the Detective administrator account
        # enabled the organization account as a member account. ACCEPTED_BUT_DISABLED - The account accepted
        # the invitation, or was enabled by the Detective administrator account, but is prevented from
        # contributing data to the behavior graph. DisabledReason provides the reason why the member account
        # is not enabled. Invited accounts that declined an invitation or that were removed from the behavior
        # graph are not included. In the organization behavior graph, organization accounts that the Detective
        # administrator account did not enable are not included.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The date and time that the member account was last updated. The value is an ISO8601 formatted
        # string. For example, 2021-08-18T16:35:56.284Z .

        @[JSON::Field(key: "UpdatedTime")]
        getter updated_time : Time?

        # Details on the volume of usage for each data source package in a behavior graph.

        @[JSON::Field(key: "VolumeUsageByDatasourcePackage")]
        getter volume_usage_by_datasource_package : Hash(String, Types::DatasourcePackageUsageInfo)?

        # The data volume in bytes per day for the member account.

        @[JSON::Field(key: "VolumeUsageInBytes")]
        getter volume_usage_in_bytes : Int64?

        # The data and time when the member account data volume was last updated. The value is an ISO8601
        # formatted string. For example, 2021-08-18T16:35:56.284Z .

        @[JSON::Field(key: "VolumeUsageUpdatedTime")]
        getter volume_usage_updated_time : Time?

        def initialize(
          @account_id : String? = nil,
          @administrator_id : String? = nil,
          @datasource_package_ingest_states : Hash(String, String)? = nil,
          @disabled_reason : String? = nil,
          @email_address : String? = nil,
          @graph_arn : String? = nil,
          @invitation_type : String? = nil,
          @invited_time : Time? = nil,
          @master_id : String? = nil,
          @percent_of_graph_utilization : Float64? = nil,
          @percent_of_graph_utilization_updated_time : Time? = nil,
          @status : String? = nil,
          @updated_time : Time? = nil,
          @volume_usage_by_datasource_package : Hash(String, Types::DatasourcePackageUsageInfo)? = nil,
          @volume_usage_in_bytes : Int64? = nil,
          @volume_usage_updated_time : Time? = nil
        )
        end
      end

      # Details on data source packages for members of the behavior graph.

      struct MembershipDatasources
        include JSON::Serializable

        # The account identifier of the Amazon Web Services account.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # Details on when a data source package was added to a behavior graph.

        @[JSON::Field(key: "DatasourcePackageIngestHistory")]
        getter datasource_package_ingest_history : Hash(String, Hash(String, Types::TimestampForCollection))?

        # The ARN of the organization behavior graph.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String?

        def initialize(
          @account_id : String? = nil,
          @datasource_package_ingest_history : Hash(String, Hash(String, Types::TimestampForCollection))? = nil,
          @graph_arn : String? = nil
        )
        end
      end

      # Details new Autonomous System Organizations (ASOs) used either at the resource or account level.

      struct NewAsoDetail
        include JSON::Serializable

        # Details about the new Autonomous System Organization (ASO).

        @[JSON::Field(key: "Aso")]
        getter aso : String?

        # Checks if the Autonomous System Organization (ASO) is new for the entire account.

        @[JSON::Field(key: "IsNewForEntireAccount")]
        getter is_new_for_entire_account : Bool?

        def initialize(
          @aso : String? = nil,
          @is_new_for_entire_account : Bool? = nil
        )
        end
      end

      # Details new geolocations used either at the resource or account level. For example, lists an
      # observed geolocation that is an infrequent or unused location based on previous user activity.

      struct NewGeolocationDetail
        include JSON::Serializable

        # IP address using which the resource was accessed.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # Checks if the geolocation is new for the entire account.

        @[JSON::Field(key: "IsNewForEntireAccount")]
        getter is_new_for_entire_account : Bool?

        # Location where the resource was accessed.

        @[JSON::Field(key: "Location")]
        getter location : String?

        def initialize(
          @ip_address : String? = nil,
          @is_new_for_entire_account : Bool? = nil,
          @location : String? = nil
        )
        end
      end

      # Details new user agents used either at the resource or account level.

      struct NewUserAgentDetail
        include JSON::Serializable

        # Checks if the user agent is new for the entire account.

        @[JSON::Field(key: "IsNewForEntireAccount")]
        getter is_new_for_entire_account : Bool?

        # New user agent which accessed the resource.

        @[JSON::Field(key: "UserAgent")]
        getter user_agent : String?

        def initialize(
          @is_new_for_entire_account : Bool? = nil,
          @user_agent : String? = nil
        )
        end
      end


      struct RejectInvitationRequest
        include JSON::Serializable

        # The ARN of the behavior graph to reject the invitation to. The member account's current member
        # status in the behavior graph must be INVITED .

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String

        def initialize(
          @graph_arn : String
        )
        end
      end

      # Details related activities associated with a potential security event. Lists all distinct categories
      # of evidence that are connected to the resource or the finding group.

      struct RelatedFindingDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the related finding.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The IP address of the finding.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # The type of finding.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @arn : String? = nil,
          @ip_address : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Details multiple activities as they related to a potential security event. Detective uses graph
      # analysis technique that infers relationships between findings and entities, and groups them together
      # as a finding group.

      struct RelatedFindingGroupDetail
        include JSON::Serializable

        # The unique identifier for the finding group.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      # The request refers to a nonexistent resource.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This request cannot be completed for one of the following reasons. This request cannot be completed
      # if it would cause the number of member accounts in the behavior graph to exceed the maximum allowed.
      # A behavior graph cannot have more than 1,200 member accounts. This request cannot be completed if
      # the current volume ingested is above the limit of 10 TB per day. Detective will not allow you to add
      # additional member accounts.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The type of resource that has exceeded the service quota.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(String)?

        def initialize(
          @message : String? = nil,
          @resources : Array(String)? = nil
        )
        end
      end

      # Details about the criteria used for sorting investigations.

      struct SortCriteria
        include JSON::Serializable

        # Represents the Field attribute to sort investigations.

        @[JSON::Field(key: "Field")]
        getter field : String?

        # The order by which the sorted findings are displayed.

        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        def initialize(
          @field : String? = nil,
          @sort_order : String? = nil
        )
        end
      end


      struct StartInvestigationRequest
        include JSON::Serializable

        # The unique Amazon Resource Name (ARN) of the IAM user and IAM role.

        @[JSON::Field(key: "EntityArn")]
        getter entity_arn : String

        # The Amazon Resource Name (ARN) of the behavior graph.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String

        # The data and time when the investigation ended. The value is an UTC ISO8601 formatted string. For
        # example, 2021-08-18T16:35:56.284Z .

        @[JSON::Field(key: "ScopeEndTime")]
        getter scope_end_time : Time

        # The data and time when the investigation began. The value is an UTC ISO8601 formatted string. For
        # example, 2021-08-18T16:35:56.284Z .

        @[JSON::Field(key: "ScopeStartTime")]
        getter scope_start_time : Time

        def initialize(
          @entity_arn : String,
          @graph_arn : String,
          @scope_end_time : Time,
          @scope_start_time : Time
        )
        end
      end


      struct StartInvestigationResponse
        include JSON::Serializable

        # The investigation ID of the investigation report.

        @[JSON::Field(key: "InvestigationId")]
        getter investigation_id : String?

        def initialize(
          @investigation_id : String? = nil
        )
        end
      end


      struct StartMonitoringMemberRequest
        include JSON::Serializable

        # The account ID of the member account to try to enable. The account must be an invited member account
        # with a status of ACCEPTED_BUT_DISABLED .

        @[JSON::Field(key: "AccountId")]
        getter account_id : String

        # The ARN of the behavior graph.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String

        def initialize(
          @account_id : String,
          @graph_arn : String
        )
        end
      end

      # A string for filtering Detective investigations.

      struct StringFilter
        include JSON::Serializable

        # The string filter value.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @value : String
        )
        end
      end

      # Details tactics, techniques, and procedures (TTPs) used in a potential security event. Tactics are
      # based on MITRE ATT&amp;CK Matrix for Enterprise .

      struct TTPsObservedDetail
        include JSON::Serializable

        # The total number of failed API requests.

        @[JSON::Field(key: "APIFailureCount")]
        getter api_failure_count : Int64?

        # The name of the API where the tactics, techniques, and procedure (TTP) was observed.

        @[JSON::Field(key: "APIName")]
        getter api_name : String?

        # The total number of successful API requests.

        @[JSON::Field(key: "APISuccessCount")]
        getter api_success_count : Int64?

        # The IP address where the tactics, techniques, and procedure (TTP) was observed.

        @[JSON::Field(key: "IpAddress")]
        getter ip_address : String?

        # The procedure used, identified by the investigation.

        @[JSON::Field(key: "Procedure")]
        getter procedure : String?

        # The tactic used, identified by the investigation.

        @[JSON::Field(key: "Tactic")]
        getter tactic : String?

        # The technique used, identified by the investigation.

        @[JSON::Field(key: "Technique")]
        getter technique : String?

        def initialize(
          @api_failure_count : Int64? = nil,
          @api_name : String? = nil,
          @api_success_count : Int64? = nil,
          @ip_address : String? = nil,
          @procedure : String? = nil,
          @tactic : String? = nil,
          @technique : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the behavior graph to assign the tags to.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags to assign to the behavior graph. You can add up to 50 tags. For each tag, you provide the
        # tag key and the tag value. Each tag key can contain up to 128 characters. Each tag value can contain
        # up to 256 characters.

        @[JSON::Field(key: "Tags")]
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

      # Details on when data collection began for a source package.

      struct TimestampForCollection
        include JSON::Serializable

        # The data and time when data collection began for a source package. The value is an ISO8601 formatted
        # string. For example, 2021-08-18T16:35:56.284Z .

        @[JSON::Field(key: "Timestamp")]
        getter timestamp : Time?

        def initialize(
          @timestamp : Time? = nil
        )
        end
      end

      # The request cannot be completed because too many other requests are occurring at the same time.

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A member account that was included in a request but for which the request could not be processed.

      struct UnprocessedAccount
        include JSON::Serializable

        # The Amazon Web Services account identifier of the member account that was not processed.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The reason that the member account request could not be processed.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @account_id : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Behavior graphs that could not be processed in the request.

      struct UnprocessedGraph
        include JSON::Serializable

        # The ARN of the organization behavior graph.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String?

        # The reason data source package information could not be processed for a behavior graph.

        @[JSON::Field(key: "Reason")]
        getter reason : String?

        def initialize(
          @graph_arn : String? = nil,
          @reason : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the behavior graph to remove the tags from.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tag keys of the tags to remove from the behavior graph. You can remove up to 50 tags at a time.

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


      struct UpdateDatasourcePackagesRequest
        include JSON::Serializable

        # The data source package to start for the behavior graph.

        @[JSON::Field(key: "DatasourcePackages")]
        getter datasource_packages : Array(String)

        # The ARN of the behavior graph.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String

        def initialize(
          @datasource_packages : Array(String),
          @graph_arn : String
        )
        end
      end


      struct UpdateInvestigationStateRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the behavior graph.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String

        # The investigation ID of the investigation report.

        @[JSON::Field(key: "InvestigationId")]
        getter investigation_id : String

        # The current state of the investigation. An archived investigation indicates you have completed
        # reviewing the investigation.

        @[JSON::Field(key: "State")]
        getter state : String

        def initialize(
          @graph_arn : String,
          @investigation_id : String,
          @state : String
        )
        end
      end


      struct UpdateOrganizationConfigurationRequest
        include JSON::Serializable

        # The ARN of the organization behavior graph.

        @[JSON::Field(key: "GraphArn")]
        getter graph_arn : String

        # Indicates whether to automatically enable new organization accounts as member accounts in the
        # organization behavior graph.

        @[JSON::Field(key: "AutoEnable")]
        getter auto_enable : Bool?

        def initialize(
          @graph_arn : String,
          @auto_enable : Bool? = nil
        )
        end
      end

      # The request parameters are invalid.

      struct ValidationException
        include JSON::Serializable

        # The error code associated with the validation failure.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # An explanation of why validation failed.

        @[JSON::Field(key: "ErrorCodeReason")]
        getter error_code_reason : String?


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @error_code : String? = nil,
          @error_code_reason : String? = nil,
          @message : String? = nil
        )
        end
      end
    end
  end
end
