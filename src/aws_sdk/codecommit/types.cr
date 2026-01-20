require "json"
require "time"

module AwsSdk
  module CodeCommit
    module Types

      # The specified Amazon Resource Name (ARN) does not exist in the Amazon Web Services account.

      struct ActorDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # Returns information about a specific approval on a pull request.

      struct Approval
        include JSON::Serializable

        # The state of the approval, APPROVE or REVOKE. REVOKE states are not stored.

        @[JSON::Field(key: "approvalState")]
        getter approval_state : String?

        # The Amazon Resource Name (ARN) of the user.

        @[JSON::Field(key: "userArn")]
        getter user_arn : String?

        def initialize(
          @approval_state : String? = nil,
          @user_arn : String? = nil
        )
        end
      end

      # Returns information about an approval rule.

      struct ApprovalRule
        include JSON::Serializable

        # The content of the approval rule.

        @[JSON::Field(key: "approvalRuleContent")]
        getter approval_rule_content : String?

        # The system-generated ID of the approval rule.

        @[JSON::Field(key: "approvalRuleId")]
        getter approval_rule_id : String?

        # The name of the approval rule.

        @[JSON::Field(key: "approvalRuleName")]
        getter approval_rule_name : String?

        # The date the approval rule was created, in timestamp format.

        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # The date the approval rule was most recently changed, in timestamp format.

        @[JSON::Field(key: "lastModifiedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # The Amazon Resource Name (ARN) of the user who made the most recent changes to the approval rule.

        @[JSON::Field(key: "lastModifiedUser")]
        getter last_modified_user : String?

        # The approval rule template used to create the rule.

        @[JSON::Field(key: "originApprovalRuleTemplate")]
        getter origin_approval_rule_template : Types::OriginApprovalRuleTemplate?

        # The SHA-256 hash signature for the content of the approval rule.

        @[JSON::Field(key: "ruleContentSha256")]
        getter rule_content_sha256 : String?

        def initialize(
          @approval_rule_content : String? = nil,
          @approval_rule_id : String? = nil,
          @approval_rule_name : String? = nil,
          @creation_date : Time? = nil,
          @last_modified_date : Time? = nil,
          @last_modified_user : String? = nil,
          @origin_approval_rule_template : Types::OriginApprovalRuleTemplate? = nil,
          @rule_content_sha256 : String? = nil
        )
        end
      end

      # The content for the approval rule is empty. You must provide some content for an approval rule. The
      # content cannot be null.

      struct ApprovalRuleContentRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified approval rule does not exist.

      struct ApprovalRuleDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # Returns information about an event for an approval rule.

      struct ApprovalRuleEventMetadata
        include JSON::Serializable

        # The content of the approval rule.

        @[JSON::Field(key: "approvalRuleContent")]
        getter approval_rule_content : String?

        # The system-generated ID of the approval rule.

        @[JSON::Field(key: "approvalRuleId")]
        getter approval_rule_id : String?

        # The name of the approval rule.

        @[JSON::Field(key: "approvalRuleName")]
        getter approval_rule_name : String?

        def initialize(
          @approval_rule_content : String? = nil,
          @approval_rule_id : String? = nil,
          @approval_rule_name : String? = nil
        )
        end
      end

      # An approval rule with that name already exists. Approval rule names must be unique within the scope
      # of a pull request.

      struct ApprovalRuleNameAlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # An approval rule name is required, but was not specified.

      struct ApprovalRuleNameRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # Returns information about an override event for approval rules for a pull request.

      struct ApprovalRuleOverriddenEventMetadata
        include JSON::Serializable

        # The status of the override event.

        @[JSON::Field(key: "overrideStatus")]
        getter override_status : String?

        # The revision ID of the pull request when the override event occurred.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        def initialize(
          @override_status : String? = nil,
          @revision_id : String? = nil
        )
        end
      end

      # Returns information about an approval rule template.

      struct ApprovalRuleTemplate
        include JSON::Serializable

        # The content of the approval rule template.

        @[JSON::Field(key: "approvalRuleTemplateContent")]
        getter approval_rule_template_content : String?

        # The description of the approval rule template.

        @[JSON::Field(key: "approvalRuleTemplateDescription")]
        getter approval_rule_template_description : String?

        # The system-generated ID of the approval rule template.

        @[JSON::Field(key: "approvalRuleTemplateId")]
        getter approval_rule_template_id : String?

        # The name of the approval rule template.

        @[JSON::Field(key: "approvalRuleTemplateName")]
        getter approval_rule_template_name : String?

        # The date the approval rule template was created, in timestamp format.

        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # The date the approval rule template was most recently changed, in timestamp format.

        @[JSON::Field(key: "lastModifiedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # The Amazon Resource Name (ARN) of the user who made the most recent changes to the approval rule
        # template.

        @[JSON::Field(key: "lastModifiedUser")]
        getter last_modified_user : String?

        # The SHA-256 hash signature for the content of the approval rule template.

        @[JSON::Field(key: "ruleContentSha256")]
        getter rule_content_sha256 : String?

        def initialize(
          @approval_rule_template_content : String? = nil,
          @approval_rule_template_description : String? = nil,
          @approval_rule_template_id : String? = nil,
          @approval_rule_template_name : String? = nil,
          @creation_date : Time? = nil,
          @last_modified_date : Time? = nil,
          @last_modified_user : String? = nil,
          @rule_content_sha256 : String? = nil
        )
        end
      end

      # The content for the approval rule template is empty. You must provide some content for an approval
      # rule template. The content cannot be null.

      struct ApprovalRuleTemplateContentRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified approval rule template does not exist. Verify that the name is correct and that you
      # are signed in to the Amazon Web Services Region where the template was created, and then try again.

      struct ApprovalRuleTemplateDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # The approval rule template is associated with one or more repositories. You cannot delete a template
      # that is associated with a repository. Remove all associations, and then try again.

      struct ApprovalRuleTemplateInUseException
        include JSON::Serializable

        def initialize
        end
      end

      # You cannot create an approval rule template with that name because a template with that name already
      # exists in this Amazon Web Services Region for your Amazon Web Services account. Approval rule
      # template names must be unique.

      struct ApprovalRuleTemplateNameAlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # An approval rule template name is required, but was not specified.

      struct ApprovalRuleTemplateNameRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # Returns information about a change in the approval state for a pull request.

      struct ApprovalStateChangedEventMetadata
        include JSON::Serializable

        # The approval status for the pull request.

        @[JSON::Field(key: "approvalStatus")]
        getter approval_status : String?

        # The revision ID of the pull request when the approval state changed.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        def initialize(
          @approval_status : String? = nil,
          @revision_id : String? = nil
        )
        end
      end

      # An approval state is required, but was not specified.

      struct ApprovalStateRequiredException
        include JSON::Serializable

        def initialize
        end
      end


      struct AssociateApprovalRuleTemplateWithRepositoryInput
        include JSON::Serializable

        # The name for the approval rule template.

        @[JSON::Field(key: "approvalRuleTemplateName")]
        getter approval_rule_template_name : String

        # The name of the repository that you want to associate with the template.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        def initialize(
          @approval_rule_template_name : String,
          @repository_name : String
        )
        end
      end

      # The specified Amazon Resource Name (ARN) does not exist in the Amazon Web Services account.

      struct AuthorDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # Returns information about errors in a BatchAssociateApprovalRuleTemplateWithRepositories operation.

      struct BatchAssociateApprovalRuleTemplateWithRepositoriesError
        include JSON::Serializable

        # An error code that specifies whether the repository name was not valid or not found.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # An error message that provides details about why the repository name was not found or not valid.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The name of the repository where the association was not made.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @repository_name : String? = nil
        )
        end
      end


      struct BatchAssociateApprovalRuleTemplateWithRepositoriesInput
        include JSON::Serializable

        # The name of the template you want to associate with one or more repositories.

        @[JSON::Field(key: "approvalRuleTemplateName")]
        getter approval_rule_template_name : String

        # The names of the repositories you want to associate with the template. The length constraint limit
        # is for each string in the array. The array itself can be empty.

        @[JSON::Field(key: "repositoryNames")]
        getter repository_names : Array(String)

        def initialize(
          @approval_rule_template_name : String,
          @repository_names : Array(String)
        )
        end
      end


      struct BatchAssociateApprovalRuleTemplateWithRepositoriesOutput
        include JSON::Serializable

        # A list of names of the repositories that have been associated with the template.

        @[JSON::Field(key: "associatedRepositoryNames")]
        getter associated_repository_names : Array(String)

        # A list of any errors that might have occurred while attempting to create the association between the
        # template and the repositories.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchAssociateApprovalRuleTemplateWithRepositoriesError)

        def initialize(
          @associated_repository_names : Array(String),
          @errors : Array(Types::BatchAssociateApprovalRuleTemplateWithRepositoriesError)
        )
        end
      end

      # Returns information about errors in a BatchDescribeMergeConflicts operation.

      struct BatchDescribeMergeConflictsError
        include JSON::Serializable

        # The name of the exception.

        @[JSON::Field(key: "exceptionName")]
        getter exception_name : String

        # The path to the file.

        @[JSON::Field(key: "filePath")]
        getter file_path : String

        # The message provided by the exception.

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @exception_name : String,
          @file_path : String,
          @message : String
        )
        end
      end


      struct BatchDescribeMergeConflictsInput
        include JSON::Serializable

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a
        # branch name or a full commit ID).

        @[JSON::Field(key: "destinationCommitSpecifier")]
        getter destination_commit_specifier : String

        # The merge option or strategy you want to use to merge the code.

        @[JSON::Field(key: "mergeOption")]
        getter merge_option : String

        # The name of the repository that contains the merge conflicts you want to review.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a
        # branch name or a full commit ID).

        @[JSON::Field(key: "sourceCommitSpecifier")]
        getter source_commit_specifier : String

        # The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a
        # not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified,
        # a conflict is considered not mergeable if the same file in both branches has differences on the same
        # line.

        @[JSON::Field(key: "conflictDetailLevel")]
        getter conflict_detail_level : String?

        # Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging
        # two versions of a file. The default is NONE, which requires any conflicts to be resolved manually
        # before the merge operation is successful.

        @[JSON::Field(key: "conflictResolutionStrategy")]
        getter conflict_resolution_strategy : String?

        # The path of the target files used to describe the conflicts. If not specified, the default is all
        # conflict files.

        @[JSON::Field(key: "filePaths")]
        getter file_paths : Array(String)?

        # The maximum number of files to include in the output.

        @[JSON::Field(key: "maxConflictFiles")]
        getter max_conflict_files : Int32?

        # The maximum number of merge hunks to include in the output.

        @[JSON::Field(key: "maxMergeHunks")]
        getter max_merge_hunks : Int32?

        # An enumeration token that, when provided in a request, returns the next batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @destination_commit_specifier : String,
          @merge_option : String,
          @repository_name : String,
          @source_commit_specifier : String,
          @conflict_detail_level : String? = nil,
          @conflict_resolution_strategy : String? = nil,
          @file_paths : Array(String)? = nil,
          @max_conflict_files : Int32? = nil,
          @max_merge_hunks : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct BatchDescribeMergeConflictsOutput
        include JSON::Serializable

        # A list of conflicts for each file, including the conflict metadata and the hunks of the differences
        # between the files.

        @[JSON::Field(key: "conflicts")]
        getter conflicts : Array(Types::Conflict)

        # The commit ID of the destination commit specifier that was used in the merge evaluation.

        @[JSON::Field(key: "destinationCommitId")]
        getter destination_commit_id : String

        # The commit ID of the source commit specifier that was used in the merge evaluation.

        @[JSON::Field(key: "sourceCommitId")]
        getter source_commit_id : String

        # The commit ID of the merge base.

        @[JSON::Field(key: "baseCommitId")]
        getter base_commit_id : String?

        # A list of any errors returned while describing the merge conflicts for each file.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchDescribeMergeConflictsError)?

        # An enumeration token that can be used in a request to return the next batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @conflicts : Array(Types::Conflict),
          @destination_commit_id : String,
          @source_commit_id : String,
          @base_commit_id : String? = nil,
          @errors : Array(Types::BatchDescribeMergeConflictsError)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Returns information about errors in a BatchDisassociateApprovalRuleTemplateFromRepositories
      # operation.

      struct BatchDisassociateApprovalRuleTemplateFromRepositoriesError
        include JSON::Serializable

        # An error code that specifies whether the repository name was not valid or not found.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # An error message that provides details about why the repository name was either not found or not
        # valid.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The name of the repository where the association with the template was not able to be removed.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @repository_name : String? = nil
        )
        end
      end


      struct BatchDisassociateApprovalRuleTemplateFromRepositoriesInput
        include JSON::Serializable

        # The name of the template that you want to disassociate from one or more repositories.

        @[JSON::Field(key: "approvalRuleTemplateName")]
        getter approval_rule_template_name : String

        # The repository names that you want to disassociate from the approval rule template. The length
        # constraint limit is for each string in the array. The array itself can be empty.

        @[JSON::Field(key: "repositoryNames")]
        getter repository_names : Array(String)

        def initialize(
          @approval_rule_template_name : String,
          @repository_names : Array(String)
        )
        end
      end


      struct BatchDisassociateApprovalRuleTemplateFromRepositoriesOutput
        include JSON::Serializable

        # A list of repository names that have had their association with the template removed.

        @[JSON::Field(key: "disassociatedRepositoryNames")]
        getter disassociated_repository_names : Array(String)

        # A list of any errors that might have occurred while attempting to remove the association between the
        # template and the repositories.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchDisassociateApprovalRuleTemplateFromRepositoriesError)

        def initialize(
          @disassociated_repository_names : Array(String),
          @errors : Array(Types::BatchDisassociateApprovalRuleTemplateFromRepositoriesError)
        )
        end
      end

      # Returns information about errors in a BatchGetCommits operation.

      struct BatchGetCommitsError
        include JSON::Serializable

        # A commit ID that either could not be found or was not in a valid format.

        @[JSON::Field(key: "commitId")]
        getter commit_id : String?

        # An error code that specifies whether the commit ID was not valid or not found.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # An error message that provides detail about why the commit ID either was not found or was not valid.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @commit_id : String? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end


      struct BatchGetCommitsInput
        include JSON::Serializable

        # The full commit IDs of the commits to get information about. You must supply the full SHA IDs of
        # each commit. You cannot use shortened SHA IDs.

        @[JSON::Field(key: "commitIds")]
        getter commit_ids : Array(String)

        # The name of the repository that contains the commits.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        def initialize(
          @commit_ids : Array(String),
          @repository_name : String
        )
        end
      end


      struct BatchGetCommitsOutput
        include JSON::Serializable

        # An array of commit data type objects, each of which contains information about a specified commit.

        @[JSON::Field(key: "commits")]
        getter commits : Array(Types::Commit)?

        # Returns any commit IDs for which information could not be found. For example, if one of the commit
        # IDs was a shortened SHA ID or that commit was not found in the specified repository, the ID returns
        # an error object with more information.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchGetCommitsError)?

        def initialize(
          @commits : Array(Types::Commit)? = nil,
          @errors : Array(Types::BatchGetCommitsError)? = nil
        )
        end
      end

      # Returns information about errors in a BatchGetRepositories operation.

      struct BatchGetRepositoriesError
        include JSON::Serializable

        # An error code that specifies the type of failure.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # An error message that provides detail about why the repository either was not found or was not in a
        # valid state.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The ID of a repository that either could not be found or was not in a valid state.

        @[JSON::Field(key: "repositoryId")]
        getter repository_id : String?

        # The name of a repository that either could not be found or was not in a valid state.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @repository_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      # Represents the input of a batch get repositories operation.

      struct BatchGetRepositoriesInput
        include JSON::Serializable

        # The names of the repositories to get information about. The length constraint limit is for each
        # string in the array. The array itself can be empty.

        @[JSON::Field(key: "repositoryNames")]
        getter repository_names : Array(String)

        def initialize(
          @repository_names : Array(String)
        )
        end
      end

      # Represents the output of a batch get repositories operation.

      struct BatchGetRepositoriesOutput
        include JSON::Serializable

        # Returns information about any errors returned when attempting to retrieve information about the
        # repositories.

        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::BatchGetRepositoriesError)?

        # A list of repositories returned by the batch get repositories operation.

        @[JSON::Field(key: "repositories")]
        getter repositories : Array(Types::RepositoryMetadata)?

        # Returns a list of repository names for which information could not be found.

        @[JSON::Field(key: "repositoriesNotFound")]
        getter repositories_not_found : Array(String)?

        def initialize(
          @errors : Array(Types::BatchGetRepositoriesError)? = nil,
          @repositories : Array(Types::RepositoryMetadata)? = nil,
          @repositories_not_found : Array(String)? = nil
        )
        end
      end

      # The before commit ID and the after commit ID are the same, which is not valid. The before commit ID
      # and the after commit ID must be different commit IDs.

      struct BeforeCommitIdAndAfterCommitIdAreSameException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified blob does not exist.

      struct BlobIdDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # A blob ID is required, but was not specified.

      struct BlobIdRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # Returns information about a specific Git blob object.

      struct BlobMetadata
        include JSON::Serializable

        # The full ID of the blob.

        @[JSON::Field(key: "blobId")]
        getter blob_id : String?

        # The file mode permissions of the blob. File mode permission codes include: 100644 indicates
        # read/write 100755 indicates read/write/execute 160000 indicates a submodule 120000 indicates a
        # symlink

        @[JSON::Field(key: "mode")]
        getter mode : String?

        # The path to the blob and associated file name, if any.

        @[JSON::Field(key: "path")]
        getter path : String?

        def initialize(
          @blob_id : String? = nil,
          @mode : String? = nil,
          @path : String? = nil
        )
        end
      end

      # The specified branch does not exist.

      struct BranchDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # Returns information about a branch.

      struct BranchInfo
        include JSON::Serializable

        # The name of the branch.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String?

        # The ID of the last commit made to the branch.

        @[JSON::Field(key: "commitId")]
        getter commit_id : String?

        def initialize(
          @branch_name : String? = nil,
          @commit_id : String? = nil
        )
        end
      end

      # Cannot create the branch with the specified name because the commit conflicts with an existing
      # branch with the same name. Branch names must be unique.

      struct BranchNameExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified branch name is not valid because it is a tag name. Enter the name of a branch in the
      # repository. For a list of valid branch names, use ListBranches .

      struct BranchNameIsTagNameException
        include JSON::Serializable

        def initialize
        end
      end

      # A branch name is required, but was not specified.

      struct BranchNameRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The approval rule cannot be deleted from the pull request because it was created by an approval rule
      # template and applied to the pull request automatically.

      struct CannotDeleteApprovalRuleFromTemplateException
        include JSON::Serializable

        def initialize
        end
      end

      # The approval rule cannot be modified for the pull request because it was created by an approval rule
      # template and applied to the pull request automatically.

      struct CannotModifyApprovalRuleFromTemplateException
        include JSON::Serializable

        def initialize
        end
      end

      # A client request token is required. A client request token is an unique, client-generated
      # idempotency token that, when provided in a request, ensures the request cannot be repeated with a
      # changed parameter. If a request is received with the same parameters and a token is included, the
      # request returns information about the initial request that used that token.

      struct ClientRequestTokenRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # Returns information about a specific comment.

      struct Comment
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the person who posted the comment.

        @[JSON::Field(key: "authorArn")]
        getter author_arn : String?

        # The emoji reactions to a comment, if any, submitted by the user whose credentials are associated
        # with the call to the API.

        @[JSON::Field(key: "callerReactions")]
        getter caller_reactions : Array(String)?

        # A unique, client-generated idempotency token that, when provided in a request, ensures the request
        # cannot be repeated with a changed parameter. If a request is received with the same parameters and a
        # token is included, the request returns information about the initial request that used that token.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The system-generated comment ID.

        @[JSON::Field(key: "commentId")]
        getter comment_id : String?

        # The content of the comment.

        @[JSON::Field(key: "content")]
        getter content : String?

        # The date and time the comment was created, in timestamp format.

        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # A Boolean value indicating whether the comment has been deleted.

        @[JSON::Field(key: "deleted")]
        getter deleted : Bool?

        # The ID of the comment for which this comment is a reply, if any.

        @[JSON::Field(key: "inReplyTo")]
        getter in_reply_to : String?

        # The date and time the comment was most recently modified, in timestamp format.

        @[JSON::Field(key: "lastModifiedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # A string to integer map that represents the number of individual users who have responded to a
        # comment with the specified reactions.

        @[JSON::Field(key: "reactionCounts")]
        getter reaction_counts : Hash(String, Int32)?

        def initialize(
          @author_arn : String? = nil,
          @caller_reactions : Array(String)? = nil,
          @client_request_token : String? = nil,
          @comment_id : String? = nil,
          @content : String? = nil,
          @creation_date : Time? = nil,
          @deleted : Bool? = nil,
          @in_reply_to : String? = nil,
          @last_modified_date : Time? = nil,
          @reaction_counts : Hash(String, Int32)? = nil
        )
        end
      end

      # The comment is empty. You must provide some content for a comment. The content cannot be null.

      struct CommentContentRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The comment is too large. Comments are limited to 10,240 characters.

      struct CommentContentSizeLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # This comment has already been deleted. You cannot edit or delete a deleted comment.

      struct CommentDeletedException
        include JSON::Serializable

        def initialize
        end
      end

      # No comment exists with the provided ID. Verify that you have used the correct ID, and then try
      # again.

      struct CommentDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # The comment ID is missing or null. A comment ID is required.

      struct CommentIdRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # You cannot modify or delete this comment. Only comment authors can modify or delete their comments.

      struct CommentNotCreatedByCallerException
        include JSON::Serializable

        def initialize
        end
      end

      # Returns information about comments on the comparison between two commits.

      struct CommentsForComparedCommit
        include JSON::Serializable

        # The full blob ID of the commit used to establish the after of the comparison.

        @[JSON::Field(key: "afterBlobId")]
        getter after_blob_id : String?

        # The full commit ID of the commit used to establish the after of the comparison.

        @[JSON::Field(key: "afterCommitId")]
        getter after_commit_id : String?

        # The full blob ID of the commit used to establish the before of the comparison.

        @[JSON::Field(key: "beforeBlobId")]
        getter before_blob_id : String?

        # The full commit ID of the commit used to establish the before of the comparison.

        @[JSON::Field(key: "beforeCommitId")]
        getter before_commit_id : String?

        # An array of comment objects. Each comment object contains information about a comment on the
        # comparison between commits.

        @[JSON::Field(key: "comments")]
        getter comments : Array(Types::Comment)?

        # Location information about the comment on the comparison, including the file name, line number, and
        # whether the version of the file where the comment was made is BEFORE or AFTER.

        @[JSON::Field(key: "location")]
        getter location : Types::Location?

        # The name of the repository that contains the compared commits.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @after_blob_id : String? = nil,
          @after_commit_id : String? = nil,
          @before_blob_id : String? = nil,
          @before_commit_id : String? = nil,
          @comments : Array(Types::Comment)? = nil,
          @location : Types::Location? = nil,
          @repository_name : String? = nil
        )
        end
      end

      # Returns information about comments on a pull request.

      struct CommentsForPullRequest
        include JSON::Serializable

        # The full blob ID of the file on which you want to comment on the source commit.

        @[JSON::Field(key: "afterBlobId")]
        getter after_blob_id : String?

        # The full commit ID of the commit that was the tip of the source branch at the time the comment was
        # made.

        @[JSON::Field(key: "afterCommitId")]
        getter after_commit_id : String?

        # The full blob ID of the file on which you want to comment on the destination commit.

        @[JSON::Field(key: "beforeBlobId")]
        getter before_blob_id : String?

        # The full commit ID of the commit that was the tip of the destination branch when the pull request
        # was created. This commit is superceded by the after commit in the source branch when and if you
        # merge the source branch into the destination branch.

        @[JSON::Field(key: "beforeCommitId")]
        getter before_commit_id : String?

        # An array of comment objects. Each comment object contains information about a comment on the pull
        # request.

        @[JSON::Field(key: "comments")]
        getter comments : Array(Types::Comment)?

        # Location information about the comment on the pull request, including the file name, line number,
        # and whether the version of the file where the comment was made is BEFORE (destination branch) or
        # AFTER (source branch).

        @[JSON::Field(key: "location")]
        getter location : Types::Location?

        # The system-generated ID of the pull request.

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String?

        # The name of the repository that contains the pull request.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @after_blob_id : String? = nil,
          @after_commit_id : String? = nil,
          @before_blob_id : String? = nil,
          @before_commit_id : String? = nil,
          @comments : Array(Types::Comment)? = nil,
          @location : Types::Location? = nil,
          @pull_request_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      # Returns information about a specific commit.

      struct Commit
        include JSON::Serializable

        # Any other data associated with the specified commit.

        @[JSON::Field(key: "additionalData")]
        getter additional_data : String?

        # Information about the author of the specified commit. Information includes the date in timestamp
        # format with GMT offset, the name of the author, and the email address for the author, as configured
        # in Git.

        @[JSON::Field(key: "author")]
        getter author : Types::UserInfo?

        # The full SHA ID of the specified commit.

        @[JSON::Field(key: "commitId")]
        getter commit_id : String?

        # Information about the person who committed the specified commit, also known as the committer.
        # Information includes the date in timestamp format with GMT offset, the name of the committer, and
        # the email address for the committer, as configured in Git. For more information about the difference
        # between an author and a committer in Git, see Viewing the Commit History in Pro Git by Scott Chacon
        # and Ben Straub.

        @[JSON::Field(key: "committer")]
        getter committer : Types::UserInfo?

        # The commit message associated with the specified commit.

        @[JSON::Field(key: "message")]
        getter message : String?

        # A list of parent commits for the specified commit. Each parent commit ID is the full commit ID.

        @[JSON::Field(key: "parents")]
        getter parents : Array(String)?

        # Tree information for the specified commit.

        @[JSON::Field(key: "treeId")]
        getter tree_id : String?

        def initialize(
          @additional_data : String? = nil,
          @author : Types::UserInfo? = nil,
          @commit_id : String? = nil,
          @committer : Types::UserInfo? = nil,
          @message : String? = nil,
          @parents : Array(String)? = nil,
          @tree_id : String? = nil
        )
        end
      end

      # The specified commit does not exist or no commit was specified, and the specified repository has no
      # default branch.

      struct CommitDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified commit ID does not exist.

      struct CommitIdDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # A commit ID was not specified.

      struct CommitIdRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The maximum number of allowed commit IDs in a batch request is 100. Verify that your batch requests
      # contains no more than 100 commit IDs, and then try again.

      struct CommitIdsLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # A list of commit IDs is required, but was either not specified or the list was empty.

      struct CommitIdsListRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The commit message is too long. Provide a shorter string.

      struct CommitMessageLengthExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # A commit was not specified.

      struct CommitRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The merge cannot be completed because the target branch has been modified. Another user might have
      # modified the target branch while the merge was in progress. Wait a few minutes, and then try again.

      struct ConcurrentReferenceUpdateException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about conflicts in a merge operation.

      struct Conflict
        include JSON::Serializable

        # Metadata about a conflict in a merge operation.

        @[JSON::Field(key: "conflictMetadata")]
        getter conflict_metadata : Types::ConflictMetadata?

        # A list of hunks that contain the differences between files or lines causing the conflict.

        @[JSON::Field(key: "mergeHunks")]
        getter merge_hunks : Array(Types::MergeHunk)?

        def initialize(
          @conflict_metadata : Types::ConflictMetadata? = nil,
          @merge_hunks : Array(Types::MergeHunk)? = nil
        )
        end
      end

      # Information about the metadata for a conflict in a merge operation.

      struct ConflictMetadata
        include JSON::Serializable

        # A boolean value indicating whether there are conflicts in the content of a file.

        @[JSON::Field(key: "contentConflict")]
        getter content_conflict : Bool?

        # A boolean value indicating whether there are conflicts in the file mode of a file.

        @[JSON::Field(key: "fileModeConflict")]
        getter file_mode_conflict : Bool?

        # The file modes of the file in the source, destination, and base of the merge.

        @[JSON::Field(key: "fileModes")]
        getter file_modes : Types::FileModes?

        # The path of the file that contains conflicts.

        @[JSON::Field(key: "filePath")]
        getter file_path : String?

        # The file sizes of the file in the source, destination, and base of the merge.

        @[JSON::Field(key: "fileSizes")]
        getter file_sizes : Types::FileSizes?

        # A boolean value (true or false) indicating whether the file is binary or textual in the source,
        # destination, and base of the merge.

        @[JSON::Field(key: "isBinaryFile")]
        getter is_binary_file : Types::IsBinaryFile?

        # Whether an add, modify, or delete operation caused the conflict between the source and destination
        # of the merge.

        @[JSON::Field(key: "mergeOperations")]
        getter merge_operations : Types::MergeOperations?

        # The number of conflicts, including both hunk conflicts and metadata conflicts.

        @[JSON::Field(key: "numberOfConflicts")]
        getter number_of_conflicts : Int32?

        # A boolean value (true or false) indicating whether there are conflicts between the branches in the
        # object type of a file, folder, or submodule.

        @[JSON::Field(key: "objectTypeConflict")]
        getter object_type_conflict : Bool?

        # Information about any object type conflicts in a merge operation.

        @[JSON::Field(key: "objectTypes")]
        getter object_types : Types::ObjectTypes?

        def initialize(
          @content_conflict : Bool? = nil,
          @file_mode_conflict : Bool? = nil,
          @file_modes : Types::FileModes? = nil,
          @file_path : String? = nil,
          @file_sizes : Types::FileSizes? = nil,
          @is_binary_file : Types::IsBinaryFile? = nil,
          @merge_operations : Types::MergeOperations? = nil,
          @number_of_conflicts : Int32? = nil,
          @object_type_conflict : Bool? = nil,
          @object_types : Types::ObjectTypes? = nil
        )
        end
      end

      # If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving conflicts
      # during a merge.

      struct ConflictResolution
        include JSON::Serializable

        # Files to be deleted as part of the merge conflict resolution.

        @[JSON::Field(key: "deleteFiles")]
        getter delete_files : Array(Types::DeleteFileEntry)?

        # Files to have content replaced as part of the merge conflict resolution.

        @[JSON::Field(key: "replaceContents")]
        getter replace_contents : Array(Types::ReplaceContentEntry)?

        # File modes that are set as part of the merge conflict resolution.

        @[JSON::Field(key: "setFileModes")]
        getter set_file_modes : Array(Types::SetFileModeEntry)?

        def initialize(
          @delete_files : Array(Types::DeleteFileEntry)? = nil,
          @replace_contents : Array(Types::ReplaceContentEntry)? = nil,
          @set_file_modes : Array(Types::SetFileModeEntry)? = nil
        )
        end
      end


      struct CreateApprovalRuleTemplateInput
        include JSON::Serializable

        # The content of the approval rule that is created on pull requests in associated repositories. If you
        # specify one or more destination references (branches), approval rules are created in an associated
        # repository only if their destination references (branches) match those specified in the template.
        # When you create the content of the approval rule template, you can specify approvers in an approval
        # pool in one of two ways: CodeCommitApprovers : This option only requires an Amazon Web Services
        # account and a resource. It can be used for both IAM users and federated access users whose name
        # matches the provided resource name. This is a very powerful option that offers a great deal of
        # flexibility. For example, if you specify the Amazon Web Services account 123456789012 and Mary_Major
        # , all of the following are counted as approvals coming from that user: An IAM user in the account
        # (arn:aws:iam:: 123456789012 :user/ Mary_Major ) A federated user identified in IAM as Mary_Major
        # (arn:aws:sts:: 123456789012 :federated-user/ Mary_Major ) This option does not recognize an active
        # session of someone assuming the role of CodeCommitReview with a role session name of Mary_Major
        # (arn:aws:sts:: 123456789012 :assumed-role/CodeCommitReview/ Mary_Major ) unless you include a
        # wildcard (*Mary_Major). Fully qualified ARN : This option allows you to specify the fully qualified
        # Amazon Resource Name (ARN) of the IAM user or role. For more information about IAM ARNs, wildcards,
        # and formats, see IAM Identifiers in the IAM User Guide .

        @[JSON::Field(key: "approvalRuleTemplateContent")]
        getter approval_rule_template_content : String

        # The name of the approval rule template. Provide descriptive names, because this name is applied to
        # the approval rules created automatically in associated repositories.

        @[JSON::Field(key: "approvalRuleTemplateName")]
        getter approval_rule_template_name : String

        # The description of the approval rule template. Consider providing a description that explains what
        # this template does and when it might be appropriate to associate it with repositories.

        @[JSON::Field(key: "approvalRuleTemplateDescription")]
        getter approval_rule_template_description : String?

        def initialize(
          @approval_rule_template_content : String,
          @approval_rule_template_name : String,
          @approval_rule_template_description : String? = nil
        )
        end
      end


      struct CreateApprovalRuleTemplateOutput
        include JSON::Serializable

        # The content and structure of the created approval rule template.

        @[JSON::Field(key: "approvalRuleTemplate")]
        getter approval_rule_template : Types::ApprovalRuleTemplate

        def initialize(
          @approval_rule_template : Types::ApprovalRuleTemplate
        )
        end
      end

      # Represents the input of a create branch operation.

      struct CreateBranchInput
        include JSON::Serializable

        # The name of the new branch to create.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        # The ID of the commit to point the new branch to.

        @[JSON::Field(key: "commitId")]
        getter commit_id : String

        # The name of the repository in which you want to create the new branch.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        def initialize(
          @branch_name : String,
          @commit_id : String,
          @repository_name : String
        )
        end
      end


      struct CreateCommitInput
        include JSON::Serializable

        # The name of the branch where you create the commit.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        # The name of the repository where you create the commit.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The name of the author who created the commit. This information is used as both the author and
        # committer for the commit.

        @[JSON::Field(key: "authorName")]
        getter author_name : String?

        # The commit message you want to include in the commit. Commit messages are limited to 256 KB. If no
        # message is specified, a default message is used.

        @[JSON::Field(key: "commitMessage")]
        getter commit_message : String?

        # The files to delete in this commit. These files still exist in earlier commits.

        @[JSON::Field(key: "deleteFiles")]
        getter delete_files : Array(Types::DeleteFileEntry)?

        # The email address of the person who created the commit.

        @[JSON::Field(key: "email")]
        getter email : String?

        # If the commit contains deletions, whether to keep a folder or folder structure if the changes leave
        # the folders empty. If true, a ..gitkeep file is created for empty folders. The default is false.

        @[JSON::Field(key: "keepEmptyFolders")]
        getter keep_empty_folders : Bool?

        # The ID of the commit that is the parent of the commit you create. Not required if this is an empty
        # repository.

        @[JSON::Field(key: "parentCommitId")]
        getter parent_commit_id : String?

        # The files to add or update in this commit.

        @[JSON::Field(key: "putFiles")]
        getter put_files : Array(Types::PutFileEntry)?

        # The file modes to update for files in this commit.

        @[JSON::Field(key: "setFileModes")]
        getter set_file_modes : Array(Types::SetFileModeEntry)?

        def initialize(
          @branch_name : String,
          @repository_name : String,
          @author_name : String? = nil,
          @commit_message : String? = nil,
          @delete_files : Array(Types::DeleteFileEntry)? = nil,
          @email : String? = nil,
          @keep_empty_folders : Bool? = nil,
          @parent_commit_id : String? = nil,
          @put_files : Array(Types::PutFileEntry)? = nil,
          @set_file_modes : Array(Types::SetFileModeEntry)? = nil
        )
        end
      end


      struct CreateCommitOutput
        include JSON::Serializable

        # The full commit ID of the commit that contains your committed file changes.

        @[JSON::Field(key: "commitId")]
        getter commit_id : String?

        # The files added as part of the committed file changes.

        @[JSON::Field(key: "filesAdded")]
        getter files_added : Array(Types::FileMetadata)?

        # The files deleted as part of the committed file changes.

        @[JSON::Field(key: "filesDeleted")]
        getter files_deleted : Array(Types::FileMetadata)?

        # The files updated as part of the commited file changes.

        @[JSON::Field(key: "filesUpdated")]
        getter files_updated : Array(Types::FileMetadata)?

        # The full SHA-1 pointer of the tree information for the commit that contains the commited file
        # changes.

        @[JSON::Field(key: "treeId")]
        getter tree_id : String?

        def initialize(
          @commit_id : String? = nil,
          @files_added : Array(Types::FileMetadata)? = nil,
          @files_deleted : Array(Types::FileMetadata)? = nil,
          @files_updated : Array(Types::FileMetadata)? = nil,
          @tree_id : String? = nil
        )
        end
      end


      struct CreatePullRequestApprovalRuleInput
        include JSON::Serializable

        # The content of the approval rule, including the number of approvals needed and the structure of an
        # approval pool defined for approvals, if any. For more information about approval pools, see the
        # CodeCommit User Guide. When you create the content of the approval rule, you can specify approvers
        # in an approval pool in one of two ways: CodeCommitApprovers : This option only requires an Amazon
        # Web Services account and a resource. It can be used for both IAM users and federated access users
        # whose name matches the provided resource name. This is a very powerful option that offers a great
        # deal of flexibility. For example, if you specify the Amazon Web Services account 123456789012 and
        # Mary_Major , all of the following would be counted as approvals coming from that user: An IAM user
        # in the account (arn:aws:iam:: 123456789012 :user/ Mary_Major ) A federated user identified in IAM as
        # Mary_Major (arn:aws:sts:: 123456789012 :federated-user/ Mary_Major ) This option does not recognize
        # an active session of someone assuming the role of CodeCommitReview with a role session name of
        # Mary_Major (arn:aws:sts:: 123456789012 :assumed-role/CodeCommitReview/ Mary_Major ) unless you
        # include a wildcard (*Mary_Major). Fully qualified ARN : This option allows you to specify the fully
        # qualified Amazon Resource Name (ARN) of the IAM user or role. For more information about IAM ARNs,
        # wildcards, and formats, see IAM Identifiers in the IAM User Guide .

        @[JSON::Field(key: "approvalRuleContent")]
        getter approval_rule_content : String

        # The name for the approval rule.

        @[JSON::Field(key: "approvalRuleName")]
        getter approval_rule_name : String

        # The system-generated ID of the pull request for which you want to create the approval rule.

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String

        def initialize(
          @approval_rule_content : String,
          @approval_rule_name : String,
          @pull_request_id : String
        )
        end
      end


      struct CreatePullRequestApprovalRuleOutput
        include JSON::Serializable

        # Information about the created approval rule.

        @[JSON::Field(key: "approvalRule")]
        getter approval_rule : Types::ApprovalRule

        def initialize(
          @approval_rule : Types::ApprovalRule
        )
        end
      end


      struct CreatePullRequestInput
        include JSON::Serializable

        # The targets for the pull request, including the source of the code to be reviewed (the source
        # branch) and the destination where the creator of the pull request intends the code to be merged
        # after the pull request is closed (the destination branch).

        @[JSON::Field(key: "targets")]
        getter targets : Array(Types::Target)

        # The title of the pull request. This title is used to identify the pull request to other users in the
        # repository.

        @[JSON::Field(key: "title")]
        getter title : String

        # A unique, client-generated idempotency token that, when provided in a request, ensures the request
        # cannot be repeated with a changed parameter. If a request is received with the same parameters and a
        # token is included, the request returns information about the initial request that used that token.
        # The Amazon Web ServicesSDKs prepopulate client request tokens. If you are using an Amazon Web
        # ServicesSDK, an idempotency token is created for you.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # A description of the pull request.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @targets : Array(Types::Target),
          @title : String,
          @client_request_token : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct CreatePullRequestOutput
        include JSON::Serializable

        # Information about the newly created pull request.

        @[JSON::Field(key: "pullRequest")]
        getter pull_request : Types::PullRequest

        def initialize(
          @pull_request : Types::PullRequest
        )
        end
      end

      # Represents the input of a create repository operation.

      struct CreateRepositoryInput
        include JSON::Serializable

        # The name of the new repository to be created. The repository name must be unique across the calling
        # Amazon Web Services account. Repository names are limited to 100 alphanumeric, dash, and underscore
        # characters, and cannot include certain characters. For more information about the limits on
        # repository names, see Quotas in the CodeCommit User Guide . The suffix .git is prohibited.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The ID of the encryption key. You can view the ID of an encryption key in the KMS console, or use
        # the KMS APIs to programmatically retrieve a key ID. For more information about acceptable values for
        # kmsKeyID, see KeyId in the Decrypt API description in the Key Management Service API Reference . If
        # no key is specified, the default aws/codecommit Amazon Web Services managed key is used.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # A comment or description about the new repository. The description field for a repository accepts
        # all HTML characters and all valid Unicode characters. Applications that do not HTML-encode the
        # description and display it in a webpage can expose users to potentially malicious code. Make sure
        # that you HTML-encode the description field in any application that uses this API to display the
        # repository description on a webpage.

        @[JSON::Field(key: "repositoryDescription")]
        getter repository_description : String?

        # One or more tag key-value pairs to use when tagging this repository.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @repository_name : String,
          @kms_key_id : String? = nil,
          @repository_description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents the output of a create repository operation.

      struct CreateRepositoryOutput
        include JSON::Serializable

        # Information about the newly created repository.

        @[JSON::Field(key: "repositoryMetadata")]
        getter repository_metadata : Types::RepositoryMetadata?

        def initialize(
          @repository_metadata : Types::RepositoryMetadata? = nil
        )
        end
      end


      struct CreateUnreferencedMergeCommitInput
        include JSON::Serializable

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a
        # branch name or a full commit ID).

        @[JSON::Field(key: "destinationCommitSpecifier")]
        getter destination_commit_specifier : String

        # The merge option or strategy you want to use to merge the code.

        @[JSON::Field(key: "mergeOption")]
        getter merge_option : String

        # The name of the repository where you want to create the unreferenced merge commit.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a
        # branch name or a full commit ID).

        @[JSON::Field(key: "sourceCommitSpecifier")]
        getter source_commit_specifier : String

        # The name of the author who created the unreferenced commit. This information is used as both the
        # author and committer for the commit.

        @[JSON::Field(key: "authorName")]
        getter author_name : String?

        # The commit message for the unreferenced commit.

        @[JSON::Field(key: "commitMessage")]
        getter commit_message : String?

        # The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a
        # not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified,
        # a conflict is considered not mergeable if the same file in both branches has differences on the same
        # line.

        @[JSON::Field(key: "conflictDetailLevel")]
        getter conflict_detail_level : String?

        # If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving conflicts
        # during a merge.

        @[JSON::Field(key: "conflictResolution")]
        getter conflict_resolution : Types::ConflictResolution?

        # Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging
        # two versions of a file. The default is NONE, which requires any conflicts to be resolved manually
        # before the merge operation is successful.

        @[JSON::Field(key: "conflictResolutionStrategy")]
        getter conflict_resolution_strategy : String?

        # The email address for the person who created the unreferenced commit.

        @[JSON::Field(key: "email")]
        getter email : String?

        # If the commit contains deletions, whether to keep a folder or folder structure if the changes leave
        # the folders empty. If this is specified as true, a .gitkeep file is created for empty folders. The
        # default is false.

        @[JSON::Field(key: "keepEmptyFolders")]
        getter keep_empty_folders : Bool?

        def initialize(
          @destination_commit_specifier : String,
          @merge_option : String,
          @repository_name : String,
          @source_commit_specifier : String,
          @author_name : String? = nil,
          @commit_message : String? = nil,
          @conflict_detail_level : String? = nil,
          @conflict_resolution : Types::ConflictResolution? = nil,
          @conflict_resolution_strategy : String? = nil,
          @email : String? = nil,
          @keep_empty_folders : Bool? = nil
        )
        end
      end


      struct CreateUnreferencedMergeCommitOutput
        include JSON::Serializable

        # The full commit ID of the commit that contains your merge results.

        @[JSON::Field(key: "commitId")]
        getter commit_id : String?

        # The full SHA-1 pointer of the tree information for the commit that contains the merge results.

        @[JSON::Field(key: "treeId")]
        getter tree_id : String?

        def initialize(
          @commit_id : String? = nil,
          @tree_id : String? = nil
        )
        end
      end

      # The specified branch is the default branch for the repository, and cannot be deleted. To delete this
      # branch, you must first set another branch as the default branch.

      struct DefaultBranchCannotBeDeletedException
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteApprovalRuleTemplateInput
        include JSON::Serializable

        # The name of the approval rule template to delete.

        @[JSON::Field(key: "approvalRuleTemplateName")]
        getter approval_rule_template_name : String

        def initialize(
          @approval_rule_template_name : String
        )
        end
      end


      struct DeleteApprovalRuleTemplateOutput
        include JSON::Serializable

        # The system-generated ID of the deleted approval rule template. If the template has been previously
        # deleted, the only response is a 200 OK.

        @[JSON::Field(key: "approvalRuleTemplateId")]
        getter approval_rule_template_id : String

        def initialize(
          @approval_rule_template_id : String
        )
        end
      end

      # Represents the input of a delete branch operation.

      struct DeleteBranchInput
        include JSON::Serializable

        # The name of the branch to delete.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        # The name of the repository that contains the branch to be deleted.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        def initialize(
          @branch_name : String,
          @repository_name : String
        )
        end
      end

      # Represents the output of a delete branch operation.

      struct DeleteBranchOutput
        include JSON::Serializable

        # Information about the branch deleted by the operation, including the branch name and the commit ID
        # that was the tip of the branch.

        @[JSON::Field(key: "deletedBranch")]
        getter deleted_branch : Types::BranchInfo?

        def initialize(
          @deleted_branch : Types::BranchInfo? = nil
        )
        end
      end


      struct DeleteCommentContentInput
        include JSON::Serializable

        # The unique, system-generated ID of the comment. To get this ID, use GetCommentsForComparedCommit or
        # GetCommentsForPullRequest .

        @[JSON::Field(key: "commentId")]
        getter comment_id : String

        def initialize(
          @comment_id : String
        )
        end
      end


      struct DeleteCommentContentOutput
        include JSON::Serializable

        # Information about the comment you just deleted.

        @[JSON::Field(key: "comment")]
        getter comment : Types::Comment?

        def initialize(
          @comment : Types::Comment? = nil
        )
        end
      end

      # A file that is deleted as part of a commit.

      struct DeleteFileEntry
        include JSON::Serializable

        # The full path of the file to be deleted, including the name of the file.

        @[JSON::Field(key: "filePath")]
        getter file_path : String

        def initialize(
          @file_path : String
        )
        end
      end


      struct DeleteFileInput
        include JSON::Serializable

        # The name of the branch where the commit that deletes the file is made.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        # The fully qualified path to the file that to be deleted, including the full name and extension of
        # that file. For example, /examples/file.md is a fully qualified path to a file named file.md in a
        # folder named examples.

        @[JSON::Field(key: "filePath")]
        getter file_path : String

        # The ID of the commit that is the tip of the branch where you want to create the commit that deletes
        # the file. This must be the HEAD commit for the branch. The commit that deletes the file is created
        # from this commit ID.

        @[JSON::Field(key: "parentCommitId")]
        getter parent_commit_id : String

        # The name of the repository that contains the file to delete.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The commit message you want to include as part of deleting the file. Commit messages are limited to
        # 256 KB. If no message is specified, a default message is used.

        @[JSON::Field(key: "commitMessage")]
        getter commit_message : String?

        # The email address for the commit that deletes the file. If no email address is specified, the email
        # address is left blank.

        @[JSON::Field(key: "email")]
        getter email : String?

        # If a file is the only object in the folder or directory, specifies whether to delete the folder or
        # directory that contains the file. By default, empty folders are deleted. This includes empty folders
        # that are part of the directory structure. For example, if the path to a file is dir1/dir2/dir3/dir4,
        # and dir2 and dir3 are empty, deleting the last file in dir4 also deletes the empty folders dir4,
        # dir3, and dir2.

        @[JSON::Field(key: "keepEmptyFolders")]
        getter keep_empty_folders : Bool?

        # The name of the author of the commit that deletes the file. If no name is specified, the user's ARN
        # is used as the author name and committer name.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @branch_name : String,
          @file_path : String,
          @parent_commit_id : String,
          @repository_name : String,
          @commit_message : String? = nil,
          @email : String? = nil,
          @keep_empty_folders : Bool? = nil,
          @name : String? = nil
        )
        end
      end


      struct DeleteFileOutput
        include JSON::Serializable

        # The blob ID removed from the tree as part of deleting the file.

        @[JSON::Field(key: "blobId")]
        getter blob_id : String

        # The full commit ID of the commit that contains the change that deletes the file.

        @[JSON::Field(key: "commitId")]
        getter commit_id : String

        # The fully qualified path to the file to be deleted, including the full name and extension of that
        # file.

        @[JSON::Field(key: "filePath")]
        getter file_path : String

        # The full SHA-1 pointer of the tree information for the commit that contains the delete file change.

        @[JSON::Field(key: "treeId")]
        getter tree_id : String

        def initialize(
          @blob_id : String,
          @commit_id : String,
          @file_path : String,
          @tree_id : String
        )
        end
      end


      struct DeletePullRequestApprovalRuleInput
        include JSON::Serializable

        # The name of the approval rule you want to delete.

        @[JSON::Field(key: "approvalRuleName")]
        getter approval_rule_name : String

        # The system-generated ID of the pull request that contains the approval rule you want to delete.

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String

        def initialize(
          @approval_rule_name : String,
          @pull_request_id : String
        )
        end
      end


      struct DeletePullRequestApprovalRuleOutput
        include JSON::Serializable

        # The ID of the deleted approval rule. If the approval rule was deleted in an earlier API call, the
        # response is 200 OK without content.

        @[JSON::Field(key: "approvalRuleId")]
        getter approval_rule_id : String

        def initialize(
          @approval_rule_id : String
        )
        end
      end

      # Represents the input of a delete repository operation.

      struct DeleteRepositoryInput
        include JSON::Serializable

        # The name of the repository to delete.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        def initialize(
          @repository_name : String
        )
        end
      end

      # Represents the output of a delete repository operation.

      struct DeleteRepositoryOutput
        include JSON::Serializable

        # The ID of the repository that was deleted.

        @[JSON::Field(key: "repositoryId")]
        getter repository_id : String?

        def initialize(
          @repository_id : String? = nil
        )
        end
      end


      struct DescribeMergeConflictsInput
        include JSON::Serializable

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a
        # branch name or a full commit ID).

        @[JSON::Field(key: "destinationCommitSpecifier")]
        getter destination_commit_specifier : String

        # The path of the target files used to describe the conflicts.

        @[JSON::Field(key: "filePath")]
        getter file_path : String

        # The merge option or strategy you want to use to merge the code.

        @[JSON::Field(key: "mergeOption")]
        getter merge_option : String

        # The name of the repository where you want to get information about a merge conflict.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a
        # branch name or a full commit ID).

        @[JSON::Field(key: "sourceCommitSpecifier")]
        getter source_commit_specifier : String

        # The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a
        # not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified,
        # a conflict is considered not mergeable if the same file in both branches has differences on the same
        # line.

        @[JSON::Field(key: "conflictDetailLevel")]
        getter conflict_detail_level : String?

        # Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging
        # two versions of a file. The default is NONE, which requires any conflicts to be resolved manually
        # before the merge operation is successful.

        @[JSON::Field(key: "conflictResolutionStrategy")]
        getter conflict_resolution_strategy : String?

        # The maximum number of merge hunks to include in the output.

        @[JSON::Field(key: "maxMergeHunks")]
        getter max_merge_hunks : Int32?

        # An enumeration token that, when provided in a request, returns the next batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @destination_commit_specifier : String,
          @file_path : String,
          @merge_option : String,
          @repository_name : String,
          @source_commit_specifier : String,
          @conflict_detail_level : String? = nil,
          @conflict_resolution_strategy : String? = nil,
          @max_merge_hunks : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeMergeConflictsOutput
        include JSON::Serializable

        # Contains metadata about the conflicts found in the merge.

        @[JSON::Field(key: "conflictMetadata")]
        getter conflict_metadata : Types::ConflictMetadata

        # The commit ID of the destination commit specifier that was used in the merge evaluation.

        @[JSON::Field(key: "destinationCommitId")]
        getter destination_commit_id : String

        # A list of merge hunks of the differences between the files or lines.

        @[JSON::Field(key: "mergeHunks")]
        getter merge_hunks : Array(Types::MergeHunk)

        # The commit ID of the source commit specifier that was used in the merge evaluation.

        @[JSON::Field(key: "sourceCommitId")]
        getter source_commit_id : String

        # The commit ID of the merge base.

        @[JSON::Field(key: "baseCommitId")]
        getter base_commit_id : String?

        # An enumeration token that can be used in a request to return the next batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @conflict_metadata : Types::ConflictMetadata,
          @destination_commit_id : String,
          @merge_hunks : Array(Types::MergeHunk),
          @source_commit_id : String,
          @base_commit_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribePullRequestEventsInput
        include JSON::Serializable

        # The system-generated ID of the pull request. To get this ID, use ListPullRequests .

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String

        # The Amazon Resource Name (ARN) of the user whose actions resulted in the event. Examples include
        # updating the pull request with more commits or changing the status of a pull request.

        @[JSON::Field(key: "actorArn")]
        getter actor_arn : String?

        # A non-zero, non-negative integer used to limit the number of returned results. The default is 100
        # events, which is also the maximum number of events that can be returned in a result.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An enumeration token that, when provided in a request, returns the next batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Optional. The pull request event type about which you want to return information.

        @[JSON::Field(key: "pullRequestEventType")]
        getter pull_request_event_type : String?

        def initialize(
          @pull_request_id : String,
          @actor_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @pull_request_event_type : String? = nil
        )
        end
      end


      struct DescribePullRequestEventsOutput
        include JSON::Serializable

        # Information about the pull request events.

        @[JSON::Field(key: "pullRequestEvents")]
        getter pull_request_events : Array(Types::PullRequestEvent)

        # An enumeration token that can be used in a request to return the next batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @pull_request_events : Array(Types::PullRequestEvent),
          @next_token : String? = nil
        )
        end
      end

      # Returns information about a set of differences for a commit specifier.

      struct Difference
        include JSON::Serializable

        # Information about an afterBlob data type object, including the ID, the file mode permission code,
        # and the path.

        @[JSON::Field(key: "afterBlob")]
        getter after_blob : Types::BlobMetadata?

        # Information about a beforeBlob data type object, including the ID, the file mode permission code,
        # and the path.

        @[JSON::Field(key: "beforeBlob")]
        getter before_blob : Types::BlobMetadata?

        # Whether the change type of the difference is an addition (A), deletion (D), or modification (M).

        @[JSON::Field(key: "changeType")]
        getter change_type : String?

        def initialize(
          @after_blob : Types::BlobMetadata? = nil,
          @before_blob : Types::BlobMetadata? = nil,
          @change_type : String? = nil
        )
        end
      end

      # A file cannot be added to the repository because the specified path name has the same name as a file
      # that already exists in this repository. Either provide a different name for the file, or specify a
      # different path for the file.

      struct DirectoryNameConflictsWithFileNameException
        include JSON::Serializable

        def initialize
        end
      end


      struct DisassociateApprovalRuleTemplateFromRepositoryInput
        include JSON::Serializable

        # The name of the approval rule template to disassociate from a specified repository.

        @[JSON::Field(key: "approvalRuleTemplateName")]
        getter approval_rule_template_name : String

        # The name of the repository you want to disassociate from the template.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        def initialize(
          @approval_rule_template_name : String,
          @repository_name : String
        )
        end
      end

      # An encryption integrity check failed.

      struct EncryptionIntegrityChecksFailedException
        include JSON::Serializable

        def initialize
        end
      end

      # An encryption key could not be accessed.

      struct EncryptionKeyAccessDeniedException
        include JSON::Serializable

        def initialize
        end
      end

      # The encryption key is disabled.

      struct EncryptionKeyDisabledException
        include JSON::Serializable

        def initialize
        end
      end

      # The Key Management Service encryption key is not valid.

      struct EncryptionKeyInvalidIdException
        include JSON::Serializable

        def initialize
        end
      end

      # A KMS encryption key was used to try and encrypt or decrypt a repository, but either the repository
      # or the key was not in a valid state to support the operation.

      struct EncryptionKeyInvalidUsageException
        include JSON::Serializable

        def initialize
        end
      end

      # No encryption key was found.

      struct EncryptionKeyNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # A KMS encryption key ID is required but was not specified.

      struct EncryptionKeyRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The encryption key is not available.

      struct EncryptionKeyUnavailableException
        include JSON::Serializable

        def initialize
        end
      end


      struct EvaluatePullRequestApprovalRulesInput
        include JSON::Serializable

        # The system-generated ID of the pull request you want to evaluate.

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String

        # The system-generated ID for the pull request revision. To retrieve the most recent revision ID for a
        # pull request, use GetPullRequest .

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String

        def initialize(
          @pull_request_id : String,
          @revision_id : String
        )
        end
      end


      struct EvaluatePullRequestApprovalRulesOutput
        include JSON::Serializable

        # The result of the evaluation, including the names of the rules whose conditions have been met (if
        # any), the names of the rules whose conditions have not been met (if any), whether the pull request
        # is in the approved state, and whether the pull request approval rule has been set aside by an
        # override.

        @[JSON::Field(key: "evaluation")]
        getter evaluation : Types::Evaluation

        def initialize(
          @evaluation : Types::Evaluation
        )
        end
      end

      # Returns information about the approval rules applied to a pull request and whether conditions have
      # been met.

      struct Evaluation
        include JSON::Serializable

        # The names of the approval rules that have not had their conditions met.

        @[JSON::Field(key: "approvalRulesNotSatisfied")]
        getter approval_rules_not_satisfied : Array(String)?

        # The names of the approval rules that have had their conditions met.

        @[JSON::Field(key: "approvalRulesSatisfied")]
        getter approval_rules_satisfied : Array(String)?

        # Whether the state of the pull request is approved.

        @[JSON::Field(key: "approved")]
        getter approved : Bool?

        # Whether the approval rule requirements for the pull request have been overridden and no longer need
        # to be met.

        @[JSON::Field(key: "overridden")]
        getter overridden : Bool?

        def initialize(
          @approval_rules_not_satisfied : Array(String)? = nil,
          @approval_rules_satisfied : Array(String)? = nil,
          @approved : Bool? = nil,
          @overridden : Bool? = nil
        )
        end
      end

      # Returns information about a file in a repository.

      struct File
        include JSON::Serializable

        # The fully qualified path to the file in the repository.

        @[JSON::Field(key: "absolutePath")]
        getter absolute_path : String?

        # The blob ID that contains the file information.

        @[JSON::Field(key: "blobId")]
        getter blob_id : String?

        # The extrapolated file mode permissions for the file. Valid values include EXECUTABLE and NORMAL.

        @[JSON::Field(key: "fileMode")]
        getter file_mode : String?

        # The relative path of the file from the folder where the query originated.

        @[JSON::Field(key: "relativePath")]
        getter relative_path : String?

        def initialize(
          @absolute_path : String? = nil,
          @blob_id : String? = nil,
          @file_mode : String? = nil,
          @relative_path : String? = nil
        )
        end
      end

      # The commit cannot be created because both a source file and file content have been specified for the
      # same file. You cannot provide both. Either specify a source file or provide the file content
      # directly.

      struct FileContentAndSourceFileSpecifiedException
        include JSON::Serializable

        def initialize
        end
      end

      # The file cannot be added because it is empty. Empty files cannot be added to the repository with
      # this API.

      struct FileContentRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The file cannot be added because it is too large. The maximum file size is 6 MB, and the combined
      # file content change size is 7 MB. Consider making these changes using a Git client.

      struct FileContentSizeLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified file does not exist. Verify that you have used the correct file name, full path, and
      # extension.

      struct FileDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # The commit cannot be created because no files have been specified as added, updated, or changed
      # (PutFile or DeleteFile) for the commit.

      struct FileEntryRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # A file to be added, updated, or deleted as part of a commit.

      struct FileMetadata
        include JSON::Serializable

        # The full path to the file to be added or updated, including the name of the file.

        @[JSON::Field(key: "absolutePath")]
        getter absolute_path : String?

        # The blob ID that contains the file information.

        @[JSON::Field(key: "blobId")]
        getter blob_id : String?

        # The extrapolated file mode permissions for the file. Valid values include EXECUTABLE and NORMAL.

        @[JSON::Field(key: "fileMode")]
        getter file_mode : String?

        def initialize(
          @absolute_path : String? = nil,
          @blob_id : String? = nil,
          @file_mode : String? = nil
        )
        end
      end

      # The commit cannot be created because no file mode has been specified. A file mode is required to
      # update mode permissions for a file.

      struct FileModeRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about file modes in a merge or pull request.

      struct FileModes
        include JSON::Serializable

        # The file mode of a file in the base of a merge or pull request.

        @[JSON::Field(key: "base")]
        getter base : String?

        # The file mode of a file in the destination of a merge or pull request.

        @[JSON::Field(key: "destination")]
        getter destination : String?

        # The file mode of a file in the source of a merge or pull request.

        @[JSON::Field(key: "source")]
        getter source : String?

        def initialize(
          @base : String? = nil,
          @destination : String? = nil,
          @source : String? = nil
        )
        end
      end

      # A file cannot be added to the repository because the specified file name has the same name as a
      # directory in this repository. Either provide another name for the file, or add the file in a
      # directory that does not match the file name.

      struct FileNameConflictsWithDirectoryNameException
        include JSON::Serializable

        def initialize
        end
      end

      # The commit cannot be created because a specified file path points to a submodule. Verify that the
      # destination files have valid file paths that do not point to a submodule.

      struct FilePathConflictsWithSubmodulePathException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the size of files in a merge or pull request.

      struct FileSizes
        include JSON::Serializable

        # The size of a file in the base of a merge or pull request.

        @[JSON::Field(key: "base")]
        getter base : Int64?

        # The size of a file in the destination of a merge or pull request.

        @[JSON::Field(key: "destination")]
        getter destination : Int64?

        # The size of a file in the source of a merge or pull request.

        @[JSON::Field(key: "source")]
        getter source : Int64?

        def initialize(
          @base : Int64? = nil,
          @destination : Int64? = nil,
          @source : Int64? = nil
        )
        end
      end

      # The specified file exceeds the file size limit for CodeCommit. For more information about limits in
      # CodeCommit, see Quotas in the CodeCommit User Guide .

      struct FileTooLargeException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a version of a file.

      struct FileVersion
        include JSON::Serializable

        # The blob ID of the object that represents the content of the file in this version.

        @[JSON::Field(key: "blobId")]
        getter blob_id : String?


        @[JSON::Field(key: "commit")]
        getter commit : Types::Commit?

        # The name and path of the file at which this blob is indexed which contains the data for this version
        # of the file. This value will vary between file versions if a file is renamed or if its path changes.

        @[JSON::Field(key: "path")]
        getter path : String?

        # An array of commit IDs that contain more recent versions of this file. If there are no additional
        # versions of the file, this array will be empty.

        @[JSON::Field(key: "revisionChildren")]
        getter revision_children : Array(String)?

        def initialize(
          @blob_id : String? = nil,
          @commit : Types::Commit? = nil,
          @path : String? = nil,
          @revision_children : Array(String)? = nil
        )
        end
      end

      # Returns information about a folder in a repository.

      struct Folder
        include JSON::Serializable

        # The fully qualified path of the folder in the repository.

        @[JSON::Field(key: "absolutePath")]
        getter absolute_path : String?

        # The relative path of the specified folder from the folder where the query originated.

        @[JSON::Field(key: "relativePath")]
        getter relative_path : String?

        # The full SHA-1 pointer of the tree information for the commit that contains the folder.

        @[JSON::Field(key: "treeId")]
        getter tree_id : String?

        def initialize(
          @absolute_path : String? = nil,
          @relative_path : String? = nil,
          @tree_id : String? = nil
        )
        end
      end

      # The commit cannot be created because at least one of the overall changes in the commit results in a
      # folder whose contents exceed the limit of 6 MB. Either reduce the number and size of your changes,
      # or split the changes across multiple folders.

      struct FolderContentSizeLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified folder does not exist. Either the folder name is not correct, or you did not enter the
      # full path to the folder.

      struct FolderDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end


      struct GetApprovalRuleTemplateInput
        include JSON::Serializable

        # The name of the approval rule template for which you want to get information.

        @[JSON::Field(key: "approvalRuleTemplateName")]
        getter approval_rule_template_name : String

        def initialize(
          @approval_rule_template_name : String
        )
        end
      end


      struct GetApprovalRuleTemplateOutput
        include JSON::Serializable

        # The content and structure of the approval rule template.

        @[JSON::Field(key: "approvalRuleTemplate")]
        getter approval_rule_template : Types::ApprovalRuleTemplate

        def initialize(
          @approval_rule_template : Types::ApprovalRuleTemplate
        )
        end
      end

      # Represents the input of a get blob operation.

      struct GetBlobInput
        include JSON::Serializable

        # The ID of the blob, which is its SHA-1 pointer.

        @[JSON::Field(key: "blobId")]
        getter blob_id : String

        # The name of the repository that contains the blob.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        def initialize(
          @blob_id : String,
          @repository_name : String
        )
        end
      end

      # Represents the output of a get blob operation.

      struct GetBlobOutput
        include JSON::Serializable

        # The content of the blob, usually a file.

        @[JSON::Field(key: "content")]
        getter content : Bytes

        def initialize(
          @content : Bytes
        )
        end
      end

      # Represents the input of a get branch operation.

      struct GetBranchInput
        include JSON::Serializable

        # The name of the branch for which you want to retrieve information.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String?

        # The name of the repository that contains the branch for which you want to retrieve information.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @branch_name : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      # Represents the output of a get branch operation.

      struct GetBranchOutput
        include JSON::Serializable

        # The name of the branch.

        @[JSON::Field(key: "branch")]
        getter branch : Types::BranchInfo?

        def initialize(
          @branch : Types::BranchInfo? = nil
        )
        end
      end


      struct GetCommentInput
        include JSON::Serializable

        # The unique, system-generated ID of the comment. To get this ID, use GetCommentsForComparedCommit or
        # GetCommentsForPullRequest .

        @[JSON::Field(key: "commentId")]
        getter comment_id : String

        def initialize(
          @comment_id : String
        )
        end
      end


      struct GetCommentOutput
        include JSON::Serializable

        # The contents of the comment.

        @[JSON::Field(key: "comment")]
        getter comment : Types::Comment?

        def initialize(
          @comment : Types::Comment? = nil
        )
        end
      end


      struct GetCommentReactionsInput
        include JSON::Serializable

        # The ID of the comment for which you want to get reactions information.

        @[JSON::Field(key: "commentId")]
        getter comment_id : String

        # A non-zero, non-negative integer used to limit the number of returned results. The default is the
        # same as the allowed maximum, 1,000.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An enumeration token that, when provided in a request, returns the next batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Optional. The Amazon Resource Name (ARN) of the user or identity for which you want to get reaction
        # information.

        @[JSON::Field(key: "reactionUserArn")]
        getter reaction_user_arn : String?

        def initialize(
          @comment_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @reaction_user_arn : String? = nil
        )
        end
      end


      struct GetCommentReactionsOutput
        include JSON::Serializable

        # An array of reactions to the specified comment.

        @[JSON::Field(key: "reactionsForComment")]
        getter reactions_for_comment : Array(Types::ReactionForComment)

        # An enumeration token that can be used in a request to return the next batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @reactions_for_comment : Array(Types::ReactionForComment),
          @next_token : String? = nil
        )
        end
      end


      struct GetCommentsForComparedCommitInput
        include JSON::Serializable

        # To establish the directionality of the comparison, the full commit ID of the after commit.

        @[JSON::Field(key: "afterCommitId")]
        getter after_commit_id : String

        # The name of the repository where you want to compare commits.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # To establish the directionality of the comparison, the full commit ID of the before commit.

        @[JSON::Field(key: "beforeCommitId")]
        getter before_commit_id : String?

        # A non-zero, non-negative integer used to limit the number of returned results. The default is 100
        # comments, but you can configure up to 500.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An enumeration token that when provided in a request, returns the next batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @after_commit_id : String,
          @repository_name : String,
          @before_commit_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetCommentsForComparedCommitOutput
        include JSON::Serializable

        # A list of comment objects on the compared commit.

        @[JSON::Field(key: "commentsForComparedCommitData")]
        getter comments_for_compared_commit_data : Array(Types::CommentsForComparedCommit)?

        # An enumeration token that can be used in a request to return the next batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @comments_for_compared_commit_data : Array(Types::CommentsForComparedCommit)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetCommentsForPullRequestInput
        include JSON::Serializable

        # The system-generated ID of the pull request. To get this ID, use ListPullRequests .

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String

        # The full commit ID of the commit in the source branch that was the tip of the branch at the time the
        # comment was made. Requirement is conditional: afterCommitId must be specified when repositoryName is
        # included.

        @[JSON::Field(key: "afterCommitId")]
        getter after_commit_id : String?

        # The full commit ID of the commit in the destination branch that was the tip of the branch at the
        # time the pull request was created. Requirement is conditional: beforeCommitId must be specified when
        # repositoryName is included.

        @[JSON::Field(key: "beforeCommitId")]
        getter before_commit_id : String?

        # A non-zero, non-negative integer used to limit the number of returned results. The default is 100
        # comments. You can return up to 500 comments with a single request.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An enumeration token that, when provided in a request, returns the next batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the repository that contains the pull request. Requirement is conditional:
        # repositoryName must be specified when beforeCommitId and afterCommitId are included.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @pull_request_id : String,
          @after_commit_id : String? = nil,
          @before_commit_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @repository_name : String? = nil
        )
        end
      end


      struct GetCommentsForPullRequestOutput
        include JSON::Serializable

        # An array of comment objects on the pull request.

        @[JSON::Field(key: "commentsForPullRequestData")]
        getter comments_for_pull_request_data : Array(Types::CommentsForPullRequest)?

        # An enumeration token that can be used in a request to return the next batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @comments_for_pull_request_data : Array(Types::CommentsForPullRequest)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the input of a get commit operation.

      struct GetCommitInput
        include JSON::Serializable

        # The commit ID. Commit IDs are the full SHA ID of the commit.

        @[JSON::Field(key: "commitId")]
        getter commit_id : String

        # The name of the repository to which the commit was made.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        def initialize(
          @commit_id : String,
          @repository_name : String
        )
        end
      end

      # Represents the output of a get commit operation.

      struct GetCommitOutput
        include JSON::Serializable

        # A commit data type object that contains information about the specified commit.

        @[JSON::Field(key: "commit")]
        getter commit : Types::Commit

        def initialize(
          @commit : Types::Commit
        )
        end
      end


      struct GetDifferencesInput
        include JSON::Serializable

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit.

        @[JSON::Field(key: "afterCommitSpecifier")]
        getter after_commit_specifier : String

        # The name of the repository where you want to get differences.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # A non-zero, non-negative integer used to limit the number of returned results.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # An enumeration token that, when provided in a request, returns the next batch of the results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The file path in which to check differences. Limits the results to this path. Can also be used to
        # specify the changed name of a directory or folder, if it has changed. If not specified, differences
        # are shown for all paths.

        @[JSON::Field(key: "afterPath")]
        getter after_path : String?

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example,
        # the full commit ID). Optional. If not specified, all changes before the afterCommitSpecifier value
        # are shown. If you do not use beforeCommitSpecifier in your request, consider limiting the results
        # with maxResults .

        @[JSON::Field(key: "beforeCommitSpecifier")]
        getter before_commit_specifier : String?

        # The file path in which to check for differences. Limits the results to this path. Can also be used
        # to specify the previous name of a directory or folder. If beforePath and afterPath are not
        # specified, differences are shown for all paths.

        @[JSON::Field(key: "beforePath")]
        getter before_path : String?

        def initialize(
          @after_commit_specifier : String,
          @repository_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @after_path : String? = nil,
          @before_commit_specifier : String? = nil,
          @before_path : String? = nil
        )
        end
      end


      struct GetDifferencesOutput
        include JSON::Serializable

        # An enumeration token that can be used in a request to return the next batch of the results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A data type object that contains information about the differences, including whether the difference
        # is added, modified, or deleted (A, D, M).

        @[JSON::Field(key: "differences")]
        getter differences : Array(Types::Difference)?

        def initialize(
          @next_token : String? = nil,
          @differences : Array(Types::Difference)? = nil
        )
        end
      end


      struct GetFileInput
        include JSON::Serializable

        # The fully qualified path to the file, including the full name and extension of the file. For
        # example, /examples/file.md is the fully qualified path to a file named file.md in a folder named
        # examples.

        @[JSON::Field(key: "filePath")]
        getter file_path : String

        # The name of the repository that contains the file.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The fully quaified reference that identifies the commit that contains the file. For example, you can
        # specify a full commit ID, a tag, a branch name, or a reference such as refs/heads/main. If none is
        # provided, the head commit is used.

        @[JSON::Field(key: "commitSpecifier")]
        getter commit_specifier : String?

        def initialize(
          @file_path : String,
          @repository_name : String,
          @commit_specifier : String? = nil
        )
        end
      end


      struct GetFileOutput
        include JSON::Serializable

        # The blob ID of the object that represents the file content.

        @[JSON::Field(key: "blobId")]
        getter blob_id : String

        # The full commit ID of the commit that contains the content returned by GetFile.

        @[JSON::Field(key: "commitId")]
        getter commit_id : String

        # The base-64 encoded binary data object that represents the content of the file.

        @[JSON::Field(key: "fileContent")]
        getter file_content : Bytes

        # The extrapolated file mode permissions of the blob. Valid values include strings such as EXECUTABLE
        # and not numeric values. The file mode permissions returned by this API are not the standard file
        # mode permission values, such as 100644, but rather extrapolated values. See the supported return
        # values.

        @[JSON::Field(key: "fileMode")]
        getter file_mode : String

        # The fully qualified path to the specified file. Returns the name and extension of the file.

        @[JSON::Field(key: "filePath")]
        getter file_path : String

        # The size of the contents of the file, in bytes.

        @[JSON::Field(key: "fileSize")]
        getter file_size : Int64

        def initialize(
          @blob_id : String,
          @commit_id : String,
          @file_content : Bytes,
          @file_mode : String,
          @file_path : String,
          @file_size : Int64
        )
        end
      end


      struct GetFolderInput
        include JSON::Serializable

        # The fully qualified path to the folder whose contents are returned, including the folder name. For
        # example, /examples is a fully-qualified path to a folder named examples that was created off of the
        # root directory (/) of a repository.

        @[JSON::Field(key: "folderPath")]
        getter folder_path : String

        # The name of the repository.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # A fully qualified reference used to identify a commit that contains the version of the folder's
        # content to return. A fully qualified reference can be a commit ID, branch name, tag, or reference
        # such as HEAD. If no specifier is provided, the folder content is returned as it exists in the HEAD
        # commit.

        @[JSON::Field(key: "commitSpecifier")]
        getter commit_specifier : String?

        def initialize(
          @folder_path : String,
          @repository_name : String,
          @commit_specifier : String? = nil
        )
        end
      end


      struct GetFolderOutput
        include JSON::Serializable

        # The full commit ID used as a reference for the returned version of the folder content.

        @[JSON::Field(key: "commitId")]
        getter commit_id : String

        # The fully qualified path of the folder whose contents are returned.

        @[JSON::Field(key: "folderPath")]
        getter folder_path : String

        # The list of files in the specified folder, if any.

        @[JSON::Field(key: "files")]
        getter files : Array(Types::File)?

        # The list of folders that exist under the specified folder, if any.

        @[JSON::Field(key: "subFolders")]
        getter sub_folders : Array(Types::Folder)?

        # The list of submodules in the specified folder, if any.

        @[JSON::Field(key: "subModules")]
        getter sub_modules : Array(Types::SubModule)?

        # The list of symbolic links to other files and folders in the specified folder, if any.

        @[JSON::Field(key: "symbolicLinks")]
        getter symbolic_links : Array(Types::SymbolicLink)?

        # The full SHA-1 pointer of the tree information for the commit that contains the folder.

        @[JSON::Field(key: "treeId")]
        getter tree_id : String?

        def initialize(
          @commit_id : String,
          @folder_path : String,
          @files : Array(Types::File)? = nil,
          @sub_folders : Array(Types::Folder)? = nil,
          @sub_modules : Array(Types::SubModule)? = nil,
          @symbolic_links : Array(Types::SymbolicLink)? = nil,
          @tree_id : String? = nil
        )
        end
      end


      struct GetMergeCommitInput
        include JSON::Serializable

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a
        # branch name or a full commit ID).

        @[JSON::Field(key: "destinationCommitSpecifier")]
        getter destination_commit_specifier : String

        # The name of the repository that contains the merge commit about which you want to get information.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a
        # branch name or a full commit ID).

        @[JSON::Field(key: "sourceCommitSpecifier")]
        getter source_commit_specifier : String

        # The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a
        # not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified,
        # a conflict is considered not mergeable if the same file in both branches has differences on the same
        # line.

        @[JSON::Field(key: "conflictDetailLevel")]
        getter conflict_detail_level : String?

        # Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging
        # two versions of a file. The default is NONE, which requires any conflicts to be resolved manually
        # before the merge operation is successful.

        @[JSON::Field(key: "conflictResolutionStrategy")]
        getter conflict_resolution_strategy : String?

        def initialize(
          @destination_commit_specifier : String,
          @repository_name : String,
          @source_commit_specifier : String,
          @conflict_detail_level : String? = nil,
          @conflict_resolution_strategy : String? = nil
        )
        end
      end


      struct GetMergeCommitOutput
        include JSON::Serializable

        # The commit ID of the merge base.

        @[JSON::Field(key: "baseCommitId")]
        getter base_commit_id : String?

        # The commit ID of the destination commit specifier that was used in the merge evaluation.

        @[JSON::Field(key: "destinationCommitId")]
        getter destination_commit_id : String?

        # The commit ID for the merge commit created when the source branch was merged into the destination
        # branch. If the fast-forward merge strategy was used, there is no merge commit.

        @[JSON::Field(key: "mergedCommitId")]
        getter merged_commit_id : String?

        # The commit ID of the source commit specifier that was used in the merge evaluation.

        @[JSON::Field(key: "sourceCommitId")]
        getter source_commit_id : String?

        def initialize(
          @base_commit_id : String? = nil,
          @destination_commit_id : String? = nil,
          @merged_commit_id : String? = nil,
          @source_commit_id : String? = nil
        )
        end
      end


      struct GetMergeConflictsInput
        include JSON::Serializable

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a
        # branch name or a full commit ID).

        @[JSON::Field(key: "destinationCommitSpecifier")]
        getter destination_commit_specifier : String

        # The merge option or strategy you want to use to merge the code.

        @[JSON::Field(key: "mergeOption")]
        getter merge_option : String

        # The name of the repository where the pull request was created.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a
        # branch name or a full commit ID).

        @[JSON::Field(key: "sourceCommitSpecifier")]
        getter source_commit_specifier : String

        # The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a
        # not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified,
        # a conflict is considered not mergeable if the same file in both branches has differences on the same
        # line.

        @[JSON::Field(key: "conflictDetailLevel")]
        getter conflict_detail_level : String?

        # Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging
        # two versions of a file. The default is NONE, which requires any conflicts to be resolved manually
        # before the merge operation is successful.

        @[JSON::Field(key: "conflictResolutionStrategy")]
        getter conflict_resolution_strategy : String?

        # The maximum number of files to include in the output.

        @[JSON::Field(key: "maxConflictFiles")]
        getter max_conflict_files : Int32?

        # An enumeration token that, when provided in a request, returns the next batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @destination_commit_specifier : String,
          @merge_option : String,
          @repository_name : String,
          @source_commit_specifier : String,
          @conflict_detail_level : String? = nil,
          @conflict_resolution_strategy : String? = nil,
          @max_conflict_files : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetMergeConflictsOutput
        include JSON::Serializable

        # A list of metadata for any conflicting files. If the specified merge strategy is FAST_FORWARD_MERGE,
        # this list is always empty.

        @[JSON::Field(key: "conflictMetadataList")]
        getter conflict_metadata_list : Array(Types::ConflictMetadata)

        # The commit ID of the destination commit specifier that was used in the merge evaluation.

        @[JSON::Field(key: "destinationCommitId")]
        getter destination_commit_id : String

        # A Boolean value that indicates whether the code is mergeable by the specified merge option.

        @[JSON::Field(key: "mergeable")]
        getter mergeable : Bool

        # The commit ID of the source commit specifier that was used in the merge evaluation.

        @[JSON::Field(key: "sourceCommitId")]
        getter source_commit_id : String

        # The commit ID of the merge base.

        @[JSON::Field(key: "baseCommitId")]
        getter base_commit_id : String?

        # An enumeration token that can be used in a request to return the next batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @conflict_metadata_list : Array(Types::ConflictMetadata),
          @destination_commit_id : String,
          @mergeable : Bool,
          @source_commit_id : String,
          @base_commit_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetMergeOptionsInput
        include JSON::Serializable

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a
        # branch name or a full commit ID).

        @[JSON::Field(key: "destinationCommitSpecifier")]
        getter destination_commit_specifier : String

        # The name of the repository that contains the commits about which you want to get merge options.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a
        # branch name or a full commit ID).

        @[JSON::Field(key: "sourceCommitSpecifier")]
        getter source_commit_specifier : String

        # The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a
        # not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified,
        # a conflict is considered not mergeable if the same file in both branches has differences on the same
        # line.

        @[JSON::Field(key: "conflictDetailLevel")]
        getter conflict_detail_level : String?

        # Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging
        # two versions of a file. The default is NONE, which requires any conflicts to be resolved manually
        # before the merge operation is successful.

        @[JSON::Field(key: "conflictResolutionStrategy")]
        getter conflict_resolution_strategy : String?

        def initialize(
          @destination_commit_specifier : String,
          @repository_name : String,
          @source_commit_specifier : String,
          @conflict_detail_level : String? = nil,
          @conflict_resolution_strategy : String? = nil
        )
        end
      end


      struct GetMergeOptionsOutput
        include JSON::Serializable

        # The commit ID of the merge base.

        @[JSON::Field(key: "baseCommitId")]
        getter base_commit_id : String

        # The commit ID of the destination commit specifier that was used in the merge evaluation.

        @[JSON::Field(key: "destinationCommitId")]
        getter destination_commit_id : String

        # The merge option or strategy used to merge the code.

        @[JSON::Field(key: "mergeOptions")]
        getter merge_options : Array(String)

        # The commit ID of the source commit specifier that was used in the merge evaluation.

        @[JSON::Field(key: "sourceCommitId")]
        getter source_commit_id : String

        def initialize(
          @base_commit_id : String,
          @destination_commit_id : String,
          @merge_options : Array(String),
          @source_commit_id : String
        )
        end
      end


      struct GetPullRequestApprovalStatesInput
        include JSON::Serializable

        # The system-generated ID for the pull request.

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String

        # The system-generated ID for the pull request revision.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String

        def initialize(
          @pull_request_id : String,
          @revision_id : String
        )
        end
      end


      struct GetPullRequestApprovalStatesOutput
        include JSON::Serializable

        # Information about users who have approved the pull request.

        @[JSON::Field(key: "approvals")]
        getter approvals : Array(Types::Approval)?

        def initialize(
          @approvals : Array(Types::Approval)? = nil
        )
        end
      end


      struct GetPullRequestInput
        include JSON::Serializable

        # The system-generated ID of the pull request. To get this ID, use ListPullRequests .

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String

        def initialize(
          @pull_request_id : String
        )
        end
      end


      struct GetPullRequestOutput
        include JSON::Serializable

        # Information about the specified pull request.

        @[JSON::Field(key: "pullRequest")]
        getter pull_request : Types::PullRequest

        def initialize(
          @pull_request : Types::PullRequest
        )
        end
      end


      struct GetPullRequestOverrideStateInput
        include JSON::Serializable

        # The ID of the pull request for which you want to get information about whether approval rules have
        # been set aside (overridden).

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String

        # The system-generated ID of the revision for the pull request. To retrieve the most recent revision
        # ID, use GetPullRequest .

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String

        def initialize(
          @pull_request_id : String,
          @revision_id : String
        )
        end
      end


      struct GetPullRequestOverrideStateOutput
        include JSON::Serializable

        # A Boolean value that indicates whether a pull request has had its rules set aside (TRUE) or whether
        # all approval rules still apply (FALSE).

        @[JSON::Field(key: "overridden")]
        getter overridden : Bool?

        # The Amazon Resource Name (ARN) of the user or identity that overrode the rules and their
        # requirements for the pull request.

        @[JSON::Field(key: "overrider")]
        getter overrider : String?

        def initialize(
          @overridden : Bool? = nil,
          @overrider : String? = nil
        )
        end
      end

      # Represents the input of a get repository operation.

      struct GetRepositoryInput
        include JSON::Serializable

        # The name of the repository to get information about.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        def initialize(
          @repository_name : String
        )
        end
      end

      # Represents the output of a get repository operation.

      struct GetRepositoryOutput
        include JSON::Serializable

        # Information about the repository.

        @[JSON::Field(key: "repositoryMetadata")]
        getter repository_metadata : Types::RepositoryMetadata?

        def initialize(
          @repository_metadata : Types::RepositoryMetadata? = nil
        )
        end
      end

      # Represents the input of a get repository triggers operation.

      struct GetRepositoryTriggersInput
        include JSON::Serializable

        # The name of the repository for which the trigger is configured.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        def initialize(
          @repository_name : String
        )
        end
      end

      # Represents the output of a get repository triggers operation.

      struct GetRepositoryTriggersOutput
        include JSON::Serializable

        # The system-generated unique ID for the trigger.

        @[JSON::Field(key: "configurationId")]
        getter configuration_id : String?

        # The JSON block of configuration information for each trigger.

        @[JSON::Field(key: "triggers")]
        getter triggers : Array(Types::RepositoryTrigger)?

        def initialize(
          @configuration_id : String? = nil,
          @triggers : Array(Types::RepositoryTrigger)? = nil
        )
        end
      end

      # The client request token is not valid. Either the token is not in a valid format, or the token has
      # been used in a previous request and cannot be reused.

      struct IdempotencyParameterMismatchException
        include JSON::Serializable

        def initialize
        end
      end

      # The Amazon Resource Name (ARN) is not valid. Make sure that you have provided the full ARN for the
      # user who initiated the change for the pull request, and then try again.

      struct InvalidActorArnException
        include JSON::Serializable

        def initialize
        end
      end

      # The content for the approval rule is not valid.

      struct InvalidApprovalRuleContentException
        include JSON::Serializable

        def initialize
        end
      end

      # The name for the approval rule is not valid.

      struct InvalidApprovalRuleNameException
        include JSON::Serializable

        def initialize
        end
      end

      # The content of the approval rule template is not valid.

      struct InvalidApprovalRuleTemplateContentException
        include JSON::Serializable

        def initialize
        end
      end

      # The description for the approval rule template is not valid because it exceeds the maximum
      # characters allowed for a description. For more information about limits in CodeCommit, see Quotas in
      # the CodeCommit User Guide .

      struct InvalidApprovalRuleTemplateDescriptionException
        include JSON::Serializable

        def initialize
        end
      end

      # The name of the approval rule template is not valid. Template names must be between 1 and 100 valid
      # characters in length. For more information about limits in CodeCommit, see Quotas in the CodeCommit
      # User Guide .

      struct InvalidApprovalRuleTemplateNameException
        include JSON::Serializable

        def initialize
        end
      end

      # The state for the approval is not valid. Valid values include APPROVE and REVOKE.

      struct InvalidApprovalStateException
        include JSON::Serializable

        def initialize
        end
      end

      # The Amazon Resource Name (ARN) is not valid. Make sure that you have provided the full ARN for the
      # author of the pull request, and then try again.

      struct InvalidAuthorArnException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified blob is not valid.

      struct InvalidBlobIdException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified reference name is not valid.

      struct InvalidBranchNameException
        include JSON::Serializable

        def initialize
        end
      end

      # The client request token is not valid.

      struct InvalidClientRequestTokenException
        include JSON::Serializable

        def initialize
        end
      end

      # The comment ID is not in a valid format. Make sure that you have provided the full comment ID.

      struct InvalidCommentIdException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified commit is not valid.

      struct InvalidCommitException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified commit ID is not valid.

      struct InvalidCommitIdException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified conflict detail level is not valid.

      struct InvalidConflictDetailLevelException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified conflict resolution list is not valid.

      struct InvalidConflictResolutionException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified conflict resolution strategy is not valid.

      struct InvalidConflictResolutionStrategyException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified continuation token is not valid.

      struct InvalidContinuationTokenException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified deletion parameter is not valid.

      struct InvalidDeletionParameterException
        include JSON::Serializable

        def initialize
        end
      end

      # The pull request description is not valid. Descriptions cannot be more than 1,000 characters.

      struct InvalidDescriptionException
        include JSON::Serializable

        def initialize
        end
      end

      # The destination commit specifier is not valid. You must provide a valid branch name, tag, or full
      # commit ID.

      struct InvalidDestinationCommitSpecifierException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified email address either contains one or more characters that are not allowed, or it
      # exceeds the maximum number of characters allowed for an email address.

      struct InvalidEmailException
        include JSON::Serializable

        def initialize
        end
      end

      # The location of the file is not valid. Make sure that you include the file name and extension.

      struct InvalidFileLocationException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified file mode permission is not valid. For a list of valid file mode permissions, see
      # PutFile .

      struct InvalidFileModeException
        include JSON::Serializable

        def initialize
        end
      end

      # The position is not valid. Make sure that the line number exists in the version of the file you want
      # to comment on.

      struct InvalidFilePositionException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified value for the number of conflict files to return is not valid.

      struct InvalidMaxConflictFilesException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified value for the number of merge hunks to return is not valid.

      struct InvalidMaxMergeHunksException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified number of maximum results is not valid.

      struct InvalidMaxResultsException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified merge option is not valid for this operation. Not all merge strategies are supported
      # for all operations.

      struct InvalidMergeOptionException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified sort order is not valid.

      struct InvalidOrderException
        include JSON::Serializable

        def initialize
        end
      end

      # The override status is not valid. Valid statuses are OVERRIDE and REVOKE.

      struct InvalidOverrideStatusException
        include JSON::Serializable

        def initialize
        end
      end

      # The parent commit ID is not valid. The commit ID cannot be empty, and must match the head commit ID
      # for the branch of the repository where you want to add or update a file.

      struct InvalidParentCommitIdException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified path is not valid.

      struct InvalidPathException
        include JSON::Serializable

        def initialize
        end
      end

      # The pull request event type is not valid.

      struct InvalidPullRequestEventTypeException
        include JSON::Serializable

        def initialize
        end
      end

      # The pull request ID is not valid. Make sure that you have provided the full ID and that the pull
      # request is in the specified repository, and then try again.

      struct InvalidPullRequestIdException
        include JSON::Serializable

        def initialize
        end
      end

      # The pull request status is not valid. The only valid values are OPEN and CLOSED .

      struct InvalidPullRequestStatusException
        include JSON::Serializable

        def initialize
        end
      end

      # The pull request status update is not valid. The only valid update is from OPEN to CLOSED .

      struct InvalidPullRequestStatusUpdateException
        include JSON::Serializable

        def initialize
        end
      end

      # The Amazon Resource Name (ARN) of the user or identity is not valid.

      struct InvalidReactionUserArnException
        include JSON::Serializable

        def initialize
        end
      end

      # The value of the reaction is not valid. For more information, see the CodeCommit User Guide .

      struct InvalidReactionValueException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified reference name format is not valid. Reference names must conform to the Git references
      # format (for example, refs/heads/main). For more information, see Git Internals - Git References or
      # consult your Git documentation.

      struct InvalidReferenceNameException
        include JSON::Serializable

        def initialize
        end
      end

      # Either the enum is not in a valid format, or the specified file version enum is not valid in respect
      # to the current file version.

      struct InvalidRelativeFileVersionEnumException
        include JSON::Serializable

        def initialize
        end
      end

      # Automerge was specified for resolving the conflict, but the replacement type is not valid or content
      # is missing.

      struct InvalidReplacementContentException
        include JSON::Serializable

        def initialize
        end
      end

      # Automerge was specified for resolving the conflict, but the specified replacement type is not valid.

      struct InvalidReplacementTypeException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified repository description is not valid.

      struct InvalidRepositoryDescriptionException
        include JSON::Serializable

        def initialize
        end
      end

      # A specified repository name is not valid. This exception occurs only when a specified repository
      # name is not valid. Other exceptions occur when a required repository parameter is missing, or when a
      # specified repository does not exist.

      struct InvalidRepositoryNameException
        include JSON::Serializable

        def initialize
        end
      end

      # One or more branch names specified for the trigger is not valid.

      struct InvalidRepositoryTriggerBranchNameException
        include JSON::Serializable

        def initialize
        end
      end

      # The custom data provided for the trigger is not valid.

      struct InvalidRepositoryTriggerCustomDataException
        include JSON::Serializable

        def initialize
        end
      end

      # The Amazon Resource Name (ARN) for the trigger is not valid for the specified destination. The most
      # common reason for this error is that the ARN does not meet the requirements for the service type.

      struct InvalidRepositoryTriggerDestinationArnException
        include JSON::Serializable

        def initialize
        end
      end

      # One or more events specified for the trigger is not valid. Check to make sure that all events
      # specified match the requirements for allowed events.

      struct InvalidRepositoryTriggerEventsException
        include JSON::Serializable

        def initialize
        end
      end

      # The name of the trigger is not valid.

      struct InvalidRepositoryTriggerNameException
        include JSON::Serializable

        def initialize
        end
      end

      # The Amazon Web Services Region for the trigger target does not match the Amazon Web Services Region
      # for the repository. Triggers must be created in the same Amazon Web Services Region as the target
      # for the trigger.

      struct InvalidRepositoryTriggerRegionException
        include JSON::Serializable

        def initialize
        end
      end

      # The value for the resource ARN is not valid. For more information about resources in CodeCommit, see
      # CodeCommit Resources and Operations in the CodeCommit User Guide.

      struct InvalidResourceArnException
        include JSON::Serializable

        def initialize
        end
      end

      # The revision ID is not valid. Use GetPullRequest to determine the value.

      struct InvalidRevisionIdException
        include JSON::Serializable

        def initialize
        end
      end

      # The SHA-256 hash signature for the rule content is not valid.

      struct InvalidRuleContentSha256Exception
        include JSON::Serializable

        def initialize
        end
      end

      # The specified sort by value is not valid.

      struct InvalidSortByException
        include JSON::Serializable

        def initialize
        end
      end

      # The source commit specifier is not valid. You must provide a valid branch name, tag, or full commit
      # ID.

      struct InvalidSourceCommitSpecifierException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified tag is not valid. Key names cannot be prefixed with aws:.

      struct InvalidSystemTagUsageException
        include JSON::Serializable

        def initialize
        end
      end

      # The list of tags is not valid.

      struct InvalidTagKeysListException
        include JSON::Serializable

        def initialize
        end
      end

      # The map of tags is not valid.

      struct InvalidTagsMapException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified target branch is not valid.

      struct InvalidTargetBranchException
        include JSON::Serializable

        def initialize
        end
      end

      # The target for the pull request is not valid. A target must contain the full values for the
      # repository name, source branch, and destination branch for the pull request.

      struct InvalidTargetException
        include JSON::Serializable

        def initialize
        end
      end

      # The targets for the pull request is not valid or not in a valid format. Targets are a list of target
      # objects. Each target object must contain the full values for the repository name, source branch, and
      # destination branch for a pull request.

      struct InvalidTargetsException
        include JSON::Serializable

        def initialize
        end
      end

      # The title of the pull request is not valid. Pull request titles cannot exceed 100 characters in
      # length.

      struct InvalidTitleException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about whether a file is binary or textual in a merge or pull request operation.

      struct IsBinaryFile
        include JSON::Serializable

        # The binary or non-binary status of a file in the base of a merge or pull request.

        @[JSON::Field(key: "base")]
        getter base : Bool?

        # The binary or non-binary status of a file in the destination of a merge or pull request.

        @[JSON::Field(key: "destination")]
        getter destination : Bool?

        # The binary or non-binary status of file in the source of a merge or pull request.

        @[JSON::Field(key: "source")]
        getter source : Bool?

        def initialize(
          @base : Bool? = nil,
          @destination : Bool? = nil,
          @source : Bool? = nil
        )
        end
      end


      struct ListApprovalRuleTemplatesInput
        include JSON::Serializable

        # A non-zero, non-negative integer used to limit the number of returned results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An enumeration token that, when provided in a request, returns the next batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApprovalRuleTemplatesOutput
        include JSON::Serializable

        # The names of all the approval rule templates found in the Amazon Web Services Region for your Amazon
        # Web Services account.

        @[JSON::Field(key: "approvalRuleTemplateNames")]
        getter approval_rule_template_names : Array(String)?

        # An enumeration token that allows the operation to batch the next results of the operation.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @approval_rule_template_names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociatedApprovalRuleTemplatesForRepositoryInput
        include JSON::Serializable

        # The name of the repository for which you want to list all associated approval rule templates.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # A non-zero, non-negative integer used to limit the number of returned results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An enumeration token that, when provided in a request, returns the next batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @repository_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociatedApprovalRuleTemplatesForRepositoryOutput
        include JSON::Serializable

        # The names of all approval rule templates associated with the repository.

        @[JSON::Field(key: "approvalRuleTemplateNames")]
        getter approval_rule_template_names : Array(String)?

        # An enumeration token that allows the operation to batch the next results of the operation.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @approval_rule_template_names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the input of a list branches operation.

      struct ListBranchesInput
        include JSON::Serializable

        # The name of the repository that contains the branches.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # An enumeration token that allows the operation to batch the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @repository_name : String,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a list branches operation.

      struct ListBranchesOutput
        include JSON::Serializable

        # The list of branch names.

        @[JSON::Field(key: "branches")]
        getter branches : Array(String)?

        # An enumeration token that returns the batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @branches : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFileCommitHistoryRequest
        include JSON::Serializable

        # The full path of the file whose history you want to retrieve, including the name of the file.

        @[JSON::Field(key: "filePath")]
        getter file_path : String

        # The name of the repository that contains the file.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The fully quaified reference that identifies the commit that contains the file. For example, you can
        # specify a full commit ID, a tag, a branch name, or a reference such as refs/heads/main . If none is
        # provided, the head commit is used.

        @[JSON::Field(key: "commitSpecifier")]
        getter commit_specifier : String?

        # A non-zero, non-negative integer used to limit the number of returned results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An enumeration token that allows the operation to batch the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @file_path : String,
          @repository_name : String,
          @commit_specifier : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFileCommitHistoryResponse
        include JSON::Serializable

        # An array of FileVersion objects that form a directed acyclic graph (DAG) of the changes to the file
        # made by the commits that changed the file.

        @[JSON::Field(key: "revisionDag")]
        getter revision_dag : Array(Types::FileVersion)

        # An enumeration token that can be used to return the next batch of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @revision_dag : Array(Types::FileVersion),
          @next_token : String? = nil
        )
        end
      end


      struct ListPullRequestsInput
        include JSON::Serializable

        # The name of the repository for which you want to list pull requests.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # Optional. The Amazon Resource Name (ARN) of the user who created the pull request. If used, this
        # filters the results to pull requests created by that user.

        @[JSON::Field(key: "authorArn")]
        getter author_arn : String?

        # A non-zero, non-negative integer used to limit the number of returned results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An enumeration token that, when provided in a request, returns the next batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Optional. The status of the pull request. If used, this refines the results to the pull requests
        # that match the specified status.

        @[JSON::Field(key: "pullRequestStatus")]
        getter pull_request_status : String?

        def initialize(
          @repository_name : String,
          @author_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @pull_request_status : String? = nil
        )
        end
      end


      struct ListPullRequestsOutput
        include JSON::Serializable

        # The system-generated IDs of the pull requests.

        @[JSON::Field(key: "pullRequestIds")]
        getter pull_request_ids : Array(String)

        # An enumeration token that allows the operation to batch the next results of the operation.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @pull_request_ids : Array(String),
          @next_token : String? = nil
        )
        end
      end


      struct ListRepositoriesForApprovalRuleTemplateInput
        include JSON::Serializable

        # The name of the approval rule template for which you want to list repositories that are associated
        # with that template.

        @[JSON::Field(key: "approvalRuleTemplateName")]
        getter approval_rule_template_name : String

        # A non-zero, non-negative integer used to limit the number of returned results.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An enumeration token that, when provided in a request, returns the next batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @approval_rule_template_name : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRepositoriesForApprovalRuleTemplateOutput
        include JSON::Serializable

        # An enumeration token that allows the operation to batch the next results of the operation.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of repository names that are associated with the specified approval rule template.

        @[JSON::Field(key: "repositoryNames")]
        getter repository_names : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @repository_names : Array(String)? = nil
        )
        end
      end

      # Represents the input of a list repositories operation.

      struct ListRepositoriesInput
        include JSON::Serializable

        # An enumeration token that allows the operation to batch the results of the operation. Batch sizes
        # are 1,000 for list repository operations. When the client sends the token back to CodeCommit,
        # another page of 1,000 records is retrieved.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The order in which to sort the results of a list repositories operation.

        @[JSON::Field(key: "order")]
        getter order : String?

        # The criteria used to sort the results of a list repositories operation.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        def initialize(
          @next_token : String? = nil,
          @order : String? = nil,
          @sort_by : String? = nil
        )
        end
      end

      # Represents the output of a list repositories operation.

      struct ListRepositoriesOutput
        include JSON::Serializable

        # An enumeration token that allows the operation to batch the results of the operation. Batch sizes
        # are 1,000 for list repository operations. When the client sends the token back to CodeCommit,
        # another page of 1,000 records is retrieved.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Lists the repositories called by the list repositories operation.

        @[JSON::Field(key: "repositories")]
        getter repositories : Array(Types::RepositoryNameIdPair)?

        def initialize(
          @next_token : String? = nil,
          @repositories : Array(Types::RepositoryNameIdPair)? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which you want to get information about tags, if
        # any.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # An enumeration token that, when provided in a request, returns the next batch of the results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # An enumeration token that allows the operation to batch the next results of the operation.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of tag key and value pairs associated with the specified resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @next_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Returns information about the location of a change or comment in the comparison between two commits
      # or a pull request.

      struct Location
        include JSON::Serializable

        # The name of the file being compared, including its extension and subdirectory, if any.

        @[JSON::Field(key: "filePath")]
        getter file_path : String?

        # The position of a change in a compared file, in line number format.

        @[JSON::Field(key: "filePosition")]
        getter file_position : Int64?

        # In a comparison of commits or a pull request, whether the change is in the before or after of that
        # comparison.

        @[JSON::Field(key: "relativeFileVersion")]
        getter relative_file_version : String?

        def initialize(
          @file_path : String? = nil,
          @file_position : Int64? = nil,
          @relative_file_version : String? = nil
        )
        end
      end

      # The pull request cannot be merged automatically into the destination branch. You must manually merge
      # the branches and resolve any conflicts.

      struct ManualMergeRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The number of branches for the trigger was exceeded.

      struct MaximumBranchesExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The number of allowed conflict resolution entries was exceeded.

      struct MaximumConflictResolutionEntriesExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The number of files to load exceeds the allowed limit.

      struct MaximumFileContentToLoadExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The number of specified files to change as part of this commit exceeds the maximum number of files
      # that can be changed in a single commit. Consider using a Git client for these changes.

      struct MaximumFileEntriesExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The number of items to compare between the source or destination branches and the merge base has
      # exceeded the maximum allowed.

      struct MaximumItemsToCompareExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The number of approvals required for the approval rule exceeds the maximum number allowed.

      struct MaximumNumberOfApprovalsExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # You cannot create the pull request because the repository has too many open pull requests. The
      # maximum number of open pull requests for a repository is 1,000. Close one or more open pull
      # requests, and then try again.

      struct MaximumOpenPullRequestsExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The maximum number of allowed repository names was exceeded. Currently, this number is 100.

      struct MaximumRepositoryNamesExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The number of triggers allowed for the repository was exceeded.

      struct MaximumRepositoryTriggersExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The maximum number of approval rule templates for a repository has been exceeded. You cannot
      # associate more than 25 approval rule templates with a repository.

      struct MaximumRuleTemplatesAssociatedWithRepositoryException
        include JSON::Serializable

        def initialize
        end
      end


      struct MergeBranchesByFastForwardInput
        include JSON::Serializable

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a
        # branch name or a full commit ID).

        @[JSON::Field(key: "destinationCommitSpecifier")]
        getter destination_commit_specifier : String

        # The name of the repository where you want to merge two branches.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a
        # branch name or a full commit ID).

        @[JSON::Field(key: "sourceCommitSpecifier")]
        getter source_commit_specifier : String

        # The branch where the merge is applied.

        @[JSON::Field(key: "targetBranch")]
        getter target_branch : String?

        def initialize(
          @destination_commit_specifier : String,
          @repository_name : String,
          @source_commit_specifier : String,
          @target_branch : String? = nil
        )
        end
      end


      struct MergeBranchesByFastForwardOutput
        include JSON::Serializable

        # The commit ID of the merge in the destination or target branch.

        @[JSON::Field(key: "commitId")]
        getter commit_id : String?

        # The tree ID of the merge in the destination or target branch.

        @[JSON::Field(key: "treeId")]
        getter tree_id : String?

        def initialize(
          @commit_id : String? = nil,
          @tree_id : String? = nil
        )
        end
      end


      struct MergeBranchesBySquashInput
        include JSON::Serializable

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a
        # branch name or a full commit ID).

        @[JSON::Field(key: "destinationCommitSpecifier")]
        getter destination_commit_specifier : String

        # The name of the repository where you want to merge two branches.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a
        # branch name or a full commit ID).

        @[JSON::Field(key: "sourceCommitSpecifier")]
        getter source_commit_specifier : String

        # The name of the author who created the commit. This information is used as both the author and
        # committer for the commit.

        @[JSON::Field(key: "authorName")]
        getter author_name : String?

        # The commit message for the merge.

        @[JSON::Field(key: "commitMessage")]
        getter commit_message : String?

        # The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a
        # not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified,
        # a conflict is considered not mergeable if the same file in both branches has differences on the same
        # line.

        @[JSON::Field(key: "conflictDetailLevel")]
        getter conflict_detail_level : String?

        # If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving conflicts
        # during a merge.

        @[JSON::Field(key: "conflictResolution")]
        getter conflict_resolution : Types::ConflictResolution?

        # Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging
        # two versions of a file. The default is NONE, which requires any conflicts to be resolved manually
        # before the merge operation is successful.

        @[JSON::Field(key: "conflictResolutionStrategy")]
        getter conflict_resolution_strategy : String?

        # The email address of the person merging the branches. This information is used in the commit
        # information for the merge.

        @[JSON::Field(key: "email")]
        getter email : String?

        # If the commit contains deletions, whether to keep a folder or folder structure if the changes leave
        # the folders empty. If this is specified as true, a .gitkeep file is created for empty folders. The
        # default is false.

        @[JSON::Field(key: "keepEmptyFolders")]
        getter keep_empty_folders : Bool?

        # The branch where the merge is applied.

        @[JSON::Field(key: "targetBranch")]
        getter target_branch : String?

        def initialize(
          @destination_commit_specifier : String,
          @repository_name : String,
          @source_commit_specifier : String,
          @author_name : String? = nil,
          @commit_message : String? = nil,
          @conflict_detail_level : String? = nil,
          @conflict_resolution : Types::ConflictResolution? = nil,
          @conflict_resolution_strategy : String? = nil,
          @email : String? = nil,
          @keep_empty_folders : Bool? = nil,
          @target_branch : String? = nil
        )
        end
      end


      struct MergeBranchesBySquashOutput
        include JSON::Serializable

        # The commit ID of the merge in the destination or target branch.

        @[JSON::Field(key: "commitId")]
        getter commit_id : String?

        # The tree ID of the merge in the destination or target branch.

        @[JSON::Field(key: "treeId")]
        getter tree_id : String?

        def initialize(
          @commit_id : String? = nil,
          @tree_id : String? = nil
        )
        end
      end


      struct MergeBranchesByThreeWayInput
        include JSON::Serializable

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a
        # branch name or a full commit ID).

        @[JSON::Field(key: "destinationCommitSpecifier")]
        getter destination_commit_specifier : String

        # The name of the repository where you want to merge two branches.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The branch, tag, HEAD, or other fully qualified reference used to identify a commit (for example, a
        # branch name or a full commit ID).

        @[JSON::Field(key: "sourceCommitSpecifier")]
        getter source_commit_specifier : String

        # The name of the author who created the commit. This information is used as both the author and
        # committer for the commit.

        @[JSON::Field(key: "authorName")]
        getter author_name : String?

        # The commit message to include in the commit information for the merge.

        @[JSON::Field(key: "commitMessage")]
        getter commit_message : String?

        # The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a
        # not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified,
        # a conflict is considered not mergeable if the same file in both branches has differences on the same
        # line.

        @[JSON::Field(key: "conflictDetailLevel")]
        getter conflict_detail_level : String?

        # If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving conflicts
        # during a merge.

        @[JSON::Field(key: "conflictResolution")]
        getter conflict_resolution : Types::ConflictResolution?

        # Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging
        # two versions of a file. The default is NONE, which requires any conflicts to be resolved manually
        # before the merge operation is successful.

        @[JSON::Field(key: "conflictResolutionStrategy")]
        getter conflict_resolution_strategy : String?

        # The email address of the person merging the branches. This information is used in the commit
        # information for the merge.

        @[JSON::Field(key: "email")]
        getter email : String?

        # If the commit contains deletions, whether to keep a folder or folder structure if the changes leave
        # the folders empty. If true, a .gitkeep file is created for empty folders. The default is false.

        @[JSON::Field(key: "keepEmptyFolders")]
        getter keep_empty_folders : Bool?

        # The branch where the merge is applied.

        @[JSON::Field(key: "targetBranch")]
        getter target_branch : String?

        def initialize(
          @destination_commit_specifier : String,
          @repository_name : String,
          @source_commit_specifier : String,
          @author_name : String? = nil,
          @commit_message : String? = nil,
          @conflict_detail_level : String? = nil,
          @conflict_resolution : Types::ConflictResolution? = nil,
          @conflict_resolution_strategy : String? = nil,
          @email : String? = nil,
          @keep_empty_folders : Bool? = nil,
          @target_branch : String? = nil
        )
        end
      end


      struct MergeBranchesByThreeWayOutput
        include JSON::Serializable

        # The commit ID of the merge in the destination or target branch.

        @[JSON::Field(key: "commitId")]
        getter commit_id : String?

        # The tree ID of the merge in the destination or target branch.

        @[JSON::Field(key: "treeId")]
        getter tree_id : String?

        def initialize(
          @commit_id : String? = nil,
          @tree_id : String? = nil
        )
        end
      end

      # Information about merge hunks in a merge or pull request operation.

      struct MergeHunk
        include JSON::Serializable

        # Information about the merge hunk in the base of a merge or pull request.

        @[JSON::Field(key: "base")]
        getter base : Types::MergeHunkDetail?

        # Information about the merge hunk in the destination of a merge or pull request.

        @[JSON::Field(key: "destination")]
        getter destination : Types::MergeHunkDetail?

        # A Boolean value indicating whether a combination of hunks contains a conflict. Conflicts occur when
        # the same file or the same lines in a file were modified in both the source and destination of a
        # merge or pull request. Valid values include true, false, and null. True when the hunk represents a
        # conflict and one or more files contains a line conflict. File mode conflicts in a merge do not set
        # this to true.

        @[JSON::Field(key: "isConflict")]
        getter is_conflict : Bool?

        # Information about the merge hunk in the source of a merge or pull request.

        @[JSON::Field(key: "source")]
        getter source : Types::MergeHunkDetail?

        def initialize(
          @base : Types::MergeHunkDetail? = nil,
          @destination : Types::MergeHunkDetail? = nil,
          @is_conflict : Bool? = nil,
          @source : Types::MergeHunkDetail? = nil
        )
        end
      end

      # Information about the details of a merge hunk that contains a conflict in a merge or pull request
      # operation.

      struct MergeHunkDetail
        include JSON::Serializable

        # The end position of the hunk in the merge result.

        @[JSON::Field(key: "endLine")]
        getter end_line : Int32?

        # The base-64 encoded content of the hunk merged region that might contain a conflict.

        @[JSON::Field(key: "hunkContent")]
        getter hunk_content : String?

        # The start position of the hunk in the merge result.

        @[JSON::Field(key: "startLine")]
        getter start_line : Int32?

        def initialize(
          @end_line : Int32? = nil,
          @hunk_content : String? = nil,
          @start_line : Int32? = nil
        )
        end
      end

      # Returns information about a merge or potential merge between a source reference and a destination
      # reference in a pull request.

      struct MergeMetadata
        include JSON::Serializable

        # A Boolean value indicating whether the merge has been made.

        @[JSON::Field(key: "isMerged")]
        getter is_merged : Bool?

        # The commit ID for the merge commit, if any.

        @[JSON::Field(key: "mergeCommitId")]
        getter merge_commit_id : String?

        # The merge strategy used in the merge.

        @[JSON::Field(key: "mergeOption")]
        getter merge_option : String?

        # The Amazon Resource Name (ARN) of the user who merged the branches.

        @[JSON::Field(key: "mergedBy")]
        getter merged_by : String?

        def initialize(
          @is_merged : Bool? = nil,
          @merge_commit_id : String? = nil,
          @merge_option : String? = nil,
          @merged_by : String? = nil
        )
        end
      end

      # Information about the file operation conflicts in a merge operation.

      struct MergeOperations
        include JSON::Serializable

        # The operation on a file in the destination of a merge or pull request.

        @[JSON::Field(key: "destination")]
        getter destination : String?

        # The operation (add, modify, or delete) on a file in the source of a merge or pull request.

        @[JSON::Field(key: "source")]
        getter source : String?

        def initialize(
          @destination : String? = nil,
          @source : String? = nil
        )
        end
      end

      # A merge option or stategy is required, and none was provided.

      struct MergeOptionRequiredException
        include JSON::Serializable

        def initialize
        end
      end


      struct MergePullRequestByFastForwardInput
        include JSON::Serializable

        # The system-generated ID of the pull request. To get this ID, use ListPullRequests .

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String

        # The name of the repository where the pull request was created.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The full commit ID of the original or updated commit in the pull request source branch. Pass this
        # value if you want an exception thrown if the current commit ID of the tip of the source branch does
        # not match this commit ID.

        @[JSON::Field(key: "sourceCommitId")]
        getter source_commit_id : String?

        def initialize(
          @pull_request_id : String,
          @repository_name : String,
          @source_commit_id : String? = nil
        )
        end
      end


      struct MergePullRequestByFastForwardOutput
        include JSON::Serializable

        # Information about the specified pull request, including the merge.

        @[JSON::Field(key: "pullRequest")]
        getter pull_request : Types::PullRequest?

        def initialize(
          @pull_request : Types::PullRequest? = nil
        )
        end
      end


      struct MergePullRequestBySquashInput
        include JSON::Serializable

        # The system-generated ID of the pull request. To get this ID, use ListPullRequests .

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String

        # The name of the repository where the pull request was created.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The name of the author who created the commit. This information is used as both the author and
        # committer for the commit.

        @[JSON::Field(key: "authorName")]
        getter author_name : String?

        # The commit message to include in the commit information for the merge.

        @[JSON::Field(key: "commitMessage")]
        getter commit_message : String?

        # The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a
        # not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified,
        # a conflict is considered not mergeable if the same file in both branches has differences on the same
        # line.

        @[JSON::Field(key: "conflictDetailLevel")]
        getter conflict_detail_level : String?

        # If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving conflicts
        # during a merge.

        @[JSON::Field(key: "conflictResolution")]
        getter conflict_resolution : Types::ConflictResolution?

        # Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging
        # two versions of a file. The default is NONE, which requires any conflicts to be resolved manually
        # before the merge operation is successful.

        @[JSON::Field(key: "conflictResolutionStrategy")]
        getter conflict_resolution_strategy : String?

        # The email address of the person merging the branches. This information is used in the commit
        # information for the merge.

        @[JSON::Field(key: "email")]
        getter email : String?

        # If the commit contains deletions, whether to keep a folder or folder structure if the changes leave
        # the folders empty. If true, a .gitkeep file is created for empty folders. The default is false.

        @[JSON::Field(key: "keepEmptyFolders")]
        getter keep_empty_folders : Bool?

        # The full commit ID of the original or updated commit in the pull request source branch. Pass this
        # value if you want an exception thrown if the current commit ID of the tip of the source branch does
        # not match this commit ID.

        @[JSON::Field(key: "sourceCommitId")]
        getter source_commit_id : String?

        def initialize(
          @pull_request_id : String,
          @repository_name : String,
          @author_name : String? = nil,
          @commit_message : String? = nil,
          @conflict_detail_level : String? = nil,
          @conflict_resolution : Types::ConflictResolution? = nil,
          @conflict_resolution_strategy : String? = nil,
          @email : String? = nil,
          @keep_empty_folders : Bool? = nil,
          @source_commit_id : String? = nil
        )
        end
      end


      struct MergePullRequestBySquashOutput
        include JSON::Serializable


        @[JSON::Field(key: "pullRequest")]
        getter pull_request : Types::PullRequest?

        def initialize(
          @pull_request : Types::PullRequest? = nil
        )
        end
      end


      struct MergePullRequestByThreeWayInput
        include JSON::Serializable

        # The system-generated ID of the pull request. To get this ID, use ListPullRequests .

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String

        # The name of the repository where the pull request was created.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The name of the author who created the commit. This information is used as both the author and
        # committer for the commit.

        @[JSON::Field(key: "authorName")]
        getter author_name : String?

        # The commit message to include in the commit information for the merge.

        @[JSON::Field(key: "commitMessage")]
        getter commit_message : String?

        # The level of conflict detail to use. If unspecified, the default FILE_LEVEL is used, which returns a
        # not-mergeable result if the same file has differences in both branches. If LINE_LEVEL is specified,
        # a conflict is considered not mergeable if the same file in both branches has differences on the same
        # line.

        @[JSON::Field(key: "conflictDetailLevel")]
        getter conflict_detail_level : String?

        # If AUTOMERGE is the conflict resolution strategy, a list of inputs to use when resolving conflicts
        # during a merge.

        @[JSON::Field(key: "conflictResolution")]
        getter conflict_resolution : Types::ConflictResolution?

        # Specifies which branch to use when resolving conflicts, or whether to attempt automatically merging
        # two versions of a file. The default is NONE, which requires any conflicts to be resolved manually
        # before the merge operation is successful.

        @[JSON::Field(key: "conflictResolutionStrategy")]
        getter conflict_resolution_strategy : String?

        # The email address of the person merging the branches. This information is used in the commit
        # information for the merge.

        @[JSON::Field(key: "email")]
        getter email : String?

        # If the commit contains deletions, whether to keep a folder or folder structure if the changes leave
        # the folders empty. If true, a .gitkeep file is created for empty folders. The default is false.

        @[JSON::Field(key: "keepEmptyFolders")]
        getter keep_empty_folders : Bool?

        # The full commit ID of the original or updated commit in the pull request source branch. Pass this
        # value if you want an exception thrown if the current commit ID of the tip of the source branch does
        # not match this commit ID.

        @[JSON::Field(key: "sourceCommitId")]
        getter source_commit_id : String?

        def initialize(
          @pull_request_id : String,
          @repository_name : String,
          @author_name : String? = nil,
          @commit_message : String? = nil,
          @conflict_detail_level : String? = nil,
          @conflict_resolution : Types::ConflictResolution? = nil,
          @conflict_resolution_strategy : String? = nil,
          @email : String? = nil,
          @keep_empty_folders : Bool? = nil,
          @source_commit_id : String? = nil
        )
        end
      end


      struct MergePullRequestByThreeWayOutput
        include JSON::Serializable


        @[JSON::Field(key: "pullRequest")]
        getter pull_request : Types::PullRequest?

        def initialize(
          @pull_request : Types::PullRequest? = nil
        )
        end
      end

      # More than one conflict resolution entries exists for the conflict. A conflict can have only one
      # conflict resolution entry.

      struct MultipleConflictResolutionEntriesException
        include JSON::Serializable

        def initialize
        end
      end

      # You cannot include more than one repository in a pull request. Make sure you have specified only one
      # repository name in your request, and then try again.

      struct MultipleRepositoriesInPullRequestException
        include JSON::Serializable

        def initialize
        end
      end

      # The user name is not valid because it has exceeded the character limit for author names.

      struct NameLengthExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The commit cannot be created because no changes will be made to the repository as a result of this
      # commit. A commit must contain at least one change.

      struct NoChangeException
        include JSON::Serializable

        def initialize
        end
      end

      # The maximum number of approval rule templates has been exceeded for this Amazon Web Services Region.

      struct NumberOfRuleTemplatesExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The approval rule cannot be added. The pull request has the maximum number of approval rules
      # associated with it.

      struct NumberOfRulesExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the type of an object in a merge operation.

      struct ObjectTypes
        include JSON::Serializable

        # The type of the object in the base commit of the merge.

        @[JSON::Field(key: "base")]
        getter base : String?

        # The type of the object in the destination branch.

        @[JSON::Field(key: "destination")]
        getter destination : String?

        # The type of the object in the source branch.

        @[JSON::Field(key: "source")]
        getter source : String?

        def initialize(
          @base : String? = nil,
          @destination : String? = nil,
          @source : String? = nil
        )
        end
      end

      # The requested action is not allowed.

      struct OperationNotAllowedException
        include JSON::Serializable

        def initialize
        end
      end

      # Returns information about the template that created the approval rule for a pull request.

      struct OriginApprovalRuleTemplate
        include JSON::Serializable

        # The ID of the template that created the approval rule.

        @[JSON::Field(key: "approvalRuleTemplateId")]
        getter approval_rule_template_id : String?

        # The name of the template that created the approval rule.

        @[JSON::Field(key: "approvalRuleTemplateName")]
        getter approval_rule_template_name : String?

        def initialize(
          @approval_rule_template_id : String? = nil,
          @approval_rule_template_name : String? = nil
        )
        end
      end

      # The pull request has already had its approval rules set to override.

      struct OverrideAlreadySetException
        include JSON::Serializable

        def initialize
        end
      end


      struct OverridePullRequestApprovalRulesInput
        include JSON::Serializable

        # Whether you want to set aside approval rule requirements for the pull request (OVERRIDE) or revoke a
        # previous override and apply approval rule requirements (REVOKE). REVOKE status is not stored.

        @[JSON::Field(key: "overrideStatus")]
        getter override_status : String

        # The system-generated ID of the pull request for which you want to override all approval rule
        # requirements. To get this information, use GetPullRequest .

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String

        # The system-generated ID of the most recent revision of the pull request. You cannot override
        # approval rules for anything but the most recent revision of a pull request. To get the revision ID,
        # use GetPullRequest.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String

        def initialize(
          @override_status : String,
          @pull_request_id : String,
          @revision_id : String
        )
        end
      end

      # An override status is required, but no value was provided. Valid values include OVERRIDE and REVOKE.

      struct OverrideStatusRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The parent commit ID is not valid because it does not exist. The specified parent commit ID does not
      # exist in the specified branch of the repository.

      struct ParentCommitDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # The file could not be added because the provided parent commit ID is not the current tip of the
      # specified branch. To view the full commit ID of the current head of the branch, use GetBranch .

      struct ParentCommitIdOutdatedException
        include JSON::Serializable

        def initialize
        end
      end

      # A parent commit ID is required. To view the full commit ID of a branch in a repository, use
      # GetBranch or a Git command (for example, git pull or git log).

      struct ParentCommitIdRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified path does not exist.

      struct PathDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # The folderPath for a location cannot be null.

      struct PathRequiredException
        include JSON::Serializable

        def initialize
        end
      end


      struct PostCommentForComparedCommitInput
        include JSON::Serializable

        # To establish the directionality of the comparison, the full commit ID of the after commit.

        @[JSON::Field(key: "afterCommitId")]
        getter after_commit_id : String

        # The content of the comment you want to make.

        @[JSON::Field(key: "content")]
        getter content : String

        # The name of the repository where you want to post a comment on the comparison between commits.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # To establish the directionality of the comparison, the full commit ID of the before commit. Required
        # for commenting on any commit unless that commit is the initial commit.

        @[JSON::Field(key: "beforeCommitId")]
        getter before_commit_id : String?

        # A unique, client-generated idempotency token that, when provided in a request, ensures the request
        # cannot be repeated with a changed parameter. If a request is received with the same parameters and a
        # token is included, the request returns information about the initial request that used that token.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The location of the comparison where you want to comment.

        @[JSON::Field(key: "location")]
        getter location : Types::Location?

        def initialize(
          @after_commit_id : String,
          @content : String,
          @repository_name : String,
          @before_commit_id : String? = nil,
          @client_request_token : String? = nil,
          @location : Types::Location? = nil
        )
        end
      end


      struct PostCommentForComparedCommitOutput
        include JSON::Serializable

        # In the directionality you established, the blob ID of the after blob.

        @[JSON::Field(key: "afterBlobId")]
        getter after_blob_id : String?

        # In the directionality you established, the full commit ID of the after commit.

        @[JSON::Field(key: "afterCommitId")]
        getter after_commit_id : String?

        # In the directionality you established, the blob ID of the before blob.

        @[JSON::Field(key: "beforeBlobId")]
        getter before_blob_id : String?

        # In the directionality you established, the full commit ID of the before commit.

        @[JSON::Field(key: "beforeCommitId")]
        getter before_commit_id : String?

        # The content of the comment you posted.

        @[JSON::Field(key: "comment")]
        getter comment : Types::Comment?

        # The location of the comment in the comparison between the two commits.

        @[JSON::Field(key: "location")]
        getter location : Types::Location?

        # The name of the repository where you posted a comment on the comparison between commits.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @after_blob_id : String? = nil,
          @after_commit_id : String? = nil,
          @before_blob_id : String? = nil,
          @before_commit_id : String? = nil,
          @comment : Types::Comment? = nil,
          @location : Types::Location? = nil,
          @repository_name : String? = nil
        )
        end
      end


      struct PostCommentForPullRequestInput
        include JSON::Serializable

        # The full commit ID of the commit in the source branch that is the current tip of the branch for the
        # pull request when you post the comment.

        @[JSON::Field(key: "afterCommitId")]
        getter after_commit_id : String

        # The full commit ID of the commit in the destination branch that was the tip of the branch at the
        # time the pull request was created.

        @[JSON::Field(key: "beforeCommitId")]
        getter before_commit_id : String

        # The content of your comment on the change.

        @[JSON::Field(key: "content")]
        getter content : String

        # The system-generated ID of the pull request. To get this ID, use ListPullRequests .

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String

        # The name of the repository where you want to post a comment on a pull request.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # A unique, client-generated idempotency token that, when provided in a request, ensures the request
        # cannot be repeated with a changed parameter. If a request is received with the same parameters and a
        # token is included, the request returns information about the initial request that used that token.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The location of the change where you want to post your comment. If no location is provided, the
        # comment is posted as a general comment on the pull request difference between the before commit ID
        # and the after commit ID.

        @[JSON::Field(key: "location")]
        getter location : Types::Location?

        def initialize(
          @after_commit_id : String,
          @before_commit_id : String,
          @content : String,
          @pull_request_id : String,
          @repository_name : String,
          @client_request_token : String? = nil,
          @location : Types::Location? = nil
        )
        end
      end


      struct PostCommentForPullRequestOutput
        include JSON::Serializable

        # In the directionality of the pull request, the blob ID of the after blob.

        @[JSON::Field(key: "afterBlobId")]
        getter after_blob_id : String?

        # The full commit ID of the commit in the destination branch where the pull request is merged.

        @[JSON::Field(key: "afterCommitId")]
        getter after_commit_id : String?

        # In the directionality of the pull request, the blob ID of the before blob.

        @[JSON::Field(key: "beforeBlobId")]
        getter before_blob_id : String?

        # The full commit ID of the commit in the source branch used to create the pull request, or in the
        # case of an updated pull request, the full commit ID of the commit used to update the pull request.

        @[JSON::Field(key: "beforeCommitId")]
        getter before_commit_id : String?

        # The content of the comment you posted.

        @[JSON::Field(key: "comment")]
        getter comment : Types::Comment?

        # The location of the change where you posted your comment.

        @[JSON::Field(key: "location")]
        getter location : Types::Location?

        # The system-generated ID of the pull request.

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String?

        # The name of the repository where you posted a comment on a pull request.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @after_blob_id : String? = nil,
          @after_commit_id : String? = nil,
          @before_blob_id : String? = nil,
          @before_commit_id : String? = nil,
          @comment : Types::Comment? = nil,
          @location : Types::Location? = nil,
          @pull_request_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end


      struct PostCommentReplyInput
        include JSON::Serializable

        # The contents of your reply to a comment.

        @[JSON::Field(key: "content")]
        getter content : String

        # The system-generated ID of the comment to which you want to reply. To get this ID, use
        # GetCommentsForComparedCommit or GetCommentsForPullRequest .

        @[JSON::Field(key: "inReplyTo")]
        getter in_reply_to : String

        # A unique, client-generated idempotency token that, when provided in a request, ensures the request
        # cannot be repeated with a changed parameter. If a request is received with the same parameters and a
        # token is included, the request returns information about the initial request that used that token.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        def initialize(
          @content : String,
          @in_reply_to : String,
          @client_request_token : String? = nil
        )
        end
      end


      struct PostCommentReplyOutput
        include JSON::Serializable

        # Information about the reply to a comment.

        @[JSON::Field(key: "comment")]
        getter comment : Types::Comment?

        def initialize(
          @comment : Types::Comment? = nil
        )
        end
      end

      # Returns information about a pull request.

      struct PullRequest
        include JSON::Serializable

        # The approval rules applied to the pull request.

        @[JSON::Field(key: "approvalRules")]
        getter approval_rules : Array(Types::ApprovalRule)?

        # The Amazon Resource Name (ARN) of the user who created the pull request.

        @[JSON::Field(key: "authorArn")]
        getter author_arn : String?

        # A unique, client-generated idempotency token that, when provided in a request, ensures the request
        # cannot be repeated with a changed parameter. If a request is received with the same parameters and a
        # token is included, the request returns information about the initial request that used that token.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # The date and time the pull request was originally created, in timestamp format.

        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # The user-defined description of the pull request. This description can be used to clarify what
        # should be reviewed and other details of the request.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The day and time of the last user or system activity on the pull request, in timestamp format.

        @[JSON::Field(key: "lastActivityDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_activity_date : Time?

        # The system-generated ID of the pull request.

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String?

        # The status of the pull request. Pull request status can only change from OPEN to CLOSED .

        @[JSON::Field(key: "pullRequestStatus")]
        getter pull_request_status : String?

        # The targets of the pull request, including the source branch and destination branch for the pull
        # request.

        @[JSON::Field(key: "pullRequestTargets")]
        getter pull_request_targets : Array(Types::PullRequestTarget)?

        # The system-generated revision ID for the pull request.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        # The user-defined title of the pull request. This title is displayed in the list of pull requests to
        # other repository users.

        @[JSON::Field(key: "title")]
        getter title : String?

        def initialize(
          @approval_rules : Array(Types::ApprovalRule)? = nil,
          @author_arn : String? = nil,
          @client_request_token : String? = nil,
          @creation_date : Time? = nil,
          @description : String? = nil,
          @last_activity_date : Time? = nil,
          @pull_request_id : String? = nil,
          @pull_request_status : String? = nil,
          @pull_request_targets : Array(Types::PullRequestTarget)? = nil,
          @revision_id : String? = nil,
          @title : String? = nil
        )
        end
      end

      # The pull request status cannot be updated because it is already closed.

      struct PullRequestAlreadyClosedException
        include JSON::Serializable

        def initialize
        end
      end

      # The pull request cannot be merged because one or more approval rules applied to the pull request
      # have conditions that have not been met.

      struct PullRequestApprovalRulesNotSatisfiedException
        include JSON::Serializable

        def initialize
        end
      end

      # The approval cannot be applied because the user approving the pull request matches the user who
      # created the pull request. You cannot approve a pull request that you created.

      struct PullRequestCannotBeApprovedByAuthorException
        include JSON::Serializable

        def initialize
        end
      end

      # Metadata about the pull request that is used when comparing the pull request source with its
      # destination.

      struct PullRequestCreatedEventMetadata
        include JSON::Serializable

        # The commit ID of the tip of the branch specified as the destination branch when the pull request was
        # created.

        @[JSON::Field(key: "destinationCommitId")]
        getter destination_commit_id : String?

        # The commit ID of the most recent commit that the source branch and the destination branch have in
        # common.

        @[JSON::Field(key: "mergeBase")]
        getter merge_base : String?

        # The name of the repository where the pull request was created.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        # The commit ID on the source branch used when the pull request was created.

        @[JSON::Field(key: "sourceCommitId")]
        getter source_commit_id : String?

        def initialize(
          @destination_commit_id : String? = nil,
          @merge_base : String? = nil,
          @repository_name : String? = nil,
          @source_commit_id : String? = nil
        )
        end
      end

      # The pull request ID could not be found. Make sure that you have specified the correct repository
      # name and pull request ID, and then try again.

      struct PullRequestDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # Returns information about a pull request event.

      struct PullRequestEvent
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the user whose actions resulted in the event. Examples include
        # updating the pull request with more commits or changing the status of a pull request.

        @[JSON::Field(key: "actorArn")]
        getter actor_arn : String?

        # Information about a pull request event.

        @[JSON::Field(key: "approvalRuleEventMetadata")]
        getter approval_rule_event_metadata : Types::ApprovalRuleEventMetadata?

        # Information about an approval rule override event for a pull request.

        @[JSON::Field(key: "approvalRuleOverriddenEventMetadata")]
        getter approval_rule_overridden_event_metadata : Types::ApprovalRuleOverriddenEventMetadata?

        # Information about an approval state change for a pull request.

        @[JSON::Field(key: "approvalStateChangedEventMetadata")]
        getter approval_state_changed_event_metadata : Types::ApprovalStateChangedEventMetadata?

        # The day and time of the pull request event, in timestamp format.

        @[JSON::Field(key: "eventDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter event_date : Time?

        # Information about the source and destination branches for the pull request.

        @[JSON::Field(key: "pullRequestCreatedEventMetadata")]
        getter pull_request_created_event_metadata : Types::PullRequestCreatedEventMetadata?

        # The type of the pull request event (for example, a status change event (PULL_REQUEST_STATUS_CHANGED)
        # or update event (PULL_REQUEST_SOURCE_REFERENCE_UPDATED)).

        @[JSON::Field(key: "pullRequestEventType")]
        getter pull_request_event_type : String?

        # The system-generated ID of the pull request.

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String?

        # Information about the change in mergability state for the pull request event.

        @[JSON::Field(key: "pullRequestMergedStateChangedEventMetadata")]
        getter pull_request_merged_state_changed_event_metadata : Types::PullRequestMergedStateChangedEventMetadata?

        # Information about the updated source branch for the pull request event.

        @[JSON::Field(key: "pullRequestSourceReferenceUpdatedEventMetadata")]
        getter pull_request_source_reference_updated_event_metadata : Types::PullRequestSourceReferenceUpdatedEventMetadata?

        # Information about the change in status for the pull request event.

        @[JSON::Field(key: "pullRequestStatusChangedEventMetadata")]
        getter pull_request_status_changed_event_metadata : Types::PullRequestStatusChangedEventMetadata?

        def initialize(
          @actor_arn : String? = nil,
          @approval_rule_event_metadata : Types::ApprovalRuleEventMetadata? = nil,
          @approval_rule_overridden_event_metadata : Types::ApprovalRuleOverriddenEventMetadata? = nil,
          @approval_state_changed_event_metadata : Types::ApprovalStateChangedEventMetadata? = nil,
          @event_date : Time? = nil,
          @pull_request_created_event_metadata : Types::PullRequestCreatedEventMetadata? = nil,
          @pull_request_event_type : String? = nil,
          @pull_request_id : String? = nil,
          @pull_request_merged_state_changed_event_metadata : Types::PullRequestMergedStateChangedEventMetadata? = nil,
          @pull_request_source_reference_updated_event_metadata : Types::PullRequestSourceReferenceUpdatedEventMetadata? = nil,
          @pull_request_status_changed_event_metadata : Types::PullRequestStatusChangedEventMetadata? = nil
        )
        end
      end

      # A pull request ID is required, but none was provided.

      struct PullRequestIdRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # Returns information about the change in the merge state for a pull request event.

      struct PullRequestMergedStateChangedEventMetadata
        include JSON::Serializable

        # The name of the branch that the pull request is merged into.

        @[JSON::Field(key: "destinationReference")]
        getter destination_reference : String?

        # Information about the merge state change event.

        @[JSON::Field(key: "mergeMetadata")]
        getter merge_metadata : Types::MergeMetadata?

        # The name of the repository where the pull request was created.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @destination_reference : String? = nil,
          @merge_metadata : Types::MergeMetadata? = nil,
          @repository_name : String? = nil
        )
        end
      end

      # Information about an update to the source branch of a pull request.

      struct PullRequestSourceReferenceUpdatedEventMetadata
        include JSON::Serializable

        # The full commit ID of the commit in the source branch that was the tip of the branch at the time the
        # pull request was updated.

        @[JSON::Field(key: "afterCommitId")]
        getter after_commit_id : String?

        # The full commit ID of the commit in the destination branch that was the tip of the branch at the
        # time the pull request was updated.

        @[JSON::Field(key: "beforeCommitId")]
        getter before_commit_id : String?

        # The commit ID of the most recent commit that the source branch and the destination branch have in
        # common.

        @[JSON::Field(key: "mergeBase")]
        getter merge_base : String?

        # The name of the repository where the pull request was updated.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @after_commit_id : String? = nil,
          @before_commit_id : String? = nil,
          @merge_base : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      # Information about a change to the status of a pull request.

      struct PullRequestStatusChangedEventMetadata
        include JSON::Serializable

        # The changed status of the pull request.

        @[JSON::Field(key: "pullRequestStatus")]
        getter pull_request_status : String?

        def initialize(
          @pull_request_status : String? = nil
        )
        end
      end

      # A pull request status is required, but none was provided.

      struct PullRequestStatusRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # Returns information about a pull request target.

      struct PullRequestTarget
        include JSON::Serializable

        # The full commit ID that is the tip of the destination branch. This is the commit where the pull
        # request was or will be merged.

        @[JSON::Field(key: "destinationCommit")]
        getter destination_commit : String?

        # The branch of the repository where the pull request changes are merged. Also known as the
        # destination branch.

        @[JSON::Field(key: "destinationReference")]
        getter destination_reference : String?

        # The commit ID of the most recent commit that the source branch and the destination branch have in
        # common.

        @[JSON::Field(key: "mergeBase")]
        getter merge_base : String?

        # Returns metadata about the state of the merge, including whether the merge has been made.

        @[JSON::Field(key: "mergeMetadata")]
        getter merge_metadata : Types::MergeMetadata?

        # The name of the repository that contains the pull request source and destination branches.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        # The full commit ID of the tip of the source branch used to create the pull request. If the pull
        # request branch is updated by a push while the pull request is open, the commit ID changes to reflect
        # the new tip of the branch.

        @[JSON::Field(key: "sourceCommit")]
        getter source_commit : String?

        # The branch of the repository that contains the changes for the pull request. Also known as the
        # source branch.

        @[JSON::Field(key: "sourceReference")]
        getter source_reference : String?

        def initialize(
          @destination_commit : String? = nil,
          @destination_reference : String? = nil,
          @merge_base : String? = nil,
          @merge_metadata : Types::MergeMetadata? = nil,
          @repository_name : String? = nil,
          @source_commit : String? = nil,
          @source_reference : String? = nil
        )
        end
      end


      struct PutCommentReactionInput
        include JSON::Serializable

        # The ID of the comment to which you want to add or update a reaction.

        @[JSON::Field(key: "commentId")]
        getter comment_id : String

        # The emoji reaction you want to add or update. To remove a reaction, provide a value of blank or
        # null. You can also provide the value of none. For information about emoji reaction values supported
        # in CodeCommit, see the CodeCommit User Guide .

        @[JSON::Field(key: "reactionValue")]
        getter reaction_value : String

        def initialize(
          @comment_id : String,
          @reaction_value : String
        )
        end
      end

      # Information about a file added or updated as part of a commit.

      struct PutFileEntry
        include JSON::Serializable

        # The full path to the file in the repository, including the name of the file.

        @[JSON::Field(key: "filePath")]
        getter file_path : String

        # The content of the file, if a source file is not specified.

        @[JSON::Field(key: "fileContent")]
        getter file_content : Bytes?

        # The extrapolated file mode permissions for the file. Valid values include EXECUTABLE and NORMAL.

        @[JSON::Field(key: "fileMode")]
        getter file_mode : String?

        # The name and full path of the file that contains the changes you want to make as part of the commit,
        # if you are not providing the file content directly.

        @[JSON::Field(key: "sourceFile")]
        getter source_file : Types::SourceFileSpecifier?

        def initialize(
          @file_path : String,
          @file_content : Bytes? = nil,
          @file_mode : String? = nil,
          @source_file : Types::SourceFileSpecifier? = nil
        )
        end
      end

      # The commit cannot be created because one or more files specified in the commit reference both a file
      # and a folder.

      struct PutFileEntryConflictException
        include JSON::Serializable

        def initialize
        end
      end


      struct PutFileInput
        include JSON::Serializable

        # The name of the branch where you want to add or update the file. If this is an empty repository,
        # this branch is created.

        @[JSON::Field(key: "branchName")]
        getter branch_name : String

        # The content of the file, in binary object format.

        @[JSON::Field(key: "fileContent")]
        getter file_content : Bytes

        # The name of the file you want to add or update, including the relative path to the file in the
        # repository. If the path does not currently exist in the repository, the path is created as part of
        # adding the file.

        @[JSON::Field(key: "filePath")]
        getter file_path : String

        # The name of the repository where you want to add or update the file.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # A message about why this file was added or updated. Although it is optional, a message makes the
        # commit history for your repository more useful.

        @[JSON::Field(key: "commitMessage")]
        getter commit_message : String?

        # An email address for the person adding or updating the file.

        @[JSON::Field(key: "email")]
        getter email : String?

        # The file mode permissions of the blob. Valid file mode permissions are listed here.

        @[JSON::Field(key: "fileMode")]
        getter file_mode : String?

        # The name of the person adding or updating the file. Although it is optional, a name makes the commit
        # history for your repository more useful.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The full commit ID of the head commit in the branch where you want to add or update the file. If
        # this is an empty repository, no commit ID is required. If this is not an empty repository, a commit
        # ID is required. The commit ID must match the ID of the head commit at the time of the operation.
        # Otherwise, an error occurs, and the file is not added or updated.

        @[JSON::Field(key: "parentCommitId")]
        getter parent_commit_id : String?

        def initialize(
          @branch_name : String,
          @file_content : Bytes,
          @file_path : String,
          @repository_name : String,
          @commit_message : String? = nil,
          @email : String? = nil,
          @file_mode : String? = nil,
          @name : String? = nil,
          @parent_commit_id : String? = nil
        )
        end
      end


      struct PutFileOutput
        include JSON::Serializable

        # The ID of the blob, which is its SHA-1 pointer.

        @[JSON::Field(key: "blobId")]
        getter blob_id : String

        # The full SHA ID of the commit that contains this file change.

        @[JSON::Field(key: "commitId")]
        getter commit_id : String

        # The full SHA-1 pointer of the tree information for the commit that contains this file change.

        @[JSON::Field(key: "treeId")]
        getter tree_id : String

        def initialize(
          @blob_id : String,
          @commit_id : String,
          @tree_id : String
        )
        end
      end

      # Represents the input of a put repository triggers operation.

      struct PutRepositoryTriggersInput
        include JSON::Serializable

        # The name of the repository where you want to create or update the trigger.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The JSON block of configuration information for each trigger.

        @[JSON::Field(key: "triggers")]
        getter triggers : Array(Types::RepositoryTrigger)

        def initialize(
          @repository_name : String,
          @triggers : Array(Types::RepositoryTrigger)
        )
        end
      end

      # Represents the output of a put repository triggers operation.

      struct PutRepositoryTriggersOutput
        include JSON::Serializable

        # The system-generated unique ID for the create or update operation.

        @[JSON::Field(key: "configurationId")]
        getter configuration_id : String?

        def initialize(
          @configuration_id : String? = nil
        )
        end
      end

      # Information about the reaction values provided by users on a comment.

      struct ReactionForComment
        include JSON::Serializable

        # The reaction for a specified comment.

        @[JSON::Field(key: "reaction")]
        getter reaction : Types::ReactionValueFormats?

        # The Amazon Resource Names (ARNs) of users who have provided reactions to the comment.

        @[JSON::Field(key: "reactionUsers")]
        getter reaction_users : Array(String)?

        # A numerical count of users who reacted with the specified emoji whose identities have been
        # subsequently deleted from IAM. While these IAM users or roles no longer exist, the reactions might
        # still appear in total reaction counts.

        @[JSON::Field(key: "reactionsFromDeletedUsersCount")]
        getter reactions_from_deleted_users_count : Int32?

        def initialize(
          @reaction : Types::ReactionValueFormats? = nil,
          @reaction_users : Array(String)? = nil,
          @reactions_from_deleted_users_count : Int32? = nil
        )
        end
      end

      # The number of reactions has been exceeded. Reactions are limited to one reaction per user for each
      # individual comment ID.

      struct ReactionLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the values for reactions to a comment. CodeCommit supports a limited set of
      # reactions.

      struct ReactionValueFormats
        include JSON::Serializable

        # The Emoji Version 1.0 graphic of the reaction. These graphics are interpreted slightly differently
        # on different operating systems.

        @[JSON::Field(key: "emoji")]
        getter emoji : String?

        # The emoji short code for the reaction. Short codes are interpreted slightly differently on different
        # operating systems.

        @[JSON::Field(key: "shortCode")]
        getter short_code : String?

        # The Unicode codepoint for the reaction.

        @[JSON::Field(key: "unicode")]
        getter unicode : String?

        def initialize(
          @emoji : String? = nil,
          @short_code : String? = nil,
          @unicode : String? = nil
        )
        end
      end

      # A reaction value is required.

      struct ReactionValueRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified reference does not exist. You must provide a full commit ID.

      struct ReferenceDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # A reference name is required, but none was provided.

      struct ReferenceNameRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified reference is not a supported type.

      struct ReferenceTypeNotSupportedException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a replacement content entry in the conflict of a merge or pull request operation.

      struct ReplaceContentEntry
        include JSON::Serializable

        # The path of the conflicting file.

        @[JSON::Field(key: "filePath")]
        getter file_path : String

        # The replacement type to use when determining how to resolve the conflict.

        @[JSON::Field(key: "replacementType")]
        getter replacement_type : String

        # The base-64 encoded content to use when the replacement type is USE_NEW_CONTENT.

        @[JSON::Field(key: "content")]
        getter content : Bytes?

        # The file mode to apply during conflict resoltion.

        @[JSON::Field(key: "fileMode")]
        getter file_mode : String?

        def initialize(
          @file_path : String,
          @replacement_type : String,
          @content : Bytes? = nil,
          @file_mode : String? = nil
        )
        end
      end

      # USE_NEW_CONTENT was specified, but no replacement content has been provided.

      struct ReplacementContentRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # A replacement type is required.

      struct ReplacementTypeRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified repository does not exist.

      struct RepositoryDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # A repository resource limit was exceeded.

      struct RepositoryLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a repository.

      struct RepositoryMetadata
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the repository.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The ID of the Amazon Web Services account associated with the repository.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The URL to use for cloning the repository over HTTPS.

        @[JSON::Field(key: "cloneUrlHttp")]
        getter clone_url_http : String?

        # The URL to use for cloning the repository over SSH.

        @[JSON::Field(key: "cloneUrlSsh")]
        getter clone_url_ssh : String?

        # The date and time the repository was created, in timestamp format.

        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # The repository's default branch name.

        @[JSON::Field(key: "defaultBranch")]
        getter default_branch : String?

        # The ID of the Key Management Service encryption key used to encrypt and decrypt the repository.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The date and time the repository was last modified, in timestamp format.

        @[JSON::Field(key: "lastModifiedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # A comment or description about the repository.

        @[JSON::Field(key: "repositoryDescription")]
        getter repository_description : String?

        # The ID of the repository.

        @[JSON::Field(key: "repositoryId")]
        getter repository_id : String?

        # The repository's name.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @arn : String? = nil,
          @account_id : String? = nil,
          @clone_url_http : String? = nil,
          @clone_url_ssh : String? = nil,
          @creation_date : Time? = nil,
          @default_branch : String? = nil,
          @kms_key_id : String? = nil,
          @last_modified_date : Time? = nil,
          @repository_description : String? = nil,
          @repository_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      # The specified repository name already exists.

      struct RepositoryNameExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a repository name and ID.

      struct RepositoryNameIdPair
        include JSON::Serializable

        # The ID associated with the repository.

        @[JSON::Field(key: "repositoryId")]
        getter repository_id : String?

        # The name associated with the repository.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String?

        def initialize(
          @repository_id : String? = nil,
          @repository_name : String? = nil
        )
        end
      end

      # A repository name is required, but was not specified.

      struct RepositoryNameRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # At least one repository name object is required, but was not specified.

      struct RepositoryNamesRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The repository does not contain any pull requests with that pull request ID. Use GetPullRequest to
      # verify the correct repository name for the pull request ID.

      struct RepositoryNotAssociatedWithPullRequestException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a trigger for a repository. If you want to receive notifications about repository
      # events, consider using notifications instead of triggers. For more information, see Configuring
      # notifications for repository events .

      struct RepositoryTrigger
        include JSON::Serializable

        # The ARN of the resource that is the target for a trigger (for example, the ARN of a topic in Amazon
        # SNS).

        @[JSON::Field(key: "destinationArn")]
        getter destination_arn : String

        # The repository events that cause the trigger to run actions in another service, such as sending a
        # notification through Amazon SNS. The valid value "all" cannot be used with any other values.

        @[JSON::Field(key: "events")]
        getter events : Array(String)

        # The name of the trigger.

        @[JSON::Field(key: "name")]
        getter name : String

        # The branches to be included in the trigger configuration. If you specify an empty array, the trigger
        # applies to all branches. Although no content is required in the array, you must include the array
        # itself.

        @[JSON::Field(key: "branches")]
        getter branches : Array(String)?

        # Any custom data associated with the trigger to be included in the information sent to the target of
        # the trigger.

        @[JSON::Field(key: "customData")]
        getter custom_data : String?

        def initialize(
          @destination_arn : String,
          @events : Array(String),
          @name : String,
          @branches : Array(String)? = nil,
          @custom_data : String? = nil
        )
        end
      end

      # At least one branch name is required, but was not specified in the trigger configuration.

      struct RepositoryTriggerBranchNameListRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # A destination ARN for the target service for the trigger is required, but was not specified.

      struct RepositoryTriggerDestinationArnRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # At least one event for the trigger is required, but was not specified.

      struct RepositoryTriggerEventsListRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # A trigger failed to run.

      struct RepositoryTriggerExecutionFailure
        include JSON::Serializable

        # Message information about the trigger that did not run.

        @[JSON::Field(key: "failureMessage")]
        getter failure_message : String?

        # The name of the trigger that did not run.

        @[JSON::Field(key: "trigger")]
        getter trigger : String?

        def initialize(
          @failure_message : String? = nil,
          @trigger : String? = nil
        )
        end
      end

      # A name for the trigger is required, but was not specified.

      struct RepositoryTriggerNameRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The list of triggers for the repository is required, but was not specified.

      struct RepositoryTriggersListRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # A valid Amazon Resource Name (ARN) for an CodeCommit resource is required. For a list of valid
      # resources in CodeCommit, see CodeCommit Resources and Operations in the CodeCommit User Guide.

      struct ResourceArnRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The commit cannot be created because one of the changes specifies copying or moving a .gitkeep file.

      struct RestrictedSourceFileException
        include JSON::Serializable

        def initialize
        end
      end

      # A revision ID is required, but was not provided.

      struct RevisionIdRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The revision ID provided in the request does not match the current revision ID. Use GetPullRequest
      # to retrieve the current revision ID.

      struct RevisionNotCurrentException
        include JSON::Serializable

        def initialize
        end
      end

      # The file was not added or updated because the content of the file is exactly the same as the content
      # of that file in the repository and branch that you specified.

      struct SameFileContentException
        include JSON::Serializable

        def initialize
        end
      end

      # The commit cannot be created because one or more changes in this commit duplicate actions in the
      # same file path. For example, you cannot make the same delete request to the same file in the same
      # file path twice, or make a delete request and a move request to the same file as part of the same
      # commit.

      struct SamePathRequestException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the file mode changes.

      struct SetFileModeEntry
        include JSON::Serializable

        # The file mode for the file.

        @[JSON::Field(key: "fileMode")]
        getter file_mode : String

        # The full path to the file, including the name of the file.

        @[JSON::Field(key: "filePath")]
        getter file_path : String

        def initialize(
          @file_mode : String,
          @file_path : String
        )
        end
      end

      # The source branch and destination branch for the pull request are the same. You must specify
      # different branches for the source and destination.

      struct SourceAndDestinationAreSameException
        include JSON::Serializable

        def initialize
        end
      end

      # The commit cannot be created because no source files or file content have been specified for the
      # commit.

      struct SourceFileOrContentRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a source file that is part of changes made in a commit.

      struct SourceFileSpecifier
        include JSON::Serializable

        # The full path to the file, including the name of the file.

        @[JSON::Field(key: "filePath")]
        getter file_path : String

        # Whether to remove the source file from the parent commit.

        @[JSON::Field(key: "isMove")]
        getter is_move : Bool?

        def initialize(
          @file_path : String,
          @is_move : Bool? = nil
        )
        end
      end

      # Returns information about a submodule reference in a repository folder.

      struct SubModule
        include JSON::Serializable

        # The fully qualified path to the folder that contains the reference to the submodule.

        @[JSON::Field(key: "absolutePath")]
        getter absolute_path : String?

        # The commit ID that contains the reference to the submodule.

        @[JSON::Field(key: "commitId")]
        getter commit_id : String?

        # The relative path of the submodule from the folder where the query originated.

        @[JSON::Field(key: "relativePath")]
        getter relative_path : String?

        def initialize(
          @absolute_path : String? = nil,
          @commit_id : String? = nil,
          @relative_path : String? = nil
        )
        end
      end

      # Returns information about a symbolic link in a repository folder.

      struct SymbolicLink
        include JSON::Serializable

        # The fully qualified path to the folder that contains the symbolic link.

        @[JSON::Field(key: "absolutePath")]
        getter absolute_path : String?

        # The blob ID that contains the information about the symbolic link.

        @[JSON::Field(key: "blobId")]
        getter blob_id : String?

        # The file mode permissions of the blob that cotains information about the symbolic link.

        @[JSON::Field(key: "fileMode")]
        getter file_mode : String?

        # The relative path of the symbolic link from the folder where the query originated.

        @[JSON::Field(key: "relativePath")]
        getter relative_path : String?

        def initialize(
          @absolute_path : String? = nil,
          @blob_id : String? = nil,
          @file_mode : String? = nil,
          @relative_path : String? = nil
        )
        end
      end

      # A list of tag keys is required. The list cannot be empty or null.

      struct TagKeysListRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The tag policy is not valid.

      struct TagPolicyException
        include JSON::Serializable

        def initialize
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to which you want to add or update tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The key-value pair to use when tagging this repository.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end

      # A map of tags is required.

      struct TagsMapRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # Returns information about a target for a pull request.

      struct Target
        include JSON::Serializable

        # The name of the repository that contains the pull request.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The branch of the repository that contains the changes for the pull request. Also known as the
        # source branch.

        @[JSON::Field(key: "sourceReference")]
        getter source_reference : String

        # The branch of the repository where the pull request changes are merged. Also known as the
        # destination branch.

        @[JSON::Field(key: "destinationReference")]
        getter destination_reference : String?

        def initialize(
          @repository_name : String,
          @source_reference : String,
          @destination_reference : String? = nil
        )
        end
      end

      # A pull request target is required. It cannot be empty or null. A pull request target must contain
      # the full values for the repository name, source branch, and destination branch for the pull request.

      struct TargetRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # An array of target objects is required. It cannot be empty or null.

      struct TargetsRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the input of a test repository triggers operation.

      struct TestRepositoryTriggersInput
        include JSON::Serializable

        # The name of the repository in which to test the triggers.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The list of triggers to test.

        @[JSON::Field(key: "triggers")]
        getter triggers : Array(Types::RepositoryTrigger)

        def initialize(
          @repository_name : String,
          @triggers : Array(Types::RepositoryTrigger)
        )
        end
      end

      # Represents the output of a test repository triggers operation.

      struct TestRepositoryTriggersOutput
        include JSON::Serializable

        # The list of triggers that were not tested. This list provides the names of the triggers that could
        # not be tested, separated by commas.

        @[JSON::Field(key: "failedExecutions")]
        getter failed_executions : Array(Types::RepositoryTriggerExecutionFailure)?

        # The list of triggers that were successfully tested. This list provides the names of the triggers
        # that were successfully tested, separated by commas.

        @[JSON::Field(key: "successfulExecutions")]
        getter successful_executions : Array(String)?

        def initialize(
          @failed_executions : Array(Types::RepositoryTriggerExecutionFailure)? = nil,
          @successful_executions : Array(String)? = nil
        )
        end
      end

      # The tip of the source branch in the destination repository does not match the tip of the source
      # branch specified in your request. The pull request might have been updated. Make sure that you have
      # the latest changes.

      struct TipOfSourceReferenceIsDifferentException
        include JSON::Serializable

        def initialize
        end
      end

      # The divergence between the tips of the provided commit specifiers is too great to determine whether
      # there might be any merge conflicts. Locally compare the specifiers using git diff or a diff tool.

      struct TipsDivergenceExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # A pull request title is required. It cannot be empty or null.

      struct TitleRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The maximum number of tags for an CodeCommit resource has been exceeded.

      struct TooManyTagsException
        include JSON::Serializable

        def initialize
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to which you want to remove tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag key for each tag that you want to remove from the resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UpdateApprovalRuleTemplateContentInput
        include JSON::Serializable

        # The name of the approval rule template where you want to update the content of the rule.

        @[JSON::Field(key: "approvalRuleTemplateName")]
        getter approval_rule_template_name : String

        # The content that replaces the existing content of the rule. Content statements must be complete. You
        # cannot provide only the changes.

        @[JSON::Field(key: "newRuleContent")]
        getter new_rule_content : String

        # The SHA-256 hash signature for the content of the approval rule. You can retrieve this information
        # by using GetPullRequest .

        @[JSON::Field(key: "existingRuleContentSha256")]
        getter existing_rule_content_sha256 : String?

        def initialize(
          @approval_rule_template_name : String,
          @new_rule_content : String,
          @existing_rule_content_sha256 : String? = nil
        )
        end
      end


      struct UpdateApprovalRuleTemplateContentOutput
        include JSON::Serializable


        @[JSON::Field(key: "approvalRuleTemplate")]
        getter approval_rule_template : Types::ApprovalRuleTemplate

        def initialize(
          @approval_rule_template : Types::ApprovalRuleTemplate
        )
        end
      end


      struct UpdateApprovalRuleTemplateDescriptionInput
        include JSON::Serializable

        # The updated description of the approval rule template.

        @[JSON::Field(key: "approvalRuleTemplateDescription")]
        getter approval_rule_template_description : String

        # The name of the template for which you want to update the description.

        @[JSON::Field(key: "approvalRuleTemplateName")]
        getter approval_rule_template_name : String

        def initialize(
          @approval_rule_template_description : String,
          @approval_rule_template_name : String
        )
        end
      end


      struct UpdateApprovalRuleTemplateDescriptionOutput
        include JSON::Serializable

        # The structure and content of the updated approval rule template.

        @[JSON::Field(key: "approvalRuleTemplate")]
        getter approval_rule_template : Types::ApprovalRuleTemplate

        def initialize(
          @approval_rule_template : Types::ApprovalRuleTemplate
        )
        end
      end


      struct UpdateApprovalRuleTemplateNameInput
        include JSON::Serializable

        # The new name you want to apply to the approval rule template.

        @[JSON::Field(key: "newApprovalRuleTemplateName")]
        getter new_approval_rule_template_name : String

        # The current name of the approval rule template.

        @[JSON::Field(key: "oldApprovalRuleTemplateName")]
        getter old_approval_rule_template_name : String

        def initialize(
          @new_approval_rule_template_name : String,
          @old_approval_rule_template_name : String
        )
        end
      end


      struct UpdateApprovalRuleTemplateNameOutput
        include JSON::Serializable

        # The structure and content of the updated approval rule template.

        @[JSON::Field(key: "approvalRuleTemplate")]
        getter approval_rule_template : Types::ApprovalRuleTemplate

        def initialize(
          @approval_rule_template : Types::ApprovalRuleTemplate
        )
        end
      end


      struct UpdateCommentInput
        include JSON::Serializable

        # The system-generated ID of the comment you want to update. To get this ID, use
        # GetCommentsForComparedCommit or GetCommentsForPullRequest .

        @[JSON::Field(key: "commentId")]
        getter comment_id : String

        # The updated content to replace the existing content of the comment.

        @[JSON::Field(key: "content")]
        getter content : String

        def initialize(
          @comment_id : String,
          @content : String
        )
        end
      end


      struct UpdateCommentOutput
        include JSON::Serializable

        # Information about the updated comment.

        @[JSON::Field(key: "comment")]
        getter comment : Types::Comment?

        def initialize(
          @comment : Types::Comment? = nil
        )
        end
      end

      # Represents the input of an update default branch operation.

      struct UpdateDefaultBranchInput
        include JSON::Serializable

        # The name of the branch to set as the default branch.

        @[JSON::Field(key: "defaultBranchName")]
        getter default_branch_name : String

        # The name of the repository for which you want to set or change the default branch.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        def initialize(
          @default_branch_name : String,
          @repository_name : String
        )
        end
      end


      struct UpdatePullRequestApprovalRuleContentInput
        include JSON::Serializable

        # The name of the approval rule you want to update.

        @[JSON::Field(key: "approvalRuleName")]
        getter approval_rule_name : String

        # The updated content for the approval rule. When you update the content of the approval rule, you can
        # specify approvers in an approval pool in one of two ways: CodeCommitApprovers : This option only
        # requires an Amazon Web Services account and a resource. It can be used for both IAM users and
        # federated access users whose name matches the provided resource name. This is a very powerful option
        # that offers a great deal of flexibility. For example, if you specify the Amazon Web Services account
        # 123456789012 and Mary_Major , all of the following are counted as approvals coming from that user:
        # An IAM user in the account (arn:aws:iam:: 123456789012 :user/ Mary_Major ) A federated user
        # identified in IAM as Mary_Major (arn:aws:sts:: 123456789012 :federated-user/ Mary_Major ) This
        # option does not recognize an active session of someone assuming the role of CodeCommitReview with a
        # role session name of Mary_Major (arn:aws:sts:: 123456789012 :assumed-role/CodeCommitReview/
        # Mary_Major ) unless you include a wildcard (*Mary_Major). Fully qualified ARN : This option allows
        # you to specify the fully qualified Amazon Resource Name (ARN) of the IAM user or role. For more
        # information about IAM ARNs, wildcards, and formats, see IAM Identifiers in the IAM User Guide .

        @[JSON::Field(key: "newRuleContent")]
        getter new_rule_content : String

        # The system-generated ID of the pull request.

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String

        # The SHA-256 hash signature for the content of the approval rule. You can retrieve this information
        # by using GetPullRequest .

        @[JSON::Field(key: "existingRuleContentSha256")]
        getter existing_rule_content_sha256 : String?

        def initialize(
          @approval_rule_name : String,
          @new_rule_content : String,
          @pull_request_id : String,
          @existing_rule_content_sha256 : String? = nil
        )
        end
      end


      struct UpdatePullRequestApprovalRuleContentOutput
        include JSON::Serializable

        # Information about the updated approval rule.

        @[JSON::Field(key: "approvalRule")]
        getter approval_rule : Types::ApprovalRule

        def initialize(
          @approval_rule : Types::ApprovalRule
        )
        end
      end


      struct UpdatePullRequestApprovalStateInput
        include JSON::Serializable

        # The approval state to associate with the user on the pull request.

        @[JSON::Field(key: "approvalState")]
        getter approval_state : String

        # The system-generated ID of the pull request.

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String

        # The system-generated ID of the revision.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String

        def initialize(
          @approval_state : String,
          @pull_request_id : String,
          @revision_id : String
        )
        end
      end


      struct UpdatePullRequestDescriptionInput
        include JSON::Serializable

        # The updated content of the description for the pull request. This content replaces the existing
        # description.

        @[JSON::Field(key: "description")]
        getter description : String

        # The system-generated ID of the pull request. To get this ID, use ListPullRequests .

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String

        def initialize(
          @description : String,
          @pull_request_id : String
        )
        end
      end


      struct UpdatePullRequestDescriptionOutput
        include JSON::Serializable

        # Information about the updated pull request.

        @[JSON::Field(key: "pullRequest")]
        getter pull_request : Types::PullRequest

        def initialize(
          @pull_request : Types::PullRequest
        )
        end
      end


      struct UpdatePullRequestStatusInput
        include JSON::Serializable

        # The system-generated ID of the pull request. To get this ID, use ListPullRequests .

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String

        # The status of the pull request. The only valid operations are to update the status from OPEN to OPEN
        # , OPEN to CLOSED or from CLOSED to CLOSED .

        @[JSON::Field(key: "pullRequestStatus")]
        getter pull_request_status : String

        def initialize(
          @pull_request_id : String,
          @pull_request_status : String
        )
        end
      end


      struct UpdatePullRequestStatusOutput
        include JSON::Serializable

        # Information about the pull request.

        @[JSON::Field(key: "pullRequest")]
        getter pull_request : Types::PullRequest

        def initialize(
          @pull_request : Types::PullRequest
        )
        end
      end


      struct UpdatePullRequestTitleInput
        include JSON::Serializable

        # The system-generated ID of the pull request. To get this ID, use ListPullRequests .

        @[JSON::Field(key: "pullRequestId")]
        getter pull_request_id : String

        # The updated title of the pull request. This replaces the existing title.

        @[JSON::Field(key: "title")]
        getter title : String

        def initialize(
          @pull_request_id : String,
          @title : String
        )
        end
      end


      struct UpdatePullRequestTitleOutput
        include JSON::Serializable

        # Information about the updated pull request.

        @[JSON::Field(key: "pullRequest")]
        getter pull_request : Types::PullRequest

        def initialize(
          @pull_request : Types::PullRequest
        )
        end
      end

      # Represents the input of an update repository description operation.

      struct UpdateRepositoryDescriptionInput
        include JSON::Serializable

        # The name of the repository to set or change the comment or description for.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        # The new comment or description for the specified repository. Repository descriptions are limited to
        # 1,000 characters.

        @[JSON::Field(key: "repositoryDescription")]
        getter repository_description : String?

        def initialize(
          @repository_name : String,
          @repository_description : String? = nil
        )
        end
      end


      struct UpdateRepositoryEncryptionKeyInput
        include JSON::Serializable

        # The ID of the encryption key. You can view the ID of an encryption key in the KMS console, or use
        # the KMS APIs to programmatically retrieve a key ID. For more information about acceptable values for
        # keyID, see KeyId in the Decrypt API description in the Key Management Service API Reference .

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String

        # The name of the repository for which you want to update the KMS encryption key used to encrypt and
        # decrypt the repository.

        @[JSON::Field(key: "repositoryName")]
        getter repository_name : String

        def initialize(
          @kms_key_id : String,
          @repository_name : String
        )
        end
      end


      struct UpdateRepositoryEncryptionKeyOutput
        include JSON::Serializable

        # The ID of the encryption key.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The ID of the encryption key formerly used to encrypt and decrypt the repository.

        @[JSON::Field(key: "originalKmsKeyId")]
        getter original_kms_key_id : String?

        # The ID of the repository.

        @[JSON::Field(key: "repositoryId")]
        getter repository_id : String?

        def initialize(
          @kms_key_id : String? = nil,
          @original_kms_key_id : String? = nil,
          @repository_id : String? = nil
        )
        end
      end

      # Represents the input of an update repository description operation.

      struct UpdateRepositoryNameInput
        include JSON::Serializable

        # The new name for the repository.

        @[JSON::Field(key: "newName")]
        getter new_name : String

        # The current name of the repository.

        @[JSON::Field(key: "oldName")]
        getter old_name : String

        def initialize(
          @new_name : String,
          @old_name : String
        )
        end
      end

      # Information about the user who made a specified commit.

      struct UserInfo
        include JSON::Serializable

        # The date when the specified commit was commited, in timestamp format with GMT offset.

        @[JSON::Field(key: "date")]
        getter date : String?

        # The email address associated with the user who made the commit, if any.

        @[JSON::Field(key: "email")]
        getter email : String?

        # The name of the user who made the specified commit.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @date : String? = nil,
          @email : String? = nil,
          @name : String? = nil
        )
        end
      end
    end
  end
end
