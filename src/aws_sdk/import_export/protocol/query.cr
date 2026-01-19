require "uri"
require "xml"

module AwsSdk
  module ImportExport
    module Protocol
      struct Request
        getter method : String
        getter uri : String
        getter headers : Hash(String, String)
        getter body : String?

        def initialize(@method : String, @uri : String, @headers : Hash(String, String), @body : String?)
        end
      end

      struct Response
        getter status : Int32
        getter headers : Hash(String, String)
        getter body : String?

        def initialize(@status : Int32, @headers : Hash(String, String), @body : String?)
        end
      end

      module Query
        CONTENT_TYPE = "application/x-www-form-urlencoded; charset=utf-8"

        def self.build_request(operation : Model::OperationModel, input, endpoint : String) : Request
          raise ArgumentError.new("endpoint must not be empty") if endpoint.empty?
          raise ArgumentError.new("unsupported operation: #{operation.name}") unless supported_operation?(operation.name)

          params = URI::Params.new
          params.add("Action", operation.name)
          params.add("Version", Model::API_VERSION)

          case operation.name
          when "CancelJob"
            unless input.is_a?(Types::CancelJobInput)
              raise ArgumentError.new("input must be CancelJobInput")
            end
            params.add("JobId", input.job_id)
            add_optional(params, "APIVersion", input.api_version)
          when "CreateJob"
            unless input.is_a?(Types::CreateJobInput)
              raise ArgumentError.new("input must be CreateJobInput")
            end
            params.add("JobType", input.job_type)
            params.add("Manifest", input.manifest)
            params.add("ValidateOnly", input.validate_only ? "true" : "false")
            add_optional(params, "ManifestAddendum", input.manifest_addendum)
            add_optional(params, "APIVersion", input.api_version)
          when "GetShippingLabel"
            unless input.is_a?(Types::GetShippingLabelInput)
              raise ArgumentError.new("input must be GetShippingLabelInput")
            end
            input.job_ids.each_with_index do |job_id, index|
              params.add("jobIds.member.#{index + 1}", job_id)
            end
            add_optional(params, "name", input.name)
            add_optional(params, "company", input.company)
            add_optional(params, "phoneNumber", input.phone_number)
            add_optional(params, "country", input.country)
            add_optional(params, "stateOrProvince", input.state_or_province)
            add_optional(params, "city", input.city)
            add_optional(params, "postalCode", input.postal_code)
            add_optional(params, "street1", input.street1)
            add_optional(params, "street2", input.street2)
            add_optional(params, "street3", input.street3)
            add_optional(params, "APIVersion", input.api_version)
          when "GetStatus"
            unless input.is_a?(Types::GetStatusInput)
              raise ArgumentError.new("input must be GetStatusInput")
            end
            params.add("JobId", input.job_id)
            add_optional(params, "APIVersion", input.api_version)
          when "ListJobs"
            unless input.is_a?(Types::ListJobsInput)
              raise ArgumentError.new("input must be ListJobsInput")
            end
            add_optional(params, "MaxJobs", input.max_jobs)
            add_optional(params, "Marker", input.marker)
            add_optional(params, "APIVersion", input.api_version)
          when "UpdateJob"
            unless input.is_a?(Types::UpdateJobInput)
              raise ArgumentError.new("input must be UpdateJobInput")
            end
            params.add("JobId", input.job_id)
            params.add("Manifest", input.manifest)
            params.add("JobType", input.job_type)
            params.add("ValidateOnly", input.validate_only ? "true" : "false")
            add_optional(params, "APIVersion", input.api_version)
          else
            raise ArgumentError.new("unsupported operation: #{operation.name}")
          end

          uri = endpoint.rstrip("/") + "/"
          headers = {"content-type" => CONTENT_TYPE}
          Request.new("POST", uri, headers, params.to_s)
        end

        def self.parse_error(response : Response) : Exception
          error_type = error_type_from_body(response.body)
          message = error_message_from_body(response.body)

          case error_type
          when "BucketPermissionException"
            Errors::BucketPermissionException.new(message)
          when "CanceledJobIdException"
            Errors::CanceledJobIdException.new(message)
          when "CreateJobQuotaExceededException"
            Errors::CreateJobQuotaExceededException.new(message)
          when "ExpiredJobIdException"
            Errors::ExpiredJobIdException.new(message)
          when "InvalidAccessKeyIdException"
            Errors::InvalidAccessKeyIdException.new(message)
          when "InvalidAddressException"
            Errors::InvalidAddressException.new(message)
          when "InvalidCustomsException"
            Errors::InvalidCustomsException.new(message)
          when "InvalidFileSystemException"
            Errors::InvalidFileSystemException.new(message)
          when "InvalidJobIdException"
            Errors::InvalidJobIdException.new(message)
          when "InvalidManifestFieldException"
            Errors::InvalidManifestFieldException.new(message)
          when "InvalidParameterException"
            Errors::InvalidParameterException.new(message)
          when "InvalidVersionException"
            Errors::InvalidVersionException.new(message)
          when "MalformedManifestException"
            Errors::MalformedManifestException.new(message)
          when "MissingCustomsException"
            Errors::MissingCustomsException.new(message)
          when "MissingManifestFieldException"
            Errors::MissingManifestFieldException.new(message)
          when "MissingParameterException"
            Errors::MissingParameterException.new(message)
          when "MultipleRegionsException"
            Errors::MultipleRegionsException.new(message)
          when "NoSuchBucketException"
            Errors::NoSuchBucketException.new(message)
          when "UnableToCancelJobIdException"
            Errors::UnableToCancelJobIdException.new(message)
          when "UnableToUpdateJobIdException"
            Errors::UnableToUpdateJobIdException.new(message)
          else
            Errors::ServiceError.new(message || "Unknown error")
          end
        end

        private def self.add_optional(params : URI::Params, key : String, value : String?) : Nil
          return unless value
          params.add(key, value)
        end

        private def self.add_optional(params : URI::Params, key : String, value : Int32?) : Nil
          return unless value
          params.add(key, value.to_s)
        end

        private def self.supported_operation?(name : String) : Bool
          name == "CancelJob" || name == "CreateJob" || name == "GetShippingLabel" ||
            name == "GetStatus" || name == "ListJobs" || name == "UpdateJob"
        end

        private def self.error_type_from_body(body : String?) : String?
          return nil unless body
          document = XML.parse(body)
          node = document.xpath_node("//Error/Code")
          node.try(&.content)
        rescue XML::Error
          nil
        end

        private def self.error_message_from_body(body : String?) : String?
          return nil unless body
          document = XML.parse(body)
          node = document.xpath_node("//Error/Message")
          node.try(&.content)
        rescue XML::Error
          nil
        end
      end
    end
  end
end
