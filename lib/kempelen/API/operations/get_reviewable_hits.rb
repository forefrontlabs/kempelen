module Kempelen
  module API
    module Operations
      class GetReviewableHits < Base
        attr_accessor :hit_type_id
        attr_accessor :status
        attr_accessor :page_size
        attr_accessor :page_number
        attr_accessor :sort_property
        attr_accessor :sort_direction

        AWS_OPERATION_NAME = "GetReviewableHITs"

        def initialize(client, hit_type_id)
          super(client)

          @hit_type_id = hit_type_id
          @status = :reviewable
          @page_size = 100
          @page_number = 1
          @sort_property = :enumeration
          @sort_direction = :descending
        end

        def amazon_status
          @status.to_s.capitalize
        end

        def amazon_sort_property
          @sort_property.to_s.capitalize
        end

        def amazon_sort_direction
          @sort_direction.to_s.capitalize
        end

        def create_parameters
          @parameters[:operation] = AWS_OPERATION_NAME
          @parameters[:hit_type_id] = @hit_type_id
          @parameters[:status] = amazon_status
          @parameters[:page_size] = @page_size
          @parameters[:page_number] = @page_number
          @parameters[:sort_property] = amazon_sort_property
          @parameters[:sort_direction] = amazon_sort_direction

          super
        end
      end
    end
  end
end

