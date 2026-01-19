module AwsSdk
  module CodeCommit
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Creates an association between an approval rule template and a specified repository. Then, the next
      # time a pull request is created in the repository where the destination reference (if specified)
      # matches the destination reference (branch) for the pull request, an approval rule that matches the
      # template conditions is automatically created for that pull request. If no destination references are
      # specified in the template, an approval rule that matches the template contents is created for all
      # pull requests in that repository.
      def associate_approval_rule_template_with_repository(
        approval_rule_template_name : String,
        repository_name : String
      ) : Nil
        input = Types::AssociateApprovalRuleTemplateWithRepositoryInput.new(approval_rule_template_name: approval_rule_template_name, repository_name: repository_name)
        associate_approval_rule_template_with_repository(input)
      end
      def associate_approval_rule_template_with_repository(input : Types::AssociateApprovalRuleTemplateWithRepositoryInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_APPROVAL_RULE_TEMPLATE_WITH_REPOSITORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Creates an association between an approval rule template and one or more specified repositories.
      def batch_associate_approval_rule_template_with_repositories(
        approval_rule_template_name : String,
        repository_names : Array(String)
      ) : Types::BatchAssociateApprovalRuleTemplateWithRepositoriesOutput
        input = Types::BatchAssociateApprovalRuleTemplateWithRepositoriesInput.new(approval_rule_template_name: approval_rule_template_name, repository_names: repository_names)
        batch_associate_approval_rule_template_with_repositories(input)
      end
      def batch_associate_approval_rule_template_with_repositories(input : Types::BatchAssociateApprovalRuleTemplateWithRepositoriesInput) : Types::BatchAssociateApprovalRuleTemplateWithRepositoriesOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_ASSOCIATE_APPROVAL_RULE_TEMPLATE_WITH_REPOSITORIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchAssociateApprovalRuleTemplateWithRepositoriesOutput, "BatchAssociateApprovalRuleTemplateWithRepositories")
      end

      # Returns information about one or more merge conflicts in the attempted merge of two commit
      # specifiers using the squash or three-way merge strategy.
      def batch_describe_merge_conflicts(
        destination_commit_specifier : String,
        merge_option : String,
        repository_name : String,
        source_commit_specifier : String,
        conflict_detail_level : String? = nil,
        conflict_resolution_strategy : String? = nil,
        file_paths : Array(String)? = nil,
        max_conflict_files : Int32? = nil,
        max_merge_hunks : Int32? = nil,
        next_token : String? = nil
      ) : Types::BatchDescribeMergeConflictsOutput
        input = Types::BatchDescribeMergeConflictsInput.new(destination_commit_specifier: destination_commit_specifier, merge_option: merge_option, repository_name: repository_name, source_commit_specifier: source_commit_specifier, conflict_detail_level: conflict_detail_level, conflict_resolution_strategy: conflict_resolution_strategy, file_paths: file_paths, max_conflict_files: max_conflict_files, max_merge_hunks: max_merge_hunks, next_token: next_token)
        batch_describe_merge_conflicts(input)
      end
      def batch_describe_merge_conflicts(input : Types::BatchDescribeMergeConflictsInput) : Types::BatchDescribeMergeConflictsOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_DESCRIBE_MERGE_CONFLICTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDescribeMergeConflictsOutput, "BatchDescribeMergeConflicts")
      end

      # Removes the association between an approval rule template and one or more specified repositories.
      def batch_disassociate_approval_rule_template_from_repositories(
        approval_rule_template_name : String,
        repository_names : Array(String)
      ) : Types::BatchDisassociateApprovalRuleTemplateFromRepositoriesOutput
        input = Types::BatchDisassociateApprovalRuleTemplateFromRepositoriesInput.new(approval_rule_template_name: approval_rule_template_name, repository_names: repository_names)
        batch_disassociate_approval_rule_template_from_repositories(input)
      end
      def batch_disassociate_approval_rule_template_from_repositories(input : Types::BatchDisassociateApprovalRuleTemplateFromRepositoriesInput) : Types::BatchDisassociateApprovalRuleTemplateFromRepositoriesOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_DISASSOCIATE_APPROVAL_RULE_TEMPLATE_FROM_REPOSITORIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchDisassociateApprovalRuleTemplateFromRepositoriesOutput, "BatchDisassociateApprovalRuleTemplateFromRepositories")
      end

      # Returns information about the contents of one or more commits in a repository.
      def batch_get_commits(
        commit_ids : Array(String),
        repository_name : String
      ) : Types::BatchGetCommitsOutput
        input = Types::BatchGetCommitsInput.new(commit_ids: commit_ids, repository_name: repository_name)
        batch_get_commits(input)
      end
      def batch_get_commits(input : Types::BatchGetCommitsInput) : Types::BatchGetCommitsOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_COMMITS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetCommitsOutput, "BatchGetCommits")
      end

      # Returns information about one or more repositories. The description field for a repository accepts
      # all HTML characters and all valid Unicode characters. Applications that do not HTML-encode the
      # description and display it in a webpage can expose users to potentially malicious code. Make sure
      # that you HTML-encode the description field in any application that uses this API to display the
      # repository description on a webpage.
      def batch_get_repositories(
        repository_names : Array(String)
      ) : Types::BatchGetRepositoriesOutput
        input = Types::BatchGetRepositoriesInput.new(repository_names: repository_names)
        batch_get_repositories(input)
      end
      def batch_get_repositories(input : Types::BatchGetRepositoriesInput) : Types::BatchGetRepositoriesOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_REPOSITORIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetRepositoriesOutput, "BatchGetRepositories")
      end

      # Creates a template for approval rules that can then be associated with one or more repositories in
      # your Amazon Web Services account. When you associate a template with a repository, CodeCommit
      # creates an approval rule that matches the conditions of the template for all pull requests that meet
      # the conditions of the template. For more information, see
      # AssociateApprovalRuleTemplateWithRepository .
      def create_approval_rule_template(
        approval_rule_template_content : String,
        approval_rule_template_name : String,
        approval_rule_template_description : String? = nil
      ) : Types::CreateApprovalRuleTemplateOutput
        input = Types::CreateApprovalRuleTemplateInput.new(approval_rule_template_content: approval_rule_template_content, approval_rule_template_name: approval_rule_template_name, approval_rule_template_description: approval_rule_template_description)
        create_approval_rule_template(input)
      end
      def create_approval_rule_template(input : Types::CreateApprovalRuleTemplateInput) : Types::CreateApprovalRuleTemplateOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_APPROVAL_RULE_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateApprovalRuleTemplateOutput, "CreateApprovalRuleTemplate")
      end

      # Creates a branch in a repository and points the branch to a commit. Calling the create branch
      # operation does not set a repository's default branch. To do this, call the update default branch
      # operation.
      def create_branch(
        branch_name : String,
        commit_id : String,
        repository_name : String
      ) : Nil
        input = Types::CreateBranchInput.new(branch_name: branch_name, commit_id: commit_id, repository_name: repository_name)
        create_branch(input)
      end
      def create_branch(input : Types::CreateBranchInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::CREATE_BRANCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Creates a commit for a repository on the tip of a specified branch.
      def create_commit(
        branch_name : String,
        repository_name : String,
        author_name : String? = nil,
        commit_message : String? = nil,
        delete_files : Array(Types::DeleteFileEntry)? = nil,
        email : String? = nil,
        keep_empty_folders : Bool? = nil,
        parent_commit_id : String? = nil,
        put_files : Array(Types::PutFileEntry)? = nil,
        set_file_modes : Array(Types::SetFileModeEntry)? = nil
      ) : Types::CreateCommitOutput
        input = Types::CreateCommitInput.new(branch_name: branch_name, repository_name: repository_name, author_name: author_name, commit_message: commit_message, delete_files: delete_files, email: email, keep_empty_folders: keep_empty_folders, parent_commit_id: parent_commit_id, put_files: put_files, set_file_modes: set_file_modes)
        create_commit(input)
      end
      def create_commit(input : Types::CreateCommitInput) : Types::CreateCommitOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_COMMIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCommitOutput, "CreateCommit")
      end

      # Creates a pull request in the specified repository.
      def create_pull_request(
        targets : Array(Types::Target),
        title : String,
        client_request_token : String? = nil,
        description : String? = nil
      ) : Types::CreatePullRequestOutput
        input = Types::CreatePullRequestInput.new(targets: targets, title: title, client_request_token: client_request_token, description: description)
        create_pull_request(input)
      end
      def create_pull_request(input : Types::CreatePullRequestInput) : Types::CreatePullRequestOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_PULL_REQUEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePullRequestOutput, "CreatePullRequest")
      end

      # Creates an approval rule for a pull request.
      def create_pull_request_approval_rule(
        approval_rule_content : String,
        approval_rule_name : String,
        pull_request_id : String
      ) : Types::CreatePullRequestApprovalRuleOutput
        input = Types::CreatePullRequestApprovalRuleInput.new(approval_rule_content: approval_rule_content, approval_rule_name: approval_rule_name, pull_request_id: pull_request_id)
        create_pull_request_approval_rule(input)
      end
      def create_pull_request_approval_rule(input : Types::CreatePullRequestApprovalRuleInput) : Types::CreatePullRequestApprovalRuleOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_PULL_REQUEST_APPROVAL_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePullRequestApprovalRuleOutput, "CreatePullRequestApprovalRule")
      end

      # Creates a new, empty repository.
      def create_repository(
        repository_name : String,
        kms_key_id : String? = nil,
        repository_description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateRepositoryOutput
        input = Types::CreateRepositoryInput.new(repository_name: repository_name, kms_key_id: kms_key_id, repository_description: repository_description, tags: tags)
        create_repository(input)
      end
      def create_repository(input : Types::CreateRepositoryInput) : Types::CreateRepositoryOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_REPOSITORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateRepositoryOutput, "CreateRepository")
      end

      # Creates an unreferenced commit that represents the result of merging two branches using a specified
      # merge strategy. This can help you determine the outcome of a potential merge. This API cannot be
      # used with the fast-forward merge strategy because that strategy does not create a merge commit. This
      # unreferenced merge commit can only be accessed using the GetCommit API or through git commands such
      # as git fetch. To retrieve this commit, you must specify its commit ID or otherwise reference it.
      def create_unreferenced_merge_commit(
        destination_commit_specifier : String,
        merge_option : String,
        repository_name : String,
        source_commit_specifier : String,
        author_name : String? = nil,
        commit_message : String? = nil,
        conflict_detail_level : String? = nil,
        conflict_resolution : Types::ConflictResolution? = nil,
        conflict_resolution_strategy : String? = nil,
        email : String? = nil,
        keep_empty_folders : Bool? = nil
      ) : Types::CreateUnreferencedMergeCommitOutput
        input = Types::CreateUnreferencedMergeCommitInput.new(destination_commit_specifier: destination_commit_specifier, merge_option: merge_option, repository_name: repository_name, source_commit_specifier: source_commit_specifier, author_name: author_name, commit_message: commit_message, conflict_detail_level: conflict_detail_level, conflict_resolution: conflict_resolution, conflict_resolution_strategy: conflict_resolution_strategy, email: email, keep_empty_folders: keep_empty_folders)
        create_unreferenced_merge_commit(input)
      end
      def create_unreferenced_merge_commit(input : Types::CreateUnreferencedMergeCommitInput) : Types::CreateUnreferencedMergeCommitOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_UNREFERENCED_MERGE_COMMIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateUnreferencedMergeCommitOutput, "CreateUnreferencedMergeCommit")
      end

      # Deletes a specified approval rule template. Deleting a template does not remove approval rules on
      # pull requests already created with the template.
      def delete_approval_rule_template(
        approval_rule_template_name : String
      ) : Types::DeleteApprovalRuleTemplateOutput
        input = Types::DeleteApprovalRuleTemplateInput.new(approval_rule_template_name: approval_rule_template_name)
        delete_approval_rule_template(input)
      end
      def delete_approval_rule_template(input : Types::DeleteApprovalRuleTemplateInput) : Types::DeleteApprovalRuleTemplateOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_APPROVAL_RULE_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteApprovalRuleTemplateOutput, "DeleteApprovalRuleTemplate")
      end

      # Deletes a branch from a repository, unless that branch is the default branch for the repository.
      def delete_branch(
        branch_name : String,
        repository_name : String
      ) : Types::DeleteBranchOutput
        input = Types::DeleteBranchInput.new(branch_name: branch_name, repository_name: repository_name)
        delete_branch(input)
      end
      def delete_branch(input : Types::DeleteBranchInput) : Types::DeleteBranchOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_BRANCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteBranchOutput, "DeleteBranch")
      end

      # Deletes the content of a comment made on a change, file, or commit in a repository.
      def delete_comment_content(
        comment_id : String
      ) : Types::DeleteCommentContentOutput
        input = Types::DeleteCommentContentInput.new(comment_id: comment_id)
        delete_comment_content(input)
      end
      def delete_comment_content(input : Types::DeleteCommentContentInput) : Types::DeleteCommentContentOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_COMMENT_CONTENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCommentContentOutput, "DeleteCommentContent")
      end

      # Deletes a specified file from a specified branch. A commit is created on the branch that contains
      # the revision. The file still exists in the commits earlier to the commit that contains the deletion.
      def delete_file(
        branch_name : String,
        file_path : String,
        parent_commit_id : String,
        repository_name : String,
        commit_message : String? = nil,
        email : String? = nil,
        keep_empty_folders : Bool? = nil,
        name : String? = nil
      ) : Types::DeleteFileOutput
        input = Types::DeleteFileInput.new(branch_name: branch_name, file_path: file_path, parent_commit_id: parent_commit_id, repository_name: repository_name, commit_message: commit_message, email: email, keep_empty_folders: keep_empty_folders, name: name)
        delete_file(input)
      end
      def delete_file(input : Types::DeleteFileInput) : Types::DeleteFileOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_FILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFileOutput, "DeleteFile")
      end

      # Deletes an approval rule from a specified pull request. Approval rules can be deleted from a pull
      # request only if the pull request is open, and if the approval rule was created specifically for a
      # pull request and not generated from an approval rule template associated with the repository where
      # the pull request was created. You cannot delete an approval rule from a merged or closed pull
      # request.
      def delete_pull_request_approval_rule(
        approval_rule_name : String,
        pull_request_id : String
      ) : Types::DeletePullRequestApprovalRuleOutput
        input = Types::DeletePullRequestApprovalRuleInput.new(approval_rule_name: approval_rule_name, pull_request_id: pull_request_id)
        delete_pull_request_approval_rule(input)
      end
      def delete_pull_request_approval_rule(input : Types::DeletePullRequestApprovalRuleInput) : Types::DeletePullRequestApprovalRuleOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_PULL_REQUEST_APPROVAL_RULE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePullRequestApprovalRuleOutput, "DeletePullRequestApprovalRule")
      end

      # Deletes a repository. If a specified repository was already deleted, a null repository ID is
      # returned. Deleting a repository also deletes all associated objects and metadata. After a repository
      # is deleted, all future push calls to the deleted repository fail.
      def delete_repository(
        repository_name : String
      ) : Types::DeleteRepositoryOutput
        input = Types::DeleteRepositoryInput.new(repository_name: repository_name)
        delete_repository(input)
      end
      def delete_repository(input : Types::DeleteRepositoryInput) : Types::DeleteRepositoryOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_REPOSITORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteRepositoryOutput, "DeleteRepository")
      end

      # Returns information about one or more merge conflicts in the attempted merge of two commit
      # specifiers using the squash or three-way merge strategy. If the merge option for the attempted merge
      # is specified as FAST_FORWARD_MERGE, an exception is thrown.
      def describe_merge_conflicts(
        destination_commit_specifier : String,
        file_path : String,
        merge_option : String,
        repository_name : String,
        source_commit_specifier : String,
        conflict_detail_level : String? = nil,
        conflict_resolution_strategy : String? = nil,
        max_merge_hunks : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeMergeConflictsOutput
        input = Types::DescribeMergeConflictsInput.new(destination_commit_specifier: destination_commit_specifier, file_path: file_path, merge_option: merge_option, repository_name: repository_name, source_commit_specifier: source_commit_specifier, conflict_detail_level: conflict_detail_level, conflict_resolution_strategy: conflict_resolution_strategy, max_merge_hunks: max_merge_hunks, next_token: next_token)
        describe_merge_conflicts(input)
      end
      def describe_merge_conflicts(input : Types::DescribeMergeConflictsInput) : Types::DescribeMergeConflictsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MERGE_CONFLICTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMergeConflictsOutput, "DescribeMergeConflicts")
      end

      # Returns information about one or more pull request events.
      def describe_pull_request_events(
        pull_request_id : String,
        actor_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        pull_request_event_type : String? = nil
      ) : Types::DescribePullRequestEventsOutput
        input = Types::DescribePullRequestEventsInput.new(pull_request_id: pull_request_id, actor_arn: actor_arn, max_results: max_results, next_token: next_token, pull_request_event_type: pull_request_event_type)
        describe_pull_request_events(input)
      end
      def describe_pull_request_events(input : Types::DescribePullRequestEventsInput) : Types::DescribePullRequestEventsOutput
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PULL_REQUEST_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribePullRequestEventsOutput, "DescribePullRequestEvents")
      end

      # Removes the association between a template and a repository so that approval rules based on the
      # template are not automatically created when pull requests are created in the specified repository.
      # This does not delete any approval rules previously created for pull requests through the template
      # association.
      def disassociate_approval_rule_template_from_repository(
        approval_rule_template_name : String,
        repository_name : String
      ) : Nil
        input = Types::DisassociateApprovalRuleTemplateFromRepositoryInput.new(approval_rule_template_name: approval_rule_template_name, repository_name: repository_name)
        disassociate_approval_rule_template_from_repository(input)
      end
      def disassociate_approval_rule_template_from_repository(input : Types::DisassociateApprovalRuleTemplateFromRepositoryInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DISASSOCIATE_APPROVAL_RULE_TEMPLATE_FROM_REPOSITORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Evaluates whether a pull request has met all the conditions specified in its associated approval
      # rules.
      def evaluate_pull_request_approval_rules(
        pull_request_id : String,
        revision_id : String
      ) : Types::EvaluatePullRequestApprovalRulesOutput
        input = Types::EvaluatePullRequestApprovalRulesInput.new(pull_request_id: pull_request_id, revision_id: revision_id)
        evaluate_pull_request_approval_rules(input)
      end
      def evaluate_pull_request_approval_rules(input : Types::EvaluatePullRequestApprovalRulesInput) : Types::EvaluatePullRequestApprovalRulesOutput
        request = Protocol::JsonRpc.build_request(Model::EVALUATE_PULL_REQUEST_APPROVAL_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::EvaluatePullRequestApprovalRulesOutput, "EvaluatePullRequestApprovalRules")
      end

      # Returns information about a specified approval rule template.
      def get_approval_rule_template(
        approval_rule_template_name : String
      ) : Types::GetApprovalRuleTemplateOutput
        input = Types::GetApprovalRuleTemplateInput.new(approval_rule_template_name: approval_rule_template_name)
        get_approval_rule_template(input)
      end
      def get_approval_rule_template(input : Types::GetApprovalRuleTemplateInput) : Types::GetApprovalRuleTemplateOutput
        request = Protocol::JsonRpc.build_request(Model::GET_APPROVAL_RULE_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetApprovalRuleTemplateOutput, "GetApprovalRuleTemplate")
      end

      # Returns the base-64 encoded content of an individual blob in a repository.
      def get_blob(
        blob_id : String,
        repository_name : String
      ) : Types::GetBlobOutput
        input = Types::GetBlobInput.new(blob_id: blob_id, repository_name: repository_name)
        get_blob(input)
      end
      def get_blob(input : Types::GetBlobInput) : Types::GetBlobOutput
        request = Protocol::JsonRpc.build_request(Model::GET_BLOB, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBlobOutput, "GetBlob")
      end

      # Returns information about a repository branch, including its name and the last commit ID.
      def get_branch(
        branch_name : String? = nil,
        repository_name : String? = nil
      ) : Types::GetBranchOutput
        input = Types::GetBranchInput.new(branch_name: branch_name, repository_name: repository_name)
        get_branch(input)
      end
      def get_branch(input : Types::GetBranchInput) : Types::GetBranchOutput
        request = Protocol::JsonRpc.build_request(Model::GET_BRANCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetBranchOutput, "GetBranch")
      end

      # Returns the content of a comment made on a change, file, or commit in a repository. Reaction counts
      # might include numbers from user identities who were deleted after the reaction was made. For a count
      # of reactions from active identities, use GetCommentReactions.
      def get_comment(
        comment_id : String
      ) : Types::GetCommentOutput
        input = Types::GetCommentInput.new(comment_id: comment_id)
        get_comment(input)
      end
      def get_comment(input : Types::GetCommentInput) : Types::GetCommentOutput
        request = Protocol::JsonRpc.build_request(Model::GET_COMMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCommentOutput, "GetComment")
      end

      # Returns information about reactions to a specified comment ID. Reactions from users who have been
      # deleted will not be included in the count.
      def get_comment_reactions(
        comment_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        reaction_user_arn : String? = nil
      ) : Types::GetCommentReactionsOutput
        input = Types::GetCommentReactionsInput.new(comment_id: comment_id, max_results: max_results, next_token: next_token, reaction_user_arn: reaction_user_arn)
        get_comment_reactions(input)
      end
      def get_comment_reactions(input : Types::GetCommentReactionsInput) : Types::GetCommentReactionsOutput
        request = Protocol::JsonRpc.build_request(Model::GET_COMMENT_REACTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCommentReactionsOutput, "GetCommentReactions")
      end

      # Returns information about comments made on the comparison between two commits. Reaction counts might
      # include numbers from user identities who were deleted after the reaction was made. For a count of
      # reactions from active identities, use GetCommentReactions.
      def get_comments_for_compared_commit(
        after_commit_id : String,
        repository_name : String,
        before_commit_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetCommentsForComparedCommitOutput
        input = Types::GetCommentsForComparedCommitInput.new(after_commit_id: after_commit_id, repository_name: repository_name, before_commit_id: before_commit_id, max_results: max_results, next_token: next_token)
        get_comments_for_compared_commit(input)
      end
      def get_comments_for_compared_commit(input : Types::GetCommentsForComparedCommitInput) : Types::GetCommentsForComparedCommitOutput
        request = Protocol::JsonRpc.build_request(Model::GET_COMMENTS_FOR_COMPARED_COMMIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCommentsForComparedCommitOutput, "GetCommentsForComparedCommit")
      end

      # Returns comments made on a pull request. Reaction counts might include numbers from user identities
      # who were deleted after the reaction was made. For a count of reactions from active identities, use
      # GetCommentReactions.
      def get_comments_for_pull_request(
        pull_request_id : String,
        after_commit_id : String? = nil,
        before_commit_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        repository_name : String? = nil
      ) : Types::GetCommentsForPullRequestOutput
        input = Types::GetCommentsForPullRequestInput.new(pull_request_id: pull_request_id, after_commit_id: after_commit_id, before_commit_id: before_commit_id, max_results: max_results, next_token: next_token, repository_name: repository_name)
        get_comments_for_pull_request(input)
      end
      def get_comments_for_pull_request(input : Types::GetCommentsForPullRequestInput) : Types::GetCommentsForPullRequestOutput
        request = Protocol::JsonRpc.build_request(Model::GET_COMMENTS_FOR_PULL_REQUEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCommentsForPullRequestOutput, "GetCommentsForPullRequest")
      end

      # Returns information about a commit, including commit message and committer information.
      def get_commit(
        commit_id : String,
        repository_name : String
      ) : Types::GetCommitOutput
        input = Types::GetCommitInput.new(commit_id: commit_id, repository_name: repository_name)
        get_commit(input)
      end
      def get_commit(input : Types::GetCommitInput) : Types::GetCommitOutput
        request = Protocol::JsonRpc.build_request(Model::GET_COMMIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCommitOutput, "GetCommit")
      end

      # Returns information about the differences in a valid commit specifier (such as a branch, tag, HEAD,
      # commit ID, or other fully qualified reference). Results can be limited to a specified path.
      def get_differences(
        after_commit_specifier : String,
        repository_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        after_path : String? = nil,
        before_commit_specifier : String? = nil,
        before_path : String? = nil
      ) : Types::GetDifferencesOutput
        input = Types::GetDifferencesInput.new(after_commit_specifier: after_commit_specifier, repository_name: repository_name, max_results: max_results, next_token: next_token, after_path: after_path, before_commit_specifier: before_commit_specifier, before_path: before_path)
        get_differences(input)
      end
      def get_differences(input : Types::GetDifferencesInput) : Types::GetDifferencesOutput
        request = Protocol::JsonRpc.build_request(Model::GET_DIFFERENCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDifferencesOutput, "GetDifferences")
      end

      # Returns the base-64 encoded contents of a specified file and its metadata.
      def get_file(
        file_path : String,
        repository_name : String,
        commit_specifier : String? = nil
      ) : Types::GetFileOutput
        input = Types::GetFileInput.new(file_path: file_path, repository_name: repository_name, commit_specifier: commit_specifier)
        get_file(input)
      end
      def get_file(input : Types::GetFileInput) : Types::GetFileOutput
        request = Protocol::JsonRpc.build_request(Model::GET_FILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetFileOutput, "GetFile")
      end

      # Returns the contents of a specified folder in a repository.
      def get_folder(
        folder_path : String,
        repository_name : String,
        commit_specifier : String? = nil
      ) : Types::GetFolderOutput
        input = Types::GetFolderInput.new(folder_path: folder_path, repository_name: repository_name, commit_specifier: commit_specifier)
        get_folder(input)
      end
      def get_folder(input : Types::GetFolderInput) : Types::GetFolderOutput
        request = Protocol::JsonRpc.build_request(Model::GET_FOLDER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetFolderOutput, "GetFolder")
      end

      # Returns information about a specified merge commit.
      def get_merge_commit(
        destination_commit_specifier : String,
        repository_name : String,
        source_commit_specifier : String,
        conflict_detail_level : String? = nil,
        conflict_resolution_strategy : String? = nil
      ) : Types::GetMergeCommitOutput
        input = Types::GetMergeCommitInput.new(destination_commit_specifier: destination_commit_specifier, repository_name: repository_name, source_commit_specifier: source_commit_specifier, conflict_detail_level: conflict_detail_level, conflict_resolution_strategy: conflict_resolution_strategy)
        get_merge_commit(input)
      end
      def get_merge_commit(input : Types::GetMergeCommitInput) : Types::GetMergeCommitOutput
        request = Protocol::JsonRpc.build_request(Model::GET_MERGE_COMMIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMergeCommitOutput, "GetMergeCommit")
      end

      # Returns information about merge conflicts between the before and after commit IDs for a pull request
      # in a repository.
      def get_merge_conflicts(
        destination_commit_specifier : String,
        merge_option : String,
        repository_name : String,
        source_commit_specifier : String,
        conflict_detail_level : String? = nil,
        conflict_resolution_strategy : String? = nil,
        max_conflict_files : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetMergeConflictsOutput
        input = Types::GetMergeConflictsInput.new(destination_commit_specifier: destination_commit_specifier, merge_option: merge_option, repository_name: repository_name, source_commit_specifier: source_commit_specifier, conflict_detail_level: conflict_detail_level, conflict_resolution_strategy: conflict_resolution_strategy, max_conflict_files: max_conflict_files, next_token: next_token)
        get_merge_conflicts(input)
      end
      def get_merge_conflicts(input : Types::GetMergeConflictsInput) : Types::GetMergeConflictsOutput
        request = Protocol::JsonRpc.build_request(Model::GET_MERGE_CONFLICTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMergeConflictsOutput, "GetMergeConflicts")
      end

      # Returns information about the merge options available for merging two specified branches. For
      # details about why a merge option is not available, use GetMergeConflicts or DescribeMergeConflicts.
      def get_merge_options(
        destination_commit_specifier : String,
        repository_name : String,
        source_commit_specifier : String,
        conflict_detail_level : String? = nil,
        conflict_resolution_strategy : String? = nil
      ) : Types::GetMergeOptionsOutput
        input = Types::GetMergeOptionsInput.new(destination_commit_specifier: destination_commit_specifier, repository_name: repository_name, source_commit_specifier: source_commit_specifier, conflict_detail_level: conflict_detail_level, conflict_resolution_strategy: conflict_resolution_strategy)
        get_merge_options(input)
      end
      def get_merge_options(input : Types::GetMergeOptionsInput) : Types::GetMergeOptionsOutput
        request = Protocol::JsonRpc.build_request(Model::GET_MERGE_OPTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetMergeOptionsOutput, "GetMergeOptions")
      end

      # Gets information about a pull request in a specified repository.
      def get_pull_request(
        pull_request_id : String
      ) : Types::GetPullRequestOutput
        input = Types::GetPullRequestInput.new(pull_request_id: pull_request_id)
        get_pull_request(input)
      end
      def get_pull_request(input : Types::GetPullRequestInput) : Types::GetPullRequestOutput
        request = Protocol::JsonRpc.build_request(Model::GET_PULL_REQUEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPullRequestOutput, "GetPullRequest")
      end

      # Gets information about the approval states for a specified pull request. Approval states only apply
      # to pull requests that have one or more approval rules applied to them.
      def get_pull_request_approval_states(
        pull_request_id : String,
        revision_id : String
      ) : Types::GetPullRequestApprovalStatesOutput
        input = Types::GetPullRequestApprovalStatesInput.new(pull_request_id: pull_request_id, revision_id: revision_id)
        get_pull_request_approval_states(input)
      end
      def get_pull_request_approval_states(input : Types::GetPullRequestApprovalStatesInput) : Types::GetPullRequestApprovalStatesOutput
        request = Protocol::JsonRpc.build_request(Model::GET_PULL_REQUEST_APPROVAL_STATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPullRequestApprovalStatesOutput, "GetPullRequestApprovalStates")
      end

      # Returns information about whether approval rules have been set aside (overridden) for a pull
      # request, and if so, the Amazon Resource Name (ARN) of the user or identity that overrode the rules
      # and their requirements for the pull request.
      def get_pull_request_override_state(
        pull_request_id : String,
        revision_id : String
      ) : Types::GetPullRequestOverrideStateOutput
        input = Types::GetPullRequestOverrideStateInput.new(pull_request_id: pull_request_id, revision_id: revision_id)
        get_pull_request_override_state(input)
      end
      def get_pull_request_override_state(input : Types::GetPullRequestOverrideStateInput) : Types::GetPullRequestOverrideStateOutput
        request = Protocol::JsonRpc.build_request(Model::GET_PULL_REQUEST_OVERRIDE_STATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPullRequestOverrideStateOutput, "GetPullRequestOverrideState")
      end

      # Returns information about a repository. The description field for a repository accepts all HTML
      # characters and all valid Unicode characters. Applications that do not HTML-encode the description
      # and display it in a webpage can expose users to potentially malicious code. Make sure that you
      # HTML-encode the description field in any application that uses this API to display the repository
      # description on a webpage.
      def get_repository(
        repository_name : String
      ) : Types::GetRepositoryOutput
        input = Types::GetRepositoryInput.new(repository_name: repository_name)
        get_repository(input)
      end
      def get_repository(input : Types::GetRepositoryInput) : Types::GetRepositoryOutput
        request = Protocol::JsonRpc.build_request(Model::GET_REPOSITORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRepositoryOutput, "GetRepository")
      end

      # Gets information about triggers configured for a repository.
      def get_repository_triggers(
        repository_name : String
      ) : Types::GetRepositoryTriggersOutput
        input = Types::GetRepositoryTriggersInput.new(repository_name: repository_name)
        get_repository_triggers(input)
      end
      def get_repository_triggers(input : Types::GetRepositoryTriggersInput) : Types::GetRepositoryTriggersOutput
        request = Protocol::JsonRpc.build_request(Model::GET_REPOSITORY_TRIGGERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetRepositoryTriggersOutput, "GetRepositoryTriggers")
      end

      # Lists all approval rule templates in the specified Amazon Web Services Region in your Amazon Web
      # Services account. If an Amazon Web Services Region is not specified, the Amazon Web Services Region
      # where you are signed in is used.
      def list_approval_rule_templates(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListApprovalRuleTemplatesOutput
        input = Types::ListApprovalRuleTemplatesInput.new(max_results: max_results, next_token: next_token)
        list_approval_rule_templates(input)
      end
      def list_approval_rule_templates(input : Types::ListApprovalRuleTemplatesInput) : Types::ListApprovalRuleTemplatesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_APPROVAL_RULE_TEMPLATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListApprovalRuleTemplatesOutput, "ListApprovalRuleTemplates")
      end

      # Lists all approval rule templates that are associated with a specified repository.
      def list_associated_approval_rule_templates_for_repository(
        repository_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListAssociatedApprovalRuleTemplatesForRepositoryOutput
        input = Types::ListAssociatedApprovalRuleTemplatesForRepositoryInput.new(repository_name: repository_name, max_results: max_results, next_token: next_token)
        list_associated_approval_rule_templates_for_repository(input)
      end
      def list_associated_approval_rule_templates_for_repository(input : Types::ListAssociatedApprovalRuleTemplatesForRepositoryInput) : Types::ListAssociatedApprovalRuleTemplatesForRepositoryOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_ASSOCIATED_APPROVAL_RULE_TEMPLATES_FOR_REPOSITORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAssociatedApprovalRuleTemplatesForRepositoryOutput, "ListAssociatedApprovalRuleTemplatesForRepository")
      end

      # Gets information about one or more branches in a repository.
      def list_branches(
        repository_name : String,
        next_token : String? = nil
      ) : Types::ListBranchesOutput
        input = Types::ListBranchesInput.new(repository_name: repository_name, next_token: next_token)
        list_branches(input)
      end
      def list_branches(input : Types::ListBranchesInput) : Types::ListBranchesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_BRANCHES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListBranchesOutput, "ListBranches")
      end

      # Retrieves a list of commits and changes to a specified file.
      def list_file_commit_history(
        file_path : String,
        repository_name : String,
        commit_specifier : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListFileCommitHistoryResponse
        input = Types::ListFileCommitHistoryRequest.new(file_path: file_path, repository_name: repository_name, commit_specifier: commit_specifier, max_results: max_results, next_token: next_token)
        list_file_commit_history(input)
      end
      def list_file_commit_history(input : Types::ListFileCommitHistoryRequest) : Types::ListFileCommitHistoryResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FILE_COMMIT_HISTORY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFileCommitHistoryResponse, "ListFileCommitHistory")
      end

      # Returns a list of pull requests for a specified repository. The return list can be refined by pull
      # request status or pull request author ARN.
      def list_pull_requests(
        repository_name : String,
        author_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        pull_request_status : String? = nil
      ) : Types::ListPullRequestsOutput
        input = Types::ListPullRequestsInput.new(repository_name: repository_name, author_arn: author_arn, max_results: max_results, next_token: next_token, pull_request_status: pull_request_status)
        list_pull_requests(input)
      end
      def list_pull_requests(input : Types::ListPullRequestsInput) : Types::ListPullRequestsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_PULL_REQUESTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPullRequestsOutput, "ListPullRequests")
      end

      # Gets information about one or more repositories.
      def list_repositories(
        next_token : String? = nil,
        order : String? = nil,
        sort_by : String? = nil
      ) : Types::ListRepositoriesOutput
        input = Types::ListRepositoriesInput.new(next_token: next_token, order: order, sort_by: sort_by)
        list_repositories(input)
      end
      def list_repositories(input : Types::ListRepositoriesInput) : Types::ListRepositoriesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_REPOSITORIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRepositoriesOutput, "ListRepositories")
      end

      # Lists all repositories associated with the specified approval rule template.
      def list_repositories_for_approval_rule_template(
        approval_rule_template_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListRepositoriesForApprovalRuleTemplateOutput
        input = Types::ListRepositoriesForApprovalRuleTemplateInput.new(approval_rule_template_name: approval_rule_template_name, max_results: max_results, next_token: next_token)
        list_repositories_for_approval_rule_template(input)
      end
      def list_repositories_for_approval_rule_template(input : Types::ListRepositoriesForApprovalRuleTemplateInput) : Types::ListRepositoriesForApprovalRuleTemplateOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_REPOSITORIES_FOR_APPROVAL_RULE_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListRepositoriesForApprovalRuleTemplateOutput, "ListRepositoriesForApprovalRuleTemplate")
      end

      # Gets information about Amazon Web Servicestags for a specified Amazon Resource Name (ARN) in
      # CodeCommit. For a list of valid resources in CodeCommit, see CodeCommit Resources and Operations in
      # the CodeCommit User Guide .
      def list_tags_for_resource(
        resource_arn : String,
        next_token : String? = nil
      ) : Types::ListTagsForResourceOutput
        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn, next_token: next_token)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Types::ListTagsForResourceOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceOutput, "ListTagsForResource")
      end

      # Merges two branches using the fast-forward merge strategy.
      def merge_branches_by_fast_forward(
        destination_commit_specifier : String,
        repository_name : String,
        source_commit_specifier : String,
        target_branch : String? = nil
      ) : Types::MergeBranchesByFastForwardOutput
        input = Types::MergeBranchesByFastForwardInput.new(destination_commit_specifier: destination_commit_specifier, repository_name: repository_name, source_commit_specifier: source_commit_specifier, target_branch: target_branch)
        merge_branches_by_fast_forward(input)
      end
      def merge_branches_by_fast_forward(input : Types::MergeBranchesByFastForwardInput) : Types::MergeBranchesByFastForwardOutput
        request = Protocol::JsonRpc.build_request(Model::MERGE_BRANCHES_BY_FAST_FORWARD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::MergeBranchesByFastForwardOutput, "MergeBranchesByFastForward")
      end

      # Merges two branches using the squash merge strategy.
      def merge_branches_by_squash(
        destination_commit_specifier : String,
        repository_name : String,
        source_commit_specifier : String,
        author_name : String? = nil,
        commit_message : String? = nil,
        conflict_detail_level : String? = nil,
        conflict_resolution : Types::ConflictResolution? = nil,
        conflict_resolution_strategy : String? = nil,
        email : String? = nil,
        keep_empty_folders : Bool? = nil,
        target_branch : String? = nil
      ) : Types::MergeBranchesBySquashOutput
        input = Types::MergeBranchesBySquashInput.new(destination_commit_specifier: destination_commit_specifier, repository_name: repository_name, source_commit_specifier: source_commit_specifier, author_name: author_name, commit_message: commit_message, conflict_detail_level: conflict_detail_level, conflict_resolution: conflict_resolution, conflict_resolution_strategy: conflict_resolution_strategy, email: email, keep_empty_folders: keep_empty_folders, target_branch: target_branch)
        merge_branches_by_squash(input)
      end
      def merge_branches_by_squash(input : Types::MergeBranchesBySquashInput) : Types::MergeBranchesBySquashOutput
        request = Protocol::JsonRpc.build_request(Model::MERGE_BRANCHES_BY_SQUASH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::MergeBranchesBySquashOutput, "MergeBranchesBySquash")
      end

      # Merges two specified branches using the three-way merge strategy.
      def merge_branches_by_three_way(
        destination_commit_specifier : String,
        repository_name : String,
        source_commit_specifier : String,
        author_name : String? = nil,
        commit_message : String? = nil,
        conflict_detail_level : String? = nil,
        conflict_resolution : Types::ConflictResolution? = nil,
        conflict_resolution_strategy : String? = nil,
        email : String? = nil,
        keep_empty_folders : Bool? = nil,
        target_branch : String? = nil
      ) : Types::MergeBranchesByThreeWayOutput
        input = Types::MergeBranchesByThreeWayInput.new(destination_commit_specifier: destination_commit_specifier, repository_name: repository_name, source_commit_specifier: source_commit_specifier, author_name: author_name, commit_message: commit_message, conflict_detail_level: conflict_detail_level, conflict_resolution: conflict_resolution, conflict_resolution_strategy: conflict_resolution_strategy, email: email, keep_empty_folders: keep_empty_folders, target_branch: target_branch)
        merge_branches_by_three_way(input)
      end
      def merge_branches_by_three_way(input : Types::MergeBranchesByThreeWayInput) : Types::MergeBranchesByThreeWayOutput
        request = Protocol::JsonRpc.build_request(Model::MERGE_BRANCHES_BY_THREE_WAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::MergeBranchesByThreeWayOutput, "MergeBranchesByThreeWay")
      end

      # Attempts to merge the source commit of a pull request into the specified destination branch for that
      # pull request at the specified commit using the fast-forward merge strategy. If the merge is
      # successful, it closes the pull request.
      def merge_pull_request_by_fast_forward(
        pull_request_id : String,
        repository_name : String,
        source_commit_id : String? = nil
      ) : Types::MergePullRequestByFastForwardOutput
        input = Types::MergePullRequestByFastForwardInput.new(pull_request_id: pull_request_id, repository_name: repository_name, source_commit_id: source_commit_id)
        merge_pull_request_by_fast_forward(input)
      end
      def merge_pull_request_by_fast_forward(input : Types::MergePullRequestByFastForwardInput) : Types::MergePullRequestByFastForwardOutput
        request = Protocol::JsonRpc.build_request(Model::MERGE_PULL_REQUEST_BY_FAST_FORWARD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::MergePullRequestByFastForwardOutput, "MergePullRequestByFastForward")
      end

      # Attempts to merge the source commit of a pull request into the specified destination branch for that
      # pull request at the specified commit using the squash merge strategy. If the merge is successful, it
      # closes the pull request.
      def merge_pull_request_by_squash(
        pull_request_id : String,
        repository_name : String,
        author_name : String? = nil,
        commit_message : String? = nil,
        conflict_detail_level : String? = nil,
        conflict_resolution : Types::ConflictResolution? = nil,
        conflict_resolution_strategy : String? = nil,
        email : String? = nil,
        keep_empty_folders : Bool? = nil,
        source_commit_id : String? = nil
      ) : Types::MergePullRequestBySquashOutput
        input = Types::MergePullRequestBySquashInput.new(pull_request_id: pull_request_id, repository_name: repository_name, author_name: author_name, commit_message: commit_message, conflict_detail_level: conflict_detail_level, conflict_resolution: conflict_resolution, conflict_resolution_strategy: conflict_resolution_strategy, email: email, keep_empty_folders: keep_empty_folders, source_commit_id: source_commit_id)
        merge_pull_request_by_squash(input)
      end
      def merge_pull_request_by_squash(input : Types::MergePullRequestBySquashInput) : Types::MergePullRequestBySquashOutput
        request = Protocol::JsonRpc.build_request(Model::MERGE_PULL_REQUEST_BY_SQUASH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::MergePullRequestBySquashOutput, "MergePullRequestBySquash")
      end

      # Attempts to merge the source commit of a pull request into the specified destination branch for that
      # pull request at the specified commit using the three-way merge strategy. If the merge is successful,
      # it closes the pull request.
      def merge_pull_request_by_three_way(
        pull_request_id : String,
        repository_name : String,
        author_name : String? = nil,
        commit_message : String? = nil,
        conflict_detail_level : String? = nil,
        conflict_resolution : Types::ConflictResolution? = nil,
        conflict_resolution_strategy : String? = nil,
        email : String? = nil,
        keep_empty_folders : Bool? = nil,
        source_commit_id : String? = nil
      ) : Types::MergePullRequestByThreeWayOutput
        input = Types::MergePullRequestByThreeWayInput.new(pull_request_id: pull_request_id, repository_name: repository_name, author_name: author_name, commit_message: commit_message, conflict_detail_level: conflict_detail_level, conflict_resolution: conflict_resolution, conflict_resolution_strategy: conflict_resolution_strategy, email: email, keep_empty_folders: keep_empty_folders, source_commit_id: source_commit_id)
        merge_pull_request_by_three_way(input)
      end
      def merge_pull_request_by_three_way(input : Types::MergePullRequestByThreeWayInput) : Types::MergePullRequestByThreeWayOutput
        request = Protocol::JsonRpc.build_request(Model::MERGE_PULL_REQUEST_BY_THREE_WAY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::MergePullRequestByThreeWayOutput, "MergePullRequestByThreeWay")
      end

      # Sets aside (overrides) all approval rule requirements for a specified pull request.
      def override_pull_request_approval_rules(
        override_status : String,
        pull_request_id : String,
        revision_id : String
      ) : Nil
        input = Types::OverridePullRequestApprovalRulesInput.new(override_status: override_status, pull_request_id: pull_request_id, revision_id: revision_id)
        override_pull_request_approval_rules(input)
      end
      def override_pull_request_approval_rules(input : Types::OverridePullRequestApprovalRulesInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::OVERRIDE_PULL_REQUEST_APPROVAL_RULES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Posts a comment on the comparison between two commits.
      def post_comment_for_compared_commit(
        after_commit_id : String,
        content : String,
        repository_name : String,
        before_commit_id : String? = nil,
        client_request_token : String? = nil,
        location : Types::Location? = nil
      ) : Types::PostCommentForComparedCommitOutput
        input = Types::PostCommentForComparedCommitInput.new(after_commit_id: after_commit_id, content: content, repository_name: repository_name, before_commit_id: before_commit_id, client_request_token: client_request_token, location: location)
        post_comment_for_compared_commit(input)
      end
      def post_comment_for_compared_commit(input : Types::PostCommentForComparedCommitInput) : Types::PostCommentForComparedCommitOutput
        request = Protocol::JsonRpc.build_request(Model::POST_COMMENT_FOR_COMPARED_COMMIT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PostCommentForComparedCommitOutput, "PostCommentForComparedCommit")
      end

      # Posts a comment on a pull request.
      def post_comment_for_pull_request(
        after_commit_id : String,
        before_commit_id : String,
        content : String,
        pull_request_id : String,
        repository_name : String,
        client_request_token : String? = nil,
        location : Types::Location? = nil
      ) : Types::PostCommentForPullRequestOutput
        input = Types::PostCommentForPullRequestInput.new(after_commit_id: after_commit_id, before_commit_id: before_commit_id, content: content, pull_request_id: pull_request_id, repository_name: repository_name, client_request_token: client_request_token, location: location)
        post_comment_for_pull_request(input)
      end
      def post_comment_for_pull_request(input : Types::PostCommentForPullRequestInput) : Types::PostCommentForPullRequestOutput
        request = Protocol::JsonRpc.build_request(Model::POST_COMMENT_FOR_PULL_REQUEST, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PostCommentForPullRequestOutput, "PostCommentForPullRequest")
      end

      # Posts a comment in reply to an existing comment on a comparison between commits or a pull request.
      def post_comment_reply(
        content : String,
        in_reply_to : String,
        client_request_token : String? = nil
      ) : Types::PostCommentReplyOutput
        input = Types::PostCommentReplyInput.new(content: content, in_reply_to: in_reply_to, client_request_token: client_request_token)
        post_comment_reply(input)
      end
      def post_comment_reply(input : Types::PostCommentReplyInput) : Types::PostCommentReplyOutput
        request = Protocol::JsonRpc.build_request(Model::POST_COMMENT_REPLY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PostCommentReplyOutput, "PostCommentReply")
      end

      # Adds or updates a reaction to a specified comment for the user whose identity is used to make the
      # request. You can only add or update a reaction for yourself. You cannot add, modify, or delete a
      # reaction for another user.
      def put_comment_reaction(
        comment_id : String,
        reaction_value : String
      ) : Nil
        input = Types::PutCommentReactionInput.new(comment_id: comment_id, reaction_value: reaction_value)
        put_comment_reaction(input)
      end
      def put_comment_reaction(input : Types::PutCommentReactionInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::PUT_COMMENT_REACTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Adds or updates a file in a branch in an CodeCommit repository, and generates a commit for the
      # addition in the specified branch.
      def put_file(
        branch_name : String,
        file_content : Bytes,
        file_path : String,
        repository_name : String,
        commit_message : String? = nil,
        email : String? = nil,
        file_mode : String? = nil,
        name : String? = nil,
        parent_commit_id : String? = nil
      ) : Types::PutFileOutput
        input = Types::PutFileInput.new(branch_name: branch_name, file_content: file_content, file_path: file_path, repository_name: repository_name, commit_message: commit_message, email: email, file_mode: file_mode, name: name, parent_commit_id: parent_commit_id)
        put_file(input)
      end
      def put_file(input : Types::PutFileInput) : Types::PutFileOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_FILE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutFileOutput, "PutFile")
      end

      # Replaces all triggers for a repository. Used to create or delete triggers.
      def put_repository_triggers(
        repository_name : String,
        triggers : Array(Types::RepositoryTrigger)
      ) : Types::PutRepositoryTriggersOutput
        input = Types::PutRepositoryTriggersInput.new(repository_name: repository_name, triggers: triggers)
        put_repository_triggers(input)
      end
      def put_repository_triggers(input : Types::PutRepositoryTriggersInput) : Types::PutRepositoryTriggersOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_REPOSITORY_TRIGGERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutRepositoryTriggersOutput, "PutRepositoryTriggers")
      end

      # Adds or updates tags for a resource in CodeCommit. For a list of valid resources in CodeCommit, see
      # CodeCommit Resources and Operations in the CodeCommit User Guide .
      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Nil
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Tests the functionality of repository triggers by sending information to the trigger target. If real
      # data is available in the repository, the test sends data from the last commit. If no data is
      # available, sample data is generated.
      def test_repository_triggers(
        repository_name : String,
        triggers : Array(Types::RepositoryTrigger)
      ) : Types::TestRepositoryTriggersOutput
        input = Types::TestRepositoryTriggersInput.new(repository_name: repository_name, triggers: triggers)
        test_repository_triggers(input)
      end
      def test_repository_triggers(input : Types::TestRepositoryTriggersInput) : Types::TestRepositoryTriggersOutput
        request = Protocol::JsonRpc.build_request(Model::TEST_REPOSITORY_TRIGGERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TestRepositoryTriggersOutput, "TestRepositoryTriggers")
      end

      # Removes tags for a resource in CodeCommit. For a list of valid resources in CodeCommit, see
      # CodeCommit Resources and Operations in the CodeCommit User Guide .
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Nil
        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the content of an approval rule template. You can change the number of required approvals,
      # the membership of the approval rule, and whether an approval pool is defined.
      def update_approval_rule_template_content(
        approval_rule_template_name : String,
        new_rule_content : String,
        existing_rule_content_sha256 : String? = nil
      ) : Types::UpdateApprovalRuleTemplateContentOutput
        input = Types::UpdateApprovalRuleTemplateContentInput.new(approval_rule_template_name: approval_rule_template_name, new_rule_content: new_rule_content, existing_rule_content_sha256: existing_rule_content_sha256)
        update_approval_rule_template_content(input)
      end
      def update_approval_rule_template_content(input : Types::UpdateApprovalRuleTemplateContentInput) : Types::UpdateApprovalRuleTemplateContentOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_APPROVAL_RULE_TEMPLATE_CONTENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateApprovalRuleTemplateContentOutput, "UpdateApprovalRuleTemplateContent")
      end

      # Updates the description for a specified approval rule template.
      def update_approval_rule_template_description(
        approval_rule_template_description : String,
        approval_rule_template_name : String
      ) : Types::UpdateApprovalRuleTemplateDescriptionOutput
        input = Types::UpdateApprovalRuleTemplateDescriptionInput.new(approval_rule_template_description: approval_rule_template_description, approval_rule_template_name: approval_rule_template_name)
        update_approval_rule_template_description(input)
      end
      def update_approval_rule_template_description(input : Types::UpdateApprovalRuleTemplateDescriptionInput) : Types::UpdateApprovalRuleTemplateDescriptionOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_APPROVAL_RULE_TEMPLATE_DESCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateApprovalRuleTemplateDescriptionOutput, "UpdateApprovalRuleTemplateDescription")
      end

      # Updates the name of a specified approval rule template.
      def update_approval_rule_template_name(
        new_approval_rule_template_name : String,
        old_approval_rule_template_name : String
      ) : Types::UpdateApprovalRuleTemplateNameOutput
        input = Types::UpdateApprovalRuleTemplateNameInput.new(new_approval_rule_template_name: new_approval_rule_template_name, old_approval_rule_template_name: old_approval_rule_template_name)
        update_approval_rule_template_name(input)
      end
      def update_approval_rule_template_name(input : Types::UpdateApprovalRuleTemplateNameInput) : Types::UpdateApprovalRuleTemplateNameOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_APPROVAL_RULE_TEMPLATE_NAME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateApprovalRuleTemplateNameOutput, "UpdateApprovalRuleTemplateName")
      end

      # Replaces the contents of a comment.
      def update_comment(
        comment_id : String,
        content : String
      ) : Types::UpdateCommentOutput
        input = Types::UpdateCommentInput.new(comment_id: comment_id, content: content)
        update_comment(input)
      end
      def update_comment(input : Types::UpdateCommentInput) : Types::UpdateCommentOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_COMMENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCommentOutput, "UpdateComment")
      end

      # Sets or changes the default branch name for the specified repository. If you use this operation to
      # change the default branch name to the current default branch name, a success message is returned
      # even though the default branch did not change.
      def update_default_branch(
        default_branch_name : String,
        repository_name : String
      ) : Nil
        input = Types::UpdateDefaultBranchInput.new(default_branch_name: default_branch_name, repository_name: repository_name)
        update_default_branch(input)
      end
      def update_default_branch(input : Types::UpdateDefaultBranchInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DEFAULT_BRANCH, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the structure of an approval rule created specifically for a pull request. For example, you
      # can change the number of required approvers and the approval pool for approvers.
      def update_pull_request_approval_rule_content(
        approval_rule_name : String,
        new_rule_content : String,
        pull_request_id : String,
        existing_rule_content_sha256 : String? = nil
      ) : Types::UpdatePullRequestApprovalRuleContentOutput
        input = Types::UpdatePullRequestApprovalRuleContentInput.new(approval_rule_name: approval_rule_name, new_rule_content: new_rule_content, pull_request_id: pull_request_id, existing_rule_content_sha256: existing_rule_content_sha256)
        update_pull_request_approval_rule_content(input)
      end
      def update_pull_request_approval_rule_content(input : Types::UpdatePullRequestApprovalRuleContentInput) : Types::UpdatePullRequestApprovalRuleContentOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PULL_REQUEST_APPROVAL_RULE_CONTENT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePullRequestApprovalRuleContentOutput, "UpdatePullRequestApprovalRuleContent")
      end

      # Updates the state of a user's approval on a pull request. The user is derived from the signed-in
      # account when the request is made.
      def update_pull_request_approval_state(
        approval_state : String,
        pull_request_id : String,
        revision_id : String
      ) : Nil
        input = Types::UpdatePullRequestApprovalStateInput.new(approval_state: approval_state, pull_request_id: pull_request_id, revision_id: revision_id)
        update_pull_request_approval_state(input)
      end
      def update_pull_request_approval_state(input : Types::UpdatePullRequestApprovalStateInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PULL_REQUEST_APPROVAL_STATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Replaces the contents of the description of a pull request.
      def update_pull_request_description(
        description : String,
        pull_request_id : String
      ) : Types::UpdatePullRequestDescriptionOutput
        input = Types::UpdatePullRequestDescriptionInput.new(description: description, pull_request_id: pull_request_id)
        update_pull_request_description(input)
      end
      def update_pull_request_description(input : Types::UpdatePullRequestDescriptionInput) : Types::UpdatePullRequestDescriptionOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PULL_REQUEST_DESCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePullRequestDescriptionOutput, "UpdatePullRequestDescription")
      end

      # Updates the status of a pull request.
      def update_pull_request_status(
        pull_request_id : String,
        pull_request_status : String
      ) : Types::UpdatePullRequestStatusOutput
        input = Types::UpdatePullRequestStatusInput.new(pull_request_id: pull_request_id, pull_request_status: pull_request_status)
        update_pull_request_status(input)
      end
      def update_pull_request_status(input : Types::UpdatePullRequestStatusInput) : Types::UpdatePullRequestStatusOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PULL_REQUEST_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePullRequestStatusOutput, "UpdatePullRequestStatus")
      end

      # Replaces the title of a pull request.
      def update_pull_request_title(
        pull_request_id : String,
        title : String
      ) : Types::UpdatePullRequestTitleOutput
        input = Types::UpdatePullRequestTitleInput.new(pull_request_id: pull_request_id, title: title)
        update_pull_request_title(input)
      end
      def update_pull_request_title(input : Types::UpdatePullRequestTitleInput) : Types::UpdatePullRequestTitleOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PULL_REQUEST_TITLE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePullRequestTitleOutput, "UpdatePullRequestTitle")
      end

      # Sets or changes the comment or description for a repository. The description field for a repository
      # accepts all HTML characters and all valid Unicode characters. Applications that do not HTML-encode
      # the description and display it in a webpage can expose users to potentially malicious code. Make
      # sure that you HTML-encode the description field in any application that uses this API to display the
      # repository description on a webpage.
      def update_repository_description(
        repository_name : String,
        repository_description : String? = nil
      ) : Nil
        input = Types::UpdateRepositoryDescriptionInput.new(repository_name: repository_name, repository_description: repository_description)
        update_repository_description(input)
      end
      def update_repository_description(input : Types::UpdateRepositoryDescriptionInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_REPOSITORY_DESCRIPTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates the Key Management Service encryption key used to encrypt and decrypt a CodeCommit
      # repository.
      def update_repository_encryption_key(
        kms_key_id : String,
        repository_name : String
      ) : Types::UpdateRepositoryEncryptionKeyOutput
        input = Types::UpdateRepositoryEncryptionKeyInput.new(kms_key_id: kms_key_id, repository_name: repository_name)
        update_repository_encryption_key(input)
      end
      def update_repository_encryption_key(input : Types::UpdateRepositoryEncryptionKeyInput) : Types::UpdateRepositoryEncryptionKeyOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_REPOSITORY_ENCRYPTION_KEY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateRepositoryEncryptionKeyOutput, "UpdateRepositoryEncryptionKey")
      end

      # Renames a repository. The repository name must be unique across the calling Amazon Web Services
      # account. Repository names are limited to 100 alphanumeric, dash, and underscore characters, and
      # cannot include certain characters. The suffix .git is prohibited. For more information about the
      # limits on repository names, see Quotas in the CodeCommit User Guide.
      def update_repository_name(
        new_name : String,
        old_name : String
      ) : Nil
        input = Types::UpdateRepositoryNameInput.new(new_name: new_name, old_name: old_name)
        update_repository_name(input)
      end
      def update_repository_name(input : Types::UpdateRepositoryNameInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::UPDATE_REPOSITORY_NAME, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end
    end
  end
end
