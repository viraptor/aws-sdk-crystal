module AwsSdk
  module RolesAnywhere
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

      # Creates a profile , a list of the roles that Roles Anywhere service is trusted to assume. You use
      # profiles to intersect permissions with IAM managed policies. Required permissions:
      # rolesanywhere:CreateProfile .
      def create_profile(
        name : String,
        role_arns : Array(String),
        accept_role_session_name : Bool? = nil,
        duration_seconds : Int32? = nil,
        enabled : Bool? = nil,
        managed_policy_arns : Array(String)? = nil,
        require_instance_properties : Bool? = nil,
        session_policy : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateProfileRequest.new(name: name, role_arns: role_arns, accept_role_session_name: accept_role_session_name, duration_seconds: duration_seconds, enabled: enabled, managed_policy_arns: managed_policy_arns, require_instance_properties: require_instance_properties, session_policy: session_policy, tags: tags)
        create_profile(input)
      end
      def create_profile(input : Types::CreateProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a trust anchor to establish trust between IAM Roles Anywhere and your certificate authority
      # (CA). You can define a trust anchor as a reference to an Private Certificate Authority (Private CA)
      # or by uploading a CA certificate. Your Amazon Web Services workloads can authenticate with the trust
      # anchor using certificates issued by the CA in exchange for temporary Amazon Web Services
      # credentials. Required permissions: rolesanywhere:CreateTrustAnchor .
      def create_trust_anchor(
        name : String,
        source : Types::Source,
        enabled : Bool? = nil,
        notification_settings : Array(Types::NotificationSetting)? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::CreateTrustAnchorRequest.new(name: name, source: source, enabled: enabled, notification_settings: notification_settings, tags: tags)
        create_trust_anchor(input)
      end
      def create_trust_anchor(input : Types::CreateTrustAnchorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TRUST_ANCHOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an entry from the attribute mapping rules enforced by a given profile.
      def delete_attribute_mapping(
        certificate_field : String,
        profile_id : String,
        specifiers : Array(String)? = nil
      ) : Protocol::Request
        input = Types::DeleteAttributeMappingRequest.new(certificate_field: certificate_field, profile_id: profile_id, specifiers: specifiers)
        delete_attribute_mapping(input)
      end
      def delete_attribute_mapping(input : Types::DeleteAttributeMappingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ATTRIBUTE_MAPPING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a certificate revocation list (CRL). Required permissions: rolesanywhere:DeleteCrl .
      def delete_crl(
        crl_id : String
      ) : Protocol::Request
        input = Types::ScalarCrlRequest.new(crl_id: crl_id)
        delete_crl(input)
      end
      def delete_crl(input : Types::ScalarCrlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CRL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a profile. Required permissions: rolesanywhere:DeleteProfile .
      def delete_profile(
        profile_id : String
      ) : Protocol::Request
        input = Types::ScalarProfileRequest.new(profile_id: profile_id)
        delete_profile(input)
      end
      def delete_profile(input : Types::ScalarProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a trust anchor. Required permissions: rolesanywhere:DeleteTrustAnchor .
      def delete_trust_anchor(
        trust_anchor_id : String
      ) : Protocol::Request
        input = Types::ScalarTrustAnchorRequest.new(trust_anchor_id: trust_anchor_id)
        delete_trust_anchor(input)
      end
      def delete_trust_anchor(input : Types::ScalarTrustAnchorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TRUST_ANCHOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables a certificate revocation list (CRL). Required permissions: rolesanywhere:DisableCrl .
      def disable_crl(
        crl_id : String
      ) : Protocol::Request
        input = Types::ScalarCrlRequest.new(crl_id: crl_id)
        disable_crl(input)
      end
      def disable_crl(input : Types::ScalarCrlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_CRL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables a profile. When disabled, temporary credential requests with this profile fail. Required
      # permissions: rolesanywhere:DisableProfile .
      def disable_profile(
        profile_id : String
      ) : Protocol::Request
        input = Types::ScalarProfileRequest.new(profile_id: profile_id)
        disable_profile(input)
      end
      def disable_profile(input : Types::ScalarProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disables a trust anchor. When disabled, temporary credential requests specifying this trust anchor
      # are unauthorized. Required permissions: rolesanywhere:DisableTrustAnchor .
      def disable_trust_anchor(
        trust_anchor_id : String
      ) : Protocol::Request
        input = Types::ScalarTrustAnchorRequest.new(trust_anchor_id: trust_anchor_id)
        disable_trust_anchor(input)
      end
      def disable_trust_anchor(input : Types::ScalarTrustAnchorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_TRUST_ANCHOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables a certificate revocation list (CRL). When enabled, certificates stored in the CRL are
      # unauthorized to receive session credentials. Required permissions: rolesanywhere:EnableCrl .
      def enable_crl(
        crl_id : String
      ) : Protocol::Request
        input = Types::ScalarCrlRequest.new(crl_id: crl_id)
        enable_crl(input)
      end
      def enable_crl(input : Types::ScalarCrlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_CRL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables temporary credential requests for a profile. Required permissions:
      # rolesanywhere:EnableProfile .
      def enable_profile(
        profile_id : String
      ) : Protocol::Request
        input = Types::ScalarProfileRequest.new(profile_id: profile_id)
        enable_profile(input)
      end
      def enable_profile(input : Types::ScalarProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Enables a trust anchor. When enabled, certificates in the trust anchor chain are authorized for
      # trust validation. Required permissions: rolesanywhere:EnableTrustAnchor .
      def enable_trust_anchor(
        trust_anchor_id : String
      ) : Protocol::Request
        input = Types::ScalarTrustAnchorRequest.new(trust_anchor_id: trust_anchor_id)
        enable_trust_anchor(input)
      end
      def enable_trust_anchor(input : Types::ScalarTrustAnchorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ENABLE_TRUST_ANCHOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a certificate revocation list (CRL). Required permissions: rolesanywhere:GetCrl .
      def get_crl(
        crl_id : String
      ) : Protocol::Request
        input = Types::ScalarCrlRequest.new(crl_id: crl_id)
        get_crl(input)
      end
      def get_crl(input : Types::ScalarCrlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CRL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a profile. Required permissions: rolesanywhere:GetProfile .
      def get_profile(
        profile_id : String
      ) : Protocol::Request
        input = Types::ScalarProfileRequest.new(profile_id: profile_id)
        get_profile(input)
      end
      def get_profile(input : Types::ScalarProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a subject , which associates a certificate identity with authentication attempts. The subject
      # stores auditing information such as the status of the last authentication attempt, the certificate
      # data used in the attempt, and the last time the associated identity attempted authentication.
      # Required permissions: rolesanywhere:GetSubject .
      def get_subject(
        subject_id : String
      ) : Protocol::Request
        input = Types::ScalarSubjectRequest.new(subject_id: subject_id)
        get_subject(input)
      end
      def get_subject(input : Types::ScalarSubjectRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SUBJECT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a trust anchor. Required permissions: rolesanywhere:GetTrustAnchor .
      def get_trust_anchor(
        trust_anchor_id : String
      ) : Protocol::Request
        input = Types::ScalarTrustAnchorRequest.new(trust_anchor_id: trust_anchor_id)
        get_trust_anchor(input)
      end
      def get_trust_anchor(input : Types::ScalarTrustAnchorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TRUST_ANCHOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Imports the certificate revocation list (CRL). A CRL is a list of certificates that have been
      # revoked by the issuing certificate Authority (CA).In order to be properly imported, a CRL must be in
      # PEM format. IAM Roles Anywhere validates against the CRL before issuing credentials. Required
      # permissions: rolesanywhere:ImportCrl .
      def import_crl(
        crl_data : Bytes,
        name : String,
        trust_anchor_arn : String,
        enabled : Bool? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Protocol::Request
        input = Types::ImportCrlRequest.new(crl_data: crl_data, name: name, trust_anchor_arn: trust_anchor_arn, enabled: enabled, tags: tags)
        import_crl(input)
      end
      def import_crl(input : Types::ImportCrlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::IMPORT_CRL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all certificate revocation lists (CRL) in the authenticated account and Amazon Web Services
      # Region. Required permissions: rolesanywhere:ListCrls .
      def list_crls(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListRequest.new(next_token: next_token, page_size: page_size)
        list_crls(input)
      end
      def list_crls(input : Types::ListRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CRLS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all profiles in the authenticated account and Amazon Web Services Region. Required
      # permissions: rolesanywhere:ListProfiles .
      def list_profiles(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListRequest.new(next_token: next_token, page_size: page_size)
        list_profiles(input)
      end
      def list_profiles(input : Types::ListRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROFILES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the subjects in the authenticated account and Amazon Web Services Region. Required
      # permissions: rolesanywhere:ListSubjects .
      def list_subjects(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListRequest.new(next_token: next_token, page_size: page_size)
        list_subjects(input)
      end
      def list_subjects(input : Types::ListRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SUBJECTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags attached to the resource. Required permissions: rolesanywhere:ListTagsForResource .
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

      # Lists the trust anchors in the authenticated account and Amazon Web Services Region. Required
      # permissions: rolesanywhere:ListTrustAnchors .
      def list_trust_anchors(
        next_token : String? = nil,
        page_size : Int32? = nil
      ) : Protocol::Request
        input = Types::ListRequest.new(next_token: next_token, page_size: page_size)
        list_trust_anchors(input)
      end
      def list_trust_anchors(input : Types::ListRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TRUST_ANCHORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Put an entry in the attribute mapping rules that will be enforced by a given profile. A mapping
      # specifies a certificate field and one or more specifiers that have contextual meanings.
      def put_attribute_mapping(
        certificate_field : String,
        mapping_rules : Array(Types::MappingRule),
        profile_id : String
      ) : Protocol::Request
        input = Types::PutAttributeMappingRequest.new(certificate_field: certificate_field, mapping_rules: mapping_rules, profile_id: profile_id)
        put_attribute_mapping(input)
      end
      def put_attribute_mapping(input : Types::PutAttributeMappingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ATTRIBUTE_MAPPING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attaches a list of notification settings to a trust anchor. A notification setting includes
      # information such as event name, threshold, status of the notification setting, and the channel to
      # notify. Required permissions: rolesanywhere:PutNotificationSettings .
      def put_notification_settings(
        notification_settings : Array(Types::NotificationSetting),
        trust_anchor_id : String
      ) : Protocol::Request
        input = Types::PutNotificationSettingsRequest.new(notification_settings: notification_settings, trust_anchor_id: trust_anchor_id)
        put_notification_settings(input)
      end
      def put_notification_settings(input : Types::PutNotificationSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_NOTIFICATION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Resets the custom notification setting to IAM Roles Anywhere default setting. Required permissions:
      # rolesanywhere:ResetNotificationSettings .
      def reset_notification_settings(
        notification_setting_keys : Array(Types::NotificationSettingKey),
        trust_anchor_id : String
      ) : Protocol::Request
        input = Types::ResetNotificationSettingsRequest.new(notification_setting_keys: notification_setting_keys, trust_anchor_id: trust_anchor_id)
        reset_notification_settings(input)
      end
      def reset_notification_settings(input : Types::ResetNotificationSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESET_NOTIFICATION_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attaches tags to a resource. Required permissions: rolesanywhere:TagResource .
      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes tags from the resource. Required permissions: rolesanywhere:UntagResource .
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

      # Updates the certificate revocation list (CRL). A CRL is a list of certificates that have been
      # revoked by the issuing certificate authority (CA). IAM Roles Anywhere validates against the CRL
      # before issuing credentials. Required permissions: rolesanywhere:UpdateCrl .
      def update_crl(
        crl_id : String,
        crl_data : Bytes? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateCrlRequest.new(crl_id: crl_id, crl_data: crl_data, name: name)
        update_crl(input)
      end
      def update_crl(input : Types::UpdateCrlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CRL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a profile , a list of the roles that IAM Roles Anywhere service is trusted to assume. You
      # use profiles to intersect permissions with IAM managed policies. Required permissions:
      # rolesanywhere:UpdateProfile .
      def update_profile(
        profile_id : String,
        accept_role_session_name : Bool? = nil,
        duration_seconds : Int32? = nil,
        managed_policy_arns : Array(String)? = nil,
        name : String? = nil,
        role_arns : Array(String)? = nil,
        session_policy : String? = nil
      ) : Protocol::Request
        input = Types::UpdateProfileRequest.new(profile_id: profile_id, accept_role_session_name: accept_role_session_name, duration_seconds: duration_seconds, managed_policy_arns: managed_policy_arns, name: name, role_arns: role_arns, session_policy: session_policy)
        update_profile(input)
      end
      def update_profile(input : Types::UpdateProfileRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PROFILE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a trust anchor. You establish trust between IAM Roles Anywhere and your certificate
      # authority (CA) by configuring a trust anchor. You can define a trust anchor as a reference to an
      # Private Certificate Authority (Private CA) or by uploading a CA certificate. Your Amazon Web
      # Services workloads can authenticate with the trust anchor using certificates issued by the CA in
      # exchange for temporary Amazon Web Services credentials. Required permissions:
      # rolesanywhere:UpdateTrustAnchor .
      def update_trust_anchor(
        trust_anchor_id : String,
        name : String? = nil,
        source : Types::Source? = nil
      ) : Protocol::Request
        input = Types::UpdateTrustAnchorRequest.new(trust_anchor_id: trust_anchor_id, name: name, source: source)
        update_trust_anchor(input)
      end
      def update_trust_anchor(input : Types::UpdateTrustAnchorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TRUST_ANCHOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
