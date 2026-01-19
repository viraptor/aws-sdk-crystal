module AwsSdk
  module DataBrew
    module Model
      API_VERSION = "2017-07-25"
      TARGET_PREFIX = ""
      SIGNING_NAME = "databrew"
      ENDPOINT_PREFIX = "databrew"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://databrew-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"us-gov-west-1"]}],"endpoint":{"url":"https://databrew.us-gov-west-1.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://databrew-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://databrew.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://databrew.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_DELETE_RECIPE_VERSION = OperationModel.new(
        name: "BatchDeleteRecipeVersion",
        http_method: "POST",
        request_uri: "/recipes/{name}/batchDeleteRecipeVersion"
      )

      CREATE_DATASET = OperationModel.new(
        name: "CreateDataset",
        http_method: "POST",
        request_uri: "/datasets"
      )

      CREATE_PROFILE_JOB = OperationModel.new(
        name: "CreateProfileJob",
        http_method: "POST",
        request_uri: "/profileJobs"
      )

      CREATE_PROJECT = OperationModel.new(
        name: "CreateProject",
        http_method: "POST",
        request_uri: "/projects"
      )

      CREATE_RECIPE = OperationModel.new(
        name: "CreateRecipe",
        http_method: "POST",
        request_uri: "/recipes"
      )

      CREATE_RECIPE_JOB = OperationModel.new(
        name: "CreateRecipeJob",
        http_method: "POST",
        request_uri: "/recipeJobs"
      )

      CREATE_RULESET = OperationModel.new(
        name: "CreateRuleset",
        http_method: "POST",
        request_uri: "/rulesets"
      )

      CREATE_SCHEDULE = OperationModel.new(
        name: "CreateSchedule",
        http_method: "POST",
        request_uri: "/schedules"
      )

      DELETE_DATASET = OperationModel.new(
        name: "DeleteDataset",
        http_method: "DELETE",
        request_uri: "/datasets/{name}"
      )

      DELETE_JOB = OperationModel.new(
        name: "DeleteJob",
        http_method: "DELETE",
        request_uri: "/jobs/{name}"
      )

      DELETE_PROJECT = OperationModel.new(
        name: "DeleteProject",
        http_method: "DELETE",
        request_uri: "/projects/{name}"
      )

      DELETE_RECIPE_VERSION = OperationModel.new(
        name: "DeleteRecipeVersion",
        http_method: "DELETE",
        request_uri: "/recipes/{name}/recipeVersion/{recipeVersion}"
      )

      DELETE_RULESET = OperationModel.new(
        name: "DeleteRuleset",
        http_method: "DELETE",
        request_uri: "/rulesets/{name}"
      )

      DELETE_SCHEDULE = OperationModel.new(
        name: "DeleteSchedule",
        http_method: "DELETE",
        request_uri: "/schedules/{name}"
      )

      DESCRIBE_DATASET = OperationModel.new(
        name: "DescribeDataset",
        http_method: "GET",
        request_uri: "/datasets/{name}"
      )

      DESCRIBE_JOB = OperationModel.new(
        name: "DescribeJob",
        http_method: "GET",
        request_uri: "/jobs/{name}"
      )

      DESCRIBE_JOB_RUN = OperationModel.new(
        name: "DescribeJobRun",
        http_method: "GET",
        request_uri: "/jobs/{name}/jobRun/{runId}"
      )

      DESCRIBE_PROJECT = OperationModel.new(
        name: "DescribeProject",
        http_method: "GET",
        request_uri: "/projects/{name}"
      )

      DESCRIBE_RECIPE = OperationModel.new(
        name: "DescribeRecipe",
        http_method: "GET",
        request_uri: "/recipes/{name}"
      )

      DESCRIBE_RULESET = OperationModel.new(
        name: "DescribeRuleset",
        http_method: "GET",
        request_uri: "/rulesets/{name}"
      )

      DESCRIBE_SCHEDULE = OperationModel.new(
        name: "DescribeSchedule",
        http_method: "GET",
        request_uri: "/schedules/{name}"
      )

      LIST_DATASETS = OperationModel.new(
        name: "ListDatasets",
        http_method: "GET",
        request_uri: "/datasets"
      )

      LIST_JOB_RUNS = OperationModel.new(
        name: "ListJobRuns",
        http_method: "GET",
        request_uri: "/jobs/{name}/jobRuns"
      )

      LIST_JOBS = OperationModel.new(
        name: "ListJobs",
        http_method: "GET",
        request_uri: "/jobs"
      )

      LIST_PROJECTS = OperationModel.new(
        name: "ListProjects",
        http_method: "GET",
        request_uri: "/projects"
      )

      LIST_RECIPE_VERSIONS = OperationModel.new(
        name: "ListRecipeVersions",
        http_method: "GET",
        request_uri: "/recipeVersions"
      )

      LIST_RECIPES = OperationModel.new(
        name: "ListRecipes",
        http_method: "GET",
        request_uri: "/recipes"
      )

      LIST_RULESETS = OperationModel.new(
        name: "ListRulesets",
        http_method: "GET",
        request_uri: "/rulesets"
      )

      LIST_SCHEDULES = OperationModel.new(
        name: "ListSchedules",
        http_method: "GET",
        request_uri: "/schedules"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      PUBLISH_RECIPE = OperationModel.new(
        name: "PublishRecipe",
        http_method: "POST",
        request_uri: "/recipes/{name}/publishRecipe"
      )

      SEND_PROJECT_SESSION_ACTION = OperationModel.new(
        name: "SendProjectSessionAction",
        http_method: "PUT",
        request_uri: "/projects/{name}/sendProjectSessionAction"
      )

      START_JOB_RUN = OperationModel.new(
        name: "StartJobRun",
        http_method: "POST",
        request_uri: "/jobs/{name}/startJobRun"
      )

      START_PROJECT_SESSION = OperationModel.new(
        name: "StartProjectSession",
        http_method: "PUT",
        request_uri: "/projects/{name}/startProjectSession"
      )

      STOP_JOB_RUN = OperationModel.new(
        name: "StopJobRun",
        http_method: "POST",
        request_uri: "/jobs/{name}/jobRun/{runId}/stopJobRun"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{ResourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{ResourceArn}"
      )

      UPDATE_DATASET = OperationModel.new(
        name: "UpdateDataset",
        http_method: "PUT",
        request_uri: "/datasets/{name}"
      )

      UPDATE_PROFILE_JOB = OperationModel.new(
        name: "UpdateProfileJob",
        http_method: "PUT",
        request_uri: "/profileJobs/{name}"
      )

      UPDATE_PROJECT = OperationModel.new(
        name: "UpdateProject",
        http_method: "PUT",
        request_uri: "/projects/{name}"
      )

      UPDATE_RECIPE = OperationModel.new(
        name: "UpdateRecipe",
        http_method: "PUT",
        request_uri: "/recipes/{name}"
      )

      UPDATE_RECIPE_JOB = OperationModel.new(
        name: "UpdateRecipeJob",
        http_method: "PUT",
        request_uri: "/recipeJobs/{name}"
      )

      UPDATE_RULESET = OperationModel.new(
        name: "UpdateRuleset",
        http_method: "PUT",
        request_uri: "/rulesets/{name}"
      )

      UPDATE_SCHEDULE = OperationModel.new(
        name: "UpdateSchedule",
        http_method: "PUT",
        request_uri: "/schedules/{name}"
      )
    end
  end
end
