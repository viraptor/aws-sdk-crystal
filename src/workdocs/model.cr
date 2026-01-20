module Aws
  module WorkDocs
    module Model
      API_VERSION = "2016-05-01"
      TARGET_PREFIX = ""
      SIGNING_NAME = "workdocs"
      ENDPOINT_PREFIX = "workdocs"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://workdocs-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://workdocs-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://workdocs.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://workdocs.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ABORT_DOCUMENT_VERSION_UPLOAD = OperationModel.new(
        name: "AbortDocumentVersionUpload",
        http_method: "DELETE",
        request_uri: "/api/v1/documents/{DocumentId}/versions/{VersionId}"
      )

      ACTIVATE_USER = OperationModel.new(
        name: "ActivateUser",
        http_method: "POST",
        request_uri: "/api/v1/users/{UserId}/activation"
      )

      ADD_RESOURCE_PERMISSIONS = OperationModel.new(
        name: "AddResourcePermissions",
        http_method: "POST",
        request_uri: "/api/v1/resources/{ResourceId}/permissions"
      )

      CREATE_COMMENT = OperationModel.new(
        name: "CreateComment",
        http_method: "POST",
        request_uri: "/api/v1/documents/{DocumentId}/versions/{VersionId}/comment"
      )

      CREATE_CUSTOM_METADATA = OperationModel.new(
        name: "CreateCustomMetadata",
        http_method: "PUT",
        request_uri: "/api/v1/resources/{ResourceId}/customMetadata"
      )

      CREATE_FOLDER = OperationModel.new(
        name: "CreateFolder",
        http_method: "POST",
        request_uri: "/api/v1/folders"
      )

      CREATE_LABELS = OperationModel.new(
        name: "CreateLabels",
        http_method: "PUT",
        request_uri: "/api/v1/resources/{ResourceId}/labels"
      )

      CREATE_NOTIFICATION_SUBSCRIPTION = OperationModel.new(
        name: "CreateNotificationSubscription",
        http_method: "POST",
        request_uri: "/api/v1/organizations/{OrganizationId}/subscriptions"
      )

      CREATE_USER = OperationModel.new(
        name: "CreateUser",
        http_method: "POST",
        request_uri: "/api/v1/users"
      )

      DEACTIVATE_USER = OperationModel.new(
        name: "DeactivateUser",
        http_method: "DELETE",
        request_uri: "/api/v1/users/{UserId}/activation"
      )

      DELETE_COMMENT = OperationModel.new(
        name: "DeleteComment",
        http_method: "DELETE",
        request_uri: "/api/v1/documents/{DocumentId}/versions/{VersionId}/comment/{CommentId}"
      )

      DELETE_CUSTOM_METADATA = OperationModel.new(
        name: "DeleteCustomMetadata",
        http_method: "DELETE",
        request_uri: "/api/v1/resources/{ResourceId}/customMetadata"
      )

      DELETE_DOCUMENT = OperationModel.new(
        name: "DeleteDocument",
        http_method: "DELETE",
        request_uri: "/api/v1/documents/{DocumentId}"
      )

      DELETE_DOCUMENT_VERSION = OperationModel.new(
        name: "DeleteDocumentVersion",
        http_method: "DELETE",
        request_uri: "/api/v1/documentVersions/{DocumentId}/versions/{VersionId}"
      )

      DELETE_FOLDER = OperationModel.new(
        name: "DeleteFolder",
        http_method: "DELETE",
        request_uri: "/api/v1/folders/{FolderId}"
      )

      DELETE_FOLDER_CONTENTS = OperationModel.new(
        name: "DeleteFolderContents",
        http_method: "DELETE",
        request_uri: "/api/v1/folders/{FolderId}/contents"
      )

      DELETE_LABELS = OperationModel.new(
        name: "DeleteLabels",
        http_method: "DELETE",
        request_uri: "/api/v1/resources/{ResourceId}/labels"
      )

      DELETE_NOTIFICATION_SUBSCRIPTION = OperationModel.new(
        name: "DeleteNotificationSubscription",
        http_method: "DELETE",
        request_uri: "/api/v1/organizations/{OrganizationId}/subscriptions/{SubscriptionId}"
      )

      DELETE_USER = OperationModel.new(
        name: "DeleteUser",
        http_method: "DELETE",
        request_uri: "/api/v1/users/{UserId}"
      )

      DESCRIBE_ACTIVITIES = OperationModel.new(
        name: "DescribeActivities",
        http_method: "GET",
        request_uri: "/api/v1/activities"
      )

      DESCRIBE_COMMENTS = OperationModel.new(
        name: "DescribeComments",
        http_method: "GET",
        request_uri: "/api/v1/documents/{DocumentId}/versions/{VersionId}/comments"
      )

      DESCRIBE_DOCUMENT_VERSIONS = OperationModel.new(
        name: "DescribeDocumentVersions",
        http_method: "GET",
        request_uri: "/api/v1/documents/{DocumentId}/versions"
      )

      DESCRIBE_FOLDER_CONTENTS = OperationModel.new(
        name: "DescribeFolderContents",
        http_method: "GET",
        request_uri: "/api/v1/folders/{FolderId}/contents"
      )

      DESCRIBE_GROUPS = OperationModel.new(
        name: "DescribeGroups",
        http_method: "GET",
        request_uri: "/api/v1/groups"
      )

      DESCRIBE_NOTIFICATION_SUBSCRIPTIONS = OperationModel.new(
        name: "DescribeNotificationSubscriptions",
        http_method: "GET",
        request_uri: "/api/v1/organizations/{OrganizationId}/subscriptions"
      )

      DESCRIBE_RESOURCE_PERMISSIONS = OperationModel.new(
        name: "DescribeResourcePermissions",
        http_method: "GET",
        request_uri: "/api/v1/resources/{ResourceId}/permissions"
      )

      DESCRIBE_ROOT_FOLDERS = OperationModel.new(
        name: "DescribeRootFolders",
        http_method: "GET",
        request_uri: "/api/v1/me/root"
      )

      DESCRIBE_USERS = OperationModel.new(
        name: "DescribeUsers",
        http_method: "GET",
        request_uri: "/api/v1/users"
      )

      GET_CURRENT_USER = OperationModel.new(
        name: "GetCurrentUser",
        http_method: "GET",
        request_uri: "/api/v1/me"
      )

      GET_DOCUMENT = OperationModel.new(
        name: "GetDocument",
        http_method: "GET",
        request_uri: "/api/v1/documents/{DocumentId}"
      )

      GET_DOCUMENT_PATH = OperationModel.new(
        name: "GetDocumentPath",
        http_method: "GET",
        request_uri: "/api/v1/documents/{DocumentId}/path"
      )

      GET_DOCUMENT_VERSION = OperationModel.new(
        name: "GetDocumentVersion",
        http_method: "GET",
        request_uri: "/api/v1/documents/{DocumentId}/versions/{VersionId}"
      )

      GET_FOLDER = OperationModel.new(
        name: "GetFolder",
        http_method: "GET",
        request_uri: "/api/v1/folders/{FolderId}"
      )

      GET_FOLDER_PATH = OperationModel.new(
        name: "GetFolderPath",
        http_method: "GET",
        request_uri: "/api/v1/folders/{FolderId}/path"
      )

      GET_RESOURCES = OperationModel.new(
        name: "GetResources",
        http_method: "GET",
        request_uri: "/api/v1/resources"
      )

      INITIATE_DOCUMENT_VERSION_UPLOAD = OperationModel.new(
        name: "InitiateDocumentVersionUpload",
        http_method: "POST",
        request_uri: "/api/v1/documents"
      )

      REMOVE_ALL_RESOURCE_PERMISSIONS = OperationModel.new(
        name: "RemoveAllResourcePermissions",
        http_method: "DELETE",
        request_uri: "/api/v1/resources/{ResourceId}/permissions"
      )

      REMOVE_RESOURCE_PERMISSION = OperationModel.new(
        name: "RemoveResourcePermission",
        http_method: "DELETE",
        request_uri: "/api/v1/resources/{ResourceId}/permissions/{PrincipalId}"
      )

      RESTORE_DOCUMENT_VERSIONS = OperationModel.new(
        name: "RestoreDocumentVersions",
        http_method: "POST",
        request_uri: "/api/v1/documentVersions/restore/{DocumentId}"
      )

      SEARCH_RESOURCES = OperationModel.new(
        name: "SearchResources",
        http_method: "POST",
        request_uri: "/api/v1/search"
      )

      UPDATE_DOCUMENT = OperationModel.new(
        name: "UpdateDocument",
        http_method: "PATCH",
        request_uri: "/api/v1/documents/{DocumentId}"
      )

      UPDATE_DOCUMENT_VERSION = OperationModel.new(
        name: "UpdateDocumentVersion",
        http_method: "PATCH",
        request_uri: "/api/v1/documents/{DocumentId}/versions/{VersionId}"
      )

      UPDATE_FOLDER = OperationModel.new(
        name: "UpdateFolder",
        http_method: "PATCH",
        request_uri: "/api/v1/folders/{FolderId}"
      )

      UPDATE_USER = OperationModel.new(
        name: "UpdateUser",
        http_method: "PATCH",
        request_uri: "/api/v1/users/{UserId}"
      )
    end
  end
end
