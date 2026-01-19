require "json"
require "time"

module AwsSdk
  module Route53Profiles
    module Types

      # The current account doesn't have the IAM permissions required to perform the specified operation.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct AssociateProfileRequest
        include JSON::Serializable

        # A name for the association.
        @[JSON::Field(key: "Name")]
        getter name : String

        # ID of the Profile.
        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        # The ID of the VPC.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # A list of the tag keys and values that you want to identify the Profile association.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @profile_id : String,
          @resource_id : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct AssociateProfileResponse
        include JSON::Serializable

        # The association that you just created. The association has an ID that you can use to identify it in
        # other requests, like update and delete.
        @[JSON::Field(key: "ProfileAssociation")]
        getter profile_association : Types::ProfileAssociation?

        def initialize(
          @profile_association : Types::ProfileAssociation? = nil
        )
        end
      end

      struct AssociateResourceToProfileRequest
        include JSON::Serializable

        # Name for the resource association.
        @[JSON::Field(key: "Name")]
        getter name : String

        # ID of the Profile.
        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        # Amazon resource number, ARN, of the DNS resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # If you are adding a DNS Firewall rule group, include also a priority. The priority indicates the
        # processing order for the rule groups, starting with the priority assinged the lowest value. The
        # allowed values for priority are between 100 and 9900.
        @[JSON::Field(key: "ResourceProperties")]
        getter resource_properties : String?

        def initialize(
          @name : String,
          @profile_id : String,
          @resource_arn : String,
          @resource_properties : String? = nil
        )
        end
      end

      struct AssociateResourceToProfileResponse
        include JSON::Serializable

        # Infromation about the AssociateResourceToProfile , including a status message.
        @[JSON::Field(key: "ProfileResourceAssociation")]
        getter profile_resource_association : Types::ProfileResourceAssociation?

        def initialize(
          @profile_resource_association : Types::ProfileResourceAssociation? = nil
        )
        end
      end

      # The request you submitted conflicts with an existing request.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct CreateProfileRequest
        include JSON::Serializable

        # ClientToken is an idempotency token that ensures a call to CreateProfile completes only once. You
        # choose the value to pass. For example, an issue might prevent you from getting a response from
        # CreateProfile . In this case, safely retry your call to CreateProfile by using the same
        # CreateProfile parameter value.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # A name for the Profile.
        @[JSON::Field(key: "Name")]
        getter name : String

        # A list of the tag keys and values that you want to associate with the Route 53 Profile.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_token : String,
          @name : String,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateProfileResponse
        include JSON::Serializable

        # The Profile that you just created.
        @[JSON::Field(key: "Profile")]
        getter profile : Types::Profile?

        def initialize(
          @profile : Types::Profile? = nil
        )
        end
      end

      struct DeleteProfileRequest
        include JSON::Serializable

        # The ID of the Profile that you want to delete.
        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        def initialize(
          @profile_id : String
        )
        end
      end

      struct DeleteProfileResponse
        include JSON::Serializable

        # Information about the DeleteProfile request, including the status of the request.
        @[JSON::Field(key: "Profile")]
        getter profile : Types::Profile?

        def initialize(
          @profile : Types::Profile? = nil
        )
        end
      end

      struct DisassociateProfileRequest
        include JSON::Serializable

        # ID of the Profile.
        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        # The ID of the VPC.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        def initialize(
          @profile_id : String,
          @resource_id : String
        )
        end
      end

      struct DisassociateProfileResponse
        include JSON::Serializable

        # Information about the DisassociateProfile request.
        @[JSON::Field(key: "ProfileAssociation")]
        getter profile_association : Types::ProfileAssociation?

        def initialize(
          @profile_association : Types::ProfileAssociation? = nil
        )
        end
      end

      struct DisassociateResourceFromProfileRequest
        include JSON::Serializable

        # The ID of the Profile.
        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @profile_id : String,
          @resource_arn : String
        )
        end
      end

      struct DisassociateResourceFromProfileResponse
        include JSON::Serializable

        # Information about the DisassociateResourceFromProfile request, including the status of the request.
        @[JSON::Field(key: "ProfileResourceAssociation")]
        getter profile_resource_association : Types::ProfileResourceAssociation?

        def initialize(
          @profile_resource_association : Types::ProfileResourceAssociation? = nil
        )
        end
      end

      struct GetProfileAssociationRequest
        include JSON::Serializable

        # The identifier of the association you want to get information about.
        @[JSON::Field(key: "ProfileAssociationId")]
        getter profile_association_id : String

        def initialize(
          @profile_association_id : String
        )
        end
      end

      struct GetProfileAssociationResponse
        include JSON::Serializable

        # Information about the Profile association that you specified in a GetProfileAssociation request.
        @[JSON::Field(key: "ProfileAssociation")]
        getter profile_association : Types::ProfileAssociation?

        def initialize(
          @profile_association : Types::ProfileAssociation? = nil
        )
        end
      end

      struct GetProfileRequest
        include JSON::Serializable

        # ID of the Profile.
        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        def initialize(
          @profile_id : String
        )
        end
      end

      struct GetProfileResourceAssociationRequest
        include JSON::Serializable

        # The ID of the profile resource association that you want to get information about.
        @[JSON::Field(key: "ProfileResourceAssociationId")]
        getter profile_resource_association_id : String

        def initialize(
          @profile_resource_association_id : String
        )
        end
      end

      struct GetProfileResourceAssociationResponse
        include JSON::Serializable

        # Information about the Profile resource association that you specified in a
        # GetProfileResourceAssociation request.
        @[JSON::Field(key: "ProfileResourceAssociation")]
        getter profile_resource_association : Types::ProfileResourceAssociation?

        def initialize(
          @profile_resource_association : Types::ProfileResourceAssociation? = nil
        )
        end
      end

      struct GetProfileResponse
        include JSON::Serializable

        # Information about the Profile, including the status of the Profile.
        @[JSON::Field(key: "Profile")]
        getter profile : Types::Profile?

        def initialize(
          @profile : Types::Profile? = nil
        )
        end
      end

      # An internal server error occured. Retry your request.
      struct InternalServiceErrorException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The NextToken you provided isn;t valid.
      struct InvalidNextTokenException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One or more parameters in this request are not valid.
      struct InvalidParameterException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The parameter field name for the invalid parameter exception.
        @[JSON::Field(key: "FieldName")]
        getter field_name : String?

        def initialize(
          @message : String,
          @field_name : String? = nil
        )
        end
      end

      # The request caused one or more limits to be exceeded.
      struct LimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The resource type that caused the limits to be exceeded.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct ListProfileAssociationsRequest
        include JSON::Serializable

        # The maximum number of objects that you want to return for this request. If more objects are
        # available, in the response, a NextToken value, which you can use in a subsequent call to get the
        # next batch of objects, is provided. If you don't specify a value for MaxResults , up to 100 objects
        # are returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # For the first call to this list request, omit this value. When you request a list of objects, at
        # most the number of objects specified by MaxResults is returned. If more objects are available for
        # retrieval, a NextToken value is returned in the response. To retrieve the next batch of objects, use
        # the token that was returned for the prior request in your next request.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # ID of the Profile.
        @[JSON::Field(key: "profileId")]
        getter profile_id : String?

        # ID of the VPC.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @profile_id : String? = nil,
          @resource_id : String? = nil
        )
        end
      end

      struct ListProfileAssociationsResponse
        include JSON::Serializable

        # If more than MaxResults profile associations match the specified criteria, you can submit another
        # ListProfileAssociations request to get the next group of results. In the next request, specify the
        # value of NextToken from the previous response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A complex type that containts settings information about the profile's VPC associations.
        @[JSON::Field(key: "ProfileAssociations")]
        getter profile_associations : Array(Types::ProfileAssociation)?

        def initialize(
          @next_token : String? = nil,
          @profile_associations : Array(Types::ProfileAssociation)? = nil
        )
        end
      end

      struct ListProfileResourceAssociationsRequest
        include JSON::Serializable

        # The ID of the Profile.
        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String

        # The maximum number of objects that you want to return for this request. If more objects are
        # available, in the response, a NextToken value, which you can use in a subsequent call to get the
        # next batch of objects, is provided. If you don't specify a value for MaxResults , up to 100 objects
        # are returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # For the first call to this list request, omit this value. When you request a list of objects, at
        # most the number of objects specified by MaxResults is returned. If more objects are available for
        # retrieval, a NextToken value is returned in the response. To retrieve the next batch of objects, use
        # the token that was returned for the prior request in your next request.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # ID of a resource if you want information on only one type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @profile_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct ListProfileResourceAssociationsResponse
        include JSON::Serializable

        # If more than MaxResults resource associations match the specified criteria, you can submit another
        # ListProfileResourceAssociations request to get the next group of results. In the next request,
        # specify the value of NextToken from the previous response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Information about the profile resource association that you specified in a
        # GetProfileResourceAssociation request.
        @[JSON::Field(key: "ProfileResourceAssociations")]
        getter profile_resource_associations : Array(Types::ProfileResourceAssociation)?

        def initialize(
          @next_token : String? = nil,
          @profile_resource_associations : Array(Types::ProfileResourceAssociation)? = nil
        )
        end
      end

      struct ListProfilesRequest
        include JSON::Serializable

        # The maximum number of objects that you want to return for this request. If more objects are
        # available, in the response, a NextToken value, which you can use in a subsequent call to get the
        # next batch of objects, is provided. If you don't specify a value for MaxResults , up to 100 objects
        # are returned.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # For the first call to this list request, omit this value. When you request a list of objects, at
        # most the number of objects specified by MaxResults is returned. If more objects are available for
        # retrieval, a NextToken value is returned in the response. To retrieve the next batch of objects, use
        # the token that was returned for the prior request in your next request.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListProfilesResponse
        include JSON::Serializable

        # If more than MaxResults resource associations match the specified criteria, you can submit another
        # ListProfiles request to get the next group of results. In the next request, specify the value of
        # NextToken from the previous response.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Summary information about the Profiles.
        @[JSON::Field(key: "ProfileSummaries")]
        getter profile_summaries : Array(Types::ProfileSummary)?

        def initialize(
          @next_token : String? = nil,
          @profile_summaries : Array(Types::ProfileSummary)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the resource that you want to list the tags for.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags that are associated with the resource that you specified in the ListTagsForResource
        # request.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end

      # A complex type that includes settings for a Route 53 Profile.
      struct Profile
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Profile.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The ClientToken value that was assigned when the Profile was created.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The date and time that the Profile was created, in Unix time format and Coordinated Universal Time
        # (UTC).
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # ID of the Profile.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The date and time that the Profile was modified, in Unix time format and Coordinated Universal Time
        # (UTC).
        @[JSON::Field(key: "ModificationTime")]
        getter modification_time : Time?

        # Name of the Profile.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Amazon Web Services account ID of the Profile owner.
        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        # Sharing status for the Profile.
        @[JSON::Field(key: "ShareStatus")]
        getter share_status : String?

        # The status for the Profile.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Status message that includes additiona information about the Profile.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @arn : String? = nil,
          @client_token : String? = nil,
          @creation_time : Time? = nil,
          @id : String? = nil,
          @modification_time : Time? = nil,
          @name : String? = nil,
          @owner_id : String? = nil,
          @share_status : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # An association between a Route 53 Profile and a VPC.
      struct ProfileAssociation
        include JSON::Serializable

        # The date and time that the Profile association was created, in Unix time format and Coordinated
        # Universal Time (UTC).
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # ID of the Profile association.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The date and time that the Profile association was modified, in Unix time format and Coordinated
        # Universal Time (UTC).
        @[JSON::Field(key: "ModificationTime")]
        getter modification_time : Time?

        # Name of the Profile association.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Amazon Web Services account ID of the Profile association owner.
        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        # ID of the Profile.
        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String?

        # The Amazon Resource Name (ARN) of the VPC.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # Status of the Profile association.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information about the Profile association.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @creation_time : Time? = nil,
          @id : String? = nil,
          @modification_time : Time? = nil,
          @name : String? = nil,
          @owner_id : String? = nil,
          @profile_id : String? = nil,
          @resource_id : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # The association between a Route 53 Profile and resources.
      struct ProfileResourceAssociation
        include JSON::Serializable

        # The date and time that the Profile resource association was created, in Unix time format and
        # Coordinated Universal Time (UTC).
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # ID of the Profile resource association.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # The date and time that the Profile resource association was modified, in Unix time format and
        # Coordinated Universal Time (UTC).
        @[JSON::Field(key: "ModificationTime")]
        getter modification_time : Time?

        # Name of the Profile resource association.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Amazon Web Services account ID of the Profile resource association owner.
        @[JSON::Field(key: "OwnerId")]
        getter owner_id : String?

        # Profile ID of the Profile that the resources are associated with.
        @[JSON::Field(key: "ProfileId")]
        getter profile_id : String?

        # The Amazon Resource Name (ARN) of the resource association.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # If the DNS resource is a DNS Firewall rule group, this indicates the priority.
        @[JSON::Field(key: "ResourceProperties")]
        getter resource_properties : String?

        # Resource type, such as a private hosted zone, or DNS Firewall rule group.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        # Status of the Profile resource association.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # Additional information about the Profile resource association.
        @[JSON::Field(key: "StatusMessage")]
        getter status_message : String?

        def initialize(
          @creation_time : Time? = nil,
          @id : String? = nil,
          @modification_time : Time? = nil,
          @name : String? = nil,
          @owner_id : String? = nil,
          @profile_id : String? = nil,
          @resource_arn : String? = nil,
          @resource_properties : String? = nil,
          @resource_type : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Summary information about a Route 53 Profile.
      struct ProfileSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Profile.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # ID of the Profile.
        @[JSON::Field(key: "Id")]
        getter id : String?

        # Name of the Profile.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Share status of the Profile.
        @[JSON::Field(key: "ShareStatus")]
        getter share_status : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @share_status : String? = nil
        )
        end
      end

      # The resource you are trying to associate, has already been associated.
      struct ResourceExistsException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The resource type that caused the resource exists exception.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The resource you are associating is not found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The resource type that caused the resource not found exception.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Tag for the Profile.
      struct Tag
        include JSON::Serializable

        # Key associated with the Tag .
        @[JSON::Field(key: "Key")]
        getter key : String

        # Value for the Tag.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the resource that you want to add tags to.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags that you want to add to the specified resource.
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

      # The request was throttled. Try again in a few minutes.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the resource that you want to remove tags from.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags that you want to remove to the specified resource.
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

      struct UpdateProfileResourceAssociationRequest
        include JSON::Serializable

        # ID of the resource association.
        @[JSON::Field(key: "ProfileResourceAssociationId")]
        getter profile_resource_association_id : String

        # Name of the resource association.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # If you are adding a DNS Firewall rule group, include also a priority. The priority indicates the
        # processing order for the rule groups, starting with the priority assinged the lowest value. The
        # allowed values for priority are between 100 and 9900.
        @[JSON::Field(key: "ResourceProperties")]
        getter resource_properties : String?

        def initialize(
          @profile_resource_association_id : String,
          @name : String? = nil,
          @resource_properties : String? = nil
        )
        end
      end

      struct UpdateProfileResourceAssociationResponse
        include JSON::Serializable

        # Information about the UpdateProfileResourceAssociation request, including a status message.
        @[JSON::Field(key: "ProfileResourceAssociation")]
        getter profile_resource_association : Types::ProfileResourceAssociation?

        def initialize(
          @profile_resource_association : Types::ProfileResourceAssociation? = nil
        )
        end
      end

      # You have provided an invalid command.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
