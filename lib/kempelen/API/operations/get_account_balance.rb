module Kempelen
  module API
    module Operations
      class GetAccountBalance < Base
        AWS_OPERATION_NAME = "GetAccountBalance".freeze
        AWS_RESPONSE_OBJECT = "GetAccountBalanceResponse".freeze

        def initialize(client)
          super(client)

          @response_object = AWS_RESPONSE_OBJECT
        end

        def create_parameters
          @parameters[:operation] = AWS_OPERATION_NAME

          super 
        end

        def perform_operation
          create_request_string

          super

          Kempelen::API::Responses::AccountBalanceResponse.new(@raw_response)
        end
      end
    end
  end
end
