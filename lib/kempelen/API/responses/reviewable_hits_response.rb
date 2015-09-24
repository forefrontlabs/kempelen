module Kempelen
  module API
    module Responses
      class ReviewableHitsResponse < Base
        attr_accessor :number_of_results
        attr_accessor :page_number
        attr_accessor :total_number_of_results
        attr_accessor :hits

        def initialize(response)
          super()

          @hits = []

          load_from_response(response)
        end

        def load_from_response(response)
          super(response)

          hit_response = response["GetReviewableHITsResult"]
          unless hit_response.nil?
            @number_of_results = hit_response["NumResults"].to_i
            @page_number = hit_response["PageNumber"].to_i
            @total_number_of_results = hit_response["TotalNumResults"].to_i

            hits_response = hit_response["HIT"]
            unless hits_response.nil?
              hits_response.each do |hit|
                @hits << hit["HITId"] unless hit.nil? or !hit.is_a?(Hash)
              end
            end
          end
        end
      end
    end
  end
end
