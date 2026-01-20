module Aws
  module WellArchitected
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
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Associate a lens to a workload. Up to 10 lenses can be associated with a workload in a single API
      # operation. A maximum of 20 lenses can be associated with a workload. Disclaimer By accessing and/or
      # applying custom lenses created by another Amazon Web Services user or account, you acknowledge that
      # custom lenses created by other users and shared with you are Third Party Content as defined in the
      # Amazon Web Services Customer Agreement.

      def associate_lenses(
        lens_aliases : Array(String),
        workload_id : String
      ) : Protocol::Request
        input = Types::AssociateLensesInput.new(lens_aliases: lens_aliases, workload_id: workload_id)
        associate_lenses(input)
      end

      def associate_lenses(input : Types::AssociateLensesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_LENSES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associate a profile with a workload.

      def associate_profiles(
        profile_arns : Array(String),
        workload_id : String
      ) : Protocol::Request
        input = Types::AssociateProfilesInput.new(profile_arns: profile_arns, workload_id: workload_id)
        associate_profiles(input)
      end

      def associate_profiles(input : Types::AssociateProfilesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a lens share. The owner of a lens can share it with other Amazon Web Services accounts,
      # users, an organization, and organizational units (OUs) in the same Amazon Web Services Region.
      # Lenses provided by Amazon Web Services (Amazon Web Services Official Content) cannot be shared.
      # Shared access to a lens is not removed until the lens invitation is deleted. If you share a lens
      # with an organization or OU, all accounts in the organization or OU are granted access to the lens.
      # For more information, see Sharing a custom lens in the Well-Architected Tool User Guide . Disclaimer
      # By sharing your custom lenses with other Amazon Web Services accounts, you acknowledge that Amazon
      # Web Services will make your custom lenses available to those other accounts. Those other accounts
      # may continue to access and use your shared custom lenses even if you delete the custom lenses from
      # your own Amazon Web Services account or terminate your Amazon Web Services account.

      def create_lens_share(
        client_request_token : String,
        lens_alias : String,
        shared_with : String
      ) : Protocol::Request
        input = Types::CreateLensShareInput.new(client_request_token: client_request_token, lens_alias: lens_alias, shared_with: shared_with)
        create_lens_share(input)
      end

      def create_lens_share(input : Types::CreateLensShareInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LENS_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a new lens version. A lens can have up to 100 versions. Use this operation to publish a new
      # lens version after you have imported a lens. The LensAlias is used to identify the lens to be
      # published. The owner of a lens can share the lens with other Amazon Web Services accounts and users
      # in the same Amazon Web Services Region. Only the owner of a lens can delete it.

      def create_lens_version(
        client_request_token : String,
        lens_alias : String,
        lens_version : String,
        is_major_version : Bool? = nil
      ) : Protocol::Request
        input = Types::CreateLensVersionInput.new(client_request_token: client_request_token, lens_alias: lens_alias, lens_version: lens_version, is_major_version: is_major_version)
        create_lens_version(input)
      end

      def create_lens_version(input : Types::CreateLensVersionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_LENS_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a milestone for an existing workload.

      def create_milestone(
        client_request_token : String,
        milestone_name : String,
        workload_id : String
      ) : Protocol::Request
        input = Types::CreateMilestoneInput.new(client_request_token: client_request_token, milestone_name: milestone_name, workload_id: workload_id)
        create_milestone(input)
      end

      def create_milestone(input : Types::CreateMilestoneInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MILESTONE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a profile.

      def create_profile(
        client_request_token : String,
        profile_description : String,
        profile_name : String,
        profile_questions : Array(Types::ProfileQuestionUpdate),
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateProfileInput.new(client_request_token: client_request_token, profile_description: profile_description, profile_name: profile_name, profile_questions: profile_questions, tags: tags)
        create_profile(input)
      end

      def create_profile(input : Types::CreateProfileInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a profile share.

      def create_profile_share(
        client_request_token : String,
        profile_arn : String,
        shared_with : String
      ) : Protocol::Request
        input = Types::CreateProfileShareInput.new(client_request_token: client_request_token, profile_arn: profile_arn, shared_with: shared_with)
        create_profile_share(input)
      end

      def create_profile_share(input : Types::CreateProfileShareInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROFILE_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a review template. Disclaimer Do not include or gather personal identifiable information
      # (PII) of end users or other identifiable individuals in or via your review templates. If your review
      # template or those shared with you and used in your account do include or collect PII you are
      # responsible for: ensuring that the included PII is processed in accordance with applicable law,
      # providing adequate privacy notices, and obtaining necessary consents for processing such data.

      def create_review_template(
        client_request_token : String,
        description : String,
        lenses : Array(String),
        template_name : String,
        notes : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateReviewTemplateInput.new(client_request_token: client_request_token, description: description, lenses: lenses, template_name: template_name, notes: notes, tags: tags)
        create_review_template(input)
      end

      def create_review_template(input : Types::CreateReviewTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_REVIEW_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a review template share. The owner of a review template can share it with other Amazon Web
      # Services accounts, users, an organization, and organizational units (OUs) in the same Amazon Web
      # Services Region. Shared access to a review template is not removed until the review template share
      # invitation is deleted. If you share a review template with an organization or OU, all accounts in
      # the organization or OU are granted access to the review template. Disclaimer By sharing your review
      # template with other Amazon Web Services accounts, you acknowledge that Amazon Web Services will make
      # your review template available to those other accounts.

      def create_template_share(
        client_request_token : String,
        shared_with : String,
        template_arn : String
      ) : Protocol::Request
        input = Types::CreateTemplateShareInput.new(client_request_token: client_request_token, shared_with: shared_with, template_arn: template_arn)
        create_template_share(input)
      end

      def create_template_share(input : Types::CreateTemplateShareInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TEMPLATE_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a new workload. The owner of a workload can share the workload with other Amazon Web Services
      # accounts, users, an organization, and organizational units (OUs) in the same Amazon Web Services
      # Region. Only the owner of a workload can delete it. For more information, see Defining a Workload in
      # the Well-Architected Tool User Guide . Either AwsRegions , NonAwsRegions , or both must be specified
      # when creating a workload. You also must specify ReviewOwner , even though the parameter is listed as
      # not being required in the following section. When creating a workload using a review template, you
      # must have the following IAM permissions: wellarchitected:GetReviewTemplate
      # wellarchitected:GetReviewTemplateAnswer wellarchitected:ListReviewTemplateAnswers
      # wellarchitected:GetReviewTemplateLensReview

      def create_workload(
        client_request_token : String,
        description : String,
        environment : String,
        lenses : Array(String),
        workload_name : String,
        account_ids : Array(String)? = nil,
        applications : Array(String)? = nil,
        architectural_design : String? = nil,
        aws_regions : Array(String)? = nil,
        discovery_config : Types::WorkloadDiscoveryConfig? = nil,
        industry : String? = nil,
        industry_type : String? = nil,
        jira_configuration : Types::WorkloadJiraConfigurationInput? = nil,
        non_aws_regions : Array(String)? = nil,
        notes : String? = nil,
        pillar_priorities : Array(String)? = nil,
        profile_arns : Array(String)? = nil,
        review_owner : String? = nil,
        review_template_arns : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateWorkloadInput.new(client_request_token: client_request_token, description: description, environment: environment, lenses: lenses, workload_name: workload_name, account_ids: account_ids, applications: applications, architectural_design: architectural_design, aws_regions: aws_regions, discovery_config: discovery_config, industry: industry, industry_type: industry_type, jira_configuration: jira_configuration, non_aws_regions: non_aws_regions, notes: notes, pillar_priorities: pillar_priorities, profile_arns: profile_arns, review_owner: review_owner, review_template_arns: review_template_arns, tags: tags)
        create_workload(input)
      end

      def create_workload(input : Types::CreateWorkloadInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKLOAD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a workload share. The owner of a workload can share it with other Amazon Web Services
      # accounts and users in the same Amazon Web Services Region. Shared access to a workload is not
      # removed until the workload invitation is deleted. If you share a workload with an organization or
      # OU, all accounts in the organization or OU are granted access to the workload. For more information,
      # see Sharing a workload in the Well-Architected Tool User Guide .

      def create_workload_share(
        client_request_token : String,
        permission_type : String,
        shared_with : String,
        workload_id : String
      ) : Protocol::Request
        input = Types::CreateWorkloadShareInput.new(client_request_token: client_request_token, permission_type: permission_type, shared_with: shared_with, workload_id: workload_id)
        create_workload_share(input)
      end

      def create_workload_share(input : Types::CreateWorkloadShareInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKLOAD_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an existing lens. Only the owner of a lens can delete it. After the lens is deleted, Amazon
      # Web Services accounts and users that you shared the lens with can continue to use it, but they will
      # no longer be able to apply it to new workloads. Disclaimer By sharing your custom lenses with other
      # Amazon Web Services accounts, you acknowledge that Amazon Web Services will make your custom lenses
      # available to those other accounts. Those other accounts may continue to access and use your shared
      # custom lenses even if you delete the custom lenses from your own Amazon Web Services account or
      # terminate your Amazon Web Services account.

      def delete_lens(
        client_request_token : String,
        lens_alias : String,
        lens_status : String
      ) : Protocol::Request
        input = Types::DeleteLensInput.new(client_request_token: client_request_token, lens_alias: lens_alias, lens_status: lens_status)
        delete_lens(input)
      end

      def delete_lens(input : Types::DeleteLensInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LENS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a lens share. After the lens share is deleted, Amazon Web Services accounts, users,
      # organizations, and organizational units (OUs) that you shared the lens with can continue to use it,
      # but they will no longer be able to apply it to new workloads. Disclaimer By sharing your custom
      # lenses with other Amazon Web Services accounts, you acknowledge that Amazon Web Services will make
      # your custom lenses available to those other accounts. Those other accounts may continue to access
      # and use your shared custom lenses even if you delete the custom lenses from your own Amazon Web
      # Services account or terminate your Amazon Web Services account.

      def delete_lens_share(
        client_request_token : String,
        lens_alias : String,
        share_id : String
      ) : Protocol::Request
        input = Types::DeleteLensShareInput.new(client_request_token: client_request_token, lens_alias: lens_alias, share_id: share_id)
        delete_lens_share(input)
      end

      def delete_lens_share(input : Types::DeleteLensShareInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_LENS_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a profile. Disclaimer By sharing your profile with other Amazon Web Services accounts, you
      # acknowledge that Amazon Web Services will make your profile available to those other accounts. Those
      # other accounts may continue to access and use your shared profile even if you delete the profile
      # from your own Amazon Web Services account or terminate your Amazon Web Services account.

      def delete_profile(
        client_request_token : String,
        profile_arn : String
      ) : Protocol::Request
        input = Types::DeleteProfileInput.new(client_request_token: client_request_token, profile_arn: profile_arn)
        delete_profile(input)
      end

      def delete_profile(input : Types::DeleteProfileInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a profile share.

      def delete_profile_share(
        client_request_token : String,
        profile_arn : String,
        share_id : String
      ) : Protocol::Request
        input = Types::DeleteProfileShareInput.new(client_request_token: client_request_token, profile_arn: profile_arn, share_id: share_id)
        delete_profile_share(input)
      end

      def delete_profile_share(input : Types::DeleteProfileShareInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROFILE_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a review template. Only the owner of a review template can delete it. After the review
      # template is deleted, Amazon Web Services accounts, users, organizations, and organizational units
      # (OUs) that you shared the review template with will no longer be able to apply it to new workloads.

      def delete_review_template(
        client_request_token : String,
        template_arn : String
      ) : Protocol::Request
        input = Types::DeleteReviewTemplateInput.new(client_request_token: client_request_token, template_arn: template_arn)
        delete_review_template(input)
      end

      def delete_review_template(input : Types::DeleteReviewTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_REVIEW_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a review template share. After the review template share is deleted, Amazon Web Services
      # accounts, users, organizations, and organizational units (OUs) that you shared the review template
      # with will no longer be able to apply it to new workloads.

      def delete_template_share(
        client_request_token : String,
        share_id : String,
        template_arn : String
      ) : Protocol::Request
        input = Types::DeleteTemplateShareInput.new(client_request_token: client_request_token, share_id: share_id, template_arn: template_arn)
        delete_template_share(input)
      end

      def delete_template_share(input : Types::DeleteTemplateShareInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TEMPLATE_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an existing workload.

      def delete_workload(
        client_request_token : String,
        workload_id : String
      ) : Protocol::Request
        input = Types::DeleteWorkloadInput.new(client_request_token: client_request_token, workload_id: workload_id)
        delete_workload(input)
      end

      def delete_workload(input : Types::DeleteWorkloadInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKLOAD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a workload share.

      def delete_workload_share(
        client_request_token : String,
        share_id : String,
        workload_id : String
      ) : Protocol::Request
        input = Types::DeleteWorkloadShareInput.new(client_request_token: client_request_token, share_id: share_id, workload_id: workload_id)
        delete_workload_share(input)
      end

      def delete_workload_share(input : Types::DeleteWorkloadShareInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKLOAD_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociate a lens from a workload. Up to 10 lenses can be disassociated from a workload in a
      # single API operation. The Amazon Web Services Well-Architected Framework lens ( wellarchitected )
      # cannot be removed from a workload.

      def disassociate_lenses(
        lens_aliases : Array(String),
        workload_id : String
      ) : Protocol::Request
        input = Types::DisassociateLensesInput.new(lens_aliases: lens_aliases, workload_id: workload_id)
        disassociate_lenses(input)
      end

      def disassociate_lenses(input : Types::DisassociateLensesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_LENSES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disassociate a profile from a workload.

      def disassociate_profiles(
        profile_arns : Array(String),
        workload_id : String
      ) : Protocol::Request
        input = Types::DisassociateProfilesInput.new(profile_arns: profile_arns, workload_id: workload_id)
        disassociate_profiles(input)
      end

      def disassociate_profiles(input : Types::DisassociateProfilesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Export an existing lens. Only the owner of a lens can export it. Lenses provided by Amazon Web
      # Services (Amazon Web Services Official Content) cannot be exported. Lenses are defined in JSON. For
      # more information, see JSON format specification in the Well-Architected Tool User Guide . Disclaimer
      # Do not include or gather personal identifiable information (PII) of end users or other identifiable
      # individuals in or via your custom lenses. If your custom lens or those shared with you and used in
      # your account do include or collect PII you are responsible for: ensuring that the included PII is
      # processed in accordance with applicable law, providing adequate privacy notices, and obtaining
      # necessary consents for processing such data.

      def export_lens(
        lens_alias : String,
        lens_version : String? = nil
      ) : Protocol::Request
        input = Types::ExportLensInput.new(lens_alias: lens_alias, lens_version: lens_version)
        export_lens(input)
      end

      def export_lens(input : Types::ExportLensInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXPORT_LENS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the answer to a specific question in a workload review.

      def get_answer(
        lens_alias : String,
        question_id : String,
        workload_id : String,
        milestone_number : Int32? = nil
      ) : Protocol::Request
        input = Types::GetAnswerInput.new(lens_alias: lens_alias, question_id: question_id, workload_id: workload_id, milestone_number: milestone_number)
        get_answer(input)
      end

      def get_answer(input : Types::GetAnswerInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ANSWER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a consolidated report of your workloads. You can optionally choose to include workloads that
      # have been shared with you.

      def get_consolidated_report(
        format : String,
        include_shared_resources : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetConsolidatedReportInput.new(format: format, include_shared_resources: include_shared_resources, max_results: max_results, next_token: next_token)
        get_consolidated_report(input)
      end

      def get_consolidated_report(input : Types::GetConsolidatedReportInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONSOLIDATED_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Global settings for all workloads.


      def get_global_settings : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GLOBAL_SETTINGS, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get an existing lens.

      def get_lens(
        lens_alias : String,
        lens_version : String? = nil
      ) : Protocol::Request
        input = Types::GetLensInput.new(lens_alias: lens_alias, lens_version: lens_version)
        get_lens(input)
      end

      def get_lens(input : Types::GetLensInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LENS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get lens review.

      def get_lens_review(
        lens_alias : String,
        workload_id : String,
        milestone_number : Int32? = nil
      ) : Protocol::Request
        input = Types::GetLensReviewInput.new(lens_alias: lens_alias, workload_id: workload_id, milestone_number: milestone_number)
        get_lens_review(input)
      end

      def get_lens_review(input : Types::GetLensReviewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LENS_REVIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get lens review report.

      def get_lens_review_report(
        lens_alias : String,
        workload_id : String,
        milestone_number : Int32? = nil
      ) : Protocol::Request
        input = Types::GetLensReviewReportInput.new(lens_alias: lens_alias, workload_id: workload_id, milestone_number: milestone_number)
        get_lens_review_report(input)
      end

      def get_lens_review_report(input : Types::GetLensReviewReportInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LENS_REVIEW_REPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get lens version differences.

      def get_lens_version_difference(
        lens_alias : String,
        base_lens_version : String? = nil,
        target_lens_version : String? = nil
      ) : Protocol::Request
        input = Types::GetLensVersionDifferenceInput.new(lens_alias: lens_alias, base_lens_version: base_lens_version, target_lens_version: target_lens_version)
        get_lens_version_difference(input)
      end

      def get_lens_version_difference(input : Types::GetLensVersionDifferenceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_LENS_VERSION_DIFFERENCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a milestone for an existing workload.

      def get_milestone(
        milestone_number : Int32,
        workload_id : String
      ) : Protocol::Request
        input = Types::GetMilestoneInput.new(milestone_number: milestone_number, workload_id: workload_id)
        get_milestone(input)
      end

      def get_milestone(input : Types::GetMilestoneInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MILESTONE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get profile information.

      def get_profile(
        profile_arn : String,
        profile_version : String? = nil
      ) : Protocol::Request
        input = Types::GetProfileInput.new(profile_arn: profile_arn, profile_version: profile_version)
        get_profile(input)
      end

      def get_profile(input : Types::GetProfileInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get profile template.

      def get_profile_template : Protocol::Request
        input = Types::GetProfileTemplateInput.new
        get_profile_template(input)
      end

      def get_profile_template(input : Types::GetProfileTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROFILE_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get review template.

      def get_review_template(
        template_arn : String
      ) : Protocol::Request
        input = Types::GetReviewTemplateInput.new(template_arn: template_arn)
        get_review_template(input)
      end

      def get_review_template(input : Types::GetReviewTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REVIEW_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get review template answer.

      def get_review_template_answer(
        lens_alias : String,
        question_id : String,
        template_arn : String
      ) : Protocol::Request
        input = Types::GetReviewTemplateAnswerInput.new(lens_alias: lens_alias, question_id: question_id, template_arn: template_arn)
        get_review_template_answer(input)
      end

      def get_review_template_answer(input : Types::GetReviewTemplateAnswerInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REVIEW_TEMPLATE_ANSWER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a lens review associated with a review template.

      def get_review_template_lens_review(
        lens_alias : String,
        template_arn : String
      ) : Protocol::Request
        input = Types::GetReviewTemplateLensReviewInput.new(lens_alias: lens_alias, template_arn: template_arn)
        get_review_template_lens_review(input)
      end

      def get_review_template_lens_review(input : Types::GetReviewTemplateLensReviewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REVIEW_TEMPLATE_LENS_REVIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get an existing workload.

      def get_workload(
        workload_id : String
      ) : Protocol::Request
        input = Types::GetWorkloadInput.new(workload_id: workload_id)
        get_workload(input)
      end

      def get_workload(input : Types::GetWorkloadInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKLOAD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Import a new custom lens or update an existing custom lens. To update an existing custom lens,
      # specify its ARN as the LensAlias . If no ARN is specified, a new custom lens is created. The new or
      # updated lens will have a status of DRAFT . The lens cannot be applied to workloads or shared with
      # other Amazon Web Services accounts until it's published with CreateLensVersion . Lenses are defined
      # in JSON. For more information, see JSON format specification in the Well-Architected Tool User Guide
      # . A custom lens cannot exceed 500 KB in size. Disclaimer Do not include or gather personal
      # identifiable information (PII) of end users or other identifiable individuals in or via your custom
      # lenses. If your custom lens or those shared with you and used in your account do include or collect
      # PII you are responsible for: ensuring that the included PII is processed in accordance with
      # applicable law, providing adequate privacy notices, and obtaining necessary consents for processing
      # such data.

      def import_lens(
        client_request_token : String,
        json_string : String,
        lens_alias : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::ImportLensInput.new(client_request_token: client_request_token, json_string: json_string, lens_alias: lens_alias, tags: tags)
        import_lens(input)
      end

      def import_lens(input : Types::ImportLensInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::IMPORT_LENS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List of answers for a particular workload and lens.

      def list_answers(
        lens_alias : String,
        workload_id : String,
        max_results : Int32? = nil,
        milestone_number : Int32? = nil,
        next_token : String? = nil,
        pillar_id : String? = nil,
        question_priority : String? = nil
      ) : Protocol::Request
        input = Types::ListAnswersInput.new(lens_alias: lens_alias, workload_id: workload_id, max_results: max_results, milestone_number: milestone_number, next_token: next_token, pillar_id: pillar_id, question_priority: question_priority)
        list_answers(input)
      end

      def list_answers(input : Types::ListAnswersInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ANSWERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List of Trusted Advisor check details by account related to the workload.

      def list_check_details(
        choice_id : String,
        lens_arn : String,
        pillar_id : String,
        question_id : String,
        workload_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCheckDetailsInput.new(choice_id: choice_id, lens_arn: lens_arn, pillar_id: pillar_id, question_id: question_id, workload_id: workload_id, max_results: max_results, next_token: next_token)
        list_check_details(input)
      end

      def list_check_details(input : Types::ListCheckDetailsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHECK_DETAILS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List of Trusted Advisor checks summarized for all accounts related to the workload.

      def list_check_summaries(
        choice_id : String,
        lens_arn : String,
        pillar_id : String,
        question_id : String,
        workload_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListCheckSummariesInput.new(choice_id: choice_id, lens_arn: lens_arn, pillar_id: pillar_id, question_id: question_id, workload_id: workload_id, max_results: max_results, next_token: next_token)
        list_check_summaries(input)
      end

      def list_check_summaries(input : Types::ListCheckSummariesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHECK_SUMMARIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the improvements of a particular lens review.

      def list_lens_review_improvements(
        lens_alias : String,
        workload_id : String,
        max_results : Int32? = nil,
        milestone_number : Int32? = nil,
        next_token : String? = nil,
        pillar_id : String? = nil,
        question_priority : String? = nil
      ) : Protocol::Request
        input = Types::ListLensReviewImprovementsInput.new(lens_alias: lens_alias, workload_id: workload_id, max_results: max_results, milestone_number: milestone_number, next_token: next_token, pillar_id: pillar_id, question_priority: question_priority)
        list_lens_review_improvements(input)
      end

      def list_lens_review_improvements(input : Types::ListLensReviewImprovementsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LENS_REVIEW_IMPROVEMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List lens reviews for a particular workload.

      def list_lens_reviews(
        workload_id : String,
        max_results : Int32? = nil,
        milestone_number : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLensReviewsInput.new(workload_id: workload_id, max_results: max_results, milestone_number: milestone_number, next_token: next_token)
        list_lens_reviews(input)
      end

      def list_lens_reviews(input : Types::ListLensReviewsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LENS_REVIEWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the lens shares associated with the lens.

      def list_lens_shares(
        lens_alias : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        shared_with_prefix : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListLensSharesInput.new(lens_alias: lens_alias, max_results: max_results, next_token: next_token, shared_with_prefix: shared_with_prefix, status: status)
        list_lens_shares(input)
      end

      def list_lens_shares(input : Types::ListLensSharesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LENS_SHARES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the available lenses.

      def list_lenses(
        lens_name : String? = nil,
        lens_status : String? = nil,
        lens_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListLensesInput.new(lens_name: lens_name, lens_status: lens_status, lens_type: lens_type, max_results: max_results, next_token: next_token)
        list_lenses(input)
      end

      def list_lenses(input : Types::ListLensesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_LENSES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all milestones for an existing workload.

      def list_milestones(
        workload_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMilestonesInput.new(workload_id: workload_id, max_results: max_results, next_token: next_token)
        list_milestones(input)
      end

      def list_milestones(input : Types::ListMilestonesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MILESTONES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List lens notifications.

      def list_notifications(
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource_arn : String? = nil,
        workload_id : String? = nil
      ) : Protocol::Request
        input = Types::ListNotificationsInput.new(max_results: max_results, next_token: next_token, resource_arn: resource_arn, workload_id: workload_id)
        list_notifications(input)
      end

      def list_notifications(input : Types::ListNotificationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_NOTIFICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List profile notifications.

      def list_profile_notifications(
        max_results : Int32? = nil,
        next_token : String? = nil,
        workload_id : String? = nil
      ) : Protocol::Request
        input = Types::ListProfileNotificationsInput.new(max_results: max_results, next_token: next_token, workload_id: workload_id)
        list_profile_notifications(input)
      end

      def list_profile_notifications(input : Types::ListProfileNotificationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROFILE_NOTIFICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List profile shares.

      def list_profile_shares(
        profile_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        shared_with_prefix : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListProfileSharesInput.new(profile_arn: profile_arn, max_results: max_results, next_token: next_token, shared_with_prefix: shared_with_prefix, status: status)
        list_profile_shares(input)
      end

      def list_profile_shares(input : Types::ListProfileSharesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROFILE_SHARES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List profiles.

      def list_profiles(
        max_results : Int32? = nil,
        next_token : String? = nil,
        profile_name_prefix : String? = nil,
        profile_owner_type : String? = nil
      ) : Protocol::Request
        input = Types::ListProfilesInput.new(max_results: max_results, next_token: next_token, profile_name_prefix: profile_name_prefix, profile_owner_type: profile_owner_type)
        list_profiles(input)
      end

      def list_profiles(input : Types::ListProfilesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the answers of a review template.

      def list_review_template_answers(
        lens_alias : String,
        template_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        pillar_id : String? = nil
      ) : Protocol::Request
        input = Types::ListReviewTemplateAnswersInput.new(lens_alias: lens_alias, template_arn: template_arn, max_results: max_results, next_token: next_token, pillar_id: pillar_id)
        list_review_template_answers(input)
      end

      def list_review_template_answers(input : Types::ListReviewTemplateAnswersInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REVIEW_TEMPLATE_ANSWERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List review templates.

      def list_review_templates(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListReviewTemplatesInput.new(max_results: max_results, next_token: next_token)
        list_review_templates(input)
      end

      def list_review_templates(input : Types::ListReviewTemplatesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REVIEW_TEMPLATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the share invitations. WorkloadNamePrefix , LensNamePrefix , ProfileNamePrefix , and
      # TemplateNamePrefix are mutually exclusive. Use the parameter that matches your ShareResourceType .

      def list_share_invitations(
        lens_name_prefix : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        profile_name_prefix : String? = nil,
        share_resource_type : String? = nil,
        template_name_prefix : String? = nil,
        workload_name_prefix : String? = nil
      ) : Protocol::Request
        input = Types::ListShareInvitationsInput.new(lens_name_prefix: lens_name_prefix, max_results: max_results, next_token: next_token, profile_name_prefix: profile_name_prefix, share_resource_type: share_resource_type, template_name_prefix: template_name_prefix, workload_name_prefix: workload_name_prefix)
        list_share_invitations(input)
      end

      def list_share_invitations(input : Types::ListShareInvitationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SHARE_INVITATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the tags for a resource. The WorkloadArn parameter can be a workload ARN, a custom lens ARN, a
      # profile ARN, or review template ARN.

      def list_tags_for_resource(
        workload_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceInput.new(workload_arn: workload_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List review template shares.

      def list_template_shares(
        template_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        shared_with_prefix : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListTemplateSharesInput.new(template_arn: template_arn, max_results: max_results, next_token: next_token, shared_with_prefix: shared_with_prefix, status: status)
        list_template_shares(input)
      end

      def list_template_shares(input : Types::ListTemplateSharesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TEMPLATE_SHARES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the workload shares associated with the workload.

      def list_workload_shares(
        workload_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        shared_with_prefix : String? = nil,
        status : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkloadSharesInput.new(workload_id: workload_id, max_results: max_results, next_token: next_token, shared_with_prefix: shared_with_prefix, status: status)
        list_workload_shares(input)
      end

      def list_workload_shares(input : Types::ListWorkloadSharesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKLOAD_SHARES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Paginated list of workloads.

      def list_workloads(
        max_results : Int32? = nil,
        next_token : String? = nil,
        workload_name_prefix : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkloadsInput.new(max_results: max_results, next_token: next_token, workload_name_prefix: workload_name_prefix)
        list_workloads(input)
      end

      def list_workloads(input : Types::ListWorkloadsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKLOADS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds one or more tags to the specified resource. The WorkloadArn parameter can be a workload ARN, a
      # custom lens ARN, a profile ARN, or review template ARN.

      def tag_resource(
        tags : Hash(String, String),
        workload_arn : String
      ) : Protocol::Request
        input = Types::TagResourceInput.new(tags: tags, workload_arn: workload_arn)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes specified tags from a resource. The WorkloadArn parameter can be a workload ARN, a custom
      # lens ARN, a profile ARN, or review template ARN. To specify multiple tags, use separate tagKeys
      # parameters, for example: DELETE /tags/WorkloadArn?tagKeys=key1&amp;tagKeys=key2

      def untag_resource(
        tag_keys : Array(String),
        workload_arn : String
      ) : Protocol::Request
        input = Types::UntagResourceInput.new(tag_keys: tag_keys, workload_arn: workload_arn)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the answer to a specific question in a workload review.

      def update_answer(
        lens_alias : String,
        question_id : String,
        workload_id : String,
        choice_updates : Hash(String, Types::ChoiceUpdate)? = nil,
        is_applicable : Bool? = nil,
        notes : String? = nil,
        reason : String? = nil,
        selected_choices : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateAnswerInput.new(lens_alias: lens_alias, question_id: question_id, workload_id: workload_id, choice_updates: choice_updates, is_applicable: is_applicable, notes: notes, reason: reason, selected_choices: selected_choices)
        update_answer(input)
      end

      def update_answer(input : Types::UpdateAnswerInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ANSWER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update whether the Amazon Web Services account is opted into organization sharing and discovery
      # integration features.

      def update_global_settings(
        discovery_integration_status : String? = nil,
        jira_configuration : Types::AccountJiraConfigurationInput? = nil,
        organization_sharing_status : String? = nil
      ) : Protocol::Request
        input = Types::UpdateGlobalSettingsInput.new(discovery_integration_status: discovery_integration_status, jira_configuration: jira_configuration, organization_sharing_status: organization_sharing_status)
        update_global_settings(input)
      end

      def update_global_settings(input : Types::UpdateGlobalSettingsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GLOBAL_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update integration features.

      def update_integration(
        client_request_token : String,
        integrating_service : String,
        workload_id : String
      ) : Protocol::Request
        input = Types::UpdateIntegrationInput.new(client_request_token: client_request_token, integrating_service: integrating_service, workload_id: workload_id)
        update_integration(input)
      end

      def update_integration(input : Types::UpdateIntegrationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update lens review for a particular workload.

      def update_lens_review(
        lens_alias : String,
        workload_id : String,
        jira_configuration : Types::JiraSelectedQuestionConfiguration? = nil,
        lens_notes : String? = nil,
        pillar_notes : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::UpdateLensReviewInput.new(lens_alias: lens_alias, workload_id: workload_id, jira_configuration: jira_configuration, lens_notes: lens_notes, pillar_notes: pillar_notes)
        update_lens_review(input)
      end

      def update_lens_review(input : Types::UpdateLensReviewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_LENS_REVIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a profile.

      def update_profile(
        profile_arn : String,
        profile_description : String? = nil,
        profile_questions : Array(Types::ProfileQuestionUpdate)? = nil
      ) : Protocol::Request
        input = Types::UpdateProfileInput.new(profile_arn: profile_arn, profile_description: profile_description, profile_questions: profile_questions)
        update_profile(input)
      end

      def update_profile(input : Types::UpdateProfileInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a review template.

      def update_review_template(
        template_arn : String,
        description : String? = nil,
        lenses_to_associate : Array(String)? = nil,
        lenses_to_disassociate : Array(String)? = nil,
        notes : String? = nil,
        template_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateReviewTemplateInput.new(template_arn: template_arn, description: description, lenses_to_associate: lenses_to_associate, lenses_to_disassociate: lenses_to_disassociate, notes: notes, template_name: template_name)
        update_review_template(input)
      end

      def update_review_template(input : Types::UpdateReviewTemplateInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REVIEW_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a review template answer.

      def update_review_template_answer(
        lens_alias : String,
        question_id : String,
        template_arn : String,
        choice_updates : Hash(String, Types::ChoiceUpdate)? = nil,
        is_applicable : Bool? = nil,
        notes : String? = nil,
        reason : String? = nil,
        selected_choices : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateReviewTemplateAnswerInput.new(lens_alias: lens_alias, question_id: question_id, template_arn: template_arn, choice_updates: choice_updates, is_applicable: is_applicable, notes: notes, reason: reason, selected_choices: selected_choices)
        update_review_template_answer(input)
      end

      def update_review_template_answer(input : Types::UpdateReviewTemplateAnswerInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REVIEW_TEMPLATE_ANSWER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a lens review associated with a review template.

      def update_review_template_lens_review(
        lens_alias : String,
        template_arn : String,
        lens_notes : String? = nil,
        pillar_notes : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::UpdateReviewTemplateLensReviewInput.new(lens_alias: lens_alias, template_arn: template_arn, lens_notes: lens_notes, pillar_notes: pillar_notes)
        update_review_template_lens_review(input)
      end

      def update_review_template_lens_review(input : Types::UpdateReviewTemplateLensReviewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REVIEW_TEMPLATE_LENS_REVIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a workload or custom lens share invitation. This API operation can be called independently of
      # any resource. Previous documentation implied that a workload ARN must be specified.

      def update_share_invitation(
        share_invitation_action : String,
        share_invitation_id : String
      ) : Protocol::Request
        input = Types::UpdateShareInvitationInput.new(share_invitation_action: share_invitation_action, share_invitation_id: share_invitation_id)
        update_share_invitation(input)
      end

      def update_share_invitation(input : Types::UpdateShareInvitationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SHARE_INVITATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update an existing workload.

      def update_workload(
        workload_id : String,
        account_ids : Array(String)? = nil,
        applications : Array(String)? = nil,
        architectural_design : String? = nil,
        aws_regions : Array(String)? = nil,
        description : String? = nil,
        discovery_config : Types::WorkloadDiscoveryConfig? = nil,
        environment : String? = nil,
        improvement_status : String? = nil,
        industry : String? = nil,
        industry_type : String? = nil,
        is_review_owner_update_acknowledged : Bool? = nil,
        jira_configuration : Types::WorkloadJiraConfigurationInput? = nil,
        non_aws_regions : Array(String)? = nil,
        notes : String? = nil,
        pillar_priorities : Array(String)? = nil,
        review_owner : String? = nil,
        workload_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateWorkloadInput.new(workload_id: workload_id, account_ids: account_ids, applications: applications, architectural_design: architectural_design, aws_regions: aws_regions, description: description, discovery_config: discovery_config, environment: environment, improvement_status: improvement_status, industry: industry, industry_type: industry_type, is_review_owner_update_acknowledged: is_review_owner_update_acknowledged, jira_configuration: jira_configuration, non_aws_regions: non_aws_regions, notes: notes, pillar_priorities: pillar_priorities, review_owner: review_owner, workload_name: workload_name)
        update_workload(input)
      end

      def update_workload(input : Types::UpdateWorkloadInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKLOAD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update a workload share.

      def update_workload_share(
        permission_type : String,
        share_id : String,
        workload_id : String
      ) : Protocol::Request
        input = Types::UpdateWorkloadShareInput.new(permission_type: permission_type, share_id: share_id, workload_id: workload_id)
        update_workload_share(input)
      end

      def update_workload_share(input : Types::UpdateWorkloadShareInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKLOAD_SHARE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Upgrade lens review for a particular workload.

      def upgrade_lens_review(
        lens_alias : String,
        milestone_name : String,
        workload_id : String,
        client_request_token : String? = nil
      ) : Protocol::Request
        input = Types::UpgradeLensReviewInput.new(lens_alias: lens_alias, milestone_name: milestone_name, workload_id: workload_id, client_request_token: client_request_token)
        upgrade_lens_review(input)
      end

      def upgrade_lens_review(input : Types::UpgradeLensReviewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPGRADE_LENS_REVIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Upgrade a profile.

      def upgrade_profile_version(
        profile_arn : String,
        workload_id : String,
        client_request_token : String? = nil,
        milestone_name : String? = nil
      ) : Protocol::Request
        input = Types::UpgradeProfileVersionInput.new(profile_arn: profile_arn, workload_id: workload_id, client_request_token: client_request_token, milestone_name: milestone_name)
        upgrade_profile_version(input)
      end

      def upgrade_profile_version(input : Types::UpgradeProfileVersionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPGRADE_PROFILE_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Upgrade the lens review of a review template.

      def upgrade_review_template_lens_review(
        lens_alias : String,
        template_arn : String,
        client_request_token : String? = nil
      ) : Protocol::Request
        input = Types::UpgradeReviewTemplateLensReviewInput.new(lens_alias: lens_alias, template_arn: template_arn, client_request_token: client_request_token)
        upgrade_review_template_lens_review(input)
      end

      def upgrade_review_template_lens_review(input : Types::UpgradeReviewTemplateLensReviewInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPGRADE_REVIEW_TEMPLATE_LENS_REVIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
