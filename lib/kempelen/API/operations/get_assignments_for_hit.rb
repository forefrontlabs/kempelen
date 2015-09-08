module Kempelen
  module API
    module Operations
      class GetAssignmentsForHit < Base
        attr_accessor :hit_id
        attr_accessor :assignment_status
        attr_accessor :page_size
        attr_accessor :page_number

        AWS_OPERATION_NAME = "GetAssignmentsForHIT".freeze
        AWS_DEFAULT_PAGE_SIZE = 10
        AWS_DEFAULT_PAGE_NUMBER = 1

        def initialize(client, hit_id)
          super(client)

          @hit_id = hit_id
          @assignment_status = nil
          @page_size = AWS_DEFAULT_PAGE_SIZE
          @page_number = AWS_DEFAULT_PAGE_NUMBER
        end

        def create_parameters
          @parameters[:operation] = AWS_OPERATION_NAME
          @parameters[:hit_id] = @hit_id
          @parameters[:assignment_status] = @assignment_status
          @parameters[:page_size] = @page_size
          @parameters[:page_number] = @page_number

          super
        end
      end
    end
  end
end
