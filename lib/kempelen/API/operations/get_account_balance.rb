module Kempelen
  module API
    module Operations
      class GetAccountBalance < Base
        AWS_OPERATION_NAME = "GetAccountBalance".freeze

        def initialize(client)
          super(client)
        end

        def create_parameters
          @parameters[:operation] = AWS_OPERATION_NAME

          super 
        end
      end
    end
  end
end
