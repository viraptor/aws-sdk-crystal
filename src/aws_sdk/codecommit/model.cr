module AwsSdk
  module CodeCommit
    module Model
      API_VERSION = "2015-04-13"
      TARGET_PREFIX = "CodeCommit_20150413"
      SIGNING_NAME = "codecommit"
      ENDPOINT_PREFIX = "codecommit"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codecommit-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codecommit-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codecommit.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://codecommit.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_APPROVAL_RULE_TEMPLATE_WITH_REPOSITORY = OperationModel.new(
        name: "AssociateApprovalRuleTemplateWithRepository",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_ASSOCIATE_APPROVAL_RULE_TEMPLATE_WITH_REPOSITORIES = OperationModel.new(
        name: "BatchAssociateApprovalRuleTemplateWithRepositories",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DESCRIBE_MERGE_CONFLICTS = OperationModel.new(
        name: "BatchDescribeMergeConflicts",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_DISASSOCIATE_APPROVAL_RULE_TEMPLATE_FROM_REPOSITORIES = OperationModel.new(
        name: "BatchDisassociateApprovalRuleTemplateFromRepositories",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_COMMITS = OperationModel.new(
        name: "BatchGetCommits",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_GET_REPOSITORIES = OperationModel.new(
        name: "BatchGetRepositories",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_APPROVAL_RULE_TEMPLATE = OperationModel.new(
        name: "CreateApprovalRuleTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_BRANCH = OperationModel.new(
        name: "CreateBranch",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_COMMIT = OperationModel.new(
        name: "CreateCommit",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PULL_REQUEST = OperationModel.new(
        name: "CreatePullRequest",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PULL_REQUEST_APPROVAL_RULE = OperationModel.new(
        name: "CreatePullRequestApprovalRule",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REPOSITORY = OperationModel.new(
        name: "CreateRepository",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_UNREFERENCED_MERGE_COMMIT = OperationModel.new(
        name: "CreateUnreferencedMergeCommit",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_APPROVAL_RULE_TEMPLATE = OperationModel.new(
        name: "DeleteApprovalRuleTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_BRANCH = OperationModel.new(
        name: "DeleteBranch",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_COMMENT_CONTENT = OperationModel.new(
        name: "DeleteCommentContent",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FILE = OperationModel.new(
        name: "DeleteFile",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PULL_REQUEST_APPROVAL_RULE = OperationModel.new(
        name: "DeletePullRequestApprovalRule",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REPOSITORY = OperationModel.new(
        name: "DeleteRepository",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MERGE_CONFLICTS = OperationModel.new(
        name: "DescribeMergeConflicts",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PULL_REQUEST_EVENTS = OperationModel.new(
        name: "DescribePullRequestEvents",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_APPROVAL_RULE_TEMPLATE_FROM_REPOSITORY = OperationModel.new(
        name: "DisassociateApprovalRuleTemplateFromRepository",
        http_method: "POST",
        request_uri: "/"
      )

      EVALUATE_PULL_REQUEST_APPROVAL_RULES = OperationModel.new(
        name: "EvaluatePullRequestApprovalRules",
        http_method: "POST",
        request_uri: "/"
      )

      GET_APPROVAL_RULE_TEMPLATE = OperationModel.new(
        name: "GetApprovalRuleTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BLOB = OperationModel.new(
        name: "GetBlob",
        http_method: "POST",
        request_uri: "/"
      )

      GET_BRANCH = OperationModel.new(
        name: "GetBranch",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COMMENT = OperationModel.new(
        name: "GetComment",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COMMENT_REACTIONS = OperationModel.new(
        name: "GetCommentReactions",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COMMENTS_FOR_COMPARED_COMMIT = OperationModel.new(
        name: "GetCommentsForComparedCommit",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COMMENTS_FOR_PULL_REQUEST = OperationModel.new(
        name: "GetCommentsForPullRequest",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COMMIT = OperationModel.new(
        name: "GetCommit",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DIFFERENCES = OperationModel.new(
        name: "GetDifferences",
        http_method: "POST",
        request_uri: "/"
      )

      GET_FILE = OperationModel.new(
        name: "GetFile",
        http_method: "POST",
        request_uri: "/"
      )

      GET_FOLDER = OperationModel.new(
        name: "GetFolder",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MERGE_COMMIT = OperationModel.new(
        name: "GetMergeCommit",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MERGE_CONFLICTS = OperationModel.new(
        name: "GetMergeConflicts",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MERGE_OPTIONS = OperationModel.new(
        name: "GetMergeOptions",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PULL_REQUEST = OperationModel.new(
        name: "GetPullRequest",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PULL_REQUEST_APPROVAL_STATES = OperationModel.new(
        name: "GetPullRequestApprovalStates",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PULL_REQUEST_OVERRIDE_STATE = OperationModel.new(
        name: "GetPullRequestOverrideState",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REPOSITORY = OperationModel.new(
        name: "GetRepository",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REPOSITORY_TRIGGERS = OperationModel.new(
        name: "GetRepositoryTriggers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_APPROVAL_RULE_TEMPLATES = OperationModel.new(
        name: "ListApprovalRuleTemplates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ASSOCIATED_APPROVAL_RULE_TEMPLATES_FOR_REPOSITORY = OperationModel.new(
        name: "ListAssociatedApprovalRuleTemplatesForRepository",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_BRANCHES = OperationModel.new(
        name: "ListBranches",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_FILE_COMMIT_HISTORY = OperationModel.new(
        name: "ListFileCommitHistory",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_PULL_REQUESTS = OperationModel.new(
        name: "ListPullRequests",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REPOSITORIES = OperationModel.new(
        name: "ListRepositories",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REPOSITORIES_FOR_APPROVAL_RULE_TEMPLATE = OperationModel.new(
        name: "ListRepositoriesForApprovalRuleTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      MERGE_BRANCHES_BY_FAST_FORWARD = OperationModel.new(
        name: "MergeBranchesByFastForward",
        http_method: "POST",
        request_uri: "/"
      )

      MERGE_BRANCHES_BY_SQUASH = OperationModel.new(
        name: "MergeBranchesBySquash",
        http_method: "POST",
        request_uri: "/"
      )

      MERGE_BRANCHES_BY_THREE_WAY = OperationModel.new(
        name: "MergeBranchesByThreeWay",
        http_method: "POST",
        request_uri: "/"
      )

      MERGE_PULL_REQUEST_BY_FAST_FORWARD = OperationModel.new(
        name: "MergePullRequestByFastForward",
        http_method: "POST",
        request_uri: "/"
      )

      MERGE_PULL_REQUEST_BY_SQUASH = OperationModel.new(
        name: "MergePullRequestBySquash",
        http_method: "POST",
        request_uri: "/"
      )

      MERGE_PULL_REQUEST_BY_THREE_WAY = OperationModel.new(
        name: "MergePullRequestByThreeWay",
        http_method: "POST",
        request_uri: "/"
      )

      OVERRIDE_PULL_REQUEST_APPROVAL_RULES = OperationModel.new(
        name: "OverridePullRequestApprovalRules",
        http_method: "POST",
        request_uri: "/"
      )

      POST_COMMENT_FOR_COMPARED_COMMIT = OperationModel.new(
        name: "PostCommentForComparedCommit",
        http_method: "POST",
        request_uri: "/"
      )

      POST_COMMENT_FOR_PULL_REQUEST = OperationModel.new(
        name: "PostCommentForPullRequest",
        http_method: "POST",
        request_uri: "/"
      )

      POST_COMMENT_REPLY = OperationModel.new(
        name: "PostCommentReply",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_COMMENT_REACTION = OperationModel.new(
        name: "PutCommentReaction",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_FILE = OperationModel.new(
        name: "PutFile",
        http_method: "POST",
        request_uri: "/"
      )

      PUT_REPOSITORY_TRIGGERS = OperationModel.new(
        name: "PutRepositoryTriggers",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      TEST_REPOSITORY_TRIGGERS = OperationModel.new(
        name: "TestRepositoryTriggers",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_APPROVAL_RULE_TEMPLATE_CONTENT = OperationModel.new(
        name: "UpdateApprovalRuleTemplateContent",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_APPROVAL_RULE_TEMPLATE_DESCRIPTION = OperationModel.new(
        name: "UpdateApprovalRuleTemplateDescription",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_APPROVAL_RULE_TEMPLATE_NAME = OperationModel.new(
        name: "UpdateApprovalRuleTemplateName",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_COMMENT = OperationModel.new(
        name: "UpdateComment",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DEFAULT_BRANCH = OperationModel.new(
        name: "UpdateDefaultBranch",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PULL_REQUEST_APPROVAL_RULE_CONTENT = OperationModel.new(
        name: "UpdatePullRequestApprovalRuleContent",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PULL_REQUEST_APPROVAL_STATE = OperationModel.new(
        name: "UpdatePullRequestApprovalState",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PULL_REQUEST_DESCRIPTION = OperationModel.new(
        name: "UpdatePullRequestDescription",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PULL_REQUEST_STATUS = OperationModel.new(
        name: "UpdatePullRequestStatus",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PULL_REQUEST_TITLE = OperationModel.new(
        name: "UpdatePullRequestTitle",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_REPOSITORY_DESCRIPTION = OperationModel.new(
        name: "UpdateRepositoryDescription",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_REPOSITORY_ENCRYPTION_KEY = OperationModel.new(
        name: "UpdateRepositoryEncryptionKey",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_REPOSITORY_NAME = OperationModel.new(
        name: "UpdateRepositoryName",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
