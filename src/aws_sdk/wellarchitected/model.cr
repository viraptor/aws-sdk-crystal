module AwsSdk
  module WellArchitected
    module Model
      API_VERSION = "2020-03-31"
      TARGET_PREFIX = ""
      SIGNING_NAME = "wellarchitected"
      ENDPOINT_PREFIX = "wellarchitected"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://wellarchitected-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://wellarchitected-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://wellarchitected.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://wellarchitected.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_LENSES = OperationModel.new(
        name: "AssociateLenses",
        http_method: "PATCH",
        request_uri: "/workloads/{WorkloadId}/associateLenses"
      )

      ASSOCIATE_PROFILES = OperationModel.new(
        name: "AssociateProfiles",
        http_method: "PATCH",
        request_uri: "/workloads/{WorkloadId}/associateProfiles"
      )

      CREATE_LENS_SHARE = OperationModel.new(
        name: "CreateLensShare",
        http_method: "POST",
        request_uri: "/lenses/{LensAlias}/shares"
      )

      CREATE_LENS_VERSION = OperationModel.new(
        name: "CreateLensVersion",
        http_method: "POST",
        request_uri: "/lenses/{LensAlias}/versions"
      )

      CREATE_MILESTONE = OperationModel.new(
        name: "CreateMilestone",
        http_method: "POST",
        request_uri: "/workloads/{WorkloadId}/milestones"
      )

      CREATE_PROFILE = OperationModel.new(
        name: "CreateProfile",
        http_method: "POST",
        request_uri: "/profiles"
      )

      CREATE_PROFILE_SHARE = OperationModel.new(
        name: "CreateProfileShare",
        http_method: "POST",
        request_uri: "/profiles/{ProfileArn}/shares"
      )

      CREATE_REVIEW_TEMPLATE = OperationModel.new(
        name: "CreateReviewTemplate",
        http_method: "POST",
        request_uri: "/reviewTemplates"
      )

      CREATE_TEMPLATE_SHARE = OperationModel.new(
        name: "CreateTemplateShare",
        http_method: "POST",
        request_uri: "/templates/shares/{TemplateArn}"
      )

      CREATE_WORKLOAD = OperationModel.new(
        name: "CreateWorkload",
        http_method: "POST",
        request_uri: "/workloads"
      )

      CREATE_WORKLOAD_SHARE = OperationModel.new(
        name: "CreateWorkloadShare",
        http_method: "POST",
        request_uri: "/workloads/{WorkloadId}/shares"
      )

      DELETE_LENS = OperationModel.new(
        name: "DeleteLens",
        http_method: "DELETE",
        request_uri: "/lenses/{LensAlias}"
      )

      DELETE_LENS_SHARE = OperationModel.new(
        name: "DeleteLensShare",
        http_method: "DELETE",
        request_uri: "/lenses/{LensAlias}/shares/{ShareId}"
      )

      DELETE_PROFILE = OperationModel.new(
        name: "DeleteProfile",
        http_method: "DELETE",
        request_uri: "/profiles/{ProfileArn}"
      )

      DELETE_PROFILE_SHARE = OperationModel.new(
        name: "DeleteProfileShare",
        http_method: "DELETE",
        request_uri: "/profiles/{ProfileArn}/shares/{ShareId}"
      )

      DELETE_REVIEW_TEMPLATE = OperationModel.new(
        name: "DeleteReviewTemplate",
        http_method: "DELETE",
        request_uri: "/reviewTemplates/{TemplateArn}"
      )

      DELETE_TEMPLATE_SHARE = OperationModel.new(
        name: "DeleteTemplateShare",
        http_method: "DELETE",
        request_uri: "/templates/shares/{TemplateArn}/{ShareId}"
      )

      DELETE_WORKLOAD = OperationModel.new(
        name: "DeleteWorkload",
        http_method: "DELETE",
        request_uri: "/workloads/{WorkloadId}"
      )

      DELETE_WORKLOAD_SHARE = OperationModel.new(
        name: "DeleteWorkloadShare",
        http_method: "DELETE",
        request_uri: "/workloads/{WorkloadId}/shares/{ShareId}"
      )

      DISASSOCIATE_LENSES = OperationModel.new(
        name: "DisassociateLenses",
        http_method: "PATCH",
        request_uri: "/workloads/{WorkloadId}/disassociateLenses"
      )

      DISASSOCIATE_PROFILES = OperationModel.new(
        name: "DisassociateProfiles",
        http_method: "PATCH",
        request_uri: "/workloads/{WorkloadId}/disassociateProfiles"
      )

      EXPORT_LENS = OperationModel.new(
        name: "ExportLens",
        http_method: "GET",
        request_uri: "/lenses/{LensAlias}/export"
      )

      GET_ANSWER = OperationModel.new(
        name: "GetAnswer",
        http_method: "GET",
        request_uri: "/workloads/{WorkloadId}/lensReviews/{LensAlias}/answers/{QuestionId}"
      )

      GET_CONSOLIDATED_REPORT = OperationModel.new(
        name: "GetConsolidatedReport",
        http_method: "GET",
        request_uri: "/consolidatedReport"
      )

      GET_GLOBAL_SETTINGS = OperationModel.new(
        name: "GetGlobalSettings",
        http_method: "GET",
        request_uri: "/global-settings"
      )

      GET_LENS = OperationModel.new(
        name: "GetLens",
        http_method: "GET",
        request_uri: "/lenses/{LensAlias}"
      )

      GET_LENS_REVIEW = OperationModel.new(
        name: "GetLensReview",
        http_method: "GET",
        request_uri: "/workloads/{WorkloadId}/lensReviews/{LensAlias}"
      )

      GET_LENS_REVIEW_REPORT = OperationModel.new(
        name: "GetLensReviewReport",
        http_method: "GET",
        request_uri: "/workloads/{WorkloadId}/lensReviews/{LensAlias}/report"
      )

      GET_LENS_VERSION_DIFFERENCE = OperationModel.new(
        name: "GetLensVersionDifference",
        http_method: "GET",
        request_uri: "/lenses/{LensAlias}/versionDifference"
      )

      GET_MILESTONE = OperationModel.new(
        name: "GetMilestone",
        http_method: "GET",
        request_uri: "/workloads/{WorkloadId}/milestones/{MilestoneNumber}"
      )

      GET_PROFILE = OperationModel.new(
        name: "GetProfile",
        http_method: "GET",
        request_uri: "/profiles/{ProfileArn}"
      )

      GET_PROFILE_TEMPLATE = OperationModel.new(
        name: "GetProfileTemplate",
        http_method: "GET",
        request_uri: "/profileTemplate"
      )

      GET_REVIEW_TEMPLATE = OperationModel.new(
        name: "GetReviewTemplate",
        http_method: "GET",
        request_uri: "/reviewTemplates/{TemplateArn}"
      )

      GET_REVIEW_TEMPLATE_ANSWER = OperationModel.new(
        name: "GetReviewTemplateAnswer",
        http_method: "GET",
        request_uri: "/reviewTemplates/{TemplateArn}/lensReviews/{LensAlias}/answers/{QuestionId}"
      )

      GET_REVIEW_TEMPLATE_LENS_REVIEW = OperationModel.new(
        name: "GetReviewTemplateLensReview",
        http_method: "GET",
        request_uri: "/reviewTemplates/{TemplateArn}/lensReviews/{LensAlias}"
      )

      GET_WORKLOAD = OperationModel.new(
        name: "GetWorkload",
        http_method: "GET",
        request_uri: "/workloads/{WorkloadId}"
      )

      IMPORT_LENS = OperationModel.new(
        name: "ImportLens",
        http_method: "PUT",
        request_uri: "/importLens"
      )

      LIST_ANSWERS = OperationModel.new(
        name: "ListAnswers",
        http_method: "GET",
        request_uri: "/workloads/{WorkloadId}/lensReviews/{LensAlias}/answers"
      )

      LIST_CHECK_DETAILS = OperationModel.new(
        name: "ListCheckDetails",
        http_method: "POST",
        request_uri: "/workloads/{WorkloadId}/checks"
      )

      LIST_CHECK_SUMMARIES = OperationModel.new(
        name: "ListCheckSummaries",
        http_method: "POST",
        request_uri: "/workloads/{WorkloadId}/checkSummaries"
      )

      LIST_LENS_REVIEW_IMPROVEMENTS = OperationModel.new(
        name: "ListLensReviewImprovements",
        http_method: "GET",
        request_uri: "/workloads/{WorkloadId}/lensReviews/{LensAlias}/improvements"
      )

      LIST_LENS_REVIEWS = OperationModel.new(
        name: "ListLensReviews",
        http_method: "GET",
        request_uri: "/workloads/{WorkloadId}/lensReviews"
      )

      LIST_LENS_SHARES = OperationModel.new(
        name: "ListLensShares",
        http_method: "GET",
        request_uri: "/lenses/{LensAlias}/shares"
      )

      LIST_LENSES = OperationModel.new(
        name: "ListLenses",
        http_method: "GET",
        request_uri: "/lenses"
      )

      LIST_MILESTONES = OperationModel.new(
        name: "ListMilestones",
        http_method: "POST",
        request_uri: "/workloads/{WorkloadId}/milestonesSummaries"
      )

      LIST_NOTIFICATIONS = OperationModel.new(
        name: "ListNotifications",
        http_method: "POST",
        request_uri: "/notifications"
      )

      LIST_PROFILE_NOTIFICATIONS = OperationModel.new(
        name: "ListProfileNotifications",
        http_method: "GET",
        request_uri: "/profileNotifications/"
      )

      LIST_PROFILE_SHARES = OperationModel.new(
        name: "ListProfileShares",
        http_method: "GET",
        request_uri: "/profiles/{ProfileArn}/shares"
      )

      LIST_PROFILES = OperationModel.new(
        name: "ListProfiles",
        http_method: "GET",
        request_uri: "/profileSummaries"
      )

      LIST_REVIEW_TEMPLATE_ANSWERS = OperationModel.new(
        name: "ListReviewTemplateAnswers",
        http_method: "GET",
        request_uri: "/reviewTemplates/{TemplateArn}/lensReviews/{LensAlias}/answers"
      )

      LIST_REVIEW_TEMPLATES = OperationModel.new(
        name: "ListReviewTemplates",
        http_method: "GET",
        request_uri: "/reviewTemplates"
      )

      LIST_SHARE_INVITATIONS = OperationModel.new(
        name: "ListShareInvitations",
        http_method: "GET",
        request_uri: "/shareInvitations"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{WorkloadArn}"
      )

      LIST_TEMPLATE_SHARES = OperationModel.new(
        name: "ListTemplateShares",
        http_method: "GET",
        request_uri: "/templates/shares/{TemplateArn}"
      )

      LIST_WORKLOAD_SHARES = OperationModel.new(
        name: "ListWorkloadShares",
        http_method: "GET",
        request_uri: "/workloads/{WorkloadId}/shares"
      )

      LIST_WORKLOADS = OperationModel.new(
        name: "ListWorkloads",
        http_method: "POST",
        request_uri: "/workloadsSummaries"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{WorkloadArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{WorkloadArn}"
      )

      UPDATE_ANSWER = OperationModel.new(
        name: "UpdateAnswer",
        http_method: "PATCH",
        request_uri: "/workloads/{WorkloadId}/lensReviews/{LensAlias}/answers/{QuestionId}"
      )

      UPDATE_GLOBAL_SETTINGS = OperationModel.new(
        name: "UpdateGlobalSettings",
        http_method: "PATCH",
        request_uri: "/global-settings"
      )

      UPDATE_INTEGRATION = OperationModel.new(
        name: "UpdateIntegration",
        http_method: "POST",
        request_uri: "/workloads/{WorkloadId}/updateIntegration"
      )

      UPDATE_LENS_REVIEW = OperationModel.new(
        name: "UpdateLensReview",
        http_method: "PATCH",
        request_uri: "/workloads/{WorkloadId}/lensReviews/{LensAlias}"
      )

      UPDATE_PROFILE = OperationModel.new(
        name: "UpdateProfile",
        http_method: "PATCH",
        request_uri: "/profiles/{ProfileArn}"
      )

      UPDATE_REVIEW_TEMPLATE = OperationModel.new(
        name: "UpdateReviewTemplate",
        http_method: "PATCH",
        request_uri: "/reviewTemplates/{TemplateArn}"
      )

      UPDATE_REVIEW_TEMPLATE_ANSWER = OperationModel.new(
        name: "UpdateReviewTemplateAnswer",
        http_method: "PATCH",
        request_uri: "/reviewTemplates/{TemplateArn}/lensReviews/{LensAlias}/answers/{QuestionId}"
      )

      UPDATE_REVIEW_TEMPLATE_LENS_REVIEW = OperationModel.new(
        name: "UpdateReviewTemplateLensReview",
        http_method: "PATCH",
        request_uri: "/reviewTemplates/{TemplateArn}/lensReviews/{LensAlias}"
      )

      UPDATE_SHARE_INVITATION = OperationModel.new(
        name: "UpdateShareInvitation",
        http_method: "PATCH",
        request_uri: "/shareInvitations/{ShareInvitationId}"
      )

      UPDATE_WORKLOAD = OperationModel.new(
        name: "UpdateWorkload",
        http_method: "PATCH",
        request_uri: "/workloads/{WorkloadId}"
      )

      UPDATE_WORKLOAD_SHARE = OperationModel.new(
        name: "UpdateWorkloadShare",
        http_method: "PATCH",
        request_uri: "/workloads/{WorkloadId}/shares/{ShareId}"
      )

      UPGRADE_LENS_REVIEW = OperationModel.new(
        name: "UpgradeLensReview",
        http_method: "PUT",
        request_uri: "/workloads/{WorkloadId}/lensReviews/{LensAlias}/upgrade"
      )

      UPGRADE_PROFILE_VERSION = OperationModel.new(
        name: "UpgradeProfileVersion",
        http_method: "PUT",
        request_uri: "/workloads/{WorkloadId}/profiles/{ProfileArn}/upgrade"
      )

      UPGRADE_REVIEW_TEMPLATE_LENS_REVIEW = OperationModel.new(
        name: "UpgradeReviewTemplateLensReview",
        http_method: "PUT",
        request_uri: "/reviewTemplates/{TemplateArn}/lensReviews/{LensAlias}/upgrade"
      )
    end
  end
end
