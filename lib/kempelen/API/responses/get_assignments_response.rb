module Kempelen
  module API
    module Responses
      class GetAssignmentsResponse < Base
        attr_accessor :number_of_results
        attr_accessor :page_number
        attr_accessor :total_number_of_results
        attr_accessor :assignment

        def initialize(response)
          super()

          load_from_response(response)
        end

        def load_from_response(response)
          super(response)

          result = response["GetAssignmentsForHITResult"]
          unless result.nil?
            @number_of_results = result["NumResults"].to_i
            @page_number = result["PageNumber"].to_i
            @total_number_of_results = result["TotalNumResults"].to_i

            @assignment = Kempelen::API::Common::Assignment.create_from_response(result["Assignment"])
          end
        end
      end
    end
  end
end
