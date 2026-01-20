module Aws
  module NotificationsContacts
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

      # Activates an email contact using an activation code. This code is in the activation email sent to
      # the email address associated with this email contact.

      def activate_email_contact(
        arn : String,
        code : String
      ) : Protocol::Request
        input = Types::ActivateEmailContactRequest.new(arn: arn, code: code)
        activate_email_contact(input)
      end

      def activate_email_contact(input : Types::ActivateEmailContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ACTIVATE_EMAIL_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an email contact for the provided email address.

      def create_email_contact(
        email_address : String,
        name : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateEmailContactRequest.new(email_address: email_address, name: name, tags: tags)
        create_email_contact(input)
      end

      def create_email_contact(input : Types::CreateEmailContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EMAIL_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an email contact. Deleting an email contact removes it from all associated notification
      # configurations.

      def delete_email_contact(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteEmailContactRequest.new(arn: arn)
        delete_email_contact(input)
      end

      def delete_email_contact(input : Types::DeleteEmailContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EMAIL_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns an email contact.

      def get_email_contact(
        arn : String
      ) : Protocol::Request
        input = Types::GetEmailContactRequest.new(arn: arn)
        get_email_contact(input)
      end

      def get_email_contact(input : Types::GetEmailContactRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EMAIL_CONTACT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all email contacts created under the Account.

      def list_email_contacts(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEmailContactsRequest.new(max_results: max_results, next_token: next_token)
        list_email_contacts(input)
      end

      def list_email_contacts(input : Types::ListEmailContactsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EMAIL_CONTACTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the tags associated with the Amazon Resource Name (ARN) that you specify. The resource
      # can be a user, server, or role.

      def list_tags_for_resource(
        arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(arn: arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends an activation email to the email address associated with the specified email contact. It might
      # take a few minutes for the activation email to arrive. If it doesn't arrive, check in your spam
      # folder or try sending another activation email.

      def send_activation_code(
        arn : String
      ) : Protocol::Request
        input = Types::SendActivationCodeRequest.new(arn: arn)
        send_activation_code(input)
      end

      def send_activation_code(input : Types::SendActivationCodeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_ACTIVATION_CODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attaches a key-value pair to a resource, as identified by its Amazon Resource Name (ARN). Taggable
      # resources in AWS User Notifications Contacts include email contacts.

      def tag_resource(
        arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(arn: arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Detaches a key-value pair from a resource, as identified by its Amazon Resource Name (ARN). Taggable
      # resources in AWS User Notifications Contacts include email contacts..

      def untag_resource(
        arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(arn: arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
