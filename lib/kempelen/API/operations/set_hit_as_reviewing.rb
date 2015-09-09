module Kempelen
  module API
    module Operations
      class SetHitAsReviewing < HitOperation
        attr_accessor :revert

        AWS_OPERATION_NAME = "SetHITAsReviewing".freeze
        AWS_RESPONSE_OBJECT = "SetHITAsReviewingResponse".freeze

        def initialize(client, hit_id, revert = false)
          super(client, hit_id)

          @operation_name = AWS_OPERATION_NAME
          @response_object = AWS_RESPONSE_OBJECT
          @revert = revert
        end

        def create_parameters
          @parameters[:revert] = @revert

          super 
        end

        def perform_operation
          create_request_string

          super

          Kempelen::API::Responses::EmptyResponse.new(@raw_response)
        end
      end
    end
  end
end
