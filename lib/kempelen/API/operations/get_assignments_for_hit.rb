module Kempelen
  module API
    module Operations
      class GetAssignmentsForHit < HitOperation
        attr_accessor :assignment_status
        attr_accessor :page_size
        attr_accessor :page_number

        AWS_OPERATION_NAME = "GetAssignmentsForHIT".freeze
        AWS_RESPONSE_OBJECT = "GetAssignmentsForHITResponse".freeze
        AWS_DEFAULT_PAGE_SIZE = 10
        AWS_DEFAULT_PAGE_NUMBER = 1

        def initialize(client, hit_id)
          super(client, hit_id)

          @operation_name = AWS_OPERATION_NAME
          @response_object = AWS_RESPONSE_OBJECT
          @assignment_status = nil
          @page_size = AWS_DEFAULT_PAGE_SIZE
          @page_number = AWS_DEFAULT_PAGE_NUMBER
        end

        def create_parameters
          @parameters[:assignment_status] = @assignment_status
          @parameters[:page_size] = @page_size
          @parameters[:page_number] = @page_number

          super
        end

        def perform_operation
          create_request_string

          super

          Kempelen::API::Responses::GetAssignmentsResponse.new(@raw_response)
        end
      end
    end
  end
end
