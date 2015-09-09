module Kempelen
  module API
    module Operations
      class GetHit < HitOperation
        AWS_OPERATION_NAME = "GetHIT".freeze
        AWS_RESPONSE_OBJECT = "GetHITResponse".freeze

        def initialize(client, hit_id)
          super(client, hit_id)

          @operation_name = AWS_OPERATION_NAME
          @response_object = AWS_RESPONSE_OBJECT
        end

        def perform_operation
          create_request_string

          super

          Kempelen::API::Responses::HitResponse.new(@raw_response)
        end
      end
    end
  end
end
