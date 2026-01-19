module AwsSdk
  module ImportExport
    module Types
      struct CancelJobInput
        getter job_id : String
        getter api_version : String?

        def initialize(@job_id : String, @api_version : String? = nil)
          raise ArgumentError.new("job_id must not be empty") if @job_id.empty?
          if (api_version = @api_version) && api_version.empty?
            raise ArgumentError.new("api_version must not be empty")
          end
        end
      end

      struct CreateJobInput
        getter job_type : String
        getter manifest : String
        getter validate_only : Bool
        getter manifest_addendum : String?
        getter api_version : String?

        def initialize(
          @job_type : String,
          @manifest : String,
          @validate_only : Bool,
          @manifest_addendum : String? = nil,
          @api_version : String? = nil
        )
          raise ArgumentError.new("job_type must not be empty") if @job_type.empty?
          raise ArgumentError.new("manifest must not be empty") if @manifest.empty?
          if (manifest_addendum = @manifest_addendum) && manifest_addendum.empty?
            raise ArgumentError.new("manifest_addendum must not be empty")
          end
          if (api_version = @api_version) && api_version.empty?
            raise ArgumentError.new("api_version must not be empty")
          end
        end
      end

      struct GetShippingLabelInput
        getter job_ids : Array(String)
        getter name : String?
        getter company : String?
        getter phone_number : String?
        getter country : String?
        getter state_or_province : String?
        getter city : String?
        getter postal_code : String?
        getter street1 : String?
        getter street2 : String?
        getter street3 : String?
        getter api_version : String?

        def initialize(
          @job_ids : Array(String),
          @name : String? = nil,
          @company : String? = nil,
          @phone_number : String? = nil,
          @country : String? = nil,
          @state_or_province : String? = nil,
          @city : String? = nil,
          @postal_code : String? = nil,
          @street1 : String? = nil,
          @street2 : String? = nil,
          @street3 : String? = nil,
          @api_version : String? = nil
        )
          if @job_ids.empty?
            raise ArgumentError.new("job_ids must not be empty")
          end
          if @job_ids.any?(&.empty?)
            raise ArgumentError.new("job_ids must not contain empty values")
          end
          {
            "name" => @name,
            "company" => @company,
            "phone_number" => @phone_number,
            "country" => @country,
            "state_or_province" => @state_or_province,
            "city" => @city,
            "postal_code" => @postal_code,
            "street1" => @street1,
            "street2" => @street2,
            "street3" => @street3,
            "api_version" => @api_version,
          }.each do |label, value|
            if (present_value = value) && present_value.empty?
              raise ArgumentError.new("#{label} must not be empty")
            end
          end
        end
      end

      struct GetStatusInput
        getter job_id : String
        getter api_version : String?

        def initialize(@job_id : String, @api_version : String? = nil)
          raise ArgumentError.new("job_id must not be empty") if @job_id.empty?
          if (api_version = @api_version) && api_version.empty?
            raise ArgumentError.new("api_version must not be empty")
          end
        end
      end

      struct ListJobsInput
        getter max_jobs : Int32?
        getter marker : String?
        getter api_version : String?

        def initialize(@max_jobs : Int32? = nil, @marker : String? = nil, @api_version : String? = nil)
          if (max_jobs = @max_jobs) && max_jobs < 1
            raise ArgumentError.new("max_jobs must be >= 1")
          end
          if (marker = @marker) && marker.empty?
            raise ArgumentError.new("marker must not be empty")
          end
          if (api_version = @api_version) && api_version.empty?
            raise ArgumentError.new("api_version must not be empty")
          end
        end
      end

      struct UpdateJobInput
        getter job_id : String
        getter manifest : String
        getter job_type : String
        getter validate_only : Bool
        getter api_version : String?

        def initialize(
          @job_id : String,
          @manifest : String,
          @job_type : String,
          @validate_only : Bool,
          @api_version : String? = nil
        )
          raise ArgumentError.new("job_id must not be empty") if @job_id.empty?
          raise ArgumentError.new("manifest must not be empty") if @manifest.empty?
          raise ArgumentError.new("job_type must not be empty") if @job_type.empty?
          if (api_version = @api_version) && api_version.empty?
            raise ArgumentError.new("api_version must not be empty")
          end
        end
      end
    end
  end
end
