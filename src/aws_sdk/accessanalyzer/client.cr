module AwsSdk
  module AccessAnalyzer
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

      # Retroactively applies the archive rule to existing findings that meet the archive rule criteria.

      def apply_archive_rule(
        analyzer_arn : String,
        rule_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::ApplyArchiveRuleRequest.new(analyzer_arn: analyzer_arn, rule_name: rule_name, client_token: client_token)
        apply_archive_rule(input)
      end

      def apply_archive_rule(input : Types::ApplyArchiveRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::APPLY_ARCHIVE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels the requested policy generation.

      def cancel_policy_generation(
        job_id : String
      ) : Protocol::Request
        input = Types::CancelPolicyGenerationRequest.new(job_id: job_id)
        cancel_policy_generation(input)
      end

      def cancel_policy_generation(input : Types::CancelPolicyGenerationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_POLICY_GENERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Checks whether the specified access isn't allowed by a policy.

      def check_access_not_granted(
        access : Array(Types::Access),
        policy_document : String,
        policy_type : String
      ) : Protocol::Request
        input = Types::CheckAccessNotGrantedRequest.new(access: access, policy_document: policy_document, policy_type: policy_type)
        check_access_not_granted(input)
      end

      def check_access_not_granted(input : Types::CheckAccessNotGrantedRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CHECK_ACCESS_NOT_GRANTED, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Checks whether new access is allowed for an updated policy when compared to the existing policy. You
      # can find examples for reference policies and learn how to set up and run a custom policy check for
      # new access in the IAM Access Analyzer custom policy checks samples repository on GitHub. The
      # reference policies in this repository are meant to be passed to the existingPolicyDocument request
      # parameter.

      def check_no_new_access(
        existing_policy_document : String,
        new_policy_document : String,
        policy_type : String
      ) : Protocol::Request
        input = Types::CheckNoNewAccessRequest.new(existing_policy_document: existing_policy_document, new_policy_document: new_policy_document, policy_type: policy_type)
        check_no_new_access(input)
      end

      def check_no_new_access(input : Types::CheckNoNewAccessRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CHECK_NO_NEW_ACCESS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Checks whether a resource policy can grant public access to the specified resource type.

      def check_no_public_access(
        policy_document : String,
        resource_type : String
      ) : Protocol::Request
        input = Types::CheckNoPublicAccessRequest.new(policy_document: policy_document, resource_type: resource_type)
        check_no_public_access(input)
      end

      def check_no_public_access(input : Types::CheckNoPublicAccessRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CHECK_NO_PUBLIC_ACCESS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an access preview that allows you to preview IAM Access Analyzer findings for your resource
      # before deploying resource permissions.

      def create_access_preview(
        analyzer_arn : String,
        configurations : Hash(String, Types::Configuration),
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateAccessPreviewRequest.new(analyzer_arn: analyzer_arn, configurations: configurations, client_token: client_token)
        create_access_preview(input)
      end

      def create_access_preview(input : Types::CreateAccessPreviewRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ACCESS_PREVIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an analyzer for your account.

      def create_analyzer(
        analyzer_name : String,
        type : String,
        archive_rules : Array(Types::InlineArchiveRule)? = nil,
        client_token : String? = nil,
        configuration : Types::AnalyzerConfiguration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateAnalyzerRequest.new(analyzer_name: analyzer_name, type: type, archive_rules: archive_rules, client_token: client_token, configuration: configuration, tags: tags)
        create_analyzer(input)
      end

      def create_analyzer(input : Types::CreateAnalyzerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ANALYZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an archive rule for the specified analyzer. Archive rules automatically archive new findings
      # that meet the criteria you define when you create the rule. To learn about filter keys that you can
      # use to create an archive rule, see IAM Access Analyzer filter keys in the IAM User Guide .

      def create_archive_rule(
        analyzer_name : String,
        filter : Hash(String, Types::Criterion),
        rule_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::CreateArchiveRuleRequest.new(analyzer_name: analyzer_name, filter: filter, rule_name: rule_name, client_token: client_token)
        create_archive_rule(input)
      end

      def create_archive_rule(input : Types::CreateArchiveRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ARCHIVE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified analyzer. When you delete an analyzer, IAM Access Analyzer is disabled for the
      # account or organization in the current or specific Region. All findings that were generated by the
      # analyzer are deleted. You cannot undo this action.

      def delete_analyzer(
        analyzer_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteAnalyzerRequest.new(analyzer_name: analyzer_name, client_token: client_token)
        delete_analyzer(input)
      end

      def delete_analyzer(input : Types::DeleteAnalyzerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ANALYZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified archive rule.

      def delete_archive_rule(
        analyzer_name : String,
        rule_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteArchiveRuleRequest.new(analyzer_name: analyzer_name, rule_name: rule_name, client_token: client_token)
        delete_archive_rule(input)
      end

      def delete_archive_rule(input : Types::DeleteArchiveRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ARCHIVE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a recommendation for an unused permissions finding.

      def generate_finding_recommendation(
        analyzer_arn : String,
        id : String
      ) : Protocol::Request
        input = Types::GenerateFindingRecommendationRequest.new(analyzer_arn: analyzer_arn, id: id)
        generate_finding_recommendation(input)
      end

      def generate_finding_recommendation(input : Types::GenerateFindingRecommendationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GENERATE_FINDING_RECOMMENDATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an access preview for the specified analyzer.

      def get_access_preview(
        access_preview_id : String,
        analyzer_arn : String
      ) : Protocol::Request
        input = Types::GetAccessPreviewRequest.new(access_preview_id: access_preview_id, analyzer_arn: analyzer_arn)
        get_access_preview(input)
      end

      def get_access_preview(input : Types::GetAccessPreviewRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCESS_PREVIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a resource that was analyzed. This action is supported only for external
      # access analyzers.

      def get_analyzed_resource(
        analyzer_arn : String,
        resource_arn : String
      ) : Protocol::Request
        input = Types::GetAnalyzedResourceRequest.new(analyzer_arn: analyzer_arn, resource_arn: resource_arn)
        get_analyzed_resource(input)
      end

      def get_analyzed_resource(input : Types::GetAnalyzedResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ANALYZED_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the specified analyzer.

      def get_analyzer(
        analyzer_name : String
      ) : Protocol::Request
        input = Types::GetAnalyzerRequest.new(analyzer_name: analyzer_name)
        get_analyzer(input)
      end

      def get_analyzer(input : Types::GetAnalyzerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ANALYZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an archive rule. To learn about filter keys that you can use to create
      # an archive rule, see IAM Access Analyzer filter keys in the IAM User Guide .

      def get_archive_rule(
        analyzer_name : String,
        rule_name : String
      ) : Protocol::Request
        input = Types::GetArchiveRuleRequest.new(analyzer_name: analyzer_name, rule_name: rule_name)
        get_archive_rule(input)
      end

      def get_archive_rule(input : Types::GetArchiveRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ARCHIVE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the specified finding. GetFinding and GetFindingV2 both use
      # access-analyzer:GetFinding in the Action element of an IAM policy statement. You must have
      # permission to perform the access-analyzer:GetFinding action. GetFinding is supported only for
      # external access analyzers. You must use GetFindingV2 for internal and unused access analyzers.

      def get_finding(
        analyzer_arn : String,
        id : String
      ) : Protocol::Request
        input = Types::GetFindingRequest.new(analyzer_arn: analyzer_arn, id: id)
        get_finding(input)
      end

      def get_finding(input : Types::GetFindingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FINDING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a finding recommendation for the specified analyzer.

      def get_finding_recommendation(
        analyzer_arn : String,
        id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetFindingRecommendationRequest.new(analyzer_arn: analyzer_arn, id: id, max_results: max_results, next_token: next_token)
        get_finding_recommendation(input)
      end

      def get_finding_recommendation(input : Types::GetFindingRecommendationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FINDING_RECOMMENDATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the specified finding. GetFinding and GetFindingV2 both use
      # access-analyzer:GetFinding in the Action element of an IAM policy statement. You must have
      # permission to perform the access-analyzer:GetFinding action.

      def get_finding_v2(
        analyzer_arn : String,
        id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetFindingV2Request.new(analyzer_arn: analyzer_arn, id: id, max_results: max_results, next_token: next_token)
        get_finding_v2(input)
      end

      def get_finding_v2(input : Types::GetFindingV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FINDING_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of aggregated finding statistics for an external access or unused access analyzer.

      def get_findings_statistics(
        analyzer_arn : String
      ) : Protocol::Request
        input = Types::GetFindingsStatisticsRequest.new(analyzer_arn: analyzer_arn)
        get_findings_statistics(input)
      end

      def get_findings_statistics(input : Types::GetFindingsStatisticsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FINDINGS_STATISTICS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the policy that was generated using StartPolicyGeneration .

      def get_generated_policy(
        job_id : String,
        include_resource_placeholders : Bool? = nil,
        include_service_level_template : Bool? = nil
      ) : Protocol::Request
        input = Types::GetGeneratedPolicyRequest.new(job_id: job_id, include_resource_placeholders: include_resource_placeholders, include_service_level_template: include_service_level_template)
        get_generated_policy(input)
      end

      def get_generated_policy(input : Types::GetGeneratedPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GENERATED_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of access preview findings generated by the specified access preview.

      def list_access_preview_findings(
        access_preview_id : String,
        analyzer_arn : String,
        filter : Hash(String, Types::Criterion)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAccessPreviewFindingsRequest.new(access_preview_id: access_preview_id, analyzer_arn: analyzer_arn, filter: filter, max_results: max_results, next_token: next_token)
        list_access_preview_findings(input)
      end

      def list_access_preview_findings(input : Types::ListAccessPreviewFindingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACCESS_PREVIEW_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of access previews for the specified analyzer.

      def list_access_previews(
        analyzer_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAccessPreviewsRequest.new(analyzer_arn: analyzer_arn, max_results: max_results, next_token: next_token)
        list_access_previews(input)
      end

      def list_access_previews(input : Types::ListAccessPreviewsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ACCESS_PREVIEWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of resources of the specified type that have been analyzed by the specified
      # analyzer.

      def list_analyzed_resources(
        analyzer_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_type : String? = nil
      ) : Protocol::Request
        input = Types::ListAnalyzedResourcesRequest.new(analyzer_arn: analyzer_arn, max_results: max_results, next_token: next_token, resource_type: resource_type)
        list_analyzed_resources(input)
      end

      def list_analyzed_resources(input : Types::ListAnalyzedResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ANALYZED_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of analyzers.

      def list_analyzers(
        max_results : Int32? = nil,
        next_token : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::ListAnalyzersRequest.new(max_results: max_results, next_token: next_token, type: type)
        list_analyzers(input)
      end

      def list_analyzers(input : Types::ListAnalyzersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ANALYZERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of archive rules created for the specified analyzer.

      def list_archive_rules(
        analyzer_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListArchiveRulesRequest.new(analyzer_name: analyzer_name, max_results: max_results, next_token: next_token)
        list_archive_rules(input)
      end

      def list_archive_rules(input : Types::ListArchiveRulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ARCHIVE_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of findings generated by the specified analyzer. ListFindings and ListFindingsV2
      # both use access-analyzer:ListFindings in the Action element of an IAM policy statement. You must
      # have permission to perform the access-analyzer:ListFindings action. To learn about filter keys that
      # you can use to retrieve a list of findings, see IAM Access Analyzer filter keys in the IAM User
      # Guide . ListFindings is supported only for external access analyzers. You must use ListFindingsV2
      # for internal and unused access analyzers.

      def list_findings(
        analyzer_arn : String,
        filter : Hash(String, Types::Criterion)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort : Types::SortCriteria? = nil
      ) : Protocol::Request
        input = Types::ListFindingsRequest.new(analyzer_arn: analyzer_arn, filter: filter, max_results: max_results, next_token: next_token, sort: sort)
        list_findings(input)
      end

      def list_findings(input : Types::ListFindingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of findings generated by the specified analyzer. ListFindings and ListFindingsV2
      # both use access-analyzer:ListFindings in the Action element of an IAM policy statement. You must
      # have permission to perform the access-analyzer:ListFindings action. To learn about filter keys that
      # you can use to retrieve a list of findings, see IAM Access Analyzer filter keys in the IAM User
      # Guide .

      def list_findings_v2(
        analyzer_arn : String,
        filter : Hash(String, Types::Criterion)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        sort : Types::SortCriteria? = nil
      ) : Protocol::Request
        input = Types::ListFindingsV2Request.new(analyzer_arn: analyzer_arn, filter: filter, max_results: max_results, next_token: next_token, sort: sort)
        list_findings_v2(input)
      end

      def list_findings_v2(input : Types::ListFindingsV2Request) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FINDINGS_V2, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the policy generations requested in the last seven days.

      def list_policy_generations(
        max_results : Int32? = nil,
        next_token : String? = nil,
        principal_arn : String? = nil
      ) : Protocol::Request
        input = Types::ListPolicyGenerationsRequest.new(max_results: max_results, next_token: next_token, principal_arn: principal_arn)
        list_policy_generations(input)
      end

      def list_policy_generations(input : Types::ListPolicyGenerationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_POLICY_GENERATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of tags applied to the specified resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts the policy generation request.

      def start_policy_generation(
        policy_generation_details : Types::PolicyGenerationDetails,
        client_token : String? = nil,
        cloud_trail_details : Types::CloudTrailDetails? = nil
      ) : Protocol::Request
        input = Types::StartPolicyGenerationRequest.new(policy_generation_details: policy_generation_details, client_token: client_token, cloud_trail_details: cloud_trail_details)
        start_policy_generation(input)
      end

      def start_policy_generation(input : Types::StartPolicyGenerationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_POLICY_GENERATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Immediately starts a scan of the policies applied to the specified resource. This action is
      # supported only for external access analyzers.

      def start_resource_scan(
        analyzer_arn : String,
        resource_arn : String,
        resource_owner_account : String? = nil
      ) : Protocol::Request
        input = Types::StartResourceScanRequest.new(analyzer_arn: analyzer_arn, resource_arn: resource_arn, resource_owner_account: resource_owner_account)
        start_resource_scan(input)
      end

      def start_resource_scan(input : Types::StartResourceScanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_RESOURCE_SCAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a tag to the specified resource.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a tag from the specified resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Modifies the configuration of an existing analyzer. This action is not supported for external access
      # analyzers.

      def update_analyzer(
        analyzer_name : String,
        configuration : Types::AnalyzerConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateAnalyzerRequest.new(analyzer_name: analyzer_name, configuration: configuration)
        update_analyzer(input)
      end

      def update_analyzer(input : Types::UpdateAnalyzerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ANALYZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the criteria and values for the specified archive rule.

      def update_archive_rule(
        analyzer_name : String,
        filter : Hash(String, Types::Criterion),
        rule_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateArchiveRuleRequest.new(analyzer_name: analyzer_name, filter: filter, rule_name: rule_name, client_token: client_token)
        update_archive_rule(input)
      end

      def update_archive_rule(input : Types::UpdateArchiveRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ARCHIVE_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the status for the specified findings.

      def update_findings(
        analyzer_arn : String,
        status : String,
        client_token : String? = nil,
        ids : Array(String)? = nil,
        resource_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateFindingsRequest.new(analyzer_arn: analyzer_arn, status: status, client_token: client_token, ids: ids, resource_arn: resource_arn)
        update_findings(input)
      end

      def update_findings(input : Types::UpdateFindingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FINDINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Requests the validation of a policy and returns a list of findings. The findings help you identify
      # issues and provide actionable recommendations to resolve the issue and enable you to author
      # functional policies that meet security best practices.

      def validate_policy(
        policy_document : String,
        policy_type : String,
        locale : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        validate_policy_resource_type : String? = nil
      ) : Protocol::Request
        input = Types::ValidatePolicyRequest.new(policy_document: policy_document, policy_type: policy_type, locale: locale, max_results: max_results, next_token: next_token, validate_policy_resource_type: validate_policy_resource_type)
        validate_policy(input)
      end

      def validate_policy(input : Types::ValidatePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::VALIDATE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
