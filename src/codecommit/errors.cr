module Aws
  module CodeCommit
    module Errors
      class ServiceError < Exception
      end

      # The specified Amazon Resource Name (ARN) does not exist in the Amazon Web Services account.

      class ActorDoesNotExistException < ServiceError
      end

      # The content for the approval rule is empty. You must provide some content for an approval rule. The
      # content cannot be null.

      class ApprovalRuleContentRequiredException < ServiceError
      end

      # The specified approval rule does not exist.

      class ApprovalRuleDoesNotExistException < ServiceError
      end

      # An approval rule with that name already exists. Approval rule names must be unique within the scope
      # of a pull request.

      class ApprovalRuleNameAlreadyExistsException < ServiceError
      end

      # An approval rule name is required, but was not specified.

      class ApprovalRuleNameRequiredException < ServiceError
      end

      # The content for the approval rule template is empty. You must provide some content for an approval
      # rule template. The content cannot be null.

      class ApprovalRuleTemplateContentRequiredException < ServiceError
      end

      # The specified approval rule template does not exist. Verify that the name is correct and that you
      # are signed in to the Amazon Web Services Region where the template was created, and then try again.

      class ApprovalRuleTemplateDoesNotExistException < ServiceError
      end

      # The approval rule template is associated with one or more repositories. You cannot delete a template
      # that is associated with a repository. Remove all associations, and then try again.

      class ApprovalRuleTemplateInUseException < ServiceError
      end

      # You cannot create an approval rule template with that name because a template with that name already
      # exists in this Amazon Web Services Region for your Amazon Web Services account. Approval rule
      # template names must be unique.

      class ApprovalRuleTemplateNameAlreadyExistsException < ServiceError
      end

      # An approval rule template name is required, but was not specified.

      class ApprovalRuleTemplateNameRequiredException < ServiceError
      end

      # An approval state is required, but was not specified.

      class ApprovalStateRequiredException < ServiceError
      end

      # The specified Amazon Resource Name (ARN) does not exist in the Amazon Web Services account.

      class AuthorDoesNotExistException < ServiceError
      end

      # The before commit ID and the after commit ID are the same, which is not valid. The before commit ID
      # and the after commit ID must be different commit IDs.

      class BeforeCommitIdAndAfterCommitIdAreSameException < ServiceError
      end

      # The specified blob does not exist.

      class BlobIdDoesNotExistException < ServiceError
      end

      # A blob ID is required, but was not specified.

      class BlobIdRequiredException < ServiceError
      end

      # The specified branch does not exist.

      class BranchDoesNotExistException < ServiceError
      end

      # Cannot create the branch with the specified name because the commit conflicts with an existing
      # branch with the same name. Branch names must be unique.

      class BranchNameExistsException < ServiceError
      end

      # The specified branch name is not valid because it is a tag name. Enter the name of a branch in the
      # repository. For a list of valid branch names, use ListBranches .

      class BranchNameIsTagNameException < ServiceError
      end

      # A branch name is required, but was not specified.

      class BranchNameRequiredException < ServiceError
      end

      # The approval rule cannot be deleted from the pull request because it was created by an approval rule
      # template and applied to the pull request automatically.

      class CannotDeleteApprovalRuleFromTemplateException < ServiceError
      end

      # The approval rule cannot be modified for the pull request because it was created by an approval rule
      # template and applied to the pull request automatically.

      class CannotModifyApprovalRuleFromTemplateException < ServiceError
      end

      # A client request token is required. A client request token is an unique, client-generated
      # idempotency token that, when provided in a request, ensures the request cannot be repeated with a
      # changed parameter. If a request is received with the same parameters and a token is included, the
      # request returns information about the initial request that used that token.

      class ClientRequestTokenRequiredException < ServiceError
      end

      # The comment is empty. You must provide some content for a comment. The content cannot be null.

      class CommentContentRequiredException < ServiceError
      end

      # The comment is too large. Comments are limited to 10,240 characters.

      class CommentContentSizeLimitExceededException < ServiceError
      end

      # This comment has already been deleted. You cannot edit or delete a deleted comment.

      class CommentDeletedException < ServiceError
      end

      # No comment exists with the provided ID. Verify that you have used the correct ID, and then try
      # again.

      class CommentDoesNotExistException < ServiceError
      end

      # The comment ID is missing or null. A comment ID is required.

      class CommentIdRequiredException < ServiceError
      end

      # You cannot modify or delete this comment. Only comment authors can modify or delete their comments.

      class CommentNotCreatedByCallerException < ServiceError
      end

      # The specified commit does not exist or no commit was specified, and the specified repository has no
      # default branch.

      class CommitDoesNotExistException < ServiceError
      end

      # The specified commit ID does not exist.

      class CommitIdDoesNotExistException < ServiceError
      end

      # A commit ID was not specified.

      class CommitIdRequiredException < ServiceError
      end

      # The maximum number of allowed commit IDs in a batch request is 100. Verify that your batch requests
      # contains no more than 100 commit IDs, and then try again.

      class CommitIdsLimitExceededException < ServiceError
      end

      # A list of commit IDs is required, but was either not specified or the list was empty.

      class CommitIdsListRequiredException < ServiceError
      end

      # The commit message is too long. Provide a shorter string.

      class CommitMessageLengthExceededException < ServiceError
      end

      # A commit was not specified.

      class CommitRequiredException < ServiceError
      end

      # The merge cannot be completed because the target branch has been modified. Another user might have
      # modified the target branch while the merge was in progress. Wait a few minutes, and then try again.

      class ConcurrentReferenceUpdateException < ServiceError
      end

      # The specified branch is the default branch for the repository, and cannot be deleted. To delete this
      # branch, you must first set another branch as the default branch.

      class DefaultBranchCannotBeDeletedException < ServiceError
      end

      # A file cannot be added to the repository because the specified path name has the same name as a file
      # that already exists in this repository. Either provide a different name for the file, or specify a
      # different path for the file.

      class DirectoryNameConflictsWithFileNameException < ServiceError
      end

      # An encryption integrity check failed.

      class EncryptionIntegrityChecksFailedException < ServiceError
      end

      # An encryption key could not be accessed.

      class EncryptionKeyAccessDeniedException < ServiceError
      end

      # The encryption key is disabled.

      class EncryptionKeyDisabledException < ServiceError
      end

      # The Key Management Service encryption key is not valid.

      class EncryptionKeyInvalidIdException < ServiceError
      end

      # A KMS encryption key was used to try and encrypt or decrypt a repository, but either the repository
      # or the key was not in a valid state to support the operation.

      class EncryptionKeyInvalidUsageException < ServiceError
      end

      # No encryption key was found.

      class EncryptionKeyNotFoundException < ServiceError
      end

      # A KMS encryption key ID is required but was not specified.

      class EncryptionKeyRequiredException < ServiceError
      end

      # The encryption key is not available.

      class EncryptionKeyUnavailableException < ServiceError
      end

      # The commit cannot be created because both a source file and file content have been specified for the
      # same file. You cannot provide both. Either specify a source file or provide the file content
      # directly.

      class FileContentAndSourceFileSpecifiedException < ServiceError
      end

      # The file cannot be added because it is empty. Empty files cannot be added to the repository with
      # this API.

      class FileContentRequiredException < ServiceError
      end

      # The file cannot be added because it is too large. The maximum file size is 6 MB, and the combined
      # file content change size is 7 MB. Consider making these changes using a Git client.

      class FileContentSizeLimitExceededException < ServiceError
      end

      # The specified file does not exist. Verify that you have used the correct file name, full path, and
      # extension.

      class FileDoesNotExistException < ServiceError
      end

      # The commit cannot be created because no files have been specified as added, updated, or changed
      # (PutFile or DeleteFile) for the commit.

      class FileEntryRequiredException < ServiceError
      end

      # The commit cannot be created because no file mode has been specified. A file mode is required to
      # update mode permissions for a file.

      class FileModeRequiredException < ServiceError
      end

      # A file cannot be added to the repository because the specified file name has the same name as a
      # directory in this repository. Either provide another name for the file, or add the file in a
      # directory that does not match the file name.

      class FileNameConflictsWithDirectoryNameException < ServiceError
      end

      # The commit cannot be created because a specified file path points to a submodule. Verify that the
      # destination files have valid file paths that do not point to a submodule.

      class FilePathConflictsWithSubmodulePathException < ServiceError
      end

      # The specified file exceeds the file size limit for CodeCommit. For more information about limits in
      # CodeCommit, see Quotas in the CodeCommit User Guide .

      class FileTooLargeException < ServiceError
      end

      # The commit cannot be created because at least one of the overall changes in the commit results in a
      # folder whose contents exceed the limit of 6 MB. Either reduce the number and size of your changes,
      # or split the changes across multiple folders.

      class FolderContentSizeLimitExceededException < ServiceError
      end

      # The specified folder does not exist. Either the folder name is not correct, or you did not enter the
      # full path to the folder.

      class FolderDoesNotExistException < ServiceError
      end

      # The client request token is not valid. Either the token is not in a valid format, or the token has
      # been used in a previous request and cannot be reused.

      class IdempotencyParameterMismatchException < ServiceError
      end

      # The Amazon Resource Name (ARN) is not valid. Make sure that you have provided the full ARN for the
      # user who initiated the change for the pull request, and then try again.

      class InvalidActorArnException < ServiceError
      end

      # The content for the approval rule is not valid.

      class InvalidApprovalRuleContentException < ServiceError
      end

      # The name for the approval rule is not valid.

      class InvalidApprovalRuleNameException < ServiceError
      end

      # The content of the approval rule template is not valid.

      class InvalidApprovalRuleTemplateContentException < ServiceError
      end

      # The description for the approval rule template is not valid because it exceeds the maximum
      # characters allowed for a description. For more information about limits in CodeCommit, see Quotas in
      # the CodeCommit User Guide .

      class InvalidApprovalRuleTemplateDescriptionException < ServiceError
      end

      # The name of the approval rule template is not valid. Template names must be between 1 and 100 valid
      # characters in length. For more information about limits in CodeCommit, see Quotas in the CodeCommit
      # User Guide .

      class InvalidApprovalRuleTemplateNameException < ServiceError
      end

      # The state for the approval is not valid. Valid values include APPROVE and REVOKE.

      class InvalidApprovalStateException < ServiceError
      end

      # The Amazon Resource Name (ARN) is not valid. Make sure that you have provided the full ARN for the
      # author of the pull request, and then try again.

      class InvalidAuthorArnException < ServiceError
      end

      # The specified blob is not valid.

      class InvalidBlobIdException < ServiceError
      end

      # The specified reference name is not valid.

      class InvalidBranchNameException < ServiceError
      end

      # The client request token is not valid.

      class InvalidClientRequestTokenException < ServiceError
      end

      # The comment ID is not in a valid format. Make sure that you have provided the full comment ID.

      class InvalidCommentIdException < ServiceError
      end

      # The specified commit is not valid.

      class InvalidCommitException < ServiceError
      end

      # The specified commit ID is not valid.

      class InvalidCommitIdException < ServiceError
      end

      # The specified conflict detail level is not valid.

      class InvalidConflictDetailLevelException < ServiceError
      end

      # The specified conflict resolution list is not valid.

      class InvalidConflictResolutionException < ServiceError
      end

      # The specified conflict resolution strategy is not valid.

      class InvalidConflictResolutionStrategyException < ServiceError
      end

      # The specified continuation token is not valid.

      class InvalidContinuationTokenException < ServiceError
      end

      # The specified deletion parameter is not valid.

      class InvalidDeletionParameterException < ServiceError
      end

      # The pull request description is not valid. Descriptions cannot be more than 1,000 characters.

      class InvalidDescriptionException < ServiceError
      end

      # The destination commit specifier is not valid. You must provide a valid branch name, tag, or full
      # commit ID.

      class InvalidDestinationCommitSpecifierException < ServiceError
      end

      # The specified email address either contains one or more characters that are not allowed, or it
      # exceeds the maximum number of characters allowed for an email address.

      class InvalidEmailException < ServiceError
      end

      # The location of the file is not valid. Make sure that you include the file name and extension.

      class InvalidFileLocationException < ServiceError
      end

      # The specified file mode permission is not valid. For a list of valid file mode permissions, see
      # PutFile .

      class InvalidFileModeException < ServiceError
      end

      # The position is not valid. Make sure that the line number exists in the version of the file you want
      # to comment on.

      class InvalidFilePositionException < ServiceError
      end

      # The specified value for the number of conflict files to return is not valid.

      class InvalidMaxConflictFilesException < ServiceError
      end

      # The specified value for the number of merge hunks to return is not valid.

      class InvalidMaxMergeHunksException < ServiceError
      end

      # The specified number of maximum results is not valid.

      class InvalidMaxResultsException < ServiceError
      end

      # The specified merge option is not valid for this operation. Not all merge strategies are supported
      # for all operations.

      class InvalidMergeOptionException < ServiceError
      end

      # The specified sort order is not valid.

      class InvalidOrderException < ServiceError
      end

      # The override status is not valid. Valid statuses are OVERRIDE and REVOKE.

      class InvalidOverrideStatusException < ServiceError
      end

      # The parent commit ID is not valid. The commit ID cannot be empty, and must match the head commit ID
      # for the branch of the repository where you want to add or update a file.

      class InvalidParentCommitIdException < ServiceError
      end

      # The specified path is not valid.

      class InvalidPathException < ServiceError
      end

      # The pull request event type is not valid.

      class InvalidPullRequestEventTypeException < ServiceError
      end

      # The pull request ID is not valid. Make sure that you have provided the full ID and that the pull
      # request is in the specified repository, and then try again.

      class InvalidPullRequestIdException < ServiceError
      end

      # The pull request status is not valid. The only valid values are OPEN and CLOSED .

      class InvalidPullRequestStatusException < ServiceError
      end

      # The pull request status update is not valid. The only valid update is from OPEN to CLOSED .

      class InvalidPullRequestStatusUpdateException < ServiceError
      end

      # The Amazon Resource Name (ARN) of the user or identity is not valid.

      class InvalidReactionUserArnException < ServiceError
      end

      # The value of the reaction is not valid. For more information, see the CodeCommit User Guide .

      class InvalidReactionValueException < ServiceError
      end

      # The specified reference name format is not valid. Reference names must conform to the Git references
      # format (for example, refs/heads/main). For more information, see Git Internals - Git References or
      # consult your Git documentation.

      class InvalidReferenceNameException < ServiceError
      end

      # Either the enum is not in a valid format, or the specified file version enum is not valid in respect
      # to the current file version.

      class InvalidRelativeFileVersionEnumException < ServiceError
      end

      # Automerge was specified for resolving the conflict, but the replacement type is not valid or content
      # is missing.

      class InvalidReplacementContentException < ServiceError
      end

      # Automerge was specified for resolving the conflict, but the specified replacement type is not valid.

      class InvalidReplacementTypeException < ServiceError
      end

      # The specified repository description is not valid.

      class InvalidRepositoryDescriptionException < ServiceError
      end

      # A specified repository name is not valid. This exception occurs only when a specified repository
      # name is not valid. Other exceptions occur when a required repository parameter is missing, or when a
      # specified repository does not exist.

      class InvalidRepositoryNameException < ServiceError
      end

      # One or more branch names specified for the trigger is not valid.

      class InvalidRepositoryTriggerBranchNameException < ServiceError
      end

      # The custom data provided for the trigger is not valid.

      class InvalidRepositoryTriggerCustomDataException < ServiceError
      end

      # The Amazon Resource Name (ARN) for the trigger is not valid for the specified destination. The most
      # common reason for this error is that the ARN does not meet the requirements for the service type.

      class InvalidRepositoryTriggerDestinationArnException < ServiceError
      end

      # One or more events specified for the trigger is not valid. Check to make sure that all events
      # specified match the requirements for allowed events.

      class InvalidRepositoryTriggerEventsException < ServiceError
      end

      # The name of the trigger is not valid.

      class InvalidRepositoryTriggerNameException < ServiceError
      end

      # The Amazon Web Services Region for the trigger target does not match the Amazon Web Services Region
      # for the repository. Triggers must be created in the same Amazon Web Services Region as the target
      # for the trigger.

      class InvalidRepositoryTriggerRegionException < ServiceError
      end

      # The value for the resource ARN is not valid. For more information about resources in CodeCommit, see
      # CodeCommit Resources and Operations in the CodeCommit User Guide.

      class InvalidResourceArnException < ServiceError
      end

      # The revision ID is not valid. Use GetPullRequest to determine the value.

      class InvalidRevisionIdException < ServiceError
      end

      # The SHA-256 hash signature for the rule content is not valid.

      class InvalidRuleContentSha256Exception < ServiceError
      end

      # The specified sort by value is not valid.

      class InvalidSortByException < ServiceError
      end

      # The source commit specifier is not valid. You must provide a valid branch name, tag, or full commit
      # ID.

      class InvalidSourceCommitSpecifierException < ServiceError
      end

      # The specified tag is not valid. Key names cannot be prefixed with aws:.

      class InvalidSystemTagUsageException < ServiceError
      end

      # The list of tags is not valid.

      class InvalidTagKeysListException < ServiceError
      end

      # The map of tags is not valid.

      class InvalidTagsMapException < ServiceError
      end

      # The specified target branch is not valid.

      class InvalidTargetBranchException < ServiceError
      end

      # The target for the pull request is not valid. A target must contain the full values for the
      # repository name, source branch, and destination branch for the pull request.

      class InvalidTargetException < ServiceError
      end

      # The targets for the pull request is not valid or not in a valid format. Targets are a list of target
      # objects. Each target object must contain the full values for the repository name, source branch, and
      # destination branch for a pull request.

      class InvalidTargetsException < ServiceError
      end

      # The title of the pull request is not valid. Pull request titles cannot exceed 100 characters in
      # length.

      class InvalidTitleException < ServiceError
      end

      # The pull request cannot be merged automatically into the destination branch. You must manually merge
      # the branches and resolve any conflicts.

      class ManualMergeRequiredException < ServiceError
      end

      # The number of branches for the trigger was exceeded.

      class MaximumBranchesExceededException < ServiceError
      end

      # The number of allowed conflict resolution entries was exceeded.

      class MaximumConflictResolutionEntriesExceededException < ServiceError
      end

      # The number of files to load exceeds the allowed limit.

      class MaximumFileContentToLoadExceededException < ServiceError
      end

      # The number of specified files to change as part of this commit exceeds the maximum number of files
      # that can be changed in a single commit. Consider using a Git client for these changes.

      class MaximumFileEntriesExceededException < ServiceError
      end

      # The number of items to compare between the source or destination branches and the merge base has
      # exceeded the maximum allowed.

      class MaximumItemsToCompareExceededException < ServiceError
      end

      # The number of approvals required for the approval rule exceeds the maximum number allowed.

      class MaximumNumberOfApprovalsExceededException < ServiceError
      end

      # You cannot create the pull request because the repository has too many open pull requests. The
      # maximum number of open pull requests for a repository is 1,000. Close one or more open pull
      # requests, and then try again.

      class MaximumOpenPullRequestsExceededException < ServiceError
      end

      # The maximum number of allowed repository names was exceeded. Currently, this number is 100.

      class MaximumRepositoryNamesExceededException < ServiceError
      end

      # The number of triggers allowed for the repository was exceeded.

      class MaximumRepositoryTriggersExceededException < ServiceError
      end

      # The maximum number of approval rule templates for a repository has been exceeded. You cannot
      # associate more than 25 approval rule templates with a repository.

      class MaximumRuleTemplatesAssociatedWithRepositoryException < ServiceError
      end

      # A merge option or stategy is required, and none was provided.

      class MergeOptionRequiredException < ServiceError
      end

      # More than one conflict resolution entries exists for the conflict. A conflict can have only one
      # conflict resolution entry.

      class MultipleConflictResolutionEntriesException < ServiceError
      end

      # You cannot include more than one repository in a pull request. Make sure you have specified only one
      # repository name in your request, and then try again.

      class MultipleRepositoriesInPullRequestException < ServiceError
      end

      # The user name is not valid because it has exceeded the character limit for author names.

      class NameLengthExceededException < ServiceError
      end

      # The commit cannot be created because no changes will be made to the repository as a result of this
      # commit. A commit must contain at least one change.

      class NoChangeException < ServiceError
      end

      # The maximum number of approval rule templates has been exceeded for this Amazon Web Services Region.

      class NumberOfRuleTemplatesExceededException < ServiceError
      end

      # The approval rule cannot be added. The pull request has the maximum number of approval rules
      # associated with it.

      class NumberOfRulesExceededException < ServiceError
      end

      # The requested action is not allowed.

      class OperationNotAllowedException < ServiceError
      end

      # The pull request has already had its approval rules set to override.

      class OverrideAlreadySetException < ServiceError
      end

      # An override status is required, but no value was provided. Valid values include OVERRIDE and REVOKE.

      class OverrideStatusRequiredException < ServiceError
      end

      # The parent commit ID is not valid because it does not exist. The specified parent commit ID does not
      # exist in the specified branch of the repository.

      class ParentCommitDoesNotExistException < ServiceError
      end

      # The file could not be added because the provided parent commit ID is not the current tip of the
      # specified branch. To view the full commit ID of the current head of the branch, use GetBranch .

      class ParentCommitIdOutdatedException < ServiceError
      end

      # A parent commit ID is required. To view the full commit ID of a branch in a repository, use
      # GetBranch or a Git command (for example, git pull or git log).

      class ParentCommitIdRequiredException < ServiceError
      end

      # The specified path does not exist.

      class PathDoesNotExistException < ServiceError
      end

      # The folderPath for a location cannot be null.

      class PathRequiredException < ServiceError
      end

      # The pull request status cannot be updated because it is already closed.

      class PullRequestAlreadyClosedException < ServiceError
      end

      # The pull request cannot be merged because one or more approval rules applied to the pull request
      # have conditions that have not been met.

      class PullRequestApprovalRulesNotSatisfiedException < ServiceError
      end

      # The approval cannot be applied because the user approving the pull request matches the user who
      # created the pull request. You cannot approve a pull request that you created.

      class PullRequestCannotBeApprovedByAuthorException < ServiceError
      end

      # The pull request ID could not be found. Make sure that you have specified the correct repository
      # name and pull request ID, and then try again.

      class PullRequestDoesNotExistException < ServiceError
      end

      # A pull request ID is required, but none was provided.

      class PullRequestIdRequiredException < ServiceError
      end

      # A pull request status is required, but none was provided.

      class PullRequestStatusRequiredException < ServiceError
      end

      # The commit cannot be created because one or more files specified in the commit reference both a file
      # and a folder.

      class PutFileEntryConflictException < ServiceError
      end

      # The number of reactions has been exceeded. Reactions are limited to one reaction per user for each
      # individual comment ID.

      class ReactionLimitExceededException < ServiceError
      end

      # A reaction value is required.

      class ReactionValueRequiredException < ServiceError
      end

      # The specified reference does not exist. You must provide a full commit ID.

      class ReferenceDoesNotExistException < ServiceError
      end

      # A reference name is required, but none was provided.

      class ReferenceNameRequiredException < ServiceError
      end

      # The specified reference is not a supported type.

      class ReferenceTypeNotSupportedException < ServiceError
      end

      # USE_NEW_CONTENT was specified, but no replacement content has been provided.

      class ReplacementContentRequiredException < ServiceError
      end

      # A replacement type is required.

      class ReplacementTypeRequiredException < ServiceError
      end

      # The specified repository does not exist.

      class RepositoryDoesNotExistException < ServiceError
      end

      # A repository resource limit was exceeded.

      class RepositoryLimitExceededException < ServiceError
      end

      # The specified repository name already exists.

      class RepositoryNameExistsException < ServiceError
      end

      # A repository name is required, but was not specified.

      class RepositoryNameRequiredException < ServiceError
      end

      # At least one repository name object is required, but was not specified.

      class RepositoryNamesRequiredException < ServiceError
      end

      # The repository does not contain any pull requests with that pull request ID. Use GetPullRequest to
      # verify the correct repository name for the pull request ID.

      class RepositoryNotAssociatedWithPullRequestException < ServiceError
      end

      # At least one branch name is required, but was not specified in the trigger configuration.

      class RepositoryTriggerBranchNameListRequiredException < ServiceError
      end

      # A destination ARN for the target service for the trigger is required, but was not specified.

      class RepositoryTriggerDestinationArnRequiredException < ServiceError
      end

      # At least one event for the trigger is required, but was not specified.

      class RepositoryTriggerEventsListRequiredException < ServiceError
      end

      # A name for the trigger is required, but was not specified.

      class RepositoryTriggerNameRequiredException < ServiceError
      end

      # The list of triggers for the repository is required, but was not specified.

      class RepositoryTriggersListRequiredException < ServiceError
      end

      # A valid Amazon Resource Name (ARN) for an CodeCommit resource is required. For a list of valid
      # resources in CodeCommit, see CodeCommit Resources and Operations in the CodeCommit User Guide.

      class ResourceArnRequiredException < ServiceError
      end

      # The commit cannot be created because one of the changes specifies copying or moving a .gitkeep file.

      class RestrictedSourceFileException < ServiceError
      end

      # A revision ID is required, but was not provided.

      class RevisionIdRequiredException < ServiceError
      end

      # The revision ID provided in the request does not match the current revision ID. Use GetPullRequest
      # to retrieve the current revision ID.

      class RevisionNotCurrentException < ServiceError
      end

      # The file was not added or updated because the content of the file is exactly the same as the content
      # of that file in the repository and branch that you specified.

      class SameFileContentException < ServiceError
      end

      # The commit cannot be created because one or more changes in this commit duplicate actions in the
      # same file path. For example, you cannot make the same delete request to the same file in the same
      # file path twice, or make a delete request and a move request to the same file as part of the same
      # commit.

      class SamePathRequestException < ServiceError
      end

      # The source branch and destination branch for the pull request are the same. You must specify
      # different branches for the source and destination.

      class SourceAndDestinationAreSameException < ServiceError
      end

      # The commit cannot be created because no source files or file content have been specified for the
      # commit.

      class SourceFileOrContentRequiredException < ServiceError
      end

      # A list of tag keys is required. The list cannot be empty or null.

      class TagKeysListRequiredException < ServiceError
      end

      # The tag policy is not valid.

      class TagPolicyException < ServiceError
      end

      # A map of tags is required.

      class TagsMapRequiredException < ServiceError
      end

      # A pull request target is required. It cannot be empty or null. A pull request target must contain
      # the full values for the repository name, source branch, and destination branch for the pull request.

      class TargetRequiredException < ServiceError
      end

      # An array of target objects is required. It cannot be empty or null.

      class TargetsRequiredException < ServiceError
      end

      # The tip of the source branch in the destination repository does not match the tip of the source
      # branch specified in your request. The pull request might have been updated. Make sure that you have
      # the latest changes.

      class TipOfSourceReferenceIsDifferentException < ServiceError
      end

      # The divergence between the tips of the provided commit specifiers is too great to determine whether
      # there might be any merge conflicts. Locally compare the specifiers using git diff or a diff tool.

      class TipsDivergenceExceededException < ServiceError
      end

      # A pull request title is required. It cannot be empty or null.

      class TitleRequiredException < ServiceError
      end

      # The maximum number of tags for an CodeCommit resource has been exceeded.

      class TooManyTagsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ActorDoesNotExistException"
          ActorDoesNotExistException.new(message)
        when "ApprovalRuleContentRequiredException"
          ApprovalRuleContentRequiredException.new(message)
        when "ApprovalRuleDoesNotExistException"
          ApprovalRuleDoesNotExistException.new(message)
        when "ApprovalRuleNameAlreadyExistsException"
          ApprovalRuleNameAlreadyExistsException.new(message)
        when "ApprovalRuleNameRequiredException"
          ApprovalRuleNameRequiredException.new(message)
        when "ApprovalRuleTemplateContentRequiredException"
          ApprovalRuleTemplateContentRequiredException.new(message)
        when "ApprovalRuleTemplateDoesNotExistException"
          ApprovalRuleTemplateDoesNotExistException.new(message)
        when "ApprovalRuleTemplateInUseException"
          ApprovalRuleTemplateInUseException.new(message)
        when "ApprovalRuleTemplateNameAlreadyExistsException"
          ApprovalRuleTemplateNameAlreadyExistsException.new(message)
        when "ApprovalRuleTemplateNameRequiredException"
          ApprovalRuleTemplateNameRequiredException.new(message)
        when "ApprovalStateRequiredException"
          ApprovalStateRequiredException.new(message)
        when "AuthorDoesNotExistException"
          AuthorDoesNotExistException.new(message)
        when "BeforeCommitIdAndAfterCommitIdAreSameException"
          BeforeCommitIdAndAfterCommitIdAreSameException.new(message)
        when "BlobIdDoesNotExistException"
          BlobIdDoesNotExistException.new(message)
        when "BlobIdRequiredException"
          BlobIdRequiredException.new(message)
        when "BranchDoesNotExistException"
          BranchDoesNotExistException.new(message)
        when "BranchNameExistsException"
          BranchNameExistsException.new(message)
        when "BranchNameIsTagNameException"
          BranchNameIsTagNameException.new(message)
        when "BranchNameRequiredException"
          BranchNameRequiredException.new(message)
        when "CannotDeleteApprovalRuleFromTemplateException"
          CannotDeleteApprovalRuleFromTemplateException.new(message)
        when "CannotModifyApprovalRuleFromTemplateException"
          CannotModifyApprovalRuleFromTemplateException.new(message)
        when "ClientRequestTokenRequiredException"
          ClientRequestTokenRequiredException.new(message)
        when "CommentContentRequiredException"
          CommentContentRequiredException.new(message)
        when "CommentContentSizeLimitExceededException"
          CommentContentSizeLimitExceededException.new(message)
        when "CommentDeletedException"
          CommentDeletedException.new(message)
        when "CommentDoesNotExistException"
          CommentDoesNotExistException.new(message)
        when "CommentIdRequiredException"
          CommentIdRequiredException.new(message)
        when "CommentNotCreatedByCallerException"
          CommentNotCreatedByCallerException.new(message)
        when "CommitDoesNotExistException"
          CommitDoesNotExistException.new(message)
        when "CommitIdDoesNotExistException"
          CommitIdDoesNotExistException.new(message)
        when "CommitIdRequiredException"
          CommitIdRequiredException.new(message)
        when "CommitIdsLimitExceededException"
          CommitIdsLimitExceededException.new(message)
        when "CommitIdsListRequiredException"
          CommitIdsListRequiredException.new(message)
        when "CommitMessageLengthExceededException"
          CommitMessageLengthExceededException.new(message)
        when "CommitRequiredException"
          CommitRequiredException.new(message)
        when "ConcurrentReferenceUpdateException"
          ConcurrentReferenceUpdateException.new(message)
        when "DefaultBranchCannotBeDeletedException"
          DefaultBranchCannotBeDeletedException.new(message)
        when "DirectoryNameConflictsWithFileNameException"
          DirectoryNameConflictsWithFileNameException.new(message)
        when "EncryptionIntegrityChecksFailedException"
          EncryptionIntegrityChecksFailedException.new(message)
        when "EncryptionKeyAccessDeniedException"
          EncryptionKeyAccessDeniedException.new(message)
        when "EncryptionKeyDisabledException"
          EncryptionKeyDisabledException.new(message)
        when "EncryptionKeyInvalidIdException"
          EncryptionKeyInvalidIdException.new(message)
        when "EncryptionKeyInvalidUsageException"
          EncryptionKeyInvalidUsageException.new(message)
        when "EncryptionKeyNotFoundException"
          EncryptionKeyNotFoundException.new(message)
        when "EncryptionKeyRequiredException"
          EncryptionKeyRequiredException.new(message)
        when "EncryptionKeyUnavailableException"
          EncryptionKeyUnavailableException.new(message)
        when "FileContentAndSourceFileSpecifiedException"
          FileContentAndSourceFileSpecifiedException.new(message)
        when "FileContentRequiredException"
          FileContentRequiredException.new(message)
        when "FileContentSizeLimitExceededException"
          FileContentSizeLimitExceededException.new(message)
        when "FileDoesNotExistException"
          FileDoesNotExistException.new(message)
        when "FileEntryRequiredException"
          FileEntryRequiredException.new(message)
        when "FileModeRequiredException"
          FileModeRequiredException.new(message)
        when "FileNameConflictsWithDirectoryNameException"
          FileNameConflictsWithDirectoryNameException.new(message)
        when "FilePathConflictsWithSubmodulePathException"
          FilePathConflictsWithSubmodulePathException.new(message)
        when "FileTooLargeException"
          FileTooLargeException.new(message)
        when "FolderContentSizeLimitExceededException"
          FolderContentSizeLimitExceededException.new(message)
        when "FolderDoesNotExistException"
          FolderDoesNotExistException.new(message)
        when "IdempotencyParameterMismatchException"
          IdempotencyParameterMismatchException.new(message)
        when "InvalidActorArnException"
          InvalidActorArnException.new(message)
        when "InvalidApprovalRuleContentException"
          InvalidApprovalRuleContentException.new(message)
        when "InvalidApprovalRuleNameException"
          InvalidApprovalRuleNameException.new(message)
        when "InvalidApprovalRuleTemplateContentException"
          InvalidApprovalRuleTemplateContentException.new(message)
        when "InvalidApprovalRuleTemplateDescriptionException"
          InvalidApprovalRuleTemplateDescriptionException.new(message)
        when "InvalidApprovalRuleTemplateNameException"
          InvalidApprovalRuleTemplateNameException.new(message)
        when "InvalidApprovalStateException"
          InvalidApprovalStateException.new(message)
        when "InvalidAuthorArnException"
          InvalidAuthorArnException.new(message)
        when "InvalidBlobIdException"
          InvalidBlobIdException.new(message)
        when "InvalidBranchNameException"
          InvalidBranchNameException.new(message)
        when "InvalidClientRequestTokenException"
          InvalidClientRequestTokenException.new(message)
        when "InvalidCommentIdException"
          InvalidCommentIdException.new(message)
        when "InvalidCommitException"
          InvalidCommitException.new(message)
        when "InvalidCommitIdException"
          InvalidCommitIdException.new(message)
        when "InvalidConflictDetailLevelException"
          InvalidConflictDetailLevelException.new(message)
        when "InvalidConflictResolutionException"
          InvalidConflictResolutionException.new(message)
        when "InvalidConflictResolutionStrategyException"
          InvalidConflictResolutionStrategyException.new(message)
        when "InvalidContinuationTokenException"
          InvalidContinuationTokenException.new(message)
        when "InvalidDeletionParameterException"
          InvalidDeletionParameterException.new(message)
        when "InvalidDescriptionException"
          InvalidDescriptionException.new(message)
        when "InvalidDestinationCommitSpecifierException"
          InvalidDestinationCommitSpecifierException.new(message)
        when "InvalidEmailException"
          InvalidEmailException.new(message)
        when "InvalidFileLocationException"
          InvalidFileLocationException.new(message)
        when "InvalidFileModeException"
          InvalidFileModeException.new(message)
        when "InvalidFilePositionException"
          InvalidFilePositionException.new(message)
        when "InvalidMaxConflictFilesException"
          InvalidMaxConflictFilesException.new(message)
        when "InvalidMaxMergeHunksException"
          InvalidMaxMergeHunksException.new(message)
        when "InvalidMaxResultsException"
          InvalidMaxResultsException.new(message)
        when "InvalidMergeOptionException"
          InvalidMergeOptionException.new(message)
        when "InvalidOrderException"
          InvalidOrderException.new(message)
        when "InvalidOverrideStatusException"
          InvalidOverrideStatusException.new(message)
        when "InvalidParentCommitIdException"
          InvalidParentCommitIdException.new(message)
        when "InvalidPathException"
          InvalidPathException.new(message)
        when "InvalidPullRequestEventTypeException"
          InvalidPullRequestEventTypeException.new(message)
        when "InvalidPullRequestIdException"
          InvalidPullRequestIdException.new(message)
        when "InvalidPullRequestStatusException"
          InvalidPullRequestStatusException.new(message)
        when "InvalidPullRequestStatusUpdateException"
          InvalidPullRequestStatusUpdateException.new(message)
        when "InvalidReactionUserArnException"
          InvalidReactionUserArnException.new(message)
        when "InvalidReactionValueException"
          InvalidReactionValueException.new(message)
        when "InvalidReferenceNameException"
          InvalidReferenceNameException.new(message)
        when "InvalidRelativeFileVersionEnumException"
          InvalidRelativeFileVersionEnumException.new(message)
        when "InvalidReplacementContentException"
          InvalidReplacementContentException.new(message)
        when "InvalidReplacementTypeException"
          InvalidReplacementTypeException.new(message)
        when "InvalidRepositoryDescriptionException"
          InvalidRepositoryDescriptionException.new(message)
        when "InvalidRepositoryNameException"
          InvalidRepositoryNameException.new(message)
        when "InvalidRepositoryTriggerBranchNameException"
          InvalidRepositoryTriggerBranchNameException.new(message)
        when "InvalidRepositoryTriggerCustomDataException"
          InvalidRepositoryTriggerCustomDataException.new(message)
        when "InvalidRepositoryTriggerDestinationArnException"
          InvalidRepositoryTriggerDestinationArnException.new(message)
        when "InvalidRepositoryTriggerEventsException"
          InvalidRepositoryTriggerEventsException.new(message)
        when "InvalidRepositoryTriggerNameException"
          InvalidRepositoryTriggerNameException.new(message)
        when "InvalidRepositoryTriggerRegionException"
          InvalidRepositoryTriggerRegionException.new(message)
        when "InvalidResourceArnException"
          InvalidResourceArnException.new(message)
        when "InvalidRevisionIdException"
          InvalidRevisionIdException.new(message)
        when "InvalidRuleContentSha256Exception"
          InvalidRuleContentSha256Exception.new(message)
        when "InvalidSortByException"
          InvalidSortByException.new(message)
        when "InvalidSourceCommitSpecifierException"
          InvalidSourceCommitSpecifierException.new(message)
        when "InvalidSystemTagUsageException"
          InvalidSystemTagUsageException.new(message)
        when "InvalidTagKeysListException"
          InvalidTagKeysListException.new(message)
        when "InvalidTagsMapException"
          InvalidTagsMapException.new(message)
        when "InvalidTargetBranchException"
          InvalidTargetBranchException.new(message)
        when "InvalidTargetException"
          InvalidTargetException.new(message)
        when "InvalidTargetsException"
          InvalidTargetsException.new(message)
        when "InvalidTitleException"
          InvalidTitleException.new(message)
        when "ManualMergeRequiredException"
          ManualMergeRequiredException.new(message)
        when "MaximumBranchesExceededException"
          MaximumBranchesExceededException.new(message)
        when "MaximumConflictResolutionEntriesExceededException"
          MaximumConflictResolutionEntriesExceededException.new(message)
        when "MaximumFileContentToLoadExceededException"
          MaximumFileContentToLoadExceededException.new(message)
        when "MaximumFileEntriesExceededException"
          MaximumFileEntriesExceededException.new(message)
        when "MaximumItemsToCompareExceededException"
          MaximumItemsToCompareExceededException.new(message)
        when "MaximumNumberOfApprovalsExceededException"
          MaximumNumberOfApprovalsExceededException.new(message)
        when "MaximumOpenPullRequestsExceededException"
          MaximumOpenPullRequestsExceededException.new(message)
        when "MaximumRepositoryNamesExceededException"
          MaximumRepositoryNamesExceededException.new(message)
        when "MaximumRepositoryTriggersExceededException"
          MaximumRepositoryTriggersExceededException.new(message)
        when "MaximumRuleTemplatesAssociatedWithRepositoryException"
          MaximumRuleTemplatesAssociatedWithRepositoryException.new(message)
        when "MergeOptionRequiredException"
          MergeOptionRequiredException.new(message)
        when "MultipleConflictResolutionEntriesException"
          MultipleConflictResolutionEntriesException.new(message)
        when "MultipleRepositoriesInPullRequestException"
          MultipleRepositoriesInPullRequestException.new(message)
        when "NameLengthExceededException"
          NameLengthExceededException.new(message)
        when "NoChangeException"
          NoChangeException.new(message)
        when "NumberOfRuleTemplatesExceededException"
          NumberOfRuleTemplatesExceededException.new(message)
        when "NumberOfRulesExceededException"
          NumberOfRulesExceededException.new(message)
        when "OperationNotAllowedException"
          OperationNotAllowedException.new(message)
        when "OverrideAlreadySetException"
          OverrideAlreadySetException.new(message)
        when "OverrideStatusRequiredException"
          OverrideStatusRequiredException.new(message)
        when "ParentCommitDoesNotExistException"
          ParentCommitDoesNotExistException.new(message)
        when "ParentCommitIdOutdatedException"
          ParentCommitIdOutdatedException.new(message)
        when "ParentCommitIdRequiredException"
          ParentCommitIdRequiredException.new(message)
        when "PathDoesNotExistException"
          PathDoesNotExistException.new(message)
        when "PathRequiredException"
          PathRequiredException.new(message)
        when "PullRequestAlreadyClosedException"
          PullRequestAlreadyClosedException.new(message)
        when "PullRequestApprovalRulesNotSatisfiedException"
          PullRequestApprovalRulesNotSatisfiedException.new(message)
        when "PullRequestCannotBeApprovedByAuthorException"
          PullRequestCannotBeApprovedByAuthorException.new(message)
        when "PullRequestDoesNotExistException"
          PullRequestDoesNotExistException.new(message)
        when "PullRequestIdRequiredException"
          PullRequestIdRequiredException.new(message)
        when "PullRequestStatusRequiredException"
          PullRequestStatusRequiredException.new(message)
        when "PutFileEntryConflictException"
          PutFileEntryConflictException.new(message)
        when "ReactionLimitExceededException"
          ReactionLimitExceededException.new(message)
        when "ReactionValueRequiredException"
          ReactionValueRequiredException.new(message)
        when "ReferenceDoesNotExistException"
          ReferenceDoesNotExistException.new(message)
        when "ReferenceNameRequiredException"
          ReferenceNameRequiredException.new(message)
        when "ReferenceTypeNotSupportedException"
          ReferenceTypeNotSupportedException.new(message)
        when "ReplacementContentRequiredException"
          ReplacementContentRequiredException.new(message)
        when "ReplacementTypeRequiredException"
          ReplacementTypeRequiredException.new(message)
        when "RepositoryDoesNotExistException"
          RepositoryDoesNotExistException.new(message)
        when "RepositoryLimitExceededException"
          RepositoryLimitExceededException.new(message)
        when "RepositoryNameExistsException"
          RepositoryNameExistsException.new(message)
        when "RepositoryNameRequiredException"
          RepositoryNameRequiredException.new(message)
        when "RepositoryNamesRequiredException"
          RepositoryNamesRequiredException.new(message)
        when "RepositoryNotAssociatedWithPullRequestException"
          RepositoryNotAssociatedWithPullRequestException.new(message)
        when "RepositoryTriggerBranchNameListRequiredException"
          RepositoryTriggerBranchNameListRequiredException.new(message)
        when "RepositoryTriggerDestinationArnRequiredException"
          RepositoryTriggerDestinationArnRequiredException.new(message)
        when "RepositoryTriggerEventsListRequiredException"
          RepositoryTriggerEventsListRequiredException.new(message)
        when "RepositoryTriggerNameRequiredException"
          RepositoryTriggerNameRequiredException.new(message)
        when "RepositoryTriggersListRequiredException"
          RepositoryTriggersListRequiredException.new(message)
        when "ResourceArnRequiredException"
          ResourceArnRequiredException.new(message)
        when "RestrictedSourceFileException"
          RestrictedSourceFileException.new(message)
        when "RevisionIdRequiredException"
          RevisionIdRequiredException.new(message)
        when "RevisionNotCurrentException"
          RevisionNotCurrentException.new(message)
        when "SameFileContentException"
          SameFileContentException.new(message)
        when "SamePathRequestException"
          SamePathRequestException.new(message)
        when "SourceAndDestinationAreSameException"
          SourceAndDestinationAreSameException.new(message)
        when "SourceFileOrContentRequiredException"
          SourceFileOrContentRequiredException.new(message)
        when "TagKeysListRequiredException"
          TagKeysListRequiredException.new(message)
        when "TagPolicyException"
          TagPolicyException.new(message)
        when "TagsMapRequiredException"
          TagsMapRequiredException.new(message)
        when "TargetRequiredException"
          TargetRequiredException.new(message)
        when "TargetsRequiredException"
          TargetsRequiredException.new(message)
        when "TipOfSourceReferenceIsDifferentException"
          TipOfSourceReferenceIsDifferentException.new(message)
        when "TipsDivergenceExceededException"
          TipsDivergenceExceededException.new(message)
        when "TitleRequiredException"
          TitleRequiredException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
